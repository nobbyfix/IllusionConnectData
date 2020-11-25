SetAccountPopMediator = class("SetAccountPopMediator", DmPopupViewMediator)
local kBtnHandlers = {}

function SetAccountPopMediator:initialize()
	super.initialize(self)
end

function SetAccountPopMediator:dispose()
	super.dispose(self)
end

function SetAccountPopMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._main = self:getView():getChildByName("main")
	self._btnClone = self._main:getChildByName("btnClone"):setVisible(false)
	self._btnsView = self._main:getChildByName("btnsView"):setVisible(true)
	self._btnUnbind = self._main:getChildByName("btn_unbind")

	self:bindWidget("main.bg", PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickClose, self)
		},
		title = Strings:get("Setting_Ui_Text_15"),
		title1 = Strings:get("UITitle_EN_Zhanghaoshezhi"),
		bgSize = {
			width = 800,
			height = 540
		}
	})
	self:bindWidget("main.btn_unbind", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickUnbind, self)
		}
	})
	self._btnUnbind:setGray(true)
end

function SetAccountPopMediator:enterWithData(data)
	self._btnsView:removeAllChildren()

	if data and data.list and next(data.list) then
		self._list = data.list
		local num = #self._list

		for i = 1, num do
			local btn = self._btnClone:clone():setVisible(true)
			local iconPath = self._list[i].icon .. ".png"

			dump(iconPath, "iconName")

			local icon = cc.Sprite:createWithSpriteFrameName(iconPath)
			local size = icon:getContentSize()

			icon:setPosition(cc.p(size.height * 0.5, size.width * 0.5))
			icon:setAnchorPoint(0.5, 0.5)
			btn:getChildByName("icon"):addChild(icon)
			btn:getChildByName("text"):setString(self._list[i].text)

			local width = size.width + btn:getChildByName("text"):getContentSize().width

			btn:getChildByName("Image1"):setVisible(false)
			btn:getChildByName("Image0"):setVisible(self._list[i].canBind)
			btn:getChildByName("Image"):setVisible(not self._list[i].canBind)
			btn:setPosition(cc.p(self._btnsView:getContentSize().width * 0.5, 280 - i * 80))
			btn:addTo(self._btnsView):setTag(i)
			mapButtonHandlerClick(self, btn, {
				ignoreClickAudio = true,
				func = "onClickBind"
			})
		end
	else
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))
	end
end

function SetAccountPopMediator:onClickClose(sender, eventType)
	self:close()
end

function SetAccountPopMediator:onClickBind(sender, eventType)
	local tag = sender:getTag()

	if self._list[tag] then
		local data = self._list[tag]

		if data.canBind then
			sender:getChildByName("Image1"):setVisible(false)

			local view = self:getInjector():getInstance("SetAccountPopupView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, {}, nil))
		else
			sender:getChildByName("Image1"):setVisible(true)

			self._select = tag
		end
	else
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))

		return
	end
end

function SetAccountPopMediator:onClickUnbind(sender)
	local tag = sender:getTag()

	if self._list[tag] then
		local data = self._list[tag]

		if data.canBind then
			local view = self:getInjector():getInstance("SetAccountPopupView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, {
				gender = self._playerGender
			}, delegate))
		else
			sender:getChildByName("Image1"):setVisible(true)

			self._select = tag
		end
	else
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))

		return
	end
end

SetAccountPopupMediator = class("SetAccountPopupMediator", DmPopupViewMediator, _M)

SetAccountPopupMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
SetAccountPopupMediator:has("_settingSystem", {
	is = "r"
}):injectWith("SettingSystem")
SetAccountPopupMediator:has("_gameServer", {
	is = "r"
}):injectWith("GameServerAgent")

function SetAccountPopupMediator:initialize()
	super.initialize(self)
end

function SetAccountPopupMediator:dispose()
	self._viewClose = true

	super.dispose(self)
end

function SetAccountPopupMediator:onRemove()
	super.onRemove(self)
end

function SetAccountPopupMediator:onRegister()
	super.onRegister(self)

	self._main = self:getView():getChildByName("main")
	self._textField = self._main:getChildByFullName("TextField"):setVisible(false)
	self._cancelBtn = self:bindWidget("main.btn_cancel", OneLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Cancle",
			func = bind1(self.onCancelClicked, self)
		}
	})
	self._sureBtn = self:bindWidget("main.btn_ok", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Confirm",
			func = bind1(self.onOKClicked, self)
		}
	})
end

function SetAccountPopupMediator:userInject()
end

function SetAccountPopupMediator:enterWithData(data)
	self._data = data

	self:setUi(data)
end

