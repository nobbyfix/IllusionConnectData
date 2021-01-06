if _G.GameConfigs == nil then
	_G.GameConfigs = {}
end

if app.args.userData == "REBOOT_NOUPDATE" then
	GameConfigs.noUpdate = true
end

if cc.Application:getInstance():getTargetPlatform() ~= 2 then
	local pid = cc.UserDefault:getInstance():getStringForKey("playerRid")

	dpsBugTracer.setUserId(pid or "")
end

if app.reboot then
	local reboot = app.reboot
	app.reboot = nil

	function REBOOT(...)
		trycall(function ()
			if MemCacheUtils then
				MemCacheUtils:clear()
			end

			if dmAudio then
				dmAudio.destroy()
			end
		end)

		local director = cc.Director:getInstance()
		local runingScene = director:getRunningScene()

		if runingScene then
			runingScene:removeAllChildren()
		end

		director:popToRootScene()

		local winSize = director:getWinSize()
		runingScene = director:getRunningScene()

		if runingScene then
			local sprite = cc.Sprite:create("asset/scene/denglu_bg_new.jpg")

			sprite:setPosition(cc.p(52, 40))
			sprite:setPosition(cc.p(winSize.width / 2, winSize.height / 2))
			runingScene:addChild(sprite)
		end

		local param = {
			...
		}

		local function rebootAction()
			if VideoSprite then
				VideoSprite.cleanVideoSprite()
			end

			reboot(unpack(param))
			director:popToRootScene()

			local scene = cc.Scene:create()

			director:replaceScene(scene)

			local sprite = cc.Sprite:create("asset/scene/denglu_bg_new.jpg")

			sprite:setPosition(cc.p(52, 40))
			sprite:setPosition(cc.p(winSize.width / 2, winSize.height / 2))
			scene:addChild(sprite)
		end

		if runingScene then
			local delay = cc.DelayTime:create(0.016666666666666666)
			local sequence = cc.Sequence:create(delay, cc.CallFunc:create(rebootAction))

			runingScene:runAction(sequence)
		else
			rebootAction()
		end
	end
end

function cleanWriteableCache()
	local fileUtils = cc.FileUtils:getInstance()
	local writablePath = fileUtils:getWritablePath()
	local assetsDbPath = "assets.db"
	local gameConfigDbPath = "gameConfig.db"
	local extensionsDbPath = "extensions.db"
	local assetsSourceDirPath = "release"
	local patchDirPath = "patch"
	local writeableDbPath = writablePath .. assetsDbPath
	local writeableConfigDbPath = writablePath .. gameConfigDbPath
	local writeableExtensionsDbPath = writablePath .. extensionsDbPath
	local writeableSourceDirPath = writablePath .. assetsSourceDirPath
	local writeablePatchDirPath = writablePath .. patchDirPath

	fileUtils:removeFile(writeableDbPath)
	fileUtils:removeFile(writeableExtensionsDbPath)
	fileUtils:removeFile(writeableConfigDbPath)
	fileUtils:removeDirectory(writeableSourceDirPath)
	fileUtils:removeDirectory(writeablePatchDirPath)
	app.getPatchManager():switchPatch(tostring(0))
	REBOOT("cleanWriteableCache")
end

trycall(require, "cocos.init")
trycall(require, "cocos.cocos2d.Cocos2d")
trycall(require, "cocos.cocos2d.Cocos2dConstants")
trycall(require, "cocos.framework.display")
trycall(function ()
	PlatformHelper = require("sdk.PlatformHelper")
end)

UNZIP_ERRO_TYPE = {
	FIRST_INSTALL_UNZIP_BASEDB = 1
}
UNZIP_ERRO_TYPE_CODE = {
	EUnzipBadFile = 2,
	EUnzipFileNotExist = 1,
	EUnzipOutOfStorage = 3
}
UNZIP_ERRO_TYPE_MSG = {
	"The decompression file does not exist！",
	"The decompression file is damaged！",
	"There is not enough disk space. Clean up the disk space and try again！"
}
DB_DAMAGE_BROKEN = "Data corruption, please reinstall the game, or clean the game storage data and try again!"
DB_MERGE_SPACE_LIMIT = "There is not enough disk space,failed to install expansion pack. Clean up disk space and try again"
local fileUtils = cc.FileUtils:getInstance()
local writablePath = fileUtils:getWritablePath()

