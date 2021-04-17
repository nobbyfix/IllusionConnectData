SettingMediator = class("SettingMediator", DmPopupViewMediator, _M)

SettingMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
SettingMediator:has("_settingSystem", {
	is = "r"
}):injectWith("SettingSystem")
SettingMediator:has("_gameServer", {
	is = "r"
}):injectWith("GameServerAgent")
SettingMediator:has("_rechargeAndVipModel", {
	is = "r"
}):injectWith("RechargeAndVipModel")
SettingMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
SettingMediator:has("_rechargeAndVipSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")
SettingMediator:has("_systemKeeper", {
	is = "rw"
}):injectWith("SystemKeeper")

ScreenRecorderError = {
	["-5805"] = "手机存储空间不足，无法继续录制",
	["-5800"] = "很遗憾，录屏过程中发生未知错误",
	["-5804"] = "录制过程中出现不明原因，录制失败",
	["-5806"] = "其他应用程序中断录制",
	["-5803"] = "录制未能启动",
	["-5807"] = "录制进程发生异常，录制失败",
	["-5802"] = "该功能被“家长控制”禁止，不能使用",
	["-5801"] = "您拒绝了录制，允许后可使用录制功能"
}
local kBtnHandlers = {
	["main.setting_Panel.setUsr.btn_changename"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickChangeName"
	},
	["main.setting_Panel.setUsr.headImg"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickChangeHeadImg"
	},
	["main.setting_Panel.setUsr.changeHeadBtn"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickChangeHeadImg"
	},
	["main.setting_Panel.setUsr.btn_changeslogan"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickChangeSlogan"
	},
	["main.setting_Panel.setUsr.sexBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSetSex"
	},
	["main.setting_Panel.setUsr.birthDayBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSetBirthDay"
	},
	["main.setting_Panel.setUsr.areaBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSetArea"
	},
	["main.setting_Panel.setUsr.tagsPanel"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSetTags"
	},
	["main.setting_Panel.setUsr.tagsPanel.monthCard"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickBuyMonthCard"
	},
	["main.setting_Panel.setUsr.copyBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickCopyPlayerID"
	}
}
local kTabList = {
	kUser = "User",
	kOther = "Other",
	kGame = "Game",
	kAccount = "Account",
	kGift = "Gift",
	kPush = "Push",
	kTest = "Test"
}
local kTabRightPanels = {
	kSetPush = "setPush",
	kSetGame = "setGame",
	kSetOther = "setOther",
	kSetUser = "setUsr"
}
local kTabBtnsNames = {
	{
		kTabList.kUser,
		"Setting_Ui_Text_11",
		"UITitle_EN_Gerenxinxi",
		true,
		kTabRightPanels.kSetUser
	},
	{
		kTabList.kGame,
		"Setting_Ui_Text_12",
		"UITitle_EN_Youxishezhi",
		true,
		kTabRightPanels.kSetGame
	},
	{
		kTabList.kGift,
		"Setting_Ui_Text_13",
		"UITitle_EN_Fuli",
		"isWelfareCodeBtnShow"
	},
	{
		kTabList.kPush,
		"Setting_Ui_Text_14",
		"UITitle_EN_Tuisong",
		false,
		kTabRightPanels.kSetPush
	},
	{
		kTabList.kAccount,
		"Setting_Ui_Text_15",
		"UITitle_EN_Zhanghaoshezhi",
		true
	},
	{
		kTabList.kOther,
		"Setting_Ui_Text_16",
		"UITitle_EN_Qita",
		true
	},
	{
		kTabList.kTest,
		"TEST",
		"UITitle_EN_Qita",
		"isTestBtnShow"
	}
}
local kBtnRightList = {
	{
		btnRes = "sz_btn_grxx_bdsj.png",
		btnShow = "isBindPhoneBtnShow",
		btnName = "Setting_Ui_Text_Bind",
		id = "bindPhoneBtn",
		sort = 1,
		callback = {
			func = "onClickBindPhoneBtn"
		},
		tab = kTabList.kAccount
	},
	{
		btnRes = "sz_btn_grxx_yxgg.png",
		btnShow = "isGameAnnounceShow",
		btnName = "Setting_Text_GameAnnounce",
		id = "gameAnnounce",
		sort = 1,
		callback = {
			func = "onClickGameAnnounce"
		},
		tab = kTabList.kOther
	},
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
		tab = kTabList.kAccount
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
		sort = 3,
		callback = {
			clickAudio = "Se_Click_Common_2",
			func = "onClickCheckInBtn"
		},
		tab = kTabList.kOther
	},
	{
		btnRes = "sz_btn_grxx_wtfk.png",
		btnShow = "isQuestionBtnShow",
		btnName = "setting_ui_QuestionBtn",
		id = "questionBtn",
		sort = 1,
		callback = {
			clickAudio = "Se_Click_Common_2",
			func = "onClickQuestionBtn"
		},
		tab = kTabList.kOther
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
	},
	{
		btnShow = "isWelfareCodeBtnShow",
		btnName = "Setting_Welfare_Exchange",
		id = "WelfareCodeBtn",
		sort = 1,
		callback = {
			clickAudio = "Se_Click_Common_1",
			func = "onClickCode"
		},
		tab = kTabList.kGift
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
		tab = kTabList.kAccount
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
		tab = kTabList.kAccount
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
		tab = kTabList.kAccount
	},
	{
		btnShow = "isCustomerServiceBtnShow",
		btnName = "Setting_Ui_Text_23",
		id = "customerServiceBtn",
		sort = 2,
		callback = {
			func = "onClickCustomerService"
		},
		tab = kTabList.kOther
	},
	{
		btnShow = "isTermsBtnShow",
		btnName = "Setting_Ui_Text_25",
		id = "termsBtn",
		sort = 4,
		callback = {
			func = "onClickTermsBtn"
		},
		tab = kTabList.kOther
	},
	{
		btnShow = "isPrivacyBtnShow",
		btnName = "Setting_Ui_Text_26",
		id = "privacyBtn",
		sort = 5,
		callback = {
			func = "onClickPrivacyBtn"
		},
		tab = kTabList.kOther
	},
	{
		btnShow = "isTestBtnShow",
		btnName = "预注册查询",
		id = "test1",
		sort = 5,
		callback = {
			func = "onClickTestBtn"
		},
		tab = kTabList.kTest
	},
	{
		btnShow = "isTestBtnShow",
		btnName = "积分兑换查询",
		id = "test2",
		sort = 5,
		callback = {
			func = "onClickTestBtn"
		},
		tab = kTabList.kTest
	},
	{
		btnShow = "isTestBtnShow",
		btnName = "兑换码查询",
		id = "test3",
		sort = 5,
		callback = {
			func = "onClickTestBtn"
		},
		tab = kTabList.kTest
	},
	{
		btnShow = "isTestBtnShow",
		btnName = "评论弹窗",
		id = "test4",
		sort = 5,
		callback = {
			func = "onClickTestBtn"
		},
		tab = kTabList.kTest
	},
	{
		btnShow = "isInheritanceCodeBtnShow",
		btnName = "Setting_Ui_Text_41",
		id = "InheritanceCode",
		sort = 2,
		callback = {
			func = "onClickInheritanceCodeBtn"
		},
		tab = kTabList.kAccount
	},
	{
		btnShow = "isTestBtnShow",
		btnName = "预注册消费",
		id = "test6",
		sort = 5,
		callback = {
			func = "onClickTestBtn"
		},
		tab = kTabList.kTest
	}
}

