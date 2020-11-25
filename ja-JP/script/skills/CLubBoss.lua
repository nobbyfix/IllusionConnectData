local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.ClubBoss_wild_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
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
			local count = global.SpecialPropGetter(_env, "ClubBoss_wild")(_env, _env.ACTOR)

			if count == 0 then
				local buffeft1 = global.SpecialNumericEffect(_env, "+ClubBoss_wild", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ClubBoss_wild_1",
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
			else
				local buffeft1 = global.SpecialNumericEffect(_env, "+ClubBoss_wild", {
					"+Normal",
					"+Normal"
				}, count + 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ClubBoss_wild_1",
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

			if count >= 2 then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, 4)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ClubBoss_wild_2",
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

return _M
