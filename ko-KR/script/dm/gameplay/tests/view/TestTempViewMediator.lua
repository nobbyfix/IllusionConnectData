TestTempViewMediator = class("TestTempViewMediator", DmPopupViewMediator)

TestTempViewMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
TestTempViewMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")

local kBtnHandlers = {}

function TestTempViewMediator:initialize()
	super.initialize(self)
end

function TestTempViewMediator:dispose()
	super.dispose(self)
end

function TestTempViewMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListeners()
end

function TestTempViewMediator:mapEventListeners()
end

function TestTempViewMediator:enterWithData(data)
	self:setupView()
end

function TestTempViewMediator:setupView()
	self._des = self:getChildView("Panel_base.Text_des")
	local text = Strings:get("Maincity_Benefit_Detail4", {
		fontName = TTF_FONT_FZYH_M
	})
	local label = ccui.RichText:createWithXML(Strings:get("ActivityBlock_EightDays_Sign"), {
		KEY_VERTICAL_SPACE = 10
	})

	self._des:addChild(label)
	label:setPosition(cc.p(280, 0))
end