function SettingMediator:bindAccountCb()
end

function SettingMediator:deleteAccountSuccess()
	REBOOT("REBOOT_NOUPDATE")
end

local volumeConHeight = 11
local volumeConWidth = 3.5
local adjustConWidth = 3.8
local adjustSafeX = 100
local maxLength = nil
local constellationAge = {
	120,
	219,
	321,
	420,
	521,
	622,
	723,
	823,
	923,
	1024,
	1123,
	1222
}
local constellation = {
	"Aquarius",
	"Pisces",
	"Aries",
	"Taurus",
	"Gemini",
	"Cancer",
	"Leo",
	"Virgo",
	"Libra",
	"Scorpio",
	"Sagittarius",
	"Capricorn"
}
local playerTagsArray = nil
local LOGIN_TYPE_GUEST = 1
local CSD_CLIENT_VERSION = 3560

function SettingMediator:initialize()
	super.initialize(self)
end

function SettingMediator:dispose()
	if self._tabController then
		self._tabController:dispose()

		self._tabController = nil
	end

	super.dispose(self)
end

function SettingMediator:onRegister()
	super.onRegister(self)
	self:mapEventListeners()

	maxLength = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Player_Slogan_Max", "content")
	playerTagsArray = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Player_Tag", "content")

	self:mapButtonHandlersClick(kBtnHandlers)
	self:bindWidget("main.bgNode", PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickClose, self)
		},
		title = Strings:get("Setting_Ui_Text_37"),
		title1 = Strings:get("UITitle_EN_Shezhi"),
		bgSize = {
			width = 922,
			height = 518
		}
	})

	self._main = self:getView():getChildByName("main")
	self._settingPanel = self._main:getChildByFullName("setting_Panel")
	self._usrNode = self._settingPanel:getChildByFullName("setUsr")
	self._sloganEditBox = self._settingPanel:getChildByFullName("setUsr.TextField")
	self._gameNode = self._settingPanel:getChildByFullName("setGame")
	self._pushNode = self._settingPanel:getChildByFullName("setPush")
	self._otherNode = self._settingPanel:getChildByFullName("setOther")
	self._BtnClone = self._otherNode:getChildByFullName("BtnClone"):setVisible(false)

	self._usrNode:setVisible(false)
	self._gameNode:setVisible(false)
	self._pushNode:setVisible(false)
	self._otherNode:setVisible(false)

	local enableArea = CommonUtils.GetSwitch("fn_area_change")

	self._usrNode:getChildByFullName("text3"):setVisible(enableArea)
	self._usrNode:getChildByFullName("area"):setVisible(enableArea)
	self._usrNode:getChildByFullName("areaBtn"):setVisible(enableArea)
	self._usrNode:getChildByFullName("areaBtn"):setEnabled(enableArea)

	local name = self._usrNode:getChildByName("Text_10")

	name:setFontSize(12)
	self._usrNode:getChildByName("name_value"):setPositionX(name:getPositionX() + 0.5 * name:getContentSize().width + 5)
	self:loadPlayerInfo()
