GameValueSetMediator = class("GameValueSetMediator", DmPopupViewMediator)

GameValueSetMediator:has("_settingSystem", {
	is = "r"
}):injectWith("SettingSystem")

local kBtnHandlers = {}
local soundOpenImage = "sz_btn_sy02.png"
local soundCloseImage = "sz_btn_sy01.png"
local volumeConHeight = 9
local volumeConWidth = 2.4
local adjustSafeX = 100

function GameValueSetMediator:initialize()
	super.initialize(self)
end

function GameValueSetMediator:dispose()
	super.dispose(self)
end

function GameValueSetMediator:onRegister()
	super.onRegister(self)

	self._settingModel = self._settingSystem:getSettingModel()

	self:bindWidget("main.bg", PopupNormalWidget, {
		fontSize = 51,
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
end

function GameValueSetMediator:enterWithData()
	self._selectTag = 1

	self:setupView()
	self:initGameSetValue()
	self:setTab()
end

function GameValueSetMediator:setupView()
	local soundSetView = self:getView():getChildByFullName("main.btn_1_view")
	local pictureSetView = self:getView():getChildByFullName("main.btn_2_view")

	soundSetView:setPositionX(435)
	pictureSetView:setPositionX(435)

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
end

function GameValueSetMediator:initGameSetValue()
	self:initAdjustSlider()
	self:initSoundSlider()
	self:initMusicSlider()
	self:initRoleSoundSlider()
	self:initSettingLanguage()
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

function GameValueSetMediator:initSettingLanguage()
	local language = getCurrentLanguage()

	for i = 1, #GameSupportLanguage do
		local node = self:getView():getChildByFullName("main.btn_3_view.nodeLang_" .. i)
		local checkBox = node:getChildByFullName("checkBox")

		node:setVisible(true)
		node:getChildByFullName("langText"):setString(GameLanguageTypeForShowText[GameSupportLanguage[i]])

		local isOff = false

		if GameSupportLanguage[i] == language then
			isOff = true
			self._lastLanguageTag = i

			checkBox:setEnabled(false)
		end

		checkBox:setSelected(isOff)
		checkBox:setTag(i)
		checkBox:addEventListener(function (sender, eventType)
			self:onClickLanguageBtn(sender)
		end)
	end
end

function GameValueSetMediator:updateLanguageBtnState(selectId)
	local _lang = nil

	for i = 1, #GameSupportLanguage do
		local node = self:getView():getChildByFullName("main.btn_3_view.nodeLang_" .. i)
		local checkBox = node:getChildByFullName("checkBox")

		if selectId == i then
			checkBox:setSelected(true)

			_lang = GameSupportLanguage[i]
		else
			checkBox:setSelected(false)
		end
	end

	return _lang
end

function GameValueSetMediator:onClickLanguageBtn(sender, eventType)
	local selectId = sender:getTag()
	local lang = self:updateLanguageBtnState(selectId)
	local outSelf = self
	local delegate = {
		willClose = function (self, popupMediator, data)
			if data.response == "ok" then
				setCurrentLanguage(lang)
				REBOOT()
			elseif data.response == "cancel" then
				outSelf:updateLanguageBtnState(outSelf._lastLanguageTag)
			elseif data.response == "close" then
				outSelf:updateLanguageBtnState(outSelf._lastLanguageTag)
			end
		end
	}
	local data = {
		title = Strings:get("Game_Set_Language"),
		content = Strings:get("Setting_lang_tips"),
		sureBtn = {},
		cancelBtn = {}
	}
	local view = self:getInjector():getInstance("AlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end