function unZipErro(erroType, erroCode)
	local msg = "unzip file fails"

	local function callBack()
	end

	if erroType == UNZIP_ERRO_TYPE.FIRST_INSTALL_UNZIP_BASEDB then
		function callBack()
			REBOOT()
		end

		msg = UNZIP_ERRO_TYPE_MSG[erroCode]
	end

	local updateNoticPopup = require("dm.UpdateNoticPopup")

	updateNoticPopup:alert({
		msg = msg,
		callBack = callBack
	})
end

function tryOpenBaseDb(dbPath)
	tryTable, errorinfo = DBReader:getInstance(true):getTable(dbPath, "Translate")

	return tryTable ~= nil
end

function safeCopyDb(srcDb, descDb)
	local ret = true

	if not tryOpenBaseDb(srcDb) then
		function callBack()
			REBOOT()
		end

		local updateNoticPopup = require("dm.UpdateNoticPopup")

		updateNoticPopup:alert({
			msg = DB_DAMAGE_BROKEN,
			callBack = callBack
		})

		ret = false

		print(srcDb .. "-------db 损坏")
	end

	app.copyFile(srcDb, descDb)

	if fileUtils:isFileExist(descDb) then
		if not tryOpenBaseDb(descDb) then
			print(descDb .. "-------db copy 不完整")
			unZipErro(UNZIP_ERRO_TYPE.FIRST_INSTALL_UNZIP_BASEDB, UNZIP_ERRO_TYPE_CODE.EUnzipOutOfStorage)

			ret = false
		end
	else
		print(descDb .. "-------db copy 失败")
		unZipErro(UNZIP_ERRO_TYPE.FIRST_INSTALL_UNZIP_BASEDB, UNZIP_ERRO_TYPE_CODE.EUnzipOutOfStorage)

		ret = false
	end

	return ret
end

function getFileSize(path)
	local size = false
	local file = io.open(path, "r")

	if file then
		local current = file:seek()
		size = file:seek("end")

		file:seek("set", current)
		io.close(file)
	end

	return size
end

local destDBFilePath = writablePath .. "gameConfig.db"
local PATCH_FOLDER = "patch"

