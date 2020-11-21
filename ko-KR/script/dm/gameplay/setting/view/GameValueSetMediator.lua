GameValueSetMediator = class("GameValueSetMediator", DmPopupViewMediator)

GameValueSetMediator:has("_settingSystem", {
	is = "r"
}):injectWith("SettingSystem")
GameValueSetMediator:has("_loginSystem", {
	is = "r"
}):injectWith("LoginSystem")

local kBtnHandlers = {}
local soundOpenImage = "sz_btn_sy02.png"
local soundCloseImage = "sz_btn_sy01.png"
local volumeConHeight = 9
local volumeConWidth = 2.4
local adjustSafeX = 100
local UNBING_TIPS_TYPE = {
	WARNING = 1,
	EXIT_GAME = 3,
	IMPUT_NAME = 2,
	SHOW_TIME = 4
}
local kBtnHandlers = {
	["main.btn_3_view.bindGoogle"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onBindGoogle"
	},
	["main.btn_3_view.bindFB"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onBindFaceBook"
	},
	["main.btn_3_view.unBind"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onUnBind"
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

	self:bindWidget("main.bg", PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.close, self)
		},
		title = Strings:get("Setting_GameValue_Set"),
		title1 = Strings:get("UITitle_EN_Youxishezhi"),
		bgSize = {
			width = 690,
			height = 408
		}
	})

	self._cancelBtn = self:bindWidget("main.bindTips.btn_cancel", OneLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Cancle",
			func = bind1(self.onCloseBindTips, self)
		}
	})
	self._sureBtn = self:bindWidget("main.bindTips.btn_ok", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Confirm",
			func = bind1(self.onBindOKClicked, self)
		}
	})

	self:mapEventListener(self:getEventDispatcher(), EVT_GET_BIND_INFO, self, self.refreshBindView)
end

function GameValueSetMediator:enterWithData()
	self._selectTag = 1
	self._curBindType = nil

	self:setupView()
	self:initGameSetValue()
	self:setTab()
end

function GameValueSetMediator:setupView()
	local soundSetView = self:getView():getChildByFullName("main.btn_1_view")
	local pictureSetView = self:getView():getChildByFullName("main.btn_2_view")
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
	self._unBindTips = self:getView():getChildByFullName("main.bindTips")
	self._editBox = self._unBindTips:getChildByName("TextField")
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

function GameValueSetMediator:setTab()
	for i = 1, 3 do
		local _btn = self:getView():getChildByFullName("main.btn_" .. i)
		local view = self:getView():getChildByFullName("main.btn_" .. i .. "_view")

		if i == self._selectTag then
			_btn:getChildByFullName("light"):setVisible(true)
			_btn:getChildByFullName("dark"):setVisible(false)
			view:setVisible(true)
		else
			_btn:getChildByFullName("light"):setVisible(false)
			_btn:getChildByFullName("dark"):setVisible(true)
			view:setVisible(false)
		end

		_btn:setTag(i)

		_btn.view = view

		local function callfunc(sender)
			self:onClickTabBtn(sender)
		end

		mapButtonHandlerClick(nil, _btn, {
			clickAudio = "Se_Click_Tab_1",
			func = callfunc
		})

		local lightText = _btn:getChildByFullName("light.text")
		local darkText = _btn:getChildByFullName("dark.text")

		lightText:enableOutline(cc.c4b(3, 1, 4, 51), 1)
		lightText:setColor(cc.c4b(177, 235, 16, 73.94999999999999))
		lightText:enableShadow(cc.c4b(3, 1, 4, 25.5), cc.size(1, 0), 1)
		darkText:enableOutline(cc.c4b(3, 1, 4, 51), 1)
		darkText:setColor(cc.c4b(110, 108, 108, 255))
		darkText:enableShadow(cc.c4b(3, 1, 4, 25.5), cc.size(1, 0), 1)
	end

	local btnBind = self:getView():getChildByFullName("main.btn_3")

	btnBind:setVisible(CommonUtils.GetSwitch("fn_setting_bind"))
end

