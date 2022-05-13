local exports = SkillDevKit or {}
local floor = math.floor
local ceil = math.ceil
local MakeFilter = _G.MakeFilter

function exports.BUFF_MARKED(env, tag)
	return MakeFilter(function (env, buff)
		return buff:isMatched(tag)
	end)
end

function exports.BUFF_MARKED_ALL(env, tag1, ...)
	local tags = {
		tag1,
		...
	}
	local cnt = #tags

	return MakeFilter(function (env, buff)
		for i = 1, cnt do
			if not buff:isMatched(tags[i]) then
				return false
			end
		end

		return true
	end)
end

function exports.BUFF_MARKED_ANY(env, tag1, ...)
	local tags = {
		tag1,
		...
	}
	local cnt = #tags

	return MakeFilter(function (env, buff)
		for i = 1, cnt do
			if buff:isMatched(tags[i]) then
				return true
			end
		end

		return false
	end)
end

local function makeBuffMatchFunction(env, tagOrFilter)
	if tagOrFilter == nil then
		return nil
	end

	local atype = type(tagOrFilter)

	if atype == "string" then
		return function (buff)
			return buff:isMatched(tagOrFilter)
		end
	elseif atype == "table" or atype == "function" then
		return function (buff)
			return tagOrFilter(env, buff)
		end
	end
end

_G.makeBuffMatchFunction = makeBuffMatchFunction

function exports.ApplyBuff(env, target, config, buffEffects)
	local buffSystem = env.global["$BuffSystem"]

	if buffSystem == nil then
		return nil
	end

	if not target then
		return
	end

	if not target:isInStages(ULS_Normal, ULS_Newborn) then
		return
	end

	local buffConfig = {
		duration = config.duration,
		timing = config.timing,
		display = config.display,
		tags = config.tags
	}
	local buffObject = BuffObject:new(buffConfig, buffEffects)

	buffObject:setSource(env["$actor"])

	local groupConfig = nil

	if config.group ~= nil then
		groupConfig = {
			group = config.group,
			limit = config.limit
		}
	end

	return buffSystem:applyBuffOnTarget(target, buffObject, groupConfig, env["$id"])
end

function exports.DispelBuff(env, target, tagOrFilter, maxCount, ignoreTriggerEvent)
	local buffSystem = env.global["$BuffSystem"]

	if not buffSystem then
		return 0
	end

	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)

	if maxCount ~= nil then
		local buffs = buffSystem:selectBuffsOnTarget(target, matchFunc)
		local count = buffs and #buffs or 0

		if count == 0 then
			return 0
		end

		if count <= maxCount then
			for i = 1, count do
				buffs[buffs[i]] = true
			end
		else
			local random = env.global.random
			local n = maxCount

			for i = 1, count do
				if random(count - i + 1) <= n then
					n = n - 1
					buffs[buffs[i]] = true
				end
			end
		end

		function matchFunc(buff)
			return buffs[buff]
		end
	end

	return buffSystem:dispelBuffsOnTarget(target, matchFunc, env["$id"], ignoreTriggerEvent)
end

function exports.StealBuff(env, target, tagOrFilter, maxCount)
	local actor = env["$actor"]
	local buffSystem = env.global["$BuffSystem"]

	if not buffSystem then
		return 0
	end

	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)

	if maxCount ~= nil then
		local buffs = buffSystem:selectBuffsOnTarget(target, matchFunc)
		local count = buffs and #buffs or 0

		if count == 0 then
			return 0
		end

		if count <= maxCount then
			for i = 1, count do
				buffs[buffs[i]] = true
			end
		else
			local random = env.global.random
			local n = maxCount

			for i = 1, count do
				if random(count - i + 1) <= n then
					n = n - 1
					buffs[buffs[i]] = true
				end
			end
		end

		function matchFunc(buff)
			return buffs[buff]
		end
	end

	return buffSystem:stealBuffsOnTarget(actor, target, matchFunc, env["$id"])
end

function exports.CloneBuff(env, unit, target, tagOrFilter, maxCount)
	local actor = env["$actor"]
	local buffSystem = env.global["$BuffSystem"]

	if not buffSystem then
		return 0
	end

	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)

	if maxCount ~= nil then
		local buffs = buffSystem:selectBuffsOnTarget(target, matchFunc)
		local count = buffs and #buffs or 0

		if count == 0 then
			return 0
		end

		if count <= maxCount then
			for i = 1, count do
				buffs[buffs[i]] = true
			end
		else
			local random = env.global.random
			local n = maxCount

			for i = 1, count do
				if random(count - i + 1) <= n then
					n = n - 1
					buffs[buffs[i]] = true
				end
			end
		end

		function matchFunc(buff)
			return buffs[buff]
		end
	end

	return buffSystem:cloneBuffsOnTarget(unit, target, matchFunc, env["$id"])
