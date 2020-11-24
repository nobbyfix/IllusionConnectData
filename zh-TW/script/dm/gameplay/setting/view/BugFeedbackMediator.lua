BugFeedbackMediator = class("BugFeedbackMediator", DmPopupViewMediator, _M)

BugFeedbackMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
BugFeedbackMediator:has("_settingSystem", {
	is = "r"
}):injectWith("SettingSystem")

local kBtnHandlers = {
	["main.btnOk.button"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickok"
	}
}

function BugFeedbackMediator:initialize()
	super.initialize(self)
end

function BugFeedbackMediator:dispose()
	super.dispose(self)
end

function BugFeedbackMediator:onRegister()
	super.onRegister(self)
	self:bindWidgets()

	self._main = self:getView():getChildByName("main")
	self._editBox = self._main:getChildByName("TextField")

	self:mapEventListeners()
end

function BugFeedbackMediator:bindWidgets()
	self:bindWidget("main.btnOk", OneLevelViceButton, {})
	self:bindWidget("main.bg", PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickClose, self)
		},
		title = Strings:get("Setting_Text26"),
		title1 = Strings:get("UITitle_EN_Wentifankui"),
		bgSize = {
			width = 690,
			height = 408
		}
	})
end

function BugFeedbackMediator:onRemove()
	super.onRemove(self)
	self._settingSystem:setCurMediatorTag(nil)
end

function BugFeedbackMediator:enterWithData(data)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._bagSystem = self._developSystem:getBagSystem()
	self._player = self._developSystem:getPlayer()
	self._tipsText = self:getView():getChildByFullName("main.tipsText")

	self:setupView()
	self._settingSystem:setCurMediatorTag("BugFeedbackMediator")
end

function BugFeedbackMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_BUGFEEDBACK_SUCC, self, self.close)
end

function BugFeedbackMediator:setupView()
	local maxLength = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Feedback_Word_Limit", "content")
	local touchPanel = self:getView():getChildByFullName("touchPanel")

	touchPanel:setSwallowTouches(false)

	local function callFunc()
		self._tipsText:setVisible(false)
	end

	mapButtonHandlerClick(nil, touchPanel, {
		ignoreClickAudio = true,
		func = callFunc
	})

	if self._editBox:getDescription() == "TextField" then
		self._editBox:setMaxLength(maxLength)
		self._editBox:setMaxLengthEnabled(true)
		self._editBox:setPlaceHolder("")
	end

	self._editBox = convertTextFieldToEditBox(self._editBox)
	self._beginInput = false

	self._editBox:onEvent(function (eventName, sender)
		if eventName == "began" then
			if not self._beginInput then
				self._beginInput = true

				self._editBox:setPlaceHolder("")
				self._editBox:setText("")
			end
		elseif eventName == "ended" then
			local text = self._editBox:getText()

			if text == "" then
				self._tipsText:setVisible(true)
			end
		elseif eventName == "return" then
			-- Nothing
		elseif eventName == "changed" then
			self._oldStr = self._editBox:getText()
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

function BugFeedbackMediator:onClickClose(sender, eventType)
	self:close()
end

function BugFeedbackMediator:onClickok()
	if self._beginInput == false then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("setting_tips3")
		}))

		return
	end

	local str = self._editBox:getText()

	if str == "" then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("setting_tips3")
		}))

		return
	end

	if StringChecker.isAllofCharForbidden(str) then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Setting_Tip7")
		}))

		return
	end

	self._settingSystem:requestBugFeedback(str)
end
