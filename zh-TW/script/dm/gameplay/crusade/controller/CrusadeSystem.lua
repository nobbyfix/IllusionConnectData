CrusadeSystem = class("CrusadeSystem", legs.Actor)

CrusadeSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
CrusadeSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
CrusadeSystem:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
CrusadeSystem:has("_crusadeService", {
	is = "r"
}):injectWith("CrusadeService")
CrusadeSystem:has("_crusade", {
	is = "r"
}):injectWith("Crusade")
CrusadeSystem:has("_showAwardAfterBattle", {
	is = "rw"
})
CrusadeSystem:has("_passFloorRewardId", {
	is = "rw"
})
CrusadeSystem:has("_lastPowerNum", {
	is = "rw"
})
CrusadeSystem:has("_isShowPassFloorView", {
	is = "rw"
})
CrusadeSystem:has("_isShowPassFloorReward", {
	is = "rw"
})
CrusadeSystem:has("_bagSystem", {
	is = "r"
}):injectWith("BagSystem")

function CrusadeSystem:initialize()
	super.initialize(self)

	self._viewVector = {}
	self._sharedScheduler = nil
	self._isShowPassFloorView = false
	self._showAwardAfterBattle = {}
	self._isShowPassFloorReward = {}
	self._passFloorRewardId = "1"
end