end

function exports.SelectBuffs(env, target, tagOrFilter)
	local buffSystem = env.global["$BuffSystem"]
	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)

	return buffSystem:selectBuffsOnTarget(target, matchFunc)
end

function exports.SelectBuffCount(env, target, tagOrFilter)
	local buffSystem = env.global["$BuffSystem"]
	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)
	local buffs, count = buffSystem:selectBuffsOnTarget(target, matchFunc)

	return count
end

function exports.ResetBuffsLifespan(env, target, tagOrFilter)
	local buffSystem = env.global["$BuffSystem"]
	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)
	local buffs = buffSystem:selectBuffsOnTarget(target, matchFunc)
	local count = 0

	if buffs ~= nil then
		for i = 1, #buffs do
			local buffObject = buffs[i]

			if buffObject:resetLifespan() then
				count = count + 1
			end
		end
	end

	return count
end

function exports.SelectTraps(env, cell, tagOrFilter)
	local trapSystem = env.global["$TrapSystem"]
	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)

	return trapSystem:selectBuffsOnTarget(cell, matchFunc)
end

function exports.SelectTrapCount(env, cell, tagOrFilter)
	local trapSystem = env.global["$TrapSystem"]
	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)
	local buffs, count = trapSystem:selectBuffsOnTarget(cell, matchFunc)

	return count
end

function exports.LimitHpEffect(env, value)
	return LimitHpEffect:new({
		value = value
	})
end

function exports.MaxHpEffect(env, value)
	return MaxHpEffect:new({
		value = math.floor(value)
	})
end

function exports.NumericEffect(env, name, itemname, value, uplimit)
	return NumericEffect:new({
		effect = name,
		itemname = itemname,
		value = value,
		uplimit = uplimit
	})
end

function exports.SpecialNumericEffect(env, name, itemname, value, uplimit)
	return SpecialNumericEffect:new({
		effect = name,
		itemname = itemname,
		value = value,
		uplimit = uplimit
	})
end

function exports.DeathImmuneEffect(env, value, hpRecoverRatio)
	local brokeCallback = nil

	if hpRecoverRatio then
		local healthSystem = env.global["$HealthSystem"]

		function brokeCallback(battleContext, unit, buffValue)
			if not unit:isInStages(ULS_Normal) then
				return
			end

			local result = healthSystem:performHealthRecovery(nil, unit, buffValue)

			return result
		end
	end

	return DeathImmuneEffect:new({
		value = value,
		brokeCallback = brokeCallback,
		hpRecoverRatio = hpRecoverRatio
	})
end

function exports.PassiveFunEffectBuff(env, id, config)
	local skillSystem = env.global["$SkillSystem"]

	return PassiveFunEffect:new({
		id = id,
		config = config,
		skillSystem = skillSystem
	})
end

function exports.StatusEffect(env, status)
	return StatusEffect:new({
		status = status
	})
end

function exports.Daze(env)
	return StatusEffect:new({
		status = kBEDazed
	})
end

function exports.Mute(env)
	local angerSystem = env.global["$AngerSystem"]

	local function cancelFunction(battleContext, unit)
		if not unit:isInStages(ULS_Normal) then
			return
		end

		angerSystem:checkAnger(unit)
	end

	return StatusEffect:new({
		status = kBEMuted,
		onCancel = cancelFunction
	})
end

function exports.HPLink()
	return StatusEffect:new({
		status = kBELinked
	})
end

function exports.ShieldEffect(env, value, upLimit)
	return ShieldEffect:new({
		value = value,
		upLimit = upLimit
	})
end

function exports.ShieldRatioEffect(env, ratio)
	return ShieldRatioEffect:new({
		ratio = ratio
	})
end

function exports.HPRecoverRatioEffect(env, ratio)
	return HPRecoverRatioEffect:new({
		ratio = ratio
	})
end

function exports.Freeze(env)
	return StatusEffect:new({
		status = kBEFrozen
	})
end

function exports.Reflection(env, value)
	return NumericEffect:new({
		effect = "+reflection",
		itemname = {
			"+a"
		},
		value = value,
		uplimit = uplimit
	})
end

function exports.Taunt(env)
	return StatusEffect:new({
		status = kBETaunt
	})
end

function exports.Mad(env)
	return StatusEffect:new({
		status = kBEMad
	})
end

function exports.Immune(env)
	return ImmuneEffect:new()
end

function exports.Curse(env)
	return CurseEffect:new()
end

function exports.Offline(env)
	return OfflineEffect:new()
end

function exports.Stealth(env, alpha)
	return HolyHideEffect:new({
		status = kBEStealth,
		alpha = alpha
	})
