local cjson = require("cjson.safe")
LoginMediator = class("LoginMediator", DmAreaViewMediator, _M)

LoginMediator:has("_loginSystem", {
	is = "r"
}):injectWith("LoginSystem")

local kBtnHandlers = {
	["main.btnPanel.announceBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickAnnounce"
	},
	["main.btnPanel.reloginBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickReboot"
	},
	["main.btnPanel.forumBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickForumBtn"
	}
}

function LoginMediator:initialize()
	super.initialize(self)
end

function LoginMediator:dispose()
	super.dispose(self)
end

function LoginMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_LOGIN, self, self.onSdkLogin)
	self:mapEventListener(self:getEventDispatcher(), EVT_SWITCH_ACCOUNT, self, self.onSdkLogin)
	self:mapEventListener(self:getEventDispatcher(), EVT_LOGIN_REFRESH_SERVER, self, self.refreshServerPanel)
	self:mapEventListener(self:getEventDispatcher(), EVT_REQUEST_LOGIN_SUCC, self, self.loginSucc)
	self:mapEventListener(self:getEventDispatcher(), EVT_GAME_PROVISION_AGREE, self, self.login)
	self:mapEventListener(self:getEventDispatcher(), EVT_LOGIN_ONQUEUE, self, self.showQueue)
	self:mapEventListener(self:getEventDispatcher(), EVT_LOGIN_CANCEL_QUEUE, self, self.cancelQueue)
end

function LoginMediator:enterWithData(data)
	self:initMainUI()
	self:initAnim()
	self:animOver()
	AudioEngine:getInstance():playBackgroundMusic("Mus_Login_Scene")
	self:dispatch(Event:new(EVT_ENTER_LAUNCH_SCENE))
	cc.UserDefault:getInstance():setStringForKey("PV_FLASH_GUIDE_BATTLE", "true")

	local content = {
		point = "login_enter_login_view",
		type = "loginflow"
	}

	StatisticSystem:send(content)
end

