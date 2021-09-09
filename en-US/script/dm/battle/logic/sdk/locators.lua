local exports = SkillDevKit or {}
local PositionMeta = {}

local function Position(comps)
	return setmetatable(comps, PositionMeta)
end

function PositionMeta.__add(a, b)
	local zone = a[1]
	local x = a[2]
	local y = a[3]

	if type(b) == "table" then
		x = x + (b[1] or b.x or 0)
		y = y + (b[2] or b.y or 0)
	else
		x = x + b
		y = y + b
	end

	return Position({
		zone,
		x,
		y
	})
end

function PositionMeta.__sub(a, b)
	local zone = a[1]
	local x = a[2]
	local y = a[3]

	if type(b) == "table" then
		x = x - (b[1] or b.x or 0)
		y = y - (b[2] or b.y or 0)
	else
		x = x - b
		y = y - b
	end

	return Position({
		zone,
		x,
		y
	})
end

function PositionMeta.__mul(a, b)
	local zone = a[1]
	local x = a[2]
	local y = a[3]

	if type(b) == "table" then
		x = x * (b[1] or b.x or 1)
		y = y * (b[2] or b.y or 1)
	else
		x = x * b
		y = y * b
	end

	return Position({
		zone,
		x,
		y
	})
end

function PositionMeta.__tostring(p)
	return "{" .. p[1] .. "," .. p[2] .. "," .. p[3] .. "}"
end

function exports.FixedPos(env, zone, x, y)
	return Position({
		zone,
		x,
		y
	})
end

function exports.UnitPos(env, unit, x, y)
	local pos = unit:getPosition()

	return Position({
		pos.zone,
		x or pos.x,
		y or pos.y
	})
end

function exports.CellPos(env, cell, x, y)
	local pos = cell:getPosition()

	return Position({
		pos.zone,
		x or pos.x,
		y or pos.y
	})
end

function exports.FindEmptyCell(env, side, arr)
	return env.global["$BattleField"]:findEmptyCellId(side, arr)
end

function exports.UnitPosId(env, unit, x, y)
	local pos = unit:getPosition()

	return BFCell_pos2id(pos.zone, x or pos.x, y or pos.y)
end