end

function SettingMediator:loadPlayerInfo()
	local player = self._developSystem:getPlayer()
	self._playerGender = player:getGender()
	self._playerBirthday = player:getBirthday()
	self._playerArea = player:getCity()
	self._playerTags = player:getTags()
end

function SettingMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_CHANGENAME_SUCC, self, self.showSettingView)
	self:mapEventListener(self:getEventDispatcher(), EVT_CHANGESLOGAN_SUCC, self, self.showSettingView)
	self:mapEventListener(self:getEventDispatcher(), EVT_CHANGEHEADIMG_SUCC, self, self.showSettingView)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_REWARDS_SUCC, self, self.getDownloadReward)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_PORTRAIT_OVER, self, self.downloadPortraitOver)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_SOUNDCV_OVER, self, self.downloadSoundCVOver)
	self:mapEventListener(self:getEventDispatcher(), EVT_BIND_ACCOUNT, self, self.bindAccountCb)
	self:mapEventListener(self:getEventDispatcher(), EVT_CHANGEHEADFRAME_SUCC, self, self.showSettingView)
	self:mapEventListener(self:getEventDispatcher(), EVT_DELETE_ACCOUNT, self, self.deleteAccountSuccess)
end

function SettingMediator:enterWithData(data)
	self._settingModel = self._settingSystem:getSettingModel()
	self._curTabType = data or 1

	self:createTabController()
	self:setGameVersion()
	self:onClickTab(_, self._curTabType)
end

