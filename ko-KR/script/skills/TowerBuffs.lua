local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.TowerBuffs_CritRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+critrate", {
					"+Normal",
					"+Normal"
				}, this.CritRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_CritRateUp",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_BlockRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+blockrate", {
					"+Normal",
					"+Normal"
				}, this.BlockRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_BlockRateUp",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_ReflectRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ReflectRateFactor = externs.ReflectRateFactor

		assert(this.ReflectRateFactor ~= nil, "External variable `ReflectRateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+reflection", {
					"+Normal",
					"+Normal"
				}, this.ReflectRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_ReflectRateUp",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_OnKillHpRecovery = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

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
				local buffeft1 = global.SpecialNumericEffect(_env, "+aoekillrecoveryrate", {
					"+Normal",
					"+Normal"
				}, this.HealRateFactor)
				local buffeft2 = global.SpecialNumericEffect(_env, "+singlekillrecoveryrate", {
					"+Normal",
					"+Normal"
				}, this.HealRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_OnKillHpRecovery",
					timing = 0,
					limit = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.TowerBuffs_SingleCritSplit = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SplitRateFactor = externs.SplitRateFactor

		assert(this.SplitRateFactor ~= nil, "External variable `SplitRateFactor` is not provided.")

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
				local buffeft1 = global.SpecialNumericEffect(_env, "+singlecritsplitrate", {
					"+Normal",
					"+Normal"
				}, this.SplitRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_SingleCritSplit",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_ToMasterHurtRateUp = {
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
				}, 0.125)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_ToMasterHurtRateUp",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_EnterSelfShield = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		assert(this.ShieldRateFactor ~= nil, "External variable `ShieldRateFactor` is not provided.")

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
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					display = "Shield",
					group = "TowerBuffs_EnterSelfShield",
					duration = 3,
					limit = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"SHIELD",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.TowerBuffs_AOERateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOERateFactor = externs.AOERateFactor

		assert(this.AOERateFactor ~= nil, "External variable `AOERateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+aoerate", {
					"+Normal",
					"+Normal"
				}, this.AOERateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_AOERateUp",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_DieBoom = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DmgRateFactor = externs.DmgRateFactor

		assert(this.DmgRateFactor ~= nil, "External variable `DmgRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:DIE"
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.EnemyMaster(_env) then
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local defender = global.LoadUnit(_env, global.EnemyMaster(_env), "DEFENDER")
				local damage = global.EvalDamage(_env, attacker, defender, {
					1,
					this.DmgRateFactor,
					0
				})

				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, global.EnemyMaster(_env))
				})
				global.ApplyHPDamage(_env, global.EnemyMaster(_env), damage)
			end
		end)

		return _env
	end
}
all.TowerBuffs_OnAttackDeRage = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DelRpValueFactor = externs.DelRpValueFactor

		assert(this.DelRpValueFactor ~= nil, "External variable `DelRpValueFactor` is not provided.")

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
				local buffeft1 = global.SpecialNumericEffect(_env, "+delrppoint", {
					"+Normal",
					"+Normal"
				}, 0)
				local buffeft2 = global.SpecialNumericEffect(_env, "+delrprate", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft3 = global.SpecialNumericEffect(_env, "+delrpvalue", {
					"+Normal",
					"+Normal"
				}, this.DelRpValueFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_OnAttackDeRage",
					timing = 0,
					limit = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				})
			end
		end)

		return _env
	end
}
all.TowerBuffs_OnKillEnergyRecovery = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyRecoveryFactor = externs.EnergyRecoveryFactor

		assert(this.EnergyRecoveryFactor ~= nil, "External variable `EnergyRecoveryFactor` is not provided.")

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
				local buffeft1 = global.SpecialNumericEffect(_env, "+singlekillenergyrecoverrate", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft2 = global.SpecialNumericEffect(_env, "+aoekillenergyrecoverrate", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft3 = global.SpecialNumericEffect(_env, "+singlekillenergyrecoverfactor", {
					"+Normal",
					"+Normal"
				}, this.EnergyRecoveryFactor)
				local buffeft4 = global.SpecialNumericEffect(_env, "+aoekillenergyrecoverfactor", {
					"+Normal",
					"+Normal"
				}, this.EnergyRecoveryFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_OnKillEnergyRecovery",
					timing = 0,
					limit = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3,
					buffeft4
				})
			end
		end)

		return _env
	end
}
all.TowerBuffs_OnAttackDaze = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DazeRateFactor = externs.DazeRateFactor

		assert(this.DazeRateFactor ~= nil, "External variable `DazeRateFactor` is not provided.")

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
				local buffeft1 = global.SpecialNumericEffect(_env, "+dazeprob", {
					"+Normal",
					"+Normal"
				}, this.DazeRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_OnAttackDaze",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_OnAttackFreeze = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.FreezeRateFactor = externs.FreezeRateFactor

		assert(this.FreezeRateFactor ~= nil, "External variable `FreezeRateFactor` is not provided.")

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
				local buffeft1 = global.SpecialNumericEffect(_env, "+freezeprob", {
					"+Normal",
					"+Normal"
				}, this.FreezeRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_OnAttackFreeze",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_AOEDeRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEDeRateFactor = externs.AOEDeRateFactor

		assert(this.AOEDeRateFactor ~= nil, "External variable `AOEDeRateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+aoederate", {
					"+Normal",
					"+Normal"
				}, this.AOEDeRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_AOEDeRateUp",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_SingleDeRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleDeRateFactor = externs.SingleDeRateFactor

		assert(this.SingleDeRateFactor ~= nil, "External variable `SingleDeRateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+singlederate", {
					"+Normal",
					"+Normal"
				}, this.SingleDeRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_SingleDeRateUp",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_AfterActRpRecovery = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageRecoverFactor = externs.RageRecoverFactor

		assert(this.RageRecoverFactor ~= nil, "External variable `RageRecoverFactor` is not provided.")

		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive2)

		return this
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

			if not global.MASTER(_env, _env.ACTOR) then
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RageRecoverFactor)
			end
		end)

		return _env
	end
}
all.TowerBuffs_OnBlockHpRecovery = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

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
				local buffeft1 = global.SpecialNumericEffect(_env, "+blockrecoveryrate", {
					"+Normal",
					"+Normal"
				}, this.HealRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_OnBlockHpRecovery",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_OnHurtShield = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		assert(this.ShieldRateFactor ~= nil, "External variable `ShieldRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:HURTED"
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
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					display = "Shield",
					group = "TowerBuffs_OnHurtShield",
					duration = 2,
					limit = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"STATUS",
						"SHIELD",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.TowerBuffs_BeCuredRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BeCuredRateFactor = externs.BeCuredRateFactor

		assert(this.BeCuredRateFactor ~= nil, "External variable `BeCuredRateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+becuredrate", {
					"+Normal",
					"+Normal"
				}, this.BeCuredRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_BeCuredRateUp",
					timing = 0,
					limit = 99,
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
all.TowerBuffs_AfterActUnHurtRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					display = "UnHurtRateUp",
					group = "TowerBuffs_AfterActUnHurtRateUp",
					duration = 3,
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
all.TowerBuffs_HurtRate_UnHurtRate_Up = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "TowerBuffs_HurtRate_UnHurtRate_Up",
					timing = 0,
					limit = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				})
			end
		end)

		return _env
	end
}

return _M
