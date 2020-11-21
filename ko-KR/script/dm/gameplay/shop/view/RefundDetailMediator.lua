RefundDetailMediator = class("RefundDetailMediator", DmPopupViewMediator, _M)

function RefundDetailMediator:initialize()
	super.initialize(self)
end

function RefundDetailMediator:dispose()
	super.dispose(self)
end

function RefundDetailMediator:onRegister()
	super.onRegister(self)
end

function RefundDetailMediator:enterWithData(data)
	self:initWidgetInfo()
	self:initContent()
end

function RefundDetailMediator:initWidgetInfo()
	local title1 = Strings:get("Shop_Refund_UITtile")
	local title2 = Strings:get("Shop_Refund_EN_UITitle")
	local btn_close = self:getView():getChildByFullName("bg.bgNode.btn_close")
	local title_node = self:getView():getChildByFullName("bg.bgNode.title_node")

	btn_close:addClickEventListener(function ()
		self:onClickClose()
	end)
	bindWidget(self, "bg.bgNode.title_node", PopupNormalTitle, {
		title = title1,
		title1 = title2
	})

	self._mainPanel = self:getView():getChildByFullName("bg")
	self._listView = self._mainPanel:getChildByName("listview")
end

function RefundDetailMediator:initContent()
	self._listView:setScrollBarEnabled(false)

	local ruld = Strings:get("Shop_Refund_Content")

	self:addContent(Strings:get("Shop_Refund_UITtile"), 1)
	self:addContent(ruld, 2)
end

function RefundDetailMediator:addContent(content, index)
	local contextPanel = self._mainPanel:getChildByName("context_panal")

	contextPanel:setVisible(false)

	local panel = contextPanel:getChildByName("context"):clone()

	if index == 1 then
		panel = contextPanel:getChildByName("title"):clone()
	end

	panel:setVisible(true)

	if index == 2 then
		panel:setTextAreaSize(cc.size(contextPanel:getContentSize().width, 0))
	end

	panel:setString(content)
	panel:setLineSpacing(3)

	local size = panel:getContentSize()

	panel:setContentSize(cc.size(size.width, size.height + 15))
	self._listView:pushBackCustomItem(panel)
end

function RefundDetailMediator:onClickClose()
	self:close()
end
