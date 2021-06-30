local exports = SkillDevKit or {}
local abs = math.abs
local min = math.min
local max = math.max
local FilterMeta = {}

local function MakeFilter(func)
	return setmetatable({
		__func = func
	}, FilterMeta)
end

_G.MakeFilter = MakeFilter

function FilterMeta.__mul(f1, f2)
	local func1 = f1.__func
	local func2 = f2.__func

	return MakeFilter(function (...)
		return func1(...) and func2(...)
	end)
end

function FilterMeta.__add(f1, f2)
	local func1 = f1.__func
	local func2 = f2.__func

	return MakeFilter(function (...)
		return func1(...) or func2(...)
	end)
end

function FilterMeta.__sub(f1, f2)
	local func1 = f1.__func
	local func2 = f2.__func

	return MakeFilter(function (...)
		return func1(...) and not func2(...)
	end)
end

function FilterMeta.__unm(f)
	local func = f.__func

	return MakeFilter(function (...)
		return not func(...)
	end)
end

function FilterMeta.__call(t, ...)
	return t.__func(...)
end

function exports.ONESELF(env, who)
	return MakeFilter(function (_, unit)
		return unit == who
	end)
end

function exports.TEAMMATES_OF(env, who)
	local side = who:getSide()

	return MakeFilter(function (_, unit)
		return unit:getSide() == side
	end)
end

function exports.ROW_OF(env, who)
	local rpos = who:getPosition()

	return MakeFilter(function (_, unit)
		local pos = unit:getPosition()

		return pos.x == rpos.x and pos.zone == rpos.zone
	end)
end

function exports.COL_OF(env, who)
	local rpos = who:getPosition()

	return MakeFilter(function (_, unit)
		local pos = unit:getPosition()

		return pos.y == rpos.y and pos.zone == rpos.zone
	end)
end

function exports.CROSS_OF(env, who)
	local rpos = who:getPosition()
	local x = rpos.x
	local y = rpos.y
	local zone = rpos.zone

	return MakeFilter(function (_, unit)
		local pos = unit:getPosition()

		return pos.zone == zone and (pos.x == x or pos.y == y)
	end)
end

function exports.NEIGHBORS_OF(env, who)
	local rpos = who:getPosition()
	local x = rpos.x
	local y = rpos.y
	local zone = rpos.zone

	return MakeFilter(function (_, unit)
		local pos = unit:getPosition()

		return pos.zone == zone and abs(pos.x - x) + abs(pos.y - y) == 1
	end)
end

function exports.FRONT_OF(env, who, excluded)
	local rpos = who:getPosition()
	local rzone = rpos.zone
	local rx = rpos.x
	local boundary = excluded and rx - 1 or rx

	return MakeFilter(function (_, unit)
		local pos = unit:getPosition()

		return pos.x <= boundary and pos.zone == rzone
	end)
end

function exports.BACK_OF(env, who, excluded)
	local rpos = who:getPosition()
	local rzone = rpos.zone
	local rx = rpos.x
	local boundary = excluded and rx + 1 or rx

	return MakeFilter(function (_, unit)
		local pos = unit:getPosition()

		return boundary <= pos.x and pos.zone == rzone
	end)
end

function exports.ABOVE(env, who, excluded)
	local rpos = who:getPosition()
	local rzone = rpos.zone
	local ry = rpos.y
	local boundary = excluded and ry - 1 or ry

	return MakeFilter(function (_, unit)
		local pos = unit:getPosition()

		return pos.y <= boundary and pos.zone == rzone
	end)
end

function exports.BELOW(env, who, excluded)
	local rpos = who:getPosition()
	local rzone = rpos.zone
	local ry = rpos.y
	local boundary = excluded and ry + 1 or ry

	return MakeFilter(function (_, unit)
		local pos = unit:getPosition()

		return boundary <= pos.y and pos.zone == rzone
	end)
end

function exports.HAS_SUMMONER(env, who)
	if who then
		return MakeFilter(function (_, unit)
			return unit:getSummoner() == who
		end)
	else
		return MakeFilter(function (_, unit)
			return unit:getSummoner() ~= nil
		end)
	end
end

