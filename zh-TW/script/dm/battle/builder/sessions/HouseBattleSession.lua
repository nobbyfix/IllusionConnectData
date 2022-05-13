HouseBattleSession = class("HouseBattleSession", BaseBattleSession)

function HouseBattleSession:initialize(serverData, serverPlayerData)
	super.initialize(self)

	self._battleId = serverData.battleId
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

function HouseBattleSession:buildBattleData(mapId, pointId, playerData, enemyData, randomSeed)
	enemyData.rid = pointId
	local randomizer = Random:new(randomSeed)

	self:_buildCardPool(playerData, randomizer)

	return BattleDataHelper:getIntegralBattleData({
		playerData = playerData,
		enemyData = enemyData
	})
end

function HouseBattleSession:genBattleConfigAndData(battleData, battleId, mapId, pointId, randomSeed)
	if battleData == nil then
		return
	end

	local battleConfig = ConfigReader:getRecordById("DreamHouseBattle", battleId)
	self._assistNPC = {}
	local battleConfig = self:_getBlockBattleConfig(battleConfig.BlockBattleConfig)
	local maxRound = ConfigReader:getRecordById("ConfigValue", "Fight_MaximumRound").content
	local stageEnergy = battleConfig and battleConfig.StageEnergy or self:_getBlockBattleConfig(ConfigReader:getRecordById("ConfigValue", "Fight_StageEnergy").content).StageEnergy
	local battlePhaseConfig = self:_genBattlePhaseConfig(stageEnergy, {
		waitMode = battleConfig and battleConfig.WaitMode,
		waitTime = battleConfig and battleConfig.WaitModeLimit,
		battleMode = battleConfig and battleConfig.BattleMode
	})

	self:_applyBattleConfig(battleData, battleConfig)

	local baseConfig = ConfigReader:getRecordById("DreamHouseBattle", battleId)
	local cellCfg = self:_genGroundCellCfg(baseConfig.PositionLimit)
	local victoryConditions = baseConfig.VictoryConditions

	return {
		battlePhaseConfig = battlePhaseConfig,
		randomSeed = randomSeed,
		maxRound = maxRound,
		victoryCfg = victoryConditions,
		groundCellCfg = cellCfg
	}
end

function HouseBattleSession:_applyBattleConfig(battleData, battleConfig)
	super._applyBattleConfig(self, battleData, battleConfig)

	local npc_maps = {}

	for k, v in pairs(self._assistNPC or {}) do
		npc_maps[v.id] = true
		local enemy = ConfigReader:getRecordById("EnemyHero", v.id)

		if enemy and enemy.RageRules then
			npc_maps[v.id] = enemy.RageRules
		end
	end

	if battleData.playerData.waves then
		for k, v in pairs(battleData.playerData.waves) do
			for _, hero in pairs(v.heros) do
				if npc_maps[hero.cid] then
					hero.angerRules = npc_maps[hero.cid]
				end
			end
		end
	end
end

function HouseBattleSession:buildCoreBattleLogic()
	local battleData = self:buildBattleData(self._mapId, self._pointId, self._playerData, self._enemyData, self._logicSeed)
	local battleConfig = self:genBattleConfigAndData(battleData, self._battleId, self._mapId, self._pointId, self._logicSeed)
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	self:_setBattleConfig(battleConfig)

	self._rawBattleData = battleData

	return battleLogic
end

function HouseBattleSession:generateResultSummary()
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

function HouseBattleSession:generateDetailedResultSummary(err)
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

function HouseBattleSession:getBattleType()
	return "dream"
end

function HouseBattleSession:getBattlePassiveSkill()
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

function HouseBattleSession:addTempBuff(playerShow)
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
