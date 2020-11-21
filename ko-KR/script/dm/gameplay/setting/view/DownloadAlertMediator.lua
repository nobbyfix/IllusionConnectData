DownloadAlertMediator = class("DownloadAlertMediator", DmPopupViewMediator, _M)
local kBtnHandlers = {}

function DownloadAlertMediator:initialize()
	super.initialize(self)
end

function DownloadAlertMediator:dispose()
	self._viewClose = true

	super.dispose(self)
end

function DownloadAlertMediator:onRemove()
	super.onRemove(self)
end

function DownloadAlertMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._main = self:getView():getChildByName("main")
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

function DownloadAlertMediator:userInject()
end

function DownloadAlertMediator:enterWithData(data)
	self._data = data

	self:setUi(data)
end

function DownloadAlertMediator:setUi(data)
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

	local desc = self._main:getChildByName("Text_desc1")

	if data.isRich then
		local text = data.content or ""
		local textData = string.split(text, "<font")

		if #textData <= 1 then
			text = Strings:get("UPDATE_UI9", {
				text = text,
				fontName = TTF_FONT_FZYH_R
			})
		end

		local label = ccui.RichText:createWithXML(text, {})

		label:setAnchorPoint(cc.p(0.5, 0.5))
		label:setVerticalSpace(5)
		label:rebuildElements(true)
		label:formatText()

		if label:getContentSize().width > 670 then
			label:renderContent(670, 0)
		end

		desc:setVisible(false)
		label:addTo(self._main):setPosition(desc:getPosition()):offset(0, 5)
	else
		desc:setString(data.content)
		desc:getVirtualRenderer():setLineHeight(35)
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
		local cancelBtn = self:getView():getChildByFullName("main.btn_cancel")
		local sureBtn = self:getView():getChildByFullName("main.btn_ok")

		sureBtn:setPositionX(567)
		cancelBtn:setPositionX(567)
	end
end

function DownloadAlertMediator:onCancelClicked(sender, eventType)
	self:close({
		response = AlertResponse.kCancel
	})
end

function DownloadAlertMediator:onOKClicked(sender, eventType)
	local curNetState = 1

	if app.getDevice and app.getDevice() then
		curNetState = app.getDevice():getNetworkStatus()
	end

	if curNetState == 0 then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("setting_ui_DownloadTips_4")
		}))

		return
	end

	self:close({
		response = AlertResponse.kOK
	})
end

function DownloadAlertMediator:onCloseClicked(sender, eventType)
	if self._data.noClose then
		return
	end

	self:close({
		response = AlertResponse.kClose
	})
end

function DownloadAlertMediator:willBeClosed(payload)
	if type(payload) ~= "table" then
		payload = {
			response = AlertResponse.kCancel
		}
	end

	super.willBeClosed(self, payload)
end

function DownloadAlertMediator:onTouchMaskLayer()
	if self._data.noClose then
		return
	end

	self:close({
		response = AlertResponse.kClose
	})
end
