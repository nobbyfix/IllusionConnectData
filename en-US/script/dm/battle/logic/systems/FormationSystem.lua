FormationSystem = class("FormationSystem", BattleSubSystem)

FormationSystem:has("_entityManager", {
	is = "rw"
})
FormationSystem:has("_randomizer", {
	is = "rw"
})
FormationSystem:has("_cemetery", {
	is = "rw"
})

function FormationSystem:initialize()
	super.initialize(self)

	self._cellsForPlayers = {}
	self._excludingUnits = {}
end

function FormationSystem:startup(battleContext)
	super.startup(self, battleContext)

	self._battleField = battleContext:getObject("BattleField")
	self._entityManager = battleContext:getObject("EntityManager")
	self._randomizer = battleContext:getObject("Randomizer")
	self._actionScheduler = battleContext:getObject("ActionScheduler")
	self._cemetery = BattleCemetery:new()
	self._angerSystem = battleContext:getObject("AngerSystem")
	self._TrapSystem = battleContext:getObject("TrapSystem")

	return self
end

function FormationSystem:_getCellsForPlayer(player)
	local cellsForPlayer = self._cellsForPlayers[player]

	if cellsForPlayer == nil then
		cellsForPlayer = self._battleField:collectCells({}, player:getSide(), false)
		self._cellsForPlayers[player] = cellsForPlayer
	end

	return cellsForPlayer
end

function FormationSystem:_collectEmptyCellsForPlayer(player)
	local cellsForPlayer = self:_getCellsForPlayer(player)
	local emptyCells = {}
	local count = 0

	for i = 1, #cellsForPlayer do
		local cell = cellsForPlayer[i]

		if cell and cell:getResident() == nil and cell:isNormalStatus() then
			count = count + 1
			emptyCells[i] = cell
		end
	end

	emptyCells.count = count

	return emptyCells
end

local function getEmptyCell(emptyCells, positions)
	for i = 1, #positions do
		local pos = positions[i]

		if pos == 0 then
			return 0, nil
		end

		local cell = emptyCells[pos]

		if cell then
			return pos, cell
		end
	end

	return nil
end

function FormationSystem:_settleUnit(player, unit, cellId, animation, isUserCmd, fromAction)
	local battleField = self._battleField
	local unitType = unit:getUnitType()

	unit:setOwner(player)
	battleField:settleUnit(cellId, unit)
	unit:getFSM():changeState(UnitSimpleState:new("NewBorn", 50))

	local processRecorder = self._processRecorder

	if processRecorder ~= nil then
		local unitInfo = unit:dumpInformation()
		unitInfo.anim = animation
		unitInfo.owner = player:getId()

		processRecorder:newObjectTimeline(unitInfo.id, "BattleUnit")
		processRecorder:recordObjectEvent(unitInfo.id, fromAction, unitInfo)
	end

	if self._eventCenter then
		self._eventCenter:dispatchEvent("UnitSpawned", {
			how = "single",
			from = fromAction,
			player = player,
			unit = unit
		})
	end

	local enterAction = BattleEnterAction:new(isUserCmd):withActor(unit)

	self._actionScheduler:addEmergentAction(enterAction)

	if self._eventCenter then
		self._eventCenter:dispatchEvent("UnitPreEnter", {
			unit = unit
		})
	end

	if self._eventCenter and unit and unit:getSide() == kBattleSideA and unit:getUnitType() == BattleUnitType.kHero then
		self._eventCenter:dispatchEvent("GuideUnitSpawned")
	end

	return unit
end

function FormationSystem:SpawnUnit(player, unitData, cellNo, animation, isUserCmd, isMasterOrCost)
	local cellId = makeCellId(player:getSide(), cellNo)
	local battleField = self._battleField

	if not battleField:isEmptyCell(cellId) then
		return false, "InvalidTargetPosition"
	end

	local entityManager = self._entityManager
	local unit = nil

	if isMasterOrCost == true then
		unit = entityManager:createMasterUnit(unitData)
	else
		local cost = isMasterOrCost
		local energyInfo = nil

		if cost and cost > 0 then
			energyInfo = player:consumeEnergy(cost)

			if energyInfo == nil then
				return false, "EnergyNotEnough"
			end
		end

		if energyInfo then
			self._processRecorder:recordObjectEvent(player:getId(), "SyncE", energyInfo)
		end

		unit = entityManager:createHeroUnit(unitData)
	end

	return self:_settleUnit(player, unit, cellId, animation, isUserCmd, "SpawnUnit")
