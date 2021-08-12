local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_MLYDi_Normal = {
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
				1.05,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			933
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
				-1.7,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			667
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
all.Skill_MLYDi_Proud = {
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
				1.65,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1267
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_MLYDi"
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

		_env.target = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.RandomN(_env, 1, global.EnemyUnits(_env))
			_env.target = units[1]

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.target) + {
				-1.2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.target, "target")
		end)
		exec["@time"]({
			733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.target)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.target)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.target, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.target, {
				0,
				167
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
		end)

		return _env
	end
}
all.Skill_MLYDi_Unique = {
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
				6,
				0
			}
		end

		this.murderer_dmgFactor = externs.murderer_dmgFactor

		if this.murderer_dmgFactor == nil then
			this.murderer_dmgFactor = 6
		end

		this.atkFactor = externs.atkFactor

		if this.atkFactor == nil then
			this.atkFactor = 0.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			4100
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_MLYDi"
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

		_env.target = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.RandomN(_env, 1, global.EnemyUnits(_env))
			_env.target = units[1]

			global.RetainObject(_env, _env.target)
			global.GroundEft(_env, _env.ACTOR, "BGEffectTrueBlack", 3250)
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1, 80)

			local run = global.Animation(_env, "run", 100, nil, -1)
			run = global.MoveTo(_env, global.FixedPos(_env, 0, -1.05, 2), 100, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, "skill3")))
			global.HarmTargetView(_env, _env.target)
			global.AssignRoles(_env, _env.target, "target")

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				if unit ~= _env.target then
					global.setRootVisible(_env, unit, false)
				end
			end
		end)
		exec["@time"]({
			2200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.target)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.target)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.target, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.target, {
				0,
				167,
				333,
				500,
				667,
				1133
			}, global.SplitValue(_env, damage, {
				0.1,
				0.1,
				0.1,
				0.2,
				0.2,
				0.3
			}))
		end)
		exec["@time"]({
			3267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local run = global.Animation(_env, "run", 1, nil, -1)
			run = global.MoveTo(_env, global.UnitPos(_env, _env.target) + {
				-1.2,
				0
			}, 1, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, "skill3_1", nil, 2)))
		end)
		exec["@time"]({
			3333
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.target))) do
				global.setRootVisible(_env, unit, true)

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "MURDERER")) > 0 then
					global.AnimForTrgt(_env, unit, {
						loop = 1,
						anim = "main_jinnibaodian",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.3
						}
					})

					local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, unit, {
						1,
						this.murderer_dmgFactor,
						0
					})

					if global.MASTER(_env, unit) then
						damage.val = damage.val * 0.4
					end

					global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				end
			end
		end)
		exec["@time"]({
			4050
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_MLYDi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Factor = externs.Factor

		if this.Factor == nil then
			this.Factor = 0.2
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
		passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK"
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
			"UNIT_BEKILLED"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_BROKED"
		}, passive4)
		passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_CANCELED"
		}, passive4)
		passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_STEALED"
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_ENDED"
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
			local buff = global.ImmuneBuff(_env, global.BUFF_MARKED(_env, "MURDERER"))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})

			if global.SelectBuffCount_Unit(_env, global.FriendUnits(_env), "MURDERER") == 0 then
				local units = global.RandomN(_env, 1, global.FriendUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.ACTOR)))
				local buff_murder = global.SpecialNumericEffect(_env, "+murder", {
					"+Normal",
					"+Normal"
				}, 1)

				if units[1] then
					global.ApplyBuff(_env, units[1], {
						timing = 0,
						display = "Murderer",
						group = "FEMSi_MURDERER",
						duration = 99,
						limit = 1,
						tags = {
							"STATUS",
							"MURDERER",
							"Skill_MLYDi_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff_murder
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

			if global.SelectBuffCount_Unit(_env, global.FriendUnits(_env), "MURDERER") == 0 then
				local units = global.RandomN(_env, 1, global.FriendUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.ACTOR)))
				local buff_murder = global.SpecialNumericEffect(_env, "+murder", {
					"+Normal",
					"+Normal"
				}, 1)

				if units[1] then
					global.ApplyBuff(_env, units[1], {
						timing = 0,
						display = "Murderer",
						group = "FEMSi_MURDERER",
						duration = 99,
						limit = 1,
						tags = {
							"STATUS",
							"MURDERER",
							"Skill_MLYDi_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff_murder
					})
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "MURDERER")) > 0 then
				local buff1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.Factor)
				local buff2 = global.MaxHpEffect(_env, global.min(_env, global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR) * this.Factor, global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR) * 2))

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "AtkUp",
					tags = {
						"Skill_MLYDi_Passive_Hp",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"MAXHPUP",
						"DISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff1,
					buff2
				}, 1, 0)
				global.ApplyHPRecovery(_env, _env.ACTOR, global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR))

				if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_MLYDi_Passive_Hp")) < 4 then
					global.setRoleScale(_env, _env.ACTOR, 1 + global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_MLYDi_Passive_Hp")) * 0.04)
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

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "Skill_MLYDi_Passive_Hp") then
				global.setRoleScale(_env, _env.ACTOR, 1 + global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_MLYDi_Passive_Hp")) * 0.04)
			end
		end)

		return _env
	end
}
all.Skill_MLYDi_Proud_EX = {
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
				1.65,
				0
			}
		end

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 300
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1267
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_MLYDi"
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

		_env.target = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.RandomN(_env, 1, global.EnemyUnits(_env))
			_env.target = units[1]

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.target) + {
				-1.2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.target, "target")
		end)
		exec["@time"]({
			733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.target)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.target)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.target, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.target, {
				0,
				167
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
			global.ApplyRPRecovery(_env, _env.ACTOR, this.RpFactor)
		end)

		return _env
	end
}
all.Skill_MLYDi_Unique_EX = {
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
				8,
				0
			}
		end

		this.murderer_dmgFactor = externs.murderer_dmgFactor

		if this.murderer_dmgFactor == nil then
			this.murderer_dmgFactor = 6
		end

		this.atkFactor = externs.atkFactor

		if this.atkFactor == nil then
			this.atkFactor = 0.3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			4100
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_MLYDi"
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

		_env.target = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.RandomN(_env, 1, global.EnemyUnits(_env))
			_env.target = units[1]

			global.RetainObject(_env, _env.target)
			global.GroundEft(_env, _env.ACTOR, "BGEffectTrueBlack", 3250)
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1, 80)

			local run = global.Animation(_env, "run", 100, nil, -1)
			run = global.MoveTo(_env, global.FixedPos(_env, 0, -1.05, 2), 100, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, "skill3")))
			global.HarmTargetView(_env, _env.target)
			global.AssignRoles(_env, _env.target, "target")

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				if unit ~= _env.target then
					global.setRootVisible(_env, unit, false)
				end
			end
		end)
		exec["@time"]({
			2200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.target)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.target)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.target, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.target, {
				0,
				167,
				333,
				500,
				667,
				1133
			}, global.SplitValue(_env, damage, {
				0.1,
				0.1,
				0.1,
				0.2,
				0.2,
				0.3
			}))
		end)
		exec["@time"]({
			3267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local run = global.Animation(_env, "run", 1, nil, -1)
			run = global.MoveTo(_env, global.UnitPos(_env, _env.target) + {
				-1.2,
				0
			}, 1, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, "skill3_1", nil, 2)))
		end)
		exec["@time"]({
			3333
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.target))) do
				global.setRootVisible(_env, unit, true)

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "MURDERER")) > 0 then
					global.AnimForTrgt(_env, unit, {
						loop = 1,
						anim = "main_jinnibaodian",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.3
						}
					})

					local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, unit, {
						1,
						this.murderer_dmgFactor,
						0
					})

					if global.MASTER(_env, unit) then
						damage.val = damage.val * 0.4
					end

					global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				end
			end
		end)
		exec["@time"]({
			4050
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_MLYDi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Factor = externs.Factor

		if this.Factor == nil then
			this.Factor = 0.3
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
		passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK"
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
			"UNIT_BEKILLED"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_BROKED"
		}, passive4)
		passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_CANCELED"
		}, passive4)
		passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_STEALED"
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:BUFF_ENDED"
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
			local buff = global.ImmuneBuff(_env, global.BUFF_MARKED(_env, "MURDERER"))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})

			if global.SelectBuffCount_Unit(_env, global.FriendUnits(_env), "MURDERER") == 0 then
				local units = global.RandomN(_env, 1, global.FriendUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.ACTOR)))
				local buff_murder = global.SpecialNumericEffect(_env, "+murder", {
					"+Normal",
					"+Normal"
				}, 1)

				if units[1] then
					global.ApplyBuff(_env, units[1], {
						timing = 0,
						display = "Murderer",
						group = "FEMSi_MURDERER",
						duration = 99,
						limit = 1,
						tags = {
							"STATUS",
							"MURDERER",
							"Skill_MLYDi_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff_murder
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

			if global.SelectBuffCount_Unit(_env, global.FriendUnits(_env), "MURDERER") == 0 then
				local units = global.RandomN(_env, 1, global.FriendUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.ACTOR)))
				local buff_murder = global.SpecialNumericEffect(_env, "+murder", {
					"+Normal",
					"+Normal"
				}, 1)

				if units[1] then
					global.ApplyBuff(_env, units[1], {
						timing = 0,
						display = "Murderer",
						group = "FEMSi_MURDERER",
						duration = 99,
						limit = 1,
						tags = {
							"STATUS",
							"MURDERER",
							"Skill_MLYDi_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff_murder
					})
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "MURDERER")) > 0 then
				local buff1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.Factor)
				local buff2 = global.MaxHpEffect(_env, global.min(_env, global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR) * this.Factor, global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR) * 2))

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "AtkUp",
					tags = {
						"Skill_MLYDi_Passive_Hp",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"MAXHPUP",
						"DISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff1,
					buff2
				}, 1, 0)
				global.ApplyHPRecovery(_env, _env.ACTOR, global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR))

				if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_MLYDi_Passive_Hp")) < 4 then
					global.setRoleScale(_env, _env.ACTOR, 1 + global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_MLYDi_Passive_Hp")) * 0.04)
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

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "Skill_MLYDi_Passive_Hp") then
				global.setRoleScale(_env, _env.ACTOR, 1 + global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_MLYDi_Passive_Hp")) * 0.04)
			end
		end)

		return _env
	end
}

return _M
