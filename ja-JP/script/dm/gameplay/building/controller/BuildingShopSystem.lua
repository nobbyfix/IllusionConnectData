BuildingShopSystem = class("BuildingShopSystem", Facade)

function BuildingShopSystem:initialize()
	super.initialize(self)
end

function BuildingShopSystem:userInject()
	self:listenPush()
end

function BuildingShopSystem:listenPush()
end

function BuildingShopSystem:dispose()
	super.dispose(self)
end