function SetAccountPopupMediator:setUi(data)
	dump(data, "SetAccountPopupMediator:setUi(data)")

	local bgNode = self._main:getChildByFullName("bg")
	local tempNode = bindWidget(self, bgNode, PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = not self._data.noClose and bind1(self.onCloseClicked, self) or nil
		},
		title = data.title,
		title1 = data.title1 or ""
	})

	tempNode:getView():getChildByFullName("btn_close"):setVisible(not self._data.noClose)

	if not self._data.noClose then
		-- Nothing
	end

	local descShowCount = 0
	local desc1 = self._main:getChildByName("Text_desc1")
	local desc2 = self._main:getChildByName("Text_desc2")

	if data.isRich then
		local text1 = data.content1 or ""
		local textData = string.split(text1, "<font")

		if #textData <= 1 then
			text1 = Strings:get("UPDATE_UI9", {
				text = text1,
				fontName = TTF_FONT_FZYH_R
			})
		end

		local label = ccui.RichText:createWithXML(text1, {})

		label:setAnchorPoint(cc.p(0.5, 0.5))
		label:setVerticalSpace(5)
		label:rebuildElements(true)
		label:formatText()

		if label:getContentSize().width > 670 then
			label:renderContent(670, 0)
		end

		desc1:setVisible(false)
		label:addTo(self._main):setPosition(desc1:getPosition()):offset(0, 5)

		local text2 = data.content2 or ""
		local textData = string.split(text2, "<font")

		if #textData <= 1 then
			text2 = Strings:get("UPDATE_UI9", {
				text = text2,
				fontName = TTF_FONT_FZYH_R
			})
		end

		local label = ccui.RichText:createWithXML(text2, {})

		label:setAnchorPoint(cc.p(0.5, 0.5))
		label:setVerticalSpace(5)
		label:rebuildElements(true)
		label:formatText()

		if label:getContentSize().width > 670 then
			label:renderContent(670, 0)
		end

		desc2:setVisible(false)
		label:addTo(self._main):setPosition(desc1:getPosition()):offset(0, 5)
	else
		desc1:setString(data.content1)
		desc1:getVirtualRenderer():setLineHeight(35)
		desc2:setString(data.content2)
		desc2:getVirtualRenderer():setLineHeight(30)
	end

	if data.textField then
		if self._textField:getDescription() == "TextField" then
			self._textField:setPlaceHolder(data.textField.holdText)
			self._textField:setMaxLength(10)
			self._textField:setMaxLengthEnabled(true)
			self._textField:setTouchAreaEnabled(false)
			self._textField:setString(data.textField.text or "")
		end

		self._textField = convertTextFieldToEditBox(self._textField, nil, )

		self._textField:onEvent(function (eventName, sender)
			if eventName == "began" then
				-- Nothing
			elseif eventName == "ended" then
				if self._nameStr ~= "" then
					self._sureBtn:getButton():setEnabled(true)
				else
					self._sureBtn:getButton():setEnabled(false)
				end
			elseif eventName == "return" then
				-- Nothing
			elseif eventName == "changed" then
				self._nameStr = self._urlEditBox:getText()
			elseif eventName == "ForbiddenWord" then
				self:dispatch(ShowTipEvent({
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
		self._textField:setVisible(true)

		descShowCount = descShowCount + 1
	end

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
		if data.sureBtn.timer and data.sureBtn.text then
			local time = data.sureBtn.timer.cnt or 0
			local developSystem = DmGame:getInstance()._injector:getInstance("DevelopSystem")
			local endTime = developSystem:getCurServerTime() + time
			local btnText, btnText1 = nil
			btnText = data.sureBtn.text

			if data.sureBtn.text1 then
				btnText1 = data.sureBtn.text1
			end

			self._sureBtn:setButtonName(data.sureBtn.text, data.sureBtn.text1)

			local function checkTimeFunc()
				local curTime = developSystem:getCurServerTime()
				local remainTime = endTime - curTime

				dump(remainTime, "remainTime")

				if remainTime >= 0 then
					remainTime = math.ceil(remainTime)

					self._sureBtn:setButtonName("(" .. remainTime .. ")" .. btnText)
					self._sureBtn:getButton():setEnabled(false)
				else
					self._sureBtn:setButtonName(btnText)
					self._sureBtn:getButton():setEnabled(true)
					LuaScheduler:getInstance():unschedule(self._timer)
				end
			end

			if not self._timer then
				self._timer = LuaScheduler:getInstance():schedule(checkTimeFunc, 0.1, false)

				checkTimeFunc()
			end
		elseif data.sureBtn.text then
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
		local cancelBtn = self:getView():getChildByFullName("main.btn_cancel")
		local sureBtn = self:getView():getChildByFullName("main.btn_ok")

		sureBtn:setPositionX(567)
		cancelBtn:setPositionX(567)
	end
end

function SetAccountPopupMediator:onCancelClicked(sender, eventType)
	self:close({
		response = AlertResponse.kCancel
	})
end

function SetAccountPopupMediator:onOKClicked(sender, eventType)
	if self._data.nameStr then
		local player = self._developSystem:getPlayer()

		if self._nameStr ~= player:getNickName() then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Common_Tip1")
			}))

			return
		end
	end

	self:close({
		response = AlertResponse.kOK,
		textField = self._nameStr
	})
end

function SetAccountPopupMediator:onCloseClicked(sender, eventType)
	if self._timer then
		LuaScheduler:getInstance():unschedule(self._timer)
	end

	self:close({
		response = AlertResponse.kClose
	})
end

function SetAccountPopupMediator:willBeClosed(payload)
	if type(payload) ~= "table" then
		payload = {
			response = AlertResponse.kCancel
		}
	end

	if self._timer then
		LuaScheduler:getInstance():unschedule(self._timer)
	end

	super.willBeClosed(self, payload)
end

function SetAccountPopupMediator:onTouchMaskLayer()
	if self._data.noClose then
		return
	end

	self:close({
		response = AlertResponse.kClose
	})
end
