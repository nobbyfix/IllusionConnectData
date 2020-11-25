PetRaceService = class("PetRaceService", Service)
local opType = {
	initData = 11801,
	regist = 11802,
	embattle = 11803,
	adjustTeamOrder = 11804,
	requestReportDetail = 11805,
	getReward = 11807,
	shout = 11808,
	fastEmbattle = 11810,
	requestWonderBattle = 11811,
	autoEnter = 11812,
	listenPushPetRaceStateChange = 1021,
	listenPushPetRaceKnockoutNumChange = 1022,
	listenPushPetRaceBattleInfo = 1023,
	listenPushShout = 1024
}

function PetRaceService:initialize()
	super.initialize(self)
end

function PetRaceService:dispose()
	super.dispose(self)
end

function PetRaceService:requestData(params, blockUI, callback)
	local request = self:newRequest(opType.initData, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:regist(params, blockUI, callback)
	local request = self:newRequest(opType.regist, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:embattle(params, blockUI, callback)
	local request = self:newRequest(opType.embattle, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:fastEmbattle(params, blockUI, callback)
	local request = self:newRequest(opType.fastEmbattle, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:adjustTeamOrder(params, blockUI, callback)
	local request = self:newRequest(opType.adjustTeamOrder, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:requestReportDetail(params, blockUI, callback)
	local request = self:newRequest(opType.requestReportDetail, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:getReward(params, blockUI, callback)
	local request = self:newRequest(opType.getReward, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:shout(params, blockUI, callback)
	local request = self:newRequest(opType.shout, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:requestWonderBattle(params, blockUI, callback)
	local request = self:newRequest(opType.requestWonderBattle, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:requestAutoEnter(params, blockUI, callback)
	local request = self:newRequest(opType.autoEnter, params, callback)

	self:sendRequest(request, blockUI)
end

function PetRaceService:listenPushPetRaceStateChange(callback)
	self:addPushHandler(opType.listenPushPetRaceStateChange, function (op, response)
		callback(response)
	end)
end

function PetRaceService:listenPushPetRaceKnockoutNumChange(callback)
	self:addPushHandler(opType.listenPushPetRaceKnockoutNumChange, function (op, response)
		callback(response)
	end)
end

function PetRaceService:listenPushPetRaceBattleInfo(callback)
	self:addPushHandler(opType.listenPushPetRaceBattleInfo, function (op, response)
		callback(response)
	end)
end

function PetRaceService:listenPushShout(callback)
	self:addPushHandler(opType.listenPushShout, function (op, response)
		callback(response)
	end)
end