function LoginMediator:animOver()
	local voiceMap = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Launch_Hero_Soud", "content")
	local randomTag = math.random(#voiceMap)

	dmAudio.play(voiceMap[randomTag], {}, nil, 2)

	if not GameConfigs.disabledSDKLogin then
		local function callback()
			self._loginBtn:setTouchEnabled(true)

			if SDKHelper:isEnableSdk() then
				self:sdkLogin()
			elseif device.platform == "ios" then
				local account = self:getDefaultRid()

				if not account or #account <= 0 then
					self._loginSystem:iOSAccount(self._globalUrl, function (errorCode, response)
						account = response.data

						if account and #account > 0 then
							self._textField:setText(account)
							self:setDefaultRid(account)
						else
							self:dispatch(ShowTipEvent({
								tip = "get InvitationCode fail"
							}))
						end
					end)
				end
			end
		end

		if GameConfigs.globalSever then
			self._globalUrl = GameConfigs.globalSever

			callback()
		else
			self:vmsRequest(callback)
		end
	else
		self._loginBtn:setTouchEnabled(true)
	end
end

function LoginMediator:initMainUI()
	local mainlayer = self:getView():getChildByFullName("main")
	self._loginBtn = mainlayer:getChildByFullName("login_btn")

	self._loginBtn:addTouchEventListener(function (sender, eventType)
		self:loginClick(sender, eventType)
	end)
	self._loginBtn:setTouchEnabled(false)

	self._accountStr = ""

	self:setAccountPanel()

	if SDKHelper:isEnableSdk() then
		self._accountPanel:setVisible(false)
	end

	self._test_btn = mainlayer:getChildByFullName("test_btn")

	if self._test_btn then
		self._test_btn:setOpacity(50)
		self._test_btn:setVisible(DEBUG ~= 0 or app.pkgConfig.showDebugBox == 1)
		self._test_btn:addClickEventListener(function ()
			local view = self:getInjector():getInstance("TestView")
			local event = ViewEvent:new(EVT_SHOW_POPUP, view)

			self:dispatch(event)
		end)
	end

	self._announceBtn = mainlayer:getChildByFullName("btnPanel.announceBtn")

	self._announceBtn:setVisible(false)
	self._announceBtn:getChildByFullName("text"):enableOutline(cc.c4b(47, 47, 47, 204), 2)

	self._reloginBtn = mainlayer:getChildByFullName("btnPanel.reloginBtn")

	self._reloginBtn:setVisible(false)
	self._reloginBtn:getChildByFullName("text"):enableOutline(cc.c4b(47, 47, 47, 204), 2)

	self._forumBtn = mainlayer:getChildByFullName("btnPanel.forumBtn")

	self._forumBtn:setVisible(false)
	self._forumBtn:getChildByFullName("text"):enableOutline(cc.c4b(47, 47, 47, 204), 2)

	local version = mainlayer:getChildByFullName("version")
	local curVersion = app:getAssetsManager():getCurrentVersion()

	if curVersion == 0 then
		curVersion = "dev"
	end

	local versionStr = "(" .. curVersion .. ")"
	local baseVersion = app.pkgConfig.packJobId

	if baseVersion then
		versionStr = baseVersion .. versionStr
	end

	version:setString(Strings:get("Setting_Text10", {
		num = versionStr
	}))
	self:getView():getChildByFullName("main.Image_tipbg"):setVisible(false)
	self:getView():getChildByFullName("main.Node_notice"):setVisible(false)
end

function LoginMediator:getDefaultRid()
	local id = ""
	id = GameConfigs.rid or cc.UserDefault:getInstance():getStringForKey("default_rid")

	return id
end

function LoginMediator:setDefaultRid(id)
	cc.UserDefault:getInstance():setStringForKey("default_rid", id)
	cc.UserDefault:getInstance():flush()
end

function LoginMediator:setAccountPanel()
	self._accountPanel = self:getView():getChildByFullName("main.account")

	self._accountPanel:setVisible(true)

	local textField = convertTextFieldToEditBox(self._accountPanel:getChildByFullName("account.TextField"), true, MaskWordType.NAME)

	textField:setText(self:getDefaultRid())
	textField:setPlaceHolder(Strings:get("Login_EnterCode"))
	textField:setPlaceholderFontColor(cc.c3b(255, 255, 255))

	self._textField = textField
	self._serverPanel = self:getView():getChildByFullName("main.server")

	self._serverPanel:setVisible(false)

	local serverDi = self._serverPanel:getChildByName("Image_server")

	serverDi:setTouchEnabled(false)

	self._serverText = self._serverPanel:getChildByName("Text_server")

	self._serverPanel:setTouchEnabled(true)
	self._serverPanel:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			AudioEngine:getInstance():playEffect("Se_Click_Open_2", false)

			local view = self:getInjector():getInstance("LoginServerView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}))
		end
	end)
end

function LoginMediator:refreshServerPanel()
	self._serverData = self._loginSystem:getCurServer()

	self._serverText:setString(self._serverData:getName())
end

function LoginMediator:onSdkLogin(event)
	local data = event:getData()

	if data and (data.errorCode == "loginSuccess" or data.errorCode == "switchAccountSuccess") then
		if SDKHelper and SDKHelper:isEnableSdk() then
			SDKHelper:postData({
				eventKey = "10006"
			})
		end

		self:onGlobalLogin(data.errorCode, data.message, "")
	end
end

function LoginMediator:onGlobalLogin(errorCode, message, sdkId)
	if self._globalUrl ~= nil then
		local content = {
			point = "login_request_global_server",
			type = "loginflow"
		}

		StatisticSystem:send(content)
		self._loginSystem:requestLogin(self._globalUrl, SDKHelper:getGlobalData(sdkId))
	else
		self:dispatch(ShowTipEvent({
			tip = "global url is nil"
		}))
	end
end

function LoginMediator:vmsRequest(callback)
	local curVersion = app:getAssetsManager():getLatestVersion()

	if not curVersion or curVersion == -1 then
		curVersion = "dev"
	end

	local vmsUrl = vmsDefaultUrl

	if app.pkgConfig and app.pkgConfig.captainUrl and app.pkgConfig.captainUrl ~= "" then
		vmsUrl = app.pkgConfig.captainUrl
	end

	local content = {
		point = "login_get_global_url",
		type = "loginflow"
	}

	StatisticSystem:send(content)
	self._loginSystem:vmsRequest(vmsUrl, curVersion, function (vmsErrorCode, vmsResponse)
		if vmsErrorCode == 200 and vmsResponse.data and vmsResponse.data.webApiRoot and vmsResponse.data.webApiRoot ~= "" then
			self._globalUrl = vmsResponse.data.webApiRoot

			if vmsResponse.data.targetV then
				self._targetV = tonumber(vmsResponse.data.targetV)
			end

			callback()
		end

		if LOGIN_DEBUG then
			dump(vmsErrorCode, "vms errorCode:")
			dump(vmsResponse, "vms response:")
		end
	end)
end

function LoginMediator:loginSucc()
	self:showAnnounceView()

	local serverList = self._loginSystem:getServerList()

	if #serverList < 1 then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("LOG_NO_SERVERLIST")
		}))

		return
	end

	self._loginBtn:addTouchEventListener(function (sender, eventType)
		self:enterGameClick(sender, eventType)
	end)
	self._accountPanel:setVisible(false)
	self._serverPanel:setVisible(true)
	self:refreshServerPanel()
	self._reloginBtn:setVisible(true)

	local urlData = ConfigReader:getRecordById("ConfigValue", "Game_Login_Forum_Url")

	if urlData and urlData.content then
		self._forumBtn:setVisible(true)
	end
