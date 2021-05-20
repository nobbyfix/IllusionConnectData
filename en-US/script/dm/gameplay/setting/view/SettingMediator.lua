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
	["main.setUsr.btn_changename"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickChangeName"
	},
	["main.setUsr.btn_gameSet"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickGameValueSet"
	},
	["main.setUsr.btn_exit"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickExit"
	},
	["main.setUsr.btn_welfareCode"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickCode"
	},
	["main.setUsr.headImg"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickChangeHeadImg"
	},
	["main.setUsr.changeHeadBtn"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickChangeHeadImg"
	},
	["main.setUsr.btn_changeslogan"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickChangeSlogan"
	},
	["main.setUsr.sexBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSetSex"
	},
	["main.setUsr.birthDayBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSetBirthDay"
	},
	["main.setUsr.areaBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSetArea"
	},
	["main.setUsr.tagsPanel"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSetTags"
	},
	["main.setUsr.tagsPanel.monthCard"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickBuyMonthCard"
	},
	["main.setUsr.copyBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickCopyPlayerID"
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
		btnShow = "isAccountCenterBtnShow",
		btnName = "setting_ui_AccountCenter",
		id = "accountBtn",
		callback = {
			clickAudio = "Se_Click_Common_2",
			func = "onClickAccountCenterBtn"
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
		btnRes = "sz_btn_grxx_wtfk.png",
		btnShow = "isQuestionBtnShow",
		btnName = "setting_ui_QuestionBtn",
		id = "questionBtn",
		callback = {
			clickAudio = "Se_Click_Common_2",
			func = "onClickQuestionBtn"
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
		title = Strings:get("Setting_Title_Player_Info"),
		title1 = Strings:get("UITitle_EN_Gerenxinxi"),
		bgSize = {
			width = 902,
			height = 480
		}
	})

	self._main = self:getView():getChildByName("main")
	self._listView = self._main:getChildByFullName("listView")
	self._usrNode = self._main:getChildByFullName("setUsr")
	self._sloganEditBox = self._main:getChildByFullName("setUsr.TextField")

	self:loadPlayerInfo()

	local areaBtn = self._main:getChildByFullName("setUsr.areaBtn")
	local area = self._main:getChildByFullName("setUsr.area")
	local text3 = self._main:getChildByFullName("setUsr.text3")
	local Image3 = self._main:getChildByFullName("setUsr.Image3")

	areaBtn:setVisible(false)
	area:setVisible(false)
	text3:setVisible(false)
	Image3:setVisible(false)

	if getCurrentLanguage() ~= GameLanguageType.CN then
		local idString = self._main:getChildByFullName("setUsr.id_String")
		local idValue = self._main:getChildByFullName("setUsr.id_value")

		idValue:setPositionX(idString:getPositionX() + idString:getContentSize().width + 5)

		local text1 = self._main:getChildByFullName("setUsr.text1")
		local sex = self._main:getChildByFullName("setUsr.sex")

		sex:setPositionX(text1:getPositionX() + text1:getContentSize().width + 5)

		local text2 = self._main:getChildByFullName("setUsr.text2")
		local birthDay = self._main:getChildByFullName("setUsr.birthDay")

		birthDay:setPositionX(text2:getPositionX() + text2:getContentSize().width + 5)
		birthDay:setPositionY(150)

		local text3 = self._main:getChildByFullName("setUsr.text3")
		local area = self._main:getChildByFullName("setUsr.area")

		area:setPositionX(text3:getPositionX() + text3:getContentSize().width + 5)
	end
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
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_REWARDS_SUCC, self, self.showDownloadReward)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_PORTRAIT_OVER, self, self.downloadPortraitOver)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_SOUNDCV_OVER, self, self.downloadSoundCVOver)
	self:mapEventListener(self:getEventDispatcher(), EVT_BIND_ACCOUNT, self, self.refreshRightList)
	self:mapEventListener(self:getEventDispatcher(), EVT_CHANGEHEADFRAME_SUCC, self, self.showSettingView)
end

function SettingMediator:enterWithData(data)
	self._settingModel = self._settingSystem:getSettingModel()

	self:showSettingView()
	self:showPlayerInfoView()
	self:setGameVersion()
	self:refreshRightList()
end

function SettingMediator:showPlayerInfoView()
	local genderView = self._usrNode:getChildByName("sex")
	local birthdayView = self._usrNode:getChildByName("birthDay")
	local constellationView = self._usrNode:getChildByName("constellation")
	local cityView = self._usrNode:getChildByName("area")
	local tagsView = self._usrNode:getChildByName("tagsPanel")

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
		local s = getCurrentLanguage() ~= GameLanguageType.CN and "\n" or ""

		birthdayView:setString(tostring(birthdayTab.month) .. Strings:get("Setting_UI_Month") .. "-" .. tostring(birthdayTab.day) .. Strings:get("Setting_UI_Day") .. s .. constellationStr)
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
	local layout = self._main

	layout:setVisible(true)

	local player = self._developSystem:getPlayer()
	local nameText = layout:getChildByFullName("setUsr.name_value")

	nameText:setString(player:getNickName())

	local idText = layout:getChildByFullName("setUsr.id_value")
	local idStr = string.split(player:getRid(), "_")

	idText:setString(idStr[1])

	local levelText = layout:getChildByFullName("setUsr.level_value")
	local TextLevel = layout:getChildByFullName("setUsr.Text_level")

	levelText:setString(player:getLevel())
	levelText:setPositionX(TextLevel:getPositionX() + TextLevel:getContentSize().width + 2)

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

	local targetBtn = self:getView():getChildByFullName("main.setUsr.btn_welfareCode")

	if GameConfigs.hideWelfareCodeBtn then
		targetBtn:setVisible(false)
	else
		targetBtn:setVisible(true)
	end
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

function SettingMediator:onClickClose(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		self:close()
	end
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
	if SDKHelper and SDKHelper:isEnableSdk() then
		local player = self._developSystem:getPlayer()

		SDKHelper:openAIHelpElva(tostring(player:getRid()), player:getNickName(), self._developSystem:getServerId())
	else
		local CSDHelper = require("sdk.CSDHelper")
		local player = self._developSystem:getPlayer()

		cc.Application:getInstance():openURL(CSDHelper:getCSDUrl(player:getRid()))
	end
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

function SettingMediator:showDownloadReward(event)
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
	if SDKHelper and SDKHelper:isEnableSdk() then
		return true
	end

	return false
end

function SettingMediator:isQuestionBtnShow()
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
