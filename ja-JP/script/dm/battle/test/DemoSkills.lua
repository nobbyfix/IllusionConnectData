local assert = _G.assert

module("demo")

local all = _M.__all__ or {}
_M.__all__ = all
all.DemoNormalSkill = {
	__new__ = function (prototype, externs, global)
		local this = {
			global = global
		}
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		this.owner = externs.owner

		if this.owner == nil then
			this.owner = nil
		end

		this.duration = externs.duration

		if this.duration == nil then
			this.duration = 1000
		end

		this.frag_times = externs.frag_times

		if this.frag_times == nil then
			this.frag_times = {
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			this.duration
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		if _env.ACTOR == nil then
			_env.ACTOR = this.owner
		end

		_env.TARGET = externs.TARGET

		assert(_env.TARGET ~= nil, "External variable `TARGET` is not provided.")
		exec["@time"]({
			this.frag_times[1]
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local damage = global.EvalDamage(_env, attacker, defender, {
				1,
				1,
				0
			})
			local result = global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.DemoBuffSkill = {
	__new__ = function (prototype, externs, global)
		local this = {
			global = global
		}
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		this.owner = externs.owner

		if this.owner == nil then
			this.owner = nil
		end

		this.duration = externs.duration

		if this.duration == nil then
			this.duration = 2000
		end

		this.frag_times = externs.frag_times

		if this.frag_times == nil then
			this.frag_times = {
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			this.duration
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		if _env.ACTOR == nil then
			_env.ACTOR = this.owner
		end

		_env.TARGET = externs.TARGET

		assert(_env.TARGET ~= nil, "External variable `TARGET` is not provided.")
		exec["@time"]({
			this.frag_times[1]
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local addatk = global.NumericEffect(_env, "+atk", {
				"+I1"
			}, 10, 30)

			global.ApplyBuff(_env, _env.ACTOR, {
				display = "atk_up",
				group = "G1",
				duration = 5000,
				limit = 2,
				tags = {
					"tag1"
				}
			}, {
				addatk
			})

			local immune = global.ImmuneEffect(_env, "tag1")

			global.ApplyBuff(_env, _env.TARGET, {
				duration = 10000
			}, {
				immune
			})

			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local damage = global.EvalDamage(_env, attacker, defender, {
				1,
				1,
				0
			})
			local result = global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.DemoRenewCardSkill = {
	__new__ = function (prototype, externs, global)
		local this = {
			global = global
		}
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		this.owner = externs.owner

		if this.owner == nil then
			this.owner = nil
		end

		this.duration = externs.duration

		if this.duration == nil then
			this.duration = 2000
		end

		this.frag_times = externs.frag_times

		if this.frag_times == nil then
			this.frag_times = {
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			this.duration
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		if _env.ACTOR == nil then
			_env.ACTOR = this.owner
		end

		_env.TARGET = externs.TARGET

		assert(_env.TARGET ~= nil, "External variable `TARGET` is not provided.")
		exec["@time"]({
			this.frag_times[1]
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local damage = global.EvalDamage(_env, attacker, defender, {
				1,
				1,
				0
			})

			global.ApplyHPDamage(_env, _env.TARGET, damage)

			local card = global.GetSkillCardPrototype(_env, _env.ACTOR, "c101")

			if card ~= nil then
				global.RenewSkillCard(_env, _env.ACTOR, card)
			end
		end)

		return _env
	end
}
all.EmptySkill = {
	__new__ = function (prototype, externs, global)
		local this = {
			global = global
		}
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			0
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.print(_env, "running EmptySkill")
		end)

		return _env
	end
}

return _M
