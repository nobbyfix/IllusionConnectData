require("dm.gameplay.home.view.home.Navigation")
require("dm.gameplay.home.view.home.AudioTimerSystem")

HomeMediator = class("HomeMediator", DmAreaViewMediator, _M)

HomeMediator:has("_loginSystem", {
	is = "r"
}):injectWith("LoginSystem")
HomeMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
HomeMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
HomeMediator:has("_stageSystem", {
	is = "r"
}):injectWith("StageSystem")
HomeMediator:has("_mailSystem", {
	is = "r"
}):injectWith("MailSystem")
HomeMediator:has("_chatSystem", {
	is = "r"
}):injectWith("ChatSystem")
HomeMediator:has("_clubSystem", {
	is = "rw"
}):injectWith("ClubSystem")
HomeMediator:has("_shopSystem", {
	is = "rw"
}):injectWith("ShopSystem")
HomeMediator:has("_mazeSystem", {
	is = "rw"
}):injectWith("MazeSystem")
HomeMediator:has("_systemKeeper", {
	is = "rw"
}):injectWith("SystemKeeper")
HomeMediator:has("_activitySystem", {
	is = "rw"
}):injectWith("ActivitySystem")
HomeMediator:has("_buildingSystem", {
	is = "r"
}):injectWith("BuildingSystem")
HomeMediator:has("_settingSystem", {
	is = "r"
}):injectWith("SettingSystem")
HomeMediator:has("_passSystem", {
	is = "r"
}):injectWith("PassSystem")

local kBtnHandlers = {
	unfoldMenuBtn = {
		clickAudio = "Se_Click_Home_1",
		func = "onMenuStateChange"
	},
	["extraActBtn.btn_1"] = {
		ignoreClickAudio = true,
		func = "onCarnivalBtn"
	},
	["extraActBtn.btn_3"] = {
		ignoreClickAudio = true,
		func = "onClubResourcesBattleBtn"
	},
	["unfoldMenuBtn.fastGetResourceBtn"] = {
		ignoreClickAudio = true,
		func = "fastGetRes"
	},
	["unfoldMenuBtn.fastGetResourceExBtn"] = {
		ignoreClickAudio = true,
		func = "fastGetRes"
	}
}
local spineTouchEventTag = false
local firstChargePackId = "PackageShop_1"
local PREPARESTATE = "Prepare_State"
local ResidentSoundID = nil
local spineTouchEventName = "touch2"
local buildingResourceTimeState = {
	0,
	60,
	900,
	1800,
	3600,
	10800,
	21600
}
local buildingResourceTimeAnim = {
	"jieduan2_jiayuanshouqu",
	"jieduan3_jiayuanshouqu",
	"jieduan4_jiayuanshouqu",
	"jieduan5_jiayuanshouqu",
	"jieduan6_jiayuanshouqu",
	"jieduan7_jiayuanshouqu"
}
local buildingResourceTimeAnimPos = {
	cc.p(160, 52),
	cc.p(160, 63),
	cc.p(160, 63),
	cc.p(171, 70),
	cc.p(180, 73),
	cc.p(190, 83)
}
local buildingGetResourceExBtnSize = {
	cc.p(0, 0),
	cc.p(0, 0),
	cc.p(10, 40),
	cc.p(50, 50),
	cc.p(75, 55),
	cc.p(80, 63)
}

local function formatUnorderTable(unorderTable, compFunc)
	local _tab = {}

	for k, v in pairs(unorderTable) do
		_tab[#_tab + 1] = k
	end

	if compFunc then
		table.sort(_tab, compFunc)
	end

	return _tab
end

local function convertNodeToWorldSpaceWithPos(node, pos)
	local parent = node:getParent()
	local rowPosX, rowPosY = node:getPosition()
	local offsetPos = parent:convertToWorldSpace(cc.p(rowPosX, rowPosY))
	local offX = pos.x - offsetPos.x
	local offY = pos.y - offsetPos.y

	node:setPosition(cc.p(rowPosX + offX, rowPosY + offY))
end

local HomeViewConfig = require("dm.gameplay.home.view.home.HomeViewConfig")

function HomeMediator:initialize()
	super.initialize(self)

	self._hasPayIncomplete = false
end

function HomeMediator:dispose()
	if self._bannerTimer then
		self._bannerTimer:stop()

		self._bannerTimer = nil
	end

	if self._checkGetResTimer then
		self._checkGetResTimer:stop()

		self._checkGetResTimer = nil
	end

	if self._webPayTimer then
		self._webPayTimer:stop()

		self._webPayTimer = nil
	end

	if self._clubResourcesBattleTimer then
		self._clubResourcesBattleTimer:stop()

		self._clubResourcesBattleTimer = nil
	end

	if self._currencyInfoWidget then
		self._currencyInfoWidget:dispose()

		self._currencyInfoWidget = nil
	end

	if self._playInfoWidget then
		self._playInfoWidget:dispose()

		self._playInfoWidget = nil
	end

	if self._chatFlowWidget then
		self._chatFlowWidget:dispose()

		self._chatFlowWidget = nil
	end

	if self._motion then
		self._motion:stop()

		self._motion = nil
	end

	self._hasPayIncomplete = false

	super.dispose(self)
end

function HomeMediator:resumeWithData(data)
	self:refreshDownloadStatus()
	self:refreshRedPoint()
	self:randomBoardRoleAndBg()

	if self._navigation._initDone then
		self._navigation:updataTopNode()

		local isOpen = self._navigation:isTopOpen()

		if isOpen then
			self._navigation:openAction()
		else
			self._navigation:closeAction()
		end
	end

	if self._motion and not self._motion:isRunning() then
		self:enableAccelerator()
	end

	if not self._checkGetResTimer then
		self:enableBuildingResourceTimer()
	end

	if not self._webPayTimer then
		self:enableWebPayListTimer()
	end

	self._touchTimes = 0
	local resumeTime = TimeUtil:timeByLocalDate()

	if not self._lastResumeTime or resumeTime - self._lastResumeTime > 900 then
		self:setBoardHeroEffectState(true)

		self._lastResumeTime = resumeTime
	end

	self:registerHomeViewEvent()
	self:setupClickEnvs(true)
	self:playClimate2Audio()
	self:checkNewSystemUnlock()
end

function HomeMediator:leaveWithData(data)
	local data = {
		noClose = true,
		title = Strings:get("UPDATE_UI7"),
		content = Strings:get("UI_TEXT_EXIT_GAME"),
		sureBtn = {},
		cancelBtn = {}
	}
	local outSelf = self
	local delegate = {
		willClose = function (self, popupMediator, data)
			if data.response == "ok" then
				performWithDelay(outSelf:getView(), function ()
					cc.Director:getInstance():endToLua()
				end, 0.1)
			end
		end
	}
	local view = self:getInjector():getInstance("AlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		isAreaIndependent = true,
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end

function HomeMediator:playClimate2Audio()
	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local guideAgent = storyDirector:getGuideAgent()
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local level = developSystem:getPlayer():getLevel()

	if self._climateEffect then
		AudioEngine:getInstance():stopEffect(self._climateEffect)

		self._climateEffect = nil
	end

	if (GameConfigs.closeGuide or not guideAgent:isGuiding() and level > 1) and Climate2AudioEffect[self._climateDay] and self._climateMc ~= nil then
		self._climateEffect = AudioEngine:getInstance():playEffect(Climate2AudioEffect[self._climateDay], false)
	end
end

function HomeMediator:onRegister()
	super.onRegister(self)

	self._heroSystem = self._developSystem:getHeroSystem()
	self._settingModel = self:getInjector():getInstance(SettingSystem):getSettingModel()

	self:initButtons(HomeViewConfig)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:createMapListener()
end

function HomeMediator:onRemove()
	super.onRemove(self)
end

function HomeMediator:willStartResumeTransition()
	self._mc:setPlaySpeed(2)
	self._mc:gotoAndStop(0)

	local mainStageNode = self._rightFuncLayout:getChildByFullName("mExploreNode")

	mainStageNode:getChildByName("mRedSprite"):setOpacity(0)

	for i = 1, #self._actNodes do
		self._actNodes[i].movieClip:gotoAndStop(0)

		local redPoint = self._actNodes[i]:getChildByName("mRedSprite")

		redPoint:setOpacity(0)
	end

	local chatNode = self:getView():getChildByName("chatNode")
	local leftRowPosX, leftRowPosY = self._leftFuncLayout:getPosition()
	local topRowPosX, topRowPosY = self._topFuncLayout:getPosition()
	local chatNodeRowPosX, chatNodeRowPosY = chatNode:getPosition()

	self._leftFuncLayout:setPositionX(leftRowPosX + 25)
	self._topFuncLayout:setPositionX(topRowPosX + 25)
	chatNode:setPositionY(chatNodeRowPosY + 42.2)
	self._leftFuncLayout:setOpacity(0)
	self._topFuncLayout:setOpacity(0)

	local playerNode = self:getView():getChildByName("playerNode")
	local currencyInfoNode = self:getView():getChildByFullName("currencyinfo_node")
	local extraBtnNode = self:getView():getChildByFullName("extraActBtn")

	self._rightFuncLayout:getChildByFullName("extraActBtn"):setOpacity(0)
	chatNode:setOpacity(0)
	playerNode:setOpacity(0)
	extraBtnNode:setOpacity(0)
	currencyInfoNode:setOpacity(0)
	self._menuStateBtn:setOpacity(0)
end

function HomeMediator:didFinishResumeTransition()
	self._mc:gotoAndPlay(1)

	local action = cc.CSLoader:createTimeline("asset/ui/MainScene.csb")

	self._urlFuncLayout:runAction(action)
	action:gotoFrameAndPlay(0, 25, false)
	action:setTimeSpeed(2)
	self._menuStateBtn:runAction(cc.FadeIn:create(0.6))
end

function HomeMediator:didFinishCoverTransition()
	super.didFinishCoverTransition(self)
	self:getView():stopAllActions()

	if self._climateEffect then
		AudioEngine:getInstance():stopEffect(self._climateEffect)

		self._climateEffect = nil
	end

	if ResidentSoundID then
		AudioEngine:getInstance():stopEffect(ResidentSoundID)

		ResidentSoundID = nil
	end

	if self._motion then
		self._motion:stop()
	end

	self:setBoardHeroEffectState(false)
	self._playInfoWidget:unregisterTimerEvent()
end

function HomeMediator:enterWithData(data)
	local content = {
		point = "login_enter_home_view",
		type = "loginflow"
	}

	StatisticSystem:send(content)
	self:initWidget()
	self:onFunSwitchSet()
	self:setupCurrencyInfoWidget()
	self:setupPlayerInfoWidget()
	self:showChat()
	self:initHomeView()
	self:initAnim()
	self:setBoardHeroEffectState(true, true)
	self:enableAccelerator()
	self:setupClickEnvs(true)
	self:playClimate2Audio()
	self:checkNewSystemUnlock()
	self:refreshDownloadStatus()

	if SDKHelper and SDKHelper:isEnableSdk() then
		SDKHelper:bindInfo()
	end

	if not self._hasPayIncomplete then
		local payOffSystem = self:getInjector():getInstance(PayOffSystem)

		payOffSystem:createPayIncomplete()

		self._hasPayIncomplete = true
	end
end

function HomeMediator:onFunSwitchSet()
	local taskNode = self._leftBtns.mTaskNode

	if taskNode then
		taskNode:setVisible(CommonUtils.GetSwitch("fn_task"))
	end

	local shopNode = self._leftBtns.mShopNode

	if shopNode then
		shopNode:setVisible(CommonUtils.GetSwitch("fn_shop_recharge"))
	end

	local guildNode = self._rightBtns.mGuildNode

	if guildNode then
		guildNode:setVisible(CommonUtils.GetSwitch("fn_guild"))
	end

	local activityNode = self._rightBtns.mActivity2Node

	if activityNode then
		activityNode:setVisible(CommonUtils.GetSwitch("fn_activity"))
	end
end

function HomeMediator:onFunSwitchSet()
	local taskNode = self._leftBtns.mTaskNode

	if taskNode then
		taskNode:setVisible(CommonUtils.GetSwitch("fn_task"))
	end

	local shopNode = self._leftBtns.mShopNode

	if shopNode then
		shopNode:setVisible(CommonUtils.GetSwitch("fn_shop_recharge"))
	end

	local guildNode = self._rightBtns.mGuildNode

	if guildNode then
		guildNode:setVisible(CommonUtils.GetSwitch("fn_guild"))
	end

	local activityNode = self._rightBtns.mActivity2Node

	if activityNode then
		activityNode:setVisible(CommonUtils.GetSwitch("fn_activity"))
	end
end

function HomeMediator:createMapListener()
	self:mapEventListener(self:getEventDispatcher(), EVT_HOMEVIEW_REDPOINT_REF, self, self.passiveRefreshRedPoint)
	self:mapEventListener(self:getEventDispatcher(), EVT_HOME_SET_SHOWHERO, self, self.setShowHero)
	self:mapEventListener(self:getEventDispatcher(), EVT_CHARGETASK_FIN, self, self.reloadView)
	self:mapEventListener(self:getEventDispatcher(), EVT_HOME_SET_VIEWBG, self, self.changeHomeViewBg)
	self:mapEventListener(self:getEventDispatcher(), EVT_ACTIVITY_CLOSE, self, self.reloadView)
	self:mapEventListener(self:getEventDispatcher(), EVT_HOME_SET_CLIMATE, self, self.setClimateScene)
	self:mapEventListener(self:getEventDispatcher(), EVT_FRIENDPVP_RECEIVEINVITATION, self, self.onReceiveFriendPvpInviteCallback)
	self:mapEventListener(self:getEventDispatcher(), EVT_SURFACE_SELECT_SUCC, self, self.setBoardHeroSprite)
	self:mapEventListener(self:getEventDispatcher(), EVT_SURFACE_BUY_SUCC, self, self.setBoardHeroSprite)
	self:mapEventListener(self:getEventDispatcher(), EVT_BUY_PACKAGE_SUCC, self, self.reloadPageView)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_REWARDS_SUCC, self, self.getDownloadReward)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_PORTRAIT_OVER, self, self.refreshDownloadStatus)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_SOUNDCV_OVER, self, self.refreshDownloadStatus)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_PORTRAIT, self, self.refreshDownloadPorLabel)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_SOUNDCV, self, self.refreshDownloadSoundLabel)
