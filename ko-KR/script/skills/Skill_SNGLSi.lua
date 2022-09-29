local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SNGLSi_Normal = {
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
			867
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
			533
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
all.Skill_SNGLSi_Proud = {
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
			"Hero_Proud_SNGLSi"
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
				-2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			900
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
all.Skill_SNGLSi_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 1000
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2800
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SNGLSi"
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
		_env.mode = 1

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

			global.GroundEft(_env, _env.ACTOR, "Ground_SNGLSi")
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "SNGLSi_Unique_Bingo")) > 0 then
				_env.mode = 2
			end

			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.ONESELF(_env, _env.ACTOR) - global.SUMMONS - global.MARKED(_env, "DAGUN") - global.HASSTATUS(_env, "CANNOT_BACK_TO_CARD")), "<", global.UnitPropGetter(_env, "hp")), 1, 1)

			if _env.mode == 1 then
				global.HealTargetView(_env, _env.units)
			end
		end)
		exec["@time"]({
			2067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.mode == 1 then
				if _env.units[1] then
					local card = global.BackToCard_ResultIDCheck(_env, _env.ACTOR, _env.units[1], "card")

					if card then
						global.Kick(_env, _env.units[1])

						local buff = global.NumericEffect(_env, "+def", {
							"+Normal",
							"+Normal"
						}, 0)

						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
							timing = 0,
							duration = 99,
							tags = {
								"Skill_SNGLSi_Unique_Target"
							}
						}, {
							buff
						})

						local buff_bingo = global.PassiveFunEffectBuff(_env, "Skill_SNGLSi_Check", {
							RpAddFactor = 0
						})

						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"SNGLSi_Unique_Bingo"
							}
						}, {
							buff_bingo
						})
					end
				end
			else
				local cards = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))

				for _, card in global.__iter__(cards) do
					if global.SelectCardBuffCount(_env, card, "Skill_SNGLSi_Unique_Target") > 0 then
						global.RecruitCard(_env, card, {
							global.Random(_env, 1, 9)
						})
					end
				end
			end
		end)
		exec["@time"]({
			2750
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_SNGLSi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 0
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 1
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
		this.HpShareFactor = externs.HpShareFactor

		if this.HpShareFactor == nil then
			this.HpShareFactor = 0.5
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
			local count = #global.EnemyUnits(_env, global.SUMMONS * global.HASSTATUS(_env, "SummonedSNGLSi"))

			if count < 2 then
				local i = global.Random(_env, 1, 3)
				local summoned_name = nil

				if i == 1 then
					summoned_name = "SummonedSNGLSi1"
				elseif i == 2 then
					summoned_name = "SummonedSNGLSi2"
				else
					summoned_name = "SummonedSNGLSi3"
				end

				local SummonedSNGLSi = global.SummonEnemy(_env, _env.ACTOR, summoned_name, this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})

				if SummonedSNGLSi then
					global.AddStatus(_env, SummonedSNGLSi, "SummonedSNGLSi")

					local buff = global.SpecialNumericEffect(_env, "+Skill_SNGLSi_Passive", {
						"?Normal"
					}, this.HpShareFactor)

					global.ApplyBuff(_env, global.EnemyField(_env), {
						duration = 99,
						group = "Skill_SNGLSi_Passive",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"Skill_SNGLSi_Passive",
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

function all.SNGLSi_Damage_Share(_env, deergroup, damage, ratio)
	local this = _env.this
	local global = _env.global
	local damage_original = damage.val

	for _, deer in global.__iter__(deergroup) do
		if deer then
			local damage_shared = damage_original * ratio
			local deer_hp = global.UnitPropGetter(_env, "hp")(_env, deer)
			local deer_shield = global.UnitPropGetter(_env, "shield")(_env, deer)

			if damage_shared >= deer_hp + deer_shield then
				damage_shared = deer_hp + deer_shield
			end

			global.ApplyHPDamage(_env, deer, global.ceil(_env, damage_shared))

			damage.val = damage.val - damage_shared
		end
	end

	return damage
end

all.Skill_SNGLSi_Check = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RpAddFactor = externs.RpAddFactor

		assert(this.RpAddFactor ~= nil, "External variable `RpAddFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive1)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[schedule_in_cycles]"](this, {
			1000
		}, passive3)

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

		_env.isRevive = externs.isRevive

		assert(_env.isRevive ~= nil, "External variable `isRevive` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and _env.isRevive == false and global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "Skill_SNGLSi_Unique_Target")) > 0 then
				global.DispelBuff(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "SNGLSi_Unique_Bingo"), 99)
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED(_env, "Skill_SNGLSi_Unique_Target"), 99)
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

			for _, unit in global.__iter__(global.FriendUnits(_env, global.MARKED(_env, "SNGLSi"))) do
				if this.RpAddFactor ~= 0 and global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "SNGLSi_Rp")) > 0 then
					global.ApplyRPRecovery(_env, unit, this.RpAddFactor)
				end
			end
		end)

		return _env
	end
}
all.Skill_SNGLSi_Proud_EX = {
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

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 1.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1234
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SNGLSi"
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
				-2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			for _, friendunit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS - global.MARKED(_env, "DAGUN")), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, friendunit, this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, friendunit, heal)
			end
		end)

		return _env
	end
}
all.Skill_SNGLSi_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 1000
		end

		this.RpAddFactor = externs.RpAddFactor

		if this.RpAddFactor == nil then
			this.RpAddFactor = 30
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2800
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SNGLSi"
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
		_env.mode = 1

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

			global.GroundEft(_env, _env.ACTOR, "Ground_SNGLSi")
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "SNGLSi_Unique_Bingo")) > 0 then
				_env.mode = 2
			end

			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.ONESELF(_env, _env.ACTOR) - global.SUMMONS - global.MARKED(_env, "DAGUN") - global.HASSTATUS(_env, "CANNOT_BACK_TO_CARD")), "<", global.UnitPropGetter(_env, "hp")), 1, 1)

			if _env.mode == 1 then
				global.HealTargetView(_env, _env.units)
			end
		end)
		exec["@time"]({
			2067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.mode == 1 then
				if _env.units[1] then
					local card = global.BackToCard_ResultIDCheck(_env, _env.ACTOR, _env.units[1], "card")

					if card then
						global.Kick(_env, _env.units[1])

						local buff = global.NumericEffect(_env, "+def", {
							"+Normal",
							"+Normal"
						}, 0)

						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
							timing = 0,
							duration = 99,
							tags = {
								"Skill_SNGLSi_Unique_Target"
							}
						}, {
							buff
						})
						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"SNGLSi_Rp"
							}
						}, {
							buff
						})

						local buff_bingo = global.PassiveFunEffectBuff(_env, "Skill_SNGLSi_Check", {
							RpAddFactor = this.RpAddFactor
						})

						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"SNGLSi_Unique_Bingo"
							}
						}, {
							buff_bingo
						})
					end
				end
			else
				local cards = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))

				for _, card in global.__iter__(cards) do
					if global.SelectCardBuffCount(_env, card, "Skill_SNGLSi_Unique_Target") > 0 then
						local Aibo = global.RecruitCard(_env, card, {
							global.Random(_env, 1, 9)
						})

						if Aibo then
							global.DispelBuff(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "SNGLSi_Rp"), 99)
						end
					end
				end
			end
		end)
		exec["@time"]({
			2750
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_SNGLSi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 0
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 1
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
		this.HpShareFactor = externs.HpShareFactor

		if this.HpShareFactor == nil then
			this.HpShareFactor = 0.5
		end

		this.HpRateFactor = externs.HpRateFactor

		if this.HpRateFactor == nil then
			this.HpRateFactor = 2.2
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
			local count = #global.EnemyUnits(_env, global.SUMMONS * global.HASSTATUS(_env, "SummonedSNGLSi"))
			local heal = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR) * this.HpRateFactor

			if count < 2 then
				local i = global.Random(_env, 1, 3)
				local summoned_name = nil

				if i == 1 then
					summoned_name = "SummonedSNGLSi1"
				elseif i == 2 then
					summoned_name = "SummonedSNGLSi2"
				else
					summoned_name = "SummonedSNGLSi3"
				end

				local SummonedSNGLSi = global.SummonEnemy(_env, _env.ACTOR, summoned_name, this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})

				if SummonedSNGLSi then
					global.AddStatus(_env, SummonedSNGLSi, "SummonedSNGLSi")

					local buff = global.SpecialNumericEffect(_env, "+Skill_SNGLSi_Passive", {
						"?Normal"
					}, this.HpShareFactor)

					global.ApplyBuff(_env, global.EnemyField(_env), {
						duration = 99,
						group = "Skill_SNGLSi_Passive",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"Skill_SNGLSi_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})

					local buff_Death = global.PassiveFunEffectBuff(_env, "Skill_SNGLSi_Death", {
						heal = heal
					})

					global.ApplyBuff(_env, SummonedSNGLSi, {
						timing = 0,
						duration = 99,
						tags = {
							"SNGLSi_Unique_Death"
						}
					}, {
						buff_Death
					})
				end
			end
		end)

		return _env
	end
}
all.Skill_SNGLSi_Death = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.heal = externs.heal

		assert(this.heal ~= nil, "External variable `heal` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:DIE"
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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.ApplyHPRecovery(_env, unit, this.heal)
			end
		end)

		return _env
	end
}
all.Skill_SNGLSi_Unique_Activity = {
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
		main = global["[duration]"](this, {
			2800
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SNGLSi"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_ENTER"
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

			global.RetainObject(_env, _env.TARGET)
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Speak(_env, _env.ACTOR, {
				{
					"SNGLSi_SlientNight_1",
					3000
				}
			}, "", 0)
			global.GroundEft(_env, _env.ACTOR, "Ground_SNGLSi")
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
		end)
		exec["@time"]({
			2067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local i = global.Random(_env, 1, 3)
			local summoned_name = nil

			if i == 1 then
				summoned_name = "SummonedSNGLSi1"
			elseif i == 2 then
				summoned_name = "SummonedSNGLSi2"
			else
				summoned_name = "SummonedSNGLSi3"
			end

			local SummonedSNGLSi = global.SummonEnemy(_env, _env.ACTOR, summoned_name, {
				1,
				0,
				1
			}, nil, {
				9
			})

			if SummonedSNGLSi then
				global.AddStatus(_env, SummonedSNGLSi, "SummonedSNGLSi123")
			end
		end)
		exec["@time"]({
			2750
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
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

			if global.INSTATUS(_env, "SummonedSNGLSi123")(_env, _env.unit) then
				for _, unit in global.__iter__(global.EnemyUnits(_env, global.MARKED(_env, "BLTu"))) do
					global.Kick(_env, unit, true)
				end
			end
		end)

		return _env
	end
}

return _M