end

function LoginMediator:showQueue(event)
	if self._isQueue then
		return
	end

	local queueData = event:getData()

	if queueData and queueData.full then
		-- Nothing
	end

	self._isQueue = true
	local view = self:getInjector():getInstance("loginQueueView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
		data = queueData
	}, nil))

	local netClient = self:getInjector():getInstance("GameServerAgent")
	local waitingHandler = netClient:getWaitingHandler()

	waitingHandler:handleWaitingEvent(WaitingEvent.kConnectSucc)
end

function LoginMediator:cancelQueue()
	if self._isQueue then
		local netClient = self:getInjector():getInstance("GameServerAgent")

		if netClient and netClient:getClient() then
			netClient:getClient():close()
		end

		self._isQueue = false
	end
end

function LoginMediator:sdkLogin()
	if self._loginSystem:getGamePoliceAgreeSta() then
		local content = {
			point = "login_sdk_login",
			type = "loginflow"
		}

		StatisticSystem:send(content)

		if SDKHelper and SDKHelper:isEnableSdk() then
			SDKHelper:postData({
				eventKey = "10005"
			})
		end

		SDKHelper:login()
	else
		local view = self:getInjector():getInstance("GameProvisionView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, nil, ))
	end
end

function LoginMediator:login()
	if SDKHelper:isEnableSdk() then
		self:sdkLogin()

		return
	end

	self._accountStr = GameConfigs.rid or self._textField:getText()

	if self._accountStr == "" then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("LOGIN_UI7")
		}))

		return
	end

	if not self:checkAccountStr() then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("LOGIN_UI8")
		}))

		return
	end

	if GameConfigs.disabledSDKLogin then
		if GameConfigs.globalSever then
			self._loginSystem:requestLogin(GameConfigs.globalSever, SDKHelper:getGlobalData(self._accountStr or ""))
		else
			self._accountPanel:setVisible(false)
			self._serverPanel:setVisible(true)
			self._loginBtn:addTouchEventListener(function (sender, eventType)
				self:enterGameClick(sender, eventType)
			end)

			local data = {
				sec_list = TEST_SERVER,
				uid = self._accountStr
			}

			self._loginSystem:getLogin():sync(data)
			self:showAnnounceView()
			self:refreshServerPanel()
		end
	else
		if IS_FORCE_UPDATE then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("FORCE_UPDATE")
			}))

			return
		end

		self:onGlobalLogin("loginSuccess", "", self._accountStr or "")
	end

	self:setDefaultRid(self._accountStr)