end

function HomeMediator:getDownloadReward(event)
	self:refreshDownloadStatus()

	local data = event:getData()

	if data.rewards and #data.rewards > 0 then
		local view = self:getInjector():getInstance("getRewardView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			maskOpacity = 0
		}, {
			rewards = data.rewards
		}))
	end
end

function HomeMediator:refreshDownloadStatus()
	self._downloadBtn:setVisible(self._settingSystem:canDownloadPortrait() or self._settingSystem:canDownloadSoundCV())

	local btn = self._downloadBtn:getChildByFullName("mBtn")
	local mTempName = self._downloadBtn:getChildByFullName("mTempName")
	local normalPath = "main_xz_1.png"
	local pressedPath = "main_xz_1.png"
	local tip = Strings:get("Home_UI_Download")

	if self._settingSystem:canDownloadPortrait() then
		local isPortraitDownloadOver = self._settingSystem:isPortraitDownloadOver()

		if isPortraitDownloadOver then
			normalPath = "main_xz_3.png"
			pressedPath = "main_xz_3.png"
			tip = Strings:get("Home_UI_Download_Received")
		else
			normalPath = "main_xz_2.png"
			pressedPath = "main_xz_2.png"
			local portraitProgress = self._settingSystem:getPortraitProgress()
			portraitProgress = math.modf(portraitProgress)

			if portraitProgress == 100 then
				tip = Strings:get("Home_UI_Download_Received")
			else
				tip = portraitProgress .. "%"
			end
		end
	elseif self._settingSystem:canDownloadSoundCV() then
		local isSoundCVDownloadOver = self._settingSystem:isSoundCVDownloadOver()

		if isSoundCVDownloadOver then
			normalPath = "main_xz_3.png"
			pressedPath = "main_xz_3.png"
			tip = Strings:get("Home_UI_Download_Received")
		else
			normalPath = "main_xz_2.png"
			pressedPath = "main_xz_2.png"
			local soundcvProgress = self._settingSystem:getSoundCVProgress()
			soundcvProgress = math.modf(soundcvProgress)

			if soundcvProgress == 100 then
				tip = Strings:get("Home_UI_Download_Received")
			else
				tip = soundcvProgress .. "%"
			end
		end
	end

	btn:loadTextureNormal(normalPath, ccui.TextureResType.userDataType)
	btn:loadTexturePressed(pressedPath, ccui.TextureResType.userDataType)
	mTempName:setString(tip)
end

function HomeMediator:refreshDownloadPorLabel(event)
	local data = event:getData()
	local percent = math.modf(data.progress)
	local tip = percent .. "%"
	local mTempName = self._downloadBtn:getChildByFullName("mTempName")

	if percent == 100 then
		mTempName:setString(Strings:get("Home_UI_Download_Received"))
	else
		mTempName:setString(tip)
	end
end

function HomeMediator:refreshDownloadSoundLabel(event)
	if self._settingSystem:canDownloadPortrait() then
		return
	end

	local data = event:getData()
	local percent = math.modf(data.progress)
	local tip = percent .. "%"
	local mTempName = self._downloadBtn:getChildByFullName("mTempName")

	if percent == 100 then
		mTempName:setString(Strings:get("Home_UI_Download_Received"))
	else
		mTempName:setString(tip)
	end
end

function HomeMediator:reloadView()
	print("@@@@@@@@@@@@@@@@@@@@@@@@@")
	self:reloadPageView()
	self:checkClubRedPoint()
	self:checkExtraRedPoint()
	print("@@@@@@@@@@@@@@@@@@@@@@@@@11111111111111111")
end

function HomeMediator:initHomeView()
	self._homePanel:setVisible(true)

	local afkBtn = self._showHeroPanel:getChildByName("afkBtn")

	afkBtn:setLocalZOrder(5556)

	local function callFunc()
		local view = self:getInjector():getInstance("BuildingAfkGiftView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
			canSetBoardHero = true,
			type = 4,
			id = self._showHeroId
		}))
	end

	mapButtonHandlerClick(nil, afkBtn, {
		ignoreClickAudio = true,
		func = callFunc
	})

	local customDataSystem = self:getInjector():getInstance(CustomDataSystem)
	self._showHeroId = customDataSystem:getValue(PrefixType.kGlobal, "BoardHeroId", -1)

	if self._showHeroId == -1 then
		self._showHeroId = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Default_Model_Board", "content")

		customDataSystem:setValue(PrefixType.kGlobal, "BoardHeroId", self._showHeroId)
	end

	self._homeViewBgId = self._settingSystem:getHomeBgId()

	self:randomBoardRoleAndBg()
	self:registerHomeViewEvent()
	self:initActivityBanner()
	self:checkClubRedPoint()
	self:checkExtraRedPoint()
	self:enableBuildingResourceTimer()
	self:enableWebPayListTimer()
	self:checkClubResourcesBattleTimerLogic()
end

function HomeMediator:enableBuildingResourceTimer()
	local unlock, tips = self._systemKeeper:isUnlock("Village_Building")

	if unlock then
		if self._checkGetResTimer then
			self._checkGetResTimer:stop()

			self._checkGetResTimer = nil
		end

		local function updata()
			local lastGetResTime = self._buildingSystem:getBuildLastGetResTime()
			local tag = 0

			for i = #buildingResourceTimeState, 1, -1 do
				if buildingResourceTimeState[i] < lastGetResTime then
					tag = i

					break
				end
			end

			local animName = buildingResourceTimeAnim[tag - 1]
			local animPos = buildingResourceTimeAnimPos[tag - 1]
			local curAnim = self._menuStateBtn:getChildByTag(10025)

			if tag == 0 or tag == 1 then
				if curAnim then
					self._menuStateBtn:removeChildByTag(10025)
				end

				self._menuStateBtn:getChildByTag(10026):stop()
			elseif not curAnim or curAnim:getName() ~= animName then
				self._menuStateBtn:getChildByTag(10026):play()

				if curAnim then
					self._menuStateBtn:removeChildByTag(10025)
				end

				local mc = cc.MovieClip:create(animName)

				mc:addCallbackAtFrame(65, function ()
					mc:stop()
				end)
				mc:addTo(self._menuStateBtn, 1, 10025):setName(animName)
				mc:setPosition(animPos)

				local btnSize = {
					width = buildingGetResourceExBtnSize[tag - 1].x,
					height = buildingGetResourceExBtnSize[tag - 1].y
				}

				self._fastGetResourceExBtn:ignoreContentAdaptWithSize(false)
				self._fastGetResourceExBtn:setContentSize(btnSize)
			end
		end

		self._checkGetResTimer = LuaScheduler:getInstance():schedule(updata, 2, false)
	end
end

function HomeMediator:enableWebPayListTimer()
	if self._webPayTimer then
		self._webPayTimer:stop()

		self._webPayTimer = nil
	end

	local function updata()
		local scene = self:getInjector():getInstance("BaseSceneMediator", "activeScene")
		local topViewName = scene:getTopViewName()

		if topViewName == "homeView" then
			local payOffSystem = self:getInjector():getInstance(PayOffSystem)

			payOffSystem:showWebReward()
		end
	end

	self._webPayTimer = LuaScheduler:getInstance():schedule(updata, 1, false)
end

function HomeMediator:fastGetRes()
	local unlock, tips = self._systemKeeper:isUnlock("Village_Building")

	if unlock then
		local lastGetResTime = self._buildingSystem:getBuildLastGetResTime()
		local tag = 0

		for i = #buildingResourceTimeState, 1, -1 do
			if buildingResourceTimeState[i] < lastGetResTime then
				tag = i

				break
			end
		end

		if tag == 0 then
			AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Build_ResourceBuilding_Unlock")
			}))
		else
			AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)

			local mc = self._menuStateBtn:getChildByTag(10026)

			mc:stop()

			local goldIcon = self._menuStateBtn:getChildByTag(10025)

			if goldIcon then
				goldIcon:setVisible(false)
			end

			local delegate = __associated_delegate__(self)({
				willClose = function (self, popUpMediator, data)
					local mc = self._menuStateBtn:getChildByTag(10026)

					mc:gotoAndStop(1)
					self._menuStateBtn:removeChildByTag(10025)
				end
			})
			local view = self:getInjector():getInstance("BuildingOneKeyGetResView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, , delegate))
		end
	else
		self:dispatch(ShowTipEvent({
			tip = tips
		}))
	end
end

function HomeMediator:enableAccelerator()
	if device.platform == "mac" then
		return
	end

	if self._motion then
		self._motion:stop()

		self._motion = nil
	end

	local posX = 568
	local posY = 320
	self._motion = app.getDevice():getMotion()

	function self._motion.onMotion(data)
		local acceleration = data.userAcceleration
		local acX = acceleration.x
		local acY = acceleration.y
		local acZ = acceleration.z

		if math.abs(acX) > 2 or math.abs(acY) > 2 or math.abs(acZ) > 2 then
			if not spineTouchEventTag and self._sharedSpine and self._sharedSpine:hasAnimation(spineTouchEventName) then
				spineTouchEventTag = true

				self._sharedSpine:playAnimation(0, spineTouchEventName, true)
			end

			return
		end

		local gravity = data.gravity
		local offX = -gravity.y * 80
		local offY = gravity.x * 60
		local ccp = cc.p(posX + offX, posY + offY)

		self._homeBgPanel:setPosition(ccp)
	end

	self._motion:setInterval(0.03333333333333333)
	self._motion:start()
end

function HomeMediator:initAnim()
	local iconView = cc.MovieClip:create("baoshi_lingxingbaoshi")

	iconView:setPosition(cc.p(0, 0))

	local mainStageNode = self._rightFuncLayout:getChildByFullName("mExploreNode")
	local mainStageNodeMc = mainStageNode.movieClip
	mainStageNode.iconMovieClip = iconView

	mainStageNodeMc:getChildByName("Icon"):addChild(iconView)
	mainStageNode:getChildByName("mRedSprite"):setOpacity(0)

	local nodes = {
		[#nodes + 1] = self._rightFuncLayout:getChildByName("mGuildNode"),
		[#nodes + 1] = self._rightFuncLayout:getChildByName("mRecruitEquipNode"),
		[#nodes + 1] = self._rightFuncLayout:getChildByName("mChallengeNode"),
		[#nodes + 1] = self._rightFuncLayout:getChildByName("mCardsGroupNode"),
		[#nodes + 1] = self._rightFuncLayout:getChildByName("mArena1Node"),
		[#nodes + 1] = self._rightFuncLayout:getChildByName("mActivity2Node")
	}

	for i = 1, #nodes do
		local redPoint = nodes[i]:getChildByName("mRedSprite")

		redPoint:setOpacity(0)
	end

	self._actNodes = nodes
	local mainMovieClip = cc.MovieClip:create("dh_xinzhujiemian")
	self._mc = mainMovieClip

	mainMovieClip:stop()
	mainMovieClip:addCallbackAtFrame(1, function ()
		mainStageNodeMc:gotoAndPlay(0)
	end)
	mainMovieClip:addCallbackAtFrame(11, function ()
		local mc = nodes[1].movieClip

		mc:gotoAndPlay(0)
		mainStageNode:getChildByName("mRedSprite"):runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.FadeIn:create(0.3)))
		nodes[1]:getChildByName("mRedSprite"):runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.FadeIn:create(0.3)))
	end)
	mainMovieClip:addCallbackAtFrame(12, function ()
		local mc1 = nodes[2].movieClip

		mc1:gotoAndPlay(0)
		nodes[2]:getChildByName("mRedSprite"):runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.FadeIn:create(0.3)))

		local mc2 = nodes[3].movieClip

		mc2:gotoAndPlay(0)
		nodes[3]:getChildByName("mRedSprite"):runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.FadeIn:create(0.3)))

		local mc3 = nodes[4].movieClip

		mc3:gotoAndPlay(0)
		nodes[4]:getChildByName("mRedSprite"):runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.FadeIn:create(0.3)))

		local mc4 = nodes[6].movieClip

		mc4:gotoAndPlay(0)
		nodes[6]:getChildByName("mRedSprite"):runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.FadeIn:create(0.3)))
	end)
	mainMovieClip:addCallbackAtFrame(13, function ()
		local mc = nodes[5].movieClip

		mc:gotoAndPlay(0)
		nodes[5]:getChildByName("mRedSprite"):runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.FadeIn:create(0.3)))
	end)
	mainMovieClip:addCallbackAtFrame(30, function ()
		mainMovieClip:stop()
	end)

	local mcNode = self:getView():getChildByFullName("mainMcNode")

	mainMovieClip:setAnchorPoint(cc.p(0, 0))
	mainMovieClip:setPosition(cc.p(0, 0))
	mainMovieClip:addTo(mcNode)

	local mainBgPanel = mainMovieClip:getChildByName("mainBgPanel")

	self._homeBgPanel:changeParent(mainBgPanel)

	local heroPanel = mainMovieClip:getChildByName("heroPanel")

	self._homePanel:changeParent(heroPanel)
	self._homePanel:setPosition(cc.p(800, 520))

	local baseFadePanel = mainMovieClip:getChildByName("baseFadePanel")
	local adjustUtil = self:getView():getChildByName("adjustUtil")

	adjustUtil:changeParent(baseFadePanel)

	local chatNode = self:getView():getChildByName("chatNode")
	local leftRowPosX, leftRowPosY = self._leftFuncLayout:getPosition()
	local topRowPosX, topRowPosY = self._topFuncLayout:getPosition()
	local chatNodeRowPosX, chatNodeRowPosY = chatNode:getPosition()

	self._leftFuncLayout:setPositionX(leftRowPosX + 25)
	self._topFuncLayout:setPositionX(topRowPosX + 25)
	chatNode:setPositionY(chatNodeRowPosY + 42.2)
	self._leftFuncLayout:setOpacity(0)
	self._topFuncLayout:setOpacity(0)
	chatNode:setOpacity(0)
	mainMovieClip:addCallbackAtFrame(20, function ()
		self._leftFuncLayout:runAction(cc.Spawn:create(cc.FadeIn:create(0.21), cc.MoveBy:create(0.21, cc.p(-25, 0))))
		self._topFuncLayout:runAction(cc.Spawn:create(cc.FadeIn:create(0.21), cc.MoveBy:create(0.21, cc.p(-25, 0))))
		chatNode:runAction(cc.Spawn:create(cc.FadeIn:create(0.21), cc.MoveTo:create(0.21, cc.p(chatNodeRowPosX, chatNodeRowPosY))))
	end)

	local playerNode = self:getView():getChildByName("playerNode")
	local currencyInfoNode = self:getView():getChildByFullName("currencyinfo_node")
	local extraBtnNode = self:getView():getChildByFullName("extraActBtn")

	playerNode:setOpacity(0)
	currencyInfoNode:setOpacity(0)
	extraBtnNode:setOpacity(0)
	self._rightFuncLayout:getChildByFullName("extraActBtn"):setOpacity(0)
	mainMovieClip:addCallbackAtFrame(17, function ()
		playerNode:runAction(cc.FadeIn:create(0.21))
		currencyInfoNode:runAction(cc.FadeIn:create(0.21))
		extraBtnNode:runAction(cc.FadeIn:create(0.21))
		self._rightFuncLayout:getChildByFullName("extraActBtn"):runAction(cc.FadeIn:create(0.21))
	end)
	self._menuStateBtn:setOpacity(0)
	self._menuStateBtn:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.FadeIn:create(0.6)))
	performWithDelay(self:getView(), function ()
		local action = cc.CSLoader:createTimeline("asset/ui/MainScene.csb")

		self._urlFuncLayout:runAction(action)
		action:gotoFrameAndPlay(0, 25, false)
	end, 0.1)
	mainMovieClip:gotoAndPlay(0)
