local indexOf = table.indexof
RTPVPBattleSession = class("RTPVPBattleSession", BaseBattleSession)

function RTPVPBattleSession:initialize(serverData)
	super.initialize(self)

	self._playerAData = serverData.playerData
	self._playerBData = serverData.enemyData
	self._playerAData.tacticsNeedWait = true
	self._playerBData.tacticsNeedWait = true
	self._seasonId = serverData.seasonId
	self._battleType = serverData.battleType

	self:setRandomSeeds(serverData.logicSeed)
end

function RTPVPBattleSession:buildBattleData(playerAData, playerBData, randomSeed)
	local randomizer = Random:new(randomSeed)
	local playerDrawCard = ConfigReader:getRecordById("ConfigValue", "Fight_PlayerDrawCard").content

	self:_buildCardPool(playerAData, randomizer, playerDrawCard, playerAData.cards)
	self:_buildCardPool(playerBData, randomizer, playerDrawCard, playerBData.cards)

	return BattleDataHelper:getIntegralBattleData({
		playerData = playerAData,
		enemyData = playerBData
	})
end

function RTPVPBattleSession:genBattleConfigAndData(battleData, randomSeed)
	if battleData == nil then
		return
	end

	local maxRound = ConfigReader:getRecordById("ConfigValue", "Fight_MaximumRound").content
	local battleId = ConfigReader:getRecordById("ConfigValue", "Fight_Friend").content

	if self._battleType == "orrtpk" then
		local ruleId = ConfigReader:getDataByNameIdAndKey("RTPKSeason", self._seasonId, "SeasonRule")
		battleId = ConfigReader:getDataByNameIdAndKey("RTPKRule", ruleId, "BattleConfig")
	end

	local battleConfig = self:_getBlockBattleConfig(battleId)
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

function RTPVPBattleSession:buildAutoStrategy(playerRole, team, randomSeed)
	return nil
end

function RTPVPBattleSession:genTeamAiInfo()
	return nil
end

function RTPVPBattleSession:buildCoreBattleLogic()
	local battleData = self:buildBattleData(self._playerAData, self._playerBData, self._logicSeed)
	local battleConfig = self:genBattleConfigAndData(battleData, self._logicSeed)
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	self:_setBattleConfig(battleConfig)

	self._rawBattleData = battleData

	return battleLogic
end

function RTPVPBattleSession:generateResultSummary()
	local battleSimulator = self._battleSimulator
	local statData = self._battleStatist and self._battleStatist:getSummary()
	local result, winners = self:getBattleResultAndWinnerIds()

	return {
		logicSeed = self._logicSeed,
		result = result,
		winners = winners,
		statist = statData,
		opData = battleSimulator:getInputManager():dumpInputHistory()
	}
end

function RTPVPBattleSession:getBattleType()
	return "rtpvp"
end

function RTPVPBattleSession:getBattlePassiveSkill(battleData, mainPlayerId)
	local playerShow = {}
	local enemyShow = {}
	local playerStagePassShow = {}
	local enemyStagePassShow = {}

	if battleData.playerData and battleData.playerData.rid == mainPlayerId then
		playerShow = BattleDataHelper:getPassiveSkill(battleData.playerData)
		enemyShow = BattleDataHelper:getPassiveSkill(battleData.enemyData)
		playerStagePassShow = BattleDataHelper:getStagePassiveSkill(battleData.playerData)
		enemyStagePassShow = BattleDataHelper:getStagePassiveSkill(battleData.enemyData)
	else
		enemyShow = BattleDataHelper:getPassiveSkill(battleData.playerData)
		playerShow = BattleDataHelper:getPassiveSkill(battleData.enemyData)
		playerStagePassShow = BattleDataHelper:getStagePassiveSkill(battleData.enemyData)
		enemyStagePassShow = BattleDataHelper:getStagePassiveSkill(battleData.playerData)
	end

	local passiveSkill = {
		playerShow = playerShow,
		enemyShow = enemyShow,
		playerStagePassShow = playerStagePassShow,
		enemyStagePassShow = enemyStagePassShow
	}

	return passiveSkill
end
