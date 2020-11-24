BuildingService = class("BuildingService", Service)
local opType = {
	putHeroes = 26015,
	unlockRoom = 26009,
	buyNPlaceBuilding = 26024,
	villageMove = 26004,
	activateBuilding = 26011,
	villageLevelUpBegin = 26001,
	villageLevelUpFinish = 26002,
	villageCancelLevelUp = 26003,
	villageRecycle = 26005,
	collectResource = 26006,
	subOrcLevelUpBegin = 26017,
	subOrcLevelUpFinish = 26018,
	subOrcLevelUpCancel = 26019,
	getHeroLove = 26020,
	buyNPlaceSystemBuilding = 26021,
	oneKeyCollectRes = 26022,
	clearWorkerCD = 26023,
	refreshAfkEvent = 27010
}

function BuildingService:initialize()
	super.initialize(self)
end

function BuildingService:dispose()
	super.dispose(self)
end

function BuildingService:putHeroes(params, blockUI, callback)
	local request = self:newRequest(opType.putHeroes, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:unLockRoom(params, blockUI, callback)
	local request = self:newRequest(opType.unlockRoom, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:buyBuilding(params, blockUI, callback)
	local request = self:newRequest(opType.buyNPlaceBuilding, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:collectResource(params, blockUI, callback)
	local request = self:newRequest(opType.collectResource, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:moveBuilding(params, blockUI, callback)
	local request = self:newRequest(opType.villageMove, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:activateBuilding(params, blockUI, callback)
	local request = self:newRequest(opType.activateBuilding, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:levelUpBuilding(params, blockUI, callback)
	local request = self:newRequest(opType.villageLevelUpBegin, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:levelUpBuildingFinish(params, blockUI, callback)
	local request = self:newRequest(opType.villageLevelUpFinish, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:levelUpBuildingCanel(params, blockUI, callback)
	local request = self:newRequest(opType.villageCancelLevelUp, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:recycleBuilding(params, blockUI, callback)
	local request = self:newRequest(opType.villageRecycle, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:levelUpSubOrc(params, blockUI, callback)
	local request = self:newRequest(opType.subOrcLevelUpBegin, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:finishLevelUpSubOrc(params, blockUI, callback)
	local request = self:newRequest(opType.subOrcLevelUpFinish, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:cancelLevelUpSubOrc(params, blockUI, callback)
	local request = self:newRequest(opType.subOrcLevelUpCancel, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:getHeroLove(params, blockUI, callback)
	local request = self:newRequest(opType.getHeroLove, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:sendBuyNPlaceSystemBuilding(params, blockUI, callback)
	local request = self:newRequest(opType.buyNPlaceSystemBuilding, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:sendOneKeyCollectRes(params, blockUI, callback)
	local request = self:newRequest(opType.oneKeyCollectRes, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:sendclearWorkerCD(params, blockUI, callback)
	local request = self:newRequest(opType.clearWorkerCD, params, callback)

	self:sendRequest(request, blockUI)
end

function BuildingService:sendRefreshAfkEvent(params, blockUI, callback)
	local request = self:newRequest(opType.refreshAfkEvent, params, callback)

	self:sendRequest(request, blockUI)
end
