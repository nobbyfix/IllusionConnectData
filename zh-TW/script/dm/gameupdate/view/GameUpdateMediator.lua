trycall(function ()
	device = require("cocos.framework.device")
end)
trycall(require, "cocos.framework.extends.NodeEx")
trycall(require, "foundation.ccext.CCLayoutUtil")
trycall(require, "foundation.ccext.CCUIExtends")
trycall(require, "dm.base.waiting.WaitingView")
trycall(require, "dm.utils.AdjustUtils")
trycall(require, "dm.assets.DataReader")
trycall(require, "dm.assets.ConfigReader")

local text = {
	UPDATE_UI12 = "<outline color='#0000005A' size = '1'><font face='${fontName}' size='20' color='#ffffff'>正在玩命更新${totalByte}數據，更新完成後可獲得更新獎勵（</font></outline><outline color='#0000005A' size = '2'><font face='${fontName}' size='20' color='#FFFFFF'>更新中…</font></outline><outline color='#0000005A' size = '2'><font face='${fontName}' size='20' color='#ffffff'>${progress}）</font></outline>",
	vmsRequestError = "申請版本信息錯誤",
	UPDATE_UI21 = "正在解壓中，請耐心等待…",
	Common_button3 = "保存",
	UPDATE_UI5 = "去下載",
	downloadError = "下載錯誤",
	UPDATE_UI7 = "提示",
	notice = "遊戲公告",
	UITitle_EN_Queding = "OK",
	UPDATE_UI14 = "更新中..",
	UPDATE_UI8 = "遊戲數據異常，請點擊重新啟動遊戲~",
	forceupdate = "需要強行更新",
	UPDATE_UI17 = "最近登錄：",
	Common_button2 = "取消",
	UPDATE_UI4 = "當前遊戲版本過低，請前往應用商店下載最新版本哦~",
	UPDATE_UI11 = "<outline color='#0000005A' size = '1'><font face='${fontName}' size='18' color='#FFFFFF'>遊戲需要進行更新，更新包大小${size}，當前未連接WIFI，是否開始更新？</font></outline>",
	Common_button1 = "確定",
	downloading = "正在下載更新包",
	EQUIP_DOWNSTAR_DESC3 = "取消",
	downloadFinish = "下載更新包完成",
	UPDATE_UI20 = "本次測試為邀請測試，請使用有測試資格的賬號登錄，未獲得測試資格的玩家請關註我們的官網及論壇，感謝您的支持",
	updateFinish = "更新完成",
	UPDATE_UI23 = "<outline color='#0000005A' size = '2'><font face='${fontName}' size='20' color='#ffffff'>${content}</font></outline>",
	UITitle_EN_Quxiao = "CANCEL",
	maintain = "需要維護",
	UITitle_EN_Tishi = "TIPS",
	UITitle_EN_Gengxintishi = "UPDATE TIPS",
	LOADING_CONTENT_UPDATE = "正在更新，請喝杯茶稍等壹下……",
	UPDATE_UI1 = "連接創建失敗請重試",
	UPDATE_UI16 = "<outline color='#0000005A' size = '2'><font face='${fontName}' size='20' color='#ffffff'>更新版本：</font></outline><outline color='#0000005A' size = '2'><font face='${fontName}' size='20' color='ffae12'>v.${version}</font></outline>",
	UPDATE_UI19 = "${startIndex}區-${endIndex}區",
	UPDATE_UI10 = "<outline color='#0000005A' size = '1'><font face='${fontName}' size='18' color='#FFFFFF'>遊戲需要進行更新，更新包大小${size}，當前為WIFI連接狀態，是否開始更新？</font></outline>",
	UPDATE_UI6 = "維護提示",
	UPDATE_UI13 = "WIFI更新中...",
	ensureUpdate = "確認更新",
	UPDATE_UI22 = "解壓失敗，請點擊重新啟動遊戲~",
	UPDATE_UI9 = "<outline color='#0000005A' size = '1'><font face='${fontName}' size='18' color='#FFFFFF'>${text}</font></outline>",
	noUpdate = "不需要更新",
	UPDATE_UI3 = "當前遊戲版本過低，請前往AppStore下載最新版本哦~",
	update = "有版本更新",
	UPDATE_UI18 = "推薦服務器",
	installPackage = "正在安裝更新包",
	UPDATE_UI15 = "<outline color='#0000005A' size = '2'><font face='${fontName}' size='20' color='#ffffff'>當前版本：v.${version}</font></outline>",
	UPDATE_UI2 = "更新提示",
	patchAndSwitch = "遊戲patch和開關",
	vmsState = "vms狀態"
}