local canSweepPointMax = tonumber(ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_CanSweepPointMax", "content"))

function CrusadeSystem:checkEnabled()
	local unlock, tips = self._systemKeeper:isUnlock("BlockSp_All")

	if not unlock then
		return unlock, tips
	end

	unlock, tips = self._systemKeeper:isUnlock("Crusade")

	return unlock, tips
end

function CrusadeSystem:tryEnter(data)
	local unlock, tips = self:checkEnabled(data)

	if not unlock then
		self:dispatch(ShowTipEvent({
			tip = tips
		}))

		return
	end

	local function callback()
		print("!!!!!!!!!!!!")

		local view = self:getInjector():getInstance("CrusadeMainView")
		local event = ViewEvent:new(EVT_PUSH_VIEW, view, nil, {})

		self:dispatch(event)
	end

	self:requestGetCrusadeInfo(callback)
end

function CrusadeSystem:synchronize(data)
	self._crusade:synchronize(data)
	self:dispatch(Event:new(EVT_CRUSADE_SYNC_DIFF, {}))
end

function CrusadeSystem:delete(data)
end

function CrusadeSystem:getCrusadeWeekModel()
	return self._crusade:getCrusadeWeekModel()
end

function CrusadeSystem:getCurCrusadeFloorModel()
	return self._crusade:getCurCrusadeFloorModel()
end

function CrusadeSystem:getCurCrusadePointModel()
	return self._crusade:getCurCrusadePointModel()
end

function CrusadeSystem:getResetTime()
	return self._crusade:getLeftTime()
end

function CrusadeSystem:getAllFloorRewards()
	return self:getCrusadeWeekModel():getAllFloorRewards()
end

function CrusadeSystem:getCurBuffDesc(energy)
	energy = energy or self:getCrusadeEnergy()

	if energy == 0 then
		return "Crusade_Point_25", 0
	end

	local buffData = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_Energy_Buff", "content")
	local buffDesc = ""
	local maxNum = 0
	local maxNumDesc = ""

	for k, v in pairs(buffData) do
		if maxNum < tonumber(v.Max) then
			maxNum = tonumber(v.Max)
			maxNumDesc = v.Buff
		end

		if tonumber(energy) <= tonumber(v.Max) and tonumber(v.Min) <= tonumber(energy) then
			buffDesc = ConfigReader:getDataByNameIdAndKey("SkillAttrEffect", v.Buff, "EffectDesc")

			break
		end
	end

	if maxNum < tonumber(energy) then
		buffDesc = ConfigReader:getDataByNameIdAndKey("SkillAttrEffect", maxNumDesc, "EffectDesc")
	end

	local valueNum = string.match(Strings:get(buffDesc), "%d+")

	return buffDesc, valueNum
end

function CrusadeSystem:getCurPointFirstReward(floorNum, pointNum)
	local Reward = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_First_Reward", "content")
	local cellReward = Reward[floorNum][pointNum .. ""]
	local rewards = RewardSystem:getRewardsById(cellReward)

	return rewards
end

function CrusadeSystem:getIsFirstPassByPointId(floorId, pointId)
	local curWeek = self:getCrusadeWeekModel():getSubPoint()
	local floorNum = 0
	local pointNum = 0

	for k, v in pairs(curWeek) do
		if floorId == v then
			floorNum = k
		end
	end

	return floorNum
end

function CrusadeSystem:getCurPointNormalReward(pointId)
	if not pointId then
		reutrn({})
	end

	local reward = ConfigReader:getDataByNameIdAndKey("CrusadePoint", pointId, "Reward")
	local rewards = RewardSystem:getRewardsById(reward)

	return rewards
end

function CrusadeSystem:getfloorFirstReward(floorNum)
	local Reward = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_First_Reward", "content")
	local rewardId = Reward[tonumber(floorNum)].floor
	local reward = RewardSystem:getRewardsById(rewardId)

	return reward
end

function CrusadeSystem:getfloorNormalReward(floorNum)
	local id = self:getFloorIdByFloorNum(floorNum)
	local rewardData = ConfigReader:getDataByNameIdAndKey("CrusadeFloor", id, "Reward")
	local reward = RewardSystem:getRewardsById(rewardData)

	return reward
end

function CrusadeSystem:getfloorReward(floorNum)
	floorNum = floorNum or self:getFloorNumByFloorId()

	if not self:getFloorIsFirstPassById(floorNum) then
		return self:getfloorFirstReward(floorNum)
	else
		return self:getfloorNormalReward(floorNum)
	end
end

function CrusadeSystem:getCurFloorRecommendHero()
	local id = self._crusade:getCrusadeFloorId()
	local recommendHero = ConfigReader:getDataByNameIdAndKey("CrusadeFloor", id, "RecommendHero")

	return recommendHero or {}
end

function CrusadeSystem:getCurFloorStarBuffDesc()
	local buffId = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_5_Star_buff", "content")
	local desc = ConfigReader:getDataByNameIdAndKey("SkillAttrEffect", buffId, "EffectDesc")
	local value = ConfigReader:getDataByNameIdAndKey("SkillAttrEffect", buffId, "Value")
	local str = Strings:get(desc)

	return str, value[1]
end

function CrusadeSystem:getCurFloorAweakenBuffDesc()
	local buffId = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_Aweaken_buff", "content")
	local desc = ConfigReader:getDataByNameIdAndKey("SkillAttrEffect", buffId, "EffectDesc")
	local value = ConfigReader:getDataByNameIdAndKey("SkillAttrEffect", buffId, "Value")
	local str = Strings:get(desc)

	return str, value[1]
end

function CrusadeSystem:getRewardDataByFloorNum(floorNum)
	local name = ""
	local id = self:getFloorIdByFloorNum(floorNum)
	local name = ConfigReader:getDataByNameIdAndKey("CrusadeFloor", id, "Name")
	local rarity = ConfigReader:getDataByNameIdAndKey("CrusadeFloor", id, "Rarity")
	local namelbl = Strings:get(name)

	return namelbl, rarity
end

function CrusadeSystem:showPassCurFloorRewardView()
	if #self._isShowPassFloorReward > 0 then
		local data = {
			floorNum = self:getFloorNumByFloorId(self._passFloorRewardId),
			reward = self._isShowPassFloorReward
		}
		local view = self:getInjector():getInstance("CrusadePassFloorView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data))

		self._passFloorRewardId = self._crusade:getCrusadeFloorId()
		self._isShowPassFloorReward = {}
	end
end

function CrusadeSystem:getFloorNumByFloorId(id)
	id = id or self:getCurCrusadeFloorModel():getId()
	local curWeek = self:getCrusadeWeekModel():getSubPoint()
	local floorNum = 1

	for k, v in pairs(curWeek) do
		if id == v then
			floorNum = k
		end
	end

	return floorNum
end

function CrusadeSystem:getFloorIdByFloorNum(floorNum)
	local curWeek = self:getCrusadeWeekModel():getSubPoint()

	if curWeek[tonumber(floorNum)] then
		return curWeek[tonumber(floorNum)]
	else
		return nil
	end
end

function CrusadeSystem:getFloorIsFirstPassById(floorNum)
	local firstReward = self._crusade:getFirstReward()
	local isFirstPass = true

	for k, floor in pairs(firstReward) do
		if k + 1 == floorNum then
			local num = 0

			for idx, point in pairs(floor) do
				num = num + 1
			end

			if num >= 5 then
				return true
			else
				return false
			end
		end
	end

	return false
end

function CrusadeSystem:getCurPointCombat(pointNum)
	local dynamicDifficulty = self._crusade:getDynamicDifficulty() + 1
	local pointCombat = self:getCurCrusadeFloorModel():getCombatValue()
	local id = self:getCurCrusadeFloorModel():getId()
	local floorNum = self:getFloorNumByFloorId(id)
	local isFirstPass = ""

	for k, combat in pairs(pointCombat) do
		if pointNum == k then
			if floorNum >= 11 then
				combat = combat * dynamicDifficulty
			end

			isFirstPass = combat
		end
	end

	return isFirstPass
end

function CrusadeSystem:getCurPointNum()
	local id = self:getCurCrusadePointModel():getId()
	local curWeek = self:getCurCrusadeFloorModel():getSubPoint()
	local pointNum = 1

	for k, v in pairs(curWeek) do
		if v == id then
			pointNum = k
		end
	end

	return pointNum
end

function CrusadeSystem:checkIsFirstPass(floorNum, pointNum)
	local firstReward = self._crusade:getFirstReward()
	local isFirstPass = true

	for k, floor in pairs(firstReward) do
		if k + 1 == floorNum then
			for idx, point in pairs(floor) do
				if tonumber(point) and pointNum == point + 1 then
					isFirstPass = false
				end
			end
		end
	end

	return isFirstPass
end

function CrusadeSystem:getCrusadeEnergy()
	local num = self._bagSystem:getCrusadeEnergy()

	return num
end

function CrusadeSystem:getCurFloorBuff()
	local id = self._crusade:getCrusadeFloorId()
	local buffId = ConfigReader:getDataByNameIdAndKey("CrusadeFloor", id, "RandomBuff")
	local buffTransLate = ConfigReader:getDataByNameIdAndKey("CrusadeBuff", buffId, "Desc")

	return buffTransLate
end

function CrusadeSystem:openPowerView()
	local view = self:getInjector():getInstance("CrusadePowerView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {}))
end

function CrusadeSystem:getCurrentTime()
	return self._gameServerAgent:remoteTimestamp()
end

function CrusadeSystem:canCrusadeSweep()
	local unlock, tips = self:checkEnabled()

	if not unlock then
		return false
	end

	local sweepPoint = tonumber(ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_SweepPoint", "content"))
	local canSweepPoint = self._crusade:getLastTotalPoint() - sweepPoint

	if canSweepPointMax < canSweepPoint then
		canSweepPoint = canSweepPointMax or canSweepPoint
	end

	local curTotalPoint = self._crusade:getTotalPoint()

	return canSweepPoint > 0 and curTotalPoint < canSweepPoint
end

function CrusadeSystem:crusadeRedPointState()
	local unlock, tips = self:checkEnabled()

	if not unlock then
		return false
	end

	local playerId = self:getDevelopSystem():getPlayer():getRid()
	local lastTime = cc.UserDefault:getInstance():getStringForKey(playerId .. UserDefaultKey.kCrusadeViewRedByPower)
	local curDayTime = TimeUtil:getTimeByDateForTargetTimeInToday({
		sec = 0,
		min = 0,
		hour = 5
	})
	local resetSystem = ConfigReader:getRecordById("Reset", "Crusade_Energy_Recovery").ResetSystem
	local num = self:getCrusadeEnergy()

	if not tonumber(lastTime) and resetSystem.storage <= num then
		return true
	end

	if tonumber(lastTime) and tonumber(lastTime) < tonumber(curDayTime) and resetSystem.storage <= num then
		return true
	end

	return false
end

function CrusadeSystem:checkCrusadeRedPointState()
	local playerId = self:getDevelopSystem():getPlayer():getRid()
	local isShow = self:crusadeRedPointState()

	if isShow then
		local curTime = self:getCurrentTime()

		cc.UserDefault:getInstance():setStringForKey(playerId .. UserDefaultKey.kCrusadeViewRedByPower, curTime)
	end
end

function CrusadeSystem:getRankShowFloorData(points)
	local data = {
		quality = 1,
		name = ""
	}

	if points <= 0 then
		return data
	end

	local lastTotalPoint = points
	local weekModel = self:getCrusadeWeekModel()
	local subFloor = weekModel:getSubPoint()

	for i = 1, #subFloor do
		local floorId = subFloor[i]
		local floor = weekModel:getCrusadeFloorModel(floorId)
		local subPoint = floor:getSubPoint()
		local length = #subPoint

		if lastTotalPoint <= 0 then
			break
		end

		local pointIndex = lastTotalPoint == 0 and 5 or lastTotalPoint
		data.name = floor:getName() .. GameStyle:intNumToRomaString(pointIndex)
		data.quality = floor:getQuality()
		lastTotalPoint = lastTotalPoint - length
	end

	return data
end

function CrusadeSystem:showCrusadeAwardView()
	local view = self:getInjector():getInstance("CrusadeAwardView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		rewards = self:getAllFloorRewards()
	}))
end

function CrusadeSystem:showCrusadeRuleView()
	local Rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_RuleText", "content")
	local view = self:getInjector():getInstance("ExplorePointRule")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		rule = Rule
	}))
