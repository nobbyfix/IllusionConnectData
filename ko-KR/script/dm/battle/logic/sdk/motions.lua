local exports = SkillDevKit or {}

function exports.Sound(env, file, rate)
	local actor = env["$actor"]

	env.global.RecordImmediately(env, actor:getId(), "Sound", {
		act = env["$id"],
		file = file,
		rate = rate
	})
end

function exports.Animation(env, name, duration, start, loop)
	return {
		name = name,
		dur = duration,
		strt = start,
		loop = loop
	}
end

function exports.Sequence(env, animation, ...)
	return {
		seq = {
			animation,
			...
		}
	}
end

function exports.MoveTo(env, destination, duration, animation)
	if animation == nil then
		animation = {}
	end

	animation.move = {
		dst = destination,
		dur = duration
	}

	return animation
end

function exports.MoveBy(env, displacement, duration, animation)
	if animation == nil then
		animation = {}
	end

	animation.move = {
		disp = displacement,
		dur = duration
	}

	return animation
end

function exports.Perform(env, actor, animation, autoStand)
	if autoStand == nil then
		autoStand = true
	end

	env.global.RecordImmediately(env, actor:getId(), "Perform", {
		act = env["$id"],
		anim = animation,
		autoStand = autoStand
	})
end

function exports.Speak(env, actor, statements, bubbleStyle, delay)
	local bubble = {
		stmts = statements,
		style = bubbleStyle,
		delay = delay
	}

	env.global.RecordImmediately(env, actor:getId(), "Speak", bubble)
end

function exports.Emote(env, actor, emotion, duration, delay)
	local emote = {
		id = emotion,
		dur = duration,
		delay = delay
	}

	env.global.RecordImmediately(env, actor:getId(), "Emote", emote)
end

function exports.Focus(env, actor, destination, scale, duration)
	env.global.RecordImmediately(env, actor:getId(), "Focus", {
		act = env["$id"],
		dst = destination,
		scale = scale,
		dur = duration
	})
end

function exports.FocusCamera(env, actor, destination, scale, duration)
	env.global.RecordImmediately(env, actor:getId(), "FocusCamera", {
		act = env["$id"],
		dst = destination,
		scale = scale,
		dur = duration
	})
end

function exports.GroundEft(env, actor, bgEftId, duration, inSupering)
	if inSupering == nil then
		inSupering = true
	end

	env.global.RecordImmediately(env, actor:getId(), "GroundEft", {
		act = env["$id"],
		id = bgEftId,
		inSupering = inSupering,
		duration = duration
	})
end

function exports.AnimForTrgt(env, target, configs)
	local actor = env["$actor"]

	env.global.RecordImmediately(env, actor:getId(), "AnimForTrgt", {
		trgt = target:getId(),
		pos = configs.pos,
		layer = configs.layer,
		loop = configs.loop,
		anim = configs.anim
	})
end

function exports.AddAnim(env, configs)
	local actor = env["$actor"]

	env.global.RecordImmediately(env, actor:getId(), "AddAnim", {
		pos = configs.pos,
		zOrder = configs.zOrder,
		loop = configs.loop,
		anim = configs.anim
	})
end

function exports.AddAnimWithFlip(env, configs)
	local actor = env["$actor"]

	env.global.RecordImmediately(env, actor:getId(), "AddAnimWithFlip", {
		pos = configs.pos,
		zOrder = configs.zOrder,
		loop = configs.loop,
		anim = configs.anim,
		isFlipX = configs.isFlipX,
		isFlipY = configs.isFlipY
	})
end

function exports.ShakeScreen(env, configs)
	local actor = env["$actor"]

	env.global.RecordImmediately(env, kBRMainLine, "ShakeScreen", {
		Id = configs.Id,
		duration = configs.duration,
		enhance = configs.enhance
	})
end

function exports.ChangeBG(env, filename)
	env.global.RecordImmediately(env, kBRMainLine, "ChangeBG", {
		filename = filename
	})
end

function exports.StackSkill(env, skillId, stacknum, totalnum)
	local player = env["$actor"]:getOwner()

	env.global.RecordImmediately(env, kBRMainLine, "StackSkill", {
		skillId = skillId,
		stacknum = stacknum,
		totalnum = totalnum,
		playerId = player:getId()
	})
end

function exports.BossComing(env)
	env.global.RecordImmediately(env, kBRMainLine, "BossComing", {})
end

function exports.BossComingPause(env)
	env.global.RecordImmediately(env, kBRMainLine, "BossComing", {
		pause = true
	})
end

function exports.PvpSpeedUp(env, arg1, arg2)
	env.global.RecordImmediately(env, kBRMainLine, "PvpSpeedUp", {
		arg1 = arg1,
		arg2 = arg2
	})
end
