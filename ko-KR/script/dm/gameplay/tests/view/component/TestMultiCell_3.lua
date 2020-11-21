TestMultiCell_3 = class("TestMultiCell_3", DmBaseUI)
local kBtnHandlers = {}

function TestMultiCell_3:initialize(data)
	super.initialize(self)
	self:setView(data.view)
	self:intiView()
	self:mapButtonHandlersClick(kBtnHandlers)
end

function TestMultiCell_3:update(data, index)
end

function TestMultiCell_3:intiView()
end