trycall(require, "dm.assets.Constants")

local Strings = {}

trycall(require, "dragon.misc.TextTemplate")

function Strings:find(key)
	return key and text[key] or tostring(key)
end

function Strings:get(id, env, filters)
	local text = self:find(id)

	if text == nil then
		return id
	end

	if env ~= nil and type(env) == "table" and TextTemplate then
		trycall(function ()
			local tmpl = TextTemplate:new(text)
			text = tmpl:stringify(env, filters)
		end)
	end

	return text
end

local UpdateGame = {
	appWillResignActive = function (self)
		print("UpdateGame")
		print("[info]", "appWillResignActive")
		trycall(function ()
			if dmAudio then
				dmAudio.pauseAll()
			end

			cri.suspendLibraryContext()
		end)
	end,
	appDidBecomeActive = function (self)
		print("UpdateGame")
		print("[info]", "appDidBecomeActive")
		trycall(function ()
			if dmAudio then
				dmAudio.resumeAll()
			end

			cri.resumeLibraryContext()
		end)
	end,
	appDidEnterBackground = function (self)
		print("UpdateGame")
		print("[info]", "appDidEnterBackground")
		trycall(function ()
			if dmAudio then
				dmAudio.pauseAll()
			end

			cri.suspendLibraryContext()
		end)
	end,
	appWillEnterForeground = function (self)
		print("UpdateGame")
		print("[info]", "appWillEnterForeground")
		trycall(function ()
			if dmAudio then
				dmAudio.resumeAll()
			end

			cri.resumeLibraryContext()
		end)
	end,
	appWillTerminate = function (self)
		print("UpdateGame")
		print("[info]", "appWillTerminate")
	end,
	didReceiveMemoryWarning = function (self)
		print("UpdateGame")
		print("[info]", "didReceiveMemoryWarning")
	end,
	resolveStringContent = function (self, strid)
		print("UpdateGame get string:", strid)

		return Strings:get(strid)
	end
}
GameUpdateMediator = GameUpdateMediator or {}
GameUpdateMediator.Strings = Strings

function GameUpdateMediator:new()
	local result = setmetatable({}, {
		__index = GameUpdateMediator
	})

	result:initialize()

	if not DmGame then
		app.setLuaAppDelegate(UpdateGame)
	end

	return result
end

local resId = "asset/ui/gameUpdateUI.csb"

function GameUpdateMediator:initialize()
	self._view = cc.CSLoader:createNode(resId)
	self._totalBytesExpected = 0
	self._pkgsDownloadData = {}
	self._effectLayer = cc.Node:create()

	self._effectLayer:setPosition(568, 320)
	self._view:addChild(self._effectLayer, 1001)
end

function GameUpdateMediator:getView()
	return self._view
end

function GameUpdateMediator:setVisible(visible)
	self._view:setVisible(visible)
end

function GameUpdateMediator:enterWithData(data)
	self:initMember()

	self._gameUpdater = data.gameUpdater
end

function GameUpdateMediator:dismiss()
	self._view:removeFromParent()
end

function GameUpdateMediator:initMember()
	self._tagText = self:getView():getChildByFullName("main.progress_tag")
	self._progressText = self:getView():getChildByFullName("main.progress_text")
	self._curVersion = self:getView():getChildByFullName("main.info_text_0")
	self._curPackVersion = self:getView():getChildByFullName("main.info_text_1_0")
	self._vmsUrl = self:getView():getChildByFullName("main.info_text_1_0_1")

	if self._curVersion and app and app.getAssetsManager then
		local curVersionCode = app:getAssetsManager():getCurrentVersion()

		self._curVersion:setString(tostring(curVersionCode))
	end

	if self._vmsUrl and self._curPackVersion and app and app.pkgConfig and app.pkgConfig.captainUrl and app.pkgConfig.packJobId then
		self._curPackVersion:setString(tostring(app.pkgConfig.packJobId))
		self._vmsUrl:setString(tostring(app.pkgConfig.captainUrl))
	end
