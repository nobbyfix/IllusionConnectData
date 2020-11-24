StageBattleSession = class("StageBattleSession", BaseBattleSession)

function StageBattleSession:initialize(serverData)
	super.initialize(self)

	self._pointId = serverData.pointId
	self._playerData = serverData.playerData
	self._playerId = self._playerData.rid
	self._enemyId = self._pointId
	self._enemyBuff = serverData.enemyBuff

	self:setRandomSeeds(serverData.logicSeed, serverData.strategySeedA, serverData.strategySeedB)
end

function StageBattleSession:buildBattleData(pointId, playerData, randomSeed)
	local pointConfig = ConfigReader:getRecordById("BlockPoint", pointId)
	local enemyData = self:_getEneryData(pointConfig.EnemyMaster)
	local randomizer = Random:new(randomSeed)
	local playerCards = playerData.cards

	self:_buildCardPool(enemyData, randomizer, pointConfig.EnemyCard, playerCards)

	local playerDrawCard = pointConfig.PlayerCard ~= "" and pointConfig.PlayerCard or ConfigReader:getRecordById("ConfigValue", "Fight_PlayerDrawCard").content

	self:_buildCardPool(playerData, randomizer, playerDrawCard, playerCards)

	enemyData.rid = pointId
	enemyData.headImg = pointConfig.BossHeadPic
	enemyData.initiative = pointConfig.Speed

	if pointConfig.Assist then
		enemyData.assist = {}

		for i, heroId in ipairs(pointConfig.Assist) do
			enemyData.assist[i] = self:_fillEnemyHeroCardData(heroId).hero
		end
	end

	return BattleDataHelper:getIntegralBattleData({
		playerData = playerData,
		enemyData = enemyData
	})
end

function StageBattleSession:genBattleConfigAndData(battleData, pointId, randomSeed)
	if battleData == nil then
		return
	end

	local pointConfig = ConfigReader:getRecordById("BlockPoint", pointId)
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

function StageBattleSession:buildCoreBattleLogic()
	local battleData = self:buildBattleData(self._pointId, self._playerData, self._logicSeed)
	local battleConfig = self:genBattleConfigAndData(battleData, self._pointId, self._logicSeed)
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	self:_setBattleConfig(battleConfig)

	self._rawBattleData = battleData

	return battleLogic
end

function StageBattleSession:generateResultSummary()
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

function StageBattleSession:generateDetailedResultSummary(err)
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

function StageBattleSession:getBattleType()
	return "stage"
end

function StageBattleSession:getBattlePassiveSkill()
	local pointConfig = ConfigReader:getRecordById("BlockPoint", self._pointId)
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
