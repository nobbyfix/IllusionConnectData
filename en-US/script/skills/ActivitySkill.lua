local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Enemy_CrystalLingling_Passive_Death = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkBuffFactor = externs.AtkBuffFactor

		if this.AtkBuffFactor == nil then
			this.AtkBuffFactor = 0.1
		end

		this.BuffDuration = externs.BuffDuration

		if this.BuffDuration == nil then
			this.BuffDuration = 10
		end

		this.BuffMaxLimit = externs.BuffMaxLimit

		if this.BuffMaxLimit == nil then
			this.BuffMaxLimit = 3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			200
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.TARGET = externs.TARGET

		assert(_env.TARGET ~= nil, "External variable `TARGET` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkBuffFactor)

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					timing = 4,
					display = "AtkUp",
					group = "Enemy_CrystalLingling_Passive_Death",
					duration = this.BuffDuration,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"DISPELLABLE",
						"STEALABLE"
					},
					limit = this.BuffMaxLimit
				}, {
					buffeft
				}, 1, 0)
			end
		end)

		return _env
	end
}
all.Trap_Boss_Self_Damage_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.TrapNum = externs.TrapNum

		if this.TrapNum == nil then
			this.TrapNum = 3
		end

		this.BossDamage = externs.BossDamage

		if this.BossDamage == nil then
			this.BossDamage = 0.35
		end

		this.MasterDamage = externs.MasterDamage

		if this.MasterDamage == nil then
			this.MasterDamage = 0.35
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:PRE_ENTER"
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
			local buff = global.SpecialNumericEffect(_env, "+boss_damage_bingo", {
				"?Normal"
			}, 1)
			local trap = global.BuffTrap(_env, {
				timing = 2,
				duration = 1,
				tags = {
					"BINGO"
				}
			}, {
				buff
			})

			for _, cell in global.__iter__(global.RandomN(_env, this.TrapNum, global.EnemyCells(_env, global.EMPTY_CELL(_env)))) do
				global.ApplyTrap(_env, cell, {
					display = "",
					duration = 99,
					triggerLife = 1
				}, {
					trap
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "BINGO")) > 0 then
					local Hp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

					global.AddAnim(_env, {
						loop = 1,
						anim = "cisha_zhanshupai",
						zOrder = "TopLayer",
						pos = global.UnitPos(_env, _env.ACTOR)
					})
					global.ApplyHPDamage(_env, _env.ACTOR, Hp * this.BossDamage)
				elseif global.EnemyMaster(_env) then
					local Hp = global.UnitPropGetter(_env, "maxHp")(_env, global.EnemyMaster(_env))

					global.AddAnim(_env, {
						loop = 1,
						anim = "cisha_zhanshupai",
						zOrder = "TopLayer",
						pos = global.UnitPos(_env, global.EnemyMaster(_env))
					})
					global.ApplyHPDamage(_env, global.EnemyMaster(_env), Hp * this.MasterDamage)
				end
			end
		end)

		return _env
	end
}
all.Trap_Boss_Unhurtrate_Down_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.TrapNum = externs.TrapNum

		if this.TrapNum == nil then
			this.TrapNum = 5
		end

		this.BossDown = externs.BossDown

		if this.BossDown == nil then
			this.BossDown = 0.2
		end

		this.MasterDamage = externs.MasterDamage

		if this.MasterDamage == nil then
			this.MasterDamage = 0.3
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:PRE_ENTER"
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
			local buff = global.SpecialNumericEffect(_env, "+boss_damage_bingo", {
				"?Normal"
			}, 1)
			local trap = global.BuffTrap(_env, {
				timing = 2,
				duration = 1,
				tags = {
					"BINGO"
				}
			}, {
				buff
			})

			for _, cell in global.__iter__(global.RandomN(_env, this.TrapNum, global.EnemyCells(_env, global.EMPTY_CELL(_env)))) do
				global.ApplyTrap(_env, cell, {
					display = "Freeze",
					duration = 99,
					triggerLife = 1
				}, {
					trap
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "BINGO")) > 0 then
					local buffeft = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.BossDown)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "UnHurtRateDown",
						tags = {
							"NUMERIC",
							"DEBUFF",
							"UNHURTRATEDOWN"
						}
					}, {
						buffeft
					})
				elseif global.EnemyMaster(_env) then
					local Hp = global.UnitPropGetter(_env, "maxHp")(_env, global.EnemyMaster(_env))

					global.AddAnim(_env, {
						loop = 1,
						anim = "cisha_zhanshupai",
						zOrder = "TopLayer",
						pos = global.UnitPos(_env, global.EnemyMaster(_env))
					})
					global.ApplyHPDamage(_env, global.EnemyMaster(_env), Hp * this.MasterDamage)
				end
			end
		end)

		return _env
	end
}
all.Skill_Infinite_Summon_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.summonFactorHp = externs.summonFactorHp

		assert(this.summonFactorHp ~= nil, "External variable `summonFactorHp` is not provided.")

		this.summonFactorAtk = externs.summonFactorAtk

		assert(this.summonFactorAtk ~= nil, "External variable `summonFactorAtk` is not provided.")

		this.summonFactorDef = externs.summonFactorDef

		assert(this.summonFactorDef ~= nil, "External variable `summonFactorDef` is not provided.")

		this.DmgRateFactor = externs.DmgRateFactor

		assert(this.DmgRateFactor ~= nil, "External variable `DmgRateFactor` is not provided.")

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
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
			300
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK"
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
			local SummonedLDu1 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				global.Random(_env, 1, 9)
			})

			if SummonedLDu1 then
				global.AddStatus(_env, SummonedLDu1, "SummonedLDu")

				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, this.DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu1, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu2 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				global.Random(_env, 1, 9)
			})

			if SummonedLDu2 then
				global.AddStatus(_env, SummonedLDu2, "SummonedLDu")

				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, this.DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu2, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu3 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				global.Random(_env, 1, 9)
			})

			if SummonedLDu3 then
				global.AddStatus(_env, SummonedLDu3, "SummonedLDu")

				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, this.DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu3, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu4 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				global.Random(_env, 1, 9)
			})

			if SummonedLDu4 then
				global.AddStatus(_env, SummonedLDu4, "SummonedLDu")

				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, this.DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu4, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu5 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				global.Random(_env, 1, 9)
			})

			if SummonedLDu5 then
				global.AddStatus(_env, SummonedLDu5, "SummonedLDu")

				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, this.DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu5, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu6 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				global.Random(_env, 1, 9)
			})

			if SummonedLDu6 then
				global.AddStatus(_env, SummonedLDu6, "SummonedLDu")

				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, this.DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu6, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu7 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				global.Random(_env, 1, 9)
			})

			if SummonedLDu7 then
				global.AddStatus(_env, SummonedLDu7, "SummonedLDu")

				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, this.DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu7, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu8 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				global.Random(_env, 1, 9)
			})

			if SummonedLDu8 then
				global.AddStatus(_env, SummonedLDu8, "SummonedLDu")

				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, this.DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu8, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu9 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				global.Random(_env, 1, 9)
			})

			if SummonedLDu9 then
				global.AddStatus(_env, SummonedLDu9, "SummonedLDu")

				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, this.DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu9, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and _env.unit ~= _env.ACTOR then
				local SummonedLDu1 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
					global.abs(_env, global.GetCellId(_env, _env.unit))
				})

				if SummonedLDu1 then
					global.AddStatus(_env, SummonedLDu1, "SummonedLDu")

					local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
						"?Normal"
					}, this.DmgRateFactor)

					global.ApplyBuff(_env, SummonedLDu1, {
						timing = 0,
						duration = 99,
						tags = {
							"STATUS",
							"NUMERIC",
							"Skill_LDu_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
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
all.Skill_Stay_Immune_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Who = externs.Who

		if this.Who == nil then
			this.Who = "Enemy_Tombstone_Big"
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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				if global.MARKED(_env, this.Who)(_env, unit) then
					local buffeft1 = global.Immune(_env)
					local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ALL(_env, "DEBUFF"))

					global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
						timing = 0,
						duration = 99,
						display = "Immune",
						tags = {
							"STATUS",
							"BUFF",
							"IMMUNE",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"Skill_Stay_Immune_Passive"
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, this.Who)(_env, _env.unit) then
				local buffeft1 = global.Immune(_env)
				local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ALL(_env, "DEBUFF"))

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					timing = 0,
					duration = 99,
					display = "Immune",
					tags = {
						"STATUS",
						"BUFF",
						"IMMUNE",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_Stay_Immune_Passive"
					}
				}, {
					buffeft1,
					buffeft2
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
			local count = 0

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "IMMUNE", "UNDISPELLABLE", "UNSTEALABLE", "Skill_Stay_Immune_Passive"), 1)
			end
		end)

		return _env
	end
}
all.Skill_Buff_Overlying = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Mode = externs.Mode

		if this.Mode == nil then
			this.Mode = 0
		end

		this.Factor = externs.Factor

		if this.Factor == nil then
			this.Factor = 0
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local num = 0
			local buff = nil

			for _, unit_neighbor in global.__iter__(global.AllUnits(_env, global.NEIGHBORS_OF(_env, _env.unit) - global.ONESELF(_env, _env.unit))) do
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit_neighbor)
				num = num + 1

				if this.Mode == 1 then
					buff = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.Factor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, unit_neighbor, {
						timing = 0,
						duration = 99,
						display = "HurtRateUp",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"HURTRATEUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				elseif this.Mode == 2 then
					buff = global.NumericEffect(_env, "+unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.Factor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, unit_neighbor, {
						timing = 0,
						duration = 99,
						display = "UnHurtRateUp",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"UNHURTRATEUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				elseif this.Mode == 3 then
					buff = global.NumericEffect(_env, "+critrate", {
						"+Normal",
						"+Normal"
					}, this.Factor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, unit_neighbor, {
						timing = 0,
						duration = 99,
						display = "CritRateUp",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"CRITRATEUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				elseif this.Mode == 4 then
					buff = global.MaxHpEffect(_env, maxHp * this.Factor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, unit_neighbor, {
						timing = 0,
						duration = 99,
						display = "MaxHpUp",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"MAXHPUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				elseif this.Mode == 5 then
					buff = global.HPPeriodRecover(_env, "HOT", maxHp * this.Factor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, unit_neighbor, {
						timing = 1,
						duration = 99,
						display = "HOT",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"HOT",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				elseif this.Mode == -1 then
					buff = global.NumericEffect(_env, "-hurtrate", {
						"+Normal",
						"+Normal"
					}, this.Factor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit_neighbor, {
						timing = 0,
						duration = 99,
						display = "AtkDown",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"HURTRATEDOWN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				elseif this.Mode == -2 then
					buff = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.Factor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit_neighbor, {
						timing = 0,
						duration = 99,
						display = "UnHurtRateDown",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				elseif this.Mode == -3 then
					buff = global.NumericEffect(_env, "-critrate", {
						"+Normal",
						"+Normal"
					}, this.Factor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit_neighbor, {
						timing = 0,
						duration = 99,
						display = "CritRateDown",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"CRITRATEDOWN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				elseif this.Mode == -4 then
					buff = global.MaxHpEffect(_env, -maxHp * this.Factor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit_neighbor, {
						timing = 0,
						duration = 99,
						display = "MaxHpDown",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"MAXHPDOWN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				elseif this.Mode == -5 then
					buff = global.HPPeriodRecover(_env, "Poison", maxHp * this.Factor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit_neighbor, {
						timing = 1,
						duration = 99,
						display = "Poison",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"POISON",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			end

			if this.Mode == 1 then
				for i = 1, num do
					global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = "HurtRateUp",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"HURTRATEUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			elseif this.Mode == 2 then
				for i = 1, num do
					global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = "UnHurtRateUp",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"UNHURTRATEUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			elseif this.Mode == 3 then
				for i = 1, num do
					global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = "CritRateUp",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"CRITRATEUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			elseif this.Mode == 4 then
				for i = 1, num do
					global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = "MaxHpUp",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"MAXHPUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			elseif this.Mode == 5 then
				for i = 1, num do
					global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
						timing = 1,
						duration = 99,
						display = "HOT",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"BUFF",
							"HOT",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			elseif this.Mode == -1 then
				for i = 1, num do
					global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = "HurtRateDown",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"HURTRATEDOWN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			elseif this.Mode == -2 then
				for i = 1, num do
					global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = "UnHurtRateDown",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			elseif this.Mode == -3 then
				for i = 1, num do
					global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = "CritRateDown",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"CRITRATEDOWN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			elseif this.Mode == -4 then
				for i = 1, num do
					global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = "MaxHpDown",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"MAXHPDOWN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
			elseif this.Mode == -5 then
				for i = 1, num do
					global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
						timing = 1,
						duration = 99,
						display = "Poison",
						tags = {
							"Skill_Buff_Overlying",
							"STATUS",
							"NUMERIC",
							"DEBUFF",
							"POISON",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					}, 1, 0)
				end
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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit1 in global.__iter__(global.AllUnits(_env, global.NEIGHBORS_OF(_env, _env.unit) - global.ONESELF(_env, _env.unit))) do
				global.DispelBuff(_env, unit1, global.BUFF_MARKED_ALL(_env, "Skill_Buff_Overlying", "UNDISPELLABLE", "UNSTEALABLE"), 1)
			end
		end)

		return _env
	end
}
all.Skill_Infinite_Summon_New = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.summonFactorHp = externs.summonFactorHp

		assert(this.summonFactorHp ~= nil, "External variable `summonFactorHp` is not provided.")

		this.summonFactorAtk = externs.summonFactorAtk

		assert(this.summonFactorAtk ~= nil, "External variable `summonFactorAtk` is not provided.")

		this.summonFactorDef = externs.summonFactorDef

		assert(this.summonFactorDef ~= nil, "External variable `summonFactorDef` is not provided.")

		this.BoomFirstNum = externs.BoomFirstNum

		assert(this.BoomFirstNum ~= nil, "External variable `BoomFirstNum` is not provided.")

		this.BoomLocation = externs.BoomLocation

		assert(this.BoomLocation ~= nil, "External variable `BoomLocation` is not provided.")

		this.BoomAllNum = externs.BoomAllNum

		assert(this.BoomAllNum ~= nil, "External variable `BoomAllNum` is not provided.")

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
		this.count = 0
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
			300
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK"
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
			local units = global.FriendUnits(_env)

			for i = 1, this.BoomFirstNum do
				local SummonedBoom = false
				SummonedBoom = global.Summon(_env, _env.ACTOR, "SummonedBoom", this.summonFactor, nil, this.BoomLocation)

				if SummonedBoom then
					global.AddStatus(_env, SummonedBoom, "SummonedBoom")
				end
			end

			for i = 1, 9 - #units - this.BoomFirstNum do
				local SummonedNormal = false
				SummonedNormal = global.Summon(_env, _env.ACTOR, "SummonedNormal", this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})

				if SummonedNormal then
					global.AddStatus(_env, SummonedNormal, "SummonedNormal")
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
			200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and _env.unit ~= _env.ACTOR then
				local flag = global.Random(_env, 1, 10)

				if flag < 5 and this.count < this.BoomAllNum - this.BoomFirstNum then
					local SummonedBoom = global.Summon(_env, _env.ACTOR, "SummonedBoom", this.summonFactor, nil, this.BoomLocation)

					if SummonedBoom then
						global.AddStatus(_env, SummonedBoom, "SummonedBoom")

						this.count = this.count + 1
					end
				else
					local SummonedNormal = global.Summon(_env, _env.ACTOR, "SummonedNormal", this.summonFactor, nil, {
						global.Random(_env, 1, 9)
					})

					if SummonedNormal then
						global.AddStatus(_env, SummonedNormal, "SummonedNormal")
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_Boom_Death = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DmgRateFactor = externs.DmgRateFactor

		assert(this.DmgRateFactor ~= nil, "External variable `DmgRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			600
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.TARGET = externs.TARGET

		assert(_env.TARGET ~= nil, "External variable `TARGET` is not provided.")

		_env.i = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.Animation(_env, "die"))
		end)
		exec["@time"]({
			300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local damage = nil

			if global.EnemyMaster(_env) then
				local hp = global.UnitPropGetter(_env, "maxHp")(_env, global.EnemyMaster(_env))
				damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, global.EnemyMaster(_env), {
					1,
					1,
					0
				})
				damage.val = hp * this.DmgRateFactor
			end

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit)
				})
				global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)

		return _env
	end
}

function all.Condition_Shield_Up(_env, unit, shield, factor)
	local this = _env.this
	local global = _env.global

	if shield == 1 then
		local buff = global.NumericEffect(_env, "+unhurtrate", {
			"+Normal",
			"+Normal"
		}, factor)

		global.ApplyBuff(_env, unit, {
			timing = 0,
			duration = 99,
			display = "CShieldUnHurtRate",
			tags = {
				"Condition_Shield",
				"CShieldUnHurtRate",
				"UNDISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buff
		})
	elseif shield == 2 then
		local buff = global.Immune(_env)

		global.ApplyBuff(_env, unit, {
			timing = 0,
			duration = 99,
			display = "Immune",
			tags = {
				"Condition_Shield",
				"Immune",
				"UNDISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buff
		})
	elseif shield == 3 then
		local buff = global.RageGainEffect(_env, "+", {
			"+Normal",
			"+Normal"
		}, factor)

		global.ApplyBuff(_env, unit, {
			timing = 0,
			duration = 99,
			display = "CShieldRpUp",
			tags = {
				"Condition_Shield",
				"CShieldRpUp",
				"UNDISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buff
		})
	end

	return true
end

function all.Condition_Shield_Down(_env, unit, shield)
	local this = _env.this
	local global = _env.global

	if shield == 1 and global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "CShieldUnHurtRate")) > 0 then
		local buff = global.NumericEffect(_env, "+def", {
			"+Normal",
			"+Normal"
		}, 0)

		global.ApplyBuff(_env, unit, {
			timing = 2,
			duration = 1,
			display = "CShieldUnHurtRateBreak",
			tags = {}
		}, {
			buff
		})
		global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "CShieldUnHurtRate"), 99)
	elseif shield == 2 and global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "Immune")) > 0 then
		global.AddAnim(_env, {
			loop = 1,
			anim = "cisha_zhanshupai",
			zOrder = "TopLayer",
			pos = global.UnitPos(_env, unit)
		})

		local hp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

		global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "Immune"), 99)
		global.ApplyHPDamage(_env, unit, hp * 0.3)
	elseif shield == 3 and global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "CShieldRpUp")) > 0 then
		local buff = global.NumericEffect(_env, "+def", {
			"+Normal",
			"+Normal"
		}, 0)

		global.ApplyBuff(_env, unit, {
			timing = 2,
			duration = 1,
			display = "RageDown",
			tags = {}
		}, {
			buff
		})
		global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "CShieldRpUp"), 99)
	end