end

local function extend(values, constants)
	for name, value in _G.pairs(constants) do
		_G.rawset(values, name, value)
	end
end

function FormationSystem:summon(actor, source, summonId, summonFactor, location)
	assert(type(summonId) == "string", "summonId is not string")

	local player = actor:getOwner()
	local cellId = self._battleField:findEmptyCellId(player:getSide(), location)

	if not cellId then
		return false, "InvalidSummonPosition"
	end

	local summonInfo = actor:getOwner():getSummonInfo(summonId)

	if not summonInfo then
		return false, "NoSummonInfo"
	end

	if actor:getSurfaceIndex() and actor:getSurfaceIndex() > 0 and summonInfo.extraSurFace and summonInfo.extraSurFace[actor:getSurfaceIndex()] then
		summonInfo.modelId = summonInfo.extraSurFace[actor:getSurfaceIndex()]
	end

	extend(summonFactor, summonInfo)

	local targetId = player:calcSummonIdentify(summonId)
	local entityManager = self._entityManager
	local unit = entityManager:summonHeroUnit(source, targetId, summonFactor)
	local animation = nil

	unit:setSummoner(actor)

	local result = self:_settleUnit(player, unit, cellId, animation, false, "CallUnit")

	if self._eventCenter then
		self._eventCenter:dispatchEvent("UnitSummoned", {
			unit = unit,
			actor = actor
		})
	end

	return result
end

function FormationSystem:summonEnemy(actor, source, summonId, summonFactor, location)
	assert(type(summonId) == "string", "summonId is not string")

	local battlelogic = self._battleContext:getObject("BattleLogic")
	local player = battlelogic:getRivalPlayer(actor:getOwner())
	local cellId = self._battleField:findEmptyCellId(player:getSide(), location)

	if not cellId then
		return false, "InvalidSummonPosition"
	end

	local summonInfo = actor:getOwner():getSummonInfo(summonId)

	if not summonInfo then
		return false, "NoSummonInfo"
	end

	extend(summonFactor, summonInfo)

	local targetId = player:calcSummonIdentify(summonId)
	local entityManager = self._entityManager
	local unit = entityManager:summonHeroUnit(source, targetId, summonFactor)
	local animation = nil

	unit:setSummoner(actor)

	local result = self:_settleUnit(player, unit, cellId, animation, false, "CallUnit")

	if self._eventCenter then
		self._eventCenter:dispatchEvent("UnitSummoned", {
			unit = unit,
			actor = actor
		})
	end

	return result
end

function FormationSystem:spawnAssist(actor, assistId, player, cellId)
	local assistInfo = actor:getOwner():getAssistInfo(assistId)

	if not assistInfo then
		return
	end

	local targetCellId = self._battleField:findEmptyCellId(player:getSide(), {
		cellId
	})

	if not targetCellId then
		targetCellId = makeCellId(player:getSide(), cellId)
		local unit2Kick = self._battleField:getCellById(targetCellId):getResident()

		self:_kickUnit(unit2Kick)
	end

	actor:getOwner():removeAssistInfo(assistId)

	assistInfo.id = player:calcAssistIdentify(assistId)
	local entityManager = self._entityManager
	local unit = entityManager:createHeroUnit(assistInfo)

	return self:_settleUnit(player, unit, targetCellId, animation, true, "SpawnUnit")
end