if not GameConfigs or not GameConfigs.noUpdate then
	local updateDBPath = fileUtils:fullPathForFilename("gameUpdateConfig.db")

	print("updateDBPath*********", updateDBPath)
	print("destDBFilePath*********", destDBFilePath)

	if not fileUtils:isFileExist(destDBFilePath) then
		local srcDBFilePath = fileUtils:fullPathForFilename("gameConfig.db.zip")

		print("srcDBFilePath*********", srcDBFilePath)

		if fileUtils:isFileExist(srcDBFilePath) then
			print("*********copy db to" .. destDBFilePath)

			local writableDBZipPath = writablePath .. "gameConfig.db.zip"

			for i = 1, 3 do
				print("copyFile*********", srcDBFilePath, writableDBZipPath)
				app.copyFile(srcDBFilePath, writableDBZipPath)

				if fileUtils:isFileExist(writableDBZipPath) then
					fileUtils:removeFile(destDBFilePath)
					print("源文件大小---->>>>>" .. tostring(getFileSize(writableDBZipPath)))

					local retcode = app.unZipFileToDir(writableDBZipPath, writablePath)

					print("开始解压文件到", writablePath)
					fileUtils:removeFile(writableDBZipPath)

					local tryTable, errorinfo = nil

					print("解压后文件大小---->>>>>" .. tostring(getFileSize(writablePath .. "gameConfig.db")))
					print("解压结果----->>>>>>", retcode)

					if retcode == 0 then
						tryTable, errorinfo = DBReader:getInstance(true):getTable(destDBFilePath, "Translate")
					else
						fileUtils:removeFile(destDBFilePath)
						unZipErro(UNZIP_ERRO_TYPE.FIRST_INSTALL_UNZIP_BASEDB, UNZIP_ERRO_TYPE_CODE.EUnzipOutOfStorage)

						return
					end

					print("尝试读取数据库", tryTable)

					if tryTable then
						break
					elseif i == 3 then
						fileUtils:removeFile(destDBFilePath)
						unZipErro(UNZIP_ERRO_TYPE.FIRST_INSTALL_UNZIP_BASEDB, UNZIP_ERRO_TYPE_CODE.EUnzipOutOfStorage)

						return
					end
				elseif i == 3 then
					fileUtils:removeFile(destDBFilePath)
					unZipErro(UNZIP_ERRO_TYPE.FIRST_INSTALL_UNZIP_BASEDB, UNZIP_ERRO_TYPE_CODE.EUnzipOutOfStorage)

					return
				end

				fileUtils:removeFile(writableDBZipPath)
			end

			print("*********copy over*********")
		else
			assert(false, "can not find db file:" .. srcDBFilePath)
		end
	else
		print("*********config db existing*********")

		if not tryOpenBaseDb(destDBFilePath) then
			function callBack()
				REBOOT()
			end

			local updateNoticPopup = require("dm.UpdateNoticPopup")

			updateNoticPopup:alert({
				msg = DB_DAMAGE_BROKEN,
				callBack = callBack
			})
		end
	end

	print("updateDBPath*********", updateDBPath)

	if fileUtils:isFileExist(updateDBPath) then
		print("start merge db")
		DBReader:getInstance(true)

		local tempUpdateDBPath = writablePath .. "gameConfig_temp.db"
		local backupDBPath = writablePath .. "gameConfig_backup.db"

		print("tempUpdateDBPath     " .. tempUpdateDBPath)
		print("backupDBPath     " .. backupDBPath)
		print(string.find(updateDBPath, writablePath .. PATCH_FOLDER))

		if string.find(updateDBPath, writablePath .. PATCH_FOLDER) then
			if fileUtils:isFileExist(backupDBPath) then
				fileUtils:removeFile(destDBFilePath)

				if not safeCopyDb(backupDBPath, destDBFilePath) then
					return
				end

				print("应用备份db")
			else
				print("备份db")

				if not safeCopyDb(destDBFilePath, backupDBPath) then
					fileUtils:removeFile(backupDBPath)

					return
				end
			end
		elseif fileUtils:isFileExist(backupDBPath) then
			fileUtils:removeFile(destDBFilePath)
			fileUtils:renameFile(backupDBPath, destDBFilePath)
			print("应用备份db   backupDBPath")
		end

		local errorInfo = ""

		for i = 1, 3 do
			fileUtils:removeFile(tempUpdateDBPath)

			if not safeCopyDb(destDBFilePath, tempUpdateDBPath) then
				return
			end

			errorInfo = DBReader:getInstance(true):mergeDb(tempUpdateDBPath, updateDBPath)

			if #errorInfo == 0 then
				break
			end
		end

		if #errorInfo > 0 then
			unZipErro(UNZIP_ERRO_TYPE.FIRST_INSTALL_UNZIP_BASEDB, UNZIP_ERRO_TYPE_CODE.EUnzipOutOfStorage)

			return
		end

		fileUtils:removeFile(destDBFilePath)
		fileUtils:renameFile(tempUpdateDBPath, destDBFilePath)
		fileUtils:removeFile(updateDBPath)
		print("*********merge db over*********")
	end

	require("dm.gameupdate.GameExtPackUpdater")
	require("dm.gameupdate.GameExtPackUpdaterManager")
	GameExtPackUpdater.initUpdateCfg()
else
	local isFileExistWritablePath = fileUtils:isFileExist(destDBFilePath)
	local localPath = fileUtils:fullPathForFilename("gameConfig.db")
	local isFileExistLocalPath = fileUtils:isFileExist(localPath)

	if cc.Application:getInstance():getTargetPlatform() == 3 and not isFileExistWritablePath and isFileExistLocalPath then
		app.copyFile(localPath, destDBFilePath)
	end
end

trycall(require, "dm.init")

if cc.Application:getInstance():getTargetPlatform() ~= 2 then
	trycall(require, "sdk.SDKUtils")
end

trycall(function ()
	require("dm.assets.dmAudio")
	dmAudio.startupWithAcfFile("sound/Sound_Basic/MengJingLianJie.acf")

	local fileUtils = cc.FileUtils:getInstance()
	local isFileExist = fileUtils:isFileExist("asset/sound/UI.acb")

	if dmAudio and dmAudio.loadAcbFile and isFileExist then
		dmAudio.loadAcbFile("common/UI")
	end

	if dmAudio and dmAudio.setAcbFileIsResident and isFileExist then
		dmAudio.setAcbFileIsResident("common/UI", true)
	end
end)

