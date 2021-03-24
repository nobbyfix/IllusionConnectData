local exports = SkillDevKit or {}
local floor = math.floor
local ceil = math.ceil

local function addHurtInfo(env, target, hurtDetail)
	local hurts = env["$hurts"]

	if hurts == nil then
		env["$hurts"] = {
			{
				target,
				hurtDetail
			}
		}
	else
		hurts[#hurts + 1] = {
			target,
			hurtDetail
		}
	end
end

local function addReflectInfo(env, reflecter, hurtDetail)
	local reflects = env["$reflects"]

	if reflects == nil then
		env["$reflects"] = {
			{
				reflecter,
				hurtDetail
			}
		}
	else
		reflects[#reflects + 1] = {
			reflecter,
			hurtDetail
		}
	end
end

function exports.ApplyHPDamage(env, target, damage, lowerLimit, notLastHit)
	local healthSystem = env.global["$HealthSystem"]
	local actor = env["$actor"]
	local workId = env["$id"]
	local result, transforTarget = nil
	local flagComp = target:getComponent("Flag")

	if flagComp:hasStatus(kBELinked) and not flagComp:hasStatus(kBEImmune) then
		local battleField = env.global["$BattleField"]
		local linkedUnits = battleField:collectLinkedUnits({}, target:getSide())
		local dmgIsTable = type(damage) == "table"
		local splitDamageVal = dmgIsTable and floor(damage.val / #linkedUnits) or floor(damage / #linkedUnits)
		local splitDamage = dmgIsTable and {
			val = splitDamageVal,
			crit = damage.crit,
			block = damage.block
		} or splitDamageVal

		for k, unit in ipairs(linkedUnits) do
			if unit == target then
				result, transforTarget = healthSystem:performHealthDamage(actor, target, splitDamage, lowerLimit, workId, notLastHit)
			else
				local _result = healthSystem:performHealthDamage(actor, unit, splitDamageVal, lowerLimit, workId, notLastHit)

				if _result then
					addHurtInfo(env, unit, _result)

					if _result.deadly then
						unit:setFoe(actor:getId())

						local formationSystem = env.global["$FormationSystem"]

						formationSystem:excludeDyingUnit(unit, workId)
						formationSystem:recordDying()
					end
				end
			end
		end
	else
		result, transforTarget = healthSystem:performHealthDamage(actor, target, damage, lowerLimit, workId, notLastHit)
	end

	if result then
		if transforTarget then
			target = transforTarget
		end

		addHurtInfo(env, target, result)

		if result.deadly then
			target:setFoe(actor:getId())

			local formationSystem = env.global["$FormationSystem"]

			formationSystem:excludeDyingUnit(target, workId)
			formationSystem:recordDying()
		end

		local rawDamage = result.raw or 0

		if actor ~= nil and rawDamage > 0 then
			local reflectResult, transActor = healthSystem:performReflection(actor, target, rawDamage, workId, notLastHit)

			if reflectResult then
				addReflectInfo(env, target, reflectResult)

				if reflectResult.deadly then
					if transActor then
						transActor:setFoe(target:getId())

						local formationSystem = env.global["$FormationSystem"]

						formationSystem:excludeDyingUnit(transActor, workId)
						formationSystem:recordDying()
					else
						actor:setFoe(target:getId())

						local formationSystem = env.global["$FormationSystem"]

						formationSystem:excludeDyingUnit(actor, workId)
						formationSystem:recordDying()
					end
				end
			end

			local absorbResult = healthSystem:performAbsorption(actor, target, rawDamage, workId)

			if reflectResult or absorbResult then
				local r = {}

				for k, v in pairs(result) do
					r[k] = v
				end

				result = r
				result.reflect = reflectResult
				result.absorb = absorbResult
			end
		end
	end

	return result
end

function exports.ApplyHPReduce(env, target, damage)
	local healthSystem = env.global["$HealthSystem"]
	local actor = env["$actor"]
	local workId = env["$id"]
	local result = nil
	result = healthSystem:performHealthReduce(target, damage, workId, actor)

	return result
end

function exports.ApplyHpRatio(env, target, hpRatio)
	if hpRatio > 1 then
		hpRatio = 1
	end

	if hpRatio < 0 then
		hpRatio = 0
	end

	local healthSystem = env.global["$HealthSystem"]
	local actor = env["$actor"]
	local workId = env["$id"]
	local healthComp = target:getComponent("Health")

	if not healthComp then
		return
	end

	local curHpRatio = healthComp:getHpRatio()
	local maxHp = healthComp:getMaxHp()
	local result = nil

	if curHpRatio < hpRatio then
		result = env.global.ApplyHPRecovery(env, target, (hpRatio - curHpRatio) * maxHp)
	elseif hpRatio < curHpRatio then
		result = env.global.ApplyHPReduce(env, target, (curHpRatio - hpRatio) * maxHp)
	end

	return result
end

function exports.ApplyHPRecovery(env, target, recovery)
	local healthSystem = env.global["$HealthSystem"]
	local workId = env["$id"]
	local battleStatist = env.global["$Statist"]
	local flagComp = target:getComponent("Flag")

	if flagComp:hasStatus(kBECurse) then
		local result = healthSystem:performHealthDamage(env["$actor"], target, recovery, 1, workId)

		return result
	else
		local result = healthSystem:performHealthRecovery(env["$actor"], target, recovery, workId)

		return result
	end
end
