HeroStoryBattleSession = class("HeroStoryBattleSession", StageBattleSession)

function HeroStoryBattleSession:buildBattleData(pointId, playerData, randomSeed)
	local pointConfig = ConfigReader:getRecordById("HeroStoryPoint", pointId)
	local enemyData = self:_getEneryData(pointConfig.EnemyMaster)
	local randomizer = Random:new(randomSeed)
	local playerCards = playerData.cards

	self:_buildCardPool(enemyData, randomizer, pointConfig.EnemyCard, playerCards)

	local playerDrawCard = ConfigReader:getRecordById("ConfigValue", "Fight_PlayerDrawCard").content

	self:_buildCardPool(playerData, randomizer, playerDrawCard, playerCards)

	enemyData.rid = pointId
	enemyData.headImg = pointConfig.BossHeadPic
	enemyData.initiative = pointConfig.Speed

	return BattleDataHelper:getIntegralBattleData({
		playerData = playerData,
		enemyData = enemyData
	})
end

function HeroStoryBattleSession:genBattleConfigAndData(battleData, pointId, randomSeed)
	if battleData == nil then
		return
	end

	local pointConfig = ConfigReader:getRecordById("HeroStoryPoint", pointId)
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

function HeroStoryBattleSession:getBattleType()
	return "heroStory"
end

function HeroStoryBattleSession:getBattlePassiveSkill()
	local pointConfig = ConfigReader:getRecordById("HeroStoryPoint", self._pointId)
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
