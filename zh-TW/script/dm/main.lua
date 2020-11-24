if _G.GameConfigs == nil then
	_G.GameConfigs = {}
end

if app.args.userData == "REBOOT_NOUPDATE" then
	GameConfigs.noUpdate = true
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

trycall(require, "cocos.init")
trycall(require, "cocos.cocos2d.Cocos2d")
trycall(require, "cocos.cocos2d.Cocos2dConstants")
trycall(require, "cocos.framework.display")
trycall(function ()
	PlatformHelper = require("sdk.PlatformHelper")
end)
trycall(function ()
	local fileUtils = cc.FileUtils:getInstance()
	local writablePath = fileUtils:getWritablePath()
	local destDBFilePath = writablePath .. "gameConfig.db"
	local PATCH_FOLDER = "patch"

	if not GameConfigs or not GameConfigs.noUpdate then
		local updateDBPath = fileUtils:fullPathForFilename("gameUpdateConfig.db")

		if not fileUtils:isFileExist(destDBFilePath) then
			local srcDBFilePath = fileUtils:fullPathForFilename("gameConfig.db.zip")

			if fileUtils:isFileExist(srcDBFilePath) then
				print("*********copy db to" .. destDBFilePath)

				local writableDBZipPath = writablePath .. "gameConfig.db.zip"

				app.copyFile(srcDBFilePath, writableDBZipPath)

				if not fileUtils:isFileExist(writableDBZipPath) then
					assert(false, "copy DBFile error")
				end

				local retcode = app.unZipFileToDir(writableDBZipPath, writablePath)

				fileUtils:removeFile(writableDBZipPath)
				assert(retcode == 0, "unZip DBFile to Dir error:" .. retcode)
				print("*********copy over*********")
			end
		else
			print("*********config db existing*********")
		end

		if fileUtils:isFileExist(updateDBPath) then
			print("start merge db")
			DBReader:getInstance(true)

			local tempUpdateDBPath = writablePath .. "gameConfig_temp.db"
			local backupDBPath = writablePath .. "gameConfig_backup.db"

			if string.find(updateDBPath, writablePath .. PATCH_FOLDER) then
				if fileUtils:isFileExist(backupDBPath) then
					fileUtils:removeFile(destDBFilePath)
					app.copyFile(backupDBPath, destDBFilePath)
				else
					app.copyFile(destDBFilePath, backupDBPath)
				end
			elseif fileUtils:isFileExist(backupDBPath) then
				fileUtils:removeFile(destDBFilePath)
				fileUtils:renameFile(backupDBPath, destDBFilePath)
			end

			local errorInfo = ""

			for i = 1, 3 do
				fileUtils:removeFile(tempUpdateDBPath)
				app.copyFile(destDBFilePath, tempUpdateDBPath)

				if not fileUtils:isFileExist(tempUpdateDBPath) then
					assert(false, "copy tempUpdateDBPath error")
				end

				errorInfo = DBReader:getInstance(true):mergeDb(tempUpdateDBPath, updateDBPath)

				if #errorInfo == 0 then
					break
				end
			end

			assert(#errorInfo == 0, "mergeDb error:" .. errorInfo)
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
end)
trycall(require, "dm.init")

if cc.Application:getInstance():getTargetPlatform() ~= 2 then
	trycall(require, "sdk.SDKUtils")
end

trycall(function ()
	require("dm.assets.dmAudio")
	dmAudio.startupWithAcfFile("sound/common/MengJingLianJie.acf")

	if dmAudio and dmAudio.loadAcbFile then
		dmAudio.loadAcbFile("common/UI")
	end

	if dmAudio and dmAudio.setAcbFileIsResident then
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

local scene = nil

local function playPV(callback)
	local backgroundColor = cc.c4b(255, 255, 255, 255)
	local currentScene = scene

	if currentScene == nil then
		currentScene = cc.Scene:create()
		local director = cc.Director:getInstance()

		director:replaceScene(currentScene)
	end

	require("cocos.cocos2d.Cocos2d")
	require("dm.utils.VideoSprite")

	local size = cc.Director:getInstance():getWinSize()
	local touchLayer = ccui.Layout:create()

	touchLayer:setTouchEnabled(true)
	touchLayer:setAnchorPoint(cc.p(0.5, 0.5))
	touchLayer:setContentSize(size)
	touchLayer:setPosition(cc.p(size.width * 0.5, size.height * 0.5))

	local maskLayer = cc.LayerColor:create(cc.c4b(0, 0, 0, 255), size.width, size.height)

	currentScene:addChild(maskLayer, 999)

	local videoSprite = VideoSprite.create("video/PV1.usm")

	currentScene:addChild(videoSprite, 1000)
	videoSprite:setPosition(cc.p(size.width * 0.5, size.height * 0.5))

	local vSize = videoSprite:getContentSize()
	local videoScale = math.min(size.width / vSize.width, size.height / vSize.height)

	videoSprite:setScale(videoScale)
	currentScene:addChild(touchLayer, 1001)

	local skipBtn = ccui.Button:create("asset/common/ck_skip_btn.png", "asset/common/ck_skip_btn.png")
	local title = cc.Label:createWithTTF("跳過", "asset/font/CustomFont_FZYH_R.TTF", 24)

	title:enableOutline(cc.c4b(0, 0, 0, 204), 2)
	title:addTo(skipBtn):offset(skipBtn:getContentSize().width * 0.5, skipBtn:getContentSize().height * 0.6)

	local lineGradiantVec1 = {
		{
			ratio = 0.5,
			color = cc.c4b(255, 255, 255, 255)
		},
		{
			ratio = 1,
			color = cc.c4b(225, 231, 252, 255)
		}
	}

	title:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec1, {
		x = 0,
		y = -1
	}))
	skipBtn:setVisible(false)
	skipBtn:setPosition(cc.p(size.width - skipBtn:getContentSize().width / 2, size.height - skipBtn:getContentSize().height / 2))
	currentScene:addChild(skipBtn, 1002)

	local function callFunc(sender, eventType)
		currentScene:removeAllChildren()
		callback()
	end

	videoSprite:setListener(function (sprite, eventType, eventTag)
		if callFunc then
			local eventName = nil

			if eventType == 1 then
				eventName = "complete"
			else
				eventName = eventMap[eventTag]
			end

			callFunc(videoSprite, eventName)
		end
	end)
	skipBtn:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			callFunc(sender, eventType)
		end
	end)

	local nowTouchTime = nil

	touchLayer:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			skipBtn:setVisible(true)

			if nowTouchTime then
				local leaveTime = os.time() - nowTouchTime

				if leaveTime < 1 then
					callFunc()
				end
			end

			nowTouchTime = os.time()
		end
	end)
