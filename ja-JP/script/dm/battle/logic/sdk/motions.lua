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

function exports.Perform(env, actor, animation)
	env.global.RecordImmediately(env, actor:getId(), "Perform", {
		act = env["$id"],
		anim = animation
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

function exports.GroundEft(env, actor, bgEftId)
	env.global.RecordImmediately(env, actor:getId(), "GroundEft", {
		act = env["$id"],
		id = bgEftId
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

function exports.ChangeBG(env, filename)
	env.global.RecordImmediately(env, kBRMainLine, "ChangeBG", {
		filename = filename
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