end

function exports.Diligent(env)
	return StatusEffect:new({
		status = kBEDiligent
	})
end

function exports.BuffIsMatched(env, buff, ...)
	local tags = {
		...
	}

	for k, v in pairs(tags) do
		if buff:isMatched(v) then
			return true
		end
	end

	return false
end

function exports.ImmuneBuff(env, tagOrFilter)
	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)

	if matchFunc == nil then
		function matchFunc(buff)
			return true
		end
	end

	return ImmuneBuffEffect:new({
		filter = matchFunc
	})
end

function exports.ImmuneTrapBuffEffect(env, tagOrFilter)
	local matchFunc = makeBuffMatchFunction(env, tagOrFilter)

	if matchFunc == nil then
		function matchFunc(buff)
			return true
		end
	end

	return ImmuneTrapBuffEffect:new({
		filter = matchFunc
	})
end

function exports.Provoke(env, unit)
	return ProvokeEffect:new({
		target = unit
	})
end

function exports.EnergyEffect(env, value)
	return EnergyEffect:new({
		value = value
	})
end

function exports.RageGainEffect(env, name, itemname, value, uplimit)
	return RageGainEffect:new({
		effect = name,
		itemname = itemname,
		value = value,
		uplimit = uplimit
	})
end

function exports.DamageTransferEffect(env, trasforUnit, radio)
	return DamageTransferEffect:new({
		trasforUnit = trasforUnit,
		radio = radio
	})
end

function exports.HPPeriodDamage(env, status, value, lowerLimit)
	local ldamage = value
	local llower = lowerLimit
	local actor = env["$actor"]
	local healthSystem = env.global["$HealthSystem"]
	local formationSystem = env.global["$FormationSystem"]
	local battleStatist = env.global["$Statist"]

	local function dmgFunction(battleContext, unit, buffValue)
		if not unit:isInStages(ULS_Normal) then
			return
		end

		local damage = {
			val = buffValue,
			dotStatus = status
		}
		local result = healthSystem:performHealthDamage(nil, unit, damage, llower)

		if result and battleStatist ~= nil then
			battleStatist:sendStatisticEvent("DoPeriodDamage", {
				unit = actor,
				target = unit,
				detail = result
			})
		end

		if result and result.deadly then
			unit:setFoe(actor:getId())
			formationSystem:excludeDyingUnit(unit)
		end

		return result
	end

	local buffEffect = StatusEffect:new({
		status = status,
		value = type(ldamage) == "table" and ldamage.val or ldamage,
		callback = dmgFunction
	})

	return buffEffect
end

function exports.HPPeriodRecover(env, status, value)
	local lvalue = value
	local actor = env["$actor"]
	local healthSystem = env.global["$HealthSystem"]
	local battleStatist = env.global["$Statist"]

	local function dmgFunction(battleContext, unit, buffValue)
		if not unit:isInStages(ULS_Normal) then
			return
		end

		local unitFlagComp = unit:getComponent("Flag")

		if unitFlagComp:hasStatus(kBECurse) then
			local result = healthSystem:performHealthDamage(nil, unit, buffValue, 1)

			return result
		else
			local result = healthSystem:performHealthRecovery(nil, unit, buffValue)

			if result and battleStatist ~= nil then
				battleStatist:sendStatisticEvent("DoPeriodRecover", {
					unit = actor,
					target = unit,
					detail = result
				})
			end

			return result
		end
	end

	local buffEffect = StatusEffect:new({
		status = status,
		value = type(lvalue) == "table" and lvalue.val or lvalue,
		callback = dmgFunction
	})

	return buffEffect
end

function exports.AngerPeriodRecover(env, status, value)
	local lvalue = value
	local angerSystem = env.global["$AngerSystem"]

	local function dmgFunction(battleContext, unit, buffValue)
		if not unit:isInStages(ULS_Normal) then
			return
		end

		return angerSystem:performAngerRecovery(nil, unit, buffValue)
	end

	local buffEffect = StatusEffect:new({
		status = status,
		value = type(lvalue) == "table" and lvalue.val or lvalue,
		callback = dmgFunction
	})

	return buffEffect
end

function exports.AngerPeriodDamage(env, status, value)
	local lvalue = value
	local angerSystem = env.global["$AngerSystem"]

	local function dmgFunction(battleContext, unit, buffValue)
		if not unit:isInStages(ULS_Normal) then
			return
		end

		return angerSystem:performAngerDamage(nil, unit, buffValue)
	end

	local buffEffect = StatusEffect:new({
		status = status,
		value = type(lvalue) == "table" and lvalue.val or lvalue,
		callback = dmgFunction
	})

	return buffEffect
end