function SettingMediator:createTabController()
	local config = {
		onClickTab = function (name, tag)
			self:onClickTab(name, tag)
		end
	}
	local data = {}
	local tab = {}

	for i = 1, #kTabBtnsNames do
		local isShow = kTabBtnsNames[i][4]

		if type(isShow) == "string" and type(self[isShow]) == "function" then
			isShow = self[isShow](self)
		end

		if isShow then
			data[#data + 1] = {
				fontSize = 21,
				fontEnSize = 11,
				textOffsety = 10,
				tabText = Strings:get(kTabBtnsNames[i][2]),
				tabTextTranslate = Strings:get(kTabBtnsNames[i][3])
			}
			tab[#tab + 1] = kTabBtnsNames[i]
		end
	end

	self._tabs = tab
	config.btnDatas = data
	config.addCellHeight = 1
	config.tabImageScale = 0.65
	local injector = self:getInjector()
	local widget = TabBtnWidget:createWidgetNode1()
	self._tabBtnWidget = self:autoManageObject(injector:injectInto(TabBtnWidget:new(widget)))

	self._tabBtnWidget:adjustScrollViewSize(0, 400)
	self._tabBtnWidget:initTabBtn(config, {
		hideBtnAnim = true,
		ignoreSound = true,
		noCenterBtn = true,
		ignoreRedSelectState = true
	})
	self._tabBtnWidget:selectTabByTag(self._curTabType)
	self._tabBtnWidget:refreshAllRedPoint()

	local view = self._tabBtnWidget:getMainView()
	local tabPanel = self:getView():getChildByFullName("tab_panel")

	view:addTo(tabPanel):posite(6, 0)
	view:setLocalZOrder(1100)
	self._tabBtnWidget:scrollTabPanel(self._curTabType)
end

function SettingMediator:showPlayerInfoView()
	local genderView = self._usrNode:getChildByName("sex")
	local birthdayView = self._usrNode:getChildByName("birthDay")
	local constellationView = self._usrNode:getChildByName("constellation")
	local cityView = self._usrNode:getChildByName("area")
	local tagsView = self._usrNode:getChildByName("tagsPanel")
	local enableArea = CommonUtils.GetSwitch("fn_area_change")

	self._usrNode:getChildByFullName("text3"):setVisible(enableArea)
	self._usrNode:getChildByFullName("area"):setVisible(enableArea)
	self._usrNode:getChildByFullName("areaBtn"):setVisible(enableArea)
	self._usrNode:getChildByFullName("areaBtn"):setEnabled(enableArea)

	if self._playerGender == 0 then
		genderView:setString("")
	elseif self._playerGender == 1 then
		genderView:setString(Strings:get("Player_Gender_XY"))
	elseif self._playerGender == 2 then
		genderView:setString(Strings:get("Player_Gender_XX"))
	end

	if self._playerBirthday == nil or self._playerBirthday == "" then
		birthdayView:setString("")
		constellationView:setString("")
	else
		local birthdayTab, constellationStr = self:parseTimeStr(self._playerBirthday)

		birthdayView:setString(tostring(birthdayTab.month) .. Strings:get("Setting_UI_Month") .. tostring(birthdayTab.day) .. Strings:get("Setting_UI_Day") .. "  " .. constellationStr)
		constellationView:setString(constellationStr)
		constellationView:setVisible(false)
	end

	if self._playerArea == nil or self._playerArea == "" then
		cityView:setString("")
	else
		local parts = string.split(self._playerArea, "-")
		local areaInfo = ConfigReader:getRecordById("PlayerPlace", parts[1])
		local str1 = Strings:get(areaInfo.Provinces)
		local cityInfo = areaInfo.City[tonumber(parts[2])]
		local str2 = Strings:get(cityInfo)

		cityView:setString(str1 .. "  " .. str2)
	end

	if self._playerTags == nil or self._playerTags == "" then
		local firstTag = tagsView:getChildByName("tag1")

		firstTag:getChildByName("text"):setString("")
		firstTag:getChildByName("img"):setVisible(true)

		for i = 2, 3 do
			local _tag = tagsView:getChildByName("tag" .. i)

			_tag:setVisible(false)
		end
	else
		local firstTag = tagsView:getChildByName("tag1")

		firstTag:getChildByName("img"):setVisible(false)

		local cjson = require("cjson.safe")
		local playerTags = cjson.decode(self._playerTags)

		for i = 1, 3 do
			local tag = playerTags[i]
			local _cell = tagsView:getChildByName("tag" .. i)

			if tag then
				_cell:setVisible(true)
				_cell:getChildByName("text"):setString(Strings:get(playerTagsArray[tag]))
			elseif i == 1 then
				_cell:setVisible(true)
				_cell:getChildByName("img"):setVisible(true)
				_cell:getChildByName("text"):setString("")
			else
				_cell:setVisible(false)
			end
		end
	end
end

function SettingMediator:showSettingView()
	local layout = self._settingPanel

	layout:setVisible(true)

	local player = self._developSystem:getPlayer()
	local nameText = layout:getChildByFullName("setUsr.name_value")

	nameText:setString(player:getNickName())

	local idText = layout:getChildByFullName("setUsr.id_value")
	local idStr = string.split(player:getRid(), "_")

	idText:setString(idStr[1])

	local levelText = layout:getChildByFullName("setUsr.level_value")

	levelText:setString(player:getLevel())

	self._lastSlogan = player:getSlogan()

	if self._sloganEditBox:getDescription() == "TextField" then
		self._sloganEditBox:setMaxLength(maxLength)
		self._sloganEditBox:setMaxLengthEnabled(true)
		self._sloganEditBox:setString(self._lastSlogan)
		self._sloganEditBox:setPlaceHolderColor(cc.c4b(255, 255, 255, 255))

		self._sloganEditBox = convertTextFieldToEditBox(self._sloganEditBox, nil, MaskWordType.CHAT)

		self._sloganEditBox:setReturnType(0)
		self._sloganEditBox:setInputMode(0)
		self._sloganEditBox:onEvent(function (eventName, sender)
			if eventName == "began" then
				self._sloganEditBox:setPlaceHolder("")
				self._sloganEditBox:setText("")
			elseif eventName == "ended" then
				self:changePlayerSlogan()
			elseif eventName == "return" then
				-- Nothing
			elseif eventName == "changed" then
				-- Nothing
			elseif eventName == "ForbiddenWord" then
				self._sloganEditBox:setText(self._lastSlogan)
				self:getEventDispatcher():dispatchEvent(ShowTipEvent({
					tip = Strings:get("Common_Tip1_1")
				}))
			elseif eventName == "Exceed" then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Tips_WordNumber_Limit", {
						number = sender:getMaxLength()
					})
				}))
			end
		end)
	end

	local config = ConfigReader:getRecordById("LevelConfig", tostring(player:getLevel()))
	local expText = layout:getChildByFullName("setUsr.exp_value")
	local nextLevelDifValue = config.PlayerExp - player:getExp()

	expText:setString(Strings:get("Setting_NextLevel_Dif", {
		num = nextLevelDifValue
	}))

	local expbar = layout:getChildByFullName("setUsr.expbar")
	local percent = player:getExp() / config.PlayerExp * 100

	expbar:setPercent(percent)

	local headicon, oldIcon = IconFactory:createPlayerIcon({
		clipType = 4,
		id = player:getHeadId(),
		size = cc.size(93, 94),
		headFrameId = player:getCurHeadFrame()
	})
	local iconbg = layout:getChildByFullName("setUsr.headImg")

	iconbg:removeAllChildren()
	headicon:addTo(iconbg)
	headicon:setPosition(cc.p(50, 50))
	headicon:setScale(1.15)
	oldIcon:setScale(0.5)
	layout:getChildByFullName("setUsr.Image_99"):setVisible(false)
