EVT_LEAVETIME_CHANGE = "EVT_LEAVETIME_CHANGE"
EVT_REFRESH_SPVIEW = "EVT_REFRESH_SPVIEW"

require("dm.gameplay.spStage.model.SpStage")

SpStageSystem = class("SpStageSystem", legs.Actor)

SpStageSystem:has("_spStageService", {
	is = "r"
}):injectWith("SpStageService")
SpStageSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
SpStageSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
SpStageSystem:has("_model", {
	is = "rw"
})
SpStageSystem:has("_inSpStageMain", {
	is = "rw"
})
SpStageSystem:has("_inSpStageType", {
	is = "rw"
})
SpStageSystem:has("_spStageSort", {
	is = "rw"
})

local spStageIds = ConfigReader:getRecordById("ConfigValue", "StageSp_List").content
SpStageType = {
	kGold = "gold",
	kSkill1 = "skill_1",
	kSkill2 = "skill_2",
	kEquip = "equipment",
	kExp = "exp",
	kCrystal = "crystal",
	kSkill3 = "skill_3"
}
SpStageLoadingType = {
	[SpStageType.kGold] = LoadingType.KStageGold,
	[SpStageType.kExp] = LoadingType.KStageExp,
	[SpStageType.kCrystal] = LoadingType.KStageCrystal,
	[SpStageType.kEquip] = LoadingType.KStageCrystal,
	[SpStageType.kSkill1] = LoadingType.KStageCrystal,
	[SpStageType.kSkill2] = LoadingType.KStageCrystal,
	[SpStageType.kSkill3] = LoadingType.KStageCrystal
}
SpStageUnlock = {
	[SpStageType.kGold] = ConfigReader:getDataByNameIdAndKey("BlockSp", spStageIds[SpStageType.kGold], "UnlockCondition"),
	[SpStageType.kExp] = ConfigReader:getDataByNameIdAndKey("BlockSp", spStageIds[SpStageType.kExp], "UnlockCondition"),
	[SpStageType.kCrystal] = ConfigReader:getDataByNameIdAndKey("BlockSp", spStageIds[SpStageType.kCrystal], "UnlockCondition"),
	[SpStageType.kEquip] = ConfigReader:getDataByNameIdAndKey("BlockSp", spStageIds[SpStageType.kEquip], "UnlockCondition"),
	[SpStageType.kSkill1] = ConfigReader:getDataByNameIdAndKey("BlockSp", spStageIds[SpStageType.kSkill1], "UnlockCondition"),
	[SpStageType.kSkill2] = ConfigReader:getDataByNameIdAndKey("BlockSp", spStageIds[SpStageType.kSkill2], "UnlockCondition"),
	[SpStageType.kSkill3] = ConfigReader:getDataByNameIdAndKey("BlockSp", spStageIds[SpStageType.kSkill3], "UnlockCondition")
}
kSpStageTeamAndPointType = {
	[SpStageType.kGold] = {
		pointType = "GOLD",
		teamType = StageTeamType.GOLD_STAGE,
		unlockType = SpStageUnlock[SpStageType.kGold],
		rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BlockSP_Gold_Rule", "content")
	},
	[SpStageType.kExp] = {
		pointType = "EXP",
		teamType = StageTeamType.EXP_STAGE,
		unlockType = SpStageUnlock[SpStageType.kExp],
		rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BlockSP_Exp_Rule", "content")
	},
	[SpStageType.kCrystal] = {
		pointType = "CRYSTAL",
		teamType = StageTeamType.CRYSTAL_STAGE,
		unlockType = SpStageUnlock[SpStageType.kCrystal],
		rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BlockSP_Crystal_Rule", "content")
	},
	[SpStageType.kEquip] = {
		pointType = "EQUIPMENT",
		teamType = StageTeamType.STAGE_EQUIP,
		unlockType = SpStageUnlock[SpStageType.kEquip],
		rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BlockSp_Equipment_Rule", "content")
	},
	[SpStageType.kSkill1] = {
		pointType = "SKILL_1",
		teamType = StageTeamType.STAGE_SKILL1,
		unlockType = SpStageUnlock[SpStageType.kSkill1],
		rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BlockSp_Skill_1_Rule", "content")
	},
	[SpStageType.kSkill2] = {
		pointType = "SKILL_2",
		teamType = StageTeamType.STAGE_SKILL2,
		unlockType = SpStageUnlock[SpStageType.kSkill2],
		rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BlockSp_Skill_2_Rule", "content")
	},
	[SpStageType.kSkill3] = {
		pointType = "SKILL_3",
		teamType = StageTeamType.STAGE_SKILL3,
		unlockType = SpStageUnlock[SpStageType.kSkill3],
		rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BlockSp_Skill_3_Rule", "content")
	}
}
SpStageBoxState = {
	kClose = 0,
	kHasReceived = 2,
	kCanReceive = 1
}
SpStageResetId = {
	StageSp_Crystal = "BlockSp_Crystal",
	StageSp_Exp = "BlockSp_Exp",
	StageSp_Gold = "BlockSp_Gold"
}
SpExtraResetId = {
	StageSp_Crystal = "BlockExtra_Crystal",
	StageSp_Exp = "BlockExtra_Exp",
	StageSp_Gold = "BlockExtra_Gold"
}

