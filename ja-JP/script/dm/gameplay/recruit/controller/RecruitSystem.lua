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
RecruitAutoBuyCardEx = "RecruitAutoBuyCardEx"
RecruitNewPlayerPool = "DrawCard_NewPlayer"
RecruitAutoBuyCardExZuoHe = "RecruitAutoBuyCardExZuoHe"
RecruitCurrencyStr = {
	KUserDefault = {
		[CurrencyIdKind.kDiamondDrawItem] = RecruitAutoBuyCard,
		[CurrencyIdKind.kDiamondDrawExItem] = RecruitAutoBuyCardEx,
		[CurrencyIdKind.kDiamondDrawExZuoHeItem] = RecruitAutoBuyCardExZuoHe
	},
	KGoToShop = {
		[CurrencyIdKind.kDiamondDrawItem] = Strings:get("Recruit_UI21"),
		[CurrencyIdKind.kDiamondDrawExItem] = Strings:get("Recruit_UI_2"),
		[CurrencyIdKind.kDiamondDrawExZuoHeItem] = Strings:get("Recruit_UI_2")
	},
	KBuyTitle = {
		[CurrencyIdKind.kDiamondDrawItem] = Strings:get("Recruit_UI16"),
		[CurrencyIdKind.kDiamondDrawExItem] = Strings:get("Recruit_UI_1"),
		[CurrencyIdKind.kDiamondDrawExZuoHeItem] = Strings:get("Zuohe_DrawCard_UI1")
	},
	KBuyTitle1 = {
		[CurrencyIdKind.kDiamondDrawItem] = Strings:get("UITitle_EN_Zhaohuanzhizhengbuzu"),
		[CurrencyIdKind.kDiamondDrawExItem] = Strings:get("UITitle_EN_Zhaohuanzhizhengbuzu"),
		[CurrencyIdKind.kDiamondDrawExZuoHeItem] = Strings:get("UITitle_EN_Zhaohuanzhizhengbuzu")
	},
	KBuyContent = {
		[CurrencyIdKind.kDiamondDrawItem] = "Recruit_UI18",
		[CurrencyIdKind.kDiamondDrawExItem] = "Recruit_UI_3",
		[CurrencyIdKind.kDiamondDrawExZuoHeItem] = "Zuohe_DrawCard_UI2"
	},
	KBuyPrice = {
		single = {
			[CurrencyIdKind.kDiamondDrawItem] = ConfigReader:getDataByNameIdAndKey("ConfigValue", "DrawCard_SinglePrice", "content"),
			[CurrencyIdKind.kDiamondDrawExItem] = ConfigReader:getDataByNameIdAndKey("ConfigValue", "DrawCardEX_SinglePrice", "content") or 88888888,
			[CurrencyIdKind.kDiamondDrawExZuoHeItem] = ConfigReader:getDataByNameIdAndKey("ConfigValue", "DrawCardEX_Zuohe_SinglePrice", "content") or 88888888
		},
		ten = {
			[CurrencyIdKind.kDiamondDrawItem] = ConfigReader:getDataByNameIdAndKey("ConfigValue", "DrawCard_TenTimesPrice", "content"),
			[CurrencyIdKind.kDiamondDrawExItem] = ConfigReader:getDataByNameIdAndKey("ConfigValue", "DrawCardEX_TenTimesPrice", "content") or 99999999,
			[CurrencyIdKind.kDiamondDrawExZuoHeItem] = ConfigReader:getDataByNameIdAndKey("ConfigValue", "DrawCardEX_Zuohe_TenTimesPrice", "content") or 99999999
		}
	}
}

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
						if data.recruitType == RecruitPoolType.kClub or data.recruitType == RecruitPoolType.kPve or data.recruitType == RecruitPoolType.kPvp then
							unlock = self:getActivityIsOpen(recruitObj:getId())
							tips = Strings:get("DrewCard_Activity_Closed")
						end

						if unlock then
							return unlock, tips, recruitObj:getId()
						end
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
			if params.times == 10 and SDKHelper and SDKHelper:isEnableSdk() then
				local developSystem = self:getInjector():getInstance(DevelopSystem)
				local data = developSystem:getStatsInfo()
				data.eventName = "10gacha_1st"

				SDKHelper:reportStatsData(data)
			end

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

function RecruitSystem:getCanAutoBuy(costId)
	local st, userStr = self:getBuyTipsStatus(costId)

	return not st
end

function RecruitSystem:getBuyTipsStatus(costId)
	local developSystem = DmGame:getInstance()._injector:getInstance(DevelopSystem)
	local gameServerAgent = DmGame:getInstance()._injector:getInstance(GameServerAgent)
	local idStr = string.split(developSystem:getPlayer():getRid(), "_")
	local userStr = RecruitCurrencyStr.KUserDefault[costId] .. idStr[1]
	local stamp = cc.UserDefault:getInstance():getIntegerForKey(userStr, 0)

	if stamp > 0 then
		local tb = TimeUtil:localDate("*t", stamp)
		local tb1 = TimeUtil:localDate("*t", gameServerAgent:remoteTimestamp())

		if tb.month == tb1.month then
			return false, userStr
		end
	end

	return true, userStr
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