end

function SettingMediator:setGameVersion()
	local version = self:getView():getChildByFullName("main.gameVersion")
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
end

function SettingMediator:changePlayerSlogan()
	local newStr = self._sloganEditBox:getText()

	if newStr == self._lastSlogan then
		return
	end

	if StringChecker.meaninglessString(newStr) then
		self._sloganEditBox:setText(self._lastSlogan)

		return
	end

	self._settingSystem:requestChangePlayerSlogan(newStr)
end

function SettingMediator:enterDownlandView(type)
	local view = self:getInjector():getInstance("resourceDownloadPopView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		type = type
	}))
end

function SettingMediator:refreshRightList()
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

function SettingMediator:updateBtnView(viewName)
	local buttons = {}

	dump(viewName, "viewName")

	for i = 1, #kBtnRightList do
		local temp = kBtnRightList[i]

		if temp.tab and temp.tab == viewName then
			local isShow, pointShow = self[kBtnRightList[i].btnShow](self)

			if isShow then
				local _tabValue = {
					index = i,
					id = kBtnRightList[i].id,
					sort = kBtnRightList[i].sort or 1,
					btnName = kBtnRightList[i].btnName,
					callback = kBtnRightList[i].callback
				}
				buttons[#buttons + 1] = _tabValue
			end
		end
	end

	dump(buttons, "buttons")
	table.sort(buttons, function (a, b)
		if a.sort == b.sort then
			return a.index < b.index
		else
			return a.sort < b.sort
		end
	end)

	self._buttons = buttons
	local btnPanel = self._otherNode:getChildByFullName("btnPanel")

	btnPanel:removeAllChildren()

	for index = 1, #self._buttons do
		local btn = self._BtnClone:clone():setVisible(true)

		btn:getChildByName("btnText"):setString(Strings:get(self._buttons[index].btnName))
		btn:setName(self._buttons[index].id)
		btn:setAnchorPoint(cc.p(0, 0))

		local line = math.ceil(index / 3)
		local pos = cc.p(200 * (index - 3 * (line - 1) - 1) + 50, 370 - 100 * line)

		self:mapButtonHandlerClick(btn, self._buttons[index].callback)
		btn:addTo(btnPanel)
		btn:setPosition(pos)
	end
end

function SettingMediator:setupGameSetView()
	local soundSetView = self._gameNode:getChildByFullName("setSound")
	local pictureSetView = self._gameNode:getChildByFullName("setShow")
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
end

function SettingMediator:initGameSetValue()
	self:initAdjustSlider()
	self:initSoundSlider()
	self:initMusicSlider()
	self:initRoleSoundSlider()
end

function SettingMediator:initAdjustSlider()
	local percent = AdjustUtils.getSafeX()

	self._adjustSlider:setPercent(percent)
	self._adjustCon:setContentSize(cc.size(adjustConWidth * percent, volumeConHeight))
	self._adjustSlider:addEventListener(function (event)
		self._adjustSlider:stopAllActions()

		local percent = self._adjustSlider:getPercent()

		AdjustUtils.updateAdjustByNewSafeX(percent * 0.01 * adjustSafeX)
		self._adjustCon:setContentSize(cc.size(adjustConWidth * percent, volumeConHeight))
		performWithDelay(self._adjustSlider, function ()
			self:dispatch(ShowTipEvent({
				duration = 0.35,
				tip = Strings:get("Setting_SuitAlready")
			}))
		end, 0.2)
	end)
end

function SettingMediator:initMusicSlider()
	local volume = self._settingSystem:getMusicVolume()
	local percent = volume / SoundVolumeMax * 100

	if percent < 3 then
		self._musicTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
	else
		self._musicTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
	end

	self._musicVolumeCon:setContentSize(cc.size(volumeConWidth * percent, volumeConHeight))
	self._musicSlider:setPercent(percent)
	self._musicSlider:addEventListener(function (event)
		self._musicSlider:stopAllActions()

		local percent = self._musicSlider:getPercent()

		if percent < 3 then
			self._musicTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
		else
			self._musicTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
		end

		self._musicVolumeCon:setContentSize(cc.size(volumeConWidth * percent, volumeConHeight))

		local volume = percent / 100 * SoundVolumeMax

		self._settingSystem:setMusicVolume(volume)
	end)
end

function SettingMediator:initSoundSlider()
	local volume = self._settingSystem:getEffectVolume()
	local percent = volume / SoundVolumeMax * 100

	if percent < 3 then
		self._soundTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
	else
		self._soundTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
	end

	self._soundVolumeCon:setContentSize(cc.size(volumeConWidth * percent, volumeConHeight))
	self._soundSlider:setPercent(percent)
	self._soundSlider:addEventListener(function (event)
		self._soundSlider:stopAllActions()

		local percent = self._soundSlider:getPercent()

		if percent < 3 then
			self._soundTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
		else
			self._soundTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
		end

		self._soundVolumeCon:setContentSize(cc.size(volumeConWidth * percent, volumeConHeight))

		local volume = percent / 100 * SoundVolumeMax

		self._settingSystem:setEffectVolume(volume)
	end)
end

function SettingMediator:initRoleSoundSlider()
	local volume = self._settingSystem:getRoleEffectVolume()
	local percent = volume / SoundVolumeMax * 100

	if percent < 3 then
		self._roleTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
	else
		self._roleTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
	end

	self._roleSlider:setPercent(percent)
	self._roleVolumeCon:setContentSize(cc.size(volumeConWidth * percent, volumeConHeight))
	self._roleSlider:addEventListener(function (event)
		self._roleSlider:stopAllActions()

		local percent = self._roleSlider:getPercent()

		if percent < 3 then
			self._roleTag:loadTexture(soundCloseImage, ccui.TextureResType.plistType)
		else
			self._roleTag:loadTexture(soundOpenImage, ccui.TextureResType.plistType)
		end

		self._roleVolumeCon:setContentSize(cc.size(volumeConWidth * percent, volumeConHeight))

		local volume = percent / 100 * SoundVolumeMax

		self._settingSystem:setRoleEffectVolume(volume)
	end)
end

function SettingMediator:onClickClose(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		self:close()
	end
end

function SettingMediator:onClickTab(name, tag)
	if self._tabs[tag] then
		self._usrNode:setVisible(false)
		self._gameNode:setVisible(false)
		self._pushNode:setVisible(false)
		self._otherNode:setVisible(false)
		self._settingPanel:setVisible(true)

		local tab = self._tabs[tag]
		local viewName = tab[5] or kTabRightPanels.kSetOther

		if viewName == kTabRightPanels.kSetUser then
			self:showSettingView()
			self:showPlayerInfoView()
		elseif viewName == kTabRightPanels.kSetGame then
			self:setupGameSetView()
			self:initGameSetValue()
		end

		local view = self._settingPanel:getChildByFullName(viewName)

		view:setVisible(true)

		if viewName == kTabRightPanels.kSetOther then
			self:updateBtnView(tab[1])
		end
	end
end

function SettingMediator:onClickCustomerService()
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

function SettingMediator:onClickTermsBtn()
	local config = ConfigReader:getRecordById("ConfigValue", "Using_Conventions")

	assert(config, "config value Using_Conventions not find")

	local view = self:getInjector():getInstance("NativeWebView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		url = config.content
	}, nil))
