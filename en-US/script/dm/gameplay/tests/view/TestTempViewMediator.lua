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

	local anim = cc.MovieClip:create("zhu_qingdianrili")

	anim:setPosition(cc.p(300, 300))
	anim:addTo(self._view):offset(250, 0)

	local rootNode = cc.Label:createWithTTF("c", TTF_FONT_FZYH_M, 20)
	local content = cc.Node:create()

	content:addTo(rootNode)
	content:center(rootNode:getContentSize())

	local flyBall = cc.MovieClip:create("guangqiu_lindaguangquan", "BattleMCGroup")

	flyBall:addTo(content)
	flyBall:offset(110, -20)
	content:setRotation(4)
	flyBall:addCallbackAtFrame(45, function ()
		flyBall:stop()
	end)

	local tipText1 = cc.Label:createWithTTF("1", TTF_FONT_FZYH_M, 20)

	tipText1:setPosition(cc.p(500, 600))
	tipText1:addTo(self._view)

	local tipText2 = cc.Label:createWithTTF("2", TTF_FONT_FZYH_M, 20)

	tipText2:setPosition(cc.p(800, 180))
	tipText2:addTo(self._view)
	rootNode:addTo(tipText1)
	rootNode:center(tipText1:getContentSize())

	local position_01 = cc.p(tipText1:getPosition())
	local position_02 = cc.p(tipText2:getPosition())
	local radio = math.abs(position_02.x - position_01.x) / math.abs(position_02.y - position_01.y)
	local direction = position_02.x - position_01.x < 0 and 1 or -1
	local distance = math.sqrt(math.pow(math.abs(position_02.x - position_01.x), 2) + math.pow(math.abs(position_02.y - position_01.y), 2))
	local distance = distance - 250

	print(direction)
	rootNode:setRotation(math.atan(radio * direction) * 180 / math.pi)

	local delay = cc.DelayTime:create(0.5)
	local sequence = cc.Sequence:create(delay, cc.MoveTo:create(0.16666666666666666, cc.p(0, -distance)))

	content:runAction(sequence)
end