function FormationSystem:_randomElemInArray(array)
	if array == nil or #array == 0 then
		return nil
	end

	local heroArray = {}

	for i = 1, #array do
		local elem = array[i]

		if elem:getUnitType() == BattleUnitType.kHero then
			heroArray[#heroArray + 1] = elem
		end
	end

	if heroArray == nil or #heroArray == 0 then
		return nil
	end

	return heroArray[self._randomizer:random(1, #heroArray)]
end

function FormationSystem:revive(actor, hpRatio, anger, location)
	local player = actor:getOwner()
	local cellId = self._battleField:findEmptyCellId(player:getSide(), location)

	if not cellId then
		return false, "InvalidRevivePosition"
	end

	local bodies = self._cemetery:getUnitsBySide(player:getSide())
	local unit = self:_randomElemInArray(bodies)

	if not unit then
		return false, "NoValidBody"
	end

	local targetId = nil
	local prefix = unit:getId() .. "_r"
	local entityManager = self._entityManager
	local index = 0

	repeat
		targetId = prefix .. index
		index = index + 1
	until entityManager:fetchEntity(targetId) == nil

	local newUnit = entityManager:copyHeroUnit(unit, targetId, 1)

	newUnit:setModelId(unit:getModelId())

	local animation = nil
	local angerComp = newUnit:getComponent("Anger")

	angerComp:setAnger(anger)

	local healthComp = newUnit:getComponent("Health")

	healthComp:setHp(healthComp:getMaxHp() * hpRatio)

	local newUnit, detail = self:_settleUnit(player, newUnit, cellId, animation, false, "Revive")

	if unit then
		self._cemetery:untomb(unit)
	end

	return newUnit, detail
end

function FormationSystem:reviveByUnit(actor, unit, hpRatio, anger, location)
	local player = actor:getOwner()
	local cellId = self._battleField:findEmptyCellId(player:getSide(), location)

	if not cellId then
		return false, "InvalidRevivePosition"
	end

	local bodies = self._cemetery:getUnitsBySide(player:getSide())
	local unit = unit
	local targetId = nil
	local prefix = unit:getId() .. "_r"
	local entityManager = self._entityManager
	local index = 0

	repeat
		targetId = prefix .. index
		index = index + 1
	until entityManager:fetchEntity(targetId) == nil

	local newUnit = entityManager:copyHeroUnit(unit, targetId, 1)

	newUnit:setModelId(unit:getModelId())

	local animation = nil
	local angerComp = newUnit:getComponent("Anger")

	angerComp:setAnger(anger)

	local healthComp = newUnit:getComponent("Health")

	healthComp:setHp(healthComp:getMaxHp() * hpRatio)

	local newUnit, detail = self:_settleUnit(player, newUnit, cellId, animation, false, "Revive")

	if unit then
		self._cemetery:untomb(unit)
	end

	return newUnit, detail
end

function FormationSystem:reviveRandom(actor, hpRatio, anger, location)
	local player = actor:getOwner()
	local cellId = self._battleField:findEmptyCellId(player:getSide(), location)

	if not cellId then
		return false, "InvalidRevivePosition"
	end

	local bodies1 = self._cemetery:getUnitsBySide(player:getSide())
	local bodies2 = self._cemetery:getUnitsBySide(opposeBattleSide(player:getSide()))
	local bodies = {}

	for k, v in ipairs(bodies1) do
		bodies[k] = v
	end

	for k, v in ipairs(bodies2) do
		bodies[#bodies + 1] = v
	end

	local unit = self:_randomElemInArray(bodies)

	if not unit then
		return false, "NoValidBody"
	end

	local targetId = nil
	local prefix = (player:getSide() == kBattleSideA and "f_" or "e_") .. unit:getId() .. "_r"
	local entityManager = self._entityManager
	local index = 0

	repeat
		targetId = prefix .. index
		index = index + 1
	until entityManager:fetchEntity(targetId) == nil

	local newUnit = entityManager:copyHeroUnit(unit, targetId, 1)

	newUnit:setModelId(unit:getModelId())

	local animation = nil
	local angerComp = newUnit:getComponent("Anger")

	angerComp:setAnger(anger)

	local healthComp = newUnit:getComponent("Health")

	healthComp:setHp(healthComp:getMaxHp() * hpRatio)

	local newUnit, detail = self:_settleUnit(player, newUnit, cellId, animation, false, "Revive")

	if unit then
		self._cemetery:untomb(unit)
	end

	if self._eventCenter then
		self._eventCenter:dispatchEvent("UnitRevive", {
			unit = unit
		})
	end

	return newUnit, detail
end

function FormationSystem:rebornUnit(unit, ratio, anger, location)
	local hpRatio = ratio or 1
	local player = unit:getOwner()
	local pos = unit:getPosition()
	local id = BFCell_pos2id(1, pos.x, pos.y)
	local l_ocation = {
		id
	}
	location = location and l_ocation
	local cellId = self._battleField:findEmptyCellId(player:getSide(), l_ocation)

	if not cellId then
		return false, "InvalidRebornPosition"
	end

	local healthComp = unit:getComponent("Health")

	healthComp:setHp(healthComp:getMaxHp() * hpRatio)

	if anger then
		local AngerComp = unit:getComponent("Anger")

		AngerComp:setAnger(anger)
	end

	local battleField = self._battleField
	local unitType = unit:getUnitType()

	unit:setOwner(player)
	battleField:settleUnit(cellId, unit)

	local processRecorder = self._processRecorder

	if processRecorder ~= nil then
		local unitInfo = unit:dumpInformation()
		unitInfo.anim = nil
		unitInfo.owner = player:getId()

		processRecorder:recordObjectEvent(unitInfo.id, "RebornUnit", unitInfo)
	end

	unit:setLifeStage(ULS_Reviving)
	self._cemetery:untomb(unit)

	if self._eventCenter then
		self._eventCenter:dispatchEvent("UnitReborn", {
			unit = unit
		})
	end
end

function FormationSystem:changeUnitSettled(unit)
	if unit:isInStages(ULS_Newborn) then
		unit:setLifeStage(ULS_Normal)
		unit:getFSM():changeState(UnitSimpleState:new("Preparing", 600))

		local processRecorder = self._processRecorder

		if processRecorder ~= nil then
			processRecorder:recordObjectEvent(unit:getId(), "Settled")
		end

		if self._eventCenter then
			self._eventCenter:dispatchEvent("UnitSettled", {
				unit = unit
			})
		end

		self._TrapSystem:triggerTrap(unit)
	end
end

function FormationSystem:removeDyingUnits(dyingUnits)
	local dead = 0
	local count = dyingUnits and #dyingUnits or 0

	if count > 0 then
		for i = 1, count do
			local theDying = dyingUnits[i]

			if self:performDeathSkill(theDying) then
				dead = dead + 1
			elseif self:buryUnit(theDying) then
				dead = dead + 1
			end
		end
	end

	return dead
end

local kExcludeDying = "dying"
local kExcludeExpelled = "expelled"
local kExcludeFlee = "flee"
local kExcludeReviving = "reviving"

function FormationSystem:_excludeUnit(unit, reason, workId, force)
	local excludingUnits = self._excludingUnits
	local status = excludingUnits[unit]

	if status ~= nil then
		if force then
			excludingUnits[unit] = {
				reason = reason,
				workId = workId
			}

			return unit
		end

		return nil, status
	end

	excludingUnits[unit] = {
		reason = reason,
		workId = workId
	}
	excludingUnits[#excludingUnits + 1] = unit

	return unit
end

function FormationSystem:excludeDyingUnit(unit, workId)
	return self:_excludeUnit(unit, kExcludeDying, workId)
end

function FormationSystem:expelUnit(unit, workId, force)
	return self:_excludeUnit(unit, kExcludeExpelled, workId, force)
end

function FormationSystem:fleeUnit(unit, workId, force)
	return self:_excludeUnit(unit, kExcludeFlee, workId, force)
end

function FormationSystem:reviveUnit(unit, force)
	return self:_excludeUnit(unit, kExcludeReviving)
end

function FormationSystem:wontDieUnit(unit)
	local excludingUnits = self._excludingUnits
	local status = excludingUnits[unit]

	if status == nil or status.reason ~= kExcludeDying then
		return
	end

	excludingUnits[unit] = nil

	for i = 1, #excludingUnits do
		if excludingUnits[i] == unit then
			table.remove(excludingUnits, i)

			return
		end
	end
end

function FormationSystem:processExcludingUnits(workId)
	local excludingUnits = self._excludingUnits
	local total = #excludingUnits

	if total == 0 then
		return
	end

	local ii = 1
	local deadUnits = nil
	local cntDead = 0
	local expelledUnits = nil
	local cntExpelled = 0
	local fleeUnits = nil
	local cntFlee = 0

	for i = 1, total do
		local unit = excludingUnits[i]
		local status = excludingUnits[unit]
		excludingUnits[i] = nil

		if unit:getReferenceCount() > 0 or workId ~= nil and status.workId ~= nil and status.workId ~= workId then
			ii = ii + 1
			excludingUnits[ii] = unit

			if workId ~= nil and status.workId ~= nil and status.workId == workId then
				status.workId = nil
			end
		else
			local reason = status.reason
			excludingUnits[unit] = nil

			if reason == kExcludeDying then
				if deadUnits == nil then
					deadUnits = {}
				end

				cntDead = cntDead + 1
				deadUnits[cntDead] = unit
			elseif reason == kExcludeExpelled then
				if expelledUnits == nil then
					expelledUnits = {}
				end

				cntExpelled = cntExpelled + 1
				expelledUnits[cntExpelled] = unit
			elseif reason == kExcludeFlee then
				if fleeUnits == nil then
					fleeUnits = {}
				end

				cntFlee = cntFlee + 1
				fleeUnits[cntFlee] = unit
			elseif reason == kExcludeReviving then
				-- Nothing
			end
		end
	end

	if expelledUnits then
		self:removeExpelledUnits(expelledUnits)
	end

	if fleeUnits then
		self:removeExpelledUnits(fleeUnits, true)
	end

	if deadUnits then
		self:removeDyingUnits(deadUnits)
	end
end

function FormationSystem:removeExpelledUnits(units, fleeSta)
	if units == nil or #units == 0 then
		return nil
	end

	local groupedByPlayer = self:_groupUnitsByPlayer(units)
	local eventCenter = self._eventCenter

	if eventCenter then
		eventCenter:dispatchEvent("UnitsWillLeave", units, groupedByPlayer)
	end

	for _, unit in ipairs(units) do
		self:_kickUnit(unit)
	end

	if eventCenter then
		eventCenter:dispatchEvent("UnitsLeft", units, groupedByPlayer, fleeSta)
	end

	return groupedByPlayer
end

function FormationSystem:_groupUnitsByPlayer(units)
	local unitGroups = {}
	local groupsArray = unitGroups

	for _, unit in ipairs(units) do
		local player = unit:getOwner()
		local group = unitGroups[player]

		if group == nil then
			group = {
				player = player,
				units = {}
			}
			unitGroups[player] = group
			groupsArray[#groupsArray + 1] = group
		end

		group.units[#group.units + 1] = unit
	end

	return groupsArray
end

function FormationSystem:performDeathSkill(entity)
	entity:setLifeStage(ULS_Dying)

	local skillComp = entity:getComponent("Skill")
	local deathSkill = skillComp and skillComp:getSkill(kBattleDeathSkill)

	if deathSkill == nil then
		return false
	end

	local deathAction = BattleDeathSkillAction:new():withActor(entity)

	self._actionScheduler:addEmergentAction(deathAction)

	return true
end

function FormationSystem:buryUnit(unit)
	if not unit:isInStages(ULS_Dying, ULS_Dead) then
		return
	end

	local battleContext = self._battleContext

	unit:setLifeStage(ULS_Dead)

	local eventCenter = self._eventCenter

	if eventCenter then
		eventCenter:dispatchEvent("UnitWillDie", unit, unit:getOwner())
	end

	unit:getFSM():changeState(nil)

	if self._battleField:eraseUnit(unit) then
		if not unit._isSummoned and unit:canRevive() then
			self._cemetery:bury(unit)
		end

		if self._processRecorder then
			self._processRecorder:recordObjectEvent(unit:getId(), "Die")
		end

		if eventCenter then
			eventCenter:dispatchEvent("UnitDied", unit, unit:getOwner())
		end

		return true
	end

	return nil
end

function FormationSystem:_kickUnit(unit)
	unit:setLifeStage(ULS_Kicked)

	if self._battleField:eraseUnit(unit) and self._processRecorder then
		self._processRecorder:recordObjectEvent(unit:getId(), "Kick")
	end
end

function FormationSystem:transform(unit, hpRatio)
	local transformData = unit:getTransformData()

	if not transformData then
		return
	end

	local player = unit:getOwner()
	local eventCenter = self._eventCenter

	if eventCenter then
		eventCenter:dispatchEvent("UnitWillTransform", unit, player)
	end

	unit:setLifeStage(ULS_Normal)
	unit:transformWithData(transformData)

	local healthComp = unit:getComponent("Health")

	healthComp:setHp(healthComp:getHp() * hpRatio)
	unit:getFSM():changeState(UnitSimpleState:new("Preparing", 600))

	if self._processRecorder ~= nil then
		local unitInfo = unit:dumpInformation()
		unitInfo.anim = animation
		unitInfo.owner = player:getId()

		self._processRecorder:recordObjectEvent(unit:getId(), "Transform", unitInfo)
	end

	if eventCenter then
		eventCenter:dispatchEvent("UnitTransformed", unit, player)
	end
end

function FormationSystem:transportExt(unit, cellNo, duration, timeScale)
	local cellId = makeCellId(unit:getOwner():getSide(), cellNo)
	local battleField = self._battleField
	local posComp = unit:getComponent("Position")
	local oldCellId = posComp and posComp:getCell() and posComp:getCell():getId()
	local targetUnit = nil
	local orgCellId = unit:getCell():getId()

	if not battleField:isEmptyCell(cellId) then
		local targetCell = battleField:getCellById(cellId)
		targetUnit = targetCell:getResident()
	end

	battleField:exchangeUnits(oldCellId, cellId)

	local processRecorder = self._processRecorder

	if processRecorder ~= nil then
		processRecorder:recordObjectEvent(unit:getId(), "TransportExt", {
			cell = cellId,
			duration = duration,
			timeScale = timeScale
		})

		if targetUnit then
			processRecorder:recordObjectEvent(targetUnit:getId(), "TransportExt", {
				ignoreSwitch = true,
				cell = orgCellId,
				duration = duration,
				timeScale = timeScale
			})
		end
	end

	if self._eventCenter then
		self._eventCenter:dispatchEvent("UnitTransported", {
			player = player,
			unit = unit,
			cellId = cellId,
			oldCellId = oldCellId
		})
	end

	return oldCellId
end

function FormationSystem:transport(unit, cellNo)
	local cellId = makeCellId(unit:getOwner():getSide(), cellNo)
	local battleField = self._battleField

	if not battleField:isEmptyCell(cellId) then
		return false, "InvalidTargetPosition"
	end

	local posComp = unit:getComponent("Position")
	local oldCellId = posComp and posComp:getCell() and posComp:getCell():getId()

	battleField:exchangeUnits(oldCellId, cellId)

	local processRecorder = self._processRecorder

	if processRecorder ~= nil then
		processRecorder:recordObjectEvent(unit:getId(), "Transport", {
			cell = cellId
		})
	end

	if self._eventCenter then
		self._eventCenter:dispatchEvent("UnitTransported", {
			player = player,
			unit = unit,
			cellId = cellId,
			oldCellId = oldCellId
		})
	end

	return oldCellId
end

function FormationSystem:recordDying()
	self._hasDying = true
end

function FormationSystem:checkDying()
	local dying = self._hasDying
	self._hasDying = nil

	return dying
end

function FormationSystem:forbidenRevive(unit)
	unit:forbidenRevive()
	self._cemetery:untomb(unit)
end

local function isMad(actor)
	local flagComp = actor:getComponent("Flag")

	return flagComp:hasStatus(kBEMad)
end

local function getProvoke(actor)
	local flagComp = actor:getComponent("Flag")

	if flagComp:hasStatus(kBEProvoked) then
		return actor:getProvokeTarget()
	end
end

function FormationSystem:findPrimaryTarget(actor)
	local battleField = self._battleField
	local actorCellId = actor:getComponent("Position"):getCell():getId()
	local primTrgt = nil
	local provoker = getProvoke(actor)

	if provoker then
		local cell = provoker:getComponent("Position"):getCell()

		if cell and cell:getResident() == provoker then
			primTrgt = provoker
		end
	end

	if primTrgt == nil then
		if isMad(actor) then
			primTrgt = battleField:searchPrimaryTargetRandom(actorCellId, self._battleContext)
		else
			primTrgt = battleField:searchPrimaryTarget(actorCellId)
		end
	end

	return primTrgt
end

function FormationSystem:findFoe(actor)
	local foeId = actor:getFoe()

	if not foeId then
		return
	end

	local targetSide = opposeBattleSide(actor:getSide())
	local units = self._battleField:collectUnits({}, targetSide)

	for _, unit in ipairs(units) do
		if unit:getId() == foeId then
			return unit
		end
	end

	return nil
end

function FormationSystem:updateOnRoundEnded()
	local buffSystem = self._battleContext:getObject("BuffSystem")
	local units = self._battleField:crossCollectUnits()

	for i = 1, #units do
		buffSystem:updateOnRoundEnded(units[i])
	end
end

function FormationSystem:updateOnNewSecond(elapsed)
	local buffSystem = self._battleContext:getObject("BuffSystem")
	local units = self._battleField:crossCollectUnits()

	for i = 1, #units do
		buffSystem:updateOnNewSecond(units[i], elapsed)
		self._angerSystem:applyAngerRuleOnTarget(nil, units[i], AngerRules.kPerSecond)
	end
end

function FormationSystem:update(dt, battleContext)
	local units = self._battleField:getAllUnits()

	for i = 1, #units do
		units[i]:update(dt, battleContext)
	end
end

function FormationSystem:reset()
	self._cemetery:reset()
end
