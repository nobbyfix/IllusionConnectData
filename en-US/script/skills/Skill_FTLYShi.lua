local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_FTLYShi_Normal = {
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
			1034
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
				-1,
				0
			}, 100, "skill1"))
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

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				333
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
		end)

		return _env
	end
}
all.Skill_FTLYShi_Proud = {
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
			1334
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_CZheng"
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			967
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
all.Skill_FTLYShi_Unique = {
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
				4,
				0
			}
		end

		this.Prob1 = externs.Prob1

		if this.Prob1 == nil then
			this.Prob1 = 0.6
		end

		this.UniDmgFactor = externs.UniDmgFactor

		if this.UniDmgFactor == nil then
			this.UniDmgFactor = 0.45
		end

		this.Prob2 = externs.Prob2

		if this.Prob2 == nil then
			this.Prob2 = 0.2
		end

		this.HealFactor = externs.HealFactor

		if this.HealFactor == nil then
			this.HealFactor = 0.85
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FTLYShi"
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
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, _env.TARGET)
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1533
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.AllUnits(_env, global.TOP_COL + global.BOTTOM_COL)) do
				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "TAUNT", "DISPELLABLE")) > 0 then
					global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "TAUNT", "DISPELLABLE"), 99)

					local biaoxian = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, unit, {
						timing = 4,
						display = "BuffWeaken",
						group = "Skill_FTLYShi_biaoxian",
						duration = 3,
						limit = 99,
						tags = {}
					}, {
						biaoxian
					})
				end
			end

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			if global.ProbTest(_env, this.Prob1) then
				global.print(_env, "奥古斯特-伤害增加触发了===")

				damage.val = damage.val * (1 + this.UniDmgFactor)
			end

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				334,
				1100
			}, global.SplitValue(_env, damage, {
				0.25,
				0.25,
				0.5
			}))

			if global.ProbTest(_env, this.Prob2) then
				global.print(_env, "奥古斯特-治疗触发了===")

				local extra_heal = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR) * this.HealFactor

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, _env.TARGET, extra_heal)

				local buffeft = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.TARGET, {
					timing = 2,
					duration = 1,
					display = "Heal",
					tags = {
						"HEAL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				})
			end

			global.ShakeScreen(_env, {
				Id = 3,
				duration = 20,
				enhance = 2
			})
			global.DelayCall(_env, 334, global.ShakeScreen, {
				Id = 3,
				duration = 20,
				enhance = 2
			})
			global.DelayCall(_env, 1100, global.ShakeScreen, {
				Id = 1,
				duration = 60,
				enhance = 6
			})
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
all.Skill_FTLYShi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.03
		end

		this.DamageDownFactor = externs.DamageDownFactor

		if this.DamageDownFactor == nil then
			this.DamageDownFactor = 0.3
		end

		this.MasterHpFactor = externs.MasterHpFactor

		if this.MasterHpFactor == nil then
			this.MasterHpFactor = 0.2
		end

		this.Energy = externs.Energy

		if this.Energy == nil then
			this.Energy = 2
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_FINDTARGET"
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
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK_BY_OTHERSET"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive4)
		local passive5 = __action(this, {
			name = "passive5",
			entry = prototype.passive5
		})
		passive5 = global["[duration]"](this, {
			0
		}, passive5)
		this.passive5 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive5)

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS + global.SUMMONS(_env, _env.unit) then
				local count = 0

				for _, unit1 in global.__iter__(global.EnemyUnits(_env)) do
					if global.SelectBuffCount(_env, unit1, global.BUFF_MARKED(_env, "TAUNT")) > 0 and global.SelectBuffCount(_env, unit1, global.BUFF_MARKED(_env, "STEALTH")) == 0 then
						count = count + 1

						global.print(_env, "场上存在嘲讽角色", count)

						break
					end
				end

				if count == 0 then
					local TAR = global.RandomN(_env, 1, global.EnemyUnits(_env, -global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "STEALTH"))))

					global.print(_env, "谁", global.GetUnitCid(_env, _env.unit), "随机目标为", global.GetUnitId(_env, TAR[1]))
					global.AssignRoles(_env, TAR[1], "target")

					local buff_taunt = global.Taunt(_env)

					global.ApplyBuff(_env, TAR[1], {
						duration = 2,
						group = "Skill_FTLYShi_Passive_1",
						timing = 4,
						limit = 1,
						tags = {
							"Skill_FTLYShi_Passive_Taunt"
						}
					}, {
						buff_taunt
					})
				end
			elseif global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.PETS + global.SUMMONS(_env, _env.unit) then
				local buff_check = global.SpecialNumericEffect(_env, "Skill_FTLYShi_Passive_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_FTLYShi_Passive_Check"
					}
				}, {
					buff_check
				})

				local count = 0

				for _, unit1 in global.__iter__(global.FriendUnits(_env)) do
					if global.SelectBuffCount(_env, unit1, global.BUFF_MARKED(_env, "TAUNT")) > 0 and global.SelectBuffCount(_env, unit1, global.BUFF_MARKED(_env, "STEALTH")) == 0 then
						count = count + 1

						global.print(_env, "场上存在嘲讽角色", count)

						break
					end
				end

				if count == 0 then
					local TAR = global.RandomN(_env, 1, global.FriendUnits(_env, -global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "STEALTH"))))

					global.print(_env, "谁", global.GetUnitCid(_env, _env.unit), "随机目标为", global.GetUnitId(_env, TAR[1]))
					global.AssignRoles(_env, TAR[1], "target")

					local buff_taunt = global.Taunt(_env)

					global.ApplyBuff(_env, TAR[1], {
						duration = 2,
						group = "Skill_FTLYShi_Passive_1",
						timing = 4,
						limit = 1,
						tags = {
							"Skill_FTLYShi_Passive_Taunt"
						}
					}, {
						buff_taunt
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS + global.SUMMONS(_env, _env.unit) then
				for _, unit1 in global.__iter__(global.EnemyUnits(_env)) do
					global.DispelBuff(_env, unit1, global.BUFF_MARKED_ALL(_env, "Skill_FTLYShi_Passive_Taunt"), 99)
				end
			elseif global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.PETS + global.SUMMONS(_env, _env.unit) then
				for _, unit1 in global.__iter__(global.FriendUnits(_env)) do
					global.DispelBuff(_env, unit1, global.BUFF_MARKED_ALL(_env, "Skill_FTLYShi_Passive_Taunt"), 99)
				end

				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "Skill_FTLYShi_Passive_Check"), 99)
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
			local SumCount = 0

			for _, unit in global.__iter__(global.AllUnits(_env)) do
				SumCount = SumCount + 1
			end

			global.print(_env, "奥古斯特-当前单位数量===", SumCount)

			local buffeft1 = global.NumericEffect(_env, "+aoederate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor * SumCount)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "Skill_FTLYShi_Passive_2",
				timing = 0,
				limit = 1,
				tags = {
					"Skill_FTLYShi_Passive_2",
					"UNHURTRATE",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
			global.print(_env, "奥古斯特-当前范围免伤率===", global.UnitPropGetter(_env, "aoederate")(_env, _env.ACTOR))
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
			local buff1 = global.SpecialNumericEffect(_env, "+Skill_FTLYShi_DamageDownFactor", {
				"+Normal",
				"+Normal"
			}, this.DamageDownFactor)
			local buff2 = global.SpecialNumericEffect(_env, "+Skill_FTLYShi_MasterHpFactor", {
				"+Normal",
				"+Normal"
			}, this.MasterHpFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"Skill_FTLYShi_Passive_5",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff1,
				buff2
			})
		end)

		return _env
	end,
	passive5 = function (_env, externs)
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

			if global.PETS - global.SUMMONS(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.Energy)
			end
		end)

		return _env
	end
}
all.Skill_FTLYShi_Proud_EX = {
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
				1.6,
				0
			}
		end

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1334
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_FTLYShi"
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			967
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "Shield",
				tags = {
					"BUFF",
					"SHIELD",
					"STATUS",
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
all.Skill_FTLYShi_Unique_EX = {
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
				5,
				0
			}
		end

		this.Prob1 = externs.Prob1

		if this.Prob1 == nil then
			this.Prob1 = 0.6
		end

		this.UniDmgFactor = externs.UniDmgFactor

		if this.UniDmgFactor == nil then
			this.UniDmgFactor = 0.65
		end

		this.Prob2 = externs.Prob2

		if this.Prob2 == nil then
			this.Prob2 = 0.2
		end

		this.HealFactor = externs.HealFactor

		if this.HealFactor == nil then
			this.HealFactor = 0.85
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FTLYShi"
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
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, _env.TARGET)
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1533
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.AllUnits(_env, global.TOP_COL + global.BOTTOM_COL)) do
				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "TAUNT", "DISPELLABLE")) > 0 then
					global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "TAUNT", "DISPELLABLE"), 99)

					local biaoxian = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, unit, {
						timing = 4,
						display = "BuffWeaken",
						group = "Skill_FTLYShi_biaoxian",
						duration = 3,
						limit = 99,
						tags = {}
					}, {
						biaoxian
					})
				end
			end

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			if global.ProbTest(_env, this.Prob1) then
				global.print(_env, "奥古斯特-伤害增加触发了===")

				damage.val = damage.val * (1 + this.UniDmgFactor)
			end

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				334,
				1100
			}, global.SplitValue(_env, damage, {
				0.25,
				0.25,
				0.5
			}))

			if global.ProbTest(_env, this.Prob2) then
				global.print(_env, "奥古斯特-治疗触发了===")

				local extra_heal = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR) * this.HealFactor

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, _env.TARGET, extra_heal)

				local buffeft = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.TARGET, {
					timing = 2,
					duration = 1,
					display = "Heal",
					tags = {
						"HEAL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				})
			end

			global.ShakeScreen(_env, {
				Id = 3,
				duration = 20,
				enhance = 2
			})
			global.DelayCall(_env, 334, global.ShakeScreen, {
				Id = 3,
				duration = 20,
				enhance = 2
			})
			global.DelayCall(_env, 1100, global.ShakeScreen, {
				Id = 1,
				duration = 60,
				enhance = 6
			})
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
all.Skill_FTLYShi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.055
		end

		this.DamageDownFactor = externs.DamageDownFactor

		if this.DamageDownFactor == nil then
			this.DamageDownFactor = 0.5
		end

		this.MasterHpFactor = externs.MasterHpFactor

		if this.MasterHpFactor == nil then
			this.MasterHpFactor = 0.2
		end

		this.Energy = externs.Energy

		if this.Energy == nil then
			this.Energy = 3
		end

		this.AtkFactor = externs.AtkFactor

		if this.AtkFactor == nil then
			this.AtkFactor = 0.07
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_FINDTARGET"
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
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK_BY_OTHERSET"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive4)
		local passive5 = __action(this, {
			name = "passive5",
			entry = prototype.passive5
		})
		passive5 = global["[duration]"](this, {
			0
		}, passive5)
		this.passive5 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive5)

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS + global.SUMMONS(_env, _env.unit) then
				local count = 0

				for _, unit1 in global.__iter__(global.EnemyUnits(_env)) do
					if global.SelectBuffCount(_env, unit1, global.BUFF_MARKED(_env, "TAUNT")) > 0 and global.SelectBuffCount(_env, unit1, global.BUFF_MARKED(_env, "STEALTH")) == 0 then
						count = count + 1

						global.print(_env, "场上存在嘲讽角色", count)

						break
					end
				end

				if count == 0 then
					local TAR = global.RandomN(_env, 1, global.EnemyUnits(_env, -global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "STEALTH"))))

					global.print(_env, "谁", global.GetUnitCid(_env, _env.unit), "随机目标为", global.GetUnitId(_env, TAR[1]))
					global.AssignRoles(_env, TAR[1], "target")

					local buff_taunt = global.Taunt(_env)

					global.ApplyBuff(_env, TAR[1], {
						duration = 2,
						group = "Skill_FTLYShi_Passive_1",
						timing = 4,
						limit = 1,
						tags = {
							"Skill_FTLYShi_Passive_Taunt"
						}
					}, {
						buff_taunt
					})
				end
			elseif global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.PETS + global.SUMMONS(_env, _env.unit) then
				local buff_check = global.SpecialNumericEffect(_env, "Skill_FTLYShi_Passive_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_FTLYShi_Passive_Check"
					}
				}, {
					buff_check
				})

				local count = 0

				for _, unit1 in global.__iter__(global.FriendUnits(_env)) do
					if global.SelectBuffCount(_env, unit1, global.BUFF_MARKED(_env, "TAUNT")) > 0 and global.SelectBuffCount(_env, unit1, global.BUFF_MARKED(_env, "STEALTH")) == 0 then
						count = count + 1

						global.print(_env, "场上存在嘲讽角色", count)

						break
					end
				end

				if count == 0 then
					local TAR = global.RandomN(_env, 1, global.FriendUnits(_env, -global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "STEALTH"))))

					global.print(_env, "谁", global.GetUnitCid(_env, _env.unit), "随机目标为", global.GetUnitId(_env, TAR[1]))
					global.AssignRoles(_env, TAR[1], "target")

					local buff_taunt = global.Taunt(_env)

					global.ApplyBuff(_env, TAR[1], {
						duration = 2,
						group = "Skill_FTLYShi_Passive_1",
						timing = 4,
						limit = 1,
						tags = {
							"Skill_FTLYShi_Passive_Taunt"
						}
					}, {
						buff_taunt
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS + global.SUMMONS(_env, _env.unit) then
				for _, unit1 in global.__iter__(global.EnemyUnits(_env)) do
					global.DispelBuff(_env, unit1, global.BUFF_MARKED_ALL(_env, "Skill_FTLYShi_Passive_Taunt"), 99)
				end
			elseif global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.PETS + global.SUMMONS(_env, _env.unit) then
				for _, unit1 in global.__iter__(global.FriendUnits(_env)) do
					global.DispelBuff(_env, unit1, global.BUFF_MARKED_ALL(_env, "Skill_FTLYShi_Passive_Taunt"), 99)
				end

				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "Skill_FTLYShi_Passive_Check"), 99)
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
			local SumCount = 0

			for _, unit in global.__iter__(global.AllUnits(_env)) do
				SumCount = SumCount + 1
			end

			global.print(_env, "奥古斯特-当前单位数量===", SumCount)

			local buffeft1 = global.NumericEffect(_env, "+aoederate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor * SumCount)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "Skill_FTLYShi_Passive_2",
				timing = 0,
				limit = 1,
				tags = {
					"Skill_FTLYShi_Passive_2",
					"UNHURTRATE",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
			global.print(_env, "奥古斯特-当前范围免伤率===", global.UnitPropGetter(_env, "aoederate")(_env, _env.ACTOR))
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
			local buff1 = global.SpecialNumericEffect(_env, "+Skill_FTLYShi_DamageDownFactor", {
				"+Normal",
				"+Normal"
			}, this.DamageDownFactor)
			local buff2 = global.SpecialNumericEffect(_env, "+Skill_FTLYShi_MasterHpFactor", {
				"+Normal",
				"+Normal"
			}, this.MasterHpFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"Skill_FTLYShi_Passive_5",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff1,
				buff2
			})
		end)

		return _env
	end,
	passive5 = function (_env, externs)
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

			if global.PETS - global.SUMMONS(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.Energy)

				for _, unit1 in global.__iter__(global.RandomN(_env, 1, global.FriendUnits(_env, global.PETS - global.SUMMONS))) do
					local buffeft1 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, global.UnitPropGetter(_env, "atk")(_env, _env.unit) * this.AtkFactor / global.UnitPropGetter(_env, "atk")(_env, unit1))

					global.ApplyBuff_Buff(_env, _env.ACTOR, unit1, {
						timing = 1,
						duration = 3,
						display = "AtkUp",
						tags = {
							"STATUS",
							"NUMERIC",
							"BUFF",
							"ATKUP",
							"Skill_FTLYShi_Passive_3",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
				end

				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))) do
					local buffeft2 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.AtkFactor)

					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
						timing = 1,
						duration = 3,
						display = "AtkUp",
						tags = {
							"CARDBUFF",
							"BUFF",
							"Skill_FTLYShi_Passive_3",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft2
					})
				end
			end
		end)

		return _env
	end
}

return _M