exports.OBLIQUE_CROSS = MakeFilter(function (_, unit)
	local pos = unit:getPosition()

	return abs(pos.x - 2) == 1 and abs(pos.y - 2) == 1 or pos.x == 2 and pos.y == 2
end)
exports.MID_CROSS = MakeFilter(function (_, unit)
	local pos = unit:getPosition()

	return pos.x == 2 or pos.y == 2
end)
exports.TOP_COL = MakeFilter(function (_, unit)
	local pos = unit:getPosition()

	return pos.y == 1
end)
exports.MID_COL = MakeFilter(function (_, unit)
	local pos = unit:getPosition()

	return pos.y == 2
end)
exports.BOTTOM_COL = MakeFilter(function (_, unit)
	local pos = unit:getPosition()

	return pos.y == 3
end)
exports.FRONT_ROW = MakeFilter(function (_, unit)
	local pos = unit:getPosition()
	local x = pos.x

	return x == 1 or x == -1
end)
exports.MID_ROW = MakeFilter(function (_, unit)
	local pos = unit:getPosition()
	local x = pos.x

	return x == 2 or x == -2
end)
exports.BACK_ROW = MakeFilter(function (_, unit)
	local pos = unit:getPosition()
	local x = pos.x

	return x == 3 or x == -3
end)

function exports.MARKED(env, flag)
	return MakeFilter(function (_, unit)
		return unit:hasFlag(flag)
	end)
end

exports.PETS = MakeFilter(function (_, unit)
	return unit:getFlagCheckers()["$HERO"](unit)
end)
exports.MASTER = MakeFilter(function (_, unit)
	return unit:getFlagCheckers()["$MASTER"](unit)
end)
exports.SUMMONS = MakeFilter(function (_, unit)
	return unit:getFlagCheckers()["$SUMMONED"](unit)
end)

local function filterArrayElements(env, array, filter, total)
	local result = {}
	local count = 0

	if total == nil then
		total = #array
	end

	for i = 1, total do
		local element = array[i]

		if element and filter(env, element) then
			count = count + 1
			result[count] = element
		end
	end

	return result, count
end

_G.filterArrayElements = filterArrayElements

function exports.AllUnits(env, filter)
	local actorSide = env["$actor"]:getSide()
	local units = env.global["$BattleField"]:crossCollectUnits({}, actorSide)

	if filter == nil then
		return units
	end

	return filterArrayElements(env, units, filter)
end

function exports.FriendUnits(env, filter)
	local targetSide = env["$actor"]:getSide()
	local units = env.global["$BattleField"]:collectUnits({}, targetSide)

	if filter == nil then
		return units
	end

	return filterArrayElements(env, units, filter)
end

function exports.FriendEntities(env, filter)
	local targetSide = env["$actor"]:getSide()
	local units = env.global["$BattleField"]:collectAllUnits({}, targetSide)

	if filter == nil then
		return units
	end

	return filterArrayElements(env, units, filter)
end

function exports.EnemyUnits(env, filter)
	local targetSide = opposeBattleSide(env["$actor"]:getSide())
	local units = env.global["$BattleField"]:collectUnits({}, targetSide)

	if filter == nil then
		return units
	end

	return filterArrayElements(env, units, filter)
end

function exports.EnemyMaster(env)
	local targetSide = opposeBattleSide(env["$actor"]:getSide())
	local units = env.global["$BattleField"]:collectUnits({}, targetSide)

	for _, unit in ipairs(units) do
		if unit:getFlagCheckers()["$MASTER"](unit) then
			return unit
		end
	end

	return nil
end

function exports.FriendMaster(env)
	local targetSide = env["$actor"]:getSide()
	local units = env.global["$BattleField"]:collectUnits({}, targetSide)

	for _, unit in ipairs(units) do
		if unit:getFlagCheckers()["$MASTER"](unit) then
			return unit
		end
	end

	return nil
end

function exports.FriendField(env)
	local targetSide = env["$actor"]:getSide()
	local units = env.global["$BattleField"]:collectFieldUnits({}, targetSide)

	for _, unit in ipairs(units) do
		if unit:getFlagCheckers()["$FIELD"](unit) then
			return unit
		end
	end

	return nil
end

function exports.EnemyField(env)
	local targetSide = opposeBattleSide(env["$actor"]:getSide())
	local units = env.global["$BattleField"]:collectFieldUnits({}, targetSide)

	for _, unit in ipairs(units) do
		if unit:getFlagCheckers()["$FIELD"](unit) then
			return unit
		end
	end

	return nil
