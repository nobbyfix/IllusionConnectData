local exports = SkillDevKit or {}

function exports.DelayCall(env, delay, func, ...)
	local executor = env["$executor"]
	local n = select("#", ...)

	if n == 0 then
		executor:execAfterTime(delay, env, function (env, time)
			return func(env)
		end)
	else
		local arg = {
			n = n,
			...
		}

		executor:execAfterTime(delay, env, function (env, time)
			return func(env, unpack(arg, 1, arg.n))
		end)
	end
end

function exports.MultiDelayCall(env, delays, func, ...)
	local executor = env["$executor"]
	local n = select("#", ...)

	if n == 0 then
		for i = 1, #delays do
			executor:execAfterTime(delays[i], env, function (env, time)
				return func(env, i)
			end)
		end
	else
		local arg = {
			n = n,
			...
		}
		local total = #delays

		assert(#arg[2] == total, "Skill Action:" .. env["$action"]:getFullName() .. " splitValue not match")

		for i = 1, total do
			executor:execAfterTime(delays[i], env, function (env, time)
				return func(env, i, total, unpack(arg, 1, arg.n))
			end)
		end
	end
end

function exports.LockTime(env, dur)
	local timingSystem = env.global["$TimingSystem"]

	timingSystem:lockTime(dur)
end
