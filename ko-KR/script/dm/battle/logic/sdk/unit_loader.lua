local exports = SkillDevKit or {}
local floor = math.floor
local ceil = math.ceil
local max = math.max
local min = math.min

local function numericAttrDumper(unit, name, compCache)
	local attrComp = compCache.Numeric
	local attr = attrComp and attrComp:getAttribute(name)

	return attr and attr:value()
end

local __getFunctions__ = {
	[kAttrAttack] = numericAttrDumper,
	[kAttrAttackRate] = numericAttrDumper,
	[kAttrDefenseWeaken] = numericAttrDumper,
	[kAttrDefense] = numericAttrDumper,
	[kAttrDefenseRate] = numericAttrDumper,
	[kAttrAttackWeaken] = numericAttrDumper,
	[kAttrCritRate] = numericAttrDumper,
	[kAttrUncritRate] = numericAttrDumper,
	[kAttrCritStrength] = numericAttrDumper,
	[kAttrBlockRate] = numericAttrDumper,
	[kAttrUnblockRate] = numericAttrDumper,
	[kAttrBlockStrength] = numericAttrDumper,
	[kAttrHurtRate] = numericAttrDumper,
	[kAttrUnhurtRate] = numericAttrDumper,
	[kAttrCureRate] = numericAttrDumper,
	[kAttrBecuredRate] = numericAttrDumper,
	[kAttrReflection] = numericAttrDumper,
	[kAttrDoubleRate] = numericAttrDumper,
	[kAttrCounterRate] = numericAttrDumper,
	[kAttrSkillRate] = numericAttrDumper,
	[kAttrSpeed] = numericAttrDumper,
	[kAttrEffectRate] = numericAttrDumper,
	[kAttrUneffectRate] = numericAttrDumper,
	[kAttrEffectStrength] = numericAttrDumper,
	[kAttrRpRecvRate] = numericAttrDumper,
	[kAttrAOEDerate] = numericAttrDumper,
	[kAttrAOERate] = numericAttrDumper,
	[kAttrSingleDerate] = numericAttrDumper,
	[kAttrSingleRate] = numericAttrDumper,
	[kAttrHotFactor] = numericAttrDumper,
	[kAttrUnyieldFactor] = numericAttrDumper,
	[kAttrFatalThreshold] = numericAttrDumper,
	[kAttrFatalFactor] = numericAttrDumper,
	[kAttrSlayThreshold] = numericAttrDumper,
	[kAttrSlayFactor] = numericAttrDumper,
	[kAttrDazeProb] = numericAttrDumper,
	[kAttrDazeRound] = numericAttrDumper,
	[kAttrDelRpProb] = numericAttrDumper,
	[KAttrDelRp] = numericAttrDumper,
	[kAttrCtrlExDmg] = numericAttrDumper,
	[kAttrExtraSkillRate] = numericAttrDumper,
	[kAttrSpecialNum1] = numericAttrDumper,
	[kAttrSpecialNum2] = numericAttrDumper,
	[kAttrSpecialNum3] = numericAttrDumper,
	level = function (unit, name, compCache)
		return unit:getLevel()
	end,
	quality = function (unit, name, compCache)
		return unit:getQuality()
	end,
	star = function (unit, name, compCache)
		return unit:getStar()
	end,
	hp = function (unit, name, compCache)
		local hpComp = compCache.Health

		return hpComp and hpComp:getHp()
	end,
	maxHp = function (unit, name, compCache)
		local hpComp = compCache.Health

		return hpComp and hpComp:getMaxHp()
	end,
	hpRatio = function (unit, name, compCache)
		local hpComp = compCache.Health

		return hpComp and hpComp:getHpRatio()
	end,
	rp = function (unit, name, compCache)
		local angerComp = compCache.Anger

		return angerComp and angerComp:getAnger()
	end,
	cost = function (unit, name, compCache)
		return unit:getCost()
	end,
	genre = function (unit, name, compCache)
		return unit:getGenre()
	end,
	suppress = function (unit, name, compCache)
		return unit:getSuppress()
	end,
	shield = function (unit, name, compCache)
		local hpComp = compCache.Health

		return hpComp and hpComp:getShield()
	end
}
local __predefinedPropertySet__ = {
	ALL = {
		kAttrAttack,
		kAttrAttackRate,
		kAttrDefenseWeaken,
		kAttrDefense,
		kAttrDefenseRate,
		kAttrAttackWeaken,
		kAttrCritRate,
		kAttrUncritRate,
		kAttrCritStrength,
		kAttrBlockRate,
		kAttrUnblockRate,
		kAttrBlockStrength,
		kAttrHurtRate,
		kAttrUnhurtRate,
		kAttrCureRate,
		kAttrBecuredRate,
		kAttrReflection,
		kAttrDoubleRate,
		kAttrCounterRate,
		kAttrSkillRate,
		kAttrSpeed,
		kAttrEffectRate,
		kAttrUneffectRate,
		kAttrEffectStrength,
		kAttrRpRecvRate,
		kAttrAOEDerate,
		kAttrAOERate,
		kAttrSingleDerate,
		kAttrSingleRate,
		kAttrHotFactor,
		kAttrUnyieldFactor,
		kAttrFatalThreshold,
		kAttrFatalFactor,
		kAttrSlayThreshold,
		kAttrSlayFactor,
		kAttrDazeProb,
		kAttrDazeRound,
		kAttrDelRpProb,
		KAttrDelRp,
		kAttrCtrlExDmg,
		"level",
		"quality",
		"star",
		"hp",
		"maxHp",
		"hpRatio",
		"rp",
		"genre",
		"suppress",
		"shield"
	},
	ATTACKER = {
		kAttrAttack,
		kAttrAttackRate,
		kAttrDefenseWeaken,
		kAttrHurtRate,
		kAttrCritRate,
		kAttrCritStrength,
		kAttrUnblockRate,
		kAttrHotFactor,
		kAttrUnyieldFactor,
		kAttrFatalThreshold,
		kAttrFatalFactor,
		kAttrSlayThreshold,
		kAttrSlayFactor,
		kAttrEffectStrength,
		kAttrEffectRate,
		kAttrDazeProb,
		kAttrDazeRound,
		kAttrCtrlExDmg,
		kAttrAOERate,
		kAttrSingleRate,
		"hpRatio",
		"level",
		"genre",
		"suppress",
		"shield"
	},
	DEFENDER = {
		kAttrDefense,
		kAttrDefenseRate,
		kAttrAttackWeaken,
		kAttrUnhurtRate,
		kAttrUncritRate,
		kAttrBlockRate,
		kAttrBlockStrength,
		kAttrUneffectRate,
		kAttrDelRpProb,
		KAttrDelRp,
		kAttrAOEDerate,
		kAttrSingleDerate,
		"hp",
		"maxHp",
		"hpRatio",
		"level",
		"genre",
		"suppress",
		"shield"
	},
	HEALER = {
		kAttrAttack,
		kAttrAttackRate,
		kAttrCritRate,
		kAttrCritStrength,
		kAttrCureRate,
		kAttrEffectStrength
	},
	HEALEE = {
		kAttrBecuredRate
	},
	RP_ACTOR = {
		kAttrEffectStrength
	},
	RP_TARGET = {
		kAttrRpRecvRate
	},
	CTRL = {
		kAttrEffectRate,
		"level"
	},
	UNCTRL = {
		kAttrUneffectRate,
		"level"
	}
}

