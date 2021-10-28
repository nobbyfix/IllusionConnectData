local res = require("dm.gameupdate.view.UpdateWidget")
local bindUpdateWidget = res[1]
local PopupUpdateWidget = res[2]
local UpdateMainButton = res[3]
local UpdateViceButton = res[4]
local UpdateAlertView = UpdateAlertView or {}
UpdateAlertResponse = {
	kClose = "close",
	kCancel = "cancel",
	kOK = "ok"
}
local kBtnHandlers = {}
local kMaskDefaultColor = cc.c4b(0, 0, 0, 90)

function UpdateAlertView:getMaskLayer()
	if self._maskLayer == nil then
		local viewSize = cc.Director:getInstance():getWinSize()
		local maskLayer = cc.LayerColor:create(kMaskDefaultColor, viewSize.width * 2, viewSize.height * 2)

		self._view:addChild(maskLayer, -1)
		maskLayer:setTouchEnabled(true)
		maskLayer:setVisible(false)
		maskLayer:setPosition(568, 320)

		self._maskLayer = maskLayer

		maskLayer:registerScriptTouchHandler(function (eventType, x, y)
			local node = self._maskLayer

			while node ~= nil do
				if not node:isVisible() then
					return false
				end

				node = node:getParent()
			end

			if eventType == "began" then
				self:onTouchMaskLayer()

				return true
			end
		end, false, 0, true)
	end

	return self._maskLayer
end

function UpdateAlertView:new()
	local result = setmetatable({}, {
		__index = UpdateAlertView
	})

	result:initialize()

	return result
end

function UpdateAlertView:initialize()
	local resFile = "asset/ui/GameUpdateAlert.csb"
	self._view = cc.CSLoader:createNode(resFile)

	self:getMaskLayer()
	self:onRegister()
end

function UpdateAlertView:getView(...)
	return self._view
end

function UpdateAlertView:dismiss()
	self._view:removeFromParent()

	self._maskLayer = nil
end

UpdateAlertView.bindUpdateWidget = bindUpdateWidget

local function bind1(f, arg1)
	return function (...)
		return f(arg1, ...)
	end
end

function UpdateAlertView:onRegister()
	self._main = self:getView():getChildByName("main")
	self._cancelBtn = self:bindUpdateWidget("main.btn_cancel", UpdateMainButton, {
		handler = {
			func = bind1(self.onCancelClicked, self)
		}
	})
	self._sureBtn = self:bindUpdateWidget("main.btn_ok", UpdateViceButton, {
		handler = {
			func = bind1(self.onOKClicked, self)
		}
	})
end

function UpdateAlertView:setDelegate(delegate)
	self._delegate = delegate
end

function UpdateAlertView:enterWithData(data)
	self._data = data

	self:setUi(data)
end

function UpdateAlertView:setUi(data)
	local title = self._main:getChildByName("Text_title")

	title:setString(data.title)

	local desc = self._main:getChildByName("Text_desc1")

	if data.isRich then
		local text = data.content or ""
		local label = ccui.RichText:createWithXML(text, {})

		label:setAnchorPoint(cc.p(0.5, 0.5))
		label:rebuildElements(true)
		label:formatText()

		if label:getContentSize().width > 650 then
			label:renderContent(650, 0)
		end

		desc:setVisible(false)
		label:addTo(self._main):setPosition(desc:getPosition())
	else
		desc:setString(data.content)
		desc:getVirtualRenderer():setLineHeight(35)
	end

	self._cancelBtn:setVisible(false)
	self._sureBtn:setVisible(false)

	local btnShowCount = 0

	if data.cancelBtn then
		if data.cancelBtn.text then
			self._cancelBtn:setButtonName(data.cancelBtn.text)
		end

		self._cancelBtn:setVisible(true)

		btnShowCount = btnShowCount + 1
	end

	if data.sureBtn then
		if data.sureBtn.text then
			self._sureBtn:setButtonName(data.sureBtn.text)
		end

		self._sureBtn:setVisible(true)

		btnShowCount = btnShowCount + 1
	end

	if btnShowCount == 1 then
		local cancelBtn = self:getView():getChildByFullName("main.btn_cancel")
		local sureBtn = self:getView():getChildByFullName("main.btn_ok")

		sureBtn:setPositionX(453)
		cancelBtn:setPositionX(453)
	end

	local panel = self:getView():getChildByFullName("main.Panel_2")

	panel:setLocalZOrder(-3)

	local img = IconFactory:createRoleIconSpriteNew({
		id = "Model_ZTXChang",
		frameId = "bustframe9"
	})

	img:addTo(self._main, -1):posite(1000, 280)
end

function UpdateAlertView:onCancelClicked(sender, eventType)
	self:close({
		response = UpdateAlertResponse.kCancel
	})
end

function UpdateAlertView:onOKClicked(sender, eventType)
	self:close({
		response = UpdateAlertResponse.kOK
	})
end

function UpdateAlertView:onCloseClicked(sender, eventType)
	self:close({
		response = UpdateAlertResponse.kClose
	})
end

function UpdateAlertView:close(data)
	if self._delegate then
		self._delegate:willClose(self, data)
	end

	self:dismiss()
end

function UpdateAlertView:onTouchMaskLayer()
	if self._data.noClose then
		return
	end

	self:close({
		response = UpdateAlertResponse.kClose
	})
end

return UpdateAlertView
