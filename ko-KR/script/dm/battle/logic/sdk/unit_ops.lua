local exports = SkillDevKit or {}

function exports.GetOwner(env, target)
	return target and target:getOwner()
end

function exports.GetSufaceIndex(env, target)
	if target and target:getSurfaceIndex() and target:getSurfaceIndex() > 0 then
		return target:getSurfaceIndex()
	end

	return 1
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

function exports.Transform(env, target, hpRatio, triggerDie)
	local skillSystem = env.global["$SkillSystem"]

	if triggerDie then
		skillSystem:activateSpecificTrigger(target, "TRANSFORM", {
			unit = target,
			isTransform = triggerDie
		})
		skillSystem:activateGlobalTrigger("UNIT_TRANSFORM", {
			unit = target,
			isTransform = triggerDie
		})
	end

	local timeTrigger = skillSystem:getTimeTrigger()

	if timeTrigger then
		timeTrigger:removeAction(target)
	end

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

function exports.transportExt(env, actor, location, duration, speed)
	if location == nil then
		return nil
	end

	local actor = actor
	local formationSystem = env.global["$FormationSystem"]
	local result = formationSystem:transportExt(actor, location, duration, speed)

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

function exports.SwitchActionTo(env, srcAnim, desAnim, target)
	local actor = env["$actor"]

	if target then
		actor = target
	end

	env.global.RecordImmediately(env, actor:getId(), "SwitchActionTo", {
		act = env["$id"],
		srcAnim = srcAnim,
		desAnim = desAnim
	})
end

function exports.ChangeActionLoop(env, desAnim, isLoop, target)
	local actor = env["$actor"]

	if target then
		actor = target
	end

	env.global.RecordImmediately(env, actor:getId(), "ChangeActionLoop", {
		act = env["$id"],
		isLoop = isLoop,
		desAnim = desAnim
	})
end

function exports.SetDisplayZorder(env, unit, zorder)
	env.global.RecordImmediately(env, unit:getId(), "SetDisplayZorder", {
		act = env["$id"],
		zorder = zorder
	})
end

function exports.ResetDisplayZorder(env, unit)
	env.global.RecordImmediately(env, unit:getId(), "ResetDisplayZorder", {
		act = env["$id"]
	})
end

function exports.UpdateFanProgress(env, unit, progress)
	if not unit then
		return
	end

	env.global.RecordImmediately(env, unit:getId(), "FanUpdate", {
		progress = progress
	})
end

function exports.SetHSVColor(env, unit, hue, contrast, brightness, saturation)
	if not unit then
		return
	end

	env.global.RecordImmediately(env, unit:getId(), "SetHSVColor", {
		hue = hue,
		contrast = contrast,
		brightness = brightness,
		saturation = saturation
	})
end

function exports.setRootVisible(env, unit, isVisible)
	if not unit then
		return
	end

	env.global.RecordImmediately(env, unit:getId(), "SetRootVisible", {
		isVisible = isVisible
	})
end

function exports.setRoleScale(env, unit, scale)
	if not unit then
		return
	end

	env.global.RecordImmediately(env, unit:getId(), "SetRoleScale", {
		scale = scale
	})
end

function exports.ForbidenRevive(env, unit, isforbiden)
	if not unit then
		return
	end

	if isforbiden then
		unit:forbidenUnearth()
	else
		unit:enableUnearth()
	end

	return true
end

function exports.GetSex(env, unit)
	if not unit then
		return
	end

	return unit:getSex()
end

function exports.GetAIPosition(env, side, card)
	if not card then
		return
	end

	if card:getType() ~= "hero" then
		return nil
	end

	local cardAi = card:getCardAI()

	if cardAi then
		local cardPos = cardAi.ForcedPosition
		local aiPos = {}

		for k, v in pairs(cardPos or {}) do
			for k_, v_ in pairs(v) do
				aiPos[k] = v_ * side
			end
		end

		return aiPos
	end

	return nil
end
