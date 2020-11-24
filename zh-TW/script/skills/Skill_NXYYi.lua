local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_NXYYi_Normal = {
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
			967
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
				-2.2,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			500
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
all.Skill_NXYYi_Proud = {
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
				1.5,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1067
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_NXYYi"
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
				-2.2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			600
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
all.Skill_NXYYi_Unique = {
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

		this.RageFactor = externs.RageFactor

		assert(this.RageFactor ~= nil, "External variable `RageFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3134
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_NXYYi"
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

			global.RetainObject(_env, _env.TARGET)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2.8,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			1600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				200,
				333,
				1000
			}, global.SplitValue(_env, damage, {
				0.15,
				0.15,
				0.35,
				0.35
			}))
		end)
		exec["@time"]({
			2933
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyRPDamage(_env, _env.TARGET, this.RageFactor)
			global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)

			local defender1 = global.LoadUnit(_env, _env.TARGET, "ALL")

			if defender1.rp == 0 then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					timing = 2,
					duration = 1,
					display = "Daze",
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
			end
		end)
		exec["@time"]({
			3134
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_NXYYi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DeRageGainFactor = externs.DeRageGainFactor

		assert(this.DeRageGainFactor ~= nil, "External variable `DeRageGainFactor` is not provided.")

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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local buffeft1 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, this.DeRageGainFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
					timing = 0,
					duration = 99,
					display = "AngerRateDown",
					tags = {
						"STATUS",
						"DEBUFF",
						"ANGERRATEDOWN",
						"Skill_NXYYi_Passive",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
			end

			local buffeft2 = global.NumericEffect(_env, "+defweaken", {
				"+Normal",
				"+Normal"
			}, 0.25)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "DefWeakenUp",
				group = "Skill_NXYYi_Passive_1",
				duration = 99,
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
				local buffeft1 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, this.DeRageGainFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
					timing = 0,
					duration = 99,
					display = "AngerRateDown",
					tags = {
						"STATUS",
						"DEBUFF",
						"ANGERRATEDOWN",
						"Skill_NXYYi_Passive",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "Skill_NXYYi_Passive", "UNDISPELLABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_NXYYi_Proud_EX = {
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
				1.5,
				0
			}
		end

		this.DefWeakenRateFactor = externs.DefWeakenRateFactor

		assert(this.DefWeakenRateFactor ~= nil, "External variable `DefWeakenRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1067
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_NXYYi"
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
				-2.2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+defweaken", {
				"+Normal",
				"+Normal"
			}, this.DefWeakenRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "DefWeakenUp",
				group = "Skill_NXYYi_Proud_EX",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"DEFWEAKENUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			}, 1)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_NXYYi_Unique_EX = {
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

		this.RageFactor = externs.RageFactor

		assert(this.RageFactor ~= nil, "External variable `RageFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3134
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_NXYYi"
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

			global.RetainObject(_env, _env.TARGET)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2.8,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			1600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				200,
				333,
				1000
			}, global.SplitValue(_env, damage, {
				0.15,
				0.15,
				0.35,
				0.35
			}))
		end)
		exec["@time"]({
			2933
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyRPDamage(_env, _env.TARGET, this.RageFactor)
			global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)

			local defender1 = global.LoadUnit(_env, _env.TARGET, "ALL")

			if defender1.rp == 0 then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					timing = 2,
					duration = 1,
					display = "Daze",
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
			end
		end)
		exec["@time"]({
			3134
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_NXYYi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DeRageGainFactor = externs.DeRageGainFactor

		assert(this.DeRageGainFactor ~= nil, "External variable `DeRageGainFactor` is not provided.")

		this.DefWeakenRateFactor = externs.DefWeakenRateFactor

		assert(this.DefWeakenRateFactor ~= nil, "External variable `DefWeakenRateFactor` is not provided.")

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

			for _, unit2 in global.__iter__(global.FriendUnits(_env)) do
				local buffeft1 = global.NumericEffect(_env, "+defweaken", {
					"+Normal",
					"+Normal"
				}, this.DefWeakenRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, unit2, {
					timing = 0,
					display = "DefWeakenUp",
					group = "Skill_NXYYi_Passive_EX",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DEFWEAKENUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_NXYYi_Passive_EX"
					}
				}, {
					buffeft1
				}, 1)
			end

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, this.DeRageGainFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
					timing = 0,
					display = "AngerRateDown",
					group = "Skill_NXYYi_Passive_EX_1",
					duration = 99,
					limit = 1,
					tags = {
						"STATUS",
						"DEBUFF",
						"ANGERRATEDOWN",
						"Skill_NXYYi_Passive_EX_1",
						"UNDISPELLABLE"
					}
				}, {
					buffeft2
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

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, this.DeRageGainFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
					timing = 0,
					display = "AngerRateDown",
					group = "Skill_NXYYi_Passive_EX_1",
					duration = 99,
					limit = 1,
					tags = {
						"STATUS",
						"DEBUFF",
						"ANGERRATEDOWN",
						"Skill_NXYYi_Passive_EX_1",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
			else
				local buffeft2 = global.NumericEffect(_env, "+defweaken", {
					"+Normal",
					"+Normal"
				}, this.DefWeakenRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					timing = 0,
					display = "DefWeakenUp",
					group = "Skill_NXYYi_Passive_EX",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DEFWEAKENUP",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_NXYYi_Passive_EX"
					}
				}, {
					buffeft2
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

			global.print(_env, 11111111)

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Skill_NXYYi_Passive_EX_1"))
				global.print(_env, 22222222)
			end

			for _, unit2 in global.__iter__(global.FriendUnits(_env)) do
				global.DispelBuff(_env, unit2, global.BUFF_MARKED(_env, "Skill_NXYYi_Passive_EX"))
				global.print(_env, 33333333)
			end
		end)

		return _env
	end
}

return _M
