local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_Rtpk_Quicken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.BeCureRateFactor = externs.BeCureRateFactor

		assert(this.BeCureRateFactor ~= nil, "External variable `BeCureRateFactor` is not provided.")

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

		_env.flag = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local cards1 = global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))
			local cards2 = {}

			if global.EnemyMaster(_env) then
				cards2 = global.CardsInWindow(_env, global.GetOwner(_env, global.EnemyMaster(_env)))

				if #cards1 == 0 and #cards2 == 0 then
					if _env.flag == 0 then
						global.PvpSpeedUp(_env, this.HurtRateFactor * 100, this.BeCureRateFactor * 100)

						_env.flag = 1
					end

					local buff1 = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.HurtRateFactor)
					local buff2 = global.NumericEffect(_env, "-becuredrate", {
						"+Normal",
						"+Normal"
					}, this.BeCureRateFactor)

					for _, unit in global.__iter__(global.AllUnits(_env)) do
						if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "HURTRATEUP", "RTPK")) == 0 then
							global.ApplyBuff(_env, unit, {
								timing = 0,
								display = "HurtRateUp",
								group = "RTPK_HURTRATE",
								duration = 99,
								limit = 1,
								tags = {
									"NUMERIC",
									"HURTRATEUP",
									"RTPK",
									"UNDISPELLABLE",
									"UNSTEALABLE"
								}
							}, {
								buff1
							})
						end

						if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "BECUREDRATEDOWN", "RTPK")) == 0 then
							global.ApplyBuff(_env, unit, {
								timing = 0,
								display = "BeCuredRateDown",
								group = "RTPK_BECUREDRATE",
								duration = 99,
								limit = 1,
								tags = {
									"NUMERIC",
									"BECUREDRATEDOWN",
									"RTPK",
									"UNDISPELLABLE",
									"UNSTEALABLE"
								}
							}, {
								buff2
							})
						end
					end
				end
			end
		end)

		return _env
	end
}

return _M
