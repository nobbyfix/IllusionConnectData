local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_GYCZi_Normal = {
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
			934
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
				-1.3,
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
all.Skill_GYCZi_Proud = {
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
			1089
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_GYCZi"
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
				-0.9,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			693
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buffeft2 = global.NumericEffect(_env, "-critrate", {
				"+Normal",
				"+Normal"
			}, 0.4)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.TARGET, {
				timing = 0,
				display = "BeCuredRateDown",
				group = "Skill_GLin_Passive_EX",
				duration = 99,
				limit = 1,
				tags = {
					"CARDBUFF",
					"Skill_GLin_Passive_EX",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				global.buffeft1
			})
			global.print(_env, 111111111)
		end)

		return _env
	end
}
all.Skill_GYCZi_Proud_EX = {
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
			1089
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_GYCZi"
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
				-0.9,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			693
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buffeft2 = global.NumericEffect(_env, "-critrate", {
				"+Normal",
				"+Normal"
			}, 0.4)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.TARGET, {
				timing = 0,
				display = "BeCuredRateDown",
				group = "Skill_GLin_Passive_EX",
				duration = 99,
				limit = 1,
				tags = {
					"CARDBUFF",
					"Skill_GLin_Passive_EX",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				global.buffeft1
			})
		end)

		return _env
	end
}
all.Skill_GYCZi_Unique = {
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

		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2850
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_GYCZi"
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

		_env.Funits = nil
		_env.Eunits = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			_env.Funits = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 2)
			_env.Eunits = global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			for _, unit in global.__iter__(_env.Eunits) do
				global.HarmTargetView(_env, {
					unit
				})
			end
		end)
		exec["@time"]({
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, Funit in global.__iter__(_env.Funits) do
				local heal1 = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, Funit, this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, Funit, heal1)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, Funit, {
					timing = 2,
					duration = 1,
					display = "Heal",
					tags = {
						"HEAL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
			end

			for _, Eunit in global.__iter__(_env.Eunits) do
				global.ApplyStatusEffect(_env, _env.ACTOR, Eunit)
				global.ApplyRPEffect(_env, _env.ACTOR, Eunit)

				local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, Eunit, this.dmgFactor)
				local cost = global.GetCost(_env, Eunit)

				if cost >= 14 then
					damage.val = damage.val * 2
				end

				global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, Eunit, {
					0,
					200,
					200
				}, global.SplitValue(_env, damage, {
					0.25,
					0.25,
					0.5
				}))
			end
		end)
		exec["@time"]({
			2850
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_GYCZi_Unique_EX = {
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

		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2850
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_GYCZi"
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

		_env.Funits = nil
		_env.Eunits = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			_env.Funits = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 2)
			_env.Eunits = global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			for _, unit in global.__iter__(_env.Eunits) do
				global.HarmTargetView(_env, {
					unit
				})
			end
		end)
		exec["@time"]({
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, Funit in global.__iter__(_env.Funits) do
				local heal1 = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, Funit, this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, Funit, heal1)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, Funit, {
					timing = 2,
					duration = 1,
					display = "Heal",
					tags = {
						"HEAL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
			end

			for _, Eunit in global.__iter__(_env.Eunits) do
				global.ApplyStatusEffect(_env, _env.ACTOR, Eunit)
				global.ApplyRPEffect(_env, _env.ACTOR, Eunit)

				local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, Eunit, this.dmgFactor)
				local cost = global.GetCost(_env, Eunit)

				if cost >= 14 then
					damage.val = damage.val * 2
				end

				global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, Eunit, {
					0,
					200,
					200
				}, global.SplitValue(_env, damage, {
					0.25,
					0.25,
					0.5
				}))
			end
		end)
		exec["@time"]({
			2850
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_GYCZi_Passive_Death = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.summonFactorHpA = externs.summonFactorHpA

		assert(this.summonFactorHpA ~= nil, "External variable `summonFactorHpA` is not provided.")

		this.summonFactorAtkA = externs.summonFactorAtkA

		assert(this.summonFactorAtkA ~= nil, "External variable `summonFactorAtkA` is not provided.")

		this.summonFactorDefA = externs.summonFactorDefA

		assert(this.summonFactorDefA ~= nil, "External variable `summonFactorDefA` is not provided.")

		this.summonFactorA = {
			this.summonFactorHpA,
			this.summonFactorAtkA,
			this.summonFactorDefA
		}
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			667
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.Animation(_env, "dieskill"))
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local SummonedGYCZi = global.Summon(_env, _env.ACTOR, "SummonedGYCZi", this.summonFactorA, nil, {
				global.abs(_env, global.UnitPosId(_env, _env.ACTOR))
			})
		end)

		return _env
	end
}
all.Skill_GYCZi_Passive_Key = {
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

			if global.MARKED(_env, "GYCZi")(_env, _env.ACTOR) then
				local num = #global.FriendUnits(_env, global.MARKED(_env, "idol"))

				if num >= 2 then
					for _, friend in global.__iter__(global.FriendUnits(_env, global.MARKED(_env, "idol") - global.ONESELF(_env, _env.ACTOR))) do
						local buffeft1 = global.RageGainEffect(_env, "-", {
							"+Normal",
							"+Normal"
						}, 1)
						local buffeft2 = global.Diligent(_env)

						global.ApplyBuff_Buff(_env, _env.ACTOR, friend, {
							timing = 2,
							duration = 1,
							tags = {
								"NUMERIC",
								"BUFF",
								"ATKUP",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft1,
							buffeft2
						}, 1)
					end

					global.DiligentRound(_env)
				end
			end
		end)

		return _env
	end
}
all.Skill_GYCZijiangshi_Normal = {
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
			934
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
			_env.units = global.RandomN(_env, 1, global.EnemyUnits(_env))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.3,
				0
			}, 100, "skill1"))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)

		return _env
	end
}

return _M
