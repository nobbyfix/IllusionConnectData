ClubBattleSession = class("ClubBattleSession", BaseBattleSession)

function ClubBattleSession:initialize(serverData, seasonInfo)
	super.initialize(self)

	self._pointId = serverData.pointId
	self._mapId = serverData.mapId
	self._playerData = serverData.playerData
	self._enemyData = serverData.enemyData
	self._herosEffect = serverData.herosEffect or {}
	self._enemyId = self._pointId
	self._playerId = self._playerData.rid
	self._seasonInfo = seasonInfo

	self:setRandomSeeds(serverData.logicSeed, serverData.strategySeedA, serverData.strategySeedB)
end

function ClubBattleSession:buildBattleData(mapId, pointId, playerData, enemyData, randomSeed)
	enemyData.rid = pointId

	self:fillHeroAttrEffect(playerData)
	self:modifyEnemyMasterModel(enemyData)

	return BattleDataHelper:getIntegralBattleData({
		playerData = playerData,
		enemyData = enemyData
	})
end

function ClubBattleSession:genBattleConfigAndData(battleData, mapId, pointId, randomSeed)
	if battleData == nil then
		return
	end

	local pointConfig = ConfigReader:getRecordById("ClubBlockBattle", mapId)
	local battleConfig = self:_getBlockBattleConfig(pointConfig.BlockBattleConfig)
	local maxRound = ConfigReader:getRecordById("ConfigValue", "Fight_MaximumRound").content
	local stageEnergy = battleConfig and battleConfig.StageEnergy or self:_getBlockBattleConfig(ConfigReader:getRecordById("ConfigValue", "Fight_StageEnergy").content).StageEnergy
	local battlePhaseConfig = self:_genBattlePhaseConfig(stageEnergy, {
		waitMode = battleConfig and battleConfig.WaitMode,
		waitTime = battleConfig and battleConfig.WaitModeLimit,
		battleMode = battleConfig and battleConfig.BattleMode
	})

	self:_applyBattleConfig(battleData, battleConfig)

	local victoryConditions = pointConfig.VictoryConditions

	return {
		battlePhaseConfig = battlePhaseConfig,
		randomSeed = randomSeed,
		maxRound = maxRound,
		victoryCfg = victoryConditions
	}
end

function ClubBattleSession:buildCoreBattleLogic()
	local battleData = self:buildBattleData(self._mapId, self._pointId, self._playerData, self._enemyData, self._logicSeed)
	local battleConfig = self:genBattleConfigAndData(battleData, self._mapId, self._pointId, self._logicSeed)
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	self:_setBattleConfig(battleConfig)

	self._rawBattleData = battleData

	return battleLogic
end

function ClubBattleSession:generateResultSummary()
	local battleSimulator = self._battleSimulator
	local statData = self._battleStatist and self._battleStatist:getSummary()
	local result, winners = self:getBattleResultAndWinnerIds()

	return {
		logicSeed = self._logicSeed,
		strategySeedA = self._strategySeedA,
		strategySeedB = self._strategySeedB,
		result = result,
		winners = winners,
		statist = statData,
		opData = battleSimulator:getInputManager():dumpInputHistory()
	}
end

function ClubBattleSession:generateDetailedResultSummary(err)
	local battleSimulator = self._battleSimulator
	local statData = self._battleStatist and self._battleStatist:getSummary()
	local playerIds = self:getParticipantPlayerIds()
	local result, winners = self:getBattleResultAndWinnerIds()
	local battleRecords = self._battleRecorder and self._battleRecorder:dumpRecords()

	return {
		logicSeed = self._logicSeed,
		strategySeedA = self._strategySeedA,
		strategySeedB = self._strategySeedB,
		result = result,
		winners = winners,
		statist = statData,
		opData = battleSimulator:getInputManager():dumpInputHistory(),
		timelines = self._battleRecorder and self._battleRecorder:dumpRecords(),
		playersInfo = {
			challenger = {
				rid = self._playerId,
				playerId = playerIds[kBattleSideA]
			},
			defender = {
				rid = self._enemyId,
				playerId = playerIds[kBattleSideB]
			}
		},
		err = err
	}
end

function ClubBattleSession:getBattleType()
	return "clubboss"
end

function ClubBattleSession:getBattlePassiveSkill()
	local pointConfig = ConfigReader:getRecordById("ClubBlockPoint", self._pointId)
	local specialSkillShow = pointConfig.SpecialSkillShow or {}
	local battleData = self:getPlayersData()
	local playerShow = BattleDataHelper:getPassiveSkill(battleData.playerData)
	local enemyShow = {}

	for k, v in pairs(specialSkillShow) do
		enemyShow[#enemyShow + 1] = {
			lv = 1,
			id = v
		}
	end

	local passiveSkill = {
		playerShow = playerShow,
		enemyShow = enemyShow
	}

	return passiveSkill
end

function ClubBattleSession:modifyEnemyMasterModel(enemyData)
	if enemyData and enemyData.master then
		enemyData.master.modelScale = 1.4
	end
end

function ClubBattleSession:fillHeroAttrEffect(playerData)
	local function isInTable(search, table)
		for k, v in pairs(table) do
			if search == v then
				return true
			end
		end

		return false
	end

	local function caclulateAttrNum(effects)
		local addNum = 0

		for k, v in pairs(effects) do
			if v.attrType == "HURTRATE" and isInTable(v.target, {
				"SELF",
				"ALL",
				"HERO"
			}) and v.effectEvn == "ALL" then
				addNum = addNum + v.attrNum
			end
		end

		return addNum
	end

	local function getIsRecommend(heroId)
		if self._seasonInfo then
			for k, v in pairs(self._seasonInfo.ExcellentHero) do
				if v.Hero then
					for index, id in pairs(v.Hero) do
						if id == heroId then
							return true
						end
					end
				end
			end
		end

		return false
	end

	local level = 1

	for heroId, info in pairs(self._herosEffect) do
		local addNum = 0

		for k, effectId in pairs(info) do
			local effect = BattleSkillAttrEffect:createEffect(effectId, level)
			addNum = addNum + caclulateAttrNum(effect)
		end

		for k, v in pairs(playerData.cards) do
			if v.hero.configId == heroId then
				v.hero.addHurtRate = Strings:get("LOGIN_UI13")
			end
		end
	end

	for k, v in pairs(playerData.cards) do
		if getIsRecommend(v.hero.configId) then
			v.hero.addHurtRate = Strings:get("clubBoss_46")
		end
	end
end