end

all.Skill_Condition_Shield = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldType = externs.ShieldType

		if this.ShieldType == nil then
			this.ShieldType = 0
		end

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0
		end

		this.AddShieldCondition = externs.AddShieldCondition

		if this.AddShieldCondition == nil then
			this.AddShieldCondition = 0
		end

		this.AddShieldTag = externs.AddShieldTag

		if this.AddShieldTag == nil then
			this.AddShieldTag = ""
		end

		this.AddShieldFactor = externs.AddShieldFactor

		if this.AddShieldFactor == nil then
			this.AddShieldFactor = 0
		end

		this.MoveShieldCondition = externs.MoveShieldCondition

		if this.MoveShieldCondition == nil then
			this.MoveShieldCondition = 0
		end

		this.MoveShieldTag = externs.MoveShieldTag

		if this.MoveShieldTag == nil then
			this.MoveShieldTag = ""
		end

		this.MoveShieldFactor = externs.MoveShieldFactor

		if this.MoveShieldFactor == nil then
			this.MoveShieldFactor = 0
		end

		this.flag = false
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
			"UNIT_DIE"
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
		local passive5 = __action(this, {
			name = "passive5",
			entry = prototype.passive5
		})
		passive5 = global["[duration]"](this, {
			0
		}, passive5)
		this.passive5 = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive5)
		local passive6 = __action(this, {
			name = "passive6",
			entry = prototype.passive6
		})
		passive6 = global["[duration]"](this, {
			0
		}, passive6)
		this.passive6 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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

			if this.AddShieldCondition == 0 then
				this.flag = global.Condition_Shield_Up(_env, _env.ACTOR, this.ShieldType, this.ShieldFactor)
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

			if this.MoveShieldCondition == 3 and this.flag then
				local buff_count_up = global.SpecialNumericEffect(_env, "+hurt_num_condition_down", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"Condition_Shield",
						"HURT_NUM"
					}
				}, {
					buff_count_up
				})

				local count = global.SpecialPropGetter(_env, "hurt_num_condition_down")(_env, _env.ACTOR)

				if count == this.MoveShieldFactor then
					global.Condition_Shield_Down(_env, _env.ACTOR, this.ShieldType)

					this.flag = false

					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "HURT_NUM"), 99)
				end
			end

			local buff_hurt = global.SpecialNumericEffect(_env, "+hurt_count", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "ShieldCondition_hurt_count",
				timing = 0,
				limit = 1,
				tags = {
					"COUNT",
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

			if this.AddShieldCondition == 1 then
				local buff_count_up = global.SpecialNumericEffect(_env, "+death_num_condition_up", {
					"+Normal",
					"+Normal"
				}, 1)

				if global.MARKED(_env, this.AddShieldTag)(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 0,
						duration = 99,
						tags = {
							"Condition_Shield",
							"DEATH_NUM"
						}
					}, {
						buff_count_up
					})

					local count = global.SpecialPropGetter(_env, "death_num_condition_up")(_env, _env.ACTOR)

					if count == this.AddShieldFactor then
						this.flag = global.Condition_Shield_Up(_env, _env.ACTOR, this.ShieldType, this.ShieldFactor)
					end
				end
			end

			if this.AddShieldCondition == 3 then
				local buff_count_player = global.SpecialNumericEffect(_env, "+death_num_condition_player", {
					"+Normal",
					"+Normal"
				}, 1)

				if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 0,
						duration = 99,
						tags = {
							"Condition_Shield",
							"DEATH_NUM"
						}
					}, {
						buff_count_player
					})

					local count = global.SpecialPropGetter(_env, "death_num_condition_player")(_env, _env.ACTOR)

					if count == this.AddShieldFactor then
						this.flag = global.Condition_Shield_Up(_env, _env.ACTOR, this.ShieldType, this.ShieldFactor)
					end
				end
			end

			if this.MoveShieldCondition == 1 and this.flag then
				local buff_count_down = global.SpecialNumericEffect(_env, "+death_num_condition_down", {
					"+Normal",
					"+Normal"
				}, 1)

				if global.MARKED(_env, this.MoveShieldTag)(_env, _env.unit) then
					if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 0,
							duration = 99,
							tags = {
								"Condition_Shield",
								"DEATH_NUM"
							}
						}, {
							buff_count_down
						})
					end

					local count = global.SpecialPropGetter(_env, "death_num_condition_down")(_env, _env.ACTOR)

					if count == this.MoveShieldFactor then
						global.Condition_Shield_Down(_env, _env.ACTOR, this.ShieldType)

						this.flag = false

						global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "DEATH_NUM"), 99)
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
				local hurt_count = global.SpecialPropGetter(_env, "hurt_count")(_env, _env.ACTOR)

				if hurt_count and hurt_count ~= 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "COUNT", "HURTED"), 99)

					if this.MoveShieldCondition == 4 and this.flag and global.MARKED(_env, this.MoveShieldTag)(_env, _env.unit) then
						local buff_count = global.SpecialNumericEffect(_env, "+count_tagbingo_any", {
							"+Normal",
							"+Normal"
						}, 1)

						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 0,
							duration = 99,
							tags = {
								"ANY",
								"TAGBINGO",
								"COUNT"
							}
						}, {
							buff_count
						})

						if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ANY", "TAGBINGO", "COUNT")) == this.MoveShieldFactor then
							global.Condition_Shield_Down(_env, _env.ACTOR, this.ShieldType)

							this.flag = false

							global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ANY", "TAGBINGO", "COUNT"), 99)
						end
					end
				end

				if this.MoveShieldCondition == 6 and this.flag and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "RPDOWN")) > 0 then
					local buff_count = global.SpecialNumericEffect(_env, "+count_rpdown", {
						"+Normal",
						"+Normal"
					}, 1)

					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 0,
						duration = 99,
						tags = {
							"ANY",
							"RPDOWN",
							"COUNT"
						}
					}, {
						buff_count
					})

					if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ANY", "RPDOWN", "COUNT")) == this.MoveShieldFactor then
						global.Condition_Shield_Down(_env, _env.ACTOR, this.ShieldType)

						this.flag = false

						global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ANY", "RPDOWN", "COUNT"), 99)
					end
				end
			end
		end)

		return _env
	end,
	passive5 = function (_env, externs)
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
				local hurt_count = global.SpecialPropGetter(_env, "hurt_count")(_env, _env.ACTOR)

				if hurt_count and hurt_count ~= 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "COUNT", "HURTED"), 99)

					if this.MoveShieldCondition == 5 and this.flag and global.MARKED(_env, this.MoveShieldTag)(_env, _env.unit) then
						local buff_count = global.SpecialNumericEffect(_env, "+count_tagbingo_unique", {
							"+Normal",
							"+Normal"
						}, 1)

						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 0,
							duration = 99,
							tags = {
								"UNIQUE",
								"TAGBINGO",
								"COUNT"
							}
						}, {
							buff_count
						})

						if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNIQUE", "TAGBINGO", "COUNT")) == this.MoveShieldFactor then
							global.Condition_Shield_Down(_env, _env.ACTOR, this.ShieldType)

							this.flag = false

							global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNIQUE", "TAGBINGO", "COUNT"), 99)
						end
					end

					if this.MoveShieldCondition == 4 and this.flag and global.MARKED(_env, this.MoveShieldTag)(_env, _env.unit) then
						local buff_count = global.SpecialNumericEffect(_env, "+count_tagbingo_any", {
							"+Normal",
							"+Normal"
						}, 1)

						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 0,
							duration = 99,
							tags = {
								"ANY",
								"TAGBINGO",
								"COUNT"
							}
						}, {
							buff_count
						})

						if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ANY", "TAGBINGO", "COUNT")) == this.MoveShieldFactor then
							global.Condition_Shield_Down(_env, _env.ACTOR, this.ShieldType)

							this.flag = false

							global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ANY", "TAGBINGO", "COUNT"), 99)
						end
					end
				end

				if this.MoveShieldCondition == 6 and this.flag and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "RPDOWN")) > 0 then
					local buff_count = global.SpecialNumericEffect(_env, "+count_rpdown", {
						"+Normal",
						"+Normal"
					}, 1)

					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 0,
						duration = 99,
						tags = {
							"ANY",
							"RPDOWN",
							"COUNT"
						}
					}, {
						buff_count
					})

					if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ANY", "RPDOWN", "COUNT")) == this.MoveShieldFactor then
						global.Condition_Shield_Down(_env, _env.ACTOR, this.ShieldType)

						this.flag = false

						global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ANY", "RPDOWN", "COUNT"), 99)
					end
				end
			end

			if this.AddShieldCondition == 2 then
				local buff_count_up = global.SpecialNumericEffect(_env, "+unique_num_condition_up", {
					"+Normal",
					"+Normal"
				}, 1)

				if global.MARKED(_env, this.AddShieldTag)(_env, _env.unit) then
					if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 0,
							duration = 99,
							tags = {
								"Condition_Shield",
								"UNIQUE_NUM"
							}
						}, {
							buff_count_up
						})
					end

					local count = global.SpecialPropGetter(_env, "unique_num_condition_up")(_env, _env.ACTOR)

					if count == this.AddShieldFactor then
						this.flag = global.Condition_Shield_Up(_env, _env.ACTOR, this.ShieldType, this.ShieldFactor)
					end
				end
			end

			if this.MoveShieldCondition == 2 and this.flag then
				local buff_count_down = global.SpecialNumericEffect(_env, "+unique_num_condition_down", {
					"+Normal",
					"+Normal"
				}, 1)

				if global.MARKED(_env, this.MoveShieldTag)(_env, _env.unit) then
					if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 0,
							duration = 99,
							tags = {
								"Condition_Shield",
								"UNIQUE_NUM"
							}
						}, {
							buff_count_down
						})
					end

					local count = global.SpecialPropGetter(_env, "unique_num_condition_down")(_env, _env.ACTOR)

					if count == this.MoveShieldFactor then
						global.Condition_Shield_Down(_env, _env.ACTOR, this.ShieldType)

						this.flag = false

						global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "UNIQUE_NUM"), 99)
					end
				end
			end

			if this.MoveShieldCondition == 7 and this.flag then
				local buff_count_down = global.SpecialNumericEffect(_env, "+player_unique_num_condition_down", {
					"+Normal",
					"+Normal"
				}, 1)

				if global.MARKED(_env, this.MoveShieldTag)(_env, _env.unit) then
					if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 0,
							duration = 99,
							tags = {
								"Condition_Shield",
								"PLAYER_UNIQUE_NUM"
							}
						}, {
							buff_count_down
						})
					end

					local count = global.SpecialPropGetter(_env, "player_unique_num_condition_down")(_env, _env.ACTOR)

					if count == this.MoveShieldFactor then
						global.Condition_Shield_Down(_env, _env.ACTOR, this.ShieldType)

						this.flag = false

						global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Condition_Shield", "PLAYER_UNIQUE_NUM"), 99)
					end
				end
			end
		end)

		return _env
	end,
	passive6 = function (_env, externs)
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

			if this.AddShieldCondition == 4 and global.MARKED(_env, this.AddShieldTag)(_env, _env.unit) and _env.curHpPercent / 100 <= this.AddShieldFactor and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "SET_CS")) == 0 then
				local buff_up = global.SpecialNumericEffect(_env, "+set_cs", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"Condition_Shield",
						"SET_CS"
					}
				}, {
					buff_up
				})

				this.flag = global.Condition_Shield_Up(_env, _env.ACTOR, this.ShieldType, this.ShieldFactor)
			end
		end)

		return _env
	end
}
all.Invisible_Immune = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BuffDuration = externs.BuffDuration

		if this.BuffDuration == nil then
			this.BuffDuration = 9999
		end

		this.TimingType = externs.TimingType

		if this.TimingType == nil then
			this.TimingType = 4
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
			local buffeft = global.Immune(_env)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = this.BuffDuration,
				timing = this.TimingType,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"Invisible_Immune"
				}
			}, {
				buffeft
			})
		end)

		return _env
	end
}

return _M
