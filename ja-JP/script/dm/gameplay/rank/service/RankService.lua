RankService = class("RankService", Service, _M)
local opType = {
	requestNormalRankData = 10601,
	requestAloneRankData = 10602,
	getRewardList = 10603,
	obtainRewardList = 10604,
	getSubsboard = 10605
}

function RankService:initialize()
	super.initialize(self)
end

function RankService:dispose()
	super.dispose(self)
end

function RankService:requestSupportRankData(params, blockUI, callback)
	local request = self:newRequest(opType.getSubsboard, params, callback)

	self:sendRequest(request, blockUI)
end

function RankService:requestRankData(params, blockUI, callback)
	local request = self:newRequest(opType.requestNormalRankData, params, callback)

	self:sendRequest(request, blockUI)
end

function RankService:requestNormalRankData(params, callback, blockUI)
	local request = self:newRequest(opType.requestNormalRankData, params, callback)

	self:sendRequest(request, blockUI)
end

function RankService:requestAloneRankData(params, blockUI, callback)
	local request = self:newRequest(opType.requestAloneRankData, params, callback)

	self:sendRequest(request, blockUI)
end

function RankService:requestGetRewardList(params, blockUI, callback)
	local request = self:newRequest(opType.getRewardList, params, callback)

	self:sendRequest(request, blockUI)
end

function RankService:requestObtainRewardList(params, blockUI, callback)
	local request = self:newRequest(opType.obtainRewardList, params, callback)

	self:sendRequest(request, blockUI)
end
