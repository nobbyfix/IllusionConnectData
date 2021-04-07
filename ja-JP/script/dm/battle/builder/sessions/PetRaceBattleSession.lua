PetRaceBattleSession = class("PetRaceBattleSession", BaseBattleSession)

function PetRaceBattleSession:initialize(serverData)
	super.initialize(self)

	self._playerData = serverData.playerData
	self._enemyData = serverData.enemyData
	self._maxTime = serverData.maxTime
	self._playerId = self._playerData[1].rid
	self._enemyId = self._enemyData[1].rid

	self:setRandomSeeds(serverData.logicSeed)
end

function PetRaceBattleSession:buildBattleData(playerData, enemyData, randomSeed)
	local playerId = playerData[1].rid
	local enemyId = enemyData[1].rid
	local battleData = {
		playerData = {},
		enemyData = {}
	}

	for i, _playerData in ipairs(playerData) do
		_playerData.rid = playerId .. "p" .. i
		battleData.playerData[i] = BattleDataHelper:getIntegralPlayerData(_playerData)
	end

	for i, _enemyData in ipairs(enemyData) do
		_enemyData.rid = enemyId .. "p" .. i
		battleData.enemyData[i] = BattleDataHelper:getIntegralPlayerData(_enemyData, true)
	end

	return battleData
end

function PetRaceBattleSession:genBattleConfigAndData(battleData, randomSeed, maxTime)
	if battleData == nil then
		return
	end

	local maxRound = ConfigReader:getRecordById("ConfigValue", "Fight_MaximumRound").content
	local battleConfig = self:_getBlockBattleConfig(ConfigReader:getRecordById("ConfigValue", "Fight_KOF").content)
	local Fight_Time = maxTime * 1000
	local stageEnergy = {
		{
			{
				EnemyEnergySpeed = 0,
				EnergySpeed = 0,
				duration = Fight_Time
			}
		}
	}
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

function PetRaceBattleSession:buildCoreBattleLogic()
	local battleData = self:buildBattleData(self._playerData, self._enemyData, self._logicSeed)
	local battleConfig = self:genBattleConfigAndData(battleData, self._logicSeed, self._maxTime)
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	self:_setBattleConfig(battleConfig)

	return battleLogic
end

function PetRaceBattleSession:buildAutoStrategy(playerRole, team, randomSeed)
	return nil
end

function PetRaceBattleSession:genTeamAiInfo()
	return nil
end

function PetRaceBattleSession:getBattleResultAndWinnerIds()
	local battleSimulator = self._battleSimulator
	local battleResult = battleSimulator and battleSimulator:getBattleResult()
	local result = battleResult or -1
	local winner = result == 1 and self._playerId or self._enemyId

	return result, {
		winner
	}
end

function PetRaceBattleSession:generateDetailedResultSummary(err)
	local battleSimulator = self._battleSimulator
	local statData = self._battleStatist and self._battleStatist:getSummary()
	local playerIds = self:getParticipantPlayerIds()
	local players = self:getParticipantPlayers()
	local result, winners = self:getBattleResultAndWinnerIds()

	local function getRemainHpInfo(players)
		local totalMax = 0
		local totalRemain = 0

		for _, player in ipairs(players) do
			local max, remain = player:getRemainHpInfo()
			totalMax = totalMax + max
			totalRemain = totalRemain + remain
		end

		return {
			total = totalMax,
			remain = totalRemain
		}
	end

	return {
		logicSeed = self._logicSeed,
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
		hpInfo = {
			challenger = getRemainHpInfo(players[kBattleSideA]),
			defender = getRemainHpInfo(players[kBattleSideB])
		},
		err = err
	}
end

function HeroStoryBattleSession:getBattlePassiveSkill()
	local playerStagePassShow = BattleDataHelper:getStagePassiveSkill(battleData.playerData)
	local enemyStagePassShow = BattleDataHelper:getStagePassiveSkill(battleData.enemyData)
	local passiveSkill = {
		playerStagePassShow = playerStagePassShow,
		enemyStagePassShow = enemyStagePassShow
	}

	return passiveSkill
end

function PetRaceBattleSession:getBattleType()
	return "petRace"
end