end

function HomeMediator:checkNewSystemUnlock()
	local blockCoroutine = nil
	blockCoroutine = coroutine.create(function ()
		local function resumeCoroutine()
			local status, str = coroutine.resume(blockCoroutine)
			str = str or ""

			assert(status, "系统解锁出错，错误信息为" .. str)
		end

		local delegate = {
			willClose = function (self)
				resumeCoroutine()
			end
		}

		if self._developSystem:getLevelupBackup() then
			local dataLv = {
				callBack = function ()
					resumeCoroutine()
				end
			}

			self._developSystem:popPlayerLvlUpView(dataLv)
			coroutine.yield()
		end

		local storyDirector = self:getInjector():getInstance(story.StoryDirector)
		local guideAgent = storyDirector:getGuideAgent()
		local developSystem = self:getInjector():getInstance(DevelopSystem)
		local level = developSystem:getPlayer():getLevel()

		if not guideAgent:isGuiding() then
			local systems = self._systemKeeper:getUnlockSystemsByType(UnlockAnimView.kHome)

			if systems and self:getView():isVisible() then
				for i = 1, #systems do
					dump(systems[i], "解锁的系统==")

					local targetNode = self:getNewSyatemTarget(systems[i])
					local targetPos = cc.p(0, 0)

					if targetNode then
						targetPos = targetNode:getParent():convertToWorldSpace(cc.p(targetNode:getPosition()))
					end

					local view = self:getInjector():getInstance("NewSystemView")

					self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
						maskOpacity = 0
					}, {
						targetPos = targetPos,
						systemData = systems[i],
						type = UnlockAnimView.kHome
					}, delegate))
					coroutine.yield(systems[i].Id)
				end
			end
		end

		if GameConfigs.closeGuide or not guideAgent:isGuiding() and level > 1 then
			if CommonUtils.GetSwitch("fn_announce_check_in") and self._loginSystem:getLoginUrl() and self._loginSystem:getIsShowAnnounce() then
				local delegate = {
					willClose = function (self, popupMediator, data)
						if popupMediator.resetData then
							popupMediator:resetData()
						end

						resumeCoroutine()
					end
				}
				local view = self:getInjector():getInstance("serverAnnounceViewNew")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
				}, {
					isDeductTime = 1
				}, delegate))
				coroutine.yield()
			end

			if CommonUtils.GetSwitch("fn_check_in") then
				local monthSignInSystem = self:getInjector():getInstance(MonthSignInSystem)

				if not monthSignInSystem:isTodaySign() then
					monthSignInSystem:showSignView(delegate)
					coroutine.yield()
				end
			end

			local activity = self._activitySystem:getActivityByComplexUI(ActivityType_UI.KActivityBlockHoliday)

			if activity then
				local supportActivityId = activity:getActivityConfig().ActivitySupport
				local supportActivity = self._activitySystem:getActivityById(supportActivityId)

				if supportActivity then
					local status = supportActivity:getPeriodStatus()

					if status == ActivitySupportStatus.Starting then
						local playerId = self:getDevelopSystem():getPlayer():getRid()
						local lastTime = cc.UserDefault:getInstance():getStringForKey(playerId .. supportActivity:getId(), 0)
						local curTime = self._gameServerAgent:remoteTimeMillis()
						local isSameDay = TimeUtil:isSameDay(lastTime / 1000, curTime / 1000, {
							sec = 0,
							min = 0,
							hour = 5
						})

						if not isSameDay then
							local view = self:getInjector():getInstance("ActivitySupportPailianHolidayView")

							self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
								transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
							}, {
								activityId = supportActivity:getId()
							}, delegate))
							cc.UserDefault:getInstance():setStringForKey(playerId .. supportActivity:getId(), curTime)
							coroutine.yield()
						end
					end
				end
			end
		end
	end)
	local status, str = coroutine.resume(blockCoroutine)
	str = str or ""

	assert(status, "主角升级弹窗出错,错误信息为" .. str)
end

function HomeMediator:setupCurrencyInfoWidget()
	local currencyInfoNode = self:getView():getChildByFullName("currencyinfo_node")
	local config = {
		CurrencyIdKind.kDiamond,
		CurrencyIdKind.kPower,
		CurrencyIdKind.kCrystal,
		CurrencyIdKind.kGold
	}
	local injector = self:getInjector()
	self._currencyInfoWidget = injector:injectInto(CurrencyInfoWidget:new(currencyInfoNode))

	self._currencyInfoWidget:mapEvent()
	self._currencyInfoWidget:updateCurrencyInfo(config)
end

function HomeMediator:initWidget()
	self._leftFuncLayout = self:getView():getChildByFullName("mLeftFuncLayout")
	self._rightFuncLayout = self:getView():getChildByFullName("mRightFuncLayout")
	self._bottomFuncLayout = self:getView():getChildByFullName("mBottomFuncLayout")
	self._topFuncLayout = self:getView():getChildByFullName("mTopFuncLayout")
	self._homePanel = self:getView():getChildByName("mHomePanel")
	self._showHeroPanel = self._homePanel:getChildByName("heroPanel")
	self._safeTouchLayout = self:getView():getChildByName("touchPanel")
	self._menuStateBtn = self:getView():getChildByName("unfoldMenuBtn")

	self._menuStateBtn:getChildByName("redPoint"):setLocalZOrder(100)

	self._fastGetResourceExBtn = self._menuStateBtn:getChildByName("fastGetResourceExBtn")
	self._urlFuncLayout = self:getView():getChildByFullName("URLAdjustNode.URLLayout")
	self._homeBgPanel = self:getView():getChildByFullName("homeBgPanel")
	local extraActBtn = self._rightFuncLayout:getChildByFullName("extraActBtn")

	AdjustUtils.adjustLayoutByType(extraActBtn, AdjustUtils.kAdjustType.Right)

	local mChallengeNode = self._rightFuncLayout:getChildByFullName("mChallengeNode")

	extraActBtn:setPosition(cc.p(mChallengeNode:getPositionX() - 80, mChallengeNode:getPositionY() - 90))

	local iconMc = cc.MovieClip:create("baoxiang_jiayuanshouqu")

	iconMc:addTo(self._menuStateBtn, 2, 10026)
	iconMc:setPlaySpeed(0.5)
	iconMc:gotoAndStop(1)
	iconMc:setPosition(cc.p(170, 66))

	local talkPanel = self._showHeroPanel:getChildByName("talkPanel")

	talkPanel:setLocalZOrder(5555)

	local text = talkPanel:getChildByFullName("clipNode.text")

	text:setLineSpacing(4)
	text:getVirtualRenderer():setMaxLineWidth(330)

	local bubbleBg = talkPanel:getChildByName("talkBg")
	self._primeTextPosX = text:getPositionX()
	self._primeTextPosY = text:getPositionY()

	bubbleBg:ignoreContentAdaptWithSize(true)

	local giftPanel = self._showHeroPanel:getChildByName("giftImg")

	giftPanel:setLocalZOrder(5557)

	local function callFunc()
		giftPanel:setVisible(false)

		local activity = self._activitySystem:getActivityById("FreeStamina")
		local curList = activity:getActivityConfig().FreeStamina
		local timeFragmentIndex = 0

		for i = 1, #curList do
			local status = self._activitySystem:isCanGetStamina(curList[i].Time, curList[i].Order)

			if status == StaminaRewardTimeStatus.kNow then
				timeFragmentIndex = i
			end
		end

		local param = {
			doActivityType = 101,
			index = timeFragmentIndex
		}

		self._activitySystem:requestDoActivity(DailyGift, param, function (response)
			local view = self:getInjector():getInstance("getRewardView")

			self:dispatch(ShowTipEvent({
				tip = Strings:get("Daily_Gift_Get")
			}))
			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
				needClick = true,
				rewards = response.data.reward
			}))
		end)
	end

	mapButtonHandlerClick(nil, giftPanel, {
		ignoreClickAudio = true,
		func = callFunc
	})

	local image1 = self:getView():getChildByFullName("adjustUtil.Image_3")

	AdjustUtils.ignorSafeAreaRectForNode(image1, AdjustUtils.kAdjustType.Left)

	local image2 = self:getView():getChildByFullName("adjustUtil.Image_2")

	AdjustUtils.ignorSafeAreaRectForNode(image2, AdjustUtils.kAdjustType.Right)

	local topFoldBtn = self._topFuncLayout:getChildByName("mFoldBtn")
	local mc = cc.MovieClip:create("yincang_xinzhujiemian")

	mc:addTo(topFoldBtn, -1)
	mc:setPosition(25, 15)
	mc:addCallbackAtFrame(16, function ()
		mc:stop()
	end)
	mc:addCallbackAtFrame(45, function ()
		mc:stop()
	end)
	mc:gotoAndStop(1)

	topFoldBtn.mc = mc

	local function callFunc(sender)
		local mc = sender.mc
		local isOpen = self._navigation:isTopOpen()

		if isOpen then
			mc:gotoAndPlay(30)
			self._navigation:closeTop()
		else
			mc:gotoAndPlay(1)
			self._navigation:openTop()
		end

		local isVisible = self._navigation:checkTopRedPoint()

		sender:getChildByFullName("redPoint"):setVisible(isVisible)

		local sequence = cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
			local bagNode = self._navigation._topLayout:getChildByFullName("mBagNode")
			local bagWorldPos = bagNode:convertToWorldSpace(cc.p(0, 0))

			self._buildingSystem:setBagWorldPos(bagWorldPos)
		end))

		self:getView():runAction(sequence)
	end

	mapButtonHandlerClick(nil, topFoldBtn, {
		ignoreClickAudio = true,
		func = callFunc
	})

	self._navigation = Navigation:new(self._bottomFuncLayout, self._rightFuncLayout, self._leftFuncLayout, self._topFuncLayout, self._urlFuncLayout, self:getInjector())

	callFunc(topFoldBtn)
	performWithDelay(self:getView(), function ()
		self._navigation._initDone = true
	end, 0.1)
end

function HomeMediator:setTextAnim()
	local talkPanel = self._showHeroPanel:getChildByName("talkPanel")
	local clipNode = talkPanel:getChildByName("clipNode")
	local text = clipNode:getChildByName("text")
	local textSizeHeight = text:getContentSize().height
	local clipNodeSizeHeight = clipNode:getContentSize().height

	if textSizeHeight > clipNodeSizeHeight - 5 then
		local offset = textSizeHeight - clipNodeSizeHeight + 10

		text:runAction(cc.Sequence:create(cc.DelayTime:create(3), cc.MoveTo:create(2.5 * offset / 25, cc.p(self._primeTextPosX, self._primeTextPosY + offset))))
	end
end

function HomeMediator:checkSoundUnlock(heroId, soundId)
	local hero = self._heroSystem:getHeroById(heroId)
	local sound = {
		config = ConfigReader:getRecordById("Sound", soundId),
		setUnlock = function (self, unlock)
		end,
		getUnlockDesc = function (self)
			return self.config.UnlockDesc
		end,
		getUnlockCondition = function (self)
			local unlock = self.config.Unlock or {}

			return unlock
		end
	}

	return self._heroSystem:getSoundUnlock(hero, sound)
end