end

function CrusadeSystem:showCrusadeSweepView()
	if not self:canCrusadeSweep() then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Crusade_UI21")
		}))

		return
	end

	local crusadeWeekModel = self:getCrusadeWeekModel()

	local function getFloorInfoByPoint(wpoint)
		if wpoint <= 0 then
			return
		end

		local lastTotalPoint = wpoint
		local subFloor = crusadeWeekModel:getSubPoint()
		local floorName, floorQuality = nil

		for i = 1, #subFloor do
			local floorId = subFloor[i]
			local floor = crusadeWeekModel:getCrusadeFloorModel(floorId)
			local subPoint = floor:getSubPoint()
			local length = #subPoint

			if lastTotalPoint <= 0 then
				break
			end

			local pointIndex = lastTotalPoint == 0 and 5 or lastTotalPoint
			floorName = floor:getName() .. GameStyle:intNumToRomaString(pointIndex)
			floorQuality = floor:getQuality()
			lastTotalPoint = lastTotalPoint - length
		end

		return floorName, floorQuality
	end

	local lastWeekPoint = self._crusade:getLastTotalPoint()
	local lastName, lastQuality = getFloorInfoByPoint(lastWeekPoint)
	local sweepPoint = tonumber(ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_SweepPoint", "content"))
	local curWeekPoint = self._crusade:getLastTotalPoint() - sweepPoint

	if canSweepPointMax < curWeekPoint then
		curWeekPoint = canSweepPointMax or curWeekPoint
	end

	local curName, curQuality = getFloorInfoByPoint(curWeekPoint)
	local data = {
		name1 = lastName,
		name2 = curName,
		quality1 = lastQuality,
		quality2 = curQuality
	}
	local view = self:getInjector():getInstance("CrusadeSweepTipView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data))
end

function CrusadeSystem:showCrusadeSweepResultView(data)
	if not data then
		return
	end

	local crusadeWeekModel = self:getCrusadeWeekModel()
	local showData = {}
	local sweepPoint = tonumber(ConfigReader:getDataByNameIdAndKey("ConfigValue", "Crusade_SweepPoint", "content"))
	local curWeekPoint = self._crusade:getLastTotalPoint() - sweepPoint

	for i = 1, #data do
		local dataTemp = data[i]
		local floorId = dataTemp.floorId
		local startPointId = dataTemp.startPointId
		local rewards = dataTemp.rewards
		local startPointIndex = self._crusade:getPointIndexById(floorId, startPointId)
		local sweepLevel = 5

		if curWeekPoint < 5 then
			sweepLevel = curWeekPoint
		else
			curWeekPoint = curWeekPoint - 5
		end

		local floor = crusadeWeekModel:getCrusadeFloorModel(floorId)
		local name = string.format("%s%s-%s", floor:getName(), GameStyle:intNumToRomaString(startPointIndex), GameStyle:intNumToRomaString(sweepLevel))
		local quality = floor:getQuality()

		table.insert(showData, {
			name = name,
			quality = quality,
			rewards = rewards
		})
	end

	local view = self:getInjector():getInstance("CrusadeSweepResultView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, showData))
end

function CrusadeSystem:showRankView()
	local rankSystem = self:getInjector():getInstance(RankSystem)

	rankSystem:tryEnterRank({
		index = RankType.kCrusade
	})
end

function CrusadeSystem:showCrusadeTeamView(isFrist)
	self._lastPowerNum = self._bagSystem:getCrusadeEnergy()
	self._passFloorRewardId = self._crusade:getCrusadeFloorId()
	local crusadeFloorModel = self:getCurCrusadeFloorModel()

	if not crusadeFloorModel then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Crusade_UI12")
		}))

		return
	end

	local function callback()
		self:requestBeginBattle()
	end

	local data = {
		battleCallback = callback
	}
	local str = Strings:get(self:getCurFloorBuff())

	if string.find(str, "\n") then
		data.specialRule = string.split(str, "\n")[1]
	else
		data.specialRule = str
	end

	data.showNewRuleBg = true
	local view = self:getInjector():getInstance("StageTeamView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		stageType = StageTeamType.CRUSADE,
		data = data
	}))
