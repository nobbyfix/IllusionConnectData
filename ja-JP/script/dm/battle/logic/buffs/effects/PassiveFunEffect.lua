PassiveFunEffect = class("PassiveFunEffect", BuffEffect)

function PassiveFunEffect:initialize(config)
	super.initialize(self, config)

	self._id = config.id
	self._config = config.config
	self._skillSystem = config.skillSystem
	self._actionList = {}
end

function PassiveFunEffect:takeEffect(target, buffObject)
	local data = {
		skillId = self._id,
		level = 1,
		proto = self._id,
		args = self._config
	}
	local skillComp = target:getComponent("Skill")

	if not skillComp then
		return false
	end

	local skill, isNewPassive = skillComp:addPassiveSkill(data)

	self._skillSystem:buildSkillsForActor_PassiveBuff(target, {
		skill
	}, self._actionList, isNewPassive)
	super.takeEffect(self, target, buffObject)

	return true
end

function PassiveFunEffect:cancelEffect(target, buffObject)
	local _target = buffObject:getEffectValue(self, "target")

	if _target == nil or _target ~= target then
		return false
	end

	target:getComponent("Skill"):removePassiveSkill(self._id)

	for i, v in pairs(self._actionList) do
		self._skillSystem:clearTriggersForActorAction(v.event, target, v.listener)
	end

	local timeTrigger = self._skillSystem:getTimeTrigger()

	if timeTrigger then
		timeTrigger:removeAction(target)
	end

	return true
end