function HomeMediator:setBoardHeroEffectState(isEnable, isEnterHome)
	local talkPanel = self._showHeroPanel:getChildByName("talkPanel")

	if isEnable then
		if not self._boardHeroEffect then
			self._boardHeroEffect = PREPARESTATE

			performWithDelay(talkPanel, function ()
				local soundId = nil

				if isEnterHome then
					soundId = AudioTimerSystem:getLoginAndEnterHomeSound(self._showHeroId)
				else
					soundId = AudioTimerSystem:getResumeHomeSound(self._showHeroId, self._climateDay)
				end

				local text = talkPanel:getChildByFullName("clipNode.text")

				talkPanel:setVisible(true)
				text:stopAllActions()
				text:setPosition(cc.p(self._primeTextPosX, self._primeTextPosY))

				local str = Strings:get(ConfigReader:getDataByNameIdAndKey("Sound", soundId, "SoundDesc"))

				text:setString(str)
				self:setTextAnim()

				self._boardHeroEffect = AudioEngine:getInstance():playRoleEffect(soundId, false, function ()
					self._boardHeroEffect = nil

					if checkDependInstance(self) then
						talkPanel:setVisible(false)
					end
				end)
			end, 1)
		end
	elseif self._boardHeroEffect then
		if self._boardHeroEffect == PREPARESTATE then
			talkPanel:stopAllActions()
		else
			AudioEngine:getInstance():stopEffect(self._boardHeroEffect)
		end

		talkPanel:setVisible(false)

		self._boardHeroEffect = nil
	end
end

function HomeMediator:changeHomeViewBg()
	local isRandom = self._settingSystem:getSettingModel():getRoleAndBgRandom()

	if isRandom then
		return
	end

	self._homeViewBgId = self._settingSystem:getHomeBgId()

	self:loadBgImageTab()
end

function HomeMediator:loadBgImageTab()
	local bgImageId = self._homeViewBgId
	local timeTable = ConfigReader:getDataByNameIdAndKey("HomeBackground", bgImageId, "Loop")
	local keyTab = formatUnorderTable(timeTable, function (a, b)
		local aParts = string.split(a, ":", nil, true)
		local bParts = string.split(b, ":", nil, true)
		local aStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = aParts[1],
			min = aParts[2],
			sec = aParts[3]
		})
		local bStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = bParts[1],
			min = bParts[2],
			sec = bParts[3]
		})

		return aStamp < bStamp
	end)
	self._switchBgTab = keyTab
	self._switchBgTag = -999
	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local stageSystem = self:getInjector():getInstance(StageSystem)
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local pointId = USER_GUIDE_START_MISSION
	local storyAgent = storyDirector:getStoryAgent()

	storyAgent:setSkipCheckSave(true)

	local point = stageSystem:getPointById(pointId)
	local level = developSystem:getPlayer():getLevel()
	local complexNum = storyAgent:getGuideComplexNum()

	if level ~= 1 or not point or point:isPass() or complexNum ~= kGuideComplexityList.none then
		local BGM = ConfigReader:getDataByNameIdAndKey("HomeBackground", bgImageId, "BGM")

		AudioEngine:getInstance():playBackgroundMusic(BGM)
		self._settingModel:setBGMusicId(BGM)
	end
end

function HomeMediator:loadBgImage()
	local curTimeStamp = self:getInjector():getInstance("GameServerAgent"):remoteTimestamp()
	local switchBgTag = #self._switchBgTab

	local function comp(switchTime, realTime)
		local parts = string.split(switchTime, ":", nil, true)
		local switchTimeStemp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = parts[1],
			min = parts[2],
			sec = parts[3]
		})

		return switchTimeStemp <= realTime
	end

	for k, v in ipairs(self._switchBgTab) do
		if not comp(self._switchBgTab[k], curTimeStamp) then
			switchBgTag = k - 1

			break
		end
	end

	if switchBgTag < 1 then
		switchBgTag = #self._switchBgTab
	end

	if switchBgTag == self._switchBgTag then
		return
	end

	local bgImage = self._homeBgPanel:getChildByName("bgImage")
	local flashPanel = self._homeBgPanel:getChildByName("bgFlashPanel")

	flashPanel:removeAllChildren()

	self._climateMc = nil

	bgImage:setVisible(false)

	self._switchBgTag = switchBgTag
	local timeTable = ConfigReader:getDataByNameIdAndKey("HomeBackground", self._homeViewBgId, "Loop")
	local tabValue = timeTable[self._switchBgTab[self._switchBgTag]]
	local BGBackgroundId = tabValue.BG
	local imageInfo = ConfigReader:getRecordById("BackGroundPicture", BGBackgroundId)
	local winSize = cc.Director:getInstance():getWinSize()

	if imageInfo.Picture and imageInfo.Picture ~= "" then
		bgImage:setVisible(true)
		bgImage:ignoreContentAdaptWithSize(true)
		bgImage:loadTexture("asset/scene/" .. imageInfo.Picture .. ".jpg")

		if winSize.height < 641 then
			bgImage:setScale(winSize.width / 1386 * 1.2)
		end
	end

	local flashId = imageInfo.Flash1

	if flashId and flashId ~= "" then
		local mc = cc.MovieClip:create(flashId)

		mc:addTo(flashPanel):center(flashPanel:getContentSize())

		self._mainBgMc = mc

		self:setClimateScene()

		if winSize.height < 641 then
			mc:setScale(winSize.width / 1386 * 1.2)
		end

		local extFlashId = imageInfo.Flash2

		if extFlashId and extFlashId ~= "" then
			local extMc = cc.MovieClip:create(extFlashId)

			if extMc then
				extMc:addTo(flashPanel):center(flashPanel:getContentSize())
				extMc:setScale(winSize.width / 1386 * 1.2)
			end
		end
	end

	if imageInfo.Extra and imageInfo.Extra ~= "" then
		local extraView = cc.CSLoader:createNode("asset/ui/" .. imageInfo.Extra .. ".csb")

		extraView:addTo(flashPanel):center(flashPanel:getContentSize())

		if winSize.height < 641 then
			extraView:setScale(winSize.width / 1386 * 1.2)
		end
	end
end

function HomeMediator:setClimateScene()
	if self._climateMc then
		self._climateMc:removeFromParent()

		self._climateMc = nil
	end

	if self._homeViewBgId == "HomeBackground_4" then
		if self._climateDay == ClimateType.Snow then
			self._climateDay = ClimateType.SnowS
		else
			self._climateDay = ClimateType.Snow
		end
	else
		local weathData = self._settingModel:getWeatherData()
		self._climateDay = GameStyle:getClimateById(weathData.conditionIdDay)
	end

	dump(self._climateDay, "今日天气为：")

	if Climate2LayerName[self._climateDay] and self._mainBgMc then
		local layer = self._mainBgMc:getChildByName(Climate2LayerName[self._climateDay])

		if layer then
			local climateMc = cc.MovieClip:create(Climate2MCName[self._climateDay])

			climateMc:addTo(layer)

			self._climateMc = climateMc
		end
	end
end

function HomeMediator:setBoardHeroSprite()
	self._touchTimes = 0
	local roleModel = IconFactory:getRoleModelByKey("HeroBase", self._showHeroId)
	local hero = self._heroSystem:getHeroById(self._showHeroId)
	local surfaceId = nil

	if hero then
		roleModel = hero:getModel()
		surfaceId = hero:getSurfaceId()
	end

	local heroSprite, _, spineani, picInfo = IconFactory:createRoleIconSprite({
		iconType = 6,
		id = roleModel,
		useAnim = self._settingModel:getRoleDynamic()
	})

	if spineani then
		spineani:registerSpineEventHandler(handler(self, self.spineAnimEvent), sp.EventType.ANIMATION_COMPLETE)

		self._sharedSpine = spineani
	else
		self._sharedSpine = nil
	end

	self._showHeroPanel:removeChildByTag(690)
	heroSprite:addTo(self._showHeroPanel):setTag(690)
	heroSprite:setPosition(cc.p(160, -70))
	heroSprite:setTouchEnabled(false)

	if surfaceId then
		local surfaceData = ConfigReader:getDataByNameIdAndKey("Surface", surfaceId, "ClickAction")
		local num = #surfaceData

		for i = 1, num do
			local _info = surfaceData[i]
			local touchPanel = ccui.Layout:create()

			touchPanel:setAnchorPoint(cc.p(0.5, 0.5))

			local point = _info.point
			local size = heroSprite:getContentSize()

			if point[1] == "all" then
				touchPanel:setContentSize(cc.size(size.width / 2 * picInfo.zoom, size.height * picInfo.zoom))
				touchPanel:setPosition(size.width / 2 + picInfo.Deviation[1], size.height / 2 + picInfo.Deviation[2])
			else
				touchPanel:setContentSize(cc.size(_info.range[1] * picInfo.zoom, _info.range[2] * picInfo.zoom))
				touchPanel:setPosition(cc.p(_info.point[1] * picInfo.zoom + picInfo.Deviation[1] + size.width / 2, _info.point[2] * picInfo.zoom + picInfo.Deviation[2]))
			end

			if GameConfigs.HERO_TOUCHVIEW_DEBUG then
				touchPanel:setBackGroundColorType(1)
				touchPanel:setBackGroundColor(cc.c3b(255, 0, 0))
				touchPanel:setBackGroundColorOpacity(180)
			end

			touchPanel:setTouchEnabled(true)
			touchPanel:addTouchEventListener(function (sender, eventType)
				if eventType == ccui.TouchEventType.ended then
					if self._sharedSpine and self._sharedSpine:hasAnimation(_info.action) then
						self._sharedSpine:playAnimation(0, _info.action, true)
					end

					self._touchTimes = self._touchTimes + 1

					if self._touchTimes >= 1 then
						self:openBoardHeroButton(self._touchTimes)
					end

					if self._boardHeroEffect then
						return
					end

					local soundId = AudioTimerSystem:getHeroTouchSoundByPart(self._showHeroId, _info.part, self._touchTimes)
					local isExistStr = Strings:get(ConfigReader:getDataByNameIdAndKey("Sound", soundId, "CueName"))

					if isExistStr and isExistStr ~= "Voice_Default" then
						local talkPanel = self._showHeroPanel:getChildByName("talkPanel")
						local text = talkPanel:getChildByFullName("clipNode.text")

						talkPanel:setVisible(true)
						text:stopAllActions()
						text:setPosition(cc.p(self._primeTextPosX, self._primeTextPosY))

						local trueSoundId = nil
						self._boardHeroEffect, trueSoundId = AudioEngine:getInstance():playRoleEffect(soundId, false, function ()
							self._boardHeroEffect = nil

							if checkDependInstance(self) then
								talkPanel:setVisible(false)
							end
						end)
						local str = Strings:get(ConfigReader:getDataByNameIdAndKey("Sound", trueSoundId, "SoundDesc"))

						text:setString(str)
						self:setTextAnim()

						self._lastClickSound = soundId
					end
				end
			end)
			touchPanel:addTo(heroSprite, num + 1 - i)
		end
	end
end

function HomeMediator:openBoardHeroButton(times)
	local afkBtn = self._showHeroPanel:getChildByName("afkBtn")

	afkBtn:stopAllActions()
	afkBtn:setVisible(true)
	performWithDelay(afkBtn, function ()
		afkBtn:setVisible(false)
	end, 5)

	if times == 1 then
		self._showHeroPanel:stopAllActions()
		performWithDelay(self._showHeroPanel, function ()
			self._touchTimes = 0
		end, 600)
	end
end

function HomeMediator:spineAnimEvent(event)
	if event.type == "complete" and event.animation ~= "animation" and self._sharedSpine then
		if event.animation == spineTouchEventName then
			spineTouchEventTag = false
		end

		self._sharedSpine:playAnimation(0, "animation", true)
	end
end

function HomeMediator:initActivityBanner()
	local view = self._urlFuncLayout:getChildByName("pageView")
	self._animName = {}
	local delegate = {}
	local outself = self

	function delegate:getPageNum()
		return #outself._animName
	end

	function delegate:getPageByIndex(index)
		return outself:getPageByIndex(index)
	end

	function delegate:pageTouchedAtIndex(index)
		outself:viewTouchEvent(index)
	end

	local data = {
		view = view,
		delegate = delegate
	}

	self:setPageViewIndicator()

	self._flipView = PageViewUtil:new(data)

	self._flipView:reloadData()
	self:enableBannerTimer()
end

function HomeMediator:enableBannerTimer()
	if self._bannerTimer then
		self._bannerTimer:stop()

		self._bannerTimer = nil
	end

	if #self._animName > 1 then
		local function bannerTimer()
			self._flipView:scrollToDirection(1, 1)
		end

		self._bannerTimer = LuaScheduler:getInstance():schedule(bannerTimer, 5, false)
	end
end

function HomeMediator:setPageViewIndicator()
	self:getBannerAct()

	local pageTipPanel = self._urlFuncLayout:getChildByName("pageTipPanel")

	pageTipPanel:removeAllChildren()

	local width = 0

	for i = 1, #self._animName do
		local img = ccui.ImageView:create("miam_qh_2.png", 1)

		img:setAnchorPoint(cc.p(0.5, 0.5))
		img:setTag(i)
		img:addTo(pageTipPanel)
		img:setPosition(cc.p((img:getContentSize().width + 8) * (i - 1), pageTipPanel:getContentSize().height / 2))

		width = img:getContentSize().width * i
	end

	pageTipPanel:setContentSize(cc.size(width, 50))

	if #self._animName == 0 then
		self._urlFuncLayout:setVisible(false)
	else
		self._urlFuncLayout:setVisible(true)
	end
end

function HomeMediator:getBannerAct()
	local _table = self._activitySystem._bannerData
	self._animName = {}
	local shopList = self._shopSystem:getPackageList()

	for _, bannerInfo in pairs(_table) do
		local bannerType = bannerInfo.Type

		if bannerType == ActivityBannerType.kPackageShop then
			local canBuyPackage = false
			local model = nil

			for _, v in ipairs(shopList) do
				if v._id == bannerInfo.TypeId and v._leftCount > 0 then
					canBuyPackage = true
					model = v

					break
				end
			end

			if canBuyPackage then
				self._animName[#self._animName + 1] = {
					bannerInfo = bannerInfo,
					model = model
				}
			end
		elseif bannerType == ActivityBannerType.kActivity then
			local activityId = bannerInfo.TypeId

			if self._activitySystem:isActivityOpen(activityId) and not self._activitySystem:isActivityOver(activityId) then
				self._animName[#self._animName + 1] = {
					bannerInfo = bannerInfo,
					id = activityId
				}
			end
		end
	end

	table.sort(self._animName, function (a, b)
		local aSortNum = a.bannerInfo.Sort
		local bSortNum = b.bannerInfo.Sort

		return aSortNum < bSortNum
	end)

	return #self._animName
