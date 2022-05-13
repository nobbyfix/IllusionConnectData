local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_DHB_Ground_Buff = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.cellcfg = externs.cellcfg

		assert(this.cellcfg ~= nil, "External variable `cellcfg` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:PRE_ENTER"
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

			for i = 1, #this.cellcfg do
				if this.cellcfg[i].type == 1 then
					local buff = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.cellcfg[i].value1)
					local trap = global.BuffTrap(_env, {
						timing = 0,
						duration = 99,
						display = "HurtRateUp",
						tags = {
							"DHB_Ground_Buff",
							"HURTRATEUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})

					global.ApplyTrap(_env, global.GetCellById(_env, this.cellcfg[i].cell), {
						display = "Freeze",
						duration = 99,
						triggerLife = this.cellcfg[i].count
					}, {
						trap
					})
				elseif this.cellcfg[i].type == 2 then
					local buff = global.NumericEffect(_env, "+unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.cellcfg[i].value1)
					local trap = global.BuffTrap(_env, {
						timing = 0,
						duration = 99,
						display = "UnHurtRateUp",
						tags = {
							"DHB_Ground_Buff",
							"UNHURTRATEUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})

					global.ApplyTrap(_env, global.GetCellById(_env, this.cellcfg[i].cell), {
						display = "Freeze",
						duration = 99,
						triggerLife = this.cellcfg[i].count
					}, {
						trap
					})
				elseif this.cellcfg[i].type == 3 then
					local buff = global.PassiveFunEffectBuff(_env, "Skill_Sustained_RPRecovery_Period", {
						Period = this.cellcfg[i].value1,
						RateFactor = this.cellcfg[i].value2
					})
					local trap = global.BuffTrap(_env, {
						timing = 0,
						duration = 99,
						display = "",
						tags = {
							"DHB_Ground_Buff",
							"RPUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})

					global.ApplyTrap(_env, global.GetCellById(_env, this.cellcfg[i].cell), {
						display = "Freeze",
						duration = 99,
						triggerLife = this.cellcfg[i].count
					}, {
						trap
					})
				end
			end
		end)

		return _env
	end
}
all.Skill_DHB_Damage_Way = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.job = externs.job

		assert(this.job ~= nil, "External variable `job` is not provided.")

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
			local job_useful = "NIL"

			if this.job == "Attack" then
				job_useful = "ASSASSIN"
			elseif this.job == "Defense" then
				job_useful = "WARRIOR"
			elseif this.job == "Cure" then
				job_useful = "HEALER"
			elseif this.job == "Aoe" then
				job_useful = "MAGE"
			elseif this.job == "Summon" then
				job_useful = "SUMMONER"
			elseif this.job == "Support" then
				job_useful = "LIGHT"
			elseif this.job == "Curse" then
				job_useful = "DARK"
			end

			if job_useful ~= "NIL" then
				local buffeft_flag = global.SpecialNumericEffect(_env, "+Damage_Way_" .. job_useful, {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"DHB_Damage_Way",
						"Damage_Way_" .. job_useful
					}
				}, {
					buffeft_flag
				})
			end
		end)

		return _env
	end
}

return _M