end

function LoginMediator:loginClick(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		AudioEngine:getInstance():playEffect("Se_Click_Select_1", false)
		self:login()
	end
end

function LoginMediator:checkAccountStr()
	return string.match(self._accountStr, "%w+") == self._accountStr
end

function LoginMediator:enterGameClick(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		local curServer = self._loginSystem:getCurServer()

		if curServer._state == ServerState.kMaintain then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("LOG_NO_SERVERLIST")
			}))

			return
		end

		AudioEngine:getInstance():playEffect("Se_Click_Login", false)

		if IS_FORCE_UPDATE then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("FORCE_UPDATE")
			}))

			return
		end

		local gameServerAgent = DmGame:getInstance()._injector:getInstance("GameServerAgent")
		local remoteTimestamp = gameServerAgent:remoteTimestamp()

		if remoteTimestamp < SDKHelper:getOffTime() then
			self:showBindTipsView()

			return
		end

		if GameConfigs.disabledSDKLogin then
			local rid = self._accountStr .. "_" .. (self._serverData:getSecId() or "1")

			self._loginSystem:setPlayerRid(rid)
			self:connectGameServer()
		else
			local version = app:getAssetsManager():getCurrentVersion()
			local targetVersion = self._targetV or -1

			if GameConfigs.globalSever then
				version = targetVersion
			end

			if targetVersion ~= version then
				REBOOT()

				return
			end

			local uid = self._loginSystem:getUid()
			local sec = self._serverData:getSecId()
			local rid = tostring(uid) .. "_" .. tostring(sec)

			self._loginSystem:setPlayerRid(rid)
			self:connectGameServer()
		end
	end
end

function LoginMediator:connectGameServer()
	local content = {
		point = "login_connect_game_server",
		type = "loginflow"
	}

	StatisticSystem:send(content)

	if SDKHelper and SDKHelper:isEnableSdk() then
		SDKHelper:postData({
			eventKey = "10007"
		})
	end

	if device.platform ~= "mac" and device.platform ~= "windows" then
		local pid = self._loginSystem:getPlayerRid()

		dpsBugTracer.setUserId(pid)
		cc.UserDefault:getInstance():setStringForKey("playerRid", tostring(pid))
	end

	local netClient = self:getInjector():getInstance("GameServerAgent")

	if netClient and netClient:getClient() then
		netClient:getClient():close()
	end

	local injector = self:getInjector()
	local gameContext = injector:getInstance("GameContext")

	gameContext:loadModuleByName("gameplay")

	local connected = netClient:connect(self._serverData:getIp(), self._serverData:getPort(), function ()
		local content = {
			point = "login_request_player_info",
			type = "loginflow"
		}

		StatisticSystem:send(content)

		if SDKHelper and SDKHelper:isEnableSdk() then
			SDKHelper:postData({
				eventKey = "10008"
			})
		end

		self._loginSystem:requestPlayerInfo(function ()
			self:beforeLoading()
		end)
	end)

	if not connected then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("LOGIN_CONNECT_FAIL")
		}))
	end
end

function LoginMediator:beforeLoading()
	local actionPanel = self:getView():getChildByName("actionPanel")

	actionPanel:setLocalZOrder(100)
	actionPanel:getChildByFullName("LoginBtnAnim"):setVisible(false)
	actionPanel:getChildByFullName("LoginLogoAnim"):setVisible(false)

	if self._whaleAnim then
		self._whaleAnim:gotoAndPlay(0)
	end

	self._bgAnim:gotoAndPlay(91)
	self._bgAnim:addCallbackAtFrame(113, function ()
		self:launchLoading()
	end)
	self._bgAnim:addEndCallback(function ()
		self._bgAnim:stop()
	end)
end