function GameValueSetMediator:initGameSetValue()
	self:initAdjustSlider()
	self:initSoundSlider()
	self:initMusicSlider()
	self:initRoleSoundSlider()
	self:initBindView()
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

function GameValueSetMediator:initSoundSlider()
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

function GameValueSetMediator:initRoleSoundSlider()
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

function GameValueSetMediator:onClickTabBtn(sender)
	local tag = sender:getTag()

	if tag == self._selectTag then
		return
	end

	local oldBtn = self:getView():getChildByFullName("main.btn_" .. self._selectTag)

	oldBtn:getChildByFullName("light"):setVisible(false)
	oldBtn:getChildByFullName("dark"):setVisible(true)

	local oldView = oldBtn.view

	oldView:setVisible(false)
	sender:getChildByFullName("light"):setVisible(true)
	sender:getChildByFullName("dark"):setVisible(false)

	local view = sender.view

	view:setVisible(true)

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

function GameValueSetMediator:initBindView()
	local googleBtnView = self:getView():getChildByFullName("main.btn_3_view.bindGoogle")
	local googleBtnText = self:getView():getChildByFullName("main.btn_3_view.bindGoogle.title")

	if SDKHelper and SDKHelper:isBindGoogle() then
		googleBtnView:setGray(true)
		googleBtnView:setTouchEnabled(false)
		googleBtnText:setTextColor(cc.c3b(195, 195, 195))
	else
		googleBtnView:setGray(false)
		googleBtnView:setTouchEnabled(true)
		googleBtnText:setTextColor(cc.c3b(255, 255, 255))
	end

	local fbBtnView = self:getView():getChildByFullName("main.btn_3_view.bindFB")
	local fbBtnText = self:getView():getChildByFullName("main.btn_3_view.bindFB.title")

	if SDKHelper and SDKHelper:isBindFB() then
		fbBtnView:setGray(true)
		fbBtnView:setTouchEnabled(false)
		fbBtnText:setTextColor(cc.c3b(195, 195, 195))
	else
		fbBtnView:setGray(false)
		fbBtnView:setTouchEnabled(true)
		fbBtnText:setTextColor(cc.c3b(255, 255, 255))
	end
end

function GameValueSetMediator:refreshBindView(event)
	local googleBtnView = self:getView():getChildByFullName("main.btn_3_view.bindGoogle")
	local googleBtnText = self:getView():getChildByFullName("main.btn_3_view.bindGoogle.title")

	if SDKHelper and SDKHelper:isBindGoogle() then
		googleBtnView:setGray(true)
		googleBtnView:setTouchEnabled(false)
		googleBtnText:setTextColor(cc.c3b(195, 195, 195))
	else
		googleBtnView:setGray(false)
		googleBtnView:setTouchEnabled(true)
		googleBtnText:setTextColor(cc.c3b(255, 255, 255))
	end

	local fbBtnView = self:getView():getChildByFullName("main.btn_3_view.bindFB")
	local fbBtnText = self:getView():getChildByFullName("main.btn_3_view.bindFB.title")

	if SDKHelper and SDKHelper:isBindFB() then
		fbBtnView:setGray(true)
		fbBtnView:setTouchEnabled(false)
		fbBtnText:setTextColor(cc.c3b(195, 195, 195))
	else
		fbBtnView:setGray(false)
		fbBtnView:setTouchEnabled(true)
		fbBtnText:setTextColor(cc.c3b(255, 255, 255))
	end
end

