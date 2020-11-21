EVT_RECRUIT_SUCC = "EVT_RECRUIT_SUCC"
EVT_RECRUIT_BOX_GET_SUCC = "EVT_RECRUIT_BOX_GET_SUCC"
EVT_SIGNET_RECRUIT_SUCC = "EVT_SIGNET_RECRUIT_SUCC"
EVT_RECRUIT_FAIL = "EVT_RECRUIT_FAIL"
RecruitSystem = class("RecruitSystem", Facade, _M)

RecruitSystem:has("_service", {
	is = "r"
}):injectWith("RecruitService")
RecruitSystem:has("_manager", {
	is = "r"
})
RecruitSystem:has("_systemKeeper", {
	is = "rw"
}):injectWith("SystemKeeper")

RecruitAutoBuyCard = "RecruitAutoBuyCard"
RecruitNewPlayerPool = "DrawCard_NewPlayer"

function RecruitSystem:initialize()
	super.initialize(self)

	self._manager = RecruitPoolManager:new()
end

function RecruitSystem:sync(data, player)
	self._manager:sync(data)
	self._manager:setPlayer(player)
end

function RecruitSystem:checkEnabled(data)
	local unlock, tips = self._systemKeeper:isUnlock("Draw_Hero")

	if data then
		if data.recruitId then
			local recruitObj = self._manager:getRecruitPoolById(data.recruitId)

			assert(recruitObj, "unknown drawcardId...." .. data.recruitId)

			local unlockKey = recruitObj:getCondition()

			if unlockKey ~= "" then
				unlock, tips = self._systemKeeper:isUnlock(unlockKey)
			end
		elseif data.recruitType then
			local recruitObjs = self._manager:getRecruitPoolByType(data.recruitType)

			for k, recruitObj in pairs(recruitObjs) do
				local unlockKey = recruitObj:getCondition()

				if unlockKey ~= "" then
					unlock, tips = self._systemKeeper:isUnlock(unlockKey)

					if unlock then
						return unlock, tips, recruitObj:getId()
					end
				elseif recruitObj:getType() == RecruitPoolType.kActivity then
					local unlock = self:getActivityIsOpen(recruitObj:getId())

					if unlock then
						return unlock, tips, recruitObj:getId()
					end
				end
			end
		end
	end

	return unlock, tips
end

function RecruitSystem:tryEnter(data)
	dump(data, "data")

	local unlock, tips, recruitId = self:checkEnabled(data)

	if not unlock then
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = tips
		}))
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)

		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Story_Common", false)

	local view = self:getInjector():getInstance("RecruitView")

	if data and recruitId then
		data.recruitId = recruitId
	end

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))
end

function RecruitSystem:requestRecruit(params, callback, blockUI)
	params = {
		drawID = params.id,
		times = params.times
	}

	self:getService():requestRecruit(params, function (response)
		if response.resCode == GS_SUCCESS then
			local data = response.data

			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_RECRUIT_SUCC, data))
		else
			self:dispatch(Event:new(EVT_RECRUIT_FAIL))
		end
	end, blockUI)
end

function RecruitSystem:requestRewardPreview(params, callback, blockUI)
	params = {
		drawID = params.drawID,
		key = params.key
	}

	self:getService():requestRewardPreview(params, function (response)
		if response.resCode == GS_SUCCESS then
			local data = response.data.reward or {}

			if callback then
				callback(data)
			end
		end
	end, blockUI)
end

function RecruitSystem:requestOpenRewardBox(recruitTimes, callback, blockUI)
	local params = {
		targetPoints = recruitTimes
	}

	self:getService():requestOpenRewardBox(params, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_RECRUIT_BOX_GET_SUCC, response))
		end
	end, blockUI)
end

function RecruitSystem:getDrawTimeById(id)
	return self._manager:getDrawTimeMap()[id]
end

function RecruitSystem:checkIsShowRedPoint()
	local recruitManager = self:getManager()
	local recruitPools = recruitManager:getRecruitPools()

	for id, recruitObj in pairs(recruitPools) do
		if recruitObj then
			local type = recruitObj:getType()
			local unlockKey = recruitObj:getCondition()

			if unlockKey ~= "" then
				local unlock, tips = self._systemKeeper:isUnlock(unlockKey)

				if unlock then
					local recruitCost = recruitObj:getRealCostIdAndCount()[1].costCount == 0 or recruitObj:getRealCostIdAndCount()[2] and recruitObj:getRealCostIdAndCount()[2].costCount == 0

					if recruitCost then
						return true
					end
				end
			end
		end
	end

	return false
end

function RecruitSystem:doReset(resetId, value)
	value = value or 0

	if resetId == ResetId.kRecruitGoldFree then
		local recruitPool = self._manager:getRecruitPoolById(RecruitPoolId.kHeroGold)

		recruitPool:setFreeTimes(value)
	elseif resetId == ResetId.kRecruitDiamondFree then
		local recruitPool = self._manager:getRecruitPoolById(RecruitPoolId.kHeroDiamond)

		recruitPool:setFreeTimes(value)
	elseif resetId == ResetId.kRecruitEquipFree then
		local recruitPool = self._manager:getRecruitPoolById(RecruitPoolId.kEquip)

		recruitPool:setFreeTimes(value)
	elseif resetId == ResetId.kRecruitDiamondTimes then
		self._manager:setBoxRewardRecruitTimes(value)
	end
end

function RecruitSystem:getCanAutoBuy()
	self.playerRid = self:getInjector():getInstance("DevelopSystem"):getPlayer():getRid()
	local value = cc.UserDefault:getInstance():getIntegerForKey(self.playerRid .. RecruitAutoBuyCard)

	if not value or value == 0 then
		return false
	end

	return true

	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local lastLoginTime = gameServerAgent:remoteTimestamp()
	local clock5Time = TimeUtil:getTimeByDateForTargetTimeInToday({
		sec = 0,
		min = 0,
		hour = 5
	})

	if clock5Time - value >= 0 and lastLoginTime < clock5Time or clock5Time < value then
		return true
	end

	return false
end

function RecruitSystem:getActivityIsOpen(recruitId)
	local activitySystem = self:getInjector():getInstance(ActivitySystem)
	local activities = activitySystem:getActivitiesByType(ActivityType.kDRAWCARDOPEN)

	for id, activity in pairs(activities) do
		if activitySystem:isActivityOpen(id) and not activitySystem:isActivityOver(id) then
			local activityConfig = activity:getActivityConfig()

			if activityConfig.DRAW and recruitId == activityConfig.DRAW then
				return true, activity:getId()
			end
		end
	end

	return false
end

function RecruitSystem:getRecruitRealCost(recruitPool, recruitCost, realTimes)
	local id = recruitPool:getId()
	local offCount = recruitPool:getOffCount()
	local timeMap = self:getDrawTimeById(id)
	local time = tonumber(timeMap[tostring(realTimes)]) + 1
	local oldCount = recruitCost.costCount

	for i = 1, #offCount do
		local discount = offCount[i]
		local min = discount[1]
		local max = discount[2]
		local count = discount[3]

		if max == -1 and min <= time or min <= time and time <= max then
			recruitCost.costCount = count

			break
		end
	end

	local costOff = math.floor(recruitCost.costCount / oldCount * 100)

	return recruitCost, costOff
end