end

function CrusadeSystem:checkIsRecommend(checkId, heroInfo)
	local StarBuffNum = ConfigReader:getRecordById("ConfigValue", "Tower_1_Star_Buff_Minimum_Star").content
	local attrAdds = {}
	local attrAddNum = 0
	local recommendDesc = ""
	local isMaxRecommend = false
	local recommendHero = self:getCurFloorRecommendHero()

	for k, rData in pairs(recommendHero) do
		if rData.Hero then
			for index, heroId in pairs(rData.Hero) do
				if heroId == checkId then
					attrAdds[#attrAdds + 1] = {}
					attrAdds[#attrAdds].title = Strings:get("Team_Hero_Type_Title")
					local effectConfig = ConfigReader:getRecordById("SkillAttrEffect", rData.Effect)
					attrAdds[#attrAdds].desc = ""
					recommendDesc = Strings:get("clubBoss_46")
					isMaxRecommend = true

					if effectConfig then
						attrAddNum = attrAddNum + effectConfig.Value[1]
						attrAdds[#attrAdds].desc = Strings:get(effectConfig.EffectDesc)
					end

					attrAdds[#attrAdds].type = StageAttrAddType.HERO_TYPE
				end
			end
		end
	end

	if heroInfo.awakenLevel > 0 then
		local aweakenBuff, value = self:getCurFloorAweakenBuffDesc()
		attrAdds[#attrAdds + 1] = {}
		attrAdds[#attrAdds].title = Strings:get("Tower_Main_awakenBuff")
		attrAdds[#attrAdds].desc = aweakenBuff
		attrAdds[#attrAdds].type = StageAttrAddType.HERO_AWAKE
		attrAddNum = attrAddNum + value
		recommendDesc = isMaxRecommend and Strings:get("clubBoss_46") or Strings:get("EXPLORE_UI22")
		isMaxRecommend = isMaxRecommend or false
	elseif StarBuffNum <= heroInfo.star then
		local starBuff, value = self:getCurFloorStarBuffDesc()
		attrAdds[#attrAdds + 1] = {}
		attrAdds[#attrAdds].title = Strings:get("Tower_Main_starBuff")
		attrAdds[#attrAdds].desc = starBuff
		attrAdds[#attrAdds].type = StageAttrAddType.HERO_FULL_STAR
		attrAddNum = attrAddNum + value
		recommendDesc = isMaxRecommend and Strings:get("clubBoss_46") or Strings:get("EXPLORE_UI22")
		isMaxRecommend = isMaxRecommend or false
	end

	local recommendData = {
		isRecommend = #attrAdds > 0,
		attrAddNum = attrAddNum,
		recommendDesc = recommendDesc,
		attrAdds = attrAdds,
		isMaxRecommend = isMaxRecommend
	}

	return recommendData
end

function CrusadeSystem:enterBattleView(data)
	local crusadePointModel = self:getCurCrusadePointModel()

	if not data or not crusadePointModel then
		return
	end

	local isReplay = false
	local outSelf = self
	local battleDelegate = {}
	local battleSession = CrusadeBattleSession:new(data)

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
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(SettingBattleTypes.kCrusade)
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local canSkip = false
	local skipTime = tonumber(ConfigReader:getDataByNameIdAndKey("ConfigValue", "Tower_1_SkipWaitTime", "content"))
	local speedOpenSta = systemKeeper:getBattleSpeedOpen("crusade")
	local unlockSpeed, tipsSpeed = systemKeeper:isUnlock("BattleSpeed")
	local autoFight = systemKeeper:canShow("AutoFight")
	local speedCanshow = systemKeeper:canShow("BattleSpeed")
	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		teams = battleSession:genTeamAiInfo(),
		mainPlayerId = {
			data.playerData.rid
		}
	}

	function battleDelegate:onLeavingBattle()
		outSelf:requestLeaveBattle(function (data)
			local realData = battleSession:getExitSummary()
			local loseData = {
				viewType = "crusade",
				battleStatist = realData.statist.players
			}

			outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, outSelf:getInjector():getInstance("StageLosePopView"), {}, loseData, self))
		end)
	end

	function battleDelegate:onPauseBattle(continueCallback, leaveCallback)
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

	function battleDelegate:onAMStateChanged(sender, isAuto)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(SettingBattleTypes.kCrusade, isAuto)
	end

	function battleDelegate:tryLeaving(callback)
		callback(true)
	end

	function battleDelegate:onSkipBattle()
	end

	function battleDelegate:onBattleFinish(result)
		local realData = battleSession:getResultSummary()

		local function callback(battleReport)
			if battleReport.pass then
				local winData = {
					battleStatist = battleReport.statist,
					rewards = battleReport.pointReward or {},
					firstPointReward = battleReport.firstPointReward,
					floorReward = battleReport.floorReward or {},
					firstFloorReward = battleReport.firstFloorReward
				}
				local view = outSelf:getInjector():getInstance("CrusadeBattleWinView")

				outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {}, winData, outSelf))
			else
				local loseData = {
					viewType = "crusade",
					battleStatist = battleReport.statist.players
				}

				outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, outSelf:getInjector():getInstance("StageLosePopView"), {}, loseData, self))
			end
		end

		outSelf:requestFinishBattle(realData, callback)
	end

	function battleDelegate:onDevWin()
		local realData = {
			randomSeed = 123321,
			opData = "dev",
			result = kBattleSideAWin,
			winners = {
				data.playerData.rid
			},
			pointId = data.blockPointId,
			statist = {
				totalTime = 10000,
				roundCount = 4,
				players = {
					[data.playerData.rid] = {
						unitsDeath = 0,
						hpRatio = 0.99999,
						unitsTotal = 3,
						unitSummary = {}
					},
					[data.blockPointId] = {
						unitsDeath = 20,
						hpRatio = 0,
						unitsTotal = 20,
						unitSummary = {}
					}
				}
			}
		}

		local function callback(battleReport)
			if battleReport.pass then
				local winData = {
					battleStatist = battleReport.statist,
					rewards = battleReport.pointReward or {},
					firstPointReward = battleReport.firstPointReward,
					floorReward = battleReport.floorReward or {},
					firstFloorReward = battleReport.firstFloorReward
				}
				local view = outSelf:getInjector():getInstance("CrusadeBattleWinView")

				outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {}, winData, outSelf))
			else
				local loseData = {
					viewType = "crusade",
					battleStatist = battleReport.statist.players
				}

				outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, outSelf:getInjector():getInstance("StageLosePopView"), {}, loseData, self))
			end
		end

		outSelf:requestFinishBattle(realData, callback)
	end

	function battleDelegate:onTimeScaleChanged(timeScale)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(SettingBattleTypes.kCrusade, nil, timeScale)
	end

	function battleDelegate:showBossCome(pauseFunc, resumeCallback, paseSta)
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

	local bgRes = crusadePointModel:getBackground()
	local BGM = crusadePointModel:getBGM()
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
			mainView = "battlePlayer",
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			opPanelClazz = "BattleUIMediator",
			battleSettingType = SettingBattleTypes.kCrusade,
			bulletTimeEnabled = BattleLoader:getBulletSetting("BulletTime_PVE_Main"),
			bgm = BGM,
			background = bgRes,
			refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
			battleSuppress = BattleDataHelper:getBattleSuppress(),
			hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting(),
			effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting(),
			passiveSkill = battlePassiveSkill,
			unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill"),
			finishWaitTime = BattleDataHelper:getBattleFinishWaitTime("crusade"),
			changeMaxNum = ConfigReader:getDataByNameIdAndKey("CrusadePoint", data.blockPointId, "BossRound") or 1,
			btnsShow = {
				speed = {
					visible = speedOpenSta and speedCanshow,
					lock = not unlockSpeed,
					tip = tipsSpeed,
					speedConfig = battleSpeed_Actual,
					speedShowConfig = battleSpeed_Display,
					timeScale = timeScale
				},
				skip = {
					enable = true,
					waitTips = "ARENA_SKIP_TIP",
					visible = canSkip,
					skipTime = skipTime
				},
				auto = {
					canChangeAuto = true,
					visible = autoFight,
					state = isAuto
				},
				pause = {
					enable = true,
					visible = true
				},
				restraint = {
					visible = self:getInjector():getInstance(SystemKeeper):canShow("Button_CombateDominating"),
					lock = not self:getInjector():getInstance(SystemKeeper):isUnlock("Button_CombateDominating")
				}
			}
		},
		loadingType = LoadingType.KCrusade
	}

	BattleLoader:pushBattleView(self, data, nil, true)