function SpStageSystem:initialize()
	super.initialize(self)

	self._model = SpStage:new()
	self._inSpStageMain = 0
	self._inSpStageType = nil
	self._spStageSort = {}
	self._resetKey = {}
end

function SpStageSystem:checkEnabled(params)
	local unlock, tips = self._systemKeeper:isUnlock("BlockSp_All")

	if not unlock then
		return unlock, tips
	end

	unlock, tips = self._systemKeeper:isUnlock("BlockSp_Entrance")

	if not unlock then
		return unlock, tips
	end

	if params and params.spType then
		local data = kSpStageTeamAndPointType[params.spType]

		if data then
			unlock, tips = self._systemKeeper:isUnlock(data.unlockType)
		end
	end

	return unlock, tips
end

function SpStageSystem:checkEnabledWithTimes(params)
	local unlock, tips = self:checkEnabled(params)

	if unlock and params.stageId then
		local leaveTimes = self:getStageLeaveTime(params.stageId)

		if self:getStageLeaveTime(params.stageId) <= 0 then
			tips = Strings:get("MAZE_TIMES")
			unlock = false
		end
	end

	return unlock, tips
end

function SpStageSystem:tryEnter(params)
	local unlock, tips = self:checkEnabled(params)

	if not unlock then
		self:dispatch(ShowTipEvent({
			tip = tips
		}))
	else
		local view = self:getInjector():getInstance("SpStageMainView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, params))

		if params and params.subView then
			self:tryEnterSubView(params.subView, params)
		end
	end
end

function SpStageSystem:tryEnterSubView(viewName, params)
	local view = self:getInjector():getInstance(viewName)

	if view then
		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, params, nil))
	end
end

function SpStageSystem:synchronize(data)
	self._model:synchronize(data)
end

function SpStageSystem:getStageTypeById(id)
	for k, v in pairs(spStageIds) do
		if v == id then
			return k
		end
	end

	return nil
end

function SpStageSystem:getRewardById(id)
	local rewardPath = ConfigReader:getDataByNameIdAndKey("BlockSp", id, "ShowReward")

	if rewardPath == "" then
		return {}
	end

	local rewards = RewardSystem:getRewardsById(rewardPath)

	return rewards
end

function SpStageSystem:getIntroductionJob(id)
	local introduction = ConfigReader:getDataByNameIdAndKey("BlockSp", id, "IntroductionHero")
	local jobs = {}

	if introduction then
		for _, v in pairs(introduction) do
			for _, vv in pairs(v.Job) do
				table.insert(jobs, 1, vv)
			end
		end
	end

	return jobs
end

function SpStageSystem:getSpecialDesc(id)
	local desc_1 = ""
	local desc_2 = ""
	local descArr = ConfigReader:getDataByNameIdAndKey("BlockSp", id, "SpecialDesc")

	if descArr[1] then
		desc_1 = Strings:get(descArr[1], {
			fontName = TTF_FONT_FZYH_R
		})
	end

	if descArr[2] then
		desc_2 = Strings:get(descArr[2], {
			fontName = TTF_FONT_FZYH_R
		})
	end

	return {
		desc_1,
		desc_2
	}
end

