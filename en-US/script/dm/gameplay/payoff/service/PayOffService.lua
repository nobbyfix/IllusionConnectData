PayOffService = class("PayOffService", Service, _M)
local opType = {
	success = 1701,
	webSuccess = 1703,
	failed = 1702
}

function PayOffService:initialize()
	super.initialize(self)
end

function PayOffService:dispose()
	super.dispose(self)
end

function PayOffService:listenPayOffDiff(callback)
	self:addPushHandler(1701, function (op, response)
		callback("success", response)
	end)
	self:addPushHandler(1702, function (op, response)
		callback("failed", response)
	end)
	self:addPushHandler(1703, function (op, response)
		callback("webSuccess", response)
	end)
end
