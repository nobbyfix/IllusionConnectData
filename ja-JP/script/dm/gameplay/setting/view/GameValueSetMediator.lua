GameValueSetMediator = class("GameValueSetMediator", DmPopupViewMediator)

GameValueSetMediator:has("_settingSystem", {
	is = "r"
}):injectWith("SettingSystem")
GameValueSetMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kBtnHandlers = {
	["main.bg.btn_close"] = {
		clickAudio = "Se_Click_Common_2",
		func = "close"
	},
	["main.codeExchange"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickCode"
	}
}
local kBtnRightList = {
	{
		btnRes = "sz_btn_grxx_bdsj.png",
		btnShow = "isBindPhoneBtnShow",
		btnName = "Setting_Ui_Text_Bind",
		id = "bindPhoneBtn",
		callback = {
			func = "onClickBindPhoneBtn"
		}
	},
	{
		btnRes = "sz_btn_grxx_yxgg.png",
		btnShow = "isGameAnnounceShow",
		btnName = "Setting_Text_GameAnnounce",
		id = "gameAnnounce",
		callback = {
			func = "onClickGameAnnounce"
		}
	},
	{
		btnRes = "sz_btn_grxx_wtfk.png",
		btnShow = "isBugFeedbackShow",
		btnName = "Setting_Text26",
		id = "bugFeedback",
		callback = {
			func = "onClickBugFeedBack"
		}
	},
	{
		btnRes = "sz_btn_grxx_qd.png",
		btnShow = "isCheckInBtnShow",
		btnName = "Setting_Ui_Text_7",
		id = "checkInBtn",
		callback = {
			clickAudio = "Se_Click_Common_2",
			func = "onClickCheckInBtn"
		}
	},
	{
		btnRes = "sz_btn_grxx_xzyy.png",
		btnShow = "isSoundDomShow",
		btnName = "setting_ui_DownloadVoice",
		id = "soundDom",
		callback = {
			clickAudio = "Se_Click_Common_2",
			func = "onClickSoundCVBtn"
		}
	},
	{
		btnRes = "sz_btn_grxx_xzzr.png",
		btnShow = "isResourceDomShow",
		btnName = "setting_ui_DownloadResource",
		id = "resourceDom",
		callback = {
			clickAudio = "Se_Click_Common_2",
			func = "onClickSpinePortraitBtn"
		}
	}
}
local soundOpenImage = "sz_btn_sy02.png"
local soundCloseImage = "sz_btn_sy01.png"
local volumeConHeight = 9
local volumeConWidth = 2.6
local volumeConWidth2 = 2.4
local adjustSafeX = 100
local TabType = {
	kSound = 1,
	kAccount = 3,
	kOther = 4,
	kPicture = 2
}
local TabName = {
	{
		"Game_Set_Sound",
		"UITitle_EN_Shengyinshezhi",
		"btn_1_view"
	},
	{
		"Game_Set_Picture",
		"UITitle_EN_Huamianshezhi",
		"btn_2_view"
	},
	{
		"Setting_Ui_Text_15",
		"UITitle_EN_Zhanghaoshezhi",
		"btn_3_view"
	},
	{
		"Setting_Ui_Text_16",
		"UITitle_EN_Qita",
		"btn_3_view"
	}
}
local kBtnTabList = {
	{
		btnRes = "sz_btn_grxx_wtfk.png",
		btnShow = "isAccountCenterBtnShow",
		btnName = "setting_ui_AccountCenter",
		id = "accountBtn",
		sort = 1,
		callback = {
			clickAudio = "Se_Click_Common_2",
			func = "onClickAccountCenterBtn"
		},
		tab = TabType.kAccount
	},
	{
		btnShow = "isBindAccountBtnShow",
		btnName = "Setting_Ui_Text_18",
		id = "bindAccountBtn",
		sort = 1,
		callback = {
			clickAudio = "Se_Click_Common_1",
			func = "onClickBindAccount"
		},
		tab = TabType.kAccount
	},
	{
		btnShow = "isDeleteAccountBtnShow",
		btnName = "Setting_Ui_Text_20",
		id = "deleteAccountBtn",
		sort = 4,
		callback = {
			clickAudio = "Se_Click_Common_1",
			func = "onClickDeleteAccount"
		},
		tab = TabType.kAccount
	},
	{
		btnShow = "isReLoginBtnShow",
		btnName = "Setting_Ui_Text_21",
		id = "reLoginBtn",
		sort = 5,
		callback = {
			clickAudio = "Se_Click_Common_1",
			func = "onClickReLoginBtn"
		},
		tab = TabType.kAccount
	},
	{
		btnShow = "isCustomerServiceBtnShow",
		btnName = "Setting_Ui_Text_23",
		id = "customerServiceBtn",
		sort = 2,
		callback = {
			func = "onClickCustomerService"
		},
		tab = TabType.kOther
	},
	{
		btnShow = "isTermsBtnShow",
		btnName = "Setting_Ui_Text_25",
		id = "termsBtn",
		sort = 4,
		callback = {
			func = "onClickTermsBtn"
		},
		tab = TabType.kOther
	},
	{
		btnShow = "isPrivacyBtnShow",
		btnName = "Setting_Ui_Text_26",
		id = "privacyBtn",
		sort = 5,
		callback = {
			func = "onClickPrivacyBtn"
		},
		tab = TabType.kOther
	},
	{
		btnShow = "isInheritanceCodeBtnShow",
		btnName = "Setting_Ui_Text_41",
		id = "InheritanceCode",
		sort = 2,
		callback = {
			func = "onClickInheritanceCodeBtn"
		},
		tab = TabType.kAccount
	}
}

