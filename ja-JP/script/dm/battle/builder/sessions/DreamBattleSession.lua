DreamBattleSession = class("DreamBattleSession", BaseBattleSession)

function DreamBattleSession:initialize(serverData, serverPlayerData)
	super.initialize(self)

	self._dreamBattleId = serverData.dreamId
	self._pointId = serverData.pointId
	self._mapId = serverData.mapId
	self._playerData = serverData.playerData
	self._enemyData = serverData.enemyData
	self._herosEffect = serverData.herosEffect or {}
	self._enemyId = self._pointId
	self._playerId = self._playerData.rid
	self._serverPlayerData = serverPlayerData

	self:setRandomSeeds(serverData.logicSeed, serverData.strategySeedA, serverData.strategySeedB)
end

function DreamBattleSession:buildBattleData(mapId, pointId, playerData, enemyData, randomSeed)
	enemyData.rid = pointId
	local randomizer = Random:new(randomSeed)

	self:_buildCardPool(playerData, randomizer)

	return BattleDataHelper:getIntegralBattleData({
		playerData = playerData,
		enemyData = enemyData
	})
end

function DreamBattleSession:genBattleConfigAndData(battleData, dreamBattleId, mapId, pointId, randomSeed)
	if battleData == nil then
		return
	end

	local battleConfig = ConfigReader:getRecordById("DreamChallengeBattle", dreamBattleId)
	local battleConfig = self:_getBlockBattleConfig(battleConfig.BlockBattleConfig)
	local maxRound = ConfigReader:getRecordById("ConfigValue", "Fight_MaximumRound").content
	local stageEnergy = battleConfig and battleConfig.StageEnergy or self:_getBlockBattleConfig(ConfigReader:getRecordById("ConfigValue", "Fight_StageEnergy").content).StageEnergy
	local battlePhaseConfig = self:_genBattlePhaseConfig(stageEnergy, {
		waitMode = battleConfig and battleConfig.WaitMode,
		waitTime = battleConfig and battleConfig.WaitModeLimit,
		battleMode = battleConfig and battleConfig.BattleMode
	})

	self:_applyBattleConfig(battleData, battleConfig)

	local victoryConditions = battleConfig.VictoryConditions

	return {
		battlePhaseConfig = battlePhaseConfig,
		randomSeed = randomSeed,
		maxRound = maxRound,
		victoryCfg = victoryConditions
	}
end

function DreamBattleSession:buildCoreBattleLogic()
	local battleData = self:buildBattleData(self._mapId, self._pointId, self._playerData, self._enemyData, self._logicSeed)
	local battleConfig = self:genBattleConfigAndData(battleData, self._dreamBattleId, self._mapId, self._pointId, self._logicSeed)
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	self:_setBattleConfig(battleConfig)

	self._rawBattleData = battleData

	return battleLogic
end

function DreamBattleSession:generateResultSummary()
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

function DreamBattleSession:generateDetailedResultSummary(err)
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

function DreamBattleSession:getBattleType()
	return "dream"
end

function DreamBattleSession:getBattlePassiveSkill()
	local specialSkillShow = {}
	local battleData = self:getPlayersData()
	local playerShow = BattleDataHelper:getPassiveSkill(battleData.playerData)

	self:addTempBuff(playerShow)

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

function DreamBattleSession:addTempBuff(playerShow)
	local function getVal(t, ...)
		local keys = {
			...
		}

		if #keys > 0 then
			local key = keys[1]

			table.remove(keys, 1)

			if #keys > 0 then
				return t[key] and getVal(t[key], unpack(keys)) or nil
			else
				return t[key]
			end
		else
			return nil
		end
	end

	if self._serverPlayerData then
		local tmpBuffs = getVal(self._serverPlayerData, "player", "dreamChallenge", "dreamMaps", self._mapId, "dreamPoints", self._pointId, "buffs")

		if tmpBuffs then
			for k, v in pairs(tmpBuffs) do
				playerShow[#playerShow + 1] = {
					lv = 1,
					temp = true,
					id = k
				}
			end
		end
	end
end