function LoginMediator:launchLoading()
	local function onCompleted()
		local settingSystem = self:getInjector():getInstance(SettingSystem)

		settingSystem:downloadPackage(function ()
			self:dispatch(SceneEvent:new(EVT_SWITCH_SCENE, "mainScene"))
		end)
	end

	local view = self:getInjector():getInstance("loadingView")
	local widget = EnterGameLoadingWidget

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		hideAnim = true,
		loadingTask = self:buildLoadingTask(),
		loadingWidget = self:getInjector():injectInto(widget:new()),
		onCompleted = onCompleted,
		bgAnim = self._bgAnim
	}))
end

function LoginMediator:buildLoadingTask()
	resData = resData or {}
	local taskBuilder = timesharding.TaskBuilder:new()
	local task = taskBuilder:buildParalelTask(function ()
		SEQUENCE(30)
		DO_ACTION(function ()
			if SDKHelper:isEnableSdk() then
				local developSystem = self:getInjector():getInstance(DevelopSystem)
				local curServer = self._loginSystem:getCurServer()
				local player = developSystem:getPlayer()
				local clubSystem = self:getInjector():getInstance(ClubSystem)
				local params = {
					serverId = tostring(curServer:getSecId()),
					serverName = tostring(curServer:getName()),
					createTime = tostring(player:getCreateTime()),
					roleName = tostring(player:getNickName()),
					roleId = tostring(player:getRid()),
					roleLevel = tostring(player:getLevel()),
					roleCombat = tostring(developSystem:getCombat())
				}

				if clubSystem:getHasJoinClub() then
					params.clubId = tostring(clubSystem:getClubId())
					params.clubName = tostring(clubSystem:getName())
					params.clubTitle = tostring(clubSystem:getPositionName())
					params.clubLevel = tostring(clubSystem:getLevel())
				end

				SDKHelper:reportLogin(params)
			end
		end, 1)
		DO_ACTION(function ()
			local pushSystem = self:getInjector():getInstance(PushSystem)

			pushSystem:listenBeforeLogin()
		end, 1)
		DO_ACTION(function ()
			if SDKHelper:isEnableSdk() then
				local payOffSystem = self:getInjector():getInstance(PayOffSystem)

				payOffSystem:payInit()
			end
		end, 1)
		DO_ACTION(function ()
			local injector = self:getInjector()
			local gameContext = injector:getInstance("GameContext")

			gameContext:loadModuleByName("battle")
		end, 1)
		ADD_TASK(1, timesharding.CustomTask:new(function (task)
			local mcLibrary = cc.MCLibrary:getInstance()

			mcLibrary:loadDefinitionsFromFile("asset/anim/zhuxianhuo.mclib", 1)
			mcLibrary:loadDefinitionsFromFile("asset/anim/zhuxianyun.mclib", 1)

			local textureCache = cc.Director:getInstance():getTextureCache()

			textureCache:addImage("asset/anim/zhuxianyunimage.png")
			textureCache:addImage("asset/anim/zhuxianhuoimage.png")

			local spriteFrameCache = cc.SpriteFrameCache:getInstance()

			spriteFrameCache:addSpriteFrames("asset/anim/zhuxianyunimage.plist")
			spriteFrameCache:addSpriteFrames("asset/anim/zhuxianhuoimage.plist")
			delayCallByTime(1000, function ()
				task:finish()
			end)
		end))
		ADD_TASK(1, timesharding.CustomTask:new(function (task)
			local mailSystem = self:getInjector():getInstance(MailSystem)

			mailSystem:requestUnreadMailCnt(false, function ()
				task:finish()
			end)
		end))
		ADD_TASK(1, timesharding.CustomTask:new(function (task)
			local friendSystem = self:getInjector():getInstance(FriendSystem)

			friendSystem:requestFriendsMainInfo(function ()
				task:finish()
			end)
		end))
		ADD_TASK(1, timesharding.CustomTask:new(function (task)
			local petRaceSystem = self:getInjector():getInstance(PetRaceSystem)

			petRaceSystem:requestData(function ()
				task:finish()
			end, true)
		end))
		ADD_TASK(1, timesharding.CustomTask:new(function (task)
			local taskSystem = self:getInjector():getInstance(TaskSystem)
			local params = {
				taskType = {
					TaskType.kDaily,
					TaskType.kBranch,
					TaskType.kStage,
					TaskType.kStageArena
				}
			}

			taskSystem:requestTaskList(params, function ()
				task:finish()
			end)
		end))
		ADD_TASK(1, timesharding.CustomTask:new(function (task)
			local maskWordSystem = self:getInjector():getInstance(MaskWordSystem)

			maskWordSystem:requestMaskWord(function ()
				task:finish()
			end, true)
		end))
		ADD_TASK(1, timesharding.CustomTask:new(function (task)
			self._loginSystem:getPatFaceDataToSave(function ()
				task:finish()
			end, true)
		end))

		if self._loginSystem:getLoginUrl() then
			ADD_TASK(1, timesharding.CustomTask:new(function (task)
				self._loginSystem:getAnnounceDataToSave(function ()
					task:finish()
				end, true)
			end))
		end

		ADD_TASK(1, timesharding.CustomTask:new(function (task)
			BattleLoader:preloadBattleCache()
			BattleLoader:preloadBattleDataConfig()
			delayCallByTime(1000, function ()
				task:finish()
			end)
		end))
		DO_ACTION(function ()
			local settingSystem = self:getInjector():getInstance(SettingSystem)

			settingSystem:autoDownloadPackage()
		end, 1)
		DO_ACTION(function ()
			local systemKeeper = self:getInjector():getInstance("SystemKeeper")
			local unlock, tips = systemKeeper:isUnlock("RTPK")

			if unlock then
				local RTPKSystem = self:getInjector():getInstance(RTPKSystem)

				RTPKSystem:requestRTPKInfo(nil, false)
			end
		end, 1)
		DO_ACTION(function ()
			local systemKeeper = self:getInjector():getInstance("SystemKeeper")
			local unlock, tips = systemKeeper:isUnlock("StageArena")

			if unlock then
				local leadStageSystem = self:getInjector():getInstance(LeadStageArenaSystem)

				leadStageSystem:requestGetSeasonInfo(nil, false)
			end
		end, 1)
		DO_ACTION(function ()
			local systemKeeper = self:getInjector():getInstance("SystemKeeper")
			local unlock, tips = systemKeeper:isUnlock("ChessArena_System")

			if unlock then
				local arenaSystem = self:getInjector():getInstance(ArenaNewSystem)

				arenaSystem:requestGainChessArena(nil, false)
			end
		end, 1)
		DO_ACTION(function ()
			local systemKeeper = self:getInjector():getInstance("SystemKeeper")
			local unlock, tips = systemKeeper:isUnlock("ChessArena_System")

			if unlock then
				local arenaSystem = self:getInjector():getInstance(ArenaNewSystem)

				arenaSystem:requestOfflineReport()
			end
		end, 1)
		END()
	end)

	task:setTimeLimitation(30)

	return task