function GameValueSetMediator:initialize()
	super.initialize(self)
end

function GameValueSetMediator:dispose()
	super.dispose(self)
end

function GameValueSetMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._settingModel = self._settingSystem:getSettingModel()

	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_REWARDS_SUCC, self, self.showDownloadReward)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_PORTRAIT_OVER, self, self.downloadPortraitOver)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_SOUNDCV_OVER, self, self.downloadSoundCVOver)
end

function GameValueSetMediator:enterWithData()
	self._selectTag = 1

	self:setupView()
	self:initGameSetValue()
	self:setTab()
	self:refreshRightList()
end

function GameValueSetMediator:setupView()
	local soundSetView = self:getView():getChildByFullName("main.btn_1_view")
	local pictureSetView = self:getView():getChildByFullName("main.btn_2_view")
	self._main = self:getView():getChildByFullName("main")
	self._musicSlider = soundSetView:getChildByFullName("Slider_1")
	self._musicTag = soundSetView:getChildByFullName("image1")
	self._musicVolumeCon = soundSetView:getChildByFullName("volumeCon1")
	self._soundSlider = soundSetView:getChildByFullName("Slider_2")
	self._soundTag = soundSetView:getChildByFullName("image2")
	self._soundVolumeCon = soundSetView:getChildByFullName("volumeCon2")
	self._roleSlider = soundSetView:getChildByFullName("Slider_3")
	self._roleTag = soundSetView:getChildByFullName("image3")
	self._roleVolumeCon = soundSetView:getChildByFullName("volumeCon3")
	self._adjustSlider = pictureSetView:getChildByFullName("Slider")
	self._adjustCon = pictureSetView:getChildByFullName("volumeCon")
	self._listView = self:getView():getChildByFullName("main.rightList")

	self._listView:setScrollBarEnabled(false)

	local checkBox = pictureSetView:getChildByFullName("checkBox")
	local isOff = self._settingModel:isTouchEffectOff()

	checkBox:setSelected(not isOff)
	checkBox:addEventListener(function (sender, eventType)
		self:onClickEffectBtn()
	end)

	self._checkBoxFps = pictureSetView:getChildByFullName("checkBox_0")

	self._checkBoxFps:addEventListener(function (sender, eventType)
		self:onClickFPSBtn(sender)
	end)
	self:onClickFPSBtn()

	self._tabPanel = self._main:getChildByFullName("tanpanel")
	local btnView = self._main:getChildByFullName("btn_3_view")

	soundSetView:setVisible(false)
	pictureSetView:setVisible(false)
	btnView:setVisible(false)

	self._btnClone = self._main:getChildByFullName("BtnClone"):setVisible(false)
