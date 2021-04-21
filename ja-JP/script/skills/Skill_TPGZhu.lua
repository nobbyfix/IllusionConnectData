local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_TPGZhu_Normal = {
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
			1067
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
				-1.2,
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
all.Skill_TPGZhu_Proud = {
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
			1434
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_TPGZhu"
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

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft4 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 2,
				duration = 1,
				display = "Hit_TPGZhu",
				tags = {
					"Hit_TPGZhu",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft4
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
		end)

		return _env
	end
}
all.Skill_TPGZhu_Unique = {
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

		this.DeDefRateFactor = externs.DeDefRateFactor

		assert(this.DeDefRateFactor ~= nil, "External variable `DeDefRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3067
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_TPGZhu"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_TPGZhu_Skill3"
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
			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

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
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local buffeft4 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 1,
					display = "Hit_TPGZhu",
					tags = {
						"Hit_TPGZhu",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft4
				})
			end
		end)
		exec["@time"]({
			2367
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local buffeft1 = global.NumericEffect(_env, "-defrate", {
					"+Normal",
					"+Normal"
				}, this.DeDefRateFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
					timing = 4,
					display = "DefDown",
					group = "Skill_TPGZhu_Unique",
					duration = 10,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"DEBUFF",
						"DEFDOWN",
						"Skill_TPGZhu_Unique",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			3067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_TPGZhu_Passive_Death = {
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

		this.RageFactor = externs.RageFactor

		assert(this.RageFactor ~= nil, "External variable `RageFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			670
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

			if not global.INSTATUS(_env, "Skill_TPGZhu_Passive_Transformed")(_env, _env.ACTOR) then
				global.AddAnim(_env, {
					loop = 2,
					anim = "huanrao_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-0.8
					}
				})
				global.Sound(_env, "Se_Skill_Change_1", 1)
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "fakedie"))
			end
		end)
		exec["@time"]({
			667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.INSTATUS(_env, "Skill_TPGZhu_Passive_Transformed")(_env, _env.ACTOR) then
				global.FullInheritTransform(_env)
				global.Transform(_env, _env.ACTOR, 1, true)
				global.AddStatus(_env, _env.ACTOR, "Skill_TPGZhu_Passive_Transformed")
				global.AddAnim(_env, {
					loop = 1,
					anim = "die_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-1.3
					}
				})
				global.Sound(_env, "Se_Skill_Change_2", 1)

				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPReduce(_env, _env.ACTOR, maxHp * (1 - this.MaxHpRateFactor))

				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, 0.1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "Skill_TPGZhu_Passive_Death",
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
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)
			end
		end)

		return _env
	end
}
all.Skill_TPGZhu_Passive_Key = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
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

			if global.MARKED(_env, "TPGZhu")(_env, _env.ACTOR) and global.PETS(_env, _env.ACTOR) then
				if not global.INSTATUS(_env, "Skill_TPGZhu_Passive_Transformed")(_env, _env.ACTOR) then
					for _, unit in global.__iter__(global.RandomN(_env, 3, global.FriendUnits(_env))) do
						local buffeft1 = global.Immune(_env)
						local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ALL(_env, "DEBUFF"))

						global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
							timing = 4,
							duration = 20,
							display = "Immune",
							tags = {
								"STATUS",
								"NUMERIC",
								"BUFF",
								"IMMUNE",
								"DISPELLABLE",
								"STEALABLE"
							}
						}, {
							buffeft1,
							buffeft2
						}, 1, 0)
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_TPGZhu_Proud_EX = {
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

		this.ShieldRateFactor = externs.ShieldRateFactor

		assert(this.ShieldRateFactor ~= nil, "External variable `ShieldRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1434
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_TPGZhu"
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

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft4 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 2,
				duration = 1,
				display = "Hit_TPGZhu",
				tags = {
					"Hit_TPGZhu",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft4
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

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 3,
				display = "Shield",
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			}, 1)

			if global.FriendMaster(_env) then
				global.ApplyBuff_Buff(_env, _env.ACTOR, global.FriendMaster(_env), {
					timing = 2,
					duration = 2,
					display = "Shield",
					tags = {
						"NUMERIC",
						"BUFF",
						"SHIELD",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.Skill_TPGZhu_Unique_EX = {
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

		this.DeDefRateFactor = externs.DeDefRateFactor

		assert(this.DeDefRateFactor ~= nil, "External variable `DeDefRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3067
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_TPGZhu"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_TPGZhu_Skill3"
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
			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

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
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local buffeft4 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 1,
					display = "Hit_TPGZhu",
					tags = {
						"Hit_TPGZhu",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft4
				})
			end
		end)
		exec["@time"]({
			2367
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local buffeft1 = global.NumericEffect(_env, "-defrate", {
					"+Normal",
					"+Normal"
				}, this.DeDefRateFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
					timing = 4,
					display = "DefDown",
					group = "Skill_TPGZhu_Unique",
					duration = 10,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"DEBUFF",
						"DEFDOWN",
						"Skill_TPGZhu_Unique",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			3067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_TPGZhu_Passive_Death_EX = {
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

		this.RageFactor = externs.RageFactor

		assert(this.RageFactor ~= nil, "External variable `RageFactor` is not provided.")

		this.EXAtkRateFactor = externs.EXAtkRateFactor

		assert(this.EXAtkRateFactor ~= nil, "External variable `EXAtkRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			670
		}, main)
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

			global.Perform(_env, _env.ACTOR, global.Animation(_env, "fakedie"))

			if not global.INSTATUS(_env, "Skill_TPGZhu_Passive_Transformed")(_env, _env.ACTOR) then
				global.AddAnim(_env, {
					loop = 2,
					anim = "huanrao_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-0.8
					}
				})
				global.Sound(_env, "Se_Skill_Change_1", 1)
			end
		end)
		exec["@time"]({
			667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.INSTATUS(_env, "Skill_TPGZhu_Passive_Transformed")(_env, _env.ACTOR) then
				global.FullInheritTransform(_env)
				global.Transform(_env, _env.ACTOR, 1, true)
				global.AddStatus(_env, _env.ACTOR, "Skill_TPGZhu_Passive_Transformed")
				global.AddAnim(_env, {
					loop = 1,
					anim = "die_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-1.3
					}
				})
				global.Sound(_env, "Se_Skill_Change_2", 1)

				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPReduce(_env, _env.ACTOR, maxHp * (1 - this.MaxHpRateFactor))

				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, 0.1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "Skill_TPGZhu_Passive_Death",
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
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.EXAtkRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				duration = 99,
				group = "Skill_TPGZhu_Passive_Death_EX",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"HURTRATEUP",
					"Skill_TPGZhu_Passive_Death_EX",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end
}

return _M