function GameValueSetMediator:showBindTips(data)
	local bgNode = self._unBindTips:getChildByFullName("bg")
	local tempNode = bindWidget(self, bgNode, PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onCloseBindTips, self)
		},
		title = Strings:get("GUEST_ACCOUNT_PAY_WARNING_Title"),
		title1 = Strings:get("GUEST_ACCOUNT_PAY_WARNING_Title1") or ""
	})

	tempNode:getView():getChildByFullName("btn_close"):setVisible(not data.noClose)

	local title = self._unBindTips:getChildByName("Text_title")
	local desc = self._unBindTips:getChildByName("Text_desc1")
	local desc2 = self._unBindTips:getChildByName("Text_desc2")
	local bgImage = self._unBindTips:getChildByName("Image_2")

	bgImage:setContentSize(cc.size(697, 117))

	if UNBING_TIPS_TYPE.WARNING == data.type or UNBING_TIPS_TYPE.EXIT_GAME == data.type then
		title:setVisible(true)
		desc:setVisible(true)
		desc2:setVisible(false)
		self._editBox:setVisible(false)
		bgImage:setPositionY(361)
	elseif UNBING_TIPS_TYPE.IMPUT_NAME == data.type then
		title:setVisible(true)
		desc:setVisible(false)
		desc2:setVisible(true)
		self._editBox:setVisible(true)
		bgImage:setContentSize(cc.size(697, 60))
		bgImage:setPositionY(335)

		local nameDi = self._unBindTips:getChildByName("Image_2")
		local pos = nameDi:convertToWorldSpace(cc.p(0, 0))
		nameDi.worldPositionY = pos.y

		nameDi:setTouchEnabled(true)
		nameDi:addTouchEventListener(function (sender, eventType)
			if eventType == ccui.TouchEventType.ended then
				self._editBox:openKeyboard()
			end
		end)

		local maxLength = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Player_Name_MaxWords", "content")

		if self._editBox:getDescription() == "TextField" then
			self._editBox:setMaxLength(maxLength)
			self._editBox:setMaxLengthEnabled(true)
			self._editBox:setPlaceHolder(Strings:get("Name_Settingup"))
		end

		self._editBox = convertTextFieldToEditBox(self._editBox)

		self._editBox:onEvent(function (eventName, sender)
			if eventName == "began" then
				placeHolder = self._editBox:getPlaceHolder()
			elseif eventName == "ended" then
				-- Nothing
			elseif eventName == "return" then
				-- Nothing
			elseif eventName == "changed" then
				-- Nothing
			elseif eventName == "ForbiddenWord" then
				self:getEventDispatcher():dispatchEvent(ShowTipEvent({
					tip = Strings:get("Common_Tip1")
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

	title:setString(data.title or "")
	desc:setString(data.content or "")
	desc:getVirtualRenderer():setLineHeight(35)
	desc2:setString(data.content2 or "")
	self._cancelBtn:setVisible(false)
	self._sureBtn:setVisible(false)

	local btnShowCount = 0

	if data.cancelBtn then
		if data.cancelBtn.text then
			if data.cancelBtn.text1 then
				self._cancelBtn:setButtonName(data.cancelBtn.text, data.cancelBtn.text1)
			else
				self._cancelBtn:setButtonName(data.cancelBtn.text)
			end
		end

		self._cancelBtn:setVisible(true)

		btnShowCount = btnShowCount + 1
	end

	if data.sureBtn then
		if data.sureBtn.text then
			if data.sureBtn.text1 then
				self._sureBtn:setButtonName(data.sureBtn.text, data.sureBtn.text1)
			else
				self._sureBtn:setButtonName(data.sureBtn.text)
			end
		end

		self._sureBtn:setVisible(true)

		btnShowCount = btnShowCount + 1
	end

	if btnShowCount == 1 then
		self._sureBtn:getView():setPositionX(567)
		self._cancelBtn:getView():setPositionX(567)
	end

	self._unBindTips:setVisible(true)
end

function GameValueSetMediator:onBindGoogle()
	if SDKHelper and SDKHelper:isEnableSdk() then
		SDKHelper:bindGoogle()
	else
		self:dispatch(ShowTipEvent({
			tip = Strings:get("BindNotOpen")
		}))
	end
end

function GameValueSetMediator:onBindFaceBook()
	if SDKHelper and SDKHelper:isEnableSdk() then
		SDKHelper:bindFB()
	else
		self:dispatch(ShowTipEvent({
			tip = Strings:get("BindNotOpen")
		}))
	end
end

function GameValueSetMediator:onUnBind()
	self._curBindType = UNBING_TIPS_TYPE.WARNING
	local data = {
		type = UNBING_TIPS_TYPE.WARNING,
		cancelBtn = {}
	}
	data.cancelBtn.text = Strings:get("UNBIND_ACCOUNT_CANCEL")
	data.cancelBtn.text1 = Strings:get("UNBIND_ACCOUNT_CANCLE_EN")
	data.sureBtn = {
		text = Strings:get("UNBIND_ACCOUNT"),
		text1 = Strings:get("UNBIND_ACCOUNT_EN")
	}
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local playerName = developSystem:getNickName()
	data.title = Strings:get("UNBIND_ACCOUNT_TITLE", {
		name = playerName
	})
	data.content = Strings:get("UNBIND_ACCOUNT_DESC")

	self:showBindTips(data)
end

function GameValueSetMediator:onCloseBindTips()
	self._unBindTips:setVisible(false)

	if self._curBindType and UNBING_TIPS_TYPE.EXIT_GAME == self._curBindType then
		dmAudio.releaseAllAcbs()
		dmAudio.stopAll(AudioType.Music)

		if SDKHelper and SDKHelper:isEnableSdk() then
			self._loginSystem:saveGamePoliceAgreeSta(false)
			SDKHelper:logOut()
		end

		REBOOT("REBOOT_NOUPDATE")
	end
end

function GameValueSetMediator:onBindOKClicked()
	if self._curBindType and UNBING_TIPS_TYPE.WARNING == self._curBindType then
		self._unBindTips:setVisible(false)

		self._curBindType = UNBING_TIPS_TYPE.IMPUT_NAME
		local data = {
			type = UNBING_TIPS_TYPE.IMPUT_NAME,
			cancelBtn = {}
		}
		data.cancelBtn.text = Strings:get("UNBIND_ACCOUNT_CANCEL")
		data.cancelBtn.text1 = Strings:get("UNBIND_ACCOUNT_CANCLE_EN")
		data.sureBtn = {
			text = Strings:get("UNBIND_ACCOUNT"),
			text1 = Strings:get("UNBIND_ACCOUNT_EN")
		}
		local developSystem = self:getInjector():getInstance(DevelopSystem)
		data.title = developSystem:getNickName()
		data.content2 = Strings:get("UNBIND_ACCOUNT_DESC2")

		self:showBindTips(data)
	elseif self._curBindType and UNBING_TIPS_TYPE.IMPUT_NAME == self._curBindType then
		local developSystem = self:getInjector():getInstance(DevelopSystem)
		local playerName = developSystem:getNickName()

		if playerName == self._editBox:getText() then
			local accountId = SDKHelper:getOffAccountId()

			self._settingSystem:requestUnBindAccount(accountId, function (status, response)
				local cjson = require("cjson.safe")
				local resData = cjson.decode(response)

				if resData and resData.data and resData.data.logOffData then
					SDKHelper:setOffTimeData(resData.data.logOffData, resData.data.time)
				end

				self._unBindTips:setVisible(false)

				self._curBindType = UNBING_TIPS_TYPE.EXIT_GAME
				local data = {
					type = UNBING_TIPS_TYPE.EXIT_GAME,
					sureBtn = {}
				}
				data.sureBtn.text = Strings:get("UNBIND_ACCOUNT_OK")
				data.sureBtn.text1 = Strings:get("UNBIND_ACCOUNT_OK_EN")
				local developSystem = self:getInjector():getInstance(DevelopSystem)
				data.title = Strings:get("UNBIND_ACCOUNT_SUC_TITLE")
				data.content = Strings:get("UNBIND_ACCOUNT_SUC_DESC")

				self:showBindTips(data)
			end)
		else
			self:dispatch(ShowTipEvent({
				tip = Strings:get("UNBIND_ACCOUNT_NAME_WARNING")
			}))
		end
	elseif self._curBindType and UNBING_TIPS_TYPE.EXIT_GAME == self._curBindType then
		dmAudio.releaseAllAcbs()
		dmAudio.stopAll(AudioType.Music)

		if SDKHelper and SDKHelper:isEnableSdk() then
			self._loginSystem:saveGamePoliceAgreeSta(false)
			SDKHelper:logOut()
		end

		REBOOT("REBOOT_NOUPDATE")
	end
end
