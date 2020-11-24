local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.CrusadeBuffs_EnterSelfShield = {
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
					timing = 0,
					display = "Shield",
					group = "CrusadeBuffs_EnterSelfShield",
					duration = 99,
					limit = 1,
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
all.CrusadeBuffs_OnAttackFreeze = {
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
					group = "CrusadeBuffs_OnAttackFreeze",
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
all.CrusadeBuffs_OnAttackDaze = {
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
					group = "CrusadeBuffs_OnAttackDaze",
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
all.CrusadeBuffs_AfterActRpRecovery = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageRecoverFactor = externs.RageRecoverFactor

		assert(this.RageRecoverFactor ~= nil, "External variable `RageRecoverFactor` is not provided.")

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
				local buffeft1 = global.SpecialNumericEffect(_env, "+addrpprob", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft2 = global.SpecialNumericEffect(_env, "+addrpvalue", {
					"+Normal",
					"+Normal"
				}, this.RageRecoverFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_AfterActRpRecovery",
					timing = 0,
					limit = 1,
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
all.CrusadeBuffs_AfterActHpRecovery = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
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
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPRecovery(_env, _env.ACTOR, maxHp * this.HealRateFactor)
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_OnKillHpRecovery = {
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
					group = "CrusadeBuffs_OnKillHpRecovery",
					timing = 0,
					limit = 1,
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
all.CrusadeBuffs_ToMasterHurtRateUp = {
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
					group = "CrusadeBuffs_ToMasterHurtRateUp",
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
all.CrusadeBuffs_SingleCritSplit = {
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
					group = "CrusadeBuffs_SingleCritSplit",
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
all.CrusadeBuffs_SingleSplit = {
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
				local buffeft1 = global.SpecialNumericEffect(_env, "+singlesplitrate", {
					"+Normal",
					"+Normal"
				}, this.SplitRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_SingleSplit",
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
all.CrusadeBuffs_ToMasterDieBoom = {
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

			if global.PETS - global.SUMMONS(_env, _env.ACTOR) and global.EnemyMaster(_env) then
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
all.CrusadeBuffs_EnergyRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyRateFactor = externs.EnergyRateFactor

		assert(this.EnergyRateFactor ~= nil, "External variable `EnergyRateFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.EnergyEffect(_env, 1 + this.EnergyRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "EnergyEffectDown",
					group = "CrusadeBuffs_EnergyRateUp",
					duration = 99,
					limit = 1,
					tags = {
						"STATUS",
						"ENERGYEFFECTDOWN",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_MaxHeadCount = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HeadCountFactor = externs.HeadCountFactor

		assert(this.HeadCountFactor ~= nil, "External variable `HeadCountFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		passive1 = global["[trigger_by]"](this, {
			"UNIT_REVIVE"
		}, passive1)
		passive1 = global["[trigger_by]"](this, {
			"UNIT_REBORN"
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive2)

		return this
	end,
	passive1 = function (_env, externs)
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

			if global.MASTER(_env, _env.ACTOR) and global.PETS - global.SUMMONS(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local count2 = #global.FriendUnits(_env, global.PETS)

				if this.HeadCountFactor <= count2 then
					global.LockHeroCards(_env, global.GetOwner(_env, _env.ACTOR))
				end
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) and global.PETS(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local count2 = #global.FriendUnits(_env, global.PETS)

				if count2 < this.HeadCountFactor then
					global.UnlockHeroCards(_env, global.GetOwner(_env, _env.ACTOR))
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_InitEnergyUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyRecoverFactor = externs.EnergyRecoverFactor

		assert(this.EnergyRecoverFactor ~= nil, "External variable `EnergyRecoverFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.EnergyRecoverFactor)
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_AOERate = {
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
					group = "CrusadeBuffs_AOERate",
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
all.CrusadeBuffs_SingleRate = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleRateFactor = externs.SingleRateFactor

		assert(this.SingleRateFactor ~= nil, "External variable `SingleRateFactor` is not provided.")

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
				}, this.SingleRateFactor)
				local buffeft2 = global.NumericEffect(_env, "-aoerate", {
					"+Normal",
					"+Normal"
				}, this.SingleRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_SingleRate",
					timing = 0,
					limit = 1,
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
all.CrusadeBuffs_SingleRateUp_AoeRateDown = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleRateFactor = externs.SingleRateFactor

		assert(this.SingleRateFactor ~= nil, "External variable `SingleRateFactor` is not provided.")

		this.AoeDeRateFactor = externs.AoeDeRateFactor

		assert(this.AoeDeRateFactor ~= nil, "External variable `AoeDeRateFactor` is not provided.")

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
				}, this.SingleRateFactor)
				local buffeft2 = global.NumericEffect(_env, "-aoerate", {
					"+Normal",
					"+Normal"
				}, this.SingleRateFactor)
				local buffeft3 = global.NumericEffect(_env, "-aoerate", {
					"+Normal",
					"+Normal"
				}, this.AoeDeRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_SingleRateUp_AoeRateDown",
					timing = 0,
					limit = 1,
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
all.CrusadeBuffs_AoeDazeRate = {
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
				local buffeft1 = global.SpecialNumericEffect(_env, "+afteratk_dazerate", {
					"+Normal",
					"+Normal"
				}, this.DazeRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_AoeDazeRate",
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
all.CrusadeBuffs_SingleDeRate = {
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
					group = "CrusadeBuffs_SingleDeRate",
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
all.CrusadeBuffs_EnterHpReduce = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpRateFactor = externs.HpRateFactor

		assert(this.HpRateFactor ~= nil, "External variable `HpRateFactor` is not provided.")

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
				global.ApplyHpRatio(_env, _env.ACTOR, 0.5)
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_NumericEffect = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

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
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft3 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft4 = global.NumericEffect(_env, "+critrate", {
					"+Normal",
					"+Normal"
				}, this.CritRateFactor)
				local buffeft5 = global.NumericEffect(_env, "+blockrate", {
					"+Normal",
					"+Normal"
				}, this.BlockRateFactor)
				local buffeft6 = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, this.AbsorptionRateFactor)
				local buffeft7 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft8 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)
				local buffeft9 = global.NumericEffect(_env, "+curerate", {
					"+Normal",
					"+Normal"
				}, this.CureRateFactor)
				local buffeft10 = global.NumericEffect(_env, "+becuredrate", {
					"+Normal",
					"+Normal"
				}, this.BeCuredRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_NumericEffect",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"CrusadeBuffs_NumericEffect",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3,
					buffeft4,
					buffeft5,
					buffeft6,
					buffeft7,
					buffeft8,
					buffeft9,
					buffeft10
				})
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnterSelfShield = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Type1 = externs.Type1

		assert(this.Type1 ~= nil, "External variable `Type1` is not provided.")

		this.Type2 = externs.Type2

		assert(this.Type2 ~= nil, "External variable `Type2` is not provided.")

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
					timing = 0,
					display = "Shield",
					group = "CrusadeBuffs_EnterSelfShield",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SHIELD",
						"CrusadeBuffs_EnterSelfShield",
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
all.CrusadeBuffs_EnergyDown = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyDown"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnergyUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))) do
					local cardvaluechange = global.CardCostEnchant(_env, "+", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyUp"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_NumericEffect_Type = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Type1 = externs.Type1

		assert(this.Type1 ~= nil, "External variable `Type1` is not provided.")

		this.Type2 = externs.Type2

		assert(this.Type2 ~= nil, "External variable `Type2` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

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

			if this.Type1 == "Attack" then
				this.Type1 = "ASSASSIN"
			elseif this.Type1 == "Defense" then
				this.Type1 = "WARRIOR"
			elseif this.Type1 == "Cure" then
				this.Type1 = "HEALER"
			elseif this.Type1 == "Aoe" then
				this.Type1 = "MAGE"
			elseif this.Type1 == "Summon" then
				this.Type1 = "SUMMONER"
			elseif this.Type1 == "Support" then
				this.Type1 = "LIGHT"
			elseif this.Type1 == "Curse" then
				this.Type1 = "DARK"
			end

			if this.Type2 == "Attack" then
				this.Type2 = "ASSASSIN"
			elseif this.Type2 == "Defense" then
				this.Type2 = "WARRIOR"
			elseif this.Type2 == "Cure" then
				this.Type2 = "HEALER"
			elseif this.Type2 == "Aoe" then
				this.Type2 = "MAGE"
			elseif this.Type2 == "Summon" then
				this.Type2 = "SUMMONER"
			elseif this.Type2 == "Support" then
				this.Type2 = "LIGHT"
			elseif this.Type2 == "Curse" then
				this.Type2 = "DARK"
			end

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, this.Type1)(_env, _env.ACTOR) or global.MARKED(_env, this.Type2)(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft3 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft4 = global.NumericEffect(_env, "+critrate", {
					"+Normal",
					"+Normal"
				}, this.CritRateFactor)
				local buffeft5 = global.NumericEffect(_env, "+blockrate", {
					"+Normal",
					"+Normal"
				}, this.BlockRateFactor)
				local buffeft6 = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, this.AbsorptionRateFactor)
				local buffeft7 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft8 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)
				local buffeft9 = global.NumericEffect(_env, "+curerate", {
					"+Normal",
					"+Normal"
				}, this.CureRateFactor)
				local buffeft10 = global.NumericEffect(_env, "+becuredrate", {
					"+Normal",
					"+Normal"
				}, this.BeCuredRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_NumericEffect_Type",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"CrusadeBuffs_NumericEffect_Type",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3,
					buffeft4,
					buffeft5,
					buffeft6,
					buffeft7,
					buffeft8,
					buffeft9,
					buffeft10
				})
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnterSelfShield_Type = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Type1 = externs.Type1

		assert(this.Type1 ~= nil, "External variable `Type1` is not provided.")

		this.Type2 = externs.Type2

		assert(this.Type2 ~= nil, "External variable `Type2` is not provided.")

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

			if this.Type1 == "Attack" then
				this.Type1 = "ASSASSIN"
			elseif this.Type1 == "Defense" then
				this.Type1 = "WARRIOR"
			elseif this.Type1 == "Cure" then
				this.Type1 = "HEALER"
			elseif this.Type1 == "Aoe" then
				this.Type1 = "MAGE"
			elseif this.Type1 == "Summon" then
				this.Type1 = "SUMMONER"
			elseif this.Type1 == "Support" then
				this.Type1 = "LIGHT"
			elseif this.Type1 == "Curse" then
				this.Type1 = "DARK"
			end

			if this.Type2 == "Attack" then
				this.Type2 = "ASSASSIN"
			elseif this.Type2 == "Defense" then
				this.Type2 = "WARRIOR"
			elseif this.Type2 == "Cure" then
				this.Type2 = "HEALER"
			elseif this.Type2 == "Aoe" then
				this.Type2 = "MAGE"
			elseif this.Type2 == "Summon" then
				this.Type2 = "SUMMONER"
			elseif this.Type2 == "Support" then
				this.Type2 = "LIGHT"
			elseif this.Type2 == "Curse" then
				this.Type2 = "DARK"
			end

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, this.Type1)(_env, _env.ACTOR) or global.MARKED(_env, this.Type2)(_env, _env.ACTOR) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "Shield",
					group = "CrusadeBuffs_EnterSelfShield_Type",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SHIELD",
						"CrusadeBuffs_EnterSelfShield_Type",
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
all.CrusadeBuffs_EnergyUp_Type = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Type1 = externs.Type1

		assert(this.Type1 ~= nil, "External variable `Type1` is not provided.")

		this.Type2 = externs.Type2

		assert(this.Type2 ~= nil, "External variable `Type2` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if this.Type1 == "Attack" then
				this.Type1 = "ASSASSIN"
			elseif this.Type1 == "Defense" then
				this.Type1 = "WARRIOR"
			elseif this.Type1 == "Cure" then
				this.Type1 = "HEALER"
			elseif this.Type1 == "Aoe" then
				this.Type1 = "MAGE"
			elseif this.Type1 == "Summon" then
				this.Type1 = "SUMMONER"
			elseif this.Type1 == "Support" then
				this.Type1 = "LIGHT"
			elseif this.Type1 == "Curse" then
				this.Type1 = "DARK"
			end

			if this.Type2 == "Attack" then
				this.Type2 = "ASSASSIN"
			elseif this.Type2 == "Defense" then
				this.Type2 = "WARRIOR"
			elseif this.Type2 == "Cure" then
				this.Type2 = "HEALER"
			elseif this.Type2 == "Aoe" then
				this.Type2 = "MAGE"
			elseif this.Type2 == "Summon" then
				this.Type2 = "SUMMONER"
			elseif this.Type2 == "Support" then
				this.Type2 = "LIGHT"
			elseif this.Type2 == "Curse" then
				this.Type2 = "DARK"
			end

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, this.Type1))) do
					local cardvaluechange = global.CardCostEnchant(_env, "+", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyUp_Type"
						}
					}, {
						cardvaluechange
					})
				end

				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, this.Type2))) do
					local cardvaluechange = global.CardCostEnchant(_env, "+", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyUp_Type"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnergyDown_Type = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Type1 = externs.Type1

		assert(this.Type1 ~= nil, "External variable `Type1` is not provided.")

		this.Type2 = externs.Type2

		assert(this.Type2 ~= nil, "External variable `Type2` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if this.Type1 == "Attack" then
				this.Type1 = "ASSASSIN"
			elseif this.Type1 == "Defense" then
				this.Type1 = "WARRIOR"
			elseif this.Type1 == "Cure" then
				this.Type1 = "HEALER"
			elseif this.Type1 == "Aoe" then
				this.Type1 = "MAGE"
			elseif this.Type1 == "Summon" then
				this.Type1 = "SUMMONER"
			elseif this.Type1 == "Support" then
				this.Type1 = "LIGHT"
			elseif this.Type1 == "Curse" then
				this.Type1 = "DARK"
			end

			if this.Type2 == "Attack" then
				this.Type2 = "ASSASSIN"
			elseif this.Type2 == "Defense" then
				this.Type2 = "WARRIOR"
			elseif this.Type2 == "Cure" then
				this.Type2 = "HEALER"
			elseif this.Type2 == "Aoe" then
				this.Type2 = "MAGE"
			elseif this.Type2 == "Summon" then
				this.Type2 = "SUMMONER"
			elseif this.Type2 == "Support" then
				this.Type2 = "LIGHT"
			elseif this.Type2 == "Curse" then
				this.Type2 = "DARK"
			end

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, this.Type1))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyDown_Type"
						}
					}, {
						cardvaluechange
					})
				end

				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, this.Type2))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyDown_Type"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_NumericEffect_Party = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Party = externs.Party

		assert(this.Party ~= nil, "External variable `Party` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, this.Party)(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft3 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft4 = global.NumericEffect(_env, "+critrate", {
					"+Normal",
					"+Normal"
				}, this.CritRateFactor)
				local buffeft5 = global.NumericEffect(_env, "+blockrate", {
					"+Normal",
					"+Normal"
				}, this.BlockRateFactor)
				local buffeft6 = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, this.AbsorptionRateFactor)
				local buffeft7 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft8 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)
				local buffeft9 = global.NumericEffect(_env, "+curerate", {
					"+Normal",
					"+Normal"
				}, this.CureRateFactor)
				local buffeft10 = global.NumericEffect(_env, "+becuredrate", {
					"+Normal",
					"+Normal"
				}, this.BeCuredRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_NumericEffect_Party",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"CrusadeBuffs_NumericEffect_Party",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3,
					buffeft4,
					buffeft5,
					buffeft6,
					buffeft7,
					buffeft8,
					buffeft9,
					buffeft10
				})
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnterSelfShield_Party = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Party = externs.Party

		assert(this.Party ~= nil, "External variable `Party` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, this.Party)(_env, _env.ACTOR) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "Shield",
					group = "CrusadeBuffs_EnterSelfShield_Party",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SHIELD",
						"CrusadeBuffs_EnterSelfShield_Party",
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
all.CrusadeBuffs_EnergyUp_Party = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Party = externs.Party

		assert(this.Party ~= nil, "External variable `Party` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, global.Type1))) do
					local cardvaluechange = global.CardCostEnchant(_env, "+", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyUp_Party"
						}
					}, {
						cardvaluechange
					})
				end

				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, global.Type2))) do
					local cardvaluechange = global.CardCostEnchant(_env, "+", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyUp_Party"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnergyDown_Party = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Party = externs.Party

		assert(this.Party ~= nil, "External variable `Party` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, global.Type1))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyDown_Party"
						}
					}, {
						cardvaluechange
					})
				end

				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, global.Type2))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyDown_Party"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_NumericEffect_HigherThanX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Energy = externs.Energy

		assert(this.Energy ~= nil, "External variable `Energy` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif this.Energy < global.GetCost(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft3 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft4 = global.NumericEffect(_env, "+critrate", {
					"+Normal",
					"+Normal"
				}, this.CritRateFactor)
				local buffeft5 = global.NumericEffect(_env, "+blockrate", {
					"+Normal",
					"+Normal"
				}, this.BlockRateFactor)
				local buffeft6 = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, this.AbsorptionRateFactor)
				local buffeft7 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft8 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)
				local buffeft9 = global.NumericEffect(_env, "+curerate", {
					"+Normal",
					"+Normal"
				}, this.CureRateFactor)
				local buffeft10 = global.NumericEffect(_env, "+becuredrate", {
					"+Normal",
					"+Normal"
				}, this.BeCuredRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_NumericEffect_HigherThanX",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"CrusadeBuffs_NumericEffect_HigherThanX",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3,
					buffeft4,
					buffeft5,
					buffeft6,
					buffeft7,
					buffeft8,
					buffeft9,
					buffeft10
				})
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnergyUp_HigherThanX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Energy = externs.Energy

		assert(this.Energy ~= nil, "External variable `Energy` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_COST_GE(_env, this.Energy + 1))) do
					local cardvaluechange = global.CardCostEnchant(_env, "+", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyUp_HigherThanX"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnergyDown_HigherThanX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Energy = externs.Energy

		assert(this.Energy ~= nil, "External variable `Energy` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_COST_GE(_env, this.Energy + 1))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyDown_HigherThanX"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_NumericEffect_LowerThanX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Energy = externs.Energy

		assert(this.Energy ~= nil, "External variable `Energy` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.GetCost(_env, _env.ACTOR) < this.Energy then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft3 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft4 = global.NumericEffect(_env, "+critrate", {
					"+Normal",
					"+Normal"
				}, this.CritRateFactor)
				local buffeft5 = global.NumericEffect(_env, "+blockrate", {
					"+Normal",
					"+Normal"
				}, this.BlockRateFactor)
				local buffeft6 = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, this.AbsorptionRateFactor)
				local buffeft7 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft8 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)
				local buffeft9 = global.NumericEffect(_env, "+curerate", {
					"+Normal",
					"+Normal"
				}, this.CureRateFactor)
				local buffeft10 = global.NumericEffect(_env, "+becuredrate", {
					"+Normal",
					"+Normal"
				}, this.BeCuredRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeBuffs_NumericEffect_LowerThanX",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"CrusadeBuffs_NumericEffect_LowerThanX",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3,
					buffeft4,
					buffeft5,
					buffeft6,
					buffeft7,
					buffeft8,
					buffeft9,
					buffeft10
				})
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnergyUp_LowerThanX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Energy = externs.Energy

		assert(this.Energy ~= nil, "External variable `Energy` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_COST_LE(_env, this.Energy - 1))) do
					local cardvaluechange = global.CardCostEnchant(_env, "+", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyUp_LowerThanX"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnergyDown_LowerThanX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Energy = externs.Energy

		assert(this.Energy ~= nil, "External variable `Energy` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_COST_LE(_env, this.Energy - 1))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyDown_LowerThanX"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_AfterActHurtRateUp_LowerThan14 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.GetCost(_env, _env.ACTOR) < 14 then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "HurtRateUp",
					group = "CrusadeBuffs_AfterActHurtRateUp_LowerThan14",
					duration = 99,
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
all.CrusadeBuffs_NumericEffect_Master = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Master = externs.Master

		assert(this.Master ~= nil, "External variable `Master` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) and global.MARKED(_env, this.Master)(_env, _env.ACTOR) then
				local cards = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))

				for _, card in global.__iter__(cards) do
					local buffeft1 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.AtkRateFactor)
					local buffeft2 = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, this.DefRateFactor)
					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
					local buffeft3 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
					local buffeft4 = global.NumericEffect(_env, "+critrate", {
						"+Normal",
						"+Normal"
					}, this.CritRateFactor)
					local buffeft5 = global.NumericEffect(_env, "+blockrate", {
						"+Normal",
						"+Normal"
					}, this.BlockRateFactor)
					local buffeft6 = global.NumericEffect(_env, "+absorption", {
						"+Normal",
						"+Normal"
					}, this.AbsorptionRateFactor)
					local buffeft7 = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.HurtRateFactor)
					local buffeft8 = global.NumericEffect(_env, "+unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.UnHurtRateFactor)
					local buffeft9 = global.NumericEffect(_env, "+curerate", {
						"+Normal",
						"+Normal"
					}, this.CureRateFactor)
					local buffeft10 = global.NumericEffect(_env, "+becuredrate", {
						"+Normal",
						"+Normal"
					}, this.BeCuredRateFactor)

					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
						duration = 99,
						group = "CrusadeBuffs_NumericEffect_Master",
						timing = 0,
						limit = 1,
						tags = {
							"CARDBUFF",
							"CrusadeBuffs_NumericEffect_Master",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1,
						buffeft2,
						buffeft3,
						buffeft4,
						buffeft5,
						buffeft6,
						buffeft7,
						buffeft8,
						buffeft9,
						buffeft10
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnergyUp_Master = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Master = externs.Master

		assert(this.Master ~= nil, "External variable `Master` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) and global.MARKED(_env, this.Master)(_env, _env.ACTOR) then
				local cards = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))

				for _, card in global.__iter__(cards) do
					local cardvaluechange = global.CardCostEnchant(_env, "+", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyUp_Master"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeBuffs_EnergyDown_Master = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Master = externs.Master

		assert(this.Master ~= nil, "External variable `Master` is not provided.")

		this.EnergyFactor = externs.EnergyFactor

		assert(this.EnergyFactor ~= nil, "External variable `EnergyFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) and global.MARKED(_env, this.Master)(_env, _env.ACTOR) then
				local cards = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))

				for _, card in global.__iter__(cards) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyDown_Master"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}

return _M
