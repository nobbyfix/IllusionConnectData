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

function exports.CELL_HAS_UNIT(env, unit)
	return MakeFilter(function (cell)
		return cell:getResident() == unit
	end)
end

function exports.ROW_CELL_OF(env, who)
	if not who then
		return nil
	end

	local pos = who:getPosition()

	return MakeFilter(function (cell)
		return cell:getPosition().x == pos.x
	end)
end

function exports.COL_CELL_OF(env, who)
	if not who then
		return nil
	end

	local pos = who:getPosition()

	return MakeFilter(function (cell)
		return cell:getPosition().y == pos.y
	end)
end

exports.FRONT_ROW_CELL = MakeFilter(function (cell)
	return cell:getPosition().x == 1
end)
exports.MID_ROW_CELL = MakeFilter(function (cell)
	return cell:getPosition().x == 2
end)
exports.BACK_ROW_CELL = MakeFilter(function (cell)
	return cell:getPosition().x == 3
end)
exports.TOP_COL_CELL = MakeFilter(function (cell)
	return cell:getPosition().y == 1
end)
exports.MID_COL_CELLL = MakeFilter(function (cell)
	return cell:getPosition().y == 2
end)
exports.BOTTOM_COL_CELL = MakeFilter(function (cell)
	return cell:getPosition().y == 3
end)

function exports.NEIGHBORS_CELL_OF(env, who)
	if not who then
		return nil
	end

	local pos = who:getPosition()

	return MakeFilter(function (cell)
		local sqt_x = math.pow(pos.x - cell:getPosition().x, 2)
		local sqt_y = math.pow(pos.y - cell:getPosition().y, 2)

		return sqt_x + sqt_y <= 1
	end)
end

function exports.ONESELF_CELL(env, who)
	return MakeFilter(function (cell)
		return who == cell
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

function exports.GetCellId(env, unit)
	if not unit then
		return nil
	end

	return unit:getCell():getId()
end

function exports.IdOfCell(env, cell)
	if not cell then
		return nil
	end

	return cell:getId()
end

function exports.GetCellUnit(env, cell)
	if not cell then
		return nil
	end

	return cell:getResident()
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
