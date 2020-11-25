DumpBattleSession = class("DumpBattleSession", BaseBattleSession)

function DumpBattleSession:initialize(serverData)
	super.initialize(self)

	self._rawBattleData = serverData.battleData
	self._battleConfig = serverData.battleConfig
	self._battleType = serverData.battleType

	self:setRandomSeeds(serverData.logicSeed, serverData.strategySeedA, serverData.strategySeedB)
end

function DumpBattleSession:buildCoreBattleLogic()
	local battleData = self._rawBattleData
	local battleConfig = self._battleConfig
	local battleLogic = self:createBattleLogic(battleConfig, battleData)

	return battleLogic
end

function DumpBattleSession:buildAutoStrategy(playerRole, team, randomSeed)
	return nil
end

function DumpBattleSession:generateResultSummary()
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

function DumpBattleSession:generateDetailedResultSummary(err)
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

function DumpBattleSession:getBattleType()
	return self._battleType
end
