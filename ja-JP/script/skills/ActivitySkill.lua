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
				else
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
				else
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

return _M