end

function SettingMediator:onClickPrivacyBtn()
	local config = ConfigReader:getRecordById("ConfigValue", "Privacy_Clause")

	assert(config, "config value Privacy_Clause not find")

	local view = self:getInjector():getInstance("NativeWebView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		url = config.content
	}, nil))
end

function SettingMediator:onClickBindAccount()
	if SDKHelper and SDKHelper:isEnableSdk() then
		SDKHelper:bindAccount()
	else
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))

		return
	end
end

function SettingMediator:onClickDeleteAccount()
	SDKHelper:deleteAccount()
end

function SettingMediator:onClickReLoginBtn()
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

function SettingMediator:onClickInheritanceCodeBtn()
	SDKHelper:getInheritanceCode()

	if false then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))

		return
	end
end

function SettingMediator:onClickTestBtn(sender, type)
	local name = sender:getName()
	local loginSystem = self:getInjector():getInstance(LoginSystem)
	local serverInfo = loginSystem:getCurServer()
	local player = self._developSystem:getPlayer()
	local data = {}

	if name == "test1" then
		data = {
			roleId = tostring(player:getRid()),
			roleName = tostring(player:getNickName()),
			serverId = tostring(serverInfo:getSecId()),
			roleLevel = tostring(player:getLevel()),
			promoType = "PRE_REGISTRATION"
		}

		SDKHelper:checkGooglePromoPurchase(data)
	elseif name == "test2" then
		data = {
			roleId = tostring(player:getRid()),
			roleName = tostring(player:getNickName()),
			serverId = tostring(serverInfo:getSecId()),
			roleLevel = tostring(player:getLevel()),
			promoType = "REDEEM"
		}

		SDKHelper:checkGooglePromoPurchase(data)
	elseif name == "test3" then
		data = {
			roleId = tostring(player:getRid()),
			roleName = tostring(player:getNickName()),
			serverId = tostring(serverInfo:getSecId()),
			roleLevel = tostring(player:getLevel()),
			promoType = "PROMO_CODE"
		}

		SDKHelper:checkGooglePromoPurchase(data)
		SDKHelper:checkBindState()
	elseif name == "test4" then
		data = {
			roleId = tostring(player:getRid()),
			roleName = tostring(player:getNickName()),
			serverId = tostring(serverInfo:getSecId()),
			roleLevel = tostring(player:getLevel())
		}

		SDKHelper:requestReviewInApp(data)
	elseif name == "test5" then
		SDKHelper:getInheritanceode()
	elseif name == "test6" then
		data = {
			roleId = tostring(player:getRid()),
			roleName = tostring(player:getNickName()),
			serverId = tostring(serverInfo:getSecId()),
			roleLevel = tostring(player:getLevel())
		}

		SDKHelper:consumeGooglePromoPurchase(data)
	end
