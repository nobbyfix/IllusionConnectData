local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SP_KTSJKe_Normal = {
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
				1.1,
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
				-1,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				200
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
		end)

		return _env
	end
}
all.Skill_SP_KTSJKe_Proud = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1600
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_KTSJKe"
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

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				300,
				767
			}, global.SplitValue(_env, damage, {
				0.3,
				0.3,
				0.4
			}))
		end)

		return _env
	end
}
all.Skill_SP_KTSJKe_Unique = {
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

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 1
		end

		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 1
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.wifeFactor = externs.wifeFactor

		if this.wifeFactor == nil then
			this.wifeFactor = 4
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
		this.num = 0
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2867
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_KTSJKe"
		}, main)
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
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			global.GroundEft(_env, _env.ACTOR, "Ground_SP_KTSJKe")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.2,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, _env.TARGET)
			global.AssignRoles(_env, _env.TARGET, "target")
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			1500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				733
			}, global.SplitValue(_env, damage, {
				0.4,
				0.6
			}))

			this.num = #global.FriendUnits(_env)
			local buff = global.Diligent(_env)
			local SummonedSP_KTSJKe = global.Summon(_env, _env.ACTOR, "SummonedSP_KTSJKe", this.summonFactor, nil, {
				7,
				9,
				8,
				4,
				6,
				5,
				1,
				3,
				2
			})

			if SummonedSP_KTSJKe then
				global.AddStatus(_env, SummonedSP_KTSJKe, "SummonedSP_KTSJKe")

				local buffeft1 = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Wife_Normal", {
					"?Normal"
				}, this.wifeFactor)

				global.ApplyBuff(_env, SummonedSP_KTSJKe, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
				global.ApplyBuff(_env, SummonedSP_KTSJKe, {
					timing = 2,
					duration = 1,
					tags = {
						"STATUS",
						"DILIGENT",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end

			for _, unit in global.__iter__(global.FriendUnits(_env, global.SUMMONS)) do
				if global.INSTATUS(_env, "SummonedSP_KTSJKe")(_env, unit) then
					global.ApplyBuff(_env, unit, {
						timing = 2,
						duration = 1,
						tags = {
							"STATUS",
							"DILIGENT",
							"Skill_LDu_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})
				end
			end
		end)
		exec["@time"]({
			2800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
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
			local buffeft = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Wife_Normal", {
				"?Normal"
			}, this.wifeFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"UNDISPELLABLE",
					"UNSTEALABLE"
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.INSTATUS(_env, "SummonedSP_KTSJKe")(_env, _env.unit) then
				global.DiligentRound(_env, 100)
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

			if this.num == 9 then
				global.DiligentRound(_env)
			end
		end)

		return _env
	end
}
all.Skill_SP_KTSJKe_Passive = {
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
			local units = global.FriendUnits(_env, global.MARKED(_env, "SP_KTSJKe"))

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and units[1] and global.SUMMONS(_env, _env.unit) and not global.INSTATUS(_env, "SummonedSP_KTSJKe")(_env, _env.unit) then
				local SummonedSP_KTSJKe = global.Summon(_env, _env.ACTOR, "SummonedSP_KTSJKe", this.summonFactor, nil, {
					global.GetCellId(_env, _env.unit)
				})

				if SummonedSP_KTSJKe then
					global.AddStatus(_env, SummonedSP_KTSJKe, "SummonedSP_KTSJKe")

					local buffeft1 = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Wife_Normal", {
						"?Normal"
					}, global.SpecialPropGetter(_env, "SP_KTSJKe_Wife_Normal")(_env, _env.ACTOR))

					global.ApplyBuff(_env, SummonedSP_KTSJKe, {
						timing = 0,
						duration = 99,
						tags = {
							"STATUS",
							"NUMERIC",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})

					if global.SpecialPropGetter(_env, "SP_KTSJKe_Ex")(_env, _env.ACTOR) > 0 then
						local buff = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Ex", {
							"?Normal"
						}, 1)

						global.ApplyBuff(_env, SummonedSP_KTSJKe, {
							timing = 0,
							duration = 99,
							tags = {
								"STATUS",
								"NUMERIC",
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
all.Skill_SP_KTSJKe_Passive_Key = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.2
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_ACTION"
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+sp_hexi_special_atk", {
					"?Normal"
				}, 1.8)
				local buffeft2 = global.SpecialNumericEffect(_env, "+sp_hexi_special_maxhp", {
					"?Normal"
				}, this.MaxHpRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"SP_KTSJKe_Passive_Key",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.SUMMONS(_env, _env.unit) then
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "SP_KTSJKe_Passive_Key"), 99)
			end
		end)

		return _env
	end
}
all.Skill_SP_KTSJKe_Wife_Normal = {
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
			1300
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

		_env.TARGET = externs.TARGET

		assert(_env.TARGET ~= nil, "External variable `TARGET` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local dmgFactor = {
				1,
				global.SpecialPropGetter(_env, "SP_KTSJKe_Wife_Normal")(_env, _env.ACTOR),
				0
			}
			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, dmgFactor)

			if global.SpecialPropGetter(_env, "SP_KTSJKe_Ex")(_env, _env.ACTOR) > 0 then
				global.DispelBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "IMMUNE", "DISPELLABLE"), 99)
			end

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
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
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "ShenYin",
				tags = {
					"STATUS",
					"NUMERIC",
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
all.Skill_SP_KTSJKe_Proud_EX = {
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

		this.HpFactor = externs.HpFactor

		if this.HpFactor == nil then
			this.HpFactor = 0.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1600
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_KTSJKe"
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

			if global.PETS - global.SUMMONS(_env, _env.TARGET) then
				damage.val = damage.val + global.min(_env, global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR) * 1.8, global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET) * this.HpFactor)
			end

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				300,
				767
			}, global.SplitValue(_env, damage, {
				0.3,
				0.3,
				0.4
			}))
		end)

		return _env
	end
}
all.Skill_SP_KTSJKe_Unique_EX = {
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

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 1
		end

		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 1
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.wifeFactor = externs.wifeFactor

		if this.wifeFactor == nil then
			this.wifeFactor = 5
		end

		this.HpFactor = externs.HpFactor

		if this.HpFactor == nil then
			this.HpFactor = 0.3
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
		this.num = 0
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2867
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_KTSJKe"
		}, main)
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
			"SELF:AFTER_UNIQUE"
		}, passive3)

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
			global.GroundEft(_env, _env.ACTOR, "Ground_SP_KTSJKe")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.2,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, _env.TARGET)
			global.AssignRoles(_env, _env.TARGET, "target")
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			1500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				733
			}, global.SplitValue(_env, damage, {
				0.4,
				0.6
			}))

			this.num = #global.FriendUnits(_env)
			local buff = global.Diligent(_env)
			local SummonedSP_KTSJKe = global.Summon(_env, _env.ACTOR, "SummonedSP_KTSJKe", this.summonFactor, nil, {
				7,
				9,
				8,
				4,
				6,
				5,
				1,
				3,
				2
			})

			if SummonedSP_KTSJKe then
				global.AddStatus(_env, SummonedSP_KTSJKe, "SummonedSP_KTSJKe")

				local buffeft1 = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Wife_Normal", {
					"?Normal"
				}, this.wifeFactor)
				local buffeft2 = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Wife_HpDamage", {
					"?Normal"
				}, this.HpFactor)
				local buff2 = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Ex", {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, SummonedSP_KTSJKe, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buff2
				})
				global.ApplyBuff(_env, SummonedSP_KTSJKe, {
					timing = 2,
					duration = 1,
					tags = {
						"STATUS",
						"DILIGENT",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end

			for _, unit in global.__iter__(global.FriendUnits(_env, global.SUMMONS)) do
				if global.INSTATUS(_env, "SummonedSP_KTSJKe")(_env, unit) then
					global.ApplyBuff(_env, unit, {
						timing = 2,
						duration = 1,
						tags = {
							"STATUS",
							"DILIGENT",
							"Skill_LDu_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})
				end
			end
		end)
		exec["@time"]({
			3600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
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
			local buffeft = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Wife_Normal", {
				"?Normal"
			}, this.wifeFactor)
			local buff = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Ex", {
				"?Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft,
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.INSTATUS(_env, "SummonedSP_KTSJKe")(_env, _env.unit) then
				global.DiligentRound(_env, 100)
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

			if this.num == 9 then
				global.DiligentRound(_env)
			end
		end)

		return _env
	end
}
all.Skill_SP_KTSJKe_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Factor = externs.Factor

		if this.Factor == nil then
			this.Factor = 1
		end

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 500
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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			150
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive2)

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
			local units = global.FriendUnits(_env, global.MARKED(_env, "SP_KTSJKe"))

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and units[1] and global.SUMMONS(_env, _env.unit) and not global.INSTATUS(_env, "SummonedSP_KTSJKe")(_env, _env.unit) then
				local SummonedSP_KTSJKe = global.Summon(_env, _env.ACTOR, "SummonedSP_KTSJKe", this.summonFactor, nil, {
					global.GetCellId(_env, _env.unit)
				})

				if SummonedSP_KTSJKe then
					global.AddStatus(_env, SummonedSP_KTSJKe, "SummonedSP_KTSJKe")

					local buffeft1 = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Wife_Normal", {
						"?Normal"
					}, global.SpecialPropGetter(_env, "SP_KTSJKe_Wife_Normal")(_env, _env.ACTOR))

					global.ApplyBuff(_env, SummonedSP_KTSJKe, {
						timing = 0,
						duration = 99,
						tags = {
							"STATUS",
							"NUMERIC",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})

					if global.SpecialPropGetter(_env, "SP_KTSJKe_Ex")(_env, _env.ACTOR) > 0 then
						local buff = global.SpecialNumericEffect(_env, "+SP_KTSJKe_Ex", {
							"?Normal"
						}, 1)

						global.ApplyBuff(_env, SummonedSP_KTSJKe, {
							timing = 0,
							duration = 99,
							tags = {
								"STATUS",
								"NUMERIC",
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
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")
		exec["@time"]({
			100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendUnits(_env, global.MARKED(_env, "SP_KTSJKe_Wife"))

			if #units > 0 then
				local wife = global.RandomN(_env, 1, units)
				local cellid = global.GetCellId(_env, wife[1])

				global.Kick(_env, wife[1])
				global.ReviveByUnit(_env, _env.ACTOR, this.Factor, this.RpFactor, {
					cellid
				})
			end
		end)

		return _env
	end
}

return _M
