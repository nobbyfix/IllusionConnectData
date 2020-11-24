local exports = SkillDevKit or {}

function exports.SetCtxVar(env, name, value)
	env.global["$BattleContext"]:setObject(name, value)
end

function exports.SetGlobalVar(env, name, value)
	return env.global["$BattleContext"]:getObject(name)
end

function exports.RetainObject(env, object)
	local references = env["$references"]

	if references == nil then
		references = {}
		env["$references"] = references
	end

	local count = references[object]

	if count == nil then
		count = 1
		references[object] = count

		if object.incReferenceCount ~= nil then
			object:incReferenceCount()
		end
	else
		count = count + 1
		references[object] = count
	end

	return count
end

function exports.ReleaseObject(env, object)
	local references = env["$references"]
	local count = references and references[object]

	if count == nil then
		return 0
	end

	if count == 1 then
		count = 0
		references[object] = nil

		if object.decReferenceCount ~= nil then
			object:decReferenceCount()
		end
	else
		count = count - 1
		references[object] = count
	end

	return count
end

function exports.ReleaseLock(env, ...)
	local skillSystem = env.global["$SkillSystem"]

	return releaseAcquiredLocks(skillSystem:getSkillScheduler(), env, ...)
end

function exports.ModifyDamage(env, damage, operator, factor)
	local dmgIsTable = type(damage) == "table"
	local val = dmgIsTable and damage.val or damage

	if operator == "*" then
		val = val * factor
	elseif operator == "+" then
		val = val + factor
	elseif operator == "-" then
		val = val - factor
	end

	if dmgIsTable then
		damage.val = val
	else
		damage = val
	end

	return damage
end

function exports.isPVEBattle(env)
	local battleSession = env.global["$BattleContext"]:getObject("BattleSession")

	if battleSession and battleSession.getBattleType then
		local battleType = battleSession:getBattleType()
		local pveType = {
			"tower",
			"explore",
			"heroStory",
			"maze",
			"mazeFinal",
			"spStage",
			"stage",
			"practice",
			"crusade"
		}

		if battleType and table.indexof(pveType, battleType) then
			return true
		end
	end

	return false
end