end

function GameUpdateMediator:refreshGameUpdate(event)
	local data = event

	if data.type == "noUpdate" then
		self:launchLoading()
	elseif data.type == "forceupdate" then
		self:launchLoading()

		local content = ""

		if device.platform == "ios" then
			content = Strings:get("UPDATE_UI3")
		else
			content = Strings:get("UPDATE_UI4")
		end

		self:showAlertView({
			title = Strings:get("UPDATE_UI2"),
			title1 = Strings:get("UITitle_EN_Gengxintishi"),
			content = content,
			sureBtn = {
				btnText = Strings:get("UPDATE_UI5")
			},
			okCallback = function ()
			end
		})
		self:showForceUpdate()
	elseif data.type == "updateFinish" then
		if self._loadingWidget then
			self._loadingWidget = nil
		end

		self:dismiss()
	elseif data.type == "downloadError" then
		self:showAlertView({
			title = Strings:get("UPDATE_UI7"),
			title1 = Strings:get("UITitle_EN_Tishi"),
			content = Strings:get("UPDATE_UI8") .. "\n(" .. tostring(data.data.errorCodeInternal) .. ":" .. tostring(data.data.errorStr) .. ")",
			sureBtn = {},
			okCallback = function ()
				REBOOT()
			end
		})
	elseif data.type == "vmsRequestError" then
		self:launchLoading()

		if data.data and data.data.status == 408 or data.data and data.data.status == 0 then
			self:showAlertView({
				title = Strings:get("UPDATE_UI7"),
				title1 = Strings:get("UITitle_EN_Tishi"),
				content = Strings:get("UPDATE_UI1"),
				sureBtn = {
					btnText = Strings:get("Common_button5")
				},
				okCallback = function ()
					REBOOT()
				end
			})
		else
			self:showAlertView({
				title = Strings:get("UPDATE_UI7"),
				title1 = Strings:get("UITitle_EN_Tishi"),
				content = Strings:get("UPDATE_UI8"),
				sureBtn = {},
				okCallback = function ()
					REBOOT()
				end
			})
		end
	elseif data.type == "maintain" then
		self:launchLoading()
		self:showAlertView({
			title = Strings:get("UPDATE_UI6"),
			title1 = Strings:get("UITitle_EN_Tishi"),
			content = data.notice,
			sureBtn = {},
			okCallback = function ()
				REBOOT()
			end
		})
	elseif data.type == "ensureUpdate" then
		self:launchLoading()

		local netStatus = app.getDevice():getNetworkStatus()
		local content = ""
		self._totalBytesExpected = data.size

		if netStatus == NetStatus.kWWAN then
			content = Strings:get("UPDATE_UI11", {
				size = self:formatBytes(data.size - data.totalBytesReceived),
				fontName = TTF_FONT_FZYH_R
			})

			self:showAlertView({
				title = Strings:get("UPDATE_UI2"),
				title1 = Strings:get("UITitle_EN_Gengxintishi"),
				content = content,
				sureBtn = {},
				cancelBtn = {},
				okCallback = function ()
					self._gameUpdater:excuteUpdateCmd(data.vmsData)
				end,
				cancelCallback = function ()
					REBOOT()
				end
			})
		end
	elseif data.type == "vmsState" then
		if data.state == kVMSState.kVmsStart then
			-- Nothing
		elseif data.state == kVMSState.kVmsEnded then
			-- Nothing
		end
	elseif data.type == "downloading" then
		local downloadData = data.data
		local pkgDownloadData = self._pkgsDownloadData[downloadData.task.storagePath]
		pkgDownloadData.bytesReceived = downloadData.bytesReceived
		pkgDownloadData.totalBytesReceived = downloadData.totalBytesReceived
		pkgDownloadData.totalBytesExpected = downloadData.totalBytesExpected

		self:launchLoading(data.data)
	elseif data.type == "installPackage" then
		local event = data.data.event

		if event == "started" then
			if self._updateTips then
				self._updateTips:setString(Strings:get("UPDATE_UI23", {
					fontName = TTF_FONT_FZYH_R,
					content = Strings:get("UPDATE_UI21")
				}))
			end
		elseif event == "failed" then
			self:showAlertView({
				title = Strings:get("UPDATE_UI7"),
				title1 = Strings:get("UITitle_EN_Tishi"),
				content = Strings:get("UPDATE_UI22"),
				sureBtn = {},
				okCallback = function ()
					REBOOT()
				end
			})
		end
	elseif data.type == "updateError" then
		self:showAlertView({
			title = Strings:get("UPDATE_UI7"),
			title1 = Strings:get("UITitle_EN_Tishi"),
			content = "updateError" .. Strings:get("UPDATE_UI8"),
			sureBtn = {},
			okCallback = function ()
				REBOOT()
			end
		})
	elseif data.type == "downloadStart" then
		local downloadData = data.data
		self._pkgsDownloadData[downloadData.task.storagePath] = {}
	end
