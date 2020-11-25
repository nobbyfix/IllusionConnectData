local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.HeroLegend_ToMasterHurtRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Master_DmgExtra_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "HeroLegend_ToMasterHurtRateUp",
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
	end
}
all.HeroLegend_AfterActATKRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "HeroLegend_AfterActATKRateUp",
					timing = 0,
					limit = 5,
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
	end
}

return _M
