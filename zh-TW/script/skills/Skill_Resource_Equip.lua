local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_Resource_Equip_Flee_Round = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.escaperound = externs.escaperound

		assert(this.escaperound ~= nil, "External variable `escaperound` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive2)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local round = global.SpecialPropGetter(_env, "escaperound")(_env, _env.ACTOR)

			if round == this.escaperound then
				global.ForceFlee(_env, 4000)
			else
				round = round + 1
				local buffeft1 = global.SpecialNumericEffect(_env, "+escaperound", {
					"+Normal",
					"+Normal"
				}, round)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "escaperound",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "UnHurtRateUp",
				tags = {
					"NUMERIC",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				global.buffeft1
			})
		end)

		return _env
	end
}
all.Skill_Resource_Equip_Flee_Round_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive2)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ForceFlee(_env, 4000)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, global.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "UnHurtRateUp",
				tags = {
					"NUMERIC",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				global.buffeft1
			})
		end)

		return _env
	end
}

return _M
