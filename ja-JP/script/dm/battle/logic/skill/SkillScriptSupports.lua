_G.SkillScriptBuiltins = {}
local builtins = _G.SkillScriptBuiltins

local function getOrCreateRegistry(thisScope, name)
	local registry = thisScope[name]

	if registry == nil then
		registry = {}
		thisScope[name] = registry
	end

	return registry
end

builtins.null = {}

function builtins.__skill(thisScope, def, externs)
	thisScope["$skill"] = externs.skill
	thisScope["$type"] = externs.type
	thisScope["$owner"] = externs.owner
	thisScope["$level"] = externs.level
	thisScope.owner = thisScope["$owner"]
	thisScope.type = thisScope["$type"]

	return thisScope
end

function builtins.__skill_function__(thisScope, def)
	local func = def.entry
	local functions = getOrCreateRegistry(thisScope, "$functions")
	functions[#functions + 1] = func
	functions[func] = def

	return func
end

function builtins.__skill_action__(thisScope, def)
	local action = BattleSkillAction:new(def)
	local actions = getOrCreateRegistry(thisScope, "$actions")
	actions[#actions + 1] = action
	actions[action] = def

	return action
end

local ipairs = _G.ipairs

function builtins.__iter__(iterable, ...)
	if type(iterable) == "table" then
		return ipairs(iterable)
	end

	return iterable, ...
end

builtins["[duration]"] = function (thisScope, args, action)
	assert(type(action) == "table" and action["$type"] == "action")

	local duration = args[1] or args.duration

	action:setDuration(duration)

	return action
end

builtins["[synchronized]"] = function (thisScope, args, action)
	for i = 1, table.maxn(args) do
		action:addSynchroLock(args[i])
	end

	return action
end

builtins["[cut_in]"] = function (thisScope, args, action)
	assert(type(action) == "table" and action["$type"] == "action")

	local anim = args[1] or args.anim

	action:setCutInAnimation(anim)

	return action
end

builtins["[proud]"] = function (thisScope, args, action)
	assert(type(action) == "table" and action["$type"] == "action")

	local anim = args[1] or args.anim

	action:setProudAnimation(anim)

	return action
end

builtins["[load]"] = function (thisScope, args, action)
	assert(type(action) == "table" and action["$type"] == "action")

	local anim = args

	action:setEffectRes(anim)

	return action
end

builtins["[entry_point]"] = function (thisScope, args, action)
	assert(type(action) == "table" and action["$type"] == "action")

	local states = args[1] or args.states
	local skill = thisScope["$skill"]

	if states == nil then
		if skill:getDefaultEntry() ~= nil then
			error("The default entry point is already specified.")
		end

		skill:setDefaultEntry(action)
	else
		for _, state in ipairs(states) do
			if skill:getQualifiedEntry(state) ~= nil then
				error(string.format("The entry point for '%s' state is already specified.", state))
			end

			skill:setQualifiedEntry(state, action)
		end
	end

	return action
end

builtins["[trigger_by]"] = function (thisScope, args, actionOrFunction)
	local event = args[1] or args.event

	assert(event ~= nil, "trigger event is missing!")

	local priority = args[2] or args.priority or 0
	local oneshot = args[3] or args.oneshot or false
	local skill = thisScope["$skill"]

	skill:addEventTriggeredAction(event, actionOrFunction, priority, oneshot)

	return actionOrFunction
end

builtins["[schedule_in_cycles]"] = function (thisScope, args, actionOrFunction)
	local interval = args[1] or args.interval

	assert(interval ~= nil and interval > 0, "invalid argument #1 (`interval`)")

	local timer = {
		type = "Periodic",
		interval = interval,
		start = args[2] or args.start or 0,
		ending = args[3] or args.ending
	}
	local priority = args[4] or args.priority or 0
	local skill = thisScope["$skill"]

	skill:addTimeTriggeredAction(timer, actionOrFunction, priority)

	return actionOrFunction
end

builtins["[schedule_at_moments]"] = function (thisScope, args, actionOrFunction)
	local moments = args[1] or args.moments

	assert(moments ~= nil and #moments > 0, "invalid argument #1 (`moments`)")

	local timer = {
		type = "Specific",
		moments = moments
	}
	local priority = args[2] or args.priority or 0
	local skill = thisScope["$skill"]

	skill:addTimeTriggeredAction(timer, actionOrFunction, priority)

	return actionOrFunction
end
