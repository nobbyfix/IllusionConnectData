local exports = SkillDevKit or {}

local function excludeTarget(env, target, joinReferee)
	local formationSystem = env.global["$FormationSystem"]

	if not formationSystem:expelUnit(target, env["$id"], nil, joinReferee) then
		return nil
	end

	target:setLifeStage(ULS_Kicked)

	local battleField = env.global["$BattleField"]

	if battleField then
		battleField:eraseUnit(target)
	end

	return target
end

local function forceFleeTarget(env, target)
	local formationSystem = env.global["$FormationSystem"]

	if not formationSystem:fleeUnit(target, env["$id"], true) then
		return nil
	end

	target:setLifeStage(ULS_Kicked)

	local battleField = env.global["$BattleField"]

	if battleField then
		battleField:eraseUnit(target)
	end

	return target
end

local function fleeTarget(env, target)
	local formationSystem = env.global["$FormationSystem"]

	if not formationSystem:fleeUnit(target, env["$id"]) then
		return nil
	end

	target:setLifeStage(ULS_Kicked)

	local battleField = env.global["$BattleField"]

	if battleField then
		battleField:eraseUnit(target)
	end

	return target
end

local function stopAffectedSkillActions(env, target)
	local executor = env["$executor"]

	executor:stopAllActions("affected", nil, function (otherEnv)
		if otherEnv == env then
			return false
		end

		local references = otherEnv["$references"]

		return references ~= nil and references[target] ~= nil
	end)
end

function exports.Flee(env, duration, target)
	local target = target or env["$actor"]

	if target == nil or target:isDying() then
		return false
	end

	local unit = fleeTarget(env, target)

	if unit == nil then
		return false
	end

	stopAffectedSkillActions(env, target)
	env.global.RecordEffect(env, unit:getId(), "Flee", {
		dur = duration or 600,
		cell = unit:getSide(),
		flags = unit:getComponent("Flag") and unit:getComponent("Flag"):getFlags() or {}
	})

	return true
end

function exports.ForceFlee(env, duration)
	local target = env["$actor"]

	if target == nil then
		return false
	end

	local unit = forceFleeTarget(env, target)

	if unit == nil then
		return false
	end

	env.global.RecordEffect(env, unit:getId(), "Flee", {
		dur = duration or 600,
		cell = unit:getSide(),
		flags = unit:getComponent("Flag") and unit:getComponent("Flag"):getFlags() or {}
	})

	return true
end

function exports.WontDie(env)
	local target = env["$actor"]
	local formationSystem = env.global["$FormationSystem"]

	formationSystem:wontDieUnit(target)
end

function exports.Expel(env, target, animation)
	if target == nil or target:isDying() then
		return false
	end

	local unit = excludeTarget(env, target)

	if unit == nil then
		return false
	end

	stopAffectedSkillActions(env, target)
	env.global.RecordEffect(env, unit:getId(), "Expelled", animation)

	return true
end

function exports.Kick(env, target, joinReferee)
	joinReferee = joinReferee or false
	local unit = excludeTarget(env, target, joinReferee)

	if unit == nil then
		return false
	end

	stopAffectedSkillActions(env, target)
	env.global.RecordEffect(env, unit:getId(), "Kick", animation)

	return true
end

function exports.Revive(env, hpRatio, anger, location)
	local formationSystem = env.global["$FormationSystem"]
	local actor = env["$actor"]

	return formationSystem:revive(actor, hpRatio, anger, location)
end

function exports.ReviveByUnit(env, unit, hpRatio, anger, location, owner)
	local formationSystem = env.global["$FormationSystem"]
	local actor = env["$actor"]

	return formationSystem:reviveByUnit(actor, unit, hpRatio, anger, location, owner)
end

function exports.ReviveRandom(env, hpRatio, anger, location)
	local formationSystem = env.global["$FormationSystem"]
	local actor = env["$actor"]

	return formationSystem:reviveRandom(actor, hpRatio, anger, location)
end

function exports.Reborn(env, ratio)
	local actor = env["$actor"]

	if actor:isInStages(ULS_Dying) then
		local healthComp = actor:getComponent("Health")

		healthComp:setHp(healthComp:getMaxHp() * ratio)

		if healthComp:getHp() > 0 then
			actor:setLifeStage(ULS_Reviving)
			env.global.RecordEffect(env, actor:getId(), "reborn", {
				hp = healthComp:getHp()
			})
		end
	end
end

function exports.RebornUnit(env, unit, ratio, anger, location)
	if unit:isInStages(ULS_Dead) then
		local formationSystem = env.global["$FormationSystem"]

		formationSystem:rebornUnit(unit, ratio, anger, location)
	end
end

function exports.Summon(env, source, summonId, summonFactor, summonExtra, location, curHpRatio)
	local formationSystem = env.global["$FormationSystem"]
	local actor = env["$actor"]
	local factors = {
		hpRatio = summonFactor and summonFactor[1] or 1,
		atkRatio = summonFactor and summonFactor[2] or 1,
		defRatio = summonFactor and summonFactor[3] or 1,
		hpEx = summonExtra and summonExtra[1] or 0,
		atkEx = summonExtra and summonExtra[2] or 0,
		defEx = summonExtra and summonExtra[3] or 0,
		curHpRatio = curHpRatio or 1
	}

	return formationSystem:summon(actor, source, summonId, factors, location)
end

function exports.SummonMaster(env, source, summonId, summonFactor, summonExtra, location, curHpRatio)
	local formationSystem = env.global["$FormationSystem"]
	local actor = env["$actor"]
	local factors = {
		hpRatio = summonFactor and summonFactor[1] or 1,
		atkRatio = summonFactor and summonFactor[2] or 1,
		defRatio = summonFactor and summonFactor[3] or 1,
		hpEx = summonExtra and summonExtra[1] or 0,
		atkEx = summonExtra and summonExtra[2] or 0,
		defEx = summonExtra and summonExtra[3] or 0,
		curHpRatio = curHpRatio or 1
	}

	return formationSystem:summonMaster(actor, source, summonId, factors, env["$id"])
end

function exports.SpawnByTransform(env, player, source, location, isMarkedSummon)
	local formationSystem = env.global["$FormationSystem"]

	return formationSystem:SpawnByTransform(player, source, location, isMarkedSummon)
end

function exports.SpawnAssist(env, assistId, player, cellId)
	local actor = env["$actor"]
	local formationSystem = env.global["$FormationSystem"]

	formationSystem:spawnAssist(actor, assistId, player, cellId)
end

function exports.MarkSummoned(env, unit, isMarkSummon)
	if unit then
		unit:setIsSummoned(isMarkSummon)
		env.global.RecordImmediately(env, unit:getId(), "IsSummond", {
			isSummoned = isMarkSummon
		})
	end
end

function exports.Suicide(env)
	local actor = env["$actor"]
	local workId = env["$id"]

	actor:setLifeStage(ULS_Dying)

	local formationSystem = env.global["$FormationSystem"]

	formationSystem:excludeDyingUnit(actor, workId)
	env.global.RecordEffect(env, actor:getId(), "Suicide")
end

function exports.KillTarget(env, target)
	local workId = env["$id"]

	target:setLifeStage(ULS_Dying)

	local formationSystem = env.global["$FormationSystem"]

	formationSystem:excludeDyingUnit(target, workId)
	env.global.RecordEffect(env, target:getId(), "KillTarget")
end

function exports.GetPlayerEnergy(env)
	local player = env["$actor"]:getOwner()

	return player:getEnergyReservoir():getEnergy()
end
