SurprisePointService = class("SurprisePointService", Service, _M)

function SurprisePointService:requestContinueReward(params, blockUI, callback)
	local request = self:newRequest(10506, params, callback)

	self:sendRequest(request, blockUI)
end
