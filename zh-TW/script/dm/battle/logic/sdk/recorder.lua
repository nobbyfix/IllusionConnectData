local exports = SkillDevKit or {}

function exports.RecordEffect(env, objId, event, data)
	local recorder = env["$recorder"]

	if recorder then
		recorder:recordObjectEvent(objId, event, data, env["$id"])
	end
end

function exports.RecordImmediately(env, objId, event, data)
	local recorder = env["$recorder"]

	if recorder then
		recorder:recordObjectEvent(objId, event, data, nil)
	end
end
