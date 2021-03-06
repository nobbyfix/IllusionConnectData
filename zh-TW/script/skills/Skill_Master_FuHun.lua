local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Sk_Master_FuHun_Attack = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.dmgFactor = externs.dmgFactor

		if this.dmgFactor == nil then
			this.dmgFactor = {
				1,
				1,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1100
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

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.6,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Sk_Master_FuHun_Action1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.dmgFactor = externs.dmgFactor

		if this.dmgFactor == nil then
			this.dmgFactor = {
				1,
				3.6,
				0
			}
		end

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		main = global["[cut_in]"](this, {
			"1"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_FHun_Skill2"
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

		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)

			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Prepare",
				tags = {
					"PREPARE"
				}
			}, {
				buffeft1
			})

			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "CritRateUp",
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"CRITRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)

			for _, enemyunit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, enemyunit)
				global.ApplyRPEffect(_env, _env.ACTOR, enemyunit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, enemyunit, this.dmgFactor)

				global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, enemyunit, {
					0,
					500
				}, global.SplitValue(_env, damage, {
					0.5,
					0.5
				}))
			end
		end)
		exec["@time"]({
			3167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Sk_Master_FuHun_Action2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.dmgFactor = externs.dmgFactor

		if this.dmgFactor == nil then
			this.dmgFactor = {
				1,
				3.6,
				0
			}
		end

		this.HotRateFactor = externs.HotRateFactor

		assert(this.HotRateFactor ~= nil, "External variable `HotRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3100
		}, main)
		main = global["[cut_in]"](this, {
			"1"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_FHun_Skill3"
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

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)

			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Prepare",
				tags = {
					"PREPARE"
				}
			}, {
				buffeft1
			})
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
		end)
		exec["@time"]({
			2300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "DEBUFF", "DISPELLABLE"))

			local buffeft1 = global.Immune(_env)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DEBUFF"))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 1,
				duration = 2,
				display = "Immune",
				tags = {
					"STATUS",
					"BUFF",
					"IMMUNE",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1)

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft3 = global.HPPeriodRecover(_env, "HOT", maxHp * this.HotRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 1,
				duration = 2,
				display = "Hot",
				tags = {
					"STATUS",
					"BUFF",
					"HOT",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft3
			}, 1)
		end)
		exec["@time"]({
			3100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Sk_Master_FuHun_Action3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.dmgFactor = externs.dmgFactor

		if this.dmgFactor == nil then
			this.dmgFactor = {
				1,
				3.6,
				0
			}
		end

		this.AOERateFactor = externs.AOERateFactor

		assert(this.AOERateFactor ~= nil, "External variable `AOERateFactor` is not provided.")

		this.FreezeRateFactor = externs.FreezeRateFactor

		assert(this.FreezeRateFactor ~= nil, "External variable `FreezeRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3100
		}, main)
		main = global["[cut_in]"](this, {
			"1"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_FHun_Skill4"
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

		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")

			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)

			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Prepare",
				tags = {
					"PREPARE"
				}
			}, {
				buffeft1
			})
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill4"))
			global.HarmTargetView(_env, _env.units)
		end)
		exec["@time"]({
			1500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")

				local buffeft1 = global.NumericEffect(_env, "+aoerate", {
					"+Normal",
					"+Normal"
				}, this.AOERateFactor)
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
				local prob = global.EvalProb1(_env, attacker, defender, this.FreezeRateFactor, 0)

				if global.ProbTest(_env, prob) then
					local buffeft2 = global.Daze(_env)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 2,
						duration = 1,
						display = "Freeze",
						tags = {
							"STATUS",
							"DEBUFF",
							"FREEZE",
							"DISPELLABLE"
						}
					}, {
						buffeft2
					}, 1, 0)
				end
			end
		end)
		exec["@time"]({
			3100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Sk_Master_FuHun_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			0
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]

		exec["@time"]({
			0
		}, _env, function (_env)
		end)

		return _env
	end
}

return _M
