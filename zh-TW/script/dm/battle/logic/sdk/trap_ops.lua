local exports = SkillDevKit or {}
local floor = math.floor
local ceil = math.ceil
local MakeFilter = _G.MakeFilter
local makeBuffMatchFunction = _G.makeBuffMatchFunction

local function filterElements(array, filter, total)
	local result = {}
	local count = 0

	if total == nil then
		total = #array
	end

	for i = 1, total do
		local element = array[i]

		if element and filter(element) then
			count = count + 1
			result[count] = element
		end
	end

	return result, count
end

_G.filterElements = filterElements

function exports.EMPTY_CELL(env)
	return MakeFilter(function (cell)
		return cell:getResident() == nil
	end)
end

function exports.CELL_HAS_UNIT(env, unit)
	return MakeFilter(function (cell)
		return cell:getResident() == unit
	end)
end

function exports.CELL_IN_POS(env, pos1, ...)
	local poses = {
		pos1,
		...
	}
	local cnt = #poses

	return MakeFilter(function (cell)
		for i = 1, cnt do
			if math.abs(cell:getId()) == poses[i] then
				return true
			end
		end

		return false
	end)
end

function exports.AllCells(env, filter)
	local battleField = env.global["$BattleField"]
	local cells = battleField:collectCells({}, 1)
	cells = battleField:collectCells(cells, -1)

	if filter == nil then
		return cells
	end

	return filterElements(cells, filter)
end

function exports.FriendCells(env, filter)
	local targetSide = env["$actor"]:getSide()
	local cells = env.global["$BattleField"]:collectCells({}, targetSide)

	if filter == nil then
		return cells
	end

	return filterElements(cells, filter)
end

function exports.EnemyCells(env, filter)
	local targetSide = opposeBattleSide(env["$actor"]:getSide())
	local cells = env.global["$BattleField"]:collectCells({}, targetSide)

	if filter == nil then
		return cells
	end

	return filterElements(cells, filter)
end

function exports.GetCell(env, unit)
	return unit:getCell()
end

function exports.LockCellTrap(env)
	return LockCellTrap:new()
end

function exports.ApplyTrap(env, cell, config, traps)
	local trapSystem = env.global["$TrapSystem"]

	if trapSystem == nil then
		return nil
	end

	local trapConfig = {
		duration = config.duration,
		display = config.display,
		tags = config.tags
	}
	local trapObject = TrapObject:new(trapConfig, traps)

	trapObject:setSource(env["$actor"])

	return trapSystem:applyTrapsOnCell(cell, trapObject, env["$id"])
end

function exports.BuffTrap(env, config, buffEffects)
	return BuffTrap:new(config, buffEffects, env["$actor"])
end

function exports.HPDamageTrap(env, value, lowerlimit)
	local config = {
		value = value,
		onTrigger = function (battleContext, cell, unit, buffValue)
			if not unit:isInStages(ULS_Normal) then
				return
			end

			local healthSystem = battleContext:getObject("HealthSystem")
			local formationSystem = env.global["$FormationSystem"]
			local result = healthSystem:performHealthDamage(nil, unit, buffValue, lowerlimit)

			if result and result.deadly then
				unit:setFoe(source:getId())
				formationSystem:excludeDyingUnit(unit)
			end

			return result
		end
	}

	return TrapEffect:new(config)
end

function exports.HPRecoverTrap(env, value)
	local config = {
		value = value
	}

	function config.onTrigger(battleContext, cell, unit, buffValue)
		if not unit:isInStages(ULS_Normal) then
			return
		end

		local healthSystem = battleContext:getObject("HealthSystem")
		local unitFlagComp = unit:getComponent("Flag")

		if unitFlagComp:hasStatus(kBECurse) then
			local result = healthSystem:performHealthDamage(nil, unit, buffValue, 1)

			return result
		else
			local result = healthSystem:performHealthRecovery(nil, unit, buffValue)

			return result
		end
	end

	return TrapEffect:new(config)
end

function exports.AngerDamageTrap(env, value)
	local config = {
		value = value
	}

	function config.onTrigger(battleContext, cell, unit, buffValue)
		if not unit:isInStages(ULS_Normal) then
			return
		end

		local angerSystem = battleContext:getObject("AngerSystem")

		return angerSystem:performAngerDamage(nil, unit, value, workId)
	end

	return TrapEffect:new(config)
end

function exports.AngerRecoverTrap(env, value)
	local config = {
		value = value
	}

	function config.onTrigger(battleContext, cell, unit, buffValue)
		if not unit:isInStages(ULS_Normal) then
			return
		end

		local angerSystem = battleContext:getObject("AngerSystem")

		return angerSystem:performAngerRecovery(nil, unit, value, workId)
	end

	return TrapEffect:new(config)
end

function exports.DispelBuffTrap(env, tagOrFilter)
	local config = {
		value = tagOrFilter,
		onTrigger = function (battleContext, cell, unit, buffValue)
			local buffSystem = battleContext:getObject("BuffSystem")

			if not buffSystem then
				return nil
			end

			local matchFunc = makeBuffMatchFunction(buffValue)

			return buffSystem:dispelBuffsOnTarget(unit, matchFunc)
		end
	}

	return TrapEffect:new(config)
end
