ActstageBattleSession = class("ActstageBattleSession", BaseBattleSession)

function ActstageBattleSession:initialize(serverData)
	super.initialize(self)

	self._blockMapId = serverData.blockMapId
	self._blockPointId = serverData.blockPointId
	self._playerData = serverData.playerData
	self._enemyData = serverData.enemyData
	self._playerId = self._playerData.rid
	self._enemyId = self._enemyData.rid
	self._enemyBuff = serverData.enemyBuff

	self:setRandomSeeds(serverData.logicSeed, serverData.strategySeedA, serverData.strategySeedB)
end

function ActstageBattleSession:buildBattleData(playerData, enemyData, randomSeed)
	local randomizer = Random:new(randomSeed)
	local playerDrawCard = ConfigReader:getRecordById("ConfigValue", "Fight_PlayerDrawCard").content
	local pointConfig = ConfigReader:getRecordById("ActivityBlockPoint", self._blockPointId)
	pointConfig = pointConfig or ConfigReader:getRecordById("ActivityBlockBattle", self._blockPointId)
	local enemyCard = pointConfig.EnemyCard
	local playerCards = playerData.cards

	self:_buildCardPool(enemyData, randomizer, enemyCard, playerCards)
	self:_buildCardPool(playerData, randomizer, playerDrawCard, playerCards)

	return BattleDataHelper:getIntegralBattleData({
		playerData = playerData,
		enemyData = enemyData
	})
end

function ActstageBattleSession:genBattleConfigAndData(battleData, randomSeed)
	if battleData == nil then
		return
	end

	local pointConfig = ConfigReader:getRecordById("ActivityBlockPoint", self._blockPointId)
	pointConfig = pointConfig or ConfigReader:getRecordById("ActivityBlockBattle", self._blockPointId)
	local maxRound = ConfigReader:getRecordById("ConfigValue", "Fight_MaximumRound").content
	local battleConfig = self:_getBlockBattleConfig(pointConfig.BlockBattleConfig)
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

function ActstageBattleSession:buildCoreBattleLogic()
	local battleData = self:buildBattleData(self._playerData, self._enemyData, self._logicSeed)
	local battleConfig = self:genBattleConfigAndData(battleData, self._logicSeed)
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	self:_setBattleConfig(battleConfig)

	self._rawBattleData = battleData

	return battleLogic
end

function ActstageBattleSession:getBattleResultAndWinnerIds()
	local battleSimulator = self._battleSimulator
	local battleResult = battleSimulator and battleSimulator:getBattleResult()
	local result = battleResult or -1
	local winner = result == 1 and self._playerId or self._enemyId

	return result, {
		winner
	}
end

function ActstageBattleSession:generateDetailedResultSummary(err)
	local battleSimulator = self._battleSimulator
	local statData = self._battleStatist and self._battleStatist:getSummary()
	local playerA = self:getParticipantPlayers()[kBattleSideA][1]
	local playerB = self:getParticipantPlayers()[kBattleSideB][1]
	local result, winners = self:getBattleResultAndWinnerIds()

	return {
		logicSeed = self._logicSeed,
		strategySeedA = self._strategySeedA,
		strategySeedB = self._strategySeedB,
		result = result,
		winners = winners,
		statist = statData,
		pointId = self._blockPointId,
		mapId = self._blockMapId,
		opData = battleSimulator:getInputManager():dumpInputHistory(),
		timelines = self._battleRecorder and self._battleRecorder:dumpRecords(),
		playersInfo = {
			challenger = {
				rid = self._playerId,
				playerId = {
					playerA:getId()
				}
			},
			defender = {
				rid = self._enemyId,
				playerId = {
					playerB:getId()
				}
			}
		},
		passiveSkill = self:getBattlePassiveSkill(),
		err = err
	}
end

function ActstageBattleSession:generateResultSummary()
	local battleSimulator = self._battleSimulator
	local statData = self._battleStatist and self._battleStatist:getSummary()
	local result, winners = self:getBattleResultAndWinnerIds()

	return {
		logicSeed = self._logicSeed,
		strategySeedA = self._strategySeedA,
		strategySeedB = self._strategySeedB,
		result = result,
		winners = winners,
		pointId = self._blockPointId,
		statist = statData,
		opData = battleSimulator:getInputManager():dumpInputHistory(),
		timelines = self._battleRecorder and self._battleRecorder:dumpRecords(),
		passiveSkill = self:getBattlePassiveSkill()
	}
end

function ActstageBattleSession:buildAutoStrategy(playerRole, team, randomSeed)
	local strategy = SequenceStrategy:new(team, Random:new(randomSeed))

	if strategy.setDefaultInitWaitingCD then
		local defaultCD = ConfigReader:getRecordById("ConfigValue", "Fight_DefaultInitWaitingCD") and ConfigReader:getRecordById("ConfigValue", "Fight_DefaultInitWaitingCD").content or 500

		strategy:setDefaultInitWaitingCD(defaultCD)
	end

	return strategy
end

function ActstageBattleSession:getBattleType()
	return "actstage"
end

function ActstageBattleSession:getBattlePassiveSkill()
	local battleData = self:getPlayersData()
	local playerShow = BattleDataHelper:getTowerPassiveSkill(battleData.playerData)
	local pointConfig = ConfigReader:getRecordById("ActivityBlockPoint", self._blockPointId)
	pointConfig = pointConfig or ConfigReader:getRecordById("ActivityBlockBattle", self._blockPointId)
	local specialSkillShow = pointConfig.SpecialSkillShow or {}
	local enemyShow = {}

	for k, v in pairs(specialSkillShow) do
		enemyShow[#enemyShow + 1] = {
			lv = 1,
			id = v
		}
	end

	local playerStagePassShow = BattleDataHelper:getStagePassiveSkill(battleData.playerData)
	local enemyStagePassShow = BattleDataHelper:getStagePassiveSkill(battleData.enemyData)
	local passiveSkill = {
		playerShow = playerShow,
		enemyShow = enemyShow,
		playerStagePassShow = playerStagePassShow,
		enemyStagePassShow = enemyStagePassShow
	}

	return passiveSkill
end
