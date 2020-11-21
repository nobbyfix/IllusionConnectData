local exports = SkillDevKit or {}
local floor = math.floor
local ceil = math.ceil
local max = math.max
local min = math.min

local function genValueMaker(name, copyfunc)
	local __meta__ = {}

	function __meta__.__add(x, a)
		if type(x) == "number" then
			a = x
			x = a
		end

		local result = copyfunc(x)
		result.val = result.val + a

		return result
	end

	function __meta__.__sub(x, a)
		local result = copyfunc(x)
		result.val = result.val - a

		return result
	end

	function __meta__.__mul(x, a)
		if type(x) == "number" then
			a = x
			x = a
		end

		local result = copyfunc(x)
		result.val = result.val * a

		return result
	end

	function __meta__.__div(x, a)
		local result = copyfunc(x)
		result.val = result.val / a

		return result
	end

	function __meta__.__tostring(x)
		return string.format("%s(%s)", x.val, name)
	end

	return function (t)
		return setmetatable(t, __meta__)
	end
end

local mkdmg = genValueMaker("dmg", function (src)
	return setmetatable({
		val = src.val,
		crit = src.crit,
		block = src.block
	}, getmetatable(src))
end)
local mkrcv = genValueMaker("rcv", function (src)
	return setmetatable({
		val = src.val,
		crit = src.crit
	}, getmetatable(src))
end)
local __DmgFlooredCoeff__ = {
	0,
	10
}

function exports.EvalBaseDamage(env, actor, target, factors)
	local battleConfig = env.global.config
	local atkpart = actor.atk * actor.atkrate * (1 - target.atkweaken)
	local defpart = target.def * target.defrate * (1 - actor.defweaken)
	local dmgFlooredCoeff = battleConfig.dmgFlooredCoeff or __DmgFlooredCoeff__
	local mindamage = actor.atk * dmgFlooredCoeff[1] + dmgFlooredCoeff[2]
	local relCoeff = 1

	if actor.suppress and target.genre and actor.suppress[target.genre] then
		relCoeff = actor.suppress[target.genre]
	end

	local hurtMultiple = max(1 + actor.hurtrate - target.unhurtrate, 0.1) * factors[2] * relCoeff
	local basedamage = max(atkpart * factors[1] - defpart, mindamage) * hurtMultiple + factors[3]

	return basedamage
end

function exports.ReviseDamage(env, actor, target, basedamage)
	local value = basedamage
	local iscrit, isblock = nil

	if env.global.random() < actor.critrate - target.uncritrate then
		iscrit = true
		value = value * max(1.5 + actor.critstrg, 0.5)
	elseif env.global.random() < target.blockrate - actor.unblockrate then
		isblock = true
		value = value * max(0.7 - target.blockstrg, 0.1)
	end

	if actor.hotfactor > 0 then
		value = value * (1 + (0.1 + actor.hpRatio) * actor.hotfactor)
	end

	if actor.unyieldfactor > 0 then
		value = value * (1 + (1.1 - actor.hpRatio) * actor.unyieldfactor)
	end

	if actor.fatalfactor > 0 and actor.fatalthreshold >= 1 - target.hpRatio then
		value = value * (1 + actor.fatalfactor)
	end

	if actor.slayfactor > 0 and target.hpRatio <= actor.slaythreshold then
		value = value * (1 + actor.slayfactor)
	end

	return mkdmg({
		val = max(value, 1),
		crit = iscrit,
		block = isblock
	})
end

local EvalBaseDamage = exports.EvalBaseDamage
local ReviseDamage = exports.ReviseDamage

function exports.EvalDamage(env, actor, target, factors)
	local basedamage = EvalBaseDamage(env, actor, target, factors)

	return ReviseDamage(env, actor, target, basedamage)
end

local EvalDamage = exports.EvalDamage

function exports.EvalAOEDamage(env, actor, target, factors)
	local damage = EvalDamage(env, actor, target, factors)

	return mkdmg({
		val = damage.val * (1 + actor.aoerate - target.aoederate),
		crit = damage.crit,
		block = damage.block
	})
end

function exports.EvalSingleDamage(env, actor, target, factors)
	local damage = EvalDamage(env, actor, target, factors)

	return mkdmg({
		val = damage.val * (1 + actor.singlerate - target.singlederate),
		crit = damage.crit,
		block = damage.block
	})
end

function exports.EvalRecovery(env, actor, target, factors)
	local iscrit = nil
	local value = (actor.atk * actor.atkrate * factors[1] + factors[2]) * (1 + actor.curerate + target.becuredrate)

	if env.global.random() < actor.critrate then
		iscrit = true
		value = value * max(1.5 + actor.critstrg, 0.5)
	end

	return mkrcv({
		val = max(value, 1),
		crit = iscrit
	})
end

function exports.EvalRPDamage(env, actor, target, baseval)
	local value = baseval * (1 + actor.effectstrg)

	return max(value, 1)
end

function exports.EvalRPRecovery(env, actor, target, baseval)
	local value = baseval * (1 + actor.effectstrg + target.rprecvrate)

	return max(value, 1)
end

function exports.EvalProb1(env, actor, target, base, minbase)
	local lvlDiff = max(target.level - actor.level, 0)
	local result = max(base - lvlDiff * 0.01, minbase or 0)

	return result * (1 + actor.effectrate - target.uneffectrate)
end

function exports.EvalProb2(env, actor, target, base, minbase)
	local lvlDiff = max(target.level - actor.level, 0)

	return max(base - lvlDiff * 0.01, minbase or 0)
end

function exports.ProbTest(env, prob)
	return prob ~= nil and env.global.random() < prob
end

function exports.Max(env, ...)
	return max(...)
end

function exports.Min(env, ...)
	return min(...)
end

function exports.Random(env, ...)
	return env.global.random(...)
end

local function splitNonNegInteger(value, ratios)
	local result = {}
	local remain = value
	local diff = 0
	local rtotal = 0
	local n = #ratios

	for i = 1, n do
		local r = ratios[i]
		rtotal = rtotal + r
		local x = max(min(value * r + diff, remain), 0)
		local intX = floor(x)
		diff = x - intX
		remain = remain - intX
		result[i] = intX
	end

	if remain > 0 then
		if rtotal < 0.999999 then
			n = n + 1
			result[n] = remain
		else
			result[n] = result[n] + remain
		end
	end

	return result, n
end

function exports.SplitValue(env, val, ratios)
	local valIsTable = type(val) == "table"
	local value = valIsTable and val.val or val
	local result = splitNonNegInteger(value, ratios)

	if valIsTable then
		local meta = getmetatable(val)

		for i = 1, #result do
			result[i] = setmetatable({
				val = result[i],
				crit = val.crit,
				block = val.block
			}, meta)
		end
	end

	return result
end