end

function HomeMediator:reloadPageView()
	self:setPageViewIndicator()
	self._flipView:reloadData()
	self:enableBannerTimer()
end

function HomeMediator:getPageByIndex(index)
	local animData = self._animName[index]
	local image = animData.bannerInfo.Img
	local pageView = self._urlFuncLayout:getChildByName("pageView")
	local pageTipPanel = self._urlFuncLayout:getChildByName("pageTipPanel")
	local layout = ccui.Layout:create()

	layout:setName("mainLayout")
	layout:setAnchorPoint(cc.p(0, 0))
	layout:setPosition(cc.p(0, 0))
	layout:setContentSize(pageView:getContentSize())

	local image = ccui.ImageView:create("asset/ui/mainScene/" .. image, ccui.TextureResType.localType)

	image:addTo(layout):center(layout:getContentSize())

	for i = 1, #self._animName do
		local image = i == index and "miam_qh_1.png" or "miam_qh_2.png"

		pageTipPanel:getChildByTag(i):loadTexture(image, ccui.TextureResType.plistType)
	end

	return layout
end

function HomeMediator:viewTouchEvent(index)
	local animData = self._animName[index]
	local bannerInfo = animData.bannerInfo
	local bannerType = bannerInfo.Type

	if bannerType == ActivityBannerType.kPackageShop then
		local model = animData.model
		local view = self:getInjector():getInstance("ShopView")
		local shopId = "Shop_Package"
		local data = {
			shopId = shopId
		}

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))

		local view = self:getInjector():getInstance("ShopPackageView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			shopId = shopId,
			item = model
		}))
	elseif bannerType == ActivityBannerType.kActivity then
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

		local url = bannerInfo.Link
		local param = {}

		self:getEventDispatcher():dispatchEvent(Event:new(EVT_OPENURL, {
			url = url,
			extParams = param
		}))
	end
end

function HomeMediator:setupPlayerInfoWidget()
	local playInfoNode = self:getView():getChildByFullName("playerNode")
	self._playInfoWidget = self:getInjector():injectInto(PlayerInfoWidget:new(playInfoNode))

	self._playInfoWidget:initSubviews()
	self._playInfoWidget:setupView()
end

function HomeMediator:registerHomeViewEvent()
	self:loadBgImage()

	local function callFunc()
		local isActivity = self._activitySystem:hasRedPointForActivity(DailyGift)
		local giftImg = self._showHeroPanel:getChildByName("giftImg")

		if isActivity then
			giftImg:setVisible(true)
		else
			giftImg:setVisible(false)
		end

		self:loadBgImage()
	end

	self._playInfoWidget:registerTimerEvent(callFunc)
	schedule(self:getView(), function ()
		local soundId = AudioTimerSystem:getSixtySecendSoundId(self._showHeroId)
		local talkPanel = self._showHeroPanel:getChildByName("talkPanel")

		talkPanel:setVisible(true)

		local text = talkPanel:getChildByFullName("clipNode.text")

		text:stopAllActions()
		text:setPosition(cc.p(self._primeTextPosX, self._primeTextPosY))

		local str = Strings:get(ConfigReader:getDataByNameIdAndKey("Sound", soundId, "SoundDesc"))

		text:setString(str)

		ResidentSoundID = AudioEngine:getInstance():playRoleEffect(soundId, false, function ()
			if checkDependInstance(self) then
				talkPanel:setVisible(false)
			end

			ResidentSoundID = nil
		end)
	end, 600)
	performWithDelay(self:getView(), function ()
		self:setBoardHeroEffectState(true)
	end, 900)
end

function HomeMediator:showChat()
	local view = self:getInjector():getInstance("SmallChat")

	if view then
		view:setAnchorPoint(cc.p(0.5, 0.5))
		view:setPosition(cc.p(568, 320))

		local chatViewPanel = self:getView():getChildByName("chatNode")

		chatViewPanel:addChild(view)

		local mediator = self:getMediatorMap():retrieveMediator(view)

		if mediator then
			mediator:enterWithData(nil)

			self._chatMediator = mediator
		end
	end
end

function HomeMediator:setupChatFlowWidget()
	local chatFLowNode = self:getView():getChildByFullName("chat_flow_node")
	local chatFlowWidget = ChatFlowWidget:new(chatFLowNode)

	self:getInjector():injectInto(chatFlowWidget)
	chatFlowWidget:start(ChannelId.kHomeFlow)

	self._chatFlowWidget = chatFlowWidget
end

function HomeMediator:onMenuStateChange(sender, eventType)
	self._buildingSystem:tryEnter()
end

function HomeMediator:onCarnivalBtn(sender, eventType)
	AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
	self._activitySystem:tryEnterCarnival()
end

function HomeMediator:onClubResourcesBattleBtn(sender, eventType)
	AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
	self._clubSystem:tryEnterClubResourcesBattle()
end

function HomeMediator:onClickComplexBtn(ui)
	AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
	self._activitySystem:tryEnterComplexMainView(ui)
end

function HomeMediator:onFriendBtn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

	local friendSystem = self:getInjector():getInstance(FriendSystem)

	friendSystem:tryEnter({})
end

function HomeMediator:onRankBtn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

	local rankSystem = self:getInjector():getInstance(RankSystem)

	rankSystem:tryEnter()
end

function HomeMediator:onDownloadBtn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

	if self._settingSystem:canDownloadPortrait() then
		self._settingSystem:downloadPortrait()
	elseif self._settingSystem:canDownloadSoundCV() then
		self._settingSystem:downloadSoundCV()
	end
end

function HomeMediator:onMailBtn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

	local function getDataSucc()
		local view = self:getInjector():getInstance("MailView")
		local event = ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {}, nil)

		self:dispatch(event)
	end

	self._mailSystem:requestGetMailList(true, getDataSucc)
end

function HomeMediator:onForumBtn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	local urlData = ConfigReader:getRecordById("ConfigValue", "Game_Forum_Url")

	if urlData and urlData.content then
		cc.Application:getInstance():openURL(urlData.content)
	end
end

function HomeMediator:onRechargeBtn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Fold_1", false)

	local rechargeView = self:getInjector():getInstance("rechargeMainView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, rechargeView, nil, {
		tabType = 1
	}))
end

function HomeMediator:onGalleryBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		local gallerySystem = self:getInjector():getInstance("GallerySystem")

		gallerySystem:tryEnter()
	end
end

function HomeMediator:onShopBtn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	local unlock, unlockTips = self._systemKeeper:isUnlock("Shop_Unlock")

	if unlock then
		self._shopSystem:tryEnter({
			shopId = ShopSpecialId.kShopRecommend
		})
	else
		self:dispatch(ShowTipEvent({
			tip = unlockTips
		}))
	end
end

function HomeMediator:onRewardBtn(sender, type, model)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	local view = self:getInjector():getInstance("ShopView")
	local shopId = "Shop_Package"
	local data = {
		shopId = shopId
	}

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))

	local view = self:getInjector():getInstance("ShopPackageView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		shopId = shopId,
		item = model
	}))
end

function HomeMediator:onActivity1Btn(sender, type)
	if type == ccui.TouchEventType.ended then
		AudioEngine:getInstance():playEffect("Se_Click_Fold_1", false)

		local view = self:getInjector():getInstance("eightDayLoginView")
		local params = {}

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, params, nil, ))
	end
end

function HomeMediator:onActivity2Btn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Story_Common", false)

	local unlock, unlockTips = self._systemKeeper:isUnlock("Activity")

	if unlock then
		self._activitySystem:tryEnter()
	else
		self:dispatch(ShowTipEvent({
			tip = unlockTips
		}))
	end
end

function HomeMediator:onExploreBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		sender:setTouchEnabled(false)
		AudioEngine:getInstance():playEffect("Se_Click_Story_Dream", false)

		local node = self._rightBtns.mExploreNode
		local mainMc = node.iconMovieClip
		local mc = cc.MovieClip:create("dh_jinruzhuxian")

		mc:addTo(self:getView())
		mc:setPosition(cc.p(1000, 260))

		local mainPanel = mc:getChildByName("main")

		mainMc:changeParent(mainPanel)
		mc:gotoAndStop(0)

		local transition = {
			runTransitionAnimation = function (self, topNode, coverNode, endCallFunc)
				if not coverNode then
					endCallFunc()

					return
				end

				if not tolua.isnull(topNode) then
					topNode:setVisible(false)
				end

				local pushViewNode = nil

				for k, v in pairs(topNode:getChildren()) do
					pushViewNode = v

					break
				end

				pushViewNode:setOpacity(0)

				local layerColor = ccui.Layout:create()

				layerColor:setContentSize(cc.size(1386, 852))
				layerColor:setBackGroundColorType(1)
				layerColor:setBackGroundColor(cc.c3b(0, 0, 0))
				layerColor:setBackGroundColorOpacity(255)
				layerColor:setTouchEnabled(true)
				layerColor:addTo(topNode)

				local bgColor = ccui.Layout:create()

				bgColor:setContentSize(cc.size(1386, 852))
				bgColor:setBackGroundColorType(1)
				bgColor:setBackGroundColor(cc.c3b(0, 0, 0))
				bgColor:setBackGroundColorOpacity(255)
				bgColor:addTo(topNode, -1)
				mc:addCallbackAtFrame(45, function ()
					topNode:setVisible(true)

					local posX, posY = pushViewNode:getPosition()

					pushViewNode:setPosition(posX + 100, posY)
					pushViewNode:runAction(cc.Spawn:create(cc.MoveTo:create(0.3, cc.p(posX, posY)), cc.FadeIn:create(0.3)))
					layerColor:runAction(cc.Sequence:create(cc.FadeOut:create(0.3), cc.CallFunc:create(function ()
						if not tolua.isnull(bgColor) then
							layerColor:setBackGroundColorOpacity(0)
							bgColor:removeFromParent(true)
						end
					end)))
				end)
				mc:addCallbackAtFrame(57, function ()
					mc:stop()
					mc:removeFromParent(true)
					layerColor:removeFromParent(true)

					local fixedMc = node.movieClip

					fixedMc:gotoAndStop(0)

					local iconView = cc.MovieClip:create("baoshi_lingxingbaoshi")

					iconView:setPosition(cc.p(0, 0))

					node.iconMovieClip = iconView

					fixedMc:getChildByName("Icon"):addChild(iconView)
					sender:setTouchEnabled(true)
					endCallFunc()
				end)
				mc:gotoAndPlay(24)
			end
		}

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, self:getInjector():getInstance("CommonStageMainView"), {
			transition = transition
		}, {}))
	end
end

function HomeMediator:onArena1Btn(sender, type)
	if type == ccui.TouchEventType.ended then
		local unlock, tips = self._systemKeeper:isUnlock("Arena_All")

		if not unlock then
			self:dispatch(ShowTipEvent({
				tip = tips
			}))

			return
		end

		AudioEngine:getInstance():playEffect("Se_Click_Story_Common", false)

		local view = self:getInjector():getInstance("FunctionEntranceView")
		local event = ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
			style = 1,
			title = Strings:get("FUNCTION_ENTRANCE_TITLE2")
		})

		self:dispatch(event)
	end
end

function HomeMediator:onChallengeBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		local unlock, tips = self._systemKeeper:isUnlock("BlockSp_All")

		if not unlock then
			self:dispatch(ShowTipEvent({
				tip = tips
			}))

			return
		end

		AudioEngine:getInstance():playEffect("Se_Click_Story_Common", false)

		local view = self:getInjector():getInstance("EntranceGodhandView")
		local event = ViewEvent:new(EVT_PUSH_VIEW, view, nil, )

		self:dispatch(event)
	end
end

function HomeMediator:onOpenWorldBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		AudioEngine:getInstance():playEffect("Se_Click_Story_Common", false)

		local exploreSystem = self:getInjector():getInstance(ExploreSystem)

		exploreSystem:tryEnter()
	end
end

function HomeMediator:onGuildBtn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	local unlock, unlockTips = self._systemKeeper:isUnlock("Club_System")

	if unlock then
		AudioEngine:getInstance():playEffect("Se_Click_Story_Common", false)

		local clubSystem = self:getInjector():getInstance(ClubSystem)

		clubSystem:tryEnter()
	else
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = unlockTips
		}))
	end
end

function HomeMediator:onRecruitHeroBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		local recruitSystem = self:getInjector():getInstance("RecruitSystem")

		recruitSystem:tryEnter()

		local customDataSystem = self:getInjector():getInstance(CustomDataSystem)
		local pointFirstPassCheck1 = customDataSystem:getValue(PrefixType.kGlobal, "M02S01_FirstPassState", "false")
		local pointFirstPassCheck2 = customDataSystem:getValue(PrefixType.kGlobal, "M03S04_FirstPassState", "false")

		if pointFirstPassCheck1 == "true" then
			customDataSystem:setValue(PrefixType.kGlobal, "M02S01_FirstPassState", "false")
		end

		if pointFirstPassCheck2 == "true" then
			customDataSystem:setValue(PrefixType.kGlobal, "M03S04_FirstPassState", "false")
		end
	end
end

function HomeMediator:onPackageBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

		local bagView = self:getInjector():getInstance("BagView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, bagView, nil))
	end
end

function HomeMediator:onCardsGroupBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		AudioEngine:getInstance():playEffect("Se_Click_Story_Common", false)

		local unlock, tips = self._systemKeeper:isUnlock("Hero_Group")

		if not unlock then
			self:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = tips
			}))

			return
		end

		local customDataSystem = self:getInjector():getInstance(CustomDataSystem)

		customDataSystem:setValue(PrefixType.kGlobal, "StageTeamRed", "0")

		local view = self:getInjector():getInstance("StageTeamView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil))
	end
end

function HomeMediator:onDigimonBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

		local view = self:getInjector():getInstance("HeroShowListView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil))

		local customDataSystem = self:getInjector():getInstance(CustomDataSystem)
		local pointFirstPassCheck1 = customDataSystem:getValue(PrefixType.kGlobal, "S02S02_FirstPassState", "false")
		local pointFirstPassCheck2 = customDataSystem:getValue(PrefixType.kGlobal, "M03S02_FirstPassState", "false")

		if pointFirstPassCheck1 == "true" then
			customDataSystem:setValue(PrefixType.kGlobal, "S02S02_FirstPassState", "false")
		end

		if pointFirstPassCheck2 == "true" then
			customDataSystem:setValue(PrefixType.kGlobal, "M03S02_FirstPassState", "false")
		end
	end
end

function HomeMediator:onLeadBtn(sender, type)
	if type ~= ccui.TouchEventType.ended then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

	local masterSystem = self._developSystem:getMasterSystem()

	masterSystem:tryEnter()
end

function HomeMediator:onTaskBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

		local taskSystem = self:getInjector():getInstance("TaskSystem")

		taskSystem:tryEnter()
	end
end

function HomeMediator:onMazeBtn(sender, type)
	if type == ccui.TouchEventType.ended then
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

		local mazeSystem = self:getInjector():getInstance("MazeSystem")

		mazeSystem:tryEnter()
	end
end

function HomeMediator:initButtons(config)
	self._leftBtns = {}
	self._bottomBtns = {}
	self._topBtns = {}
	self._rightBtns = {}
	local language = getCurrentLanguage()

	for layout, nodes in pairs(config) do
		for node, controls in pairs(nodes) do
			local btn = self:getView():getChildByFullName(layout .. "." .. node)

			if layout == "mLeftFuncLayout" then
				self._leftBtns[node] = btn
			elseif layout == "mTopFuncLayout" then
				self._topBtns[node] = btn
			elseif layout == "mBottomFuncLayout" then
				self._bottomBtns[node] = btn
			elseif layout == "mRightFuncLayout" then
				self._rightBtns[node] = btn
			end

			if node == "mDownNode" then
				self._downloadBtn = btn
			end

			for name, infos in pairs(controls) do
				local fullName = layout .. "." .. node .. "." .. name

				if name == "mBtn" then
					local ccsbutton = self:getView():getChildByFullName(fullName)
					local image = ccui.ImageView:create(infos.normal, ccui.TextureResType.userDataType)

					ccsbutton:loadTextureNormal(infos.normal, ccui.TextureResType.userDataType)
					ccsbutton:loadTexturePressed(infos.press, ccui.TextureResType.userDataType)
					ccsbutton:setContentSize(image:getContentSize())

					if layout == "mTopFuncLayout" then
						ccsbutton:setScale(0.5)
					end
				elseif name == "mFunc" then
					local func = self[infos]
					local touchLayer = self:getView():getChildByFullName(layout .. "." .. node .. ".mTouchLayer")

					if touchLayer then
						touchLayer:addTouchEventListener(function (sender, eventType)
							func(self, sender, eventType)
						end)
					else
						local btn = self:getView():getChildByFullName(layout .. "." .. node .. ".mBtn")

						btn:addTouchEventListener(function (sender, eventType)
							func(self, sender, eventType)
						end)
					end
				elseif name == "redPointFunc" then
					local func = self[infos]
					local redPointNode = btn:getChildByName("mRedSprite")
					local redPoint = RedPoint:new(redPointNode, nil, function ()
						return func(self)
					end)
					btn.redPoint = redPoint
				elseif name == "redPointPos" then
					local redPointNode = btn:getChildByName("mRedSprite")

					redPointNode:setPosition(infos)
				elseif name == "mMovieClip" then
					local movieClipNode = self:getView():getChildByFullName(fullName)
					local movieClip = cc.MovieClip:create(infos.name)

					movieClip:addCallbackAtFrame(30, function ()
						movieClip:stop()
					end)
					movieClip:stop()
					movieClip:addTo(movieClipNode):center(movieClipNode:getContentSize())

					local node = self:getView():getChildByFullName(layout .. "." .. node)
					node.movieClip = movieClip

					convertNodeToWorldSpaceWithPos(node, infos.pos)
					AdjustUtils.adjustLayoutByType(node, AdjustUtils.kAdjustType.Right)
				elseif name == "mLabel" then
					local mLabel = self:getView():getChildByFullName(fullName)
					local mLabelName = mLabel:getChildByName("mLabelName")

					mLabelName:setString(Strings:get(infos.mLabelNames))
					mLabelName:setFontSize(infos.fontSize)

					local mTempName = mLabel:getChildByName("mTempName")

					mTempName:setString(Strings:get(infos.mTempName))

					local image = mLabel:getChildByName("autoImage")
					local size = image:getContentSize()
					local setWidth = infos.autoImageW and infos.autoImageW or size.width
					local setHeight = infos.autoImageH and infos.autoImageH or size.height

					image:setContentSize(cc.size(setWidth, setHeight))

					local parentMc = self:getView():getChildByFullName(layout .. "." .. node).movieClip

					if parentMc then
						local mcPanel = parentMc:getChildByName("mBtnName")

						mLabel:changeParent(mcPanel):center(mcPanel:getContentSize())
					end
				elseif name == "mTempName" then
					local tempNameText = self:getView():getChildByFullName(fullName)

					assert(tempNameText ~= nil, "error:templName=" .. fullName .. " not found")
					tempNameText:setString(Strings:get(infos))
				elseif name == "mLabelName" then
					local nameLabel = self:getView():getChildByFullName(fullName)

					nameLabel:setString(Strings:get(infos))
					nameLabel:enableOutline(cc.c4b(53, 37, 69, 191.25), 1)
				elseif name == "mLabelNames" then
					local nameLabel = self:getView():getChildByFullName(fullName)

					nameLabel:setString(Strings:get(infos))
				elseif name == "mLabelNames_2" then
					local nameLabel = self:getView():getChildByFullName(fullName)

					nameLabel:setString(Strings:get(infos))
				elseif name == "mLangDesc" then
					local mLangDesc = self:getView():getChildByFullName(fullName)

					mLangDesc:setString(infos)
				end
			end
		end
	end
end

function HomeMediator:getNewSyatemTarget(data)
	local config = {
		Friend_Entrance = self._topBtns.mFriendNode,
		BlockSp_Entrance = self._rightBtns.mChallengeNode,
		BlockSp_Gold = self._rightBtns.mChallengeNode,
		BlockSp_Crystal = self._rightBtns.mChallengeNode,
		BlockSp_Exp = self._rightBtns.mChallengeNode,
		Arena_System = self._rightBtns.mArena1Node,
		KOF = self._rightBtns.mArena1Node,
		Stage_Practice = self._rightBtns.mChallengeNode,
		Elite_Block = self._rightBtns.mExploreNode,
		Draw_Hero = self._rightBtns.mRecruitEquipNode,
		Draw_Equip = self._rightBtns.mRecruitEquipNode,
		Club_System = self._rightBtns.mGuildNode,
		Hero_Gallery = self._leftBtns.mPhotoNode,
		Hero_Quality = self._leftBtns.mServantNode,
		Hero_Skill = self._leftBtns.mServantNode,
		Hero_StarUp = self._leftBtns.mServantNode,
		Hero_Soul = self._bottomBtns.mServantNode,
		Hero_LevelUp = self._leftBtns.mServantNode,
		Equip_LevelUp = self._leftBtns.mServantNode,
		Task_System = self._leftBtns.mTaskNode,
		Task_Achievement = self._leftBtns.mTaskNode,
		MainTask = self._leftBtns.mTaskNode,
		GrowTask = self._leftBtns.mTaskNode,
		DailyQuest = self._leftBtns.mTaskNode,
		Shop_Mystery = self._leftBtns.mShopNode,
		Shop_Groceries = self._leftBtns.mShopNode,
		Master_Auras = self._leftBtns.mLeadNode,
		Master_Equip = self._leftBtns.mLeadNode,
		Master_Core = self._leftBtns.mLeadNode,
		Master_StarUp = self._leftBtns.mLeadNode,
		Master_Skill = self._leftBtns.mLeadNode,
		Hero_Gift = self._leftBtns.mPhotoNode,
		Hero_Sound = self._leftBtns.mServantNode,
		Hero_Group = self._rightBtns.mCardsGroupNode,
		Equip_StarUp = self._leftBtns.mServantNode,
		Map_Explore = self._rightBtns.mChallengeNode,
		Unlock_Tower_1 = self._rightBtns.mChallengeNode,
		Crusade = self._rightBtns.mChallengeNode,
		Village_Building = self:getView():getChildByFullName("unfoldMenuBtn.Image_156")
	}

	return config[data.Id]
end

function HomeMediator:triggerGuide()
	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local stageSystem = self:getInjector():getInstance(StageSystem)
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local pointId = USER_GUIDE_START_MISSION
	local storyLink = "story_choose"
	local storyAgent = storyDirector:getStoryAgent()

	storyAgent:setSkipCheckSave(true)

	local point = stageSystem:getPointById(pointId)
	local level = developSystem:getPlayer():getLevel()
	local complexNum = storyAgent:getGuideComplexNum()

	if level == 1 and point and not point:isPass() and complexNum == kGuideComplexityList.none then
		storyAgent:trigger(storyLink, nil, function ()
			self:runGuide()
		end)
	else
		self:runGuide()
	end
end

function HomeMediator:runGuide()
	if GameConfigs.closeGuide then
		return
	end

	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local guideAgent = storyDirector:getGuideAgent()
	local guideSaved = guideAgent:isSaved("GUIDE_SKIP_ALL")

	if guideSaved then
		GameConfigs.closeGuide = true

		return
	end

	local stageSystem = self:getInjector():getInstance(StageSystem)
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local guideSystem = self:getInjector():getInstance(GuideSystem)
	local level = developSystem:getPlayer():getLevel()
	local scriptNames = {
		"guide_chapterOne1_4"
	}

	local function conditions(context)
		local function point1Cond()
			local point = stageSystem:getPointById("M01S01")

			if point and point:isPass() then
				return true
			end

			return false
		end

		local function point2Cond()
			local point = stageSystem:getPointById("M01S02")

			if point and point:isPass() then
				return true
			end

			return false
		end

		local function point3Cond()
			local point = stageSystem:getPointById("M01S03")

			if point and point:isPass() then
				return true
			end

			if point2Cond() == false then
				return true
			end

			return false
		end

		local function story1Cond()
			local point = stageSystem:getPointById("S01S01")

			if point and point:isPass() then
				return true
			end

			return false
		end

		local function story2Cond()
			if guideSystem:getPassStory1_2() then
				return true
			end

			return false
		end

		local function recruitCond()
			if guideSystem:getRecruitHeroSta() == false then
				return true
			end

			return false
		end

		local function embattleCond()
			local team = developSystem:getTeamByType(StageTeamType.STAGE_NORMAL)

			if team:getHeroes()[2] then
				return true
			end

			return false
		end

		local function point4Cond()
			local point = stageSystem:getPointById("M01S04")

			if point and point:isPass() then
				return true
			end

			if point2Cond() == false then
				return true
			end

			return false
		end

		context:setGuideCond("guide_enter_stage", point2Cond)
		context:setGuideCond("guide_main_point_1_1", point1Cond)
		context:setGuideCond("guide_main_point_1_2", point2Cond)
		context:setGuideCond("guide_recruit_hero", recruitCond)
		context:setGuideCond("guide_main_point_1_3", point3Cond)
		context:setGuideCond("guide_main_story_2", story2Cond)
		context:setGuideCond("guide_main_embattle", embattleCond)
		context:setGuideCond("guide_main_point_1_4", point4Cond)
	end

	local function runGuide1to4()
		local guideSaved = guideAgent:isSaved(scriptNames)

		if not guideSaved then
			guideAgent:trigger(scriptNames, conditions, nil)
		end

		if not guideAgent:isGuiding() then
			guideSystem:runGuideByStage()
		end
	end

	local storyLink = "story01_1a"
	local pointId = USER_GUIDE_START_MISSION
	local storyAgent = storyDirector:getStoryAgent()

	storyAgent:setSkipCheckSave(true)

	local point = stageSystem:getPointById(pointId)
	local level = developSystem:getPlayer():getLevel()

	if level == 1 and point and not point:isPass() then
		stageSystem:requestStoryPass(pointId, function ()
		end)
		storyAgent:trigger(storyLink, nil, function ()
			runGuide1to4()
		end)
	else
		runGuide1to4()
	end
end

function HomeMediator:setupClickEnvs(sta)
	if GameConfigs.closeGuide then
		return
	end

	if sta or self._setupClickEnvs then
		self._setupClickEnvs = true
	else
		return
	end

	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local guideAgent = storyDirector:getGuideAgent()
	local targetNode_4 = self._rightBtns.mCardsGroupNode

	storyDirector:setClickEnv("home.cardsGroup_btn", targetNode_4, function (sender, eventType)
		self:onCardsGroupBtn(sender, eventType)
	end)

	local sequence = cc.Sequence:create(cc.DelayTime:create(1.2), cc.CallFunc:create(function ()
		local targetNode_1 = self._leftBtns.mTaskNode

		storyDirector:setClickEnv("home.task_btn", targetNode_1, function (sender, eventType)
			self:onTaskBtn(sender, eventType)
		end)

		local targetNode_2 = self._rightBtns.mExploreNode

		storyDirector:setClickEnv("home.explore_btn", targetNode_2, function (sender, eventType)
			self:onExploreBtn(sender, eventType)
		end)

		local targetNode_3 = self._rightBtns.mRecruitEquipNode

		storyDirector:setClickEnv("home.recruitEquip_btn", targetNode_3, function (sender, eventType)
			self:onRecruitHeroBtn(sender, eventType)
		end)

		local targetNode_5 = self._leftBtns.mServantNode

		storyDirector:setClickEnv("home.servant_btn", targetNode_5, function (sender, eventType)
			self:onDigimonBtn(sender, eventType)
		end)

		local targetNode_6 = self._rightBtns.mChallengeNode

		storyDirector:setClickEnv("home.challenge_btn", targetNode_6, function (sender, eventType)
			self:onChallengeBtn(sender, eventType)
		end)

		local targetNode_7 = self._leftBtns.mLeadNode

		storyDirector:setClickEnv("home.master_btn", targetNode_7, function (sender, eventType)
			self:onLeadBtn(sender, eventType)
		end)

		local targetNode_8 = self._leftBtns.mPhotoNode

		storyDirector:setClickEnv("home.photo_btn", targetNode_8, function (sender, eventType)
			self:onGalleryBtn(sender, eventType)
		end)

		local targetNode_9 = self._rightBtns.mArena1Node

		storyDirector:setClickEnv("home.arena_btn", targetNode_9, function (sender, eventType)
			self:onArena1Btn(sender, eventType)
		end)

		local targetNode_10 = self._rightBtns.mGuildNode

		storyDirector:setClickEnv("home.guild_btn", targetNode_10, function (sender, eventType)
			self:onGuildBtn(sender, eventType)
		end)

		local targetNode_11 = self._rightBtns.mOpenWorld

		storyDirector:setClickEnv("home.openWorld_btn", targetNode_11, function (sender, eventType)
			self:onOpenWorldBtn(sender, eventType)
		end)

		local targetNode_12 = self._rightBtns.mLabyrinth

		storyDirector:setClickEnv("home.mLabyrinth_btn", targetNode_12, function (sender, eventType)
			self:onLabyrinthBtn(sender, eventType)
		end)

		local targetNode_13 = self:getView():getChildByFullName("unfoldMenuBtn")

		storyDirector:setClickEnv("home.village_btn", targetNode_13, function (sender, eventType)
			AudioEngine:getInstance():playEffect("Se_Click_Home_1", false)
			self:onMenuStateChange(sender, eventType)
		end)

		local targetNode_14 = self._rightFuncLayout:getChildByFullName("mActivity2Node")

		storyDirector:setClickEnv("home.activity", targetNode_14, function (sender, eventType)
			local activitySystem = self:getInjector():getInstance(ActivitySystem)

			activitySystem:tryEnter({
				id = "__DaySign__"
			})
		end)

		local targetNode_15 = self._navigation._topLayout:getChildByFullName("mMailNode")

		storyDirector:setClickEnv("home.mail", targetNode_15, function (sender, eventType)
			self:onMailBtn(sender, eventType)
		end)
		storyDirector:notifyWaiting("enter_home_view")
	end))

	self:getView():runAction(sequence)
	self:triggerGuide()
	self:setupGuideAnim()
	self:getView():runAction(cc.CallFunc:create(function ()
		storyDirector:notifyWaiting("enter_home_view_init")
	end))
end

function HomeMediator:setupGuideAnim()
	if GameConfigs.closeGuide then
		if self._circleAnim then
			self._circleAnim:removeFromParent(true)

			self._circleAnim = nil
		end

		return
	end

	local stageSystem = self:getInjector():getInstance(StageSystem)
	local targetNode = self._rightBtns.mExploreNode
	local pointId = ConfigReader:getDataByNameIdAndKey("ConfigValue", "NewPlayerGuide_EndBlockPoint", "content") or "M03S06"
	local point = stageSystem:getPointById(pointId)
	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local guideAgent = storyDirector:getGuideAgent()
	local maxTeamPetNum = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Player_Init_DeckNum", "content") + self._developSystem:getBuildingCardEffValue()
	local ownHeroList = self._heroSystem:getOwnHeroIds()
	local tscriptNames = "guide_ToTeamOption"
	local guideSaved = guideAgent:isSaved(tscriptNames)

	if not guideAgent:isGuiding() and not guideSaved and #ownHeroList > 3 and maxTeamPetNum > 3 then
		guideAgent:trigger(tscriptNames, nil, )
	end

	if self._circleAnim then
		if point:isPass() then
			self._circleAnim:removeFromParent(true)

			self._circleAnim = nil
		elseif guideAgent:isGuiding() then
			self._circleAnim:setVisible(false)
		elseif not guideAgent:isGuiding() then
			self._circleAnim:setVisible(true)
		end
	elseif not guideAgent:isGuiding() and targetNode and point and not point:isPass() then
		local animNode = cc.Node:create()

		animNode:addTo(targetNode):center(targetNode:getContentSize()):offset(0, 0)

		local circleAnim = cc.MovieClip:create("anim_xinyindaoguangquan")

		circleAnim:addTo(animNode):center(animNode:getContentSize()):offset(0, 0)

		local handAnim = cc.MovieClip:create("xiaoshou_xinshouyindao")

		handAnim:addTo(animNode):center(animNode:getContentSize()):offset(5, -5)

		local handNode = handAnim:getChildByName("handNode")

		if handNode then
			local image = ccui.ImageView:create("xsyd_shou.png", ccui.TextureResType.plistType)

			image:addTo(handNode)
		end

		self._circleAnim = animNode
	end
end

function HomeMediator:refreshRedPoint()
	for _, v in pairs(self._leftBtns) do
		local _redPointNode = v.redPoint

		if _redPointNode then
			_redPointNode:refresh()
		end
	end

	for _, v in pairs(self._topBtns) do
		local _redPointNode = v.redPoint

		if _redPointNode then
			_redPointNode:refresh()
		end
	end

	for _, v in pairs(self._bottomBtns) do
		local _redPointNode = v.redPoint

		if _redPointNode then
			_redPointNode:refresh()
		end
	end

	for _, v in pairs(self._rightBtns) do
		local _redPointNode = v.redPoint

		if _redPointNode then
			_redPointNode:refresh()
		end
	end

	self:checkExtraRedPoint()
end

function HomeMediator:passiveRefreshRedPoint(event)
	local data = event:getData().type

	if data and data == 1 then
		local btn = self._topBtns.mMailNode

		btn.redPoint:refresh()
	elseif data and data == 2 then
		local btn = self._topBtns.mFriendNode
		local redPointState = event:getData().showRedPoint

		if redPointState and redPointState == 1 then
			local redPointNode = btn:getChildByName("mRedSprite")

			redPointNode:setVisible(true)
		else
			btn.redPoint:refresh()
		end
	elseif data and data == 3 then
		local btn = self._rightBtns.mArena1Node

		btn.redPoint:refresh()
	elseif data and data == 4 then
		local btn = self._rightBtns.mGuildNode
		local redPointState = event:getData().showRedPoint

		if redPointState == 1 then
			btn:getChildByName("mRedSprite"):setVisible(true)
		elseif redPointState == -1 then
			btn:getChildByName("mRedSprite"):setVisible(false)
		end

		local customDataSystem = self:getInjector():getInstance(CustomDataSystem)
		local playerClubId = self._clubSystem:getClubId()

		customDataSystem:setValue(PrefixType.kGlobal, "clubId", playerClubId, false)
	elseif data and data == 5 then
		local btn = self._topBtns.mRankNode

		if btn and btn.redPoint then
			btn.redPoint:refresh()
		end
	end

	local topFoldBtn = self._topFuncLayout:getChildByName("mFoldBtn")
	local isVisible = self._navigation:checkTopRedPoint()

	topFoldBtn:getChildByFullName("redPoint"):setVisible(isVisible)
end

function HomeMediator:setShowHero(event)
	local data = event:getData()
	local setHeroId = data.heroId
	local isRandom = self._settingSystem:getSettingModel():getRoleAndBgRandom()

	if isRandom then
		return
	end

	self._showHeroId = setHeroId

	self:setBoardHeroSprite()
end

function HomeMediator:mailRedPoint()
	local mailSystem = self:getInjector():getInstance(MailSystem)

	return mailSystem:queryRedPointState()
end

function HomeMediator:rankRedPoint()
	local rankSystem = self:getInjector():getInstance(RankSystem)

	return rankSystem:getRewardRedPoint()
end

function HomeMediator:friendRedPoint()
	local friendSystem = self:getInjector():getInstance(FriendSystem)

	return friendSystem:queryRedPointState()
end

function HomeMediator:activityRedPoint()
	return self._activitySystem:getHomeRedPointSta()
end

function HomeMediator:firstRechargeRedPoint()
	local player = self:getDevelopSystem():getPlayer()
	local rechargeState = player:getFirstRecharge()

	if rechargeState == 1 then
		return true
	else
		return false
	end
end

function HomeMediator:arenaRedPoint()
	local unlock = self._systemKeeper:isUnlock("Arena_All")

	if not unlock then
		return false
	end

	local arenaSystem = self:getInjector():getInstance(ArenaSystem)
	local petRaceSystem = self:getInjector():getInstance(PetRaceSystem)

	return arenaSystem:checkAwardRed() or petRaceSystem:redPointShow()
end

function HomeMediator:exploreRedPoint()
	local exploreSystem = self:getInjector():getInstance(ExploreSystem)

	return exploreSystem:checkIsShowRedPoint()
end

function HomeMediator:heroRedPoint()
	local heroSystem = self._developSystem:getHeroSystem()
	local customDataSystem = self:getInjector():getInstance(CustomDataSystem)
	local pointFirstPassCheck1 = customDataSystem:getValue(PrefixType.kGlobal, "S02S02_FirstPassState", "false")
	local pointFirstPassCheck2 = customDataSystem:getValue(PrefixType.kGlobal, "M03S02_FirstPassState", "false")

	return pointFirstPassCheck1 == "true" or pointFirstPassCheck2 == "true" or heroSystem:checkIsShowRedPoint()
end

function HomeMediator:teamRedPoint()
	local unlock, tips = self._systemKeeper:isUnlock("Hero_Group")

	if not unlock then
		return false
	end

	local stageSystem = self:getInjector():getInstance(StageSystem)

	return stageSystem:checkIsShowRedPoint()
end

function HomeMediator:recruitRedPoint()
	local recruitSystem = self:getInjector():getInstance(RecruitSystem)
	local customDataSystem = self:getInjector():getInstance(CustomDataSystem)
	local pointFirstPassCheck1 = customDataSystem:getValue(PrefixType.kGlobal, "M02S01_FirstPassState", "false")
	local pointFirstPassCheck2 = customDataSystem:getValue(PrefixType.kGlobal, "M03S04_FirstPassState", "false")

	return pointFirstPassCheck1 == "true" or pointFirstPassCheck2 == "true" or recruitSystem:checkIsShowRedPoint()
end

function HomeMediator:taskRedPoint()
	local taskSystem = self:getInjector():getInstance(TaskSystem)

	return taskSystem:checkIsShowRedPoint()
end

function HomeMediator:galleryRedPoint()
	local gallerySystem = self:getInjector():getInstance(GallerySystem)

	return gallerySystem:checkIsShowRedPoint()
end

function HomeMediator:shopRedPoint()
	return self._shopSystem:getRedPoint()
end

function HomeMediator:bagRedPoint()
	local bagSystem = self:getInjector():getInstance(BagSystem)

	return bagSystem:isBagRedPointShow()
end

function HomeMediator:challengeRedPoint()
	local spStageSystem = self:getInjector():getInstance(SpStageSystem)
	local stagePracticeSystem = self:getInjector():getInstance(StagePracticeSystem)
	local crusadeSystem = self:getInjector():getInstance(CrusadeSystem)

	return spStageSystem:checkIsShowRedPoint() or stagePracticeSystem:checkAwardRed() or crusadeSystem:canCrusadeSweep() or crusadeSystem:crusadeRedPointState()
end

function HomeMediator:onMainChapterRedPoint()
	local stageSystem = self:getInjector():getInstance(StageSystem)

	return stageSystem:hasHomeRedPoint()
end

function HomeMediator:masterRedPoint()
	local masterSystem = self._developSystem:getMasterSystem()

	return masterSystem:checkIsShowRedPoint()
end

function HomeMediator:onClubRedPoint()
	local clubSystem = self:getInjector():getInstance(ClubSystem)

	return clubSystem:hasHomeRedPoint() or clubSystem:hasHomeActivityRedPoint()
end

function HomeMediator:checkClubRedPoint()
	local customDataSystem = self:getInjector():getInstance(CustomDataSystem)
	local clubSystem = self._clubSystem
	local clubIdInfo = customDataSystem:getValue(PrefixType.kGlobal, "clubId")
	local playerClubId = clubSystem:getClubId()

	if clubIdInfo ~= playerClubId then
		customDataSystem:setValue(PrefixType.kGlobal, "clubId", playerClubId)

		local clubRedPoint = self._rightBtns.mGuildNode

		clubRedPoint:getChildByName("mRedSprite"):setVisible(true)
	end

	local unlock, unlockTips = self._systemKeeper:isUnlock("Club_System")

	if not unlock then
		local clubRedPoint = self._rightBtns.mGuildNode

		clubRedPoint:getChildByName("mRedSprite"):setVisible(false)
	end

	if self:onClubRedPoint() then
		local clubRedPoint = self._rightBtns.mGuildNode

		clubRedPoint:getChildByName("mRedSprite"):setVisible(true)
	end
end

function HomeMediator:checkExtraRedPoint()
	local buildingRedPoint = self._menuStateBtn:getChildByName("redPoint")
	local hasList = self._buildingSystem:getBuildingQueueNum()
	local isVisible = nil

	if hasList < 1 then
		isVisible = self._buildingSystem:getBuildLvOrBuildSta()

		if isVisible then
			buildingRedPoint:getChildByName("Text_1"):setString(Strings:get("Build_List_Build"))
		end
	elseif self._buildingSystem:getBuildLvOrBuildSta() then
		isVisible = true

		buildingRedPoint:getChildByName("Text_1"):setString(Strings:get("Build_List_Idle"))
	end

	buildingRedPoint:setOpacity(0)

	if isVisible then
		performWithDelay(self:getView(), function ()
			buildingRedPoint:runAction(cc.FadeIn:create(0.5))
		end, 0.5)
	end

	local passRedPoint = self:getView():getChildByFullName("playerNode.main.info_panel.passPanel.redPoint")

	if passRedPoint then
		passRedPoint:setVisible(self._passSystem:checkRedPointForHome())
	end

	local extraBtns = {}
	local carnBtn = self:getView():getChildByFullName("extraActBtn.btn_1")

	carnBtn:setVisible(self._activitySystem:checkConditionWithId("Carnival") and CommonUtils.GetSwitch("fn_carnival"))

	if carnBtn:isVisible() then
		extraBtns[#extraBtns + 1] = carnBtn
	end

	local carnBtnRedPoint = carnBtn:getChildByName("redPoint")

	carnBtnRedPoint:setVisible(self._activitySystem:hasRedPointForActivity("Carnival"))

	local posX, posY = carnBtn:getPosition()
	local chargeBtn = self:getView():getChildByFullName("extraActBtn.btn_2")

	chargeBtn:setVisible(CommonUtils.GetSwitch("fn_first_pay"))

	local unlock, unlockTips = self._systemKeeper:isUnlock("Shop_Unlock")

	if unlock then
		local shopList = self._shopSystem:getPackageList()
		local canBuyPackage = false
		local model = nil

		for _, v in ipairs(shopList) do
			if v._id == firstChargePackId and v._leftCount > 0 then
				canBuyPackage = true
				model = v

				break
			end
		end

		if canBuyPackage then
			local function callFunc()
				local view = self:getInjector():getInstance("ShopView")
				local shopId = "Shop_Package"
				local data = {
					shopId = shopId
				}

				self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))

				view = self:getInjector():getInstance("ShopBuyPackageView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
				}, {
					shopId = ShopSpecialId.kShopPackage,
					item = model
				}))
			end

			mapButtonHandlerClick(nil, chargeBtn, {
				clickAudio = "Se_Click_Open_1",
				func = callFunc
			})
		else
			chargeBtn:setVisible(false)
		end
	else
		chargeBtn:setVisible(false)
	end

	if chargeBtn:isVisible() then
		extraBtns[#extraBtns + 1] = chargeBtn
	end

	self._clubResourcesBattleBtn = self:getView():getChildByFullName("extraActBtn.btn_3")
	self._clubResourcesBattleTimeText = self._clubResourcesBattleBtn:getChildByName("Text_2")

	self._clubResourcesBattleBtn:setVisible(false)

	if self._clubSystem:isClubResourcesBattleOpen() == true then
		self._clubResourcesBattleBtn:setVisible(true)
	end

	if self._clubResourcesBattleBtn:isVisible() then
		extraBtns[#extraBtns + 1] = self._clubResourcesBattleBtn
	end

	local activity = self._activitySystem:getActivityByType(ActivityType.KMiniGame)
	local miniGameBtn = self:getView():getChildByFullName("extraActBtn.btn_4")

	miniGameBtn:setVisible(false)

	if activity then
		miniGameBtn:setVisible(self._activitySystem:isActivityOpen(activity:getId()) and self._activitySystem:checkConditionWithId(activity:getId()) and CommonUtils.GetSwitch("fn_MiniGame_Darts"))

		local function callFunc()
			local miniGameSystem = self:getInjector():getInstance(MiniGameSystem)

			miniGameSystem:tryEnterByActivity(activity:getId())
		end

		mapButtonHandlerClick(nil, miniGameBtn, {
			clickAudio = "Se_Click_Open_1",
			func = callFunc
		})

		local miniGameRedPoint = miniGameBtn:getChildByName("redPoint")

		miniGameRedPoint:setVisible(self._activitySystem:hasRedPointForActivity(activity:getId()))

		if miniGameBtn:isVisible() then
			extraBtns[#extraBtns + 1] = miniGameBtn
		end
	end

	for i, btn in pairs(extraBtns) do
		btn:setPosition(posX - (i - 1) * 122, posY)
	end

	self:setComplexActivityEntry()
end

function HomeMediator:onReceiveFriendPvpInviteCallback(event)
	local unlock, tips = self._systemKeeper:isUnlock("Friend_PK")

	if not unlock then
		return
	end

	local friendPvpSystem = self:getInjector():getInstance(FriendPvpSystem)
	local data = event:getData()

	if not friendPvpSystem._forbidFriendInvitePop then
		local canPop = friendPvpSystem:checkInvitePop(data)

		if canPop then
			local inviteListPanel = self:getView():getChildByName("friendPvpInvitePanel")

			inviteListPanel:setVisible(true)

			local inviteList = inviteListPanel:getChildByName("inviteList")

			local function closeDelegate()
				local inviteMap = friendPvpSystem:getReceiveInviteMap()

				if table.nums(inviteMap) == 0 then
					inviteList:removeAllItems()
					inviteListPanel:setVisible(false)
				else
					inviteList:doLayout()
				end
			end

			local invitePop = self:getInjector():injectInto(FriendPvpInvitePopWidget:new(closeDelegate))

			invitePop:initView(data)
			inviteList:pushBackCustomItem(invitePop:getView())
		end
	end
end

function HomeMediator:playVedioSprite(showStr)
	self:setBoardHeroEffectState(false)

	local videoSize = cc.size(2436, 1124)
	local offset = -728.84
	local winSize = cc.Director:getInstance():getWinSize()
	local videoSprite = VideoSprite.create("video/welcome.usm", function (instance, eventName, index)
		if eventName == "complete" then
			instance:removeFromParent()

			local disposePanel = self:getView():getChildByName("disposePanel")

			disposePanel:removeFromParent()

			local storyDirector = self:getInjector():getInstance(story.StoryDirector)

			storyDirector:notifyWaiting("exit_home_playVedioSprite")
			self:getView():runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function ()
				storyDirector:notifyWaiting("enter_home_view")
			end)))

			return
		end

		if eventName == "textShow" then
			local text = ccui.Text:create(showStr, TTF_FONT_FZYH_M, 20)

			text:setTextColor(cc.c3b(101, 78, 118))
			text:addTo(instance):center(videoSize)
			text:setScale(videoSize.height / winSize.height)
			text:offset(0, offset * winSize.height / videoSize.height)
			text:setOpacity(0)
			text:runAction(cc.FadeIn:create(0.5))
		end
	end)
	local bgPanel = ccui.Layout:create()

	bgPanel:setTouchEnabled(true)
	bgPanel:setContentSize(winSize)
	bgPanel:setAnchorPoint(cc.p(0.5, 0.5))
	bgPanel:setPosition(cc.p(568, 320))
	bgPanel:addTo(self:getView())
	bgPanel:setName("disposePanel")
	bgPanel:setBackGroundColorType(1)
	bgPanel:setBackGroundColor(cc.c3b(0, 0, 0))
	videoSprite:addTo(self:getView())
	videoSprite:setContentSize(videoSize)
	videoSprite:addFrameEvent("textShow", 57)
	videoSprite:setScale(winSize.height / videoSize.height)
	videoSprite:setPosition(cc.p(568, 320))
	videoSprite:setLocalZOrder(9999)
end

function HomeMediator:checkClubResourcesBattleTimerLogic()
	if CommonUtils.GetSwitch("fn_club_resource_battle") == false then
		return
	end

	if self._clubResourcesBattleTimer == nil then
		local function refreshTimer()
			local hasJoinClub = self._clubSystem:getHasJoinClub()

			if hasJoinClub == false then
				return
			end

			if self._clubSystem:isClubResourcesBattleOpen() == false then
				self._clubResourcesBattleBtn:setVisible(false)

				return
			end

			if self._clubResourcesBattleBtn:isVisible() == false then
				self._clubResourcesBattleBtn:setVisible(true)
				self:checkExtraRedPoint()
			end

			local ClubResourcesBattleData = self._clubSystem:getClub():getClubResourcesBattleInfo()
			local remoteTimestamp = self._gameServerAgent:remoteTimestamp()
			local refreshTiem = ClubResourcesBattleData:getNextMillis() / 1000
			local remainTime = refreshTiem - remoteTimestamp

			if remainTime <= 0 then
				if ClubResourcesBattleData:getNextMillis() == -1 and ClubResourcesBattleData:getStatus() == "END" then
					self._clubResourcesBattleTimer:stop()

					self._clubResourcesBattleTimer = nil

					self._clubResourcesBattleBtn:setVisible(false)
					self:checkExtraRedPoint()
				else
					self._clubSystem:requestClubBattleData(nil, false)
				end
			end

			self:refreshRemainTime(remainTime)
		end

		self._clubResourcesBattleTimer = LuaScheduler:getInstance():schedule(refreshTimer, 1, false)
	end
end

function HomeMediator:refreshRemainTime(remainTime)
	local str = self._clubSystem:getRemainTime(remainTime)
	local ClubResourcesBattleData = self._clubSystem:getClub():getClubResourcesBattleInfo()

	if ClubResourcesBattleData:getStatus() == "NOTOPEN" or ClubResourcesBattleData:getStatus() == "MATCHING" then
		local timeStr = Strings:get("Club_ResourceBattle_8")

		self._clubResourcesBattleTimeText:setString(timeStr)
	end

	if ClubResourcesBattleData:getStatus() == "OPEN" then
		if remainTime < 0 then
			str = Strings:get("Club_ResourceBattle_14")
		end

		self._clubResourcesBattleTimeText:setString(str)
	end

	if ClubResourcesBattleData:getStatus() == "END" then
		local timeStr = Strings:get("Club_ResourceBattle_14")

		self._clubResourcesBattleTimeText:setString(timeStr)
	end
end

function HomeMediator:randomBoardRoleAndBg()
	local isRandom = self._settingSystem:getSettingModel():getRoleAndBgRandom()

	if isRandom then
		local showHeroId, showBGId = self._settingSystem:getRandomShowRoleAndBg()
		self._showHeroId = showHeroId

		self:setBoardHeroSprite()

		self._homeViewBgId = showBGId

		self:loadBgImageTab()
	else
		self:setBoardHeroSprite()
		self:loadBgImageTab()
	end
end

function HomeMediator:setComplexActivityEntry()
	local complexActivityEntryAnim = {
		[ActivityType_UI.kActivityBlockWsj] = {
			anim = "rukou_wanshengjierukou",
			aimpos = cc.p(48, 40),
			redPointFuncx = self._activitySystem.hasRedPointForActivityWsj
		},
		[ActivityType_UI.kActivityBlockSummer] = {
			anim = "rukou_xiarihuodong",
			aimpos = cc.p(40, 40),
			redPointFuncx = self._activitySystem.hasRedPointForActivitySummer
		},
		[ActivityType_UI.kActivityWxh] = {
			anim = "wuxiurukou_wuxiurukou",
			aimpos = cc.p(-34, 125),
			redPointFuncx = self._activitySystem.hasRedPointForActivity
		},
		[ActivityType_UI.kActivityBlockZuoHe] = {
			anim = "anniu_rukouyemian",
			aimpos = cc.p(51, 40),
			redPointFuncx = self._activitySystem.hasRedPointForActivity
		},
		[ActivityType_UI.kActivityBlock] = {
			img = "hd_rk_fhj.png",
			aimpos = cc.p(50, 43),
			redPointFuncx = self._activitySystem.hasRedPointForActivity
		},
		[ActivityType_UI.KActivityBlockSnowflake] = {
			anim = "xuehua-CX_yongbuxiaorongrukou",
			aimpos = cc.p(50, 43),
			redPointFuncx = self._activitySystem.hasRedPointForActivity
		},
		[ActivityType_UI.KActivityBlockHoliday] = {
			anim = "rukou_newyearshop",
			aimpos = cc.p(50, 43),
			redPointFuncx = self._activitySystem.hasRedPointForActivity
		}
	}
	local extraActBtn = self._rightFuncLayout:getChildByFullName("extraActBtn")

	extraActBtn:setVisible(false)

	local blockBtn = extraActBtn:getChildByFullName("btn_block")

	blockBtn:setVisible(false)

	local redPoint = blockBtn:getChildByName("redPoint")

	redPoint:setLocalZOrder(999)

	local bs = blockBtn:getContentSize()
	local count = 0
	self._btns = self._btns or {}

	local function del()
		for k, v in pairs(self._btns) do
			v:removeFromParent()
		end

		self._btns = {}
	end

	local function create(ui, cfg)
		self._btns[ui] = blockBtn:clone()

		self._btns[ui]:setVisible(true)
		self._btns[ui]:setTouchEnabled(true)
		self._btns[ui]:setSwallowTouches(true)
		self._btns[ui]:addTo(extraActBtn):center(bs)
		mapButtonHandlerClick(nil, self._btns[ui], {
			func = function (sender, eventType)
				self:onClickComplexBtn(ui)
			end
		})

		local show = nil

		if cfg.anim then
			show = cc.MovieClip:create(cfg.anim)

			show:gotoAndPlay(1)
		elseif cfg.img then
			show = ccui.ImageView:create(cfg.img, ccui.TextureResType.plistType)
		end

		if show then
			show:addTo(self._btns[ui])
			show:setPosition(cfg.aimpos)
		end
	end

	local test = false

	if test then
		del()
	end

	for ui, cfg in pairs(complexActivityEntryAnim) do
		local activity = self._activitySystem:getActivityByComplexUI(ui)

		if activity then
			if not self._btns[ui] then
				create(ui, cfg)
			end

			local activityId = activity:getId()

			self._btns[ui]:setVisible(self._activitySystem:checkConditionWithId(activityId))

			if self._btns[ui]:isVisible() then
				self._btns[ui]:getChildByName("redPoint"):setVisible(cfg.redPointFuncx(self._activitySystem, activityId))
				extraActBtn:setVisible(true)
			end

			self._btns[ui]:setPositionX(blockBtn:getPositionX() - count * (bs.width + 20))

			count = count + 1
		elseif self._btns[ui] then
			self._btns[ui]:removeFromParent()

			self._btns[ui] = nil
		end
	end
end