end

function LoginMediator:showAnnounceView()
	self._announceBtn:setVisible(false)
end

function LoginMediator:onClickAnnounce()
	self:showAnnounceView()
end

function LoginMediator:onClickReboot()
	local outSelf = self
	local delegate = {}

	local function reboot()
		dmAudio.releaseAllAcbs()
		dmAudio.stopAll(AudioType.Music)

		if SDKHelper and SDKHelper:isEnableSdk() then
			self._loginSystem:saveGamePoliceAgreeSta(false)
			SDKHelper:logOut()
		end

		REBOOT()
	end

	function delegate:willClose(popupMediator, data)
		if data.response == "ok" then
			reboot()
		elseif data.response == "cancel" then
			-- Nothing
		elseif data.response == "close" then
			-- Nothing
		end
	end

	local data = {
		title = Strings:get("AccountSwitch_Title"),
		content = Strings:get("AccountSwitch_Text"),
		sureBtn = {},
		cancelBtn = {}
	}
	local view = self:getInjector():getInstance("AlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end

function LoginMediator:onClickForumBtn()
	local urlData = ConfigReader:getRecordById("ConfigValue", "Game_Login_Forum_Url")

	if urlData and urlData.content then
		cc.Application:getInstance():openURL(urlData.content)
	end
end

function LoginMediator:initAnim(callback)
	self._accountPanel:setOpacity(0)

	local limitBg = self._loginSystem:getLimitTimeBg()
	local actionPanel = self:getView():getChildByName("actionPanel")
	self._bgAnim = cc.MovieClip:create("zdh_xindenglu")

	self._bgAnim:addTo(actionPanel)
	self._bgAnim:setPosition(cc.p(568, 320))
	self._bgAnim:addCallbackAtFrame(90, function ()
		self._bgAnim:gotoAndPlay(0)
	end)

	local bgNode = self._bgAnim:getChildByName("bg")

	if limitBg then
		bgNode:removeAllChildren()

		local bgConfig = ConfigReader:getRecordById("BackGroundPicture", limitBg)
		local bgAnim = cc.MovieClip:create(bgConfig.Flash1)

		bgAnim:addTo(bgNode):center(bgNode:getContentSize())
	end

	local isNewLoading = self._loginSystem:getIsNewLoading()

	if isNewLoading then
		local bgNode = self._bgAnim:getChildByName("donghua")

		bgNode:removeAllChildren()

		local bgAnim = cc.MovieClip:create("zong_KoreaAnniversariesLoading")

		bgAnim:addTo(bgNode):center(bgNode:getContentSize())

		self._whaleAnim = nil
	else
		local anim1 = self._bgAnim:getChildByName("donghua")
		local anim2 = anim1:getChildByName("niao")
		local anim3 = anim2:getChildByName("niao1")
		local anim4 = anim2:getChildByName("niao2")
		local anim5 = anim1:getChildByName("jingyu")
		local anim6 = cc.MovieClip:create("yuyu_xindenglu")

		anim6:addTo(anim5):posite(150, -50)
		anim6:addEndCallback(function ()
			anim6:stop()
		end)
		anim6:gotoAndPlay(0)

		self._whaleAnim = anim6
		local animPath = "asset/anim/jingyu.skel"

		if cc.FileUtils:getInstance():isFileExist(animPath) then
			local spineNode = sp.SkeletonAnimation:create(animPath)

			spineNode:playAnimation(0, "niao", true)
			spineNode:addTo(anim3)

			local spineNode = sp.SkeletonAnimation:create(animPath)

			spineNode:playAnimation(0, "niao", true)
			spineNode:addTo(anim4)

			local node = anim6:getChildByName("jingyu1")
			local spineNode = sp.SkeletonAnimation:create(animPath)

			spineNode:playAnimation(0, "jingyu", true)
			spineNode:addTo(node)
			spineNode:setPosition(cc.p(0, -180))
		end
	end

	local mc = cc.MovieClip:create("UI_denglu")

	mc:addCallbackAtFrame(10, function ()
		self._accountPanel:runAction(cc.FadeIn:create(0.2))
	end)
	mc:addEndCallback(function ()
		mc:stop()
	end)
	mc:addTo(actionPanel)
	mc:setPosition(cc.p(568, 320))
	mc:setName("LoginBtnAnim")

	local videoName, videoSize, videoPos = nil
	local scale = 1.3
	videoName = "video/LOGO.usm"
	videoSize = cc.size(600 * scale, 342 * scale)
	videoPos = cc.p(585, 447)

	self._loginSystem:setLogoPvName(videoName)
	self._loginSystem:setLogoSize(videoSize)

	local video = VideoSprite.create(videoName, function (instance, eventName, index)
		if eventName == "complete" then
			instance:getPlayer():pause(true)

			if callback then
				callback()
			end
		end
	end)

	video:addTo(actionPanel)
	video:setContentSize(videoSize)
	video:setPosition(videoPos)
	video:setName("LoginLogoAnim")
end

function LoginMediator:showBindTipsView()
	local view = self:getInjector():getInstance("UnBindView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}))
end