end

function GameValueSetMediator:setTab()
	local config = {
		onClickTab = function (name, tag)
			self:onClickTabBtn(name, tag)
		end
	}
	local data = {}

	for i = 1, #TabName do
		data[#data + 1] = {
			tabText = Strings:get(TabName[i][1]),
			tabTextTranslate = Strings:get(TabName[i][2])
		}
	end

	config.btnDatas = data
	local injector = self:getInjector()
	local widget = TabBtnWidget:createWidgetNode()
	self._tabBtnWidget = self:autoManageObject(injector:injectInto(TabBtnWidget:new(widget)))

	self._tabBtnWidget:adjustScrollViewSize(0, 272)
	self._tabBtnWidget:initTabBtn(config, {
		ignoreSound = true,
		noCenterBtn = true,
		ignoreRedSelectState = true
	})
	self._tabBtnWidget:selectTabByTag(self._selectTag)
	self._tabBtnWidget:removeTabBg()

	local view = self._tabBtnWidget:getMainView()

	view:setScale(0.7)
	view:addTo(self._tabPanel):posite(13, 0)
	view:setLocalZOrder(1100)
end

function GameValueSetMediator:initGameSetValue()
	self:initAdjustSlider()
	self:initSoundSlider()
	self:initMusicSlider()
	self:initRoleSoundSlider()
end

function GameValueSetMediator:initAdjustSlider()
	local percent = AdjustUtils.getSafeX()

	self._adjustSlider:setPercent(percent)
	self._adjustCon:setContentSize(cc.size(volumeConWidth * percent, volumeConHeight))
	self._adjustSlider:addEventListener(function (event)
		self._adjustSlider:stopAllActions()

		local percent = self._adjustSlider:getPercent()

		AdjustUtils.updateAdjustByNewSafeX(percent * 0.01 * adjustSafeX)
		self._adjustCon:setContentSize(cc.size(volumeConWidth * percent, volumeConHeight))
		performWithDelay(self._adjustSlider, function ()
			self:dispatch(ShowTipEvent({
				duration = 0.35,
				tip = Strings:get("Setting_SuitAlready")
			}))
		end, 0.2)
	end)
end

function GameValueSetMediator:initMusicSlider()
	local volume = self._settingSystem:getMusicVolume()
	local percent = volume / SoundVolumeMax * 100

	if percent < 3 then
		self._musicTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
	else
		self._musicTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
	end

	self._musicVolumeCon:setContentSize(cc.size(volumeConWidth2 * percent, volumeConHeight))
	self._musicSlider:setPercent(percent)
	self._musicSlider:addEventListener(function (event)
		self._musicSlider:stopAllActions()

		local percent = self._musicSlider:getPercent()

		if percent < 3 then
			self._musicTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
		else
			self._musicTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
		end

		self._musicVolumeCon:setContentSize(cc.size(volumeConWidth2 * percent, volumeConHeight))

		local volume = percent / 100 * SoundVolumeMax

		self._settingSystem:setMusicVolume(volume)
	end)
end

function GameValueSetMediator:initSoundSlider()
	local volume = self._settingSystem:getEffectVolume()
	local percent = volume / SoundVolumeMax * 100

	if percent < 3 then
		self._soundTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
	else
		self._soundTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
	end

	self._soundVolumeCon:setContentSize(cc.size(volumeConWidth2 * percent, volumeConHeight))
	self._soundSlider:setPercent(percent)
	self._soundSlider:addEventListener(function (event)
		self._soundSlider:stopAllActions()

		local percent = self._soundSlider:getPercent()

		if percent < 3 then
			self._soundTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
		else
			self._soundTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
		end

		self._soundVolumeCon:setContentSize(cc.size(volumeConWidth2 * percent, volumeConHeight))

		local volume = percent / 100 * SoundVolumeMax

		self._settingSystem:setEffectVolume(volume)
	end)
end

