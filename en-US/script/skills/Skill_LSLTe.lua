local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_LSLTe_Normal = {
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
				-1.4,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			534
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 0,
				duration = 99,
				tags = {
					"Count_LSLTe_Passive"
				}
			}, {
				buff_count
			})
		end)

		return _env
	end
}
all.Skill_LSLTe_Proud = {
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
				0.8,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_LSLTe"
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
				-0.8,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			367
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 0,
				duration = 99,
				tags = {
					"Count_LSLTe_Passive"
				}
			}, {
				buff_count
			})
		end)
		exec["@time"]({
			800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 0,
				duration = 99,
				tags = {
					"Count_LSLTe_Passive"
				}
			}, {
				buff_count
			})
		end)

		return _env
	end
}
all.Skill_LSLTe_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.dmgFactor1 = externs.dmgFactor1

		if this.dmgFactor1 == nil then
			this.dmgFactor1 = 1.5
		end

		this.dmgFactor2 = externs.dmgFactor2

		if this.dmgFactor2 == nil then
			this.dmgFactor2 = 1
		end

		this.dmgFactor3 = externs.dmgFactor3

		if this.dmgFactor3 == nil then
			this.dmgFactor3 = 1.5
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			4000
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LSLTe"
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
			local ani = nil

			if global.CellRowLocation(_env, global.GetCell(_env, _env.TARGET)) == 1 then
				ani = "skill3_3"
			elseif global.CellRowLocation(_env, global.GetCell(_env, _env.TARGET)) == 2 then
				ani = "skill3_2"
			else
				ani = "skill3_1"
			end

			local run = global.Animation(_env, "run", 100, nil, -1)
			run = global.MoveTo(_env, global.UnitPos(_env, _env.TARGET) + {
				-0.5,
				0
			}, 100, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, ani)), false)
			global.AssignRoles(_env, _env.TARGET, "target")
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			1233
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)
			global.DispelBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "IMMUNE", "DISPELLABLE"), 99)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, {
				1,
				this.dmgFactor1,
				0
			})

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 0,
				duration = 99,
				tags = {
					"Count_LSLTe_Passive"
				}
			}, {
				buff_count
			})
		end)
		exec["@time"]({
			1400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local run = global.Animation(_env, "skill4", 1, nil, -1)
			run = global.MoveTo(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			} + {
				0.5,
				0
			}, 1, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, "skill4", nil, 2)), false)

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1633
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					this.dmgFactor2,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					tags = {
						"Count_LSLTe_Passive"
					}
				}, {
					buff_count
				})
			end
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ani = nil

			if global.CellColLocation(_env, global.GetCell(_env, _env.TARGET)) == 1 then
				ani = "skill5_1"
			elseif global.CellColLocation(_env, global.GetCell(_env, _env.TARGET)) == 2 then
				ani = "skill5_2"
			else
				ani = "skill5_3"
			end

			local run = global.Animation(_env, ani, 1, nil, -1)
			run = global.MoveTo(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			} + {
				0.5,
				0
			}, 1, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, ani, nil, 2)))

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			3167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.18, 20)
		end)
		exec["@time"]({
			3300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					this.dmgFactor3,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					tags = {
						"Count_LSLTe_Passive"
					}
				}, {
					buff_count
				})
			end
		end)
		exec["@time"]({
			3900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LSLTe_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 1
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			400
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_BUFF_APPLYED"
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local delaytime = 350

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.BuffIsMatched(_env, _env.buff, "Count_LSLTe_Passive") then
				if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive")) == 1 then
					local buff = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "LSLTe_Circle_1",
						tags = {
							"LSLTe_Passive_1"
						}
					}, {
						buff
					})
				elseif global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive")) == 2 then
					local buff = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "LSLTe_Circle_2",
						tags = {
							"LSLTe_Passive_2"
						}
					}, {
						buff
					})
				elseif global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive")) == 3 then
					local buff = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "LSLTe_Circle_3",
						tags = {
							"LSLTe_Passive_3"
						}
					}, {
						buff
					})
					global.DispelBuff(_env, _env.unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive"), 99)
					global.DelayCall(_env, delaytime, global.ApplyRealDamage, _env.ACTOR, _env.unit, 1, 1, this.DamageFactor)
					global.DelayCall(_env, delaytime, global.DispelBuff, _env.unit, global.BUFF_MARKED(_env, "LSLTe_Passive_1"), 99)
					global.DelayCall(_env, delaytime, global.DispelBuff, _env.unit, global.BUFF_MARKED(_env, "LSLTe_Passive_2"), 99)
					global.DelayCall(_env, delaytime, global.DispelBuff, _env.unit, global.BUFF_MARKED(_env, "LSLTe_Passive_3"), 99)
					global.DelayCall(_env, delaytime, global.AnimForTrgt, _env.unit, {
						loop = 1,
						anim = "baozha_weienbaodian",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive"), 99)
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "LSLTe_Passive_1"), 99)
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "LSLTe_Passive_2"), 99)
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "LSLTe_Passive_3"), 99)
			end
		end)

		return _env
	end
}
all.Skill_LSLTe_Proud_EX = {
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
		main = global["[duration]"](this, {
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_LSLTe"
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
				-0.8,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			367
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 0,
				duration = 99,
				tags = {
					"Count_LSLTe_Passive"
				}
			}, {
				buff_count
			})
		end)
		exec["@time"]({
			800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 0,
				duration = 99,
				tags = {
					"Count_LSLTe_Passive"
				}
			}, {
				buff_count
			})
		end)

		return _env
	end
}
all.Skill_LSLTe_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.dmgFactor1 = externs.dmgFactor1

		if this.dmgFactor1 == nil then
			this.dmgFactor1 = 1.75
		end

		this.dmgFactor2 = externs.dmgFactor2

		if this.dmgFactor2 == nil then
			this.dmgFactor2 = 1.25
		end

		this.dmgFactor3 = externs.dmgFactor3

		if this.dmgFactor3 == nil then
			this.dmgFactor3 = 1.75
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			4000
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LSLTe"
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
			local ani = nil

			if global.CellRowLocation(_env, global.GetCell(_env, _env.TARGET)) == 1 then
				ani = "skill3_3"
			elseif global.CellRowLocation(_env, global.GetCell(_env, _env.TARGET)) == 2 then
				ani = "skill3_2"
			else
				ani = "skill3_1"
			end

			local run = global.Animation(_env, "run", 100, nil, -1)
			run = global.MoveTo(_env, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 100, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, ani)), false)
			global.AssignRoles(_env, _env.TARGET, "target")
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			1233
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)
			global.DispelBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "IMMUNE", "DISPELLABLE"), 99)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, {
				1,
				this.dmgFactor1,
				0
			})

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 0,
				duration = 99,
				tags = {
					"Count_LSLTe_Passive"
				}
			}, {
				buff_count
			})
		end)
		exec["@time"]({
			1400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local run = global.Animation(_env, "skill4", 1, nil, -1)
			run = global.MoveTo(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			} + {
				0,
				0
			}, 1, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, "skill4", nil, 2)), false)

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.AssignRoles(_env, unit, "target")
			end

			global.DelayCall(_env, 200, global.ShakeScreen, {
				Id = 3,
				duration = 20,
				enhance = 3
			})
			global.DelayCall(_env, 533, global.ShakeScreen, {
				Id = 3,
				duration = 20,
				enhance = 3
			})
		end)
		exec["@time"]({
			1633
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					this.dmgFactor2,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					tags = {
						"Count_LSLTe_Passive"
					}
				}, {
					buff_count
				})
			end
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ani = nil

			if global.CellColLocation(_env, global.GetCell(_env, _env.TARGET)) == 1 then
				ani = "skill5_1"
			elseif global.CellColLocation(_env, global.GetCell(_env, _env.TARGET)) == 2 then
				ani = "skill5_2"
			else
				ani = "skill5_3"
			end

			local run = global.Animation(_env, ani, 1, nil, -1)
			run = global.MoveTo(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			} + {
				0,
				0
			}, 1, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, ani, nil, 2)))

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			3167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.15, 20)
			global.DelayCall(_env, 5, global.ShakeScreen, {
				Id = 3,
				duration = 30,
				enhance = 5
			})
		end)
		exec["@time"]({
			3300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					this.dmgFactor3,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				local buff_count = global.SpecialNumericEffect(_env, "+Count_LSLTe_Passive", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					tags = {
						"Count_LSLTe_Passive"
					}
				}, {
					buff_count
				})
			end
		end)
		exec["@time"]({
			3900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LSLTe_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 1.5
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			400
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_BUFF_APPLYED"
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local delaytime = 350

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.BuffIsMatched(_env, _env.buff, "Count_LSLTe_Passive") then
				if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive")) == 1 then
					local buff = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "LSLTe_Circle_1",
						tags = {
							"LSLTe_Passive_1"
						}
					}, {
						buff
					})
				elseif global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive")) == 2 then
					local buff = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "LSLTe_Circle_2",
						tags = {
							"LSLTe_Passive_2"
						}
					}, {
						buff
					})
				elseif global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive")) == 3 then
					local buff = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "LSLTe_Circle_3",
						tags = {
							"LSLTe_Passive_3"
						}
					}, {
						buff
					})
					global.DispelBuff(_env, _env.unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive"), 99)
					global.DelayCall(_env, delaytime, global.ApplyRealDamage, _env.ACTOR, _env.unit, 1, 1, this.DamageFactor)
					global.DelayCall(_env, delaytime, global.DispelBuff, _env.unit, global.BUFF_MARKED(_env, "LSLTe_Passive_1"), 99)
					global.DelayCall(_env, delaytime, global.DispelBuff, _env.unit, global.BUFF_MARKED(_env, "LSLTe_Passive_2"), 99)
					global.DelayCall(_env, delaytime, global.DispelBuff, _env.unit, global.BUFF_MARKED(_env, "LSLTe_Passive_3"), 99)
					global.DelayCall(_env, delaytime, global.AnimForTrgt, _env.unit, {
						loop = 1,
						anim = "baozha_weienbaodian",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Count_LSLTe_Passive"), 99)
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "LSLTe_Passive_1"), 99)
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "LSLTe_Passive_2"), 99)
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "LSLTe_Passive_3"), 99)
			end
		end)

		return _env
	end
}

return _M