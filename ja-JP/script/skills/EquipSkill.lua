local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.EquipSkill_Weapon_15001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ImmuneTime = externs.ImmuneTime

		if this.ImmuneTime == nil then
			this.ImmuneTime = 20
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive1)

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
			local buffeft1 = global.Immune(_env)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DEBUFF"))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 4,
				display = "Immune",
				duration = this.ImmuneTime,
				tags = {
					"NUMERIC",
					"BUFF",
					"IMMUNE",
					"DISPELLABLE",
					"STEALABLE",
					"UR_EQUIPMENT",
					"DURANDAL"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.ProbFactor = externs.ProbFactor

		if this.ProbFactor == nil then
			this.ProbFactor = 0.25
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
			local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15002",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft
			}, 1)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNIQUE_HURTRATEUP", "EquipSkill_Weapon_15002", "UNDISPELLABLE", "UNSTEALABLE"), 99)

			if global.ProbTest(_env, this.ProbFactor) then
				global.ApplyRPRecovery(_env, _env.ACTOR, 1000)
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 500
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15003_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"EquipSkill_Weapon_15003_biaozhi"
				}
			}, {
				buffeft
			}, 1)
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15003_biaozhi")) > 0 then
				local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.UniqueDamageFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNIQUE_HURTRATEUP",
						"EquipSkill_Weapon_15003",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNIQUE_HURTRATEUP", "EquipSkill_Weapon_15003", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15003_biaozhi"), 99)
			global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15004 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.35
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetPlayerEnergy(_env) >= 2 then
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.primTrgt)
				local buffeft1 = global.NumericEffect(_env, "-atk", {
					"+Normal",
					"+Normal"
				}, atk * this.AtkRateFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.primTrgt, {
					timing = 2,
					display = "AtkDown",
					group = "EquipSkill_Weapon_15004_Down",
					duration = 2,
					limit = 1,
					tags = {
						"NUMERIC",
						"DEBUFF",
						"ATKDOWN",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
				}, 1, 0)

				local buffeft2 = global.NumericEffect(_env, "+atk", {
					"+Normal",
					"+Normal"
				}, atk * this.AtkRateFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 2,
					display = "AtkUp",
					group = "EquipSkill_Weapon_15004_Up",
					duration = 2,
					limit = 1,
					tags = {
						"NUMERIC",
						"DEBUFF",
						"ATKUP",
						"UNDISPELLABLE"
					}
				}, {
					buffeft2
				}, 1, 0)
				global.ApplyEnergyDamage(_env, global.GetOwner(_env, _env.ACTOR), 2)
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldEffect = externs.ShieldEffect

		if this.ShieldEffect == nil then
			this.ShieldEffect = 0.4
		end

		this.DamageDeFactor = externs.DamageDeFactor

		if this.DamageDeFactor == nil then
			this.DamageDeFactor = 0.4
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+shield_effect", {
				"?Normal"
			}, this.ShieldEffect)
			local buffeft2 = global.SpecialNumericEffect(_env, "+Mage_DmgExtra_unhurtrate", {
				"?Normal"
			}, this.DamageDeFactor)
			local buffeft3 = global.SpecialNumericEffect(_env, "+Assassin_DmgExtra_unhurtrate", {
				"?Normal"
			}, this.DamageDeFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"EquipSkill_Weapon_15005"
				}
			}, {
				buffeft1,
				buffeft2,
				buffeft3
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.15
		end

		this.AbsorptionFactor = externs.AbsorptionFactor

		if this.AbsorptionFactor == nil then
			this.AbsorptionFactor = 0.3
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15006_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"EquipSkill_Weapon_15006_biaozhi"
				}
			}, {
				buffeft
			}, 1)

			local buffeft2 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbsorptionFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_ABSORPTIONUP",
					"EquipSkill_Weapon_15006",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			}, 1)
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15006_biaozhi")) > 0 then
				local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.DamageFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNIQUE_HURTRATEUP",
						"EquipSkill_Weapon_15006",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNIQUE_HURTRATEUP", "EquipSkill_Weapon_15006", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15006_biaozhi"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15007_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"EquipSkill_Weapon_15007_biaozhi"
				}
			}, {
				buffeft
			}, 1)
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15007_biaozhi")) > 0 then
				local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.DamageFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNIQUE_HURTRATEUP",
						"EquipSkill_Weapon_15006",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local buffeft1 = global.HPPeriodDamage(_env, "Poison", attacker.atk * 0.6, 1)
				local buffeft2 = global.Curse(_env)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
					timing = 1,
					display = "Poison",
					group = "CURSE",
					duration = 2,
					limit = 1,
					tags = {
						"STATUS",
						"DEBUFF",
						"CURSE",
						"DISPELLABLE",
						"ABNORMAL"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1, 0)
			end

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNIQUE_HURTRATEUP", "EquipSkill_Weapon_15007", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15007_biaozhi"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15007_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"EquipSkill_Weapon_15007_biaozhi"
				}
			}, {
				buffeft
			}, 1)
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15007_biaozhi")) > 0 then
				local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.DamageFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNIQUE_HURTRATEUP",
						"EquipSkill_Weapon_15007",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local buffeft1 = global.HPPeriodDamage(_env, "Poison", attacker.atk * 0.6, 1)
				local buffeft2 = global.Curse(_env)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
					timing = 1,
					display = "Poison",
					group = "CURSE",
					duration = 2,
					limit = 1,
					tags = {
						"STATUS",
						"DEBUFF",
						"CURSE",
						"DISPELLABLE",
						"POISON",
						"ABNORMAL"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1, 0)
			end

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNIQUE_HURTRATEUP", "EquipSkill_Weapon_15007", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15007_biaozhi"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15008 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15008_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"EquipSkill_Weapon_15008_biaozhi"
				}
			}, {
				buffeft
			}, 1)
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
			local buffeft2 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.DamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15008",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft2
			}, 1)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNIQUE_HURTRATEUP", "EquipSkill_Weapon_15008", "UNDISPELLABLE", "UNSTEALABLE"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15009 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.2
		end

		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount_Unit(_env, global.EnemyUnits(_env), "MURDERER") > 0 then
				local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft2_up = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15009_show", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Weapon_15009_biaozhi_1",
					timing = 0,
					limit = 1,
					tags = {
						"EquipSkill_Weapon_15009_biaozhi",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"HURTRATEUP"
					}
				}, {
					buffeft2
				}, 1)
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15009_biaozhi", "UNHURTRATEUP"), 99)
			end

			if global.SelectBuffCount_Unit(_env, global.EnemyUnits(_env), "MURDERER") == 0 then
				local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)
				local buffeft1_up = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15008_show", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Weapon_15009_biaozhi_2",
					timing = 0,
					limit = 1,
					tags = {
						"EquipSkill_Weapon_15009_biaozhi",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"UNHURTRATEUP"
					}
				}, {
					buffeft1
				}, 1)
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15009_biaozhi", "HURTRATEUP"), 99)
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

			if global.SelectBuffCount_Unit(_env, global.EnemyUnits(_env), "MURDERER") > 0 then
				local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Weapon_15009_biaozhi_1",
					timing = 0,
					limit = 1,
					tags = {
						"EquipSkill_Weapon_15009_biaozhi",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"HURTRATEUP"
					}
				}, {
					buffeft2
				}, 1)
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15009_biaozhi", "UNHURTRATEUP"), 99)
			end

			if global.SelectBuffCount_Unit(_env, global.EnemyUnits(_env), "MURDERER") == 0 then
				local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Weapon_15009_biaozhi_2",
					timing = 0,
					limit = 1,
					tags = {
						"EquipSkill_Weapon_15009_biaozhi",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"UNHURTRATEUP"
					}
				}, {
					buffeft1
				}, 1)
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15009_biaozhi", "HURTRATEUP"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15101_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.FirstFactor = 1
		this.SecondFactor = 0.4
		this.scount = 0
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15101_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"EquipSkill_Weapon_15101_biaozhi"
				}
			}, {
				buffeft
			}, 1)

			local buffeft1 = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15101_First", {
				"+Normal",
				"+Normal"
			}, this.FirstFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15101_Second", {
				"+Normal",
				"+Normal"
			}, this.SecondFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"EquipSkill_Weapon_15101"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1)
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
			local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15101",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				global.buffeft2
			}, 1)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNIQUE_HURTRATEUP", "EquipSkill_Weapon_15101", "UNDISPELLABLE", "UNSTEALABLE"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15102_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 300
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.4
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15102_2_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_15102_2",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft
			}, 1)
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
			local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15102_2",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft
			}, 1)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15102_2"), 99)

			local hpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR)
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

			if hpRatio < 0.4 then
				global.ApplyHPRecovery(_env, _env.ACTOR, maxHp * this.HealRateFactor)
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15103_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 350
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_FINDTARGET"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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

			if global.SpecialPropGetter(_env, "EquipSkill_Weapon_15103_3_check")(_env, global.FriendField(_env)) < 2 then
				local count = 0

				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "TAUNT")) > 0 then
						count = count + 1

						global.ApplyRPDamage(_env, unit, this.RageFactor)

						break
					end
				end

				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					if global.MASTER(_env, unit) and count == 0 then
						local buff_taunt_2 = global.Taunt(_env)

						global.ApplyBuff(_env, global.EnemyMaster(_env), {
							timing = 4,
							duration = 0.1,
							tags = {
								"NUMERIC",
								"BUFF",
								"TAUNT",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"EquipSkill_Weapon_15103_3_Taunt"
							}
						}, {
							buff_taunt_2
						}, 1)
						global.ApplyRPDamage(_env, global.EnemyMaster(_env), this.RageFactor)
					end
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15103_3",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft
			}, 1)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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
			local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15103_3_check", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft
			}, 1)
			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15103_3"), 99)

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15103_3_Taunt"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15104_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpFactor = externs.MaxHpFactor

		if this.MaxHpFactor == nil then
			this.MaxHpFactor = 0.15
		end

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.HAS_SUMMONER(_env, _env.ACTOR)(_env, _env.unit) then
				local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15104_1_check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)

				local buff = global.PassiveFunEffectBuff(_env, "EquipSkill_Weapon_15104_1_Passive", {
					MaxHpFactor = this.MaxHpFactor
				})

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15104_1_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpFactor = externs.MaxHpFactor

		if this.MaxHpFactor == nil then
			this.MaxHpFactor = 0.15
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			500
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_ACTION"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.primTrgt) == false and global.SpecialPropGetter(_env, "EquipSkill_Weapon_15104_1_check")(_env, _env.ACTOR) > 0 then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.primTrgt)

				global.ApplyHPDamage(_env, _env.primTrgt, maxHp * this.MaxHpFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15105_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.3
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15105_2",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft2 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "Shield",
				group = "EquipSkill_Weapon_15105_2",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"DISPELLABLE",
					"STEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft2
			})
			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "DEBUFF", "DISPELLABLE"), 1)
			global.DispelBuff(_env, global.FriendMaster(_env), global.BUFF_MARKED_ALL(_env, "DEBUFF", "DISPELLABLE"), 1)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15105_2"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15106_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CureRateFactor = externs.CureRateFactor

		if this.CureRateFactor == nil then
			this.CureRateFactor = 0.15
		end

		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 150
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+LowerHp_HealExtra_RatioCheck", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft2 = global.SpecialNumericEffect(_env, "+LowerHp_HealExtra_ExtraRate", {
				"+Normal",
				"+Normal"
			}, this.CureRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_15106_3",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Weapon_15106_3"
				}
			}, {
				buffeft1,
				buffeft2
			})

			for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS - global.SUMMONS)) do
				if global.MASTER(_env, unit) == false then
					local buffeft3 = global.SpecialNumericEffect(_env, "+BeCuredRage", {
						"+Normal",
						"+Normal"
					}, this.RageFactor)

					global.ApplyBuff(_env, unit, {
						timing = 0,
						duration = 99,
						tags = {
							"NUMERIC",
							"BUFF",
							"EquipSkill_Weapon_15106_3",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"UR_EQUIPMENT"
						}
					}, {
						buffeft3
					})
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15106_3"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15107_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			2000
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15107_1",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			})

			local HpRatioFactor = global.UnitPropGetter(_env, "hpRatio")(_env, _env.primTrgt)
			local Energy = 2

			if HpRatioFactor > 0.5 and global.SpecialPropGetter(_env, "EquipSkill_Weapon_15107_1")(_env, global.FriendField(_env)) < 2 then
				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), Energy)

				local buffeft2 = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_15107_1", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15107_1"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15108_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive3)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15108_2",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15108_2"), 99)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+LowerHpCheckRate", {
				"+Normal",
				"+Normal"
			}, 0.5)
			local buffeft2 = global.SpecialNumericEffect(_env, "+LowerHp_DmgExtra_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_15108_2",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1,
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15109_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AttackFactor = externs.AttackFactor

		if this.AttackFactor == nil then
			this.AttackFactor = 0.1
		end

		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.1
		end

		this.CritRateFactor = externs.CritRateFactor

		if this.CritRateFactor == nil then
			this.CritRateFactor = 0.1
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AttackFactor)
			local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, this.DamageFactor)
			local buffeft3 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"ATKRATEUP",
					"HURTRATEUP",
					"CRITRATEUP",
					"EquipSkill_Weapon_15109",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1,
				buffeft2,
				buffeft3
			}, 1)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15110_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.05
		end

		local passive0 = __action(this, {
			name = "passive0",
			entry = prototype.passive0
		})
		passive0 = global["[duration]"](this, {
			0
		}, passive0)
		this.passive0 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive0)
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
	passive0 = function (_env, externs)
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+weapon_15110_1", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_15110_1",
				timing = 0,
				limit = 1,
				tags = {
					"DEBUFF",
					"EquipSkill_Weapon_15110_1_UnHurtCheck",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15110_1",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15110_1"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15111_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefWeakenFactor = externs.DefWeakenFactor

		if this.DefWeakenFactor == nil then
			this.DefWeakenFactor = 0.12
		end

		this.UnHurtRateDownFactor = externs.UnHurtRateDownFactor

		if this.UnHurtRateDownFactor == nil then
			this.UnHurtRateDownFactor = 0.12
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+singleweaken", {
				"+Normal",
				"+Normal"
			}, this.DefWeakenFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+singleunhurtratedown", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateDownFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_15111_2",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Weapon_15111_2"
				}
			}, {
				buffeft1,
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15112_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15112_3",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.primTrgt)
			local hp = global.UnitPropGetter(_env, "hp")(_env, _env.primTrgt)
			local hl = maxHp - hp
			local damage1 = hl * 0.35
			local damage2 = 1.6 * global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local realDamage = damage1

			if damage2 < damage1 then
				realDamage = damage2
			end

			global.ApplyHPDamage(_env, _env.primTrgt, realDamage)
			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15112_3"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15113_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15113_1",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15113_1"), 99)
		end)

		return _env
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+aoecritsplitrate", {
				"+Normal",
				"+Normal"
			}, 0.4)
			local buffeft2 = global.SpecialNumericEffect(_env, "+singlecritsplitrate", {
				"+Normal",
				"+Normal"
			}, 0.4)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_15113_1",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15114_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15108_2",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15114_2"), 99)

			if _env.primTrgt then
				local Shield = 0.2 * global.UnitPropGetter(_env, "shield")(_env, _env.ACTOR)

				if Shield then
					global.ApplyHPDamage(_env, _env.primTrgt, Shield)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15115_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.05
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:BEFORE_ACTION"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
		}, passive4)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local NokoriHp = 1 - global.UnitPropGetter(_env, "hpRatio")(_env, _env.primTrgt)
			local DmgUpFactor = global.floor(_env, NokoriHp / 0.2)
			local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, DmgUpFactor * this.HurtRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"EquipSkill_Weapon_15115_3",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15115_3"), 99)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local NokoriHp = 1 - global.UnitPropGetter(_env, "hpRatio")(_env, _env.primTrgt)
			local DmgUpFactor = global.floor(_env, NokoriHp / 0.2)
			local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, DmgUpFactor * this.HurtRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"EquipSkill_Weapon_15115_3",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end,
	passive4 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15115_3"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15116_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.05
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_BEKILLED"
		}, passive1)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.actor = externs.actor

		assert(_env.actor ~= nil, "External variable `actor` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and _env.actor == _env.ACTOR then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 3,
					group = "EquipSkill_Weapon_15116_1",
					timing = 1,
					limit = 5,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNIQUE_HURTRATEUP",
						"EquipSkill_Weapon_15116_1",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15117_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AttackFactor = externs.AttackFactor

		if this.AttackFactor == nil then
			this.AttackFactor = 0.1
		end

		this.MaxHpFactor = externs.MaxHpFactor

		if this.MaxHpFactor == nil then
			this.MaxHpFactor = 0.1
		end

		this.CureShieldEffectFactor = externs.CureShieldEffectFactor

		if this.CureShieldEffectFactor == nil then
			this.CureShieldEffectFactor = 0.1
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AttackFactor)
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft2 = global.MaxHpEffect(_env, maxHp * this.MaxHpFactor)
			local buffeft3 = global.NumericEffect(_env, "+curerate_weapon_15117_2", {
				"+Normal",
				"+Normal"
			}, this.CureShieldEffectFactor)
			local buffeft4 = global.SpecialNumericEffect(_env, "+shield_effect", {
				"?Normal"
			}, this.CureShieldEffectFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"EquipSkill_Weapon_15117_2",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1,
				buffeft2,
				buffeft3,
				buffeft4
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15118_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = 0.4
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+shield_effect", {
				"?Normal"
			}, this.ShieldRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"EquipSkill_Weapon_15118_3",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15119_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		local passive0 = __action(this, {
			name = "passive0",
			entry = prototype.passive0
		})
		passive0 = global["[duration]"](this, {
			0
		}, passive0)
		this.passive0 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive0)
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_BEKILLED"
		}, passive3)

		return this
	end,
	passive0 = function (_env, externs)
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+weapon_15119_1_check", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"EquipSkill_Weapon_15119_1_Check",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15119_1",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15119_1"), 99)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.actor = externs.actor

		assert(_env.actor ~= nil, "External variable `actor` is not provided.")

		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.actor == _env.ACTOR then
				local buffeft1 = global.SpecialNumericEffect(_env, "+weapon_15119_1", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff_Buff(_env, _env.ACTOR, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				}, 1)

				if global.SpecialPropGetter(_env, "weapon_15119_1")(_env, global.FriendField(_env)) % 3 == 0 and global.EnemyMaster(_env) then
					global.ApplyHPDamage(_env, global.EnemyMaster(_env), global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR) * 1.2)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15120_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.CureFactor = externs.CureFactor

		if this.CureFactor == nil then
			this.CureFactor = 0.2
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+weapon_15120_2", {
				"+Normal",
				"+Normal"
			}, this.CureFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15120_2",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1, 1)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15120_2"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15121_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.AtkFactor = externs.AtkFactor

		if this.AtkFactor == nil then
			this.AtkFactor = 0.2
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15121_3",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)

			local count = global.SpecialNumericEffect(_env, "+weapon_15121_3_count", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"Weapon_15121_3_Count",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				count
			})

			if global.SpecialPropGetter(_env, "weapon_15121_3_count")(_env, global.FriendField(_env)) == 1 then
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"EquipSkill_Weapon_15121_3",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15121_3"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15122_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.CritRateFactor = externs.CritRateFactor

		if this.CritRateFactor == nil then
			this.CritRateFactor = 0.2
		end

		this.CritStrgFactor = externs.CritStrgFactor

		if this.CritStrgFactor == nil then
			this.CritStrgFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive3)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15122_1_Uni",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15122_1_Uni"), 99)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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
			local Critrate = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)
			local Critstrg = global.NumericEffect(_env, "+critstrg", {
				"+Normal",
				"+Normal"
			}, this.CritStrgFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15121",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				Critrate
			})
			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15121",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				Critstrg
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15123_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueShieldFactor = externs.UniqueShieldFactor

		if this.UniqueShieldFactor == nil then
			this.UniqueShieldFactor = 0.25
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_CANCELED"
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_ENDED"
		}, passive4)
		local passive5 = __action(this, {
			name = "passive5",
			entry = prototype.passive5
		})
		passive5 = global["[duration]"](this, {
			0
		}, passive5)
		this.passive5 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive5)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+shield_effect", {
				"?Normal"
			}, this.UniqueShieldFactor)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "MUTE"))
			local buffeft3 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "CURSE"))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_SHIELD",
					"EquipSkill_Weapon_15123_2_Uni",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					tags = {
						"BUFF",
						"EquipSkill_Weapon_15123_2",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})
				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					tags = {
						"BUFF",
						"EquipSkill_Weapon_15123_2",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft3
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

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15123_2_Uni"), 99)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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
			local buffeft1 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "MUTE"))
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "CURSE"))

			if global.GetSide(_env, _env.ACTOR) == global.GetSide(_env, _env.unit) and global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "BAOHUZHAO", "BLTu_Unique")) > 0 then
				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"BUFF",
						"EquipSkill_Weapon_15123_2",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"BUFF",
						"EquipSkill_Weapon_15123_2",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "BLTu_Unique_Check") then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15123_2"), 99)
				end
			end
		end)

		return _env
	end,
	passive5 = function (_env, externs)
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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15123_2"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15124_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.05
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive1)

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
			local hurtrate = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "HurtRateUp",
				group = "EquipSkill_Weapon_15124_3",
				duration = 99,
				limit = 5,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				hurtrate
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15125_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15125_1_Uni",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15125_1_Uni"), 99)

			local wolfs = global.FriendUnits(_env, global.SUMMONS * global.HASSTATUS(_env, "SummonedXHMao"))
			local buffeft1 = global.Diligent(_env)

			for _, wolf in global.__iter__(wolfs) do
				global.ApplyBuff(_env, wolf, {
					timing = 2,
					duration = 1,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			global.DiligentRound(_env)
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15126_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UniqueDamageFactor = externs.UniqueDamageFactor

		if this.UniqueDamageFactor == nil then
			this.UniqueDamageFactor = 0.15
		end

		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.1
		end

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.1
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
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
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive3)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.UniqueDamageFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Weapon_15126_2_Uni",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15126_2_Uni"), 99)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SUMMONS(_env, _env.unit) and global.GetSummoner(_env, _env.unit) == _env.ACTOR then
				local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "UnHurtRateUp",
					tags = {
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})

				local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "HurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15127_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.15
		end

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SUMMONS(_env, _env.unit) and global.GetSummoner(_env, _env.unit) == _env.ACTOR then
				local buffeft1 = global.PassiveFunEffectBuff(_env, "EquipSkill_Weapon_15127_3_Passive")

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})

				local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "HurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_15127_3_Passive = {
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
			"SELF:AFTER_ACTION"
		}, passive)
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive1)

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

			global.KillTarget(_env, _env.ACTOR)
		end)

		return _env
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

			global.KillTarget(_env, _env.ACTOR)
		end)

		return _env
	end
}
all.EquipSkill_Armor_15001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.3
		end

		this.MaxCount = externs.MaxCount

		if this.MaxCount == nil then
			this.MaxCount = 5
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:HURTED"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive3)

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
			local buff_hurt = global.SpecialNumericEffect(_env, "+hurt_lionheart", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15001",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"LIONHEART",
					"HURTED"
				}
			}, {
				buff_hurt
			})
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local hurt_lionheart = global.SpecialPropGetter(_env, "hurt_lionheart")(_env, _env.ACTOR)

				if hurt_lionheart and hurt_lionheart ~= 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "LIONHEART", "HURTED"), 99)
				end
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local hurt_lionheart = global.SpecialPropGetter(_env, "hurt_lionheart")(_env, _env.ACTOR)

				if hurt_lionheart and hurt_lionheart ~= 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "LIONHEART", "HURTED"), 99)

					local count_lionheart = global.SpecialPropGetter(_env, "count_lionheart")(_env, _env.ACTOR)

					if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UR_EQUIPMENT", "LIONHEART", "COUNT")) < this.MaxCount then
						local buff_count = global.SpecialNumericEffect(_env, "+count_lionheart", {
							"+Normal",
							"+Normal"
						}, 1)

						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 0,
							duration = 99,
							tags = {
								"NUMERIC",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"UR_EQUIPMENT",
								"LIONHEART",
								"COUNT"
							}
						}, {
							buff_count
						})

						local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

						global.ApplyHPRecovery(_env, _env.ACTOR, maxHp * this.HealRateFactor)
					end
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BlockRateFactor = externs.BlockRateFactor

		if this.BlockRateFactor == nil then
			this.BlockRateFactor = 0.4
		end

		this.BlockStrgFactor = externs.BlockStrgFactor

		if this.BlockStrgFactor == nil then
			this.BlockStrgFactor = 0.2
		end

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
			local buffeft1 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+blockstrg", {
				"+Normal",
				"+Normal"
			}, this.BlockStrgFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "BlockRateUp",
				group = "EquipSkill_Armor_15002_1",
				duration = 99,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"BLOCKRATEUP",
					"EquipSkill_Accesory_15003",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "BlockStrgUp",
				group = "EquipSkill_Armor_15002_2",
				duration = 99,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"BLOCKSTRGUP",
					"EquipSkill_Accesory_15003",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			}, 1, 0)
		end)

		return _env
	end
}
all.EquipSkill_Armor_15003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 300
		end

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

			if global.SpecialPropGetter(_env, "equip_armor_15003")(_env, _env.ACTOR) < 3 then
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RpFactor)

				local buff_hurt = global.SpecialNumericEffect(_env, "+equip_armor_15003", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Armor_15003",
						"HURTED"
					}
				}, {
					buff_hurt
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15004 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.25
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:BUFF_APPLYED"
		}, passive)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_BROKED"
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_CANCELED"
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_STEALED"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_ENDED"
		}, passive2)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "SHIELD") then
				local buff = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					display = "UnHurtRateUp",
					group = "EquipSkill_Armor_15004",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Armor_15004"
					}
				}, {
					buff
				}, 1, 0)
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

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "SHIELD") then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15004"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpFactor = externs.MaxHpFactor

		assert(this.MaxHpFactor ~= nil, "External variable `MaxHpFactor` is not provided.")

		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BUFF_BROKED"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
		}, passive2)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "SHIELD") then
				local shield = global.UnitPropGetter(_env, "shield")(_env, _env.ACTOR)

				if shield == 0 then
					local buff_check = global.SpecialNumericEffect(_env, "+Shield_Broked", {
						"+Normal",
						"+Normal"
					}, 1)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "Shield_Broked",
						timing = 0,
						limit = 1,
						tags = {
							"Shield_Broked"
						}
					}, {
						buff_check
					})
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Shield_Broked")) > 0 then
				local shield = global.UnitPropGetter(_env, "shield")(_env, _env.ACTOR)

				if shield == 0 then
					local buff_count = global.SpecialNumericEffect(_env, "+EquipSkill_Armor_15005_count", {
						"+Normal",
						"+Normal"
					}, 1)
					local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.RateFactor)
					local buffeft3 = global.NumericEffect(_env, "+unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.RateFactor)

					if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_15005_count", "COUNT")) < 3 then
						local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

						global.ApplyHPRecovery(_env, _env.ACTOR, maxHp * this.MaxHpFactor)
						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 0,
							duration = 99,
							tags = {
								"EquipSkill_Armor_15005_count",
								"COUNT"
							}
						}, {
							buff_count
						})
						global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
							timing = 0,
							duration = 99,
							display = "HurtRateUp",
							tags = {
								"NUMERIC",
								"BUFF",
								"DISPELLABLE",
								"STEALABLE",
								"UR_EQUIPMENT",
								"EquipSkill_Armor_15005"
							}
						}, {
							buffeft2
						}, 1, 0)
						global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
							timing = 0,
							duration = 99,
							display = "UnHurtRateUp",
							tags = {
								"NUMERIC",
								"BUFF",
								"DISPELLABLE",
								"STEALABLE",
								"UR_EQUIPMENT",
								"EquipSkill_Armor_15005"
							}
						}, {
							buffeft3
						}, 1, 0)
					end
				end
			end

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Shield_Broked"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Armor_15006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MoreRage = externs.MoreRage

		if this.MoreRage == nil then
			this.MoreRage = 240
		end

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
			local buff = global.SpecialNumericEffect(_env, "+rage_morerage_down", {
				"+Normal",
				"+Normal"
			}, this.MoreRage)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15006",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"EquipSkill_Armor_15006",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "RPDOWN_APPLYED")) > 0 then
				local buff = global.SpecialNumericEffect(_env, "+morerage_count", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"MORERAGECOUNT"
					}
				}, {
					buff
				})
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "RPDOWN_APPLYED"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Energy = externs.Energy

		if this.Energy == nil then
			this.Energy = 5
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_UNIQUE"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_ACTION"
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

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and _env.primTrgt == _env.ACTOR and global.GetCost(_env, _env.ACTOR) >= 15 and global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "UR_EQUIPMENT", "count_Armor_15007", "COUNT")) < 1 then
				local buff_hurt = global.SpecialNumericEffect(_env, "+hurt_Armor_15007", {
					"+Normal",
					"+Normal"
				}, this.Energy)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Armor_15007",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Armor_15007",
						"HURTED"
					}
				}, {
					buff_hurt
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and _env.primTrgt == _env.ACTOR and global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "UR_EQUIPMENT", "EquipSkill_Armor_15007", "HURTED")) < 1 then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15007", "HURTED"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15008 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpFactor = externs.HpFactor

		if this.HpFactor == nil then
			this.HpFactor = 0.08
		end

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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:HURTED"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_UNIQUE"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_ACTION"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[schedule_in_cycles]"](this, {
			1000
		}, passive4)

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
			local Armor_15008_count = global.SpecialNumericEffect(_env, "+equip_armor_15008_COUNT", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Armor_15008_COUNT"
				}
			}, {
				Armor_15008_count
			})
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
			local hpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR)
			local Armor_15008_flag = global.SpecialNumericEffect(_env, "+Armor_15008_flag", {
				"+Normal",
				"+Normal"
			}, 1)

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Armor_15008_COUNT")) > 0 and hpRatio <= 0.4 then
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Armor_15008_FLAG"
					}
				}, {
					Armor_15008_flag
				})
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_15008_COUNT"), 99)
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Armor_15008_FLAG")) > 0 then
				if global.UnitPropGetter(_env, "rp")(_env, _env.ACTOR) == 1000 then
					global.ApplyRPDamage(_env, _env.ACTOR, 1)
				end

				local buffeft2 = global.Daze(_env)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 4,
					duration = 12,
					display = "Freeze",
					tags = {
						"STATUS",
						"DEBUFF",
						"FREEZE",
						"ABNORMAL",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Armor_15008_FREEZE"
					}
				}, {
					buffeft2
				})
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_15008_FLAG"), 99)
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Armor_15008_FREEZE")) > 0 then
				global.ApplyHPRecovery(_env, _env.ACTOR, maxHp * this.HpFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15009 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.2
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local buff_check = global.SpecialNumericEffect(_env, "+EquipSkill_Armor_15009", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Armor_15009_check"
				}
			}, {
				buff_check
			})

			if global.SpecialPropGetter(_env, "EquipSkill_Armor_15009")(_env, global.FriendField(_env)) == 1 then
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "EquipSkill_Armor_15009",
					group = "EquipSkill_Armor_15009",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})

				local buff_self = global.PassiveFunEffectBuff(_env, "EquipSkill_Armor_15009_UnhurtRate", {
					UnHurtRateFactor = this.UnHurtRateFactor
				})

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Armor_15009_self",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buff_self
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15009_UnhurtRate = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.2
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:TRANSFORM"
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
			local units = global.RandomN(_env, 1, global.FriendUnits(_env, global.PETS - global.MARKED(_env, "DAGUN")))

			if units[1] then
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, units[1], {
					timing = 0,
					display = "EquipSkill_Armor_15009",
					group = "EquipSkill_Armor_15009",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})

				local buff_self = global.PassiveFunEffectBuff(_env, "EquipSkill_Armor_15009_UnhurtRate", {
					UnHurtRateFactor = this.UnHurtRateFactor
				})

				global.ApplyBuff(_env, units[1], {
					duration = 99,
					group = "EquipSkill_Armor_15009_self",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buff_self
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
			local units = global.RandomN(_env, 1, global.FriendUnits(_env, global.PETS - global.MARKED(_env, "DAGUN")))

			if units[1] then
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, units[1], {
					timing = 0,
					display = "EquipSkill_Armor_15009",
					group = "EquipSkill_Armor_15009",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})

				local buff_self = global.PassiveFunEffectBuff(_env, "EquipSkill_Armor_15009_UnhurtRate", {
					UnHurtRateFactor = this.UnHurtRateFactor
				})

				global.ApplyBuff(_env, units[1], {
					duration = 99,
					group = "EquipSkill_Armor_15009_self",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buff_self
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15010 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.2
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:HURTED"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
		}, passive4)
		local passiv5 = __action(this, {
			name = "passiv5",
			entry = prototype.passiv5
		})
		passiv5 = global["[duration]"](this, {
			0
		}, passiv5)
		this.passiv5 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passiv5)
		local passive6 = __action(this, {
			name = "passive6",
			entry = prototype.passive6
		})
		passive6 = global["[duration]"](this, {
			0
		}, passive6)
		this.passive6 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
		}, passive6)

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
			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "UnHurtRateUp",
				group = "EquipSkill_Armor_15010_1",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			}, 1, 0)
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
			local buff_hurt = global.SpecialNumericEffect(_env, "+hurt_Armor_15010", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15010",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Armor_15010",
					"HURTED"
				}
			}, {
				buff_hurt
			})
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local hurt_Armor_15010 = global.SpecialPropGetter(_env, "hurt_Armor_15010")(_env, _env.ACTOR)

				if hurt_Armor_15010 and hurt_Armor_15010 ~= 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15010", "HURTED"), 99)

					local buffeft1 = global.HPPeriodDamage(_env, "Poison", attacker.atk * 0.6, 1)
					local buffeft2 = global.Curse(_env)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
						timing = 1,
						display = "Poison",
						group = "CURSE",
						duration = 2,
						limit = 1,
						tags = {
							"STATUS",
							"DEBUFF",
							"CURSE",
							"DISPELLABLE",
							"ABNORMAL"
						}
					}, {
						buffeft1,
						buffeft2
					}, 1, 0)
				end
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local hurt_Armor_15010 = global.SpecialPropGetter(_env, "hurt_Armor_15010")(_env, _env.ACTOR)

				if hurt_Armor_15010 and hurt_Armor_15010 ~= 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15010", "HURTED"), 99)
				end
			end
		end)

		return _env
	end,
	passiv5 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15010", "HURTED"), 99)
		end)

		return _env
	end,
	passive6 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15010", "HURTED"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Armor_15011 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Factor = externs.Factor

		if this.Factor == nil then
			this.Factor = 0.12
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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

			if global.GetCost(_env, _env.ACTOR) <= 14 then
				local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.Factor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.Factor)
				local buffeft3 = global.NumericEffect(_env, "+blockrate", {
					"+Normal",
					"+Normal"
				}, this.Factor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "UnHurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "DefUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "BlockRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft3
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15012 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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

			if global.GetCost(_env, _env.ACTOR) <= 10 then
				local buffeft1 = global.DeathImmuneEffect(_env, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "Undead",
					group = "EquipSkill_Armor_15012",
					duration = 99,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDEAD",
						"DISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)

				local buffeft2 = global.PassiveFunEffectBuff(_env, "Skill_Sustained_RPRecovery", {
					RateFactor = this.RateFactor
				})

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "CShieldRpUp",
					group = "EquipSkill_Armor_15012_RP",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				}, 1, 0)
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15101_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.3
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"UNIT_TRANSPORT"
		}, passive4)

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
			local buffeft = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)
			local flag = 0

			for _, unit in global.__iter__(global.FriendUnits(_env, global.COL_OF(_env, _env.ACTOR) * global.FRONT_OF(_env, _env.ACTOR, true))) do
				if unit then
					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Armor_15101_1",
						timing = 0,
						limit = 1,
						tags = {
							"EquipSkill_Armor_15101_1",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft
					})
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local flag = 0

			for _, unit in global.__iter__(global.FriendUnits(_env, global.COL_OF(_env, _env.ACTOR) * global.FRONT_OF(_env, _env.ACTOR, true))) do
				if unit then
					flag = 1
				end
			end

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and flag == 0 then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_15101_1", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)
			local flag = 0

			if _env.unit ~= _env.ACTOR then
				for _, unit in global.__iter__(global.FriendUnits(_env, global.COL_OF(_env, _env.ACTOR) * global.FRONT_OF(_env, _env.ACTOR, true))) do
					if unit then
						global.ApplyBuff(_env, _env.ACTOR, {
							duration = 99,
							group = "EquipSkill_Armor_15101_1",
							timing = 0,
							limit = 1,
							tags = {
								"EquipSkill_Armor_15101_1",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft
						})
					end
				end
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.oldCell = externs.oldCell

		assert(_env.oldCell ~= nil, "External variable `oldCell` is not provided.")

		_env.newCell = externs.newCell

		assert(_env.newCell ~= nil, "External variable `newCell` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local flag = 0

			for _, unit in global.__iter__(global.FriendUnits(_env, global.COL_OF(_env, _env.ACTOR) * global.FRONT_OF(_env, _env.ACTOR, true))) do
				if unit then
					flag = 1
				end
			end

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and flag == 0 then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_15101_1", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15102_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive3)

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
			local UnHurtRate = nil

			if #global.EnemyUnits(_env) < 5 then
				UnHurtRate = this.UnHurtRateFactor * 2
			else
				UnHurtRate = this.UnHurtRateFactor
			end

			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, UnHurtRate)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15102_2",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Armor_15102_2"
				}
			}, {
				buffeft1
			})
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
			local UnHurtRate = this.UnHurtRateFactor

			if #global.EnemyUnits(_env) >= 5 then
				local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, UnHurtRate)

				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "NUMERIC", "BUFF", "UNHURTRATEUP", "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15102_2"), 99)
				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Armor_15102_2",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Armor_15102_2"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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
			local UnHurtRate = this.UnHurtRateFactor

			if #global.EnemyUnits(_env) < 5 then
				UnHurtRate = this.UnHurtRateFactor * 2
			else
				UnHurtRate = this.UnHurtRateFactor
			end

			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, UnHurtRate)

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "NUMERIC", "BUFF", "UNHURTRATEUP", "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15102_2"), 99)
			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15102_2",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Armor_15102_2"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.EquipSkill_Armor_15103_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpFactor = externs.MaxHpFactor

		if this.MaxHpFactor == nil then
			this.MaxHpFactor = 0.8
		end

		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 800
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_DIE"
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SpecialPropGetter(_env, "EquipSkill_Armor_15103_3")(_env, global.FriendField(_env)) == 0 and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and _env.unit ~= _env.ACTOR and (global.MARKED(_env, "ASSASSIN")(_env, _env.unit) or global.MARKED(_env, "MAGE")(_env, _env.unit)) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPRecovery(_env, _env.ACTOR, maxHp * this.MaxHpFactor)
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)

				local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Armor_15103_3", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15104_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.25
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.HAS_SUMMONER(_env, _env.ACTOR)(_env, _env.unit) then
				local buffeft = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Armor_15104_1",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Armor_15104_1"
					}
				}, {
					buffeft
				})

				local buff_check = global.SpecialNumericEffect(_env, "+EquipSkill_Armor_15104_1_check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buff_check
				}, 1)

				local buff = global.PassiveFunEffectBuff(_env, "EquipSkill_Armor_15104_1_Passive")

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buff
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
			local count = 0

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				if global.SpecialPropGetter(_env, "EquipSkill_Armor_15104_1_check")(_env, unit) > 0 then
					count = count + 1
				end
			end

			if count > 0 then
				local buffeft = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Armor_15104_1",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Armor_15104_1"
					}
				}, {
					buffeft
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15104_1_Passive = {
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
			local count = 0

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				if global.SpecialPropGetter(_env, "EquipSkill_Armor_15104_1_check")(_env, unit) > 0 then
					count = count + 1
				end
			end

			if count == 0 then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.SelectHeroPassiveCount(_env, unit, "EquipSkill_Tops_15104_1") > 0 then
						global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "EquipSkill_Armor_15104_1"), 99)

						break
					end
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15105_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 300
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:HURTED"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive3)

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
			local buff_hurt = global.SpecialNumericEffect(_env, "+hurt_Paladin", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15105_2",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"PALADIN",
					"HURTED"
				}
			}, {
				buff_hurt
			})
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local hurt_Paladin = global.SpecialPropGetter(_env, "hurt_Paladin")(_env, _env.ACTOR)

				if hurt_Paladin and hurt_Paladin ~= 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "PALADIN", "HURTED"), 99)
				end
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local hurt_Paladin = global.SpecialPropGetter(_env, "hurt_Paladin")(_env, _env.ACTOR)

				if hurt_Paladin and hurt_Paladin ~= 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "PALADIN", "HURTED"), 99)

					if global.SpecialPropGetter(_env, "EquipSkill_Armor_15105_2")(_env, global.FriendField(_env)) < 3 then
						local hpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR)

						if hpRatio > 0.5 then
							global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)

							local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Armor_15105_2", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"NUMERIC",
									"BUFF",
									"UNHURTRATEUP",
									"UNDISPELLABLE",
									"UNSTEALABLE",
									"UR_EQUIPMENT"
								}
							}, {
								buffeft
							}, 1)
						end
					end
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15106_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.4
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:HURTED"
		}, passive1)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.detail = externs.detail

		assert(_env.detail ~= nil, "External variable `detail` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.detail.eft and _env.detail.eft ~= 0 then
				local heal = _env.detail.eft * this.HealRateFactor

				for _, unit in global.__iter__(global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
					global.ApplyHPRecovery(_env, unit, heal)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15107_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.1
		end

		this.ImmuneTime = externs.ImmuneTime

		if this.ImmuneTime == nil then
			this.ImmuneTime = 30
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "ABNORMAL"), 99)

			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15107_1",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Armor_15107_1"
				}
			}, {
				buffeft1
			})

			local buffeft2 = global.ImmuneBuff(_env, "ABNORMAL")

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 4,
				duration = this.ImmuneTime,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Armor_15107_1"
				}
			}, {
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Armor_15108_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.3
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
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
			local buff = global.SpecialNumericEffect(_env, "+EquipSkill_Armor_15108_2", {
				"+Normal",
				"+Normal"
			}, this.DamageFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"EquipSkill_Armor_15108_2",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.HAS_SUMMONER(_env, _env.ACTOR)(_env, _env.unit) then
				local buff = global.SpecialNumericEffect(_env, "EquipSkill_Armor_15108_2_check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Armor_15108_2_check"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_15109_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BlockRateFactor = 0.15
		this.RpFactor = 200
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
			local buffeft1 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+Armor_15109_3", {
				"?Normal"
			}, this.RpFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Armor_15109_3",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1, 1)
		end)

		return _env
	end
}
all.EquipSkill_Armor_15110_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AttackFactor = externs.AttackFactor

		if this.AttackFactor == nil then
			this.AttackFactor = 0.05
		end

		this.MaxHpFactor = externs.MaxHpFactor

		if this.MaxHpFactor == nil then
			this.MaxHpFactor = 0.1
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[schedule_in_cycles]"](this, {
			10000
		}, passive)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.maxHp = externs.maxHp

		if _env.maxHp == nil then
			_env.maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
		end

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AttackFactor)
			local buffeft2 = global.MaxHpEffect(_env, _env.maxHp * this.MaxHpFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15110_1",
				timing = 0,
				limit = 5,
				tags = {
					"NUMERIC",
					"BUFF",
					"EquipSkill_Armor_15110_1",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1, 1)
		end)

		return _env
	end
}
all.EquipSkill_Armor_15111_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOERateFactor = externs.AOERateFactor

		if this.AOERateFactor == nil then
			this.AOERateFactor = 0.08
		end

		this.CritRateFactor = externs.CritRateFactor

		if this.CritRateFactor == nil then
			this.CritRateFactor = 0.08
		end

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
			local AOERate = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, this.AOERateFactor)
			local CritRate = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15111_2_AOE",
				timing = 0,
				limit = 3,
				tags = {
					"NUMERIC",
					"BUFF",
					"EquipSkill_Armor_15111_2",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				AOERate
			})
			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_15111_2_Crit",
				timing = 0,
				limit = 3,
				tags = {
					"NUMERIC",
					"BUFF",
					"EquipSkill_Armor_15111_2",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				CritRate
			})
		end)

		return _env
	end
}
all.EquipSkill_Boots_15001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.4
		end

		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 1
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
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
			local buffeft = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "AtkUp",
				group = "EquipSkill_Boots_15001",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"ATKUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Boots_15001"
				}
			}, {
				buffeft
			})

			local buffeft1 = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15001_For_Field", {
				AtkRateFactor = this.AtkRateFactor,
				DamageFactor = this.DamageFactor
			})

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"Skill_LAMu_Passive_Skill",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
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
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			atk = atk * (1 + this.AtkRateFactor)

			if global.FriendMaster(_env) then
				global.ApplyHPDamage(_env, global.FriendMaster(_env), atk * this.DamageFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15001_For_Field = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.4
		end

		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 1
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_KICK"
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.SelectHeroPassiveCount(_env, _env.unit, "EquipSkill_Shoes_15001") > 0 then
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.unit)
				atk = atk * (1 + this.AtkRateFactor)

				if global.FriendMaster(_env) then
					global.ApplyHPDamage(_env, global.FriendMaster(_env), atk * this.DamageFactor)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.25
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:BUFF_APPLYED"
		}, passive)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_BROKED"
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_CANCELED"
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_STEALED"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_ENDED"
		}, passive2)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "SHIELD") then
				local buff = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					display = "HurtRateUp",
					group = "EquipSkill_Boots_15002",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Boots_15002"
					}
				}, {
					buff
				}, 1, 0)
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

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "SHIELD") then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Boots_15002"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AoeDeRateFactor = externs.AoeDeRateFactor

		if this.AoeDeRateFactor == nil then
			this.AoeDeRateFactor = 0.35
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local buffeft = global.NumericEffect(_env, "+aoederate", {
				"+Normal",
				"+Normal"
			}, this.AoeDeRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_15003",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"AOEDERATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft
			})
		end)

		return _env
	end
}
all.EquipSkill_Boots_15004 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyFactor = externs.EnergyFactor

		if this.EnergyFactor == nil then
			this.EnergyFactor = 0.25
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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

			if global.GetCost(_env, _env.ACTOR) <= 18 then
				local Energy = global.floor(_env, global.GetCost(_env, _env.ACTOR) * this.EnergyFactor)

				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), Energy)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpFactor = externs.MaxHpFactor

		if this.MaxHpFactor == nil then
			this.MaxHpFactor = 0.25
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_BEKILLED"
		}, passive1)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.actor = externs.actor

		assert(_env.actor ~= nil, "External variable `actor` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.PETS - global.SUMMONS(_env, _env.unit) and _env.actor == _env.ACTOR then
				for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS)) do
					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

					global.ApplyHPRecovery(_env, unit, maxHp * this.MaxHpFactor)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.12
		end

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.12
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:TRANSFORM"
		}, passive3)

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
			local buff_check = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15006", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Boots_15009_check"
				}
			}, {
				buff_check
			})

			if global.SpecialPropGetter(_env, "EquipSkill_Boots_15006")(_env, global.FriendField(_env)) == 1 then
				local buff2 = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15006_CellNum", {
					"?Normal"
				}, global.GetCellId(_env, _env.ACTOR))

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Boots_15006_CellNum"
					}
				}, {
					buff2
				})

				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "HurtRateUp",
					group = "EquipSkill_Boots_15006_hurt",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"HURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "UnHurtRateUp",
					group = "EquipSkill_Boots_15006_unhurt",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})

				local buff = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15006_bingo", {
					"?Normal"
				}, 1)
				local trap = global.BuffTrap(_env, {
					timing = 2,
					duration = 1,
					tags = {
						"EquipSkill_Boots_15006_BINGO"
					}
				}, {
					buff
				})

				global.ApplyTrap(_env, global.GetCell(_env, _env.ACTOR), {
					display = "EquipSkill_Shoes_15006",
					duration = 99,
					triggerLife = 1,
					tags = {
						"TRAP"
					}
				}, {
					trap
				})

				local buff_subset = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15006_Subset", {
					HurtRateFactor = this.HurtRateFactor,
					UnHurtRateFactor = this.UnHurtRateFactor
				})

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Boots_15006_Subset",
					timing = 0,
					limit = 1,
					tags = {
						"BUFF",
						"UR_EQUIPMENT",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff_subset
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
			local buff_subset = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15006_Subset", {
				HurtRateFactor = this.HurtRateFactor,
				UnHurtRateFactor = this.UnHurtRateFactor
			})

			global.ApplyBuff(_env, global.FriendField(_env), {
				duration = 99,
				group = "EquipSkill_Boots_15006_Subset",
				timing = 0,
				limit = 1,
				tags = {
					"BUFF",
					"UR_EQUIPMENT",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff_subset
			})
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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
			local buff_subset = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15006_Subset", {
				HurtRateFactor = this.HurtRateFactor,
				UnHurtRateFactor = this.UnHurtRateFactor
			})

			global.ApplyBuff(_env, global.FriendField(_env), {
				duration = 99,
				group = "EquipSkill_Boots_15006_Subset",
				timing = 0,
				limit = 1,
				tags = {
					"BUFF",
					"UR_EQUIPMENT",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff_subset
			})
		end)

		return _env
	end
}
all.EquipSkill_Boots_15006_Subset = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.12
		end

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.12
		end

		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"UNIT_TRANSFORM"
		}, passive4)

		return this
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "EquipSkill_Boots_15006_BINGO")) > 0 then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "HurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"HURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "UnHurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.GetCellId(_env, _env.unit) == global.SpecialPropGetter(_env, "EquipSkill_Boots_15006_CellNum")(_env, global.FriendField(_env)) then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "HurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"HURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "UnHurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyFactor = externs.EnergyFactor

		if this.EnergyFactor == nil then
			this.EnergyFactor = 0.4
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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

			if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "EquipSkill_Boots_15007_check")) == 0 then
				global.ApplyHPDamage(_env, _env.ACTOR, global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR) * 0.5)

				local Energy = global.floor(_env, global.GetCost(_env, _env.ACTOR) * this.EnergyFactor)

				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), Energy)

				local buffeft1 = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15007", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Boots_15007_check"
					}
				}, {
					global.buff_check
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15008 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Factor = externs.Factor

		if this.Factor == nil then
			this.Factor = 0.12
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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

			if global.GetCost(_env, _env.ACTOR) <= 14 then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.Factor)
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.Factor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "HurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"HURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "UnHurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15102_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.2
		end

		this.CostFactor = 3
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
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
			local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15102_2_count", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft
			})
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SpecialPropGetter(_env, "EquipSkill_Boots_15102_2_count")(_env, global.FriendField(_env)) == 0 then
				local buffeft3 = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15102_2_Subset", {
					atkRateFactor = this.AtkRateFactor,
					costFactor = this.CostFactor
				})

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft3
				})

				if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "DAZE")) > 0 then
					local card = global.BackToCard_ResultCheck(_env, _env.ACTOR, "card")

					if card then
						local buffeft2 = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15102_2_biaozhi", {
							"+Normal",
							"+Normal"
						}, 0)

						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"UR_EQUIPMENT",
								"EquipSkill_Boots_15102_2_biaozhi"
							}
						}, {
							buffeft2
						})
						global.Kick(_env, _env.ACTOR)
					end
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15102_2_Subset = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.atkRateFactor = externs.atkRateFactor

		assert(this.atkRateFactor ~= nil, "External variable `atkRateFactor` is not provided.")

		this.costFactor = externs.costFactor

		assert(this.costFactor ~= nil, "External variable `costFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive1)

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local tag1 = global.SpecialPropGetter(_env, "EquipSkill_Boots_15102_2_count")(_env, global.FriendField(_env))
			local tag2 = global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_15102_2_biaozhi"))

			if tag1 == 0 and tag2 > 0 then
				for _, acard in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))) do
					local buffeft = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.atkRateFactor)

					if global.SelectCardPassiveCount(_env, acard, "EquipSkill_Shoes_15102_2") > 0 then
						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), acard, {
							timing = 0,
							duration = 99,
							display = "AtkRateUp",
							tags = {
								"BUFF",
								"ATKRATEUP",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"UR_EQUIPMENT"
							}
						}, {
							buffeft
						})

						local cardvaluechange = global.CardCostEnchant(_env, "-", this.costFactor, 1)

						global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), acard, {
							tags = {
								"CARDBUFF",
								"UNDISPELLABLE"
							}
						}, {
							cardvaluechange
						})
					end

					local buffeft2 = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15102_2_count", {
						"+Normal",
						"+Normal"
					}, 1)

					global.ApplyBuff(_env, global.FriendField(_env), {
						timing = 0,
						duration = 99,
						tags = {
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"UR_EQUIPMENT"
						}
					}, {
						buffeft2
					})
				end

				global.DispelBuff(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_15102_2_biaozhi"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15101_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.1
		end

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+Atk_EquipSkill_Boots_15101_1", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_15101_1",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"EquipSkill_Boots_15101_1",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.EquipSkill_Boots_15103_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.15
		end

		this.costFactor = externs.costFactor

		if this.costFactor == nil then
			this.costFactor = 4
		end

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.ACTOR) == global.GetSide(_env, _env.unit) and global.SpecialPropGetter(_env, "EquipSkill_Boots_15103_3_check")(_env, global.FriendField(_env)) == 0 then
				if global.MARKED(_env, "MAGE")(_env, _env.unit) or global.MARKED(_env, "ASSASSIN")(_env, _env.unit) then
					for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))) do
						if global.SelectCardPassiveCount(_env, card, "EquipSkill_Shoes_15103_3") > 0 then
							local buff = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15103_3", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"NUMERIC",
									"EquipSkill_Boots_15103_3",
									"UNDISPELLABLE",
									"UNSTEALABLE"
								}
							}, {
								buff
							})
						end
					end
				end

				if global.SpecialPropGetter(_env, "EquipSkill_Boots_15103_3")(_env, global.FriendField(_env)) >= 3 then
					for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))) do
						if global.SelectCardPassiveCount(_env, card, "EquipSkill_Shoes_15103_3") > 0 then
							local cardvaluechange = global.CardCostEnchant(_env, "-", this.costFactor, 1)

							global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
								tags = {
									"CARDBUFF",
									"UNDISPELLABLE"
								}
							}, {
								cardvaluechange
							})

							local buffeft = global.NumericEffect(_env, "+atkrate", {
								"+Normal",
								"+Normal"
							}, this.AtkRateFactor)

							global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
								timing = 0,
								duration = 99,
								display = "AtkRateUp",
								tags = {
									"BUFF",
									"ATKRATEUP",
									"UNDISPELLABLE",
									"UNSTEALABLE",
									"UR_EQUIPMENT"
								}
							}, {
								buffeft
							})

							local buff_check = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15103_3_check", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"NUMERIC",
									"EquipSkill_Boots_15103_3_check",
									"UNDISPELLABLE",
									"UNSTEALABLE"
								}
							}, {
								buff_check
							})
						end
					end
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15104_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 300
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive1)

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.HAS_SUMMONER(_env, _env.ACTOR)(_env, _env.unit) then
				local buff = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15104_1_Passive", {
					RageFactor = this.RageFactor
				})

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15104_1_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 300
		end

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

			if global.SpecialPropGetter(_env, "EquipSkill_Boots_15104_1")(_env, global.FriendField(_env)) < 3 then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.SelectHeroPassiveCount(_env, unit, "EquipSkill_Shoes_15104_1") > 0 then
						global.ApplyRPRecovery(_env, unit, this.RageFactor)

						local buff = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15104_1", {
							"+Normal",
							"+Normal"
						}, 1)

						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"STATUS",
								"EquipSkill_Boots_15104_1",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
					end
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15105_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEDeRateFactor = externs.AOEDeRateFactor

		if this.AOEDeRateFactor == nil then
			this.AOEDeRateFactor = 0.3
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BUFF_APPLYED"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"SELF:BUFF_BROKED"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"SELF:BUFF_CANCELED"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"SELF:BUFF_STEALED"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:BUFF_ENDED"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive4)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "TAUNT") then
				for _, unit in global.__iter__(global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
					if global.MASTER(_env, unit) == false then
						if global.PETS - global.SUMMONS(_env, unit) then
							local buffeft = global.NumericEffect(_env, "+aoederate", {
								"+Normal",
								"+Normal"
							}, this.AOEDeRateFactor)

							global.ApplyBuff(_env, unit, {
								duration = 99,
								group = "EquipSkill_Boots_15105_2",
								timing = 0,
								limit = 1,
								tags = {
									"NUMERIC",
									"BUFF",
									"UNDISPELLABLE",
									"UNSTEALABLE",
									"EquipSkill_Boots_15105_2"
								}
							}, {
								buffeft
							})
						end

						local buffeft1 = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15105_2_For_Field", {
							AOEDeRateFactor = this.AOEDeRateFactor
						})

						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"EquipSkill_Boots_15105_2_For_Field",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft1
						})
					end
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "TAUNT")) > 0 and _env.unit ~= _env.ACTOR and global.PETS - global.SUMMONS(_env, _env.unit) then
				local buffeft = global.NumericEffect(_env, "+aoederate", {
					"+Normal",
					"+Normal"
				}, this.AOEDeRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "EquipSkill_Boots_15105_2",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Boots_15105_2"
					}
				}, {
					buffeft
				})
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "TAUNT") then
				for _, unit in global.__iter__(global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
					global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "EquipSkill_Boots_15105_2"), 99)
				end
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
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

			for _, unit in global.__iter__(global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "EquipSkill_Boots_15105_2"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15105_2_For_Field = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEDeRateFactor = externs.AOEDeRateFactor

		if this.AOEDeRateFactor == nil then
			this.AOEDeRateFactor = 0.3
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_KICK"
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.SelectHeroPassiveCount(_env, _env.unit, "EquipSkill_Shoes_15105_2") > 0 then
				for _, unit in global.__iter__(global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
					global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "EquipSkill_Boots_15105_2"), 99)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15106_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DispelRateFactor = externs.DispelRateFactor

		if this.DispelRateFactor == nil then
			this.DispelRateFactor = 0.5
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				if global.ProbTest(_env, this.DispelRateFactor) then
					global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "DEBUFF", "DISPELLABLE"), 1)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15107_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.08
		end

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.08
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_DIE"
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS - global.SUMMONS(_env, _env.unit) then
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
					group = "EquipSkill_Boots_15107_1",
					timing = 0,
					limit = 3,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE",
						"EquipSkill_Boots_15107_1",
						"HURTRATEUP",
						"UNHURTRATEUP"
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
all.EquipSkill_Boots_15108_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 0.8
		end

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.HAS_SUMMONER(_env, _env.ACTOR)(_env, _env.unit) then
				global.AddStatus(_env, _env.unit, "EquipSkill_Boots_15108_2")

				local buff = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15108_2_Passive", {
					RateFactor = this.RateFactor
				})

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15108_2_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 0.8
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			750
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
			667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SpecialPropGetter(_env, "EquipSkill_Boots_15108_2_times")(_env, global.FriendField(_env)) < 3 and global.ProbTest(_env, this.RateFactor) and global.INSTATUS(_env, "EquipSkill_Boots_15108_2")(_env, _env.ACTOR) then
				local setLoction = global.GetCellId(_env, _env.ACTOR)
				local RpFactor = global.UnitPropGetter(_env, "rp")(_env, _env.ACTOR)

				if RpFactor then
					global.ReviveByUnitSigleTon(_env, _env.ACTOR, 1, RpFactor, {
						global.abs(_env, setLoction)
					}, global.GetOwner(_env, global.FriendField(_env)))
				else
					global.ReviveByUnitSigleTon(_env, _env.ACTOR, 1, 0, {
						global.abs(_env, setLoction)
					}, global.GetOwner(_env, global.FriendField(_env)))
				end

				local buffeft = global.SpecialNumericEffect(_env, "+EquipSkill_Boots_15108_2_times", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boot_15109_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BlockRateFactor = externs.BlockRateFactor

		if this.BlockRateFactor == nil then
			this.BlockRateFactor = 0.15
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.2
		end

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
			local buffeft1 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+Boot_15109_3", {
				"+Normal",
				"+Normal"
			}, this.HealRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNIQUE_HURTRATEUP",
					"EquipSkill_Boot_15109_3",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1, 1)
		end)

		return _env
	end
}
all.EquipSkill_Boots_15110_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.1
		end

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+boots_15110_1", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Boots_15110_1"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.EquipSkill_Boots_15111_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 2
		end

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

			if global.EnemyMaster(_env) and global.GetCost(_env, _env.ACTOR) <= 10 then
				global.DispelBuff(_env, global.EnemyMaster(_env), global.BUFF_MARKED_ALL(_env, "IMMUNE"), 99)
				global.ApplyHPDamage(_env, global.EnemyMaster(_env), this.DamageFactor * global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR))
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15112_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOERateFactor = externs.AOERateFactor

		if this.AOERateFactor == nil then
			this.AOERateFactor = 0.045
		end

		this.count = externs.count

		if this.count == nil then
			this.count = 0
		end

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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive3)

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
			local buffeft1 = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, this.AOERateFactor)

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				this.count = this.count + 1

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Boots_15112_3"
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, this.AOERateFactor)

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				this.count = this.count + 1

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Boots_15112_3"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Boots_15112_3"), 1)

				this.count = this.count - 1
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15113_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 1
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			800
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			700
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
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
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15113_1_Passive", {
				ShieldFactor = this.ShieldFactor
			})

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			})
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
			667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SpecialPropGetter(_env, "boots_15113_1")(_env, global.FriendField(_env)) == 0 then
				local RpFactor = global.UnitPropGetter(_env, "rp")(_env, _env.ACTOR)
				local cell = global.abs(_env, global.GetCellId(_env, _env.ACTOR))
				local reviveunit = global.ReviveByUnit(_env, _env.ACTOR, 0.01, RpFactor, {
					cell
				}, global.GetOwner(_env, global.FriendField(_env)))
				local FlagCheck = global.SpecialNumericEffect(_env, "+boots_15113_1_flagcheck", {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"FLAGCHECK_BOOTS_15113",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					FlagCheck
				})
			end

			local count = global.SpecialNumericEffect(_env, "+boots_15113_1", {
				"?Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Boots_15113_1",
					"UR_EQUIPMENT"
				}
			}, {
				count
			})
		end)

		return _env
	end
}
all.EquipSkill_Boots_15113_1_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldFactor = externs.ShieldFactor

		assert(this.ShieldFactor ~= nil, "External variable `ShieldFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive1)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.isRevive = externs.isRevive

		assert(_env.isRevive ~= nil, "External variable `isRevive` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.isRevive == true and global.SelectHeroPassiveCount(_env, _env.unit, "EquipSkill_Shoes_15113_1") > 0 and global.SpecialPropGetter(_env, "boots_15113_1_shield")(_env, global.FriendField(_env)) == 0 then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local shield = global.ShieldEffect(_env, maxHp * this.ShieldFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					display = "Shield",
					group = "EquipSkill_Boots_15113_1",
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
					shield
				})

				local count = global.SpecialNumericEffect(_env, "+boots_15113_1_shield", {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Boots_15113_1_ShieldCheck",
						"UR_EQUIPMENT"
					}
				}, {
					count
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15114_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnCritRateFactor = externs.UnCritRateFactor

		if this.UnCritRateFactor == nil then
			this.UnCritRateFactor = 0.4
		end

		this.BeCuredRateFactor = externs.BeCuredRateFactor

		if this.BeCuredRateFactor == nil then
			this.BeCuredRateFactor = 0.2
		end

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
			local buffeft1 = global.NumericEffect(_env, "+uncritrate", {
				"+Normal",
				"+Normal"
			}, this.UnCritRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+becuredrate", {
				"+Normal",
				"+Normal"
			}, this.BeCuredRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "UnCritRateUp",
				group = "EquipSkill_Boots_15114_2_UnCrit",
				duration = 99,
				limit = 1,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Boots_15114_2",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			})
			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "BeCuredRateUp",
				group = "EquipSkill_Boots_15114_2_BeCured",
				duration = 99,
				limit = 1,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Boots_15114_2",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Boots_15115_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.5
		end

		this.UnHurtRateDownFactor = externs.UnHurtRateDownFactor

		if this.UnHurtRateDownFactor == nil then
			this.UnHurtRateDownFactor = 0.1
		end

		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.04
		end

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
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:HURTED"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive2)

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
			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "UnHurtRateUp",
				group = "EquipSkill_Boots_15115_2_UnHurt",
				duration = 99,
				limit = 1,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Boots_15115_3",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			})

			local buffeft2 = global.PassiveFunEffectBuff(_env, "EquipSkill_Boots_15115_3_For_Field")

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Boots_15115_3_FriendFieldFlag",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft2
			})
		end)

		return _env
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
			local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateDownFactor)
			local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)
			local count = global.SpecialNumericEffect(_env, "+boots_15115_3_count", {
				"?Normal"
			}, 1)

			if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_15115_3_Count", "UNDISPELLABLE", "UNSTEALABLE")) < 5 then
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "UnHurtRateDown",
					group = "EquipSkill_Boots_15115_2_UnHurt_Debuff",
					duration = 99,
					limit = 5,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Boots_15115_3",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "HurtRateUp",
					group = "EquipSkill_Boots_15115_2_Hurt",
					duration = 99,
					limit = 5,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Boots_15115_3",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft2
				})
				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Boots_15115_3_Count",
						"UR_EQUIPMENT"
					}
				}, {
					count
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				global.DispelBuff(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "EquipSkill_Boots_15115_3_Count"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_15115_3_For_Field = {
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
			"UNIT_KICK"
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.SelectHeroPassiveCount(_env, _env.unit, "EquipSkill_Shoes_15115_3") > 0 then
				global.DispelBuff(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "EquipSkill_Boots_15115_3_Count"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.5
		end

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

			for _, unit in global.__iter__(global.FriendUnits(_env, global.ONESELF(_env, _env.ACTOR) + global.BACK_OF(_env, _env.ACTOR) * global.COL_OF(_env, _env.ACTOR))) do
				global.ApplyBuff(_env, unit, {
					timing = 2,
					display = "Shield",
					group = "EquipSkill_Accesory_15001",
					duration = 2,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SHIELD",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BeCuredRateFactor = externs.BeCuredRateFactor

		if this.BeCuredRateFactor == nil then
			this.BeCuredRateFactor = 0.3
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive3)

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
			local buffeft = global.NumericEffect(_env, "+becuredrate", {
				"+Normal",
				"+Normal"
			}, this.BeCuredRateFactor)

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					duration = 99,
					group = "EquipSkill_Accesory_15002",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"BECUREDRATEUP",
						"EquipSkill_Accesory_15002",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				}, 1, 0)
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local buffeft = global.NumericEffect(_env, "+becuredrate", {
					"+Normal",
					"+Normal"
				}, this.BeCuredRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "EquipSkill_Accesory_15002",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"BECUREDRATEUP",
						"EquipSkill_Accesory_15002",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				}, 1, 0)
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "BECUREDRATEUP", "EquipSkill_Accesory_15002", "UNDISPELLABLE"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefWeakenFactor = externs.DefWeakenFactor

		if this.DefWeakenFactor == nil then
			this.DefWeakenFactor = 0.4
		end

		this.Rate = externs.Rate

		if this.Rate == nil then
			this.Rate = 1.2
		end

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
			local crit = global.UnitPropGetter(_env, "critrate")(_env, _env.ACTOR)
			local buffeft1 = global.NumericEffect(_env, "+defweaken", {
				"+Normal",
				"+Normal"
			}, this.DefWeakenFactor)
			local buffeft2 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, crit * (this.Rate - 1))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "DefWeakenUp",
				group = "EquipSkill_Accesory_15003_1",
				duration = 99,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"DEFWEAKENUP",
					"EquipSkill_Accesory_15003",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "CritRateUp",
				group = "EquipSkill_Accesory_15003_2",
				duration = 99,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"CRITRATEUP",
					"EquipSkill_Accesory_15003",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			}, 1, 0)
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15004 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.2
		end

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
			local buff = global.SpecialNumericEffect(_env, "+rage_unhurtrate_down", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_15004",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"EquipSkill_Accesory_15004",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.15
		end

		this.ExDamageFactor = externs.ExDamageFactor

		if this.ExDamageFactor == nil then
			this.ExDamageFactor = 0.25
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+First_Unique_Accesory_15005", {
				"+Normal",
				"+Normal"
			}, this.DamageFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+First_Unique_Accesory_15005_Ex", {
				"+Normal",
				"+Normal"
			}, this.ExDamageFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_15005",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"EquipSkill_Accesory_15005",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15005", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15005", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 1
		end

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
			local buffeft = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.RateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 4,
				display = "BlockRateUp",
				group = "EquipSkill_Accesory_15006",
				duration = 15,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"BLOCKRATEUP",
					"EquipSkill_Accesory_15006",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft
			}, 1, 0)
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CritStrgFactor = externs.CritStrgFactor

		assert(this.CritStrgFactor ~= nil, "External variable `CritStrgFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			local buffeft_tag = global.SpecialNumericEffect(_env, "+EquipSkill_Accesory_15007_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_15007_biaozhi",
				timing = 0,
				limit = 1,
				tags = {
					"EquipSkill_Accesory_15007_biaozhi"
				}
			}, {
				buffeft_tag
			})
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
			local buffeft2 = global.NumericEffect(_env, "+critstrg", {
				"+Normal",
				"+Normal"
			}, this.CritStrgFactor)

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Accesory_15007_biaozhi")) > 0 then
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "CritStrgUp",
					group = "EquipSkill_Accesory_15007",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"EquipSkill_Accesory_15007",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Accesory_15007_biaozhi")) > 0 then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15007", "UNDISPELLABLE"), 99)
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15007_biaozhi"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15008 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CritrateFactor = externs.CritrateFactor

		if this.CritrateFactor == nil then
			this.CritrateFactor = 0.4
		end

		this.CritstrgFactor = externs.CritstrgFactor

		if this.CritstrgFactor == nil then
			this.CritstrgFactor = 0.2
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			local buffeft_tag = global.SpecialNumericEffect(_env, "+EquipSkill_Accesory_15008_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			if global.GetCost(_env, _env.ACTOR) <= 14 then
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"EquipSkill_Accesory_15008_biaozhi"
					}
				}, {
					buffeft_tag
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
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritrateFactor)
			local buffeft2 = global.NumericEffect(_env, "+critstrg", {
				"+Normal",
				"+Normal"
			}, this.CritstrgFactor)

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Accesory_15008_biaozhi")) > 0 then
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "CritRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"CRITRATEUP",
						"EquipSkill_Accesory_15008",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "CritStrgUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"CRITSTRGUP",
						"EquipSkill_Accesory_15008",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "EquipSkill_Accesory_15008_biaozhi")) > 0 then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "CRITRATEUP", "EquipSkill_Accesory_15008", "UNDISPELLABLE", "UNSTEALABLE"), 99)
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "CRITSTRGUP", "EquipSkill_Accesory_15008", "UNDISPELLABLE", "UNSTEALABLE"), 99)
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15008_biaozhi"), 99)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15009 = {
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
			"UNIT_HPCHANGE"
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				local num = 30

				if num <= _env.prevHpPercent and _env.curHpPercent < num then
					local buffeft = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.HurtRateFactor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
						timing = 0,
						duration = 99,
						display = "HurtRateUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"UR_EQUIPMENT",
							"EquipSkill_Accesory_15009"
						}
					}, {
						buffeft
					}, 1, 0)
				elseif _env.prevHpPercent < num and num <= _env.curHpPercent then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UR_EQUIPMENT", "EquipSkill_Accesory_15009", "UNDISPELLABLE"), 99)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15010 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ImmuneTime = externs.ImmuneTime

		assert(this.ImmuneTime ~= nil, "External variable `ImmuneTime` is not provided.")

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
			local buffeft_tag = global.SpecialNumericEffect(_env, "+EquipSkill_Accesory_15010_biaozhi", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"EquipSkill_Accesory_15010_biaozhi"
				}
			}, {
				buffeft_tag
			})

			local buffeft1 = global.Immune(_env)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DEBUFF"))

			if global.SpecialPropGetter(_env, "EquipSkill_Accesory_15010_biaozhi")(_env, global.FriendField(_env)) == 2 then
				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 4,
					display = "Immune",
					duration = this.ImmuneTime,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"IMMUNE",
						"DISPELLABLE",
						"STEALABLE",
						"EquipSkill_Accesory_15010"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1, 0)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15011 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.cardvalue = externs.cardvalue

		assert(this.cardvalue ~= nil, "External variable `cardvalue` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "Shield",
				group = "EquipSkill_Accesory_15011",
				duration = 99,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			}, 1)

			local cards = global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "WARRIOR"))

			for _, card in global.__iter__(cards) do
				local cardvaluechange = global.CardCostEnchant(_env, "-", this.cardvalue, 1)

				global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
					timing = 0,
					duration = 99,
					tags = {
						"CARDBUFF",
						"EquipSkill_Accesory_15011",
						"UNDISPELLABLE"
					}
				}, {
					cardvaluechange
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15012 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.4
		end

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.4
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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

			if #global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR)) == 0 then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "HurtRateUp",
					group = "EquipSkill_Accesory_15012_biaozhi_hurt",
					duration = 99,
					limit = 1,
					tags = {
						"EquipSkill_Accesory_15012",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "UnHurtRateUp",
					group = "EquipSkill_Accesory_15012_biaozhi_unhurt",
					duration = 99,
					limit = 1,
					tags = {
						"EquipSkill_Accesory_15012",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15101_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.15
		end

		this.DelRpValueFactor = externs.DelRpValueFactor

		if this.DelRpValueFactor == nil then
			this.DelRpValueFactor = 200
		end

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+Hur_EquipSkill_Accesory_15101_1", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+Del_EquipSkill_Accesory_15101_1", {
				"+Normal",
				"+Normal"
			}, this.DelRpValueFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_15101_1",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"EquipSkill_Accesory_15101_1",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15102_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOERateFactor = externs.AOERateFactor

		if this.AOERateFactor == nil then
			this.AOERateFactor = 0.15
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive3)

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
			local AOERate = nil

			if #global.EnemyUnits(_env) < 5 then
				AOERate = this.AOERateFactor * 2
			else
				AOERate = this.AOERateFactor
			end

			local buffeft1 = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, AOERate)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_15102_2",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Accesory_15102_2"
				}
			}, {
				buffeft1
			})
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

			if #global.EnemyUnits(_env) >= 5 then
				local buffeft1 = global.NumericEffect(_env, "+aoerate", {
					"+Normal",
					"+Normal"
				}, this.AOERateFactor)

				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "NUMERIC", "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "EquipSkill_Accesory_15102_2"), 99)
				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Accesory_15102_2",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Accesory_15102_2"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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
			local AOERate = nil

			if #global.EnemyUnits(_env) < 5 then
				AOERate = this.AOERateFactor * 2
			else
				AOERate = this.AOERateFactor
			end

			local buffeft1 = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, AOERate)

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "NUMERIC", "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "EquipSkill_Accesory_15102_2"), 99)
			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_15102_2",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Accesory_15102_2"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15103_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleDeRateFactor = externs.SingleDeRateFactor

		if this.SingleDeRateFactor == nil then
			this.SingleDeRateFactor = 0.2
		end

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
			local buffeft1 = global.NumericEffect(_env, "+singlerate", {
				"+Normal",
				"+Normal"
			}, this.SingleDeRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_15103_3",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Accesory_15103_3"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15104_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.2
		end

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.HAS_SUMMONER(_env, _env.ACTOR)(_env, _env.unit) then
				local SummonerAtk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR) * this.AtkRateFactor
				local SummonsAtk = global.UnitPropGetter(_env, "atk")(_env, _env.unit)
				local atkrate = SummonerAtk / SummonsAtk
				local buffeft = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, atkrate)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					display = "AtkUp",
					group = "EquipSkill_Accesory_15104_1",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Accesory_15104_1",
						"AtkUp"
					}
				}, {
					buffeft
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15105_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 300
		end

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

		_env.isRevive = externs.isRevive

		assert(_env.isRevive ~= nil, "External variable `isRevive` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.isRevive == true and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.INSTATUS(_env, global.GetUnitCid(_env, _env.ACTOR))(_env, _env.unit) then
				global.ApplyRPRecovery(_env, _env.unit, this.RageFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15106_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.3
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BEFORE_ACTION"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
		}, passive4)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.primTrgt, global.BUFF_MARKED(_env, "ABNORMAL")) > 0 then
				local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNIQUE_HURTRATEUP",
						"EquipSkill_Accesory_15106_3",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)
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

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.primTrgt, global.BUFF_MARKED(_env, "ABNORMAL")) > 0 then
				local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNIQUE_HURTRATEUP",
						"EquipSkill_Accesory_15106_3",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15106_3"), 99)
		end)

		return _env
	end,
	passive4 = function (_env, externs)
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15106_3"), 99)
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15107_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.2
		end

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.HAS_SUMMONER(_env, _env.ACTOR)(_env, _env.unit) then
				local buffeft = global.SpecialNumericEffect(_env, "+unique_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.DamageFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15108_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpFactor = externs.MaxHpFactor

		if this.MaxHpFactor == nil then
			this.MaxHpFactor = 0.15
		end

		this.BlockStrgFactor = externs.BlockStrgFactor

		if this.BlockStrgFactor == nil then
			this.BlockStrgFactor = 0.2
		end

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
			local buffeft1 = global.NumericEffect(_env, "+maxHp", {
				"+Normal",
				"+Normal"
			}, this.MaxHpFactor)
			local buffeft2 = global.NumericEffect(_env, "+blockstrg", {
				"+Normal",
				"+Normal"
			}, this.BlockStrgFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "BlockStrgUp",
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"BLOCKSTRGUP",
					"EquipSkill_Accesory_15108_2",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1, 1)
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15109_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpFactor = externs.MaxHpFactor

		if this.MaxHpFactor == nil then
			this.MaxHpFactor = 0.15
		end

		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.04
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive1)

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

			if global.SpecialPropGetter(_env, "accesory_15109_3_count")(_env, global.FriendField(_env)) < 5 then
				local recover = this.MaxHpFactor * global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPRecovery(_env, _env.ACTOR, recover)

				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"HurtRateUp",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Accesory_15109_3"
					}
				}, {
					buffeft1
				})

				local count = global.SpecialNumericEffect(_env, "+accesory_15109_3_count", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"EquipSkill_Accesory_15109_3"
					}
				}, {
					count
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_15110_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefWeakenFactor = externs.DefWeakenFactor

		if this.DefWeakenFactor == nil then
			this.DefWeakenFactor = 0.4
		end

		this.ShieldBreakFactor = externs.ShieldBreakFactor

		if this.ShieldBreakFactor == nil then
			this.ShieldBreakFactor = 0.6
		end

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

			if global.GetCost(_env, _env.ACTOR) <= 10 then
				local buffeft1 = global.SpecialNumericEffect(_env, "+accesory_15110_1", {
					"+Normal",
					"+Normal"
				}, this.ShieldBreakFactor)
				local buffeft2 = global.NumericEffect(_env, "+defweaken", {
					"+Normal",
					"+Normal"
				}, this.DefWeakenFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Accesory_15110_1",
						"UR_EQUIPMENT"
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
all.EquipSkill_Accesory_15111_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ReflectRateFactor = externs.ReflectRateFactor

		if this.ReflectRateFactor == nil then
			this.ReflectRateFactor = 0.4
		end

		this.AbsorptionFactor = externs.AbsorptionFactor

		if this.AbsorptionFactor == nil then
			this.AbsorptionFactor = 0.2
		end

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
			local buffeft1 = global.NumericEffect(_env, "+reflection", {
				"+Normal",
				"+Normal"
			}, this.ReflectRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbsorptionFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "Reflect",
				group = "EquipSkill_Accesory_15111_2_Reflect",
				duration = 99,
				limit = 1,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Accesory_15111_2",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft1
			})
			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "Absorption",
				group = "EquipSkill_Accesory_15111_2_Absorption",
				duration = 99,
				limit = 1,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Accesory_15111_2",
					"UR_EQUIPMENT"
				}
			}, {
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14001",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+PROVOKE_DmgExtra_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14002",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+singlekillrecoveryrate", {
				"+Normal",
				"+Normal"
			}, this.HealRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14003",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14004 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+reflection", {
				"+Normal",
				"+Normal"
			}, this.ReflectRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14004",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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

		_env.num = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.PETS)) do
				_env.num = _env.num + 1
			end

			local m = global.Min(_env, _env.num, 5)
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor * _env.num)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 3,
				group = "EquipSkill_Weapon_14005",
				timing = 2,
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		this.RageFactor = externs.RageFactor

		assert(this.RageFactor ~= nil, "External variable `RageFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_BROKED"
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_CANCELED"
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_STEALED"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_ENDED"
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

			if global.SpecialPropGetter(_env, "tierfeng" .. global.GetUnitCid(_env, _env.ACTOR))(_env, global.FriendField(_env)) == 0 then
				local buffeft1 = global.DeathImmuneEffect(_env, 1, this.HealRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Weapon_14006",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Weapon_14006"
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

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "EquipSkill_Weapon_14006") then
				global.ApplyRPDamage(_env, _env.ACTOR, this.RageFactor)

				local buff_check = global.SpecialNumericEffect(_env, "+tierfeng" .. global.GetUnitCid(_env, _env.ACTOR), {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Weapon_14006_check"
					}
				}, {
					buff_check
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14007",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14008 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.AbsorpRateFactor = externs.AbsorpRateFactor

		assert(this.AbsorpRateFactor ~= nil, "External variable `AbsorpRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbsorpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14008",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14009 = {
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+singlecritsplitrate", {
				"+Normal",
				"+Normal"
			}, this.SplitRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14009",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14010 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+Master_DmgExtra_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14010",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14011 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DispelRateFactor = externs.DispelRateFactor

		assert(this.DispelRateFactor ~= nil, "External variable `DispelRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+dispelprob", {
				"+Normal",
				"+Normal"
			}, this.DispelRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14011",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14012 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+delrppoint", {
				"+Normal",
				"+Normal"
			}, 0)
			local buffeft3 = global.SpecialNumericEffect(_env, "+delrprate", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft4 = global.SpecialNumericEffect(_env, "+delrpvalue", {
				"+Normal",
				"+Normal"
			}, this.DelRpValueFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14012",
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
				buffeft3,
				buffeft4
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14013 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, this.AOERateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14013",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14014 = {
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

		_env.num = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.PETS - global.SUMMONS)) do
				_env.num = _env.num + 1
			end

			local m = global.Min(_env, _env.num, 5)
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor * m)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 3,
				group = "EquipSkill_Weapon_14014",
				timing = 2,
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14015 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.LowerHpCheckRateFactor = externs.LowerHpCheckRateFactor

		assert(this.LowerHpCheckRateFactor ~= nil, "External variable `LowerHpCheckRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+LowerHpCheckRate", {
				"+Normal",
				"+Normal"
			}, this.LowerHpCheckRateFactor)
			local buffeft3 = global.SpecialNumericEffect(_env, "+LowerHp_DmgExtra_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14015",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14016 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SelfAtkRateFactor = externs.SelfAtkRateFactor

		assert(this.SelfAtkRateFactor ~= nil, "External variable `SelfAtkRateFactor` is not provided.")

		this.OtherAtkRateFactor = externs.OtherAtkRateFactor

		assert(this.OtherAtkRateFactor ~= nil, "External variable `OtherAtkRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.SelfAtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14016",
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

			for _, unit in global.__iter__(global.RandomN(_env, 1, global.FriendUnits(_env))) do
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.OtherAtkRateFactor)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 2,
					display = "atkrate",
					tags = {
						"NUMERIC",
						"BUFF",
						"ATKRATEUP",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14017 = {
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+aoekillrecoveryrate", {
				"+Normal",
				"+Normal"
			}, this.HealRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14017",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14018 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DelRpPointFactor = externs.DelRpPointFactor

		assert(this.DelRpPointFactor ~= nil, "External variable `DelRpPointFactor` is not provided.")

		this.DelRpValueFactor = externs.DelRpValueFactor

		assert(this.DelRpValueFactor ~= nil, "External variable `DelRpValueFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+delrppoint", {
				"+Normal",
				"+Normal"
			}, this.DelRpPointFactor)
			local buffeft3 = global.SpecialNumericEffect(_env, "+delrprate", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft4 = global.SpecialNumericEffect(_env, "+delrpvalue", {
				"+Normal",
				"+Normal"
			}, this.DelRpValueFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14018",
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
				buffeft3,
				buffeft4
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14019 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.EftRateFactor = externs.EftRateFactor

		assert(this.EftRateFactor ~= nil, "External variable `EftRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+effectrate", {
				"+Normal",
				"+Normal"
			}, this.EftRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14019",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14020 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			0
		}, main)
		this.main = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, main)

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14020",
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
		end)

		return _env
	end,
	main = function (_env, externs)
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.HAS_SUMMONER(_env, _env.ACTOR)(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft2 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					duration = 3,
					group = "EquipSkill_Weapon_TongYuFaQiu_Summoned",
					timing = 2,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14021 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DeBeCuredRateFactor = externs.DeBeCuredRateFactor

		assert(this.DeBeCuredRateFactor ~= nil, "External variable `DeBeCuredRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+afteratk_debecuredrate", {
				"+Normal",
				"+Normal"
			}, this.DeBeCuredRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14021",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14022 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 0.35
		end

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14022",
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

			local Energy = 1

			if global.ProbTest(_env, this.RateFactor) then
				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), Energy)
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14023 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			100
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive)

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

			if global.MASTER(_env, _env.ACTOR) then
				local buff_times = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_14023_times", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Weapon_14023_times"
					}
				}, {
					buff_times
				})
			end
		end)

		return _env
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local buff_check = global.SpecialNumericEffect(_env, "+EquipSkill_Weapon_14023", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Weapon_14023_check"
					}
				}, {
					buff_check
				})

				local times = global.SpecialPropGetter(_env, "EquipSkill_Weapon_14023_times")(_env, global.FriendField(_env))
				local buff = global.SpecialPropGetter(_env, "EquipSkill_Weapon_14023")(_env, global.FriendField(_env))

				if _env.unit == _env.ACTOR and global.MASTER(_env, _env.ACTOR) == false and global.SpecialPropGetter(_env, "EquipSkill_Weapon_14023")(_env, global.FriendField(_env)) == 4 + (times - 1) * 3 then
					local buffeft1 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.AtkRateFactor)
					local buffeft2 = global.NumericEffect(_env, "+critrate", {
						"+Normal",
						"+Normal"
					}, this.CritRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Weapon_14023",
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
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14024 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.RecoverRateFactor = externs.RecoverRateFactor

		assert(this.RecoverRateFactor ~= nil, "External variable `RecoverRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+singlekillenergyrecoverrate", {
				"+Normal",
				"+Normal"
			}, this.RecoverRateFactor)
			local buffeft3 = global.SpecialNumericEffect(_env, "+aoekillenergyrecoverrate", {
				"+Normal",
				"+Normal"
			}, this.RecoverRateFactor)
			local buffeft4 = global.SpecialNumericEffect(_env, "+singlekillenergyrecoverfactor", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft5 = global.SpecialNumericEffect(_env, "+aoekillenergyrecoverfactor", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14024",
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
				buffeft3,
				buffeft4,
				buffeft5
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14025 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+curerate", {
				"+Normal",
				"+Normal"
			}, this.CureRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14025",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14026 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.HpRatioFactor = externs.HpRatioFactor

		assert(this.HpRatioFactor ~= nil, "External variable `HpRatioFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+LowerHp_HealExtra_RatioCheck", {
				"+Normal",
				"+Normal"
			}, this.HpRatioFactor)
			local buffeft3 = global.SpecialNumericEffect(_env, "+LowerHp_HealExtra_ExtraRate", {
				"+Normal",
				"+Normal"
			}, this.HealRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14026",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14027 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DeAtkRateFactor = externs.DeAtkRateFactor

		assert(this.DeAtkRateFactor ~= nil, "External variable `DeAtkRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+afteratk_deatkrate", {
				"+Normal",
				"+Normal"
			}, this.DeAtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14027",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14028 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+curerate", {
				"+Normal",
				"+Normal"
			}, this.CureRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+extrapetshealrate_OnHeal", {
				"+Normal",
				"+Normal"
			}, this.HealRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14028",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_14029 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_ACTION"
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
			local buffeft1 = global.NumericEffect(_env, "+curerate", {
				"+Normal",
				"+Normal"
			}, this.CureRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+extramasterdefrate_OnHeal", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_14029",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_14001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+becuredrate", {
				"+Normal",
				"+Normal"
			}, this.BeCuredRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14001",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_14002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+reflection", {
				"+Normal",
				"+Normal"
			}, this.ReflectRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14002",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_14003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.HpRatioFactor = externs.HpRatioFactor

		assert(this.HpRatioFactor ~= nil, "External variable `HpRatioFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14003",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Armor_14003"
				}
			}, {
				buffeft1
			})
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				if _env.prevHpPercent >= this.HpRatioFactor * 100 and _env.curHpPercent < this.HpRatioFactor * 100 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_14003", "UNDISPELLABLE"), 99)
				end

				if _env.prevHpPercent < this.HpRatioFactor * 100 and _env.curHpPercent >= this.HpRatioFactor * 100 then
					local buffeft1 = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, this.DefRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Armor_14003",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Armor_14003"
						}
					}, {
						buffeft1
					})
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_14004 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+dazeprob_hurted", {
				"+Normal",
				"+Normal"
			}, this.DazeRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14004",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_14005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.HpRatioFactor = externs.HpRatioFactor

		assert(this.HpRatioFactor ~= nil, "External variable `HpRatioFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14005",
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				if _env.prevHpPercent >= this.HpRatioFactor * 100 and _env.curHpPercent < this.HpRatioFactor * 100 then
					local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.UnHurtRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Armor_14005_UnHurt",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Armor_14005_UnHurt"
						}
					}, {
						buffeft2
					})
				end

				if _env.prevHpPercent < this.HpRatioFactor * 100 and _env.curHpPercent >= this.HpRatioFactor * 100 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_14005_UnHurt", "UNDISPELLABLE"), 99)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_14006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.StepDefRateFactor = externs.StepDefRateFactor

		assert(this.StepDefRateFactor ~= nil, "External variable `StepDefRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:HURTED"
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14006",
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
			local buffeft2 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.StepDefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 2,
				limit = 5,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"DEFUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Armor_14007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.UnBlockRateFactor = externs.UnBlockRateFactor

		assert(this.UnBlockRateFactor ~= nil, "External variable `UnBlockRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+unblockrate", {
				"+Normal",
				"+Normal"
			}, this.UnBlockRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14007",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_14008 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+aoederate", {
				"+Normal",
				"+Normal"
			}, this.AOEDeRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14008",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_14009 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.StepAtkRateFactor = externs.StepAtkRateFactor

		assert(this.StepAtkRateFactor ~= nil, "External variable `StepAtkRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:HURTED"
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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14009",
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
			local buffeft2 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.StepAtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "AtkUp",
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"ATKUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Armor_14010 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14010_Def",
				timing = 0,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Armor_14010_Def"
				},
				limit = global.Def
			}, {
				buffeft1
			})
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				if _env.prevHpPercent >= 50 and _env.curHpPercent < 50 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_14010_Def", "UNDISPELLABLE"), 99)

					local buffeft2 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.AtkRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Armor_14010_Atk",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Armor_14010_Atk"
						}
					}, {
						buffeft2
					})
				end

				if _env.prevHpPercent < 50 and _env.curHpPercent >= 50 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_14010_Atk", "UNDISPELLABLE"), 99)

					local buffeft3 = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, this.DefRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Armor_14010_Def",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Armor_14010_Atk"
						}
					}, {
						buffeft3
					})
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_14011 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14011_Def",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Armor_14011_Hp"
				}
			}, {
				buffeft1
			})

			local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14011_Unhurt",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Armor_14011_Unhurt"
				}
			}, {
				buffeft2
			})
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				if _env.prevHpPercent >= 100 and _env.curHpPercent < 100 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_14011_Unhurt", "UNDISPELLABLE"), 99)
				end

				if _env.prevHpPercent < 100 and _env.curHpPercent >= 100 then
					local buffeft3 = global.NumericEffect(_env, "+unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.UnHurtRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Armor_14011_Unhurt",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Armor_14011_Unhurt"
						}
					}, {
						buffeft3
					})
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_14012 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.UnEffectRateFactor = externs.UnEffectRateFactor

		assert(this.UnEffectRateFactor ~= nil, "External variable `UnEffectRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+uneffectrate", {
				"+Normal",
				"+Normal"
			}, this.UnEffectRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14012",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_14013 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+singlederate", {
				"+Normal",
				"+Normal"
			}, this.SingleDeRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14013",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_14014 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.RecoveryRateFactor = externs.RecoveryRateFactor

		assert(this.RecoveryRateFactor ~= nil, "External variable `RecoveryRateFactor` is not provided.")

		this.RecoveryRatioFactor = externs.RecoveryRatioFactor

		assert(this.RecoveryRatioFactor ~= nil, "External variable `RecoveryRatioFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+hurtrecoveryrate", {
				"+Normal",
				"+Normal"
			}, this.RecoveryRateFactor)
			local buffeft3 = global.SpecialNumericEffect(_env, "+hurtrecoveryratio", {
				"+Normal",
				"+Normal"
			}, this.RecoveryRatioFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14014",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_14015 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:HURTED"
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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14015",
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

			if global.ProbTest(_env, this.RateFactor) then
				local buffeft2 = global.NumericEffect(_env, "+curerate", {
					"+Normal",
					"+Normal"
				}, this.CureRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 1,
					display = "CureRateUp",
					duration = 3,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"CURERATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_14016 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		this.RageRecoverFactor = externs.RageRecoverFactor

		assert(this.RageRecoverFactor ~= nil, "External variable `RageRecoverFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:HURTED"
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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_14016",
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

			if global.ProbTest(_env, this.RateFactor) then
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RageRecoverFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_14001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.UnCritRateFactor = externs.UnCritRateFactor

		assert(this.UnCritRateFactor ~= nil, "External variable `UnCritRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+uncritrate", {
				"+Normal",
				"+Normal"
			}, this.UnCritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14001",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_14002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14002",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_14003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.StepDefRateFactor = externs.StepDefRateFactor

		assert(this.StepDefRateFactor ~= nil, "External variable `StepDefRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14003_Hp",
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
			local buffeft2 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.StepDefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14003_StepDef",
				timing = 0,
				limit = 5,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Boots_14004 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14004",
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

			global.ApplyHPRecovery(_env, _env.ACTOR, maxHp * this.HealRateFactor)
		end)

		return _env
	end
}
all.EquipSkill_Boots_14005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14005",
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
			local hpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR)

			if hpRatio < 0.5 then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPRecovery(_env, _env.ACTOR, maxHp * this.HealRateFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_14006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.CritStrgFactor = externs.CritStrgFactor

		assert(this.CritStrgFactor ~= nil, "External variable `CritStrgFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+critstrg", {
				"+Normal",
				"+Normal"
			}, this.CritStrgFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14006",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_14007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14007",
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

			if global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) < 0.5 then
				local buffeft2 = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, this.AbsorptionRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "EquipSkill_Boots_14007_Abs",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"EquipSkill_Boots_14007_Abs"
					}
				}, {
					buffeft2
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				if _env.prevHpPercent >= 50 and _env.curHpPercent < 50 then
					local buffeft2 = global.NumericEffect(_env, "+absorption", {
						"+Normal",
						"+Normal"
					}, this.AbsorptionRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Boots_14007_Abs",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Boots_14007_Abs"
						}
					}, {
						buffeft2
					})
				end

				if _env.prevHpPercent < 50 and _env.curHpPercent >= 50 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_14007_Abs", "UNDISPELLABLE"), 99)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_14008 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14008_Def",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Boots_14008_Def"
				}
			}, {
				buffeft1
			})
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				if _env.prevHpPercent >= 50 and _env.curHpPercent < 50 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_14008_Def", "UNDISPELLABLE"), 99)

					local buffeft2 = global.NumericEffect(_env, "+critrate", {
						"+Normal",
						"+Normal"
					}, this.CritRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Boots_14008_Crit",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Boots_14008_Crit"
						}
					}, {
						buffeft2
					})
				end

				if _env.prevHpPercent < 50 and _env.curHpPercent >= 50 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_14008_Crit", "UNDISPELLABLE"), 99)

					local buffeft3 = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, this.DefRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Boots_14008_Def",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Boots_14008_Def"
						}
					}, {
						buffeft3
					})
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_14009 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.RageRate = externs.RageRate

		assert(this.RageRate ~= nil, "External variable `RageRate` is not provided.")

		this.RageFactor = externs.RageFactor

		assert(this.RageFactor ~= nil, "External variable `RageFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14009",
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

			if global.ProbTest(_env, this.RageRate) then
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_14010 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbsorptionRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14010",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_14011 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.AtkWeakenRateFactor = externs.AtkWeakenRateFactor

		assert(this.AtkWeakenRateFactor ~= nil, "External variable `AtkWeakenRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+atkweaken", {
				"+Normal",
				"+Normal"
			}, this.AtkWeakenRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14011",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_14012 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.RandomDefRateFactor = externs.RandomDefRateFactor

		assert(this.RandomDefRateFactor ~= nil, "External variable `RandomDefRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14012",
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

			for _, unit in global.__iter__(global.RandomN(_env, 1, global.FriendUnits(_env))) do
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.RandomDefRateFactor)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 2,
					display = "DefUp",
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"DEFUP",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_14013 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.RandomDefRateFactor = externs.RandomDefRateFactor

		assert(this.RandomDefRateFactor ~= nil, "External variable `RandomDefRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14013",
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

			for _, unit in global.__iter__(global.RandomN(_env, 1, global.EnemyUnits(_env))) do
				local buffeft2 = global.NumericEffect(_env, "-defrate", {
					"+Normal",
					"+Normal"
				}, this.RandomDefRateFactor)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 2,
					display = "DefDown",
					tags = {
						"STATUS",
						"NUMERIC",
						"DEBUFF",
						"DEFDOWN",
						"DISPELLABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_14014 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.DispelRateFactor = externs.DispelRateFactor

		assert(this.DispelRateFactor ~= nil, "External variable `DispelRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14014",
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

			if global.ProbTest(_env, this.DispelRateFactor) then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "DEBUFF", "DISPELLABLE"), 1)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_14015 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.RageFactor = externs.RageFactor

		assert(this.RageFactor ~= nil, "External variable `RageFactor` is not provided.")

		this.AOERateFactor = externs.AOERateFactor

		assert(this.AOERateFactor ~= nil, "External variable `AOERateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, this.AOERateFactor)
			local buffeft3 = global.NumericEffect(_env, "+curerate", {
				"+Normal",
				"+Normal"
			}, this.CureRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_14015",
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

			global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbsorptionRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14001",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+Summoned_DmgExtra_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14002",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefWeakenRateFactor = externs.DefWeakenRateFactor

		assert(this.DefWeakenRateFactor ~= nil, "External variable `DefWeakenRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+Warrior_DmgExtra_defweaken", {
				"+Normal",
				"+Normal"
			}, this.DefWeakenRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14003",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14004 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+Healer_DmgExtra_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)
			local buffeft3 = global.SpecialNumericEffect(_env, "+Light_DmgExtra_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14004",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+killcritrate_self", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14005",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpDmgRateFactor = externs.HpDmgRateFactor

		assert(this.HpDmgRateFactor ~= nil, "External variable `HpDmgRateFactor` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.EffectRateFactor = externs.EffectRateFactor

		assert(this.EffectRateFactor ~= nil, "External variable `EffectRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

			global.ApplyHPReduce(_env, _env.ACTOR, maxHp * this.HpDmgRateFactor)

			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+effectrate", {
				"+Normal",
				"+Normal"
			}, this.EffectRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14006",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"ATKUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+blockrecoveryrate", {
				"+Normal",
				"+Normal"
			}, this.HealRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14007",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14008 = {
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				display = "Shield",
				group = "EquipSkill_Accesory_14008",
				duration = 3,
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14009 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "CURSE"))

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14009",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14010 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.RateFactor)
			local buffeft2 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.RateFactor)
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft3 = global.MaxHpEffect(_env, maxHp * this.RateFactor)
			local buffeft4 = global.NumericEffect(_env, "*speed", {
				"+Normal",
				"+Normal"
			}, this.RateFactor)
			local buffeft5 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DAZE"))

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14010",
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
				buffeft3,
				buffeft4,
				buffeft5
			})
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14011 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DEFDOWN"))

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14011",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14012 = {
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

			if global.FriendMaster(_env) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

				global.ApplyBuff(_env, global.FriendMaster(_env), {
					timing = 2,
					display = "Shield",
					group = "EquipSkill_Accesory_14012",
					duration = 2,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SHIELD",
						"DISPELLABLE",
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
all.EquipSkill_Accesory_14013 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.RandomAtkRateFactor = externs.RandomAtkRateFactor

		assert(this.RandomAtkRateFactor ~= nil, "External variable `RandomAtkRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14013",
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

			for _, unit in global.__iter__(global.RandomN(_env, 1, global.FriendUnits(_env))) do
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.RandomAtkRateFactor)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 1,
					display = "atkrate",
					tags = {
						"NUMERIC",
						"BUFF",
						"ATKRATEUP",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14014 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.DispelRateFactor = externs.DispelRateFactor

		assert(this.DispelRateFactor ~= nil, "External variable `DispelRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14014",
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

			if global.ProbTest(_env, this.DispelRateFactor) then
				for _, unit in global.__iter__(global.RandomN(_env, 1, global.FriendUnits(_env))) do
					global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "DEBUFF", "DISPELLABLE"), 1)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14015 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14015",
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

			if global.ProbTest(_env, this.RateFactor) then
				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), 1)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14016 = {
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
			_env.unit = global.FriendMaster(_env)

			if _env.unit then
				local healer = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")

				global.ApplyHPRecovery(_env, _env.unit, healer.atk * this.HealRateFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14017 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.SkillRateFactor = externs.SkillRateFactor

		assert(this.SkillRateFactor ~= nil, "External variable `SkillRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, this.SkillRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14017",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14018 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.SkillRateFactor = externs.SkillRateFactor

		assert(this.SkillRateFactor ~= nil, "External variable `SkillRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_PROUD"
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14018",
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
			local buffeft2 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, this.SkillRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"SKILLRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			})
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14019 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.BackRateFactor1 = externs.BackRateFactor1

		if this.BackRateFactor1 == nil then
			this.BackRateFactor1 = 0.4
		end

		this.BackRateFactor2 = externs.BackRateFactor2

		if this.BackRateFactor2 == nil then
			this.BackRateFactor2 = 1
		end

		this.BackRateFactor_now = 0
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14019",
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

			if global.SpecialPropGetter(_env, "EquipSkill_Accesory_14019")(_env, global.FriendField(_env)) == 0 then
				if global.EnemyMaster(_env) then
					if global.MARKED(_env, "Player_Master")(_env, global.EnemyMaster(_env)) then
						this.BackRateFactor_now = this.BackRateFactor1
						local buffeft3 = global.SpecialNumericEffect(_env, "+Accesory_14019", {
							"+Normal",
							"+Normal"
						}, this.BackRateFactor_now)

						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"NUMERIC",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft3
						})
					else
						this.BackRateFactor_now = this.BackRateFactor2
						local buffeft4 = global.SpecialNumericEffect(_env, "+Accesory_14019", {
							"+Normal",
							"+Normal"
						}, this.BackRateFactor_now)

						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"NUMERIC",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft4
						})
					end
				else
					this.BackRateFactor_now = this.BackRateFactor2
					local buffeft4 = global.SpecialNumericEffect(_env, "+Accesory_14019", {
						"+Normal",
						"+Normal"
					}, this.BackRateFactor_now)

					global.ApplyBuff(_env, global.FriendField(_env), {
						timing = 0,
						duration = 99,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft4
					})
				end
			end

			local buffeft2 = global.SpecialNumericEffect(_env, "+EquipSkill_Accesory_14019", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			})
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
			local count = global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "LDYu_Back_Count"))

			if global.FriendMaster(_env) and count < 2 and global.MARKED(_env, "LDYu")(_env, _env.ACTOR) and global.SelectBuffCount(_env, global.FriendMaster(_env), global.BUFF_MARKED(_env, "LDYu_Passive_Time")) > 0 then
				return
			end

			if global.FriendMaster(_env) and not global.INSTATUS(_env, "Skill_BEr_Passive_Death_SecondTime")(_env, global.FriendMaster(_env)) and global.MARKED(_env, "BEr")(_env, _env.ACTOR) then
				return
			end

			if global.SelectTrapCount(_env, global.GetCell(_env, _env.ACTOR), global.BUFF_MARKED(_env, "GCZi_jianzhen")) > 0 then
				return
			end

			local BackRateFactor_now = global.SpecialPropGetter(_env, "Accesory_14019")(_env, global.FriendField(_env))
			local times = global.SpecialPropGetter(_env, "EquipSkill_Accesory_14019_times")(_env, global.FriendField(_env))
			BackRateFactor_now = BackRateFactor_now * 0.5^times

			if global.ProbTest(_env, BackRateFactor_now) then
				local buffeft2 = global.SpecialNumericEffect(_env, "+EquipSkill_Accesory_14019_times", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})

				local card = global.BackToCard_ResultCheck(_env, _env.ACTOR, "card")

				if card then
					global.Kick(_env, _env.ACTOR)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_14020 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_14020",
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

			if global.ProbTest(_env, this.RateFactor) then
				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), 1)
			end
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 3,
				group = "EquipSkill_Weapon_13001",
				timing = 2,
				limit = 3,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13002",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13003",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13004 = {
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
			local buffeft1 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13004",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefWeakenRateFactor = externs.DefWeakenRateFactor

		assert(this.DefWeakenRateFactor ~= nil, "External variable `DefWeakenRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defweaken", {
				"+Normal",
				"+Normal"
			}, this.DefWeakenRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13005",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13006 = {
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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13006",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13007 = {
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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 3,
				group = "EquipSkill_Weapon_13007",
				timing = 2,
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13008 = {
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
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13008",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13009 = {
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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13009",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13010 = {
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+LowerHpCheckRate_PETS", {
				"+Normal",
				"+Normal"
			}, 0.5)
			local buffeft2 = global.SpecialNumericEffect(_env, "+LowerHp_DmgExtra_PETS_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13010",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13011 = {
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
			local buffeft1 = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, this.AOERateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13011",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13012 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnBlockRateFactor = externs.UnBlockRateFactor

		assert(this.UnBlockRateFactor ~= nil, "External variable `UnBlockRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+unblockrate", {
				"+Normal",
				"+Normal"
			}, this.UnBlockRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13012",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13013 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EffectRateFactor = externs.EffectRateFactor

		assert(this.EffectRateFactor ~= nil, "External variable `EffectRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+effectrate", {
				"+Normal",
				"+Normal"
			}, this.EffectRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13013",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13014 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DeBeCuredRateFactor = externs.DeBeCuredRateFactor

		assert(this.DeBeCuredRateFactor ~= nil, "External variable `DeBeCuredRateFactor` is not provided.")

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+afteratk_debecuredrate", {
				"+Normal",
				"+Normal"
			}, this.DeBeCuredRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13014",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"DEBUFF",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13015 = {
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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13015",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13016 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkWeakenRateFactor = externs.AtkWeakenRateFactor

		assert(this.AtkWeakenRateFactor ~= nil, "External variable `AtkWeakenRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+atkweaken", {
				"+Normal",
				"+Normal"
			}, this.AtkWeakenRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13016",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13017 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpRatioFactor = externs.HpRatioFactor

		assert(this.HpRatioFactor ~= nil, "External variable `HpRatioFactor` is not provided.")

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+LowerHp_HealExtra_RatioCheck", {
				"+Normal",
				"+Normal"
			}, this.HpRatioFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+LowerHp_HealExtra_ExtraRate", {
				"+Normal",
				"+Normal"
			}, this.HealRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13017",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13018 = {
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
			local buffeft1 = global.NumericEffect(_env, "+curerate", {
				"+Normal",
				"+Normal"
			}, this.CureRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13018",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13019 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13019",
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
		end)

		return _env
	end
}
all.EquipSkill_Weapon_13020 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Weapon_13020",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_13001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13001",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_13002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

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

			if global.ProbTest(_env, this.RateFactor) then
				local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 1,
					display = "CureRateUp",
					duration = 3,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNHURTRATEUP",
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
all.EquipSkill_Armor_13003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13003",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_13004 = {
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
			local buffeft1 = global.NumericEffect(_env, "+becuredrate", {
				"+Normal",
				"+Normal"
			}, this.BeCuredRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13004",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_13005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13005",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_13006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnBlockRateFactor = externs.UnBlockRateFactor

		assert(this.UnBlockRateFactor ~= nil, "External variable `UnBlockRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+unblockrate", {
				"+Normal",
				"+Normal"
			}, this.UnBlockRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13006",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_13007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpRatioFactor = externs.HpRatioFactor

		assert(this.HpRatioFactor ~= nil, "External variable `HpRatioFactor` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				if _env.prevHpPercent >= this.HpRatioFactor * 100 and _env.curHpPercent < this.HpRatioFactor * 100 then
					local buffeft1 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.AtkRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Armor_13007",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Armor_13007"
						}
					}, {
						buffeft1
					})
				end

				if _env.prevHpPercent < this.HpRatioFactor * 100 and _env.curHpPercent >= this.HpRatioFactor * 100 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_13007", "UNDISPELLABLE"), 99)
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_13008 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13008",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_13009 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13009",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_13010 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpRatioFactor = externs.HpRatioFactor

		assert(this.HpRatioFactor ~= nil, "External variable `HpRatioFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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
			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13010",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"EquipSkill_Armor_13010"
				}
			}, {
				buffeft1
			})
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				if _env.prevHpPercent >= this.HpRatioFactor * 100 and _env.curHpPercent < this.HpRatioFactor * 100 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_13010", "UNDISPELLABLE"), 99)
				end

				if _env.prevHpPercent < this.HpRatioFactor * 100 and _env.curHpPercent >= this.HpRatioFactor * 100 then
					local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.UnHurtRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "EquipSkill_Armor_13010",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"EquipSkill_Armor_13010"
						}
					}, {
						buffeft1
					})
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Armor_13011 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnCritRateFactor = externs.UnCritRateFactor

		assert(this.UnCritRateFactor ~= nil, "External variable `UnCritRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+uncritrate", {
				"+Normal",
				"+Normal"
			}, this.UnCritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13011",
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
		end)

		return _env
	end
}
all.EquipSkill_Armor_13012 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Armor_13012",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_13001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

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

			if global.ProbTest(_env, this.RateFactor) then
				local buffeft1 = global.NumericEffect(_env, "+blockrate", {
					"+Normal",
					"+Normal"
				}, this.BlockRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 2,
					display = "BlockRateUp",
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"BLOCKRATEUP",
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
all.EquipSkill_Boots_13002 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_13002",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_13003 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_13003",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_13004 = {
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
			local buffeft1 = global.NumericEffect(_env, "+becuredrate", {
				"+Normal",
				"+Normal"
			}, this.BeCuredRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_13004",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_13005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_13005",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_13006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

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

			if global.ProbTest(_env, this.RateFactor) then
				local buffeft1 = global.NumericEffect(_env, "+critrate", {
					"+Normal",
					"+Normal"
				}, this.CritRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 1,
					display = "CritRateUp",
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"BLOCKRATEUP",
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
all.EquipSkill_Boots_13007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_13007",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_13008 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnCritRateFactor = externs.UnCritRateFactor

		assert(this.UnCritRateFactor ~= nil, "External variable `UnCritRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+uncritrate", {
				"+Normal",
				"+Normal"
			}, this.UnCritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_13008",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_13009 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_13009",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_13010 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

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

			if global.ProbTest(_env, this.RateFactor) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local heal = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")

				global.ApplyHPRecovery(_env, _env.ACTOR, maxHp * this.HealRateFactor)
			end
		end)

		return _env
	end
}
all.EquipSkill_Boots_13011 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_13011",
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
		end)

		return _env
	end
}
all.EquipSkill_Boots_13012 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SpeedRateFactor = externs.SpeedRateFactor

		assert(this.SpeedRateFactor ~= nil, "External variable `SpeedRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "*speed", {
				"+Normal",
				"+Normal"
			}, this.SpeedRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Boots_13012",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13001 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_ACTION"
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

			if global.ProbTest(_env, this.RateFactor) then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					display = "HurtRateUp",
					group = "EquipSkill_Accesory_13001",
					duration = 1,
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
all.EquipSkill_Accesory_13002 = {
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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13002",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13003 = {
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
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13003",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13004 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CritStrgFactor = externs.CritStrgFactor

		assert(this.CritStrgFactor ~= nil, "External variable `CritStrgFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+critstrg", {
				"+Normal",
				"+Normal"
			}, this.CritStrgFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13004",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13005 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

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

			if global.ProbTest(_env, this.RateFactor) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					display = "Shield",
					group = "EquipSkill_Accesory_13005",
					duration = 2,
					limit = 1,
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
all.EquipSkill_Accesory_13006 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13006",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13007 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13007",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13008 = {
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
			local buffeft1 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13008",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13009 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EffectRateFactor = externs.EffectRateFactor

		assert(this.EffectRateFactor ~= nil, "External variable `EffectRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+effectrate", {
				"+Normal",
				"+Normal"
			}, this.EffectRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13009",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13010 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnEffectRateFactor = externs.UnEffectRateFactor

		assert(this.UnEffectRateFactor ~= nil, "External variable `UnEffectRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+uneffectrate", {
				"+Normal",
				"+Normal"
			}, this.UnEffectRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13010",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13011 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

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

			if global.ProbTest(_env, this.RateFactor) then
				for _, unit in global.__iter__(global.RandomN(_env, 1, global.FriendUnits(_env))) do
					local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.UnHurtRateFactor)

					global.ApplyBuff(_env, unit, {
						timing = 2,
						duration = 2,
						display = "UnHurtRateUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"UNHURTRATEUP",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13012 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AbsorpRateFactor = externs.AbsorpRateFactor

		assert(this.AbsorpRateFactor ~= nil, "External variable `AbsorpRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbsorpRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13012",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13013 = {
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
			local buffeft1 = global.NumericEffect(_env, "+curerate", {
				"+Normal",
				"+Normal"
			}, this.CureRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13013",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13014 = {
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
			local buffeft1 = global.NumericEffect(_env, "+becuredrate", {
				"+Normal",
				"+Normal"
			}, this.BeCuredRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13014",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13015 = {
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
			local buffeft1 = global.NumericEffect(_env, "+reflection", {
				"+Normal",
				"+Normal"
			}, this.ReflectRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13015",
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
		end)

		return _env
	end
}
all.EquipSkill_Accesory_13016 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SkillRateFactor = externs.SkillRateFactor

		assert(this.SkillRateFactor ~= nil, "External variable `SkillRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, this.SkillRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Accesory_13016",
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
		end)

		return _env
	end
}
all.EquipSkill_Decoration_15000 = {
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
			local buffeft1 = global.NumericEffect(_env, "+singlerate", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Decoration_15000",
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
		end)

		return _env
	end
}
all.EquipSkill_Decoration_15001 = {
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
			local buffeft1 = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "EquipSkill_Decoration_15001",
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
		end)

		return _env
	end
}

return _M
