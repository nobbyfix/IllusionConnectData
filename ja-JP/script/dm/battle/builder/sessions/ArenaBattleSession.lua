ArenaBattleSession = class("ArenaBattleSession", BaseBattleSession)

function ArenaBattleSession:initialize(serverData)
	super.initialize(self)

	self._playerData = serverData.playerData
	self._enemyData = serverData.enemyData
	self._playerId = self._playerData.rid
	self._enemyId = self._enemyData.rid

	self:setRandomSeeds(serverData.logicSeed, serverData.strategySeedA, serverData.strategySeedB)
end

function ArenaBattleSession:buildBattleData(playerData, enemyData, randomSeed)
	local randomizer = Random:new(randomSeed)
	local playerDrawCard = ConfigReader:getRecordById("ConfigValue", "Fight_PlayerDrawCard").content

	return BattleDataHelper:getIntegralBattleData({
		playerData = playerData,
		enemyData = enemyData
	})
end

function ArenaBattleSession:genBattleConfigAndData(battleData, randomSeed)
	if battleData == nil then
		return
	end

	local maxRound = ConfigReader:getRecordById("ConfigValue", "Fight_MaximumRound").content
	local battleConfig = self:_getBlockBattleConfig(ConfigReader:getRecordById("ConfigValue", "Fight_Arena").content)
	local stageEnergy = battleConfig and battleConfig.StageEnergy or self:_getBlockBattleConfig(ConfigReader:getRecordById("ConfigValue", "Fight_StageEnergy").content).StageEnergy
	local battlePhaseConfig = self:_genBattlePhaseConfig(stageEnergy, {
		waitMode = battleConfig and battleConfig.WaitMode,
		waitTime = battleConfig and battleConfig.WaitModeLimit,
		battleMode = battleConfig and battleConfig.BattleMode
	})

	self:_applyBattleConfig(battleData, battleConfig)

	return {
		battlePhaseConfig = battlePhaseConfig,
		randomSeed = randomSeed,
		maxRound = maxRound,
		victoryCfg = victoryConditions
	}
end

function ArenaBattleSession:buildCoreBattleLogic()
	local battleData = self:buildBattleData(self._playerData, self._enemyData, self._logicSeed)
	local battleConfig = self:genBattleConfigAndData(battleData, self._logicSeed)
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	self:_setBattleConfig(battleConfig)

	self._rawBattleData = battleData

	return battleLogic
end

function ArenaBattleSession:getBattleResultAndWinnerIds()
	local battleSimulator = self._battleSimulator
	local battleResult = battleSimulator and battleSimulator:getBattleResult()
	local result = battleResult or -1
	local winner = result == 1 and self._playerId or self._enemyId

	return result, {
		winner
	}
end

function ArenaBattleSession:generateDetailedResultSummary(err)
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

function ArenaBattleSession:generateResultSummary()
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
		opData = battleSimulator:getInputManager():dumpInputHistory(),
		timelines = self._battleRecorder and self._battleRecorder:dumpRecords(),
		passiveSkill = self:getBattlePassiveSkill()
	}
end

function ArenaBattleSession:buildAutoStrategy(playerRole, team, randomSeed)
	local strategy = SequenceStrategy:new(team, Random:new(randomSeed))

	if strategy.setDefaultInitWaitingCD then
		local defaultCD = ConfigReader:getRecordById("ConfigValue", "Fight_DefaultInitWaitingCD") and ConfigReader:getRecordById("ConfigValue", "Fight_DefaultInitWaitingCD").content or 500

		strategy:setDefaultInitWaitingCD(defaultCD)
	end

	return strategy
end

function ArenaBattleSession:getBattleType()
	return "arena"
end

function ArenaBattleSession:getBattlePassiveSkill()
	local battleData = self:getPlayersData()
	local playerShow = BattleDataHelper:getPassiveSkill(battleData.playerData)
	local enemyShow = BattleDataHelper:getPassiveSkill(battleData.enemyData)
	local passiveSkill = {
		playerShow = playerShow,
		enemyShow = enemyShow
	}

	return passiveSkill
end