function GameValueSetMediator:initRoleSoundSlider()
	local volume = self._settingSystem:getRoleEffectVolume()
	local percent = volume / SoundVolumeMax * 100

	if percent < 3 then
		self._roleTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
	else
		self._roleTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
	end

	self._roleSlider:setPercent(percent)
	self._roleVolumeCon:setContentSize(cc.size(volumeConWidth2 * percent, volumeConHeight))
	self._roleSlider:addEventListener(function (event)
		self._roleSlider:stopAllActions()

		local percent = self._roleSlider:getPercent()

		if percent < 3 then
			self._roleTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
		else
			self._roleTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
		end

		self._roleVolumeCon:setContentSize(cc.size(volumeConWidth2 * percent, volumeConHeight))

		local volume = percent / 100 * SoundVolumeMax

		self._settingSystem:setRoleEffectVolume(volume)
	end)
end

function GameValueSetMediator:refreshButtonList(tag)
	local buttons = {}

	for i = 1, #kBtnTabList do
		local temp = kBtnTabList[i]

		if temp.tab and temp.tab == tag then
			local isShow, pointShow = self[kBtnTabList[i].btnShow](self)

			if isShow then
				local _tabValue = {
					index = i,
					id = kBtnTabList[i].id,
					sort = kBtnTabList[i].sort or 1,
					btnName = kBtnTabList[i].btnName,
					callback = kBtnTabList[i].callback
				}
				buttons[#buttons + 1] = _tabValue
			end
		end
	end

	table.sort(buttons, function (a, b)
		if a.sort == b.sort then
			return a.index < b.index
		else
			return a.sort < b.sort
		end
	end)

	self._buttons = buttons
	local btnPanel = self._main:getChildByFullName("btn_3_view")

	btnPanel:removeAllChildren()

	for index = 1, #self._buttons do
		local btn = self._btnClone:clone():setVisible(true)

		btn:getChildByName("btnText"):setString(Strings:get(self._buttons[index].btnName))
		btn:setName(self._buttons[index].id)
		btn:setAnchorPoint(cc.p(0, 0))

		local line = math.ceil(index / 2)
		local pos = cc.p(200 * (index - 2 * (line - 1) - 1) + 20, 230 - 80 * line)

		self:mapButtonHandlerClick(btn, self._buttons[index].callback)
		btn:addTo(btnPanel)
		btn:setPosition(pos)
	end
end

function GameValueSetMediator:onClickTabBtn(name, tag)
	local oldView = self._main:getChildByName(TabName[self._selectTag][3])
	local newView = self._main:getChildByName(TabName[tag][3])

	oldView:setVisible(false)
	newView:setVisible(true)

	if tag == TabType.kAccount or tag == TabType.kOther then
		self:refreshButtonList(tag)
	end

	self._selectTag = tag
end

function GameValueSetMediator:onClickEffectBtn()
	local isOff = self._settingModel:isTouchEffectOff()

	self._settingSystem:setTouchEffectOff(not isOff)
end

function GameValueSetMediator:onClickFPSBtn(sender)
	local value = cc.UserDefault:getInstance():getIntegerForKey("GAME_MAX_FPS", GAME_MAX_FPS)

	if sender then
		if value <= 30 then
			value = 60
		else
			value = 30
		end

		cc.UserDefault:getInstance():setStringForKey("GAME_MAX_FPS", value)
	end

	GAME_MAX_FPS = value or 30

	self._checkBoxFps:setSelected(GAME_MAX_FPS == 60 and true or false)

	local director = cc.Director:getInstance()

	director:setAnimationInterval(1 / GAME_MAX_FPS)
end

function GameValueSetMediator:refreshRightList()
	if self._listView == nil then
		return
	end

	self._listView:removeAllItems()
	self._listView:setScrollBarEnabled(false)

	local cloneCell = self._main:getChildByFullName("rightCellClone")

	for i = 1, #kBtnRightList do
		local isShow, pointShow = self[kBtnRightList[i].btnShow](self)

		if isShow then
			local cell = cloneCell:clone()

			cell:getChildByName("Text"):setString(Strings:get(kBtnRightList[i].btnName))
			cell:loadTextures(kBtnRightList[i].btnRes, kBtnRightList[i].btnRes, kBtnRightList[i].btnRes, ccui.TextureResType.plistType)
			cell:getChildByName("redPoint"):setVisible(pointShow or false)
			self:mapButtonHandlerClick(cell, kBtnRightList[i].callback)
			self._listView:pushBackCustomItem(cell)
		end
	end
end

function GameValueSetMediator:isBindPhoneBtnShow()
	local LOGIN_TYPE_GUEST = 1
	local bindState = SDKHelper:readCacheValue("loginType")

	return SDKHelper:isEnableSdk() and LOGIN_TYPE_GUEST == bindState
end

function GameValueSetMediator:isGameAnnounceShow()
	return false
end

function GameValueSetMediator:isBugFeedbackShow()
	local channelId = PlatformHelper:getChannelID() or ""

	if channelId == "" or channelId == "test" then
		return true
	end

	local data = ConfigReader:getDataByNameIdAndKey("ConfigValue", "SDKQA_Config", "content")
	local targetLevel = data[channelId] or 9999
	local level = self._developSystem:getPlayer():getLevel()

	return targetLevel <= level
end

function GameValueSetMediator:isCheckInBtnShow()
	return CommonUtils.GetSwitch("fn_check_in")
end

function GameValueSetMediator:isSoundDomShow()
	if not self._settingSystem:hasPackage() then
		return false
	end

	local isSoundCVDownloadOver = self._settingSystem:isSoundCVDownloadOver()
	local isGetReward2 = self._settingSystem:gotSoundCVReward()

	if not isSoundCVDownloadOver then
		return true
	end

	if not isGetReward2 then
		return true, true
	end

	return false
end

function GameValueSetMediator:isResourceDomShow()
	if not self._settingSystem:hasPackage() then
		return false
	end

	local isPortraitDownloadOver = self._settingSystem:isPortraitDownloadOver()
	local isGetReward1 = self._settingSystem:gotPortraitReward()

	if not isPortraitDownloadOver then
		return true
	end

	if not isGetReward1 then
		return true, true
	end

	return false
end

function GameValueSetMediator:isTermsBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and CommonUtils.GetSwitch("fn_setting_url")
end

function GameValueSetMediator:isPrivacyBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and CommonUtils.GetSwitch("fn_setting_url")
end

function GameValueSetMediator:isReLoginBtnShow()
	return SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn
end

function GameValueSetMediator:isBindAccountBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and not PlatformHelper:isDMMChannel()
end

function GameValueSetMediator:isDeleteAccountBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and not PlatformHelper:isDMMChannel()
end

function GameValueSetMediator:isCustomerServiceBtnShow()
	return SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn
end

function GameValueSetMediator:isInheritanceCodeBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and CommonUtils.GetSwitch("fn_inheritanceCode") and not PlatformHelper:isDMMChannel()
end

function GameValueSetMediator:isAccountCenterBtnShow()
	return false
end

function GameValueSetMediator:onClickGameAnnounce(sender, eventType)
	if CommonUtils.GetSwitch("fn_announce_check_in") then
		local view = self:getInjector():getInstance("serverAnnounceViewNew")
		local delegate = {
			willClose = function (self, popupMediator, data)
				popupMediator:resetData()
			end
		}

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			isDeductTime = 0
		}, delegate))
	else
		self:dispatch(ShowTipEvent({
			tip = Strings:get("HeroStory_Team_UI1")
		}))
	end