local function initLibs()
	require("foundation.init")
	require("dm.utils.StringUtils")
	require("dragon.init")
	require("dm.lateInit")
	require("dm.DmGame")
	require("dm.EventsConfig")
end

local function startGame()
	if DEBUG == 0 then
		function _G.dump()
		end

		function _G.print()
		end
	end

	initLibs()

	local game = DmGame:new()

	game:startup()
	game:switchToScene(GAME_STARTUP_SCENE or "launchScene")
end

local unzipScene, unzipView = nil

local function unzipOBB(callback)
	require("dm.gameupdate.GameUnzip")

	local director = cc.Director:getInstance()
	local gameUnzip = GameUnzip:new()

	if gameUnzip:checkOBBFinish() then
		callback()

		return
	end

	local status, err = trycall(function ()
		unzipScene = cc.Scene:create()

		director:replaceScene(unzipScene)
		require("dm.gameupdate.view.GameUnzipMediator")

		unzipView = GameUnzipMediator:new()

		unzipScene:addChild(unzipView:getView())

		local winSize = director:getWinSize()

		unzipView:getView():setPosition(winSize.width / 2 - CC_DESIGN_RESOLUTION.width / 2, winSize.height / 2 - CC_DESIGN_RESOLUTION.height / 2)
		unzipView:enterWithData({
			delegate = gameUnzip
		})

		return unzipView
	end)

	if not status then
		unzipView = nil
	end

	gameUnzip:setCallback(function (event)
		local data = event.data
		local status, ret = nil

		if unzipView and unzipView.refresh then
			status, ret = trycall(function ()
				unzipView:refresh(event)
			end)
		end
	end)
	gameUnzip:setFinishDelegate(callback)
	gameUnzip:run()
end

local nextStepFun = nil
local playVideoOver = true
local scene, view = nil

local function startUpdate()
	require("dm.gameupdate.GameUpdater")

	if not GameConfigs or not GameConfigs.noUnzipOBB then
		require("dm.gameupdate.GameUnzip")
		GameUnzip:checkOBBFinish()
	end

	local director = cc.Director:getInstance()
	local gameUpdater = GameUpdater:new()
	local status, err = trycall(function ()
		scene = cc.Scene:create()

		director:replaceScene(scene)
		require("dm.gameupdate.view.GameUpdateMediator")

		view = GameUpdateMediator:new()

		scene:addChild(view:getView())

		local winSize = director:getWinSize()

		view:getView():setPosition(winSize.width / 2 - CC_DESIGN_RESOLUTION.width / 2, winSize.height / 2 - CC_DESIGN_RESOLUTION.height / 2)
		view:enterWithData({
			gameUpdater = gameUpdater
		})

		return view
	end)

	if not status then
		view = nil
	end

	gameUpdater:setCallback(function (event)
		local status, ret = nil

		if view and view.refreshGameUpdate then
			status, ret = trycall(function ()
				view:refreshGameUpdate(event)
			end)
		end

		local data = event.data

		if event.type == "updateFinish" then
			function nextStepFun()
				view = nil

				REBOOT()
			end

			if playVideoOver then
				local func = nextStepFun
				nextStepFun = nil

				func()
			end
		elseif event.type == "noUpdate" then
			if data ~= nil and data == true then
				REBOOT()
			else
				function nextStepFun()
					view = nil

					if GameConfigs and GameConfigs.noUnzipOBB then
						startGame()
					else
						unzipOBB(function ()
							startGame()
						end)
					end
				end

				if playVideoOver then
					local func = nextStepFun
					nextStepFun = nil

					func()
				end
			end
		elseif event.type == "ensureUpdate" then
			local netStatus = app.getDevice():getNetworkStatus()

			if netStatus == NetStatus.kWifi then
				gameUpdater:excuteUpdateCmd(event.vmsData)
			end
		end

		if not status then
			if event.type == "forceupdate" then
				app.showMessageBox("Please update the client to the newest version", "Need Update")
			elseif event.type == "ensureUpdate" then
				local netStatus = app.getDevice():getNetworkStatus()

				if netStatus == NetStatus.kWWAN then
					app.showMessageBox("Please connect to Wifi and try again!", "Need Update")
				end
			end
		end
	end)

	local function callback()
	end

	gameUpdater:run(callback)
