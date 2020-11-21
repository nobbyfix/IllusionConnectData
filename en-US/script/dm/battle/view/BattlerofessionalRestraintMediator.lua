local kBtnHandlers = {}
BattlerofessionalRestraintMediator = class("BattlerofessionalRestraintMediator", PopupViewMediator, _M)

function BattlerofessionalRestraintMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	local Text_des = self:getView():getChildByFullName("main.Text_des3")
	local desc = Strings:get("Desc_BattleDominating_Line3", {
		fontName = TTF_FONT_FZYH_M
	})
	local richText = ccui.RichText:createWithXML(desc, {})

	richText:setAnchorPoint(cc.p(0, 0.8))
	richText:renderContent(450, 0, true)
	richText:setPosition(cc.p(Text_des:getPosition()))
	richText:addTo(Text_des:getParent())
end

function BattlerofessionalRestraintMediator:onTouchMaskLayer()
	self:close()
end