end

function SettingMediator:onClickEffectBtn()
	local isOff = self._settingModel:isTouchEffectOff()

	self._settingSystem:setTouchEffectOff(not isOff)
end

function SettingMediator:onClickFPSBtn(sender)
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

function SettingMediator:downloadPortraitOver()
	local targetNode = self._main:getChildByFullName("resourceDom.redPoint")

	targetNode:setVisible(true)
end

function SettingMediator:downloadSoundCVOver()
	local targetNode = self._main:getChildByFullName("soundDom.redPoint")

	targetNode:setVisible(true)
end

function SettingMediator:onClickGameValueSet()
	local view = self:getInjector():getInstance("GameValueSetView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {}))
end

function SettingMediator:onClickChangeName(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		local view = self:getInjector():getInstance("changeNameView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {}))
	end
end

function SettingMediator:onClickChangeSlogan(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		self._sloganEditBox:setText("")
		self._sloganEditBox:openKeyboard()
	end
end

function SettingMediator:onClickBugFeedBack(sender, eventType)
end

function SettingMediator:onClickGameAnnounce(sender, eventType)
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

function SettingMediator:onClickExit(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		local view = self:getInjector():getInstance("ExitGameView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {}))
	end
end

function SettingMediator:onClickQuestionBtn(sender, eventType)
	if eventType == ccui.TouchEventType.ended and SDKHelper and SDKHelper:isEnableSdk() then
		local url = ConfigReader:getDataByNameIdAndKey("ConfigValue", "SDK_Question_URL", "content") or "https://www.qidian.com/"

		SDKHelper:userQuestion(url)
	end
end

function SettingMediator:onClickAccountCenterBtn(sender, eventType)
	if eventType == ccui.TouchEventType.ended and SDKHelper and SDKHelper:isEnableSdk() then
		SDKHelper:userCenterByPwrdView()
	end
end

function SettingMediator:onClickChangeHeadImg(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		if GameConfigs.fn_change_head_img == false then
			self:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = Strings:get("PM02_UnlockTips")
			}))

			return
		end

		local view = self:getInjector():getInstance("ChangeHeadImgView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {}))
	end
end

function SettingMediator:onClickCheckInBtn()
	local monthSignInSystem = self:getInjector():getInstance(MonthSignInSystem)

	monthSignInSystem:tryEnter()
end

function SettingMediator:onClickBindPhoneBtn()
	if SDKHelper:isEnableSdk() then
		SDKHelper:showBindPhone()
	end
end

function SettingMediator:onClickSpinePortraitBtn()
	self._settingSystem:downloadPortrait()
end

function SettingMediator:onClickSoundCVBtn()
	self._settingSystem:downloadSoundCV()
end

function SettingMediator:getDownloadReward(event)
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

function SettingMediator:commitPlayerInfo()
	local playerInfo = {
		gender = self._playerGender,
		city = self._playerArea,
		birthday = self._playerBirthday,
		tags = self._playerTags
	}

	self._settingSystem:requestUpdatePlayerInfo(playerInfo, function ()
		cc.UserDefault:getInstance():setStringForKey("playerCity", self._playerArea)
		self:showPlayerInfoView()
	end)
end

function SettingMediator:onClickSetSex()
	local view = self:getInjector():getInstance("SetSexPopView")
	local delegate = {}
	local outSelf = self

	function delegate:willClose(_, data)
		if data then
			outSelf._playerGender = data.playerGender

			outSelf:commitPlayerInfo()
		end
	end

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		gender = self._playerGender
	}, delegate))
end

function SettingMediator:onClickSetBirthDay()
	local view = self:getInjector():getInstance("SetBirthdayPopView")
	local delegate = {}
	local outSelf = self

	function delegate:willClose(_, data)
		if data then
			outSelf._playerBirthday = data.birthday

			outSelf:commitPlayerInfo()
		end
	end

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		birthday = self._playerBirthday
	}, delegate))