local function dumpUnitProperties(unit, propNames, dest)
	local hpComp = unit:getComponent("Health")
	local angerComp = unit:getComponent("Anger")
	local attrComp = unit:getComponent("Numeric")
	local specialAttrComp = unit:getComponent("SpecialNumeric")
	local compCache = {
		Health = hpComp,
		Anger = angerComp,
		Numeric = attrComp
	}
	dest.id = unit:getId()

	for _, name in ipairs(propNames) do
		local func = __getFunctions__[name]

		if func then
			dest[name] = func(unit, name, compCache)
		else
			battlelogf("Trying to dump unkown property: %s", name)
		end
	end

	if GameConfigs and GameConfigs.DumpSpecialUnitProperties then
		local specialAttr = {}

		for key, val in pairs(specialAttrComp:attributes()) do
			specialAttr[key] = specialAttrComp:getAttrValue(key)
		end

		dest.specailAttr = specialAttr
	end

	if GameConfigs and GameConfigs.DumpUnitProperties then
		local dumpInfo = {}

		for k, v in pairs(dest) do
			dumpInfo[k] = v
		end

		print("dumpUnitProperties______bgein______" .. unit:getId())

		for k, v in pairs(dumpInfo) do
			local func = __getFunctions__[k]

			if func then
				local attrComp = unit:getComponent("Numeric")

				if attrComp and attrComp:getAttribute(k) then
					local real = v
					dumpInfo[k] = attrComp:getAttribute(k):getBase() .. "|" .. real
				end
			end
		end

		dump({
			"初始值|计算后的值",
			dumpInfo
		})
		print("dumpUnitProperties______end________" .. unit:getId())
	end

	return dest
end

function exports.LoadUnit(env, unit, properties, destVar)
	if type(properties) == "string" then
		properties = __predefinedPropertySet__[properties] or {}
	end

	return dumpUnitProperties(unit, properties, destVar or {})
end

function exports._getUnitProperty(unit, propName, dest)
	return dumpUnitProperties(unit, {
		propName
	}, dest)
end

function exports.UnitPropGetter(env, propName)
	local func = __getFunctions__[propName]

	if func == nil then
		return nil
	end

	return function (env, unit)
		return func(unit, propName, unit:allComponents(), env)
	end
end

local function specialNumericAttrDumper(unit, name, compCache)
	local attrComp = compCache.SpecialNumeric
	local attr = attrComp and attrComp:getAttribute(name)

	return attr and attr:value()
end

function exports.SpecialPropGetter(env, propName)
	return function (env, unit)
		return specialNumericAttrDumper(unit, propName, unit:allComponents())
	end
end

local function numericAttrBasicDumper(unit, name, compCache)
	local attrComp = compCache.Numeric
	local attr = attrComp and attrComp:getAttribute(name)

	return attr and attr:getBase()
end

function exports.UnitPropBaseGetter(env, propName)
	return function (env, unit)
		return numericAttrBasicDumper(unit, propName, unit:allComponents())
	end
end

function exports.GetSide(env, unit)
	return unit:getSide()
end

function exports.GetUnitCid(env, unit)
	return unit:getCid()
end

function exports.GetUnitUid(env, unit)
	return unit:getUid()
end

function exports.GetCost(env, unit)
	local enemyCost = unit:getEnemyCost() == 0 and unit:getCost() or unit:getEnemyCost()

	return unit:getHeroCost() == -1 and enemyCost or unit:getHeroCost()
end

function exports.GetSummoner(env, unit)
	return unit:getSummoner()
end
