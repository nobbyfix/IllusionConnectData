local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_MDSi_Normal = {
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
			900
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
all.Skill_MDSi_Proud = {
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
			1434
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_MDSi"
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
all.Skill_MDSi_Proud_EX = {
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

		this.Period = externs.Period

		if this.Period == nil then
			this.Period = 15
		end

		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.6
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.8
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1434
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_MDSi"
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

			if not global.MASTER(_env, _env.TARGET) and not global.MARKED(_env, "SummonedNian")(_env, _env.TARGET) then
				local hp = global.UnitPropGetter(_env, "hp")(_env, _env.TARGET)
				local extra_damage = hp * this.DamageFactor

				global.ApplyHPDamage(_env, _env.TARGET, extra_damage)

				if global.SelectBuffCount(_env, _env.TARGET, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) == 0 then
					local Heal = extra_damage * this.HealRateFactor
					local Swtich = true
					local LastHeal = global.SpecialPropGetter(_env, "Skill_MDSi_Hprecovery_Proud_LastHeal")(_env, _env.TARGET)
					Heal = Heal + LastHeal

					global.DispelBuff(_env, _env.TARGET, global.BUFF_MARKED(_env, "Skill_MDSi_Hprecovery_Proud"), 99)

					local buff = global.PassiveFunEffectBuff(_env, "Skill_MDSi_Hprecovery_Proud", {
						Period = this.Period,
						Heal = Heal,
						Swtich = Swtich
					})

					global.ApplyBuff(_env, _env.TARGET, {
						timing = 4,
						duration = this.Period,
						tags = {
							"BUFF",
							"Skill_MDSi_Hprecovery_Proud",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})
				end
			end
		end)

		return _env
	end
}
all.Skill_MDSi_Unique = {
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
				2.65,
				0
			}
		end

		this.Period = externs.Period

		if this.Period == nil then
			this.Period = 20
		end

		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.6
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.8
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2734
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_MDSi"
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
			_env.units = global.RandomN(_env, 3, global.EnemyUnits(_env))

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				global.setRootVisible(_env, unit, false)
			end

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
				global.setRootVisible(_env, unit, true)
			end

			global.GroundEft(_env, _env.ACTOR, "BGEffectTrueBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.HarmTargetView(_env, _env.units)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				if not global.MASTER(_env, unit) and not global.MARKED(_env, "SummonedNian")(_env, unit) then
					local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
					local extra_damage = hp * this.DamageFactor

					global.ApplyHPDamage(_env, unit, extra_damage)

					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) == 0 then
						local Heal = extra_damage * this.HealRateFactor
						local Swtich = true
						local LastHeal = global.SpecialPropGetter(_env, "Skill_MDSi_Hprecovery_Unique_LastHeal")(_env, unit)
						Heal = Heal + LastHeal

						global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Skill_MDSi_Hprecovery"), 99)

						local buff = global.PassiveFunEffectBuff(_env, "Skill_MDSi_Hprecovery_Unique", {
							Period = this.Period,
							Heal = Heal,
							Swtich = Swtich
						})

						global.ApplyBuff(_env, unit, {
							timing = 4,
							duration = this.Period,
							tags = {
								"BUFF",
								"Skill_MDSi_Hprecovery",
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
		exec["@time"]({
			2734
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				global.setRootVisible(_env, unit, true)
			end
		end)

		return _env
	end
}
all.Skill_MDSi_Unique_EX = {
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
				3.2,
				0
			}
		end

		this.Period = externs.Period

		if this.Period == nil then
			this.Period = 20
		end

		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.8
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.8
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2734
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_MDSi"
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
			_env.units = global.RandomN(_env, 3, global.EnemyUnits(_env))

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				global.setRootVisible(_env, unit, false)
			end

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
				global.setRootVisible(_env, unit, true)
			end

			global.GroundEft(_env, _env.ACTOR, "BGEffectTrueBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.HarmTargetView(_env, _env.units)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				if not global.MASTER(_env, unit) and not global.MARKED(_env, "SummonedNian")(_env, unit) then
					local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
					local extra_damage = hp * this.DamageFactor

					global.ApplyHPDamage(_env, unit, extra_damage)

					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) == 0 then
						local Heal = extra_damage * this.HealRateFactor
						local Swtich = true
						local LastHeal = global.SpecialPropGetter(_env, "Skill_MDSi_Hprecovery_Unique_LastHeal")(_env, unit)
						Heal = Heal + LastHeal

						global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Skill_MDSi_Hprecovery"), 99)

						local buff = global.PassiveFunEffectBuff(_env, "Skill_MDSi_Hprecovery_Unique", {
							Period = this.Period,
							Heal = Heal,
							Swtich = Swtich
						})

						global.ApplyBuff(_env, unit, {
							timing = 4,
							duration = this.Period,
							tags = {
								"BUFF",
								"Skill_MDSi_Hprecovery",
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
		exec["@time"]({
			2734
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				global.setRootVisible(_env, unit, true)
			end
		end)

		return _env
	end
}
all.Skill_MDSi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 0.15
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
			local cards = global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))

			for _, card in global.__iter__(cards) do
				if global.MARKED(_env, "MAGE")(_env, card) then
					local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.RateFactor)

					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
						duration = 99,
						group = "Skill_MDSi_Passive",
						timing = 0,
						limit = 1,
						tags = {
							"CARDBUFF",
							"BUFF",
							"Skill_MDSi_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})
					global.FlyBallEffect(_env, _env.ACTOR, card)
				end
			end
		end)

		return _env
	end
}
all.Skill_MDSi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 0.23
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
			local cards = global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))

			for _, card in global.__iter__(cards) do
				if global.MARKED(_env, "MAGE")(_env, card) then
					local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.RateFactor)

					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
						duration = 99,
						group = "Skill_MDSi_Passive",
						timing = 0,
						limit = 1,
						tags = {
							"CARDBUFF",
							"BUFF",
							"Skill_MDSi_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})
					global.FlyBallEffect(_env, _env.ACTOR, card)
				end
			end
		end)

		return _env
	end
}
all.Skill_MDSi_Hprecovery_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Period = externs.Period

		assert(this.Period ~= nil, "External variable `Period` is not provided.")

		this.Heal = externs.Heal

		assert(this.Heal ~= nil, "External variable `Heal` is not provided.")

		this.Swtich = externs.Swtich

		assert(this.Swtich ~= nil, "External variable `Swtich` is not provided.")

		this.LastHeal = this.Heal
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[schedule_in_cycles]"](this, {
			1000
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
			local healing = this.Heal / this.Period

			if healing and healing > 1 then
				global.ApplyHPRecovery(_env, _env.ACTOR, healing, this.Swtich)

				local buffeft = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.ACTOR, {
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

				this.LastHeal = this.LastHeal - healing

				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_MDSi_Hprecovery_Unique_LastHeal"), 99)

				local buff = global.SpecialNumericEffect(_env, "+Skill_MDSi_Hprecovery_Unique_LastHeal", {
					"+Normal",
					"+Normal"
				}, this.LastHeal)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"Skill_MDSi_Hprecovery_Unique_LastHeal",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}
all.Skill_MDSi_Hprecovery_Proud = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Period = externs.Period

		assert(this.Period ~= nil, "External variable `Period` is not provided.")

		this.Heal = externs.Heal

		assert(this.Heal ~= nil, "External variable `Heal` is not provided.")

		this.Swtich = externs.Swtich

		assert(this.Swtich ~= nil, "External variable `Swtich` is not provided.")

		this.LastHeal = this.Heal
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[schedule_in_cycles]"](this, {
			1000
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
			local healing = this.Heal / this.Period

			if healing and healing > 1 then
				global.ApplyHPRecovery(_env, _env.ACTOR, healing, this.Swtich)

				local buffeft = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.ACTOR, {
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

				this.LastHeal = this.LastHeal - healing

				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_MDSi_Hprecovery_Proud_LastHeal"), 99)

				local buff = global.SpecialNumericEffect(_env, "+Skill_MDSi_Hprecovery_Proud_LastHeal", {
					"+Normal",
					"+Normal"
				}, this.LastHeal)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"Skill_MDSi_Hprecovery_Proud_LastHeal",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}

return _M
