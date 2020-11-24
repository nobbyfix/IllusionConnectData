local exports = SkillDevKit or {}
local floor = math.floor
local ceil = math.ceil

function exports.ApplyRPDamage(env, target, damage)
	if not target:isInStages(ULS_Normal) then
		return
	end

	local angerSystem = env.global["$AngerSystem"]

	return angerSystem:performAngerDamage(env["$actor"], target, damage, env["$id"])
end

function exports.ApplyRPRecovery(env, target, recovery)
	if not target:isInStages(ULS_Normal) then
		return
	end

	local angerSystem = env.global["$AngerSystem"]

	return angerSystem:performAngerRecovery(env["$actor"], target, recovery, env["$id"])
end
