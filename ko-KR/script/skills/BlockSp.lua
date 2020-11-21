local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.StageSp_Crystal_Skill_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+CuredoubleFactor", {
					"?Normal"
				}, this.CureRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "StageSp_Crystal_Skill_2",
					timing = 0,
					limit = 1,
					tags = {
						"StageSp_Crystal_Skill_2"
					}
				}, {
					buffeft1
				}, 1, 0)
			end
		end)

		return _env
	end
}

return _M
