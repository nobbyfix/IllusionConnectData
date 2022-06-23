local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_LLKe_Normal = {
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
			834
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
			334
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
all.Skill_LLKe_Proud = {
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
			1234
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_LLKe"
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
			700
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
all.Skill_LLKe_Unique = {
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

		this.DeBeCuredRateFactor = externs.DeBeCuredRateFactor

		if this.DeBeCuredRateFactor == nil then
			this.DeBeCuredRateFactor = 0.25
		end

		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.5
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3800
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LLKe"
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
			local units = global.EnemyUnits(_env, global.MID_COL)

			if units[1] then
				_env.TARGET = units[1]
			end

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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2634
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET)
			local shield = maxHp * this.ShieldRateFactor

			global.ShakeScreen(_env, {
				Id = 4,
				duration = 80,
				enhance = 9
			})

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				67,
				134,
				200,
				267,
				334,
				400,
				467
			}, global.SplitValue(_env, damage, {
				0.125,
				0.125,
				0.125,
				0.125,
				0.125,
				0.125,
				0.125,
				0.125
			}))
			global.ShakeScreen(_env, {
				Id = 3,
				duration = 20,
				enhance = 3
			})

			local buffeft1 = global.NumericEffect(_env, "-becuredrate", {
				"+Normal",
				"+Normal"
			}, this.DeBeCuredRateFactor)

			global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
				timing = 4,
				display = "LLKe_blood",
				group = "Skill_LLKe_Unique",
				duration = 20,
				limit = 1,
				tags = {
					"STATUS",
					"DEBUFF",
					"BECUREDRATEDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			}, 1, 0)

			local buffeft2 = global.SpecialNumericEffect(_env, "+Skill_LLKe_Unique_Shield", {
				"+Normal",
				"+Normal"
			}, shield)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"Skill_LLKe_Unique",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			}, 1, 0)
		end)
		exec["@time"]({
			3600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LLKe_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.5
		end

		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.5
		end

		this.KICK_target = nil
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
		this.att_list = {}
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
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

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "LLKe"))) do
				global.addHeroCardSeatRules(_env, global.GetOwner(_env, _env.ACTOR), card, {
					"ASSASSIN",
					"MAGE"
				}, {
					"kick",
					"kick"
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
			this.KICK_target = global.GetCellId(_env, _env.unit)

			if global.MASTER(_env, _env.ACTOR) and (global.MARKED(_env, "ASSASSIN")(_env, _env.unit) or global.MARKED(_env, "MAGE")(_env, _env.unit)) then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_LLKe_Passive"), 99)

				local atk = this.AtkRateFactor * global.UnitPropGetter(_env, "atk")(_env, _env.unit)
				local hp = global.UnitPropGetter(_env, "hp")(_env, _env.unit)
				local shield = hp * this.ShieldRateFactor
				this.att_list = {
					atk,
					shield
				}
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

			if global.MASTER(_env, _env.ACTOR) and global.MARKED(_env, "LLKe")(_env, _env.unit) then
				global.print(_env, "111111111111", this.KICK_target, global.GetCellId(_env, _env.unit))

				if this.KICK_target == global.GetCellId(_env, _env.unit) then
					local buff1 = global.NumericEffect(_env, "+atk", {
						"+Normal",
						"+Normal"
					}, this.att_list[1])
					local buff2 = global.ShieldEffect(_env, this.att_list[2])

					global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = {
							"Shield",
							"AtkUp"
						},
						tags = {
							"NUMERIC",
							"Skill_LLKe_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff1,
						buff2
					}, 1, 0)
				end
			end
		end)

		return _env
	end
}
all.Skill_LLKe_Passive_Key = {
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
			"SELF:ENTER"
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

			if global.MARKED(_env, "LLKe")(_env, _env.ACTOR) then
				global.AddStatus(_env, _env.ACTOR, "LLKe_Key")
			end
		end)

		return _env
	end
}
all.Skill_LLKe_Proud_EX = {
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

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.1
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1234
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_LLKe"
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
			700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			if global.MARKED(_env, "ClubBoss")(_env, _env.TARGET) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local extra_damage = maxHp * this.MaxHpRateFactor

				global.ApplyRealDamage(_env, _env.ACTOR, _env.TARGET, 1, 1, 0, 0, 0, nil, extra_damage)
			end

			if not global.MASTER(_env, _env.TARGET) and not global.MARKED(_env, "DAGUN")(_env, _env.TARGET) and not global.MARKED(_env, "SummonedNian")(_env, _env.TARGET) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local extra_damage = global.min(_env, maxHp * this.MaxHpRateFactor, atk * 10)

				global.ApplyRealDamage(_env, _env.ACTOR, _env.TARGET, 1, 1, 0, 0, 0, nil, extra_damage)
			end
		end)

		return _env
	end
}
all.Skill_LLKe_Unique_EX = {
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
				6.25,
				0
			}
		end

		this.DeBeCuredRateFactor = externs.DeBeCuredRateFactor

		if this.DeBeCuredRateFactor == nil then
			this.DeBeCuredRateFactor = 0.35
		end

		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.65
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3800
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LLKe"
		}, main)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK"
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
			local units = global.EnemyUnits(_env, global.MID_COL)

			if units[1] then
				_env.TARGET = units[1]
			end

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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2634
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET)
			local shield = maxHp * this.ShieldRateFactor

			global.DispelBuff(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "LLKe_For_BackCard"), 99)

			local cost = global.GetCost(_env, _env.TARGET) * 0.5
			local buff_num = global.SpecialNumericEffect(_env, "+LLKe_Unique_Energy", {
				"+Normal",
				"+Normal"
			}, cost)
			local buff = global.PassiveFunEffectBuff(_env, "LLKe_For_BackCard")

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"LLKe_For_BackCard"
				}
			}, {
				buff,
				buff_num
			})
			global.ShakeScreen(_env, {
				Id = 4,
				duration = 80,
				enhance = 9
			})

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				67,
				134,
				200,
				267,
				334,
				400,
				467
			}, global.SplitValue(_env, damage, {
				0.125,
				0.125,
				0.125,
				0.125,
				0.125,
				0.125,
				0.125,
				0.125
			}))
			global.ShakeScreen(_env, {
				Id = 3,
				duration = 20,
				enhance = 3
			})

			local buffeft1 = global.NumericEffect(_env, "-becuredrate", {
				"+Normal",
				"+Normal"
			}, this.DeBeCuredRateFactor)

			global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
				timing = 4,
				display = "LLKe_blood",
				group = "Skill_LLKe_Unique",
				duration = 20,
				limit = 1,
				tags = {
					"STATUS",
					"DEBUFF",
					"BECUREDRATEDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			}, 1, 0)

			if shield and shield ~= 0 then
				local buffeft2 = global.SpecialNumericEffect(_env, "+Skill_LLKe_Unique_Shield", {
					"+Normal",
					"+Normal"
				}, shield)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LLKe_Unique",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				}, 1, 0)
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

			global.print(_env, global.GetUnitCid(_env, _env.unit), "cid=====")
			global.print(_env, global.GetFriendField(_env, nil, "LLK_is_kill"), "LLK_is_kill====")
			global.print(_env, global.GetFriendField(_env, nil, "BackToCard"), "BackToCard====")

			if global.GetFriendField(_env, nil, "LLK_is_kill") == 1 and global.GetFriendField(_env, nil, "BackToCard") == 1 then
				local Energy = global.SpecialPropGetter(_env, "LLKe_Unique_Energy")(_env, global.FriendField(_env)) or 4
				local card = global.CardsInWindow(_env, global.GetOwner(_env, _env.unit), global.CARD_HERO_MARKED(_env, global.GetUnitCid(_env, _env.unit)))

				if card then
					local cardvaluechange = global.CardCostEnchant(_env, "+", Energy, 1)

					global.print(_env, Energy, "Energy======")
					global.ApplyEnchant(_env, global.GetOwner(_env, global.EnemyMaster(_env)), card[1], {
						timing = 1,
						duration = 1,
						tags = {
							"CARDBUFF",
							"Skill_MTZMEShi_Passive",
							"UNDISPELLABLE"
						}
					}, {
						cardvaluechange
					})
					global.SetFriendField(_env, nil, 0, "LLK_is_kill")
					global.SetFriendField(_env, nil, 0, "BackToCard")
					global.SetFriendField(_env, nil, 0, global.GetUnitCid(_env, _env.unit))
				end
			end
		end)

		return _env
	end
}
all.Skill_LLKe_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 1
		end

		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 1
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
			"UNIT_KICK"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
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

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "LLKe"))) do
				global.addHeroCardSeatRules(_env, global.GetOwner(_env, _env.ACTOR), card, {
					"ASSASSIN",
					"MAGE"
				}, {
					"kick",
					"kick"
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

			if global.MASTER(_env, _env.ACTOR) and (global.MARKED(_env, "ASSASSIN")(_env, _env.unit) or global.MARKED(_env, "MAGE")(_env, _env.unit)) then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_LLKe_Passive"), 99)

				local atk = this.AtkRateFactor * global.UnitPropGetter(_env, "atk")(_env, _env.unit)
				local hp = global.UnitPropGetter(_env, "hp")(_env, _env.unit)
				local shield = hp * this.ShieldRateFactor
				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LLKe_Passive_atk", {
					"+Normal",
					"+Normal"
				}, atk)
				local buffeft2 = global.SpecialNumericEffect(_env, "+Skill_LLKe_Passive_shield", {
					"+Normal",
					"+Normal"
				}, shield)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"Skill_LLKe_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) and global.MARKED(_env, "LLKe")(_env, _env.unit) then
				local atk = global.SpecialPropGetter(_env, "Skill_LLKe_Passive_atk")(_env, _env.ACTOR)
				local shield = global.SpecialPropGetter(_env, "Skill_LLKe_Passive_shield")(_env, _env.ACTOR)

				if atk and shield and atk ~= 0 and shield ~= 0 then
					local buff1 = global.NumericEffect(_env, "+atk", {
						"+Normal",
						"+Normal"
					}, atk)
					local buff2 = global.ShieldEffect(_env, shield)

					global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
						timing = 0,
						duration = 99,
						display = {
							"Shield",
							"AtkUp"
						},
						tags = {
							"NUMERIC",
							"Skill_LLKe_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff1,
						buff2
					}, 1, 0)
				end
			end
		end)

		return _env
	end
}
all.LLKe_For_BackCard = {
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
			120
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive)
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
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.GetSide(_env, _env.unit) and global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "LLKe_BackCard_Check")) == 0 and global.EnemyMaster(_env) then
				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, global.EnemyMaster(_env)))) do
					if global.SelectEnhanceCount(_env, global.GetOwner(_env, global.EnemyMaster(_env)), card, global.BUFF_MARKED(_env, "Skill_LLKe_Unique")) == 0 then
						local buff_check = global.SpecialNumericEffect(_env, "+LLKe_BackCard_Check", {
							"+Normal",
							"+Normal"
						}, 1)

						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"LLKe_BackCard_Check"
							}
						}, {
							buff_check
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.isRevive = externs.isRevive

		assert(_env.isRevive ~= nil, "External variable `isRevive` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "LLKe_For_BackCard")) > 0 and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and _env.isRevive == false and global.PETS - global.SUMMONS(_env, _env.unit) then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "LLKe_For_BackCard"), 99)
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "LLKe_For_BackCard"), 99)
			end
		end)

		return _env
	end
}

return _M