end

function GameValueSetMediator:onClickCheckInBtn()
	local monthSignInSystem = self:getInjector():getInstance(MonthSignInSystem)

	monthSignInSystem:tryEnter()
end

function GameValueSetMediator:onClickBindPhoneBtn()
	if SDKHelper:isEnableSdk() then
		SDKHelper:showBindPhone()
	end
end

function GameValueSetMediator:onClickSpinePortraitBtn()
	self._settingSystem:downloadPortrait()
end

function GameValueSetMediator:onClickSoundCVBtn()
	self._settingSystem:downloadSoundCV()
end

function GameValueSetMediator:showDownloadReward(event)
	self:refreshRightList()

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

function GameValueSetMediator:onClickBugFeedBack(sender, eventType)
	local baseVersion = app.pkgConfig.packJobId
	local CSD_CLIENT_VERSION = 3560

	if SDKHelper and SDKHelper:isEnableSdk() and CSD_CLIENT_VERSION < tonumber(baseVersion) then
		SDKHelper:showCustomerService()
	else
		local CSDHelper = require("sdk.CSDHelper")
		local player = self._developSystem:getPlayer()

		cc.Application:getInstance():openURL(CSDHelper:getCSDUrl(player:getRid()))
	end
end

function GameValueSetMediator:onClickCode()
	local view = self:getInjector():getInstance("SettingCodeExchangeView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}))
end

function GameValueSetMediator:downloadPortraitOver()
	self:refreshRightList()
end

function GameValueSetMediator:downloadSoundCVOver()
	self:refreshRightList()
end

function GameValueSetMediator:onClickAccountCenterBtn(sender, eventType)
	if eventType == ccui.TouchEventType.ended and SDKHelper and SDKHelper:isEnableSdk() then
		SDKHelper:userCenterByPwrdView()
	end
end

function GameValueSetMediator:onClickCustomerService()
	local loginSystem = self:getInjector():getInstance(LoginSystem)
	local serverInfo = loginSystem:getCurServer()
	local player = self._developSystem:getPlayer()
	local data = {
		remark = "some string",
		roleId = tostring(player:getRid()),
		roleName = tostring(player:getNickName()),
		serverName = serverInfo:getName(),
		serverId = tostring(serverInfo:getSecId()),
		roleLevel = tostring(player:getLevel()),
		vip = tostring(serverInfo:getVipLevel())
	}

	SDKHelper:customerService(data)

	if false then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))

		return
	end
