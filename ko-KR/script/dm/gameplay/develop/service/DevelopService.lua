DevelopService = class("DevelopService", Service, _M)
local opType = {
	enterType = 10025,
	guideLog = 10027
}

function DevelopService:initialize()
	super.initialize(self)
end

function DevelopService:dispose()
	super.dispose(self)
end

function DevelopService:enterType(params, blockUI, callback)
	local request = self:newRequest(opType.enterType, params, callback)

	self:sendRequest(request, blockUI)
end

function DevelopService:guideLog(params, blockUI, callback)
	local request = self:newRequest(opType.guideLog, params, callback)

	self:sendRequest(request, blockUI)
end