end

local function main()
	if GameConfigs and GameConfigs.noUpdate then
		if GameConfigs and GameConfigs.noUnzipOBB then
			startGame()
		else
			unzipOBB(function ()
				startGame()
			end)
		end

		return
	end

	startUpdate()
end

local function showLogo()
	local delayCallByTime = _G.delayCallByTime or function (delayMilliseconds, func, ...)
		local callFunc = func
		local arglist = {
			n = select("#", ...),
			...
		}
		local animTickEntry = nil

		local function timeUp(time)
			if animTickEntry ~= nil then
				cc.Director:getInstance():getScheduler():unscheduleScriptEntry(animTickEntry)

				animTickEntry = nil

				if arglist ~= nil and arglist.n > 0 then
					callFunc(unpack(arglist, 1, arglist.n))
				else
					callFunc()
				end
			end
		end

		local delay = (delayMilliseconds or 0) * 0.001
		animTickEntry = cc.Director:getInstance():getScheduler():scheduleScriptFunc(timeUp, delay, false)

		return animTickEntry
	end
	local winSize = cc.Director:getInstance():getWinSize()

	local function showFuncVideo(currentScene, path, cb)
		require("dm.utils.VideoSprite")

		local video = VideoSprite.create(path, function (instance, eventName, index)
			if eventName == "complete" then
				instance:getPlayer():pause(true)
				cb()
			end
		end)

		video:addTo(currentScene)

		scale = 1
		videoSize = cc.size(winSize.width, winSize.height)
		videoPos = cc.p(585, 447)

		video:setContentSize(videoSize)
		video:setPosition(winSize.width / 2, winSize.height / 2)
	end

	local function showFuncImage(currentScene, path, cb)
		local logoImg = cc.Sprite:create(path)

		logoImg:setOpacity(0)
		logoImg:setPosition(cc.p(winSize.width / 2, winSize.height / 2))
		currentScene:addChild(logoImg)

		local fadeInAct = cc.FadeIn:create(1)
		local delayTimeAct = cc.DelayTime:create(1)

		local function endFunc()
			delayCallByTime(0, function ()
				cb()
			end)
		end

		local callFuncAct1 = cc.CallFunc:create(endFunc)
		local action = cc.Sequence:create(fadeInAct, delayTimeAct, callFuncAct1)

		logoImg:runAction(action)
	end

	local function showFunc(path, cb)
		local backgroundColor = cc.c4b(255, 255, 255, 255)
		local director = cc.Director:getInstance()
		local currentScene = cc.Scene:create()

		if director:getRunningScene() then
			director:replaceScene(currentScene)
		else
			director:runWithScene(currentScene)
		end

		local winSize = director:getWinSize()
		local backgroundLayer = cc.LayerColor:create(backgroundColor, winSize.width, winSize.height)

		currentScene:addChild(backgroundLayer)

		local suffix = string.sub(path, -3)

		if suffix == "usm" then
			showFuncVideo(currentScene, path, cb)
		else
			showFuncImage(currentScene, path, cb)
		end
	end

	local logoImgPath = "splash/sp_logo_bg.jpg"
	local platform = cc.Application:getInstance():getTargetPlatform()
	local logoImgPath_def = "asset/scene/logo_def_iOS.jpg"

	if cc.FileUtils:getInstance():isFileExist(logoImgPath) then
		showFunc(logoImgPath, function ()
			if cc.FileUtils:getInstance():isFileExist(logoImgPath_def) then
				showFunc(logoImgPath_def, function ()
					main()
				end)
			else
				main()
			end
		end)
	elseif cc.FileUtils:getInstance():isFileExist(logoImgPath_def) then
		showFunc(logoImgPath_def, function ()
			main()
		end)
	else
		main()
	end
end

local success, err = nil

if app.args.bootTimes == 1 then
	success, err = trycall(function ()
		require("cocos.cocos2d.Cocos2d")
		showLogo()
	end)
end

if not success then
	main()
end
