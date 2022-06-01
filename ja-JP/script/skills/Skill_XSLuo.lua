local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_XSLuo_Normal = {
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
				-1.1,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			467
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
all.Skill_XSLuo_Proud = {
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
			1300
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XSLuo"
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
				-1.1,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			867
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
all.Skill_XSLuo_Unique = {
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

		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.2
		end

		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.6
		end

		this.CostFactor = externs.CostFactor

		if this.CostFactor == nil then
			this.CostFactor = 2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3433
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XSLuo"
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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.1,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2467
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local shield = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "Shield",
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				shield
			})

			local friend_count = 0
			local enemy_count = 0

			for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS - global.SUMMONS)) do
				friend_count = friend_count + 1
			end

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.PETS - global.SUMMONS)) do
				enemy_count = enemy_count + 1
			end

			if enemy_count < friend_count then
				local buffeft = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)

				for _, unit in global.__iter__(global.FriendUnits(_env, global.MARKED(_env, "WARRIOR") * global.MARKED(_env, "HEALER"))) do
					global.ApplyBuff(_env, unit, {
						timing = 4,
						duration = 12,
						display = "AtkUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"ATKUP",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft
					})
				end
			else
				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "WARRIOR") * global.CARD_HERO_MARKED(_env, "HEALER"))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.CostFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"XSLuo_Unique"
						}
					}, {
						cardvaluechange
					})
				end
			end

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				134,
				234,
				300,
				400
			}, global.SplitValue(_env, damage, {
				0.1,
				0.2,
				0.2,
				0.2,
				0.3
			}))
		end)
		exec["@time"]({
			3200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XSLuo_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CostFactor = externs.CostFactor

		if this.CostFactor == nil then
			this.CostFactor = 15
		end

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

			if global.SpecialPropGetter(_env, "XSLuo_Passive")(_env, global.FriendField(_env)) == 0 then
				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))) do
					if card then
						local value = global.GetCardCost(_env, card)
						local change_value = global.abs(_env, this.CostFactor - value)

						if this.CostFactor < value then
							local cardvaluechange = global.CardCostEnchant(_env, "-", change_value, 1)

							global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
								tags = {
									"CARDBUFF",
									"UNDISPELLABLE",
									"XSLuo_Unique"
								}
							}, {
								cardvaluechange
							})

							local buff = global.SpecialNumericEffect(_env, "+XSLuo_Passive", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"XSLuo_Passive"
								}
							}, {
								buff
							})
						elseif value < this.CostFactor then
							local cardvaluechange = global.CardCostEnchant(_env, "+", change_value, 1)

							global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
								tags = {
									"CARDBUFF",
									"UNDISPELLABLE",
									"XSLuo_Unique"
								}
							}, {
								cardvaluechange
							})

							local buff = global.SpecialNumericEffect(_env, "+XSLuo_Passive", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"XSLuo_Passive"
								}
							}, {
								buff
							})
						end
					end
				end

				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, global.EnemyField(_env)))) do
					if card then
						local value = global.GetCardCost(_env, card)
						local change_value = global.abs(_env, this.CostFactor - value)

						if this.CostFactor < value then
							local cardvaluechange = global.CardCostEnchant(_env, "-", change_value, 1)

							global.ApplyEnchant(_env, global.GetOwner(_env, global.EnemyField(_env)), card, {
								tags = {
									"CARDBUFF",
									"UNDISPELLABLE",
									"XSLuo_Unique"
								}
							}, {
								cardvaluechange
							})

							local buff = global.SpecialNumericEffect(_env, "+XSLuo_Passive", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"XSLuo_Passive"
								}
							}, {
								buff
							})
						elseif value < this.CostFactor then
							local cardvaluechange = global.CardCostEnchant(_env, "+", change_value, 1)

							global.ApplyEnchant(_env, global.GetOwner(_env, global.EnemyField(_env)), card, {
								tags = {
									"CARDBUFF",
									"UNDISPELLABLE",
									"XSLuo_Unique"
								}
							}, {
								cardvaluechange
							})

							local buff = global.SpecialNumericEffect(_env, "+XSLuo_Passive", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"XSLuo_Passive"
								}
							}, {
								buff
							})
						end
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_XSLuo_Proud_EX = {
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

		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1300
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XSLuo"
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
				-1.1,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			867
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
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
			})
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_XSLuo_Unique_EX = {
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

		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.3
		end

		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 1
		end

		this.CostFactor = externs.CostFactor

		if this.CostFactor == nil then
			this.CostFactor = 3
		end

		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 1000
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3433
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XSLuo"
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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.1,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2467
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local shield = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "Shield",
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				shield
			})

			local friend_count = 0
			local enemy_count = 0

			for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS - global.SUMMONS)) do
				friend_count = friend_count + 1
			end

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.PETS - global.SUMMONS)) do
				enemy_count = enemy_count + 1
			end

			if enemy_count < friend_count then
				local buffeft = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)

				for _, unit in global.__iter__(global.FriendUnits(_env, global.MARKED(_env, "WARRIOR") * global.MARKED(_env, "HEALER"))) do
					global.ApplyBuff(_env, unit, {
						timing = 4,
						duration = 12,
						display = "AtkUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"ATKUP",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft
					})
				end
			else
				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "WARRIOR") * global.CARD_HERO_MARKED(_env, "HEALER"))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.CostFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"XSLuo_Unique"
						}
					}, {
						cardvaluechange
					})
				end
			end

			if friend_count - enemy_count > 4 then
				for _, unit in global.__iter__(global.FriendUnits(_env, global.MARKED(_env, "WARRIOR") * global.MARKED(_env, "HEALER"))) do
					global.ApplyRPRecovery(_env, unit, this.RageFactor)
				end
			end

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				134,
				234,
				300,
				400
			}, global.SplitValue(_env, damage, {
				0.1,
				0.2,
				0.2,
				0.2,
				0.3
			}))
		end)
		exec["@time"]({
			3200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XSLuo_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CostFactor = externs.CostFactor

		if this.CostFactor == nil then
			this.CostFactor = 15
		end

		this.UnHurtFactor = externs.UnHurtFactor

		if this.UnHurtFactor == nil then
			this.UnHurtFactor = 0.3
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

			if global.SpecialPropGetter(_env, "XSLuo_Passive")(_env, global.FriendField(_env)) == 0 then
				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))) do
					if card then
						local value = global.GetCardCost(_env, card)
						local change_value = global.abs(_env, this.CostFactor - value)

						if this.CostFactor < value then
							local cardvaluechange = global.CardCostEnchant(_env, "-", change_value, 1)

							global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
								tags = {
									"CARDBUFF",
									"UNDISPELLABLE",
									"XSLuo_Unique"
								}
							}, {
								cardvaluechange
							})

							local buff = global.SpecialNumericEffect(_env, "+XSLuo_Passive", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"XSLuo_Passive"
								}
							}, {
								buff
							})
						elseif value < this.CostFactor then
							local cardvaluechange = global.CardCostEnchant(_env, "+", change_value, 1)

							global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
								tags = {
									"CARDBUFF",
									"UNDISPELLABLE",
									"XSLuo_Unique"
								}
							}, {
								cardvaluechange
							})

							local buff = global.SpecialNumericEffect(_env, "+XSLuo_Passive", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"XSLuo_Passive"
								}
							}, {
								buff
							})
						end
					end
				end

				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, global.EnemyField(_env)))) do
					if card then
						local value = global.GetCardCost(_env, card)
						local change_value = global.abs(_env, this.CostFactor - value)

						if this.CostFactor < value then
							local cardvaluechange = global.CardCostEnchant(_env, "-", change_value, 1)

							global.ApplyEnchant(_env, global.GetOwner(_env, global.EnemyField(_env)), card, {
								tags = {
									"CARDBUFF",
									"UNDISPELLABLE",
									"XSLuo_Unique"
								}
							}, {
								cardvaluechange
							})

							local buff = global.SpecialNumericEffect(_env, "+XSLuo_Passive", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"XSLuo_Passive"
								}
							}, {
								buff
							})
						elseif value < this.CostFactor then
							local cardvaluechange = global.CardCostEnchant(_env, "+", change_value, 1)

							global.ApplyEnchant(_env, global.GetOwner(_env, global.EnemyField(_env)), card, {
								tags = {
									"CARDBUFF",
									"UNDISPELLABLE",
									"XSLuo_Unique"
								}
							}, {
								cardvaluechange
							})

							local buff = global.SpecialNumericEffect(_env, "+XSLuo_Passive", {
								"+Normal",
								"+Normal"
							}, 1)

							global.ApplyBuff(_env, global.FriendField(_env), {
								timing = 0,
								duration = 99,
								tags = {
									"XSLuo_Passive"
								}
							}, {
								buff
							})
						end
					end
				end
			end

			local buff_hurt = global.SpecialNumericEffect(_env, "+XSLuo_Passive_EX", {
				"+Normal",
				"+Normal"
			}, this.UnHurtFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "XSLuo_Passive_EX",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"HURTED",
					"XSLuo_Passive_EX"
				}
			}, {
				buff_hurt
			})
		end)

		return _env
	end
}

return _M