end

local function startGame()
	if DEBUG == 0 then
		function _G.dump()
		end

		function _G.print()
		end
	end

	initLibs()

	local function launchScene()
		local game = DmGame:new()

		game:startup()
		game:switchToScene(GAME_STARTUP_SCENE or "launchScene")
	end

	if app.args.bootTimes == 1 then
		playPV(launchScene)
	else
		launchScene()
	end
end

local function startUpdate()
	require("dm.gameupdate.GameUpdater")

	local director = cc.Director:getInstance()
	local gameUpdater = GameUpdater:new()
	local view = nil
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
			view = nil

			REBOOT()
		elseif event.type == "noUpdate" then
			if data ~= nil and data == true then
				REBOOT()
			else
				view = nil

				startGame()
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
		startGame()

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

		local logoImg = cc.Sprite:create(path)

		logoImg:setOpacity(0)
		logoImg:setPosition(cc.p(winSize.width / 2, winSize.height / 2))
		currentScene:addChild(logoImg)

		local fadeInAct = cc.FadeIn:create(0.6)
		local delayTimeAct = cc.DelayTime:create(0.6)

		local function endFunc()
			backgroundLayer:setVisible(false)
			delayCallByTime(0, function ()
				cb()
			end)
		end

		local callFuncAct1 = cc.CallFunc:create(endFunc)
		local action = cc.Sequence:create(fadeInAct, delayTimeAct, callFuncAct1)

		logoImg:runAction(action)
	end

	local logoImgPath = "asset/scene/logo_tw.jpg"
	local logoImgPath_def = "asset/scene/logo_def.jpg"

	if cc.FileUtils:getInstance():isFileExist(logoImgPath) and device.platform ~= "ios" then
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