function SpStageSystem:getPointConfigByType(spType)
	if not kSpStageTeamAndPointType[spType] then
		return nil
	end

	local stageId = spStageIds[spType]
	local pointList = ConfigReader:getDataByNameIdAndKey("BlockSp", stageId, "SubPoint")

	if pointList then
		local pointConfig = {}

		for i = 1, #pointList do
			local pointId = pointList[i]
			local config = ConfigReader:getRecordById("BlockSpPoint", pointId)

			if config then
				pointConfig[#pointConfig + 1] = config
			end
		end

		if #pointConfig > 0 then
			table.sort(pointConfig, function (a, b)
				return a.Difficulty < b.Difficulty
			end)
		end

		return pointConfig
	end

	return nil
end

function SpStageSystem:getPointTeamByType(spType)
	if not kSpStageTeamAndPointType[spType] then
		return nil
	end

	local teamType = kSpStageTeamAndPointType[spType].teamType

	return teamType
end

function SpStageSystem:isStageFinish(id)
	local leaveTimes = self:getStageLeaveTime(id)

	if leaveTimes <= 0 then
		return true
	end

	return false
end

function SpStageSystem:getStageLeaveTime(id)
	local stageInfo = self._model:getStageById(id)
	local leaveTimes = stageInfo and stageInfo:getChallengeTime() or 2

	return leaveTimes
end

function SpStageSystem:getExtraRewardTime(id, spType)
	local type = string.format("stagesp_%s", spType)
	local player = self._developSystem:getPlayer()
	local extraUpCount = player:getEffectCenter():getExtraUpById(type)
	local stageInfo = self._model:getStageById(id)

	if stageInfo and stageInfo:getExtraRewardTime() then
		return stageInfo:getExtraRewardTime().value + extraUpCount
	end

	return extraUpCount
end

function SpStageSystem:getStageDamage(id)
	local stageInfo = self._model:getStageById(id)
	local damage = stageInfo and stageInfo:getTotalProgressCount() or 0
	local preDamage = stageInfo and stageInfo:getPreTotalProgressCount() or 0

	return damage, preDamage
end

function SpStageSystem:setPreDamage(id)
	local stageInfo = self._model:getStageById(id)
	local damage = stageInfo and stageInfo:getTotalProgressCount() or 0

	stageInfo:setPreTotalProgressCount(damage)
end

function SpStageSystem:getProgressTypeStr(id)
	local progressType = ConfigReader:getDataByNameIdAndKey("BlockSp", id, "ProgressType")
	local str = ""

	if progressType == "KILL" then
		str = Strings:get("SPECIAL_STAGE_TEXT_22")
	elseif progressType == "DAMAGE" then
		str = Strings:get("SPECIAL_STAGE_TEXT_23")
	end

	return str
end

function SpStageSystem:getReceivedRewards(id)
	local stageInfo = self._model:getStageById(id)

	if stageInfo then
		return stageInfo:getReceivedRewards()
	end

	return {}
end

function SpStageSystem:getPointInfo(id)
	local stageInfo = self._model:getStageById(id)

	if stageInfo then
		return stageInfo:getPointInfo()
	end

	return nil
end

function SpStageSystem:getRewardState(id)
	local stageInfo = self._model:getStageById(id)

	if stageInfo then
		return stageInfo:getReceivedRewards()
	end

	return nil
end

function SpStageSystem:getStageById(id)
	return self._model:getStageById(id)
end

function SpStageSystem:getFirstBoxIndex(stageId)
	local config = ConfigReader:getRecordById("BlockSp", stageId)

	if config then
		local progressReward = config.ProgressReward

		if progressReward ~= nil and progressReward ~= {} then
			local boxState = self:getReceivedRewards(stageId)
			local num = table.nums(boxState)

			for i = 1, num do
				local index = nil
				local hasReceived = false

				for k, v in pairs(boxState) do
					if v == progressReward[i] then
						hasReceived = true
					end
				end

				if hasReceived == false then
					if i == 1 then
						return 1
					end

					index = math.floor((i - 1) / 3) * 3 + 1

					if index < 1 then
						return 1
					elseif index > #progressReward - 2 then
						return #progressReward - 2
					end

					return index
				end
			end

			local index = math.floor(num / 3) * 3 + 1

			if index < 1 then
				return 1
			elseif index > #progressReward - 2 then
				return #progressReward - 2
			end

			return index
		end
	end

	return 1
end

function SpStageSystem:getShowBoxList(stageId)
	local list = {}
	local config = ConfigReader:getRecordById("BlockSp", stageId)

	if config and config.ProgressReward ~= {} and config.ProgressReward ~= nil then
		local firstIndex = self:getFirstBoxIndex(stageId)
		local receivedRewards = self:getReceiveBox(stageId)

		for i = 1, 3 do
			local index = firstIndex + i - 1
			local data = {
				id = config.ProgressReward[index],
				index = index,
				state = SpStageBoxState.kClose
			}

			for k, v in pairs(receivedRewards) do
				if v == data.id then
					data.state = SpStageBoxState.kHasReceived
				end
			end

			list[#list + 1] = data
		end
	end

	return list
end

function SpStageSystem:isPassPoint(stageId, pointId)
	local stageInfo = self._model:getStageById(stageId)
	local pointInfo = ConfigReader:getRecordById("BlockSp", stageId)

	if stageInfo then
		pointInfo = self:getPointInfo(stageId)

		if pointInfo and pointInfo[pointId] then
			local progress = pointInfo[pointId].progress

			if progress > 0 then
				return true
			end
		end
	end

	return false
end

function SpStageSystem:isPointClose(stageId, pointId)
	local config = ConfigReader:getRecordById("BlockSpPoint", pointId)

	if not config then
		return false
	end

	if config.Difficulty == 1 then
		return false
	end

	local stage = self:getModel():getStageById(stageId)
	local myselfLevel = self._developSystem:getPlayer():getLevel()
	local openLevel = config.OpenLevel
	local lastPointId = config.OpenPoint[1]
	local lastPoint = stage:getPointInfoById(lastPointId)
	local starCondition = config.StarCondition.value

	if openLevel <= myselfLevel and lastPoint and starCondition[4] <= lastPoint.progress then
		return false
	end

	return true
end

function SpStageSystem:getReceiveBox(id)
	local stageInfo = self._model:getStageById(id)

	if stageInfo then
		return stageInfo:getReceivedRewards()
	end

	return nil
end

function SpStageSystem:getStageBuffs(id)
	local stageInfo = self._model:getStageById(id)

	if stageInfo then
		return stageInfo:getBuffs()
	end

	return nil
end

function SpStageSystem:hasSweepStage()
	local stageInfo = self._model:getStageMap()

	if stageInfo then
		for k, v in pairs(stageInfo) do
			if v:getChallengeTime() ~= 0 then
				local pointInfo = v:getPointInfo()

				if pointInfo then
					for k, v in pairs(pointInfo) do
						if v.progress >= 0.3 then
							return true
						end
					end
				end
			end
		end
	end

	return false
end

function SpStageSystem:isSweepPointLow(stageId, stageType)
	if not stageId then
		return false
	end

	local config = ConfigReader:requireRecordById("BlockSpPoint", stageId)
	local factor = ConfigReader:getDataByNameIdAndKey("ConfigValue", "StageSp_Gold_CombatTips", "content")

	if config then
		local myCombat = self._developSystem:getSpTeamByType(stageType):getCombat()
		local suggestCombat = config.CombatValue

		if myCombat > suggestCombat + suggestCombat * factor[1] + factor[2] then
			return true
		end
	end

	return false
end

function SpStageSystem:isStageOpen(stageId)
	local openTime = ConfigReader:getDataByNameIdAndKey("BlockSp", stageId, "ResetTime").week

	if openTime then
		local day = table.nums(openTime)

		if day < 7 then
			local time = self:getInjector():getInstance("GameServerAgent"):remoteTimestamp()
			local today = ResetUtils:getWeek(time)
			local open = ResetUtils:isWeekDayInArray(today, openTime)

			if open then
				return true
			else
				return false
			end
		end
	end

	return true
end

function SpStageSystem:getShowPointNum(stageId)
	local pointList = ConfigReader:getDataByNameIdAndKey("BlockSp", stageId, "SubPoint")

	if pointList then
		for pointIndex, pointId in pairs(pointList) do
			if self:isPointClose(stageId, pointId) then
				return pointIndex
			end
		end
	end

	return pointList and #pointList
end

function SpStageSystem:getMaxDftStage(stageId)
	local pointInfo = self:getPointInfo(stageId)

	if not pointInfo or table.nums(pointInfo) == 0 then
		return 1
	else
		for k, v in pairs(pointInfo) do
			if v.progress == 0 then
				local config = ConfigReader:getRecordById("BlockSpPoint", k)

				if config then
					return config.Difficulty
				end
			end
		end

		return table.nums(pointInfo)
	end

	return 1
end

local scroe = {
	"C",
	"B",
	"A",
	"S"
}

function SpStageSystem:getScoreText(pointId, progress)
	local config = ConfigReader:getRecordById("BlockSpPoint", pointId)

	for i, value in pairs(config.StarCondition) do
		if progress < value then
			return scroe[i]
		end

		local nextValue = config.StarCondition[i + 1]

		if nextValue then
			if value <= progress and progress < nextValue then
				return scroe[i]
			end
		else
			return scroe[i]
		end
	end
end

function SpStageSystem:getOpenTimeStr(stageId)
	local config = ConfigReader:getRecordById("BlockSp", stageId)

	if not config then
		return false, ""
	end

	local openTime = config.ResetTime.week

	if not openTime then
		return true, ""
	end

	local unlock = self._systemKeeper:isUnlock(config.UnlockCondition)
	local str = ""
	local targetWeek = table.deepcopy(openTime, {})

	for i, value in pairs(openTime) do
		str = str .. GameStyle:intNumToWeekString(value) .. (i < #openTime and " " or "")
	end

	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local isOpen = false
	local resetHour = 5
	local curTime = gameServerAgent:remoteTimestamp()
	local hour = TimeUtil:getHMSByTimestamp(curTime).hour
	local curWeekDay = ResetUtils:getWeek(curTime)

	for i = 1, #targetWeek do
		if curWeekDay - targetWeek[i] == 0 then
			if resetHour <= hour then
				isOpen = true

				break
			end
		elseif (targetWeek[i] == 7 and curWeekDay == 1 or curWeekDay - targetWeek[i] == 1) and hour < resetHour then
			isOpen = true

			break
		end
	end

	local tip = Strings:get("SPECIAL_STAGE_TEXT_15", {
		time = str,
		fontName = TTF_FONT_FZYH_R
	})

	if #targetWeek == 7 then
		tip = ""
	end

	return isOpen and unlock, tip
end

function SpStageSystem:getOpenByActivity(stageId)
	local activitySystem = self:getInjector():getInstance(ActivitySystem)
	local activities = activitySystem:getActivitiesByType(ActivityType.kBLOCKSPOPEN)

	for id, activity in pairs(activities) do
		local config = activity:getActivityConfig()

		if config.blocksp and table.indexof(config.blocksp, stageId) then
			return true
		end
	end

	return false
end

function SpStageSystem:getStageConfigList()
	local config = self:getModel():getStageConfigList()
	local configTemp = {}

	for i = 1, #config do
		local condition = config[i].UnlockCondition
		local canShow = self._systemKeeper:canShow(condition)

		if canShow then
			table.insert(configTemp, config[i])
		end
	end

	table.sort(configTemp, function (a, b)
		local isOpenA = self:getOpenTimeStr(a.Id)
		local isOpenB = self:getOpenTimeStr(b.Id)
		local isOpenByActivityA = self:getOpenByActivity(a.Id)

		if isOpenByActivityA then
			isOpenA = isOpenByActivityA
		end

		local isOpenByActivityB = self:getOpenByActivity(b.Id)

		if isOpenByActivityB then
			isOpenB = isOpenByActivityB
		end

		if isOpenA and isOpenB or not isOpenA and not isOpenB then
			return a.Index < b.Index
		end

		return isOpenA and not isOpenB
	end)

	return configTemp
end

function SpStageSystem:resetSpStageTabRed(type)
	local key = type .. "_UserDefaultKey"
	self._resetKey[key] = true

	cc.UserDefault:getInstance():setBoolForKey(key, false)
end

function SpStageSystem:getSpStageTabRed(type)
	local key = type .. "_UserDefaultKey"

	return cc.UserDefault:getInstance():getBoolForKey(key)
end

function SpStageSystem:resetRedPointStatus()
	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local currentTime = gameServerAgent:remoteTimestamp()

	cc.UserDefault:getInstance():setIntegerForKey(UserDefaultKey.kSpStageRedKey, currentTime)

	for i, v in pairs(SpStageType) do
		local key = v .. "_UserDefaultKey"

		cc.UserDefault:getInstance():setBoolForKey(key, false)
	end
end

function SpStageSystem:checkIsShowRedPoint()
	local unlock = self:checkEnabled()

	if not unlock then
		return false
	end

	local value = cc.UserDefault:getInstance():getIntegerForKey(UserDefaultKey.kSpStageRedKey)

	if not value or value == 0 then
		for i, v in pairs(SpStageType) do
			local key = v .. "_UserDefaultKey"

			cc.UserDefault:getInstance():setBoolForKey(key, true)
		end

		local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
		local currentTime = gameServerAgent:remoteTimestamp()

		cc.UserDefault:getInstance():setIntegerForKey(UserDefaultKey.kSpStageRedKey, currentTime)

		return true
	end

	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local lastLoginTime = gameServerAgent:remoteTimestamp()
	local clock5Time = TimeUtil:getTimeByDateForTargetTimeInToday({
		sec = 0,
		min = 0,
		hour = 5
	})

	if clock5Time < lastLoginTime and value <= clock5Time then
		for i, v in pairs(SpStageType) do
			local key = v .. "_UserDefaultKey"

			if not self._resetKey[key] then
				cc.UserDefault:getInstance():setBoolForKey(key, true)
			end
		end

		return true
	end

	return false
end

function SpStageSystem:getHasSweepEffect()
	return true

	local params = ConfigReader:getDataByNameIdAndKey("SkillSpecialEffect", "SpFunc_BlockSpWipe", "Parameter")

	if params and params.type then
		local value = self._developSystem:getPlayer():getEffectCenter():getSpEffectById(params.type)

		if value then
			return true
		end
	end

	return false
end

function SpStageSystem:requestEnterSpStage(params, callback)
	self._spStageService:requestEnterSpStage(params, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback()
			end

			local pointId = params.pointId
			local playerData = response.data.playerData
			local lastScore = self:getStageDamage(params.stageId)

			self:enterBattleWithData(playerData, pointId, params.spType, lastScore, response.data.enemyBuff)
		end
	end)
end

function SpStageSystem:requestFinishSpStage(params, spType, blockUI, callback)
	self._spStageService:requestFinishSpStage(params, blockUI, function (response)
		if response.resCode == GS_SUCCESS then
			local data = response.data
			data.spType = spType
			data.pointId = params.pointId
			data.lastScore = params.lastScore

			local function finishCallBack()
				local view = self:getInjector():getInstance("SpStageFinishView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, data))
				self:dispatch(Event:new(EVT_REFRESH_SPVIEW))

				if callback then
					callback()
				end
			end

			if response.data.reviewFailed then
				local data = {
					title = Strings:get("Tip_Remind"),
					title1 = Strings:get("UITitle_EN_Tishi"),
					content = Strings:get("FAC_Des"),
					sureBtn = {
						text1 = "FAC_Btn"
					}
				}
				local outSelf = self
				local delegate = {
					willClose = function (self, popupMediator, data)
						finishCallBack()
					end
				}
				local view = self:getInjector():getInstance("AlertView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
				}, data, delegate))
			else
				finishCallBack()
			end
		end
	end)
end

function SpStageSystem:requestSweepSpStage(params, blockUI, callback)
	self._spStageService:requestSweepSpStage(params, blockUI, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback(response.data)
			end

			self:dispatch(Event:new(EVT_LEAVETIME_CHANGE))
			self:dispatch(Event:new(EVT_SPSTAGE_SWEEP_SUCC, {
				data = response.data
			}))
		end
	end)
end

function SpStageSystem:requestOpenSpProgressReward(params, blockUI, callback)
	self._spStageService:requestOpenSpProgressReward(params, blockUI, function (response)
		if response.resCode == GS_SUCCESS then
			if response.data.rewards then
				local rewards = response.data.rewards
				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					rewards = rewards
				}))
			end

			if response.data.buff then
				local view = self:getInjector():getInstance("SpStageGetBuffView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {}))
			end

			if callback then
				callback()
			end
		end
	end)