end

function SettingMediator:onClickSetArea()
	local view = self:getInjector():getInstance("SetAreaPopView")
	local delegate = {}
	local outSelf = self

	function delegate:willClose(_, data)
		if data then
			outSelf._playerArea = data.areaStr

			outSelf:commitPlayerInfo()
		end

		local regionData = outSelf._settingSystem:getRegionData()
		local a = string.split(outSelf._playerArea, "-")
		local b = regionData[a[1]]

		if not b then
			return
		end

		local c = b.FID

		if not c then
			return
		end

		local cityId = c[tonumber(a[2])]

		if not cityId then
			return
		end

		outSelf._settingSystem:requestWeatherData(cityId, function ()
			outSelf:dispatch(Event:new(EVT_HOME_SET_CLIMATE))
		end)
	end

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		playerArea = self._playerArea
	}, delegate))
end

function SettingMediator:onClickSetTags()
	local view = self:getInjector():getInstance("SetTagsPopView")
	local delegate = {}
	local outSelf = self

	function delegate:willClose(_, data)
		if data then
			outSelf._playerTags = data.playerTags

			outSelf:commitPlayerInfo()
		end
	end

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		playerTags = self._playerTags
	}, delegate))
end

function SettingMediator:onClickCopyPlayerID()
	local player = self._developSystem:getPlayer()
	local idStr = string.split(player:getRid(), "_")

	if app.getDevice and app.getDevice() then
		app.getDevice():copyStringToClipboard(idStr[1])
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Setting_Copy_Suc")
		}))
	end
end

function SettingMediator:onClickCode()
	local view = self:getInjector():getInstance("SettingCodeExchangeView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}))
end

function SettingMediator:onClickBuyMonthCard()
	local activitySystem = self:getInjector():getInstance("ActivitySystem")

	activitySystem:tryEnter({
		id = "MonthCard"
	})
end

function SettingMediator:parseTimeStr(timeStr)
	local _tab = {}
	local _str = nil
	local strTab = string.split(timeStr, "-")
	_tab.year = tonumber(strTab[1])
	_tab.month = tonumber(strTab[2])
	_tab.day = tonumber(strTab[3])
	local tag = 0
	local _compData = _tab.month * 100 + _tab.day

	for k, v in ipairs(constellationAge) do
		if v <= _compData then
			tag = tag + 1
		end
	end

	if tag == 0 then
		tag = 12
	end

	_str = Strings:get(constellation[tag])

	return _tab, _str
end

function SettingMediator:isBindPhoneBtnShow()
	local bindState = SDKHelper:readCacheValue("loginType")

	return SDKHelper:isEnableSdk() and LOGIN_TYPE_GUEST == bindState
end

function SettingMediator:isGameAnnounceShow()
	return true
end

function SettingMediator:isAccountCenterBtnShow()
	return false
end

function SettingMediator:isQuestionBtnShow()
	if SDKHelper and SDKHelper:isEnableSdk() then
		return false
	end

	return false
end

function SettingMediator:isBugFeedbackShow()
	local channelId = SDKHelper:getChannelID() or ""

	if channelId == "" or channelId == "test" then
		return true
	end

	local data = ConfigReader:getDataByNameIdAndKey("ConfigValue", "SDKQA_Config", "content")
	local targetLevel = data[channelId] or 9999
	local level = self._developSystem:getPlayer():getLevel()

	return targetLevel <= level
end

function SettingMediator:isCheckInBtnShow()
	return CommonUtils.GetSwitch("fn_check_in")
end

function SettingMediator:isWelfareCodeBtnShow()
	return GameConfigs.showAllSettingBtn or CommonUtils.GetSwitch("hideWelfareCodeBtn")
end

function SettingMediator:isSoundDomShow()
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

function SettingMediator:isResourceDomShow()
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

function SettingMediator:isTermsBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and CommonUtils.GetSwitch("fn_setting_url")
end

function SettingMediator:isPrivacyBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and CommonUtils.GetSwitch("fn_setting_url")
end

function SettingMediator:isReLoginBtnShow()
	return SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn
end

function SettingMediator:isBindAccountBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and not PlatformHelper:isDMMChannel()
end

function SettingMediator:isDeleteAccountBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and not PlatformHelper:isDMMChannel()
end

function SettingMediator:isCustomerServiceBtnShow()
	return SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn
end

function SettingMediator:isInheritanceCodeBtnShow()
	return (SDKHelper and SDKHelper:isEnableSdk() or GameConfigs.showAllSettingBtn) and CommonUtils.GetSwitch("fn_inheritanceCode") and not PlatformHelper:isDMMChannel()
end

function SettingMediator:isTestBtnShow()
	return GameConfigs.testSDK
end