end

function exports.Killer(env)
	local foeId = env["$actor"]:getFoe()

	if not foeId then
		return
	end

	local targetSide = opposeBattleSide(env["$actor"]:getSide())
	local units = env.global["$BattleField"]:collectUnits({}, targetSide)

	for _, unit in ipairs(units) do
		if unit:getId() == foeId then
			return unit
		end
	end

	return nil
end

function exports.Slice(env, array, start, ended)
	local sliced = {}

	if start == nil then
		start = 1
	end

	local total = #array

	if ended == nil or total < ended then
		ended = #array
	elseif ended < 0 then
		ended = total + ended + 1
	end

	for i = start, ended do
		sliced[#sliced + 1] = array[i]
	end

	return sliced
end

function exports.SortBy(env, array, compare, keyGetter)
	local compFunc = nil

	if keyGetter == nil then
		if compare == "<" then
			function compFunc(a, b)
				return a < b
			end
		elseif compare == ">" then
			function compFunc(a, b)
				return b < a
			end
		else
			compFunc = compare
		end
	else
		local keys = {}

		for i = 1, #array do
			local elem = array[i]
			keys[elem] = keyGetter(env, elem)
		end

		if compare == "<" then
			function compFunc(a, b)
				return keys[a] < keys[b]
			end
		elseif compare == ">" then
			function compFunc(a, b)
				return keys[b] < keys[a]
			end
		else
			function compFunc(a, b)
				return compare(keys[a], keys[b])
			end
		end
	end

	table.sort(array, compFunc)

	return array
end

function exports.BestN(env, n, propName, array)
	local newArray = {}

	for _, unit in ipairs(array) do
		newArray[#newArray + 1] = exports._getUnitProperty(unit, propName, {
			unit = unit
		})
	end

	table.sort(newArray, function (a, b)
		return b[propName] < a[propName]
	end)

	local result = {}

	for i = 1, n do
		result[i] = newArray[i] and newArray[i].unit
	end

	return result
end

function exports.WorstN(env, n, propName, array)
	local newArray = {}

	for _, unit in ipairs(array) do
		newArray[#newArray + 1] = exports._getUnitProperty(unit, propName, {
			unit = unit
		})
	end

	table.sort(newArray, function (a, b)
		return a[propName] < b[propName]
	end)

	local result = {}

	for i = 1, n do
		result[i] = newArray[i] and newArray[i].unit
	end

	return result
end

function exports.RandomN(env, n, array)
	local targets = {}
	local cnt = 0

	for i, target in ipairs(array) do
		cnt = cnt + 1
		targets[cnt] = target
	end

	local random = env.global.random

	if cnt < n then
		n = cnt
	end

	for i = 1, n do
		local x = random(i, cnt)

		if i ~= x then
			targets[x] = targets[i]
			targets[i] = targets[x]
		end
	end

	targets[n + 1] = nil

	return targets
end

function exports.FriendDiedUnits(env, filter)
	local targetSide = env["$actor"]:getSide()
	local units = env.global["$FormationSystem"]:getCemetery():getUnitsBySide(targetSide)

	if filter == nil then
		return units
	end

	return filterArrayElements(env, units, filter)
end

function exports.EnemyDiedUnits(env, filter)
	local targetSide = opposeBattleSide(env["$actor"]:getSide())
	local units = env.global["$FormationSystem"]:getCemetery():getUnitsBySide(targetSide)

	if filter == nil then
		return units
	end

	return filterArrayElements(env, units, filter)
end

function exports.AllDiedUnits(env, filter)
	local targetSide = env["$actor"]:getSide()
	local units_f = env.global["$FormationSystem"]:getCemetery():getUnitsBySide(targetSide)
	local targetSide = opposeBattleSide(env["$actor"]:getSide())
	local units_e = env.global["$FormationSystem"]:getCemetery():getUnitsBySide(targetSide)
	local units = {}

	for k, v in pairs(units_f) do
		units[#units + 1] = v
	end

	for k, v in pairs(units_e) do
		units[#units + 1] = v
	end

	if filter == nil then
		return units
	end

	return filterArrayElements(env, units, filter)
end