end

function SpStageSystem:requestWatchSpReport(params, blockUI, callback)
	self._spStageService:requestWatchSpReport(params, blockUI, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback()
		end
	end)
end

function SpStageSystem:requesetGetBestReports(params, blockUI, callback, ins)
	self._spStageService:requestGetBestReports(params, blockUI, function (response)
		if response.resCode == GS_SUCCESS then
			self._model:synchronizeBestReport(params.spType, response.data.bestReports)

			if callback and checkDependInstance(ins) then
				callback()
			end
		end
	end)
end

function SpStageSystem:requestLeaveStage(params, callback, blockUI)
	self._spStageService:requestLeaveStage(params, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback()
		end
	end, blockUI)
end

function SpStageSystem:doReset(resetId, value)
	value = value or 0
	local stageType = nil

	if resetId == ResetId.kGoldStageReset then
		stageType = SpStageType.kGold
	elseif resetId == ResetId.kExpStageReset then
		stageType = SpStageType.kExp
	elseif resetId == ResetId.kCrystalStageReset then
		stageType = SpStageType.kCrystal
	elseif resetId == ResetId.kBlockSp_Equipment then
		stageType = SpStageType.kEquip
	elseif resetId == ResetId.kBlockSp_Skill_1 then
		stageType = SpStageType.kSkill1
	elseif resetId == ResetId.kBlockSp_Skill_2 then
		stageType = SpStageType.kSkill2
	elseif resetId == ResetId.kBlockSp_Skill_3 then
		stageType = SpStageType.kSkill3
	end

	local config = ConfigReader:getRecordById("Reset", resetId)

	if config and config.ResetSystem then
		local leaveTimes = self:getStageLeaveTime(spStageIds[stageType])
		local max = config.ResetSystem.max
		local add = config.ResetSystem.addValue or 0
		value = leaveTimes + add

		if max and max < value then
			value = max
		end
	end

	self._model:resetLeaveTimes(stageType, value)
	self:dispatch(Event:new(EVT_LEAVETIME_CHANGE))