end

function CrusadeSystem:requestGetCrusadeInfo(callback)
	self._crusadeService:requestGetCrusadeInfo(nil, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:synchronize(response.data)

			if callback then
				callback(response.data)
			end
		end
	end)
end

function CrusadeSystem:requestBeginBattle()
	self._crusadeService:requestBeginBattle(nil, true, function (response)
		if response.resCode == GS_SUCCESS then
			local data = response.data

			self:enterBattleView(data)
		end
	end)
end

function CrusadeSystem:requestFinishBattle(resultData, callback)
	local param = {
		resultData = resultData
	}

	self._crusadeService:requestFinishBattle(param, true, function (response)
		if response.resCode == GS_SUCCESS then
			local function finishCallBack()
				self._showAwardAfterBattle = response.data.floorReward or {}

				if callback then
					callback(response.data)
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

			return
		end

		BattleLoader:popBattleView(self, {
			viewName = "CrusadeMainView"
		})
	end)
end

function CrusadeSystem:requestLeaveBattle(callback)
	self._crusadeService:requestLeaveBattle(nil, true, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback(response.data)
		end
	end)
end

function CrusadeSystem:requestCrusadeWipe(callback)
	self._crusadeService:requestCrusadeWipe(nil, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_CRUSADEWIPE))

			if callback then
				callback(response.data)
			end
		end
	end)
end

function CrusadeSystem:listenCrusadeDiff(callback)
	self._crusadeService:listenCrusadeDiff(function (response)
		self:dispatch(Event:new(EVT_CRUSADE_RESET_DIFF))
	end)
end
