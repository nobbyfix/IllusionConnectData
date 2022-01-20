CrusadeAlertMediator = class("CrusadeAlertMediator", DmPopupViewMediator, _M)
local kBtnHandlers = {}

function CrusadeAlertMediator:initialize()
	super.initialize(self)
end

function CrusadeAlertMediator:dispose()
	super.dispose(self)
end

function CrusadeAlertMediator:onRemove()
	super.onRemove(self)
end

function CrusadeAlertMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._main = self:getView():getChildByName("main")
	self._sureBtn = self:bindWidget("main.btn_ok", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Confirm",
			func = bind1(self.onOKClicked, self)
		}
	})
end

function CrusadeAlertMediator:userInject()
end

function CrusadeAlertMediator:enterWithData(data)
	self._data = data

	self:setUi(data)
end

function CrusadeAlertMediator:setUi(data)
	local bgNode = self._main:getChildByFullName("bg")
	local tempNode = bindWidget(self, bgNode, PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onCloseClicked, self)
		},
		title = data.title,
		title1 = data.title1 or ""
	})
	local desc = self._main:getChildByName("Text_desc1")

	if data.isRich then
		desc:setString("")

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

		label:addTo(self._main):setPosition(desc:getPosition()):offset(0, 5)
	else
		desc:setString(data.content)
		desc:getVirtualRenderer():setLineHeight(35)
	end

	local costdesc1 = self._main:getChildByName("Text_desc1_0")
	local costdesc2 = self._main:getChildByName("Text_cost")
	local costImg = self._main:getChildByFullName("Image_9")

	if data.isfree then
		costImg:setVisible(false)
		costdesc2:setVisible(false)
		costdesc1:setString(data.costText)
	else
		costdesc1:setVisible(false)
		costdesc2:setString(data.costText)
	end
end

function CrusadeAlertMediator:onOKClicked(sender, eventType)
	self:close({
		response = AlertResponse.kOK
	})
end

function CrusadeAlertMediator:onCloseClicked(sender, eventType)
	self:close({
		response = AlertResponse.kClose
	})
end