end

function GameValueSetMediator:onClickTermsBtn()
	local config = ConfigReader:getRecordById("ConfigValue", "Using_Conventions")

	assert(config, "config value Using_Conventions not find")

	local view = self:getInjector():getInstance("NativeWebView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		url = config.content
	}, nil))
end

function GameValueSetMediator:onClickPrivacyBtn()
	local config = ConfigReader:getRecordById("ConfigValue", "Privacy_Clause")

	assert(config, "config value Privacy_Clause not find")

	local view = self:getInjector():getInstance("NativeWebView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		url = config.content
	}, nil))
end

function GameValueSetMediator:onClickBindAccount()
	if SDKHelper and SDKHelper:isEnableSdk() then
		SDKHelper:bindAccount()
	else
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))

		return
	end
end

function GameValueSetMediator:onClickDeleteAccount()
	SDKHelper:deleteAccount()
end

function GameValueSetMediator:onClickReLoginBtn()
	local data = {
		title = Strings:get("Setting_Ui_Text_21"),
		title1 = Strings:get("UITitle_EN_Fanhuidenglu"),
		content = Strings:get("Setting_Ui_Text_30"),
		sureBtn = {},
		cancelBtn = {}
	}
	local outSelf = self
	local delegate = {}

	function delegate:willClose(popupMediator, data)
		if data.response == "ok" then
			if SDKHelper and SDKHelper:isEnableSdk() then
				SDKHelper:logOut()

				local developSystem = popupMediator:getInjector():getInstance("DevelopSystem")
				local player = developSystem:getPlayer()

				SDKHelper:reportLogout({
					roleName = tostring(player:getNickName()),
					roleId = tostring(player:getRid()),
					roleLevel = tostring(player:getLevel()),
					roleCombat = checkint(player:getCombat()),
					ip = tostring(developSystem:getServerIp()),
					port = tostring(developSystem:getServerPort())
				})
			end

			REBOOT("REBOOT_NOUPDATE")
		elseif data.response == "cancel" then
			-- Nothing
		elseif data.response == "close" then
			-- Nothing
		end
	end

	local view = self:getInjector():getInstance("AlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))

	if false then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))

		return
	end
end

function GameValueSetMediator:onClickInheritanceCodeBtn()
	SDKHelper:getInheritanceCode()

	if false then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))

		return
	end
end
