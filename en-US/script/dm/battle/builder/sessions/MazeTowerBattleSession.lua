MazeTowerBattleSession = class("MazeTowerBattleSession", BaseBattleSession)

function MazeTowerBattleSession:initialize(serverData)
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

function MazeTowerBattleSession:buildBattleData(playerData, enemyData, randomSeed)
	local randomizer = Random:new(randomSeed)
	local playerDrawCard = ConfigReader:getRecordById("ConfigValue", "Fight_PlayerDrawCard").content
	local pointConfig = ConfigReader:getRecordById("MazeBlockBattle", self._blockPointId)
	local enemyCard = pointConfig.EnemyCard
	local playerCards = playerData.cards

	return BattleDataHelper:getIntegralBattleData({
		playerData = playerData,
		enemyData = enemyData
	})
end

function MazeTowerBattleSession:genBattleConfigAndData(battleData, randomSeed)
	if battleData == nil then
		return
	end

	local pointConfig = ConfigReader:getRecordById("MazeBlockBattle", self._blockPointId)
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

function MazeTowerBattleSession:buildCoreBattleLogic()
	local battleData = self:buildBattleData(self._playerData, self._enemyData, self._logicSeed)
	local battleConfig = self:genBattleConfigAndData(battleData, self._logicSeed)
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	self:_setBattleConfig(battleConfig)

	self._rawBattleData = battleData

	return battleLogic
end

function MazeTowerBattleSession:_adjustPlayerData(data, extra)
	super._adjustPlayerData(self, data, extra)

	local heros = data.waves and data.waves[1].heros

	if heros then
		for idx, hero in pairs(heros) do
			local enemyCfg = ConfigReader:getRecordById("EnemyHero", hero.configId)

			if enemyCfg and enemyCfg.RageRules then
				hero.angerRules = enemyCfg.RageRules
			end
		end
	end
end

function MazeTowerBattleSession:getBattleResultAndWinnerIds()
	local battleSimulator = self._battleSimulator
	local battleResult = battleSimulator and battleSimulator:getBattleResult()
	local result = battleResult or -1
	local winner = result == 1 and self._playerId or self._enemyId

	return result, {
		winner
	}
end

function MazeTowerBattleSession:generateDetailedResultSummary(err)
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

function MazeTowerBattleSession:generateResultSummary()
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

function MazeTowerBattleSession:getBattleType()
	return "mazeTower"
end

function MazeTowerBattleSession:getBattlePassiveSkill()
	local battleData = self:getPlayersData()
	local playerShow = BattleDataHelper:getTowerPassiveSkill(battleData.playerData)
	local pointConfig = ConfigReader:getRecordById("MazeBlockBattle", self._blockPointId)
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