end

function SpStageSystem:enterBattleWithData(playerData, pointId, spType, lastScore, enemyBuff)
	local battleTypeKey = {
		gold = SettingBattleTypes.kSpStage_gold,
		exp = SettingBattleTypes.kSpStage_exp,
		crystal = SettingBattleTypes.kSpStage_crystal,
		equipment = SettingBattleTypes.kSpStage_equipment,
		skill_1 = SettingBattleTypes.kSpStage_skill_1,
		skill_2 = SettingBattleTypes.kSpStage_skill_2,
		skill_3 = SettingBattleTypes.kSpStage_skill_3
	}
	local battleType = battleTypeKey[spType] or SettingBattleTypes.kSpStage
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(battleType)
	local isReplay = false
	local pointConfig = ConfigReader:getRecordById("BlockSpPoint", pointId)
	local unlock, tips = self._systemKeeper:isUnlock("AutoFight")

	if not unlock then
		isAuto = false
	end

	local outSelf = self
	local battleDelegate = {}
	local randomSeed = tonumber(tostring(os.time()):reverse():sub(1, 6))
	local battleSession = SpStageBattleSession:new({
		playerData = playerData,
		pointId = pointId,
		logicSeed = randomSeed,
		enemyBuff = enemyBuff
	})

	battleSession:buildAll()

	local battleData = battleSession:getPlayersData()
	local battleConfig = battleSession:getBattleConfig()
	local battleSimulator = battleSession:getBattleSimulator()
	local battleLogic = battleSimulator:getBattleLogic()
	local battleInterpreter = BattleInterpreter:new()

	battleInterpreter:setRecordsProvider(battleSession:getBattleRecordsProvider())

	local battleDirector = LocalBattleDirector:new()

	battleDirector:setBattleSimulator(battleSimulator)
	battleDirector:setBattleInterpreter(battleInterpreter)

	local battlePassiveSkill = battleSession:getBattlePassiveSkill()
	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		teams = battleSession:genTeamAiInfo(),
		mainPlayerId = {
			playerData.rid
		}
	}
	local systemKeeper = self._systemKeeper
	local unlockSpeed, tipsSpeed = systemKeeper:isUnlock("BattleSpeed")
	local speedOpenSta = systemKeeper:getBattleSpeedOpen(spType)
	local eupipInfo = nil

	if spType == SpStageType.kCrystal then
		eupipInfo = {}
		local playerCard = pointConfig.PlayerCard
		local eupipFormation = ConfigReader:getDataByNameIdAndKey("EnemyCard", playerCard, "FirstFormation")
		eupipInfo.formation = eupipFormation
	end

	function battleDelegate:onAMStateChanged(sender, isAuto)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, isAuto)
	end

	function battleDelegate:onLeavingBattle()
		local data = {
			spType = spType,
			pointId = pointId
		}

		outSelf:requestLeaveStage(data, function ()
			BattleLoader:popBattleView(outSelf, {
				viewName = "SpStageMainView",
				spType = spType
			})
		end)
	end

	function battleDelegate:onPauseBattle(continueCallback, leaveCallback)
		local delegate = self
		local popupDelegate = {
			willClose = function (self, sender, data)
				if data.opt == BattlePauseResponse.kLeave then
					leaveCallback()
				else
					continueCallback(data.hpShow, data.effectShow)
				end
			end
		}
		local pauseView = outSelf:getInjector():getInstance("battlePauseView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, pauseView, nil, {}, popupDelegate))
	end

	function battleDelegate:tryLeaving(callback)
		local delegate = {}

		function delegate:willClose(popupMediator, data)
			if data.response == AlertResponse.kOK then
				callback(true)
			else
				callback(false)
			end
		end

		local data = {
			title = Strings:get("SHOP_REFRESH_DESC_TEXT1"),
			content = Strings:get("SPECIAL_STAGE_TEXT_30"),
			sureBtn = {},
			cancelBtn = {}
		}
		local view = outSelf:getInjector():getInstance("AlertView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))
	end

	function battleDelegate:onBattleFinish(result)
		local realData = battleSession:getResultSummary()
		local data = {
			pointId = pointId,
			lastScore = lastScore,
			resultData = realData
		}

		outSelf:requestFinishSpStage(data, spType, true)
	end

	function battleDelegate:onDevWin(sender)
		local realData = {
			randomSeed = 123321,
			opData = "dev",
			result = kBattleSideAWin,
			winners = {
				playerData.rid
			},
			statist = {
				totalTime = 10000,
				roundCount = 4,
				players = {
					[playerData.rid] = {
						unitsDeath = 0,
						hpRatio = 0.99999,
						unitsTotal = 3,
						unitSummary = {}
					},
					[pointId] = {
						unitsDeath = 20,
						hpRatio = 0,
						unitsTotal = 20,
						unitSummary = {}
					}
				}
			}
		}
		local data = {
			pointId = pointId,
			lastScore = lastScore,
			resultData = realData
		}

		outSelf:requestFinishSpStage(data, spType, true)
	end

	function battleDelegate:onTimeScaleChanged(timeScale)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, nil, timeScale)
	end

	function battleDelegate:showBossCome(pauseFunc, resumeCallback, paseSta)
		local delegate = self
		local popupDelegate = {
			willClose = function (self, sender, data)
				if resumeCallback then
					resumeCallback()
				end
			end
		}
		local bossView = outSelf:getInjector():getInstance("battleBossComeView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, bossView, nil, {
			paseSta = paseSta
		}, popupDelegate))

		if pauseFunc then
			pauseFunc()
		end
	end

	function battleDelegate:onShowRestraint(continueCallback)
		local popupDelegate = {
			willClose = function (self, sender)
				continueCallback()
			end
		}
		local view = outSelf:getInjector():getInstance("battlerofessionalRestraintView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {}, popupDelegate))
	end

	local enemyIconDict = {
		crystal = "asset/common/zd_yslc.png",
		gold = "asset/common/zd_ctxs.png",
		exp = "asset/common/zd_tttx.png"
	}
	local dropIconDict = {
		crystal = "crystal",
		gold = "gold",
		exp = "exp"
	}
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local bgRes = pointConfig.Background or "battle_scene_1"
	local battleSpeed_Display = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BattleSpeed_Display", "content")
	local battleSpeed_Actual = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BattleSpeed_Actual", "content")
	local data = {
		battleType = battleSession:getBattleType(),
		battleData = battleData,
		battleConfig = battleConfig,
		isReplay = isReplay,
		logicInfo = logicInfo,
		delegate = battleDelegate,
		viewConfig = {
			opPanelClazz = "BattleUIMediator",
			mainView = "battlePlayer",
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			finalHitShow = true,
			finalTaskFinishShow = true,
			battleSettingType = battleType,
			showEscape = spType == "gold",
			bulletTimeEnabled = BattleLoader:getBulletSetting("BulletTime_PVE_Source"),
			enemyIcon = enemyIconDict[spType],
			dropIcon = dropIconDict[spType],
			bgm = pointConfig.BGM,
			background = bgRes,
			eupipInfo = eupipInfo,
			refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
			battleSuppress = BattleDataHelper:getBattleSuppress(),
			hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting(),
			effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting(),
			passiveSkill = battlePassiveSkill,
			unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill"),
			finishWaitTime = BattleDataHelper:getBattleFinishWaitTime(spType),
			btnsShow = {
				speed = {
					visible = speedOpenSta and self:getInjector():getInstance(SystemKeeper):canShow("BattleSpeed"),
					lock = not unlockSpeed,
					tip = tipsSpeed,
					speedConfig = battleSpeed_Actual,
					speedShowConfig = battleSpeed_Display,
					timeScale = timeScale
				},
				skip = {
					visible = false
				},
				auto = {
					visible = self:getInjector():getInstance(SystemKeeper):canShow("AutoFight"),
					state = isAuto,
					lock = not systemKeeper:isUnlock("AutoFight")
				},
				pause = {
					visible = true
				},
				restraint = {
					visible = self:getInjector():getInstance(SystemKeeper):canShow("Button_CombateDominating"),
					lock = not self:getInjector():getInstance(SystemKeeper):isUnlock("Button_CombateDominating")
				}
			}
		},
		loadingType = SpStageLoadingType[spType]
	}

	BattleLoader:pushBattleView(self, data)
end

function SpStageSystem:getBattleData(pointId, playerData)
	local pointConfig = ConfigReader:getRecordById("BlockSpPoint", pointId)
	local enemyData = EneryUtil:getEneryData(pointConfig.EnemyMaster, pointConfig.EnemyHeros)
	enemyData.headImg = pointConfig.BossHeadPic
	enemyData.initiative = pointConfig.Speed

	return {
		playerData = playerData,
		enemyData = enemyData,
		bg = pointConfig.Background
	}
end
