CommonProcessRecorder = class("CommonProcessRecorder")

function CommonProcessRecorder:initialize(battleRecorder)
	super.initialize(self)

	self._battleRecorder = battleRecorder
end

function CommonProcessRecorder:reset()
	self._skillWorks = {}
end

CommonProcessRecorder:implements(IProcessRecorder)

function CommonProcessRecorder:getCurrentFrame()
	return self._battleRecorder:getCurrentFrame()
end

function CommonProcessRecorder:gotoFrame(frame)
	return self._battleRecorder:gotoFrame(frame)
end

function CommonProcessRecorder:beginSkillAction(actionEnv, actor, target)
	local action = actionEnv["$action"]
	local workId = actionEnv["$id"]

	assert(workId ~= nil)

	self._skillWorks[workId] = {
		action = action,
		actor = actor,
		target = target
	}

	self._battleRecorder:recordEvent(actor:getId(), "BeginSkill", {
		act = workId,
		trgt = target and target:getId(),
		skill = action:getFullName(),
		model = action:getCutInAnimation(),
		proud = action:getProudAnimation(),
		load = action:getEffectRes(),
		type = action:getOwnerSkill():getType()
	})

	return workId
end

function CommonProcessRecorder:endSkillAction(actionEnv, reason)
	local workId = actionEnv["$id"]
	local skillWork = self._skillWorks[workId]

	if skillWork == nil then
		return
	end

	local actor = skillWork.actor

	self._battleRecorder:recordEvent(actor:getId(), "EndSkill", {
		act = workId,
		abort = reason and true or nil
	})
end

function CommonProcessRecorder:beginActionFragment(actionEnv)
end

function CommonProcessRecorder:endActionFragment(actionEnv)
end

function CommonProcessRecorder:newObjectTimeline(objId, typeName, workId)
	self._battleRecorder:newTimeline(objId, typeName)
end

function CommonProcessRecorder:recordObjectEvent(objId, event, detail, workId)
	if type(detail) == "table" and workId ~= nil then
		detail.act = workId
	end

	self._battleRecorder:recordEvent(objId, event, detail)
end

function CommonProcessRecorder:recordMetaEvent(objId, evt, data, typeName, workId)
	self._battleRecorder:recordMetaEvent(objId, evt, data, typeName)
end
