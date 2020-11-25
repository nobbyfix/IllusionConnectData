local exports = SkillDevKit or {}

function exports.GetOwner(env, target)
	return target and target:getOwner()
end

local function getTargetRoles(env, target, createIfNotExist)
	local rolesMap = env["$roles_map"]

	if rolesMap == nil then
		if not createIfNotExist then
			return nil
		end

		rolesMap = {}
		env["$roles_map"] = rolesMap
	end

	local targetRoles = rolesMap[target]

	if targetRoles == nil then
		if not createIfNotExist then
			return nil
		end

		targetRoles = {}
		rolesMap[target] = targetRoles
	end

	return targetRoles
end

function exports.AssignRoles(env, target, ...)
	local arg = {
		n = select("#", ...),
		...
	}
	local targetRoles = getTargetRoles(env, target, true)
	local newRoles = nil

	for i = 1, arg.n do
		local role = arg[i]

		if role ~= nil and not targetRoles[role] then
			targetRoles[role] = true

			if newRoles == nil then
				newRoles = {}
			end

			newRoles[#newRoles + 1] = role
		end
	end

	if newRoles ~= nil then
		env.global.RecordImmediately(env, target:getId(), "AddRoles", {
			act = env["$id"],
			roles = newRoles
		})
	end
end

function exports.UnassignRoles(env, target, ...)
	local arg = {
		n = select("#", ...),
		...
	}
	local targetRoles = getTargetRoles(env, target, false)

	if targetRoles == nil then
		return
	end

	local delRoles = nil

	for i = 1, arg.n do
		local role = arg[i]

		if role ~= nil and targetRoles[role] then
			targetRoles[role] = nil

			if delRoles == nil then
				delRoles = {}
			end

			delRoles[#delRoles + 1] = role
		end
	end

	if delRoles ~= nil then
		env.global.RecordImmediately(env, target:getId(), "DelRoles", {
			act = env["$id"],
			roles = delRoles
		})
	end
end

function exports.Transform(env, target, hpRatio)
	local formationSystem = env.global["$FormationSystem"]

	formationSystem:transform(target, hpRatio)
end

function exports.InheritTransform(env)
	local actor = env["$actor"]

	actor:inheritTransform()
end

function exports.FullInheritTransform(env)
	local actor = env["$actor"]

	actor:fullInheritTransform()
end

function exports.Transport(env, location)
	if location == nil then
		return nil
	end

	local actor = env["$actor"]
	local formationSystem = env.global["$FormationSystem"]
	local result = formationSystem:transport(actor, location)

	if result then
		return math.abs(result)
	end
end

function exports.GetFigureState(env, target)
	return target and target:getFigureState()
end

function exports.IsAlive(env, target)
	if target and (target:getLifeStage() == ULS_Normal or target:getLifeStage() == ULS_Reviving) then
		return true
	end

	return false
end

function exports.Transfigure(env, target, figureState, figureData)
	if target == nil then
		return false
	end

	local oldFigureState = target:getFigureState()

	if not target:transfigure(figureState, figureData) then
		return false
	end

	env.global.RecordImmediately(env, target:getId(), "Transfigure", target:dumpInformation())
	env.global["$SkillSystem"]:activateGlobalTrigger("TRANSFIGURED", {
		actor = target,
		oldFigure = oldFigureState,
		newFigure = figureState
	})

	return true
end

function exports.HarmTargetView(env, targets)
	local actor = env["$actor"]
	local result = {}

	for _, target in ipairs(targets) do
		result[#result + 1] = target:getPosition()
	end

	env.global.RecordImmediately(env, actor:getId(), "HarmTargetView", {
		act = env["$id"],
		targets = result
	})
end

function exports.HealTargetView(env, targets)
	local actor = env["$actor"]
	local result = {}

	for _, target in ipairs(targets) do
		result[#result + 1] = target:getPosition()
	end

	env.global.RecordImmediately(env, actor:getId(), "HealTargetView", {
		act = env["$id"],
		targets = result
	})
end

function exports.CancelTargetView(env)
	local actor = env["$actor"]

	env.global.RecordImmediately(env, actor:getId(), "CancelTargetView", {
		act = env["$id"]
	})
end
