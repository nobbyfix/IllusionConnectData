PushService = class("PushService", Service, _M)

function PushService:initialize()
	super.initialize(self)
end

function PushService:dispose()
	super.dispose(self)
end

function PushService:listenLoginByOthers(callback)
	self:addPushHandler(9999, function (op, response)
		callback(response)
	end)
end

function PushService:listenTimeChange(callback)
	self:addPushHandler(1002, function (op, response)
		callback(response)
	end)
end

function PushService:listenNewMail(callback)
	self:addPushHandler(1003, function (op, response)
		callback(response)
	end)
end

function PushService:listenFriendPower(callback)
	self:addPushHandler(1005, function (op, response)
		callback(response)
	end)
end

function PushService:listenFriendNewApply(callback)
	self:addPushHandler(1006, function (op, response)
		callback(response)
	end)
end

function PushService:listenFriendCountChange(callback)
	self:addPushHandler(1007, function (op, response)
		callback(response)
	end)
end

function PushService:listenArenaSeasonOver(callback)
	self:addPushHandler(1006, function (op, response)
		callback(response)
	end)
end

function PushService:listenBattleCheckFail(callback)
	self:addPushHandler(1086, function (op, response)
		if callback then
			callback(response)
		end
	end)
end

function PushService:listenWelfareCode(callback)
	self:addPushHandler(1601, function (op, response)
		if callback then
			callback(response)
		end
	end)
end

function PushService:listenForcedToLeaveClubCode(callback)
	self:addPushHandler(1013, function (op, response)
		if callback then
			callback(response)
		end
	end)
end

function PushService:listenRankingRewardCode(callback)
	self:addPushHandler(1266, function (op, response)
		if callback then
			callback(response)
		end
	end)
end

function PushService:listenClubBossKilledCode(callback)
	self:addPushHandler(1300, function (op, response)
		if callback then
			callback(response)
		end
	end)
end

function PushService:listenClubBossTVTipCode(callback)
	self:addPushHandler(1301, function (op, response)
		if callback then
			callback(response)
		end
	end)
end

function PushService:listenClubBossHurtCode(callback)
	self:addPushHandler(1302, function (op, response)
		if callback then
			callback(response)
		end
	end)
end