end

function GameUpdateMediator:formatBytes(data)
	local num = data / 1024

	if num >= 1024 then
		num = string.format("%.1fM", num / 1024)
	else
		num = string.format("%.1fK", num)
	end

	return num
end

function GameUpdateMediator:randomLoadingView()
	local LoadingWidgetMap = nil
	local status = trycall(function ()
		LoadingWidgetMap = require("dm.gameupdate.view.GameUpdateLoadingWidget")
	end)

	if not status or not LoadingWidgetMap then
		print("require LoadingWidget Error:", LoadingWidgetMap)

		return nil
	end

	local loadingList = {
		"GUIDENEWBEE"
	}

	if #loadingList > 0 then
		local index = math.random(1, #loadingList)
		local widget = LoadingWidgetMap[loadingList[index]]

		if widget then
			return widget:new(self:getView())
		end
	end

	print("require LoadingWidget Error", LoadingWidgetMap)

	return nil
end

function GameUpdateMediator:launchLoading(data)
	if self._loadingWidget == nil then
		local loadingWidget = self:randomLoadingView()

		if not loadingWidget then
			return
		end

		loadingWidget:getView():addTo(self:getView())
		loadingWidget:setupView()
		loadingWidget:onProgress(nil, 0)

		local bottom = loadingWidget:getView():getChildByFullName("bottom")
		local changeTips = bottom:getChildByFullName("changeTips")

		changeTips:setVisible(false)

		local updateTips = ccui.RichText:createWithXML("", {})

		updateTips:ignoreContentAdaptWithSize(true)
		updateTips:rebuildElements()
		updateTips:formatText()
		updateTips:setAnchorPoint(cc.p(0.5, 0.5))
		updateTips:renderContent()
		updateTips:addTo(changeTips:getParent()):posite(changeTips:getPosition())

		self._updateTips = updateTips
		local curVersion = app:getAssetsManager():getCurrentVersion()
		local curVersionText = ccui.RichText:createWithXML(Strings:get("UPDATE_UI15", {
			version = curVersion,
			fontName = TTF_FONT_FZYH_R
		}), {})

		curVersionText:setAnchorPoint(cc.p(1, 0.5))
		curVersionText:addTo(bottom):posite(1100, 20)

		self._loadingWidget = loadingWidget

		bottom:getChildByFullName("loading.node_pro"):setVisible(false)
	end

	local loadingWidget = self._loadingWidget
	local bottom = loadingWidget:getView():getChildByFullName("bottom")
	local targetVersion = self._gameUpdater:getTargetVersion()

	if targetVersion ~= 0 and (loadingWidget.targetVersion == nil or loadingWidget.targetVersion ~= targetVersion) then
		bottom:removeChildByName("targetVersion")

		local targetVersionText = ccui.RichText:createWithXML(Strings:get("UPDATE_UI16", {
			version = targetVersion,
			fontName = TTF_FONT_FZYH_R
		}), {})

		targetVersionText:setAnchorPoint(cc.p(0, 0.5))
		targetVersionText:addTo(bottom):posite(36, 20)
		targetVersionText:setName("targetVersion")

		loadingWidget.targetVersion = targetVersion
	end

	if data then
		local current = 0
		local total = self._totalBytesExpected

		for k, v in pairs(self._pkgsDownloadData) do
			current = current + (v.totalBytesReceived or 0)
		end

		local percent = current / math.max(total, 1)

		self._loadingWidget:onProgress(nil, percent)

		local bottom = self._loadingWidget:getView():getChildByFullName("bottom")
		local netStatus = app.getDevice():getNetworkStatus()

		self._updateTips:setString(Strings:get("UPDATE_UI12", {
			fontName = TTF_FONT_FZYH_R,
			totalByte = self:formatBytes(total),
			status = netStatus == NetStatus.kWifi and Strings:get("UPDATE_UI13") or Strings:get("UPDATE_UI14"),
			progress = self:formatBytes(current) .. "/" .. self:formatBytes(total)
		}))
	end
end

function GameUpdateMediator:showWaiting()
	print("GameUpdateMediator:showWaiting")
	WaitingView:getInstance():show(WaitingStyle.kLoadingAndTip, {
		noAction = true,
		delay = 200,
		tip = Strings:get("WAITING_CONNECTING")
	})
end

function GameUpdateMediator:hideWaiting()
	print("GameUpdateMediator:hideWaiting")
	WaitingView:getInstance():hide()
end

local UpdateAlertView = nil

function GameUpdateMediator:showAlertView(data)
	print("GameUpdateMediator:showAlertView")

	if not UpdateAlertView then
		UpdateAlertView = require("dm.gameupdate.view.UpdateAlertView")
	end

	if UpdateAlertView then
		data.isRich = true
		data.noClose = true
		data.bgType = 2
		local text = data.content or ""
		local textData = string.split(text, "<font")

		if #textData <= 1 then
			data.content = Strings:get("UPDATE_UI9", {
				text = text,
				fontName = TTF_FONT_FZYH_R
			})
		end

		local alertDelegate = {
			willClose = function (self, view, info)
				if info.response == UpdateAlertResponse.kOK then
					if data.okCallback then
						data.okCallback()
					end
				elseif data.cancelCallback then
					data.cancelCallback()
				end
			end
		}
		local alertView = UpdateAlertView:new()

		self:getView():addChild(alertView:getView(), 10)
		alertView:setDelegate(alertDelegate)
		alertView:enterWithData(data)
	end
end

local UpdateToast = nil

function GameUpdateMediator:showForceUpdate()
	print("GameUpdateMediator:showForceUpdate")

	if not UpdateToast then
		UpdateToast = require("dm.gameupdate.view.UpdateToast")
	end

	if UpdateToast then
		local toast = UpdateToast:new(Strings:get("FORCE_UPDATE"))

		self:showToast(toast, {})
	end
end

function GameUpdateMediator:showToast(toast, options)
	if toast == nil then
		return
	end

	local winSize = cc.Director:getInstance():getWinSize()

	if self._activeToasts == nil then
		self._activeToasts = {}
	end

	local layer = self._effectLayer

	if not toast:setup(layer, options) then
		return
	end

	for i, v in pairs(self._activeToasts) do
		local view = v:getView()

		view:setPositionY(view:getPositionY() + toast:getView():getContentSize().height)

		if view:getPositionY() > winSize.height * 0.5 - 20 then
			view:setVisible(false)
		end

		local action = view:getActionByTag(101)

		if action then
			action:setSpeed(action:getSpeed() * 2)
		end
	end

	self._activeToasts[toast] = toast

	toast:startAnimation(function (theToast)
		self._activeToasts[theToast] = nil

		if toastsInTheGroup ~= nil then
			for i = 1, #toastsInTheGroup do
				if toastsInTheGroup[i] == theToast then
					table.remove(toastsInTheGroup, i)

					break
				end
			end
		end

		theToast:dispose()
	end)
end
