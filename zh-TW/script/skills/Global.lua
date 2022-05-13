local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all

function all.CreateSkillAnimation(_env, targetPos, runDuration, animName)
	local this = _env.this
	local global = _env.global
	local run = global.Animation(_env, "run", runDuration, nil, -1)
	run = global.MoveTo(_env, targetPos, runDuration, run)

	return global.Sequence(_env, run, global.Animation(_env, animName))
end

function all.CreateSkillAnimationTEST(_env, targetPos, runDuration, animName)
	local this = _env.this
	local global = _env.global
	local run = global.Animation(_env, "run", runDuration, nil, -1)
	run = global.MoveTo(_env, targetPos, runDuration, run)
	local burst = global.Animation(_env, "burst")

	return global.Sequence(_env, run, burst, global.Animation(_env, animName))
end

function all.NumBuffStrgFactor(_env, attacker)
	local this = _env.this
	local global = _env.global

	return 0.5 * attacker.effectstrg
end

function all.DotNumStrgFactor(_env, attacker)
	local this = _env.this
	local global = _env.global

	return 0.5 * attacker.effectstrg
end

function all.DotStrgFactor(_env, attacker)
	local this = _env.this
	local global = _env.global

	return 0.5 * attacker.effectstrg
end

function all.HotStrgFactor(_env, attacker)
	local this = _env.this
	local global = _env.global

	return 0.5 * attacker.effectstrg
end

function all.ShieldStrgFactor(_env, attacker)
	local this = _env.this
	local global = _env.global

	return 0.5 * attacker.effectstrg
end

function all.EftstrgToRound(_env, attacker)
	local this = _env.this
	local global = _env.global
	local count = nil

	if attacker.effectstrg >= 0.5 then
		count = 2
	elseif attacker.effectstrg >= 0.25 then
		count = 1
	else
		count = 0
	end

	return count
end

function all.BuffFactorAtk(_env, friendunit, buffFactorAtkRate, buffFactorAtkEx)
	local this = _env.this
	local global = _env.global
	local atk = global.UnitPropBaseGetter(_env, "atk")(_env, friendunit)

	return buffFactorAtkRate * atk + (buffFactorAtkEx or 0)
end

function all.BuffFactorDef(_env, friendunit, buffFactorDefRate, buffFactorDefEx)
	local this = _env.this
	local global = _env.global
	local def = global.UnitPropBaseGetter(_env, "def")(_env, friendunit)

	return buffFactorDefRate * def + (buffFactorDefEx or 0)
end

function all.BuffFactorShield(_env, friendunit, buffFactorShieldRate, buffFactorShieldEx)
	local this = _env.this
	local global = _env.global
	local shield = global.UnitPropGetter(_env, "maxHp")(_env, friendunit)

	return buffFactorShieldRate * shield + (buffFactorShieldEx or 0)
end

function all.BuffFactorDot(_env, friendunit, buffFactorDotRate, buffFactorDotEx)
	local this = _env.this
	local global = _env.global
	local atk = global.UnitPropGetter(_env, "atk")(_env, friendunit)

	return buffFactorDotRate * atk + (buffFactorDotEx or 0)
end

function all.CheckCtrlExDmg(_env, actor, target, damage)
	local this = _env.this
	local global = _env.global
	local ctrled = global.INANYSTATUS(_env, {
		"DAZED",
		"MUTED"
	})(_env, target)
	local attacker = global.LoadUnit(_env, actor, "ATTACKER")

	if ctrled then
		return global.ModifyDamage(_env, damage, "*", attacker.ctrlexdmg + 1)
	else
		return damage
	end
end

all.DO_NOTHING = {
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
			0
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]

		exec["@time"]({
			0
		}, _env, function (_env)
		end)

		return _env
	end
}

function all.EnergyRestrain(_env)
	local this = _env.this
	local global = _env.global
	local buffeft1 = global.EnergyEffect(_env, 1)

	if global.FriendMaster(_env) then
		global.ApplyBuff(_env, global.FriendMaster(_env), {
			timing = 4,
			duration = 99,
			tags = {
				"ENERGYEFFECTDOWN",
				"ENERGYRESTRAIN",
				"UNDISPELLABLE"
			}
		}, {
			buffeft1
		})
	end

	if global.EnemyMaster(_env) then
		global.ApplyBuff(_env, global.EnemyMaster(_env), {
			timing = 4,
			duration = 99,
			tags = {
				"ENERGYEFFECTDOWN",
				"ENERGYRESTRAIN",
				"UNDISPELLABLE"
			}
		}, {
			buffeft1
		})
	end
end

function all.EnergyRestrainStop(_env)
	local this = _env.this
	local global = _env.global

	if global.FriendMaster(_env) then
		global.DispelBuff(_env, global.FriendMaster(_env), global.BUFF_MARKED_ALL(_env, "ENERGYEFFECTDOWN", "ENERGYRESTRAIN", "UNDISPELLABLE"), nil, true)
	end

	if global.EnemyMaster(_env) then
		global.DispelBuff(_env, global.EnemyMaster(_env), global.BUFF_MARKED_ALL(_env, "ENERGYEFFECTDOWN", "ENERGYRESTRAIN", "UNDISPELLABLE"), nil, true)
	end
end

function all.ApplyStatusEffect(_env, actor, target)
	local this = _env.this
	local global = _env.global
	local dazeprob = global.SpecialPropGetter(_env, "dazeprob")(_env, actor)

	if global.ProbTest(_env, dazeprob) then
		local buffeft1 = global.Daze(_env)

		global.ApplyBuff(_env, target, {
			timing = 2,
			duration = 1,
			display = "Daze",
			tags = {
				"STATUS",
				"DEBUFF",
				"DAZE",
				"ABNORMAL",
				"DISPELLABLE"
			}
		}, {
			buffeft1
		})
	end

	local muteprob = global.SpecialPropGetter(_env, "muteprob")(_env, actor)

	if global.ProbTest(_env, muteprob) then
		local buffeft1 = global.Mute(_env)

		global.ApplyBuff(_env, target, {
			timing = 2,
			duration = 1,
			display = "Mute",
			tags = {
				"STATUS",
				"DEBUFF",
				"MUTE",
				"ABNORMAL",
				"DISPELLABLE"
			}
		}, {
			buffeft1
		})
	end

	local coldprob = global.SpecialPropGetter(_env, "coldprob")(_env, actor)

	if global.ProbTest(_env, coldprob) then
		local buffeft1 = global.NumericEffect(_env, "-speed", {
			"+Normal",
			"+Normal"
		}, 0.2)

		global.ApplyBuff(_env, target, {
			timing = 2,
			duration = 1,
			display = "Cold",
			tags = {
				"STATUS",
				"DEBUFF",
				"COLD",
				"ABNORMAL",
				"DISPELLABLE"
			}
		}, {
			buffeft1
		})
	end

	local freezeprob = global.SpecialPropGetter(_env, "freezeprob")(_env, actor)

	if global.ProbTest(_env, freezeprob) then
		local buffeft1 = global.Daze(_env)
		local buffeft2 = global.NumericEffect(_env, "-unhurtrate", {
			"+Normal",
			"+Normal"
		}, 0.3)

		global.ApplyBuff(_env, target, {
			timing = 2,
			duration = 1,
			display = "Freeze",
			tags = {
				"STATUS",
				"DEBUFF",
				"FREEZE",
				"ABNORMAL",
				"DISPELLABLE"
			}
		}, {
			buffeft1,
			buffeft2
		})
	end
end

function all.ApplyRPDamage_ResultCheck(_env, actor, target, damage)
	local this = _env.this
	local global = _env.global

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Accesory_15004")) > 0 then
		local UnHurtRateFactor = global.SpecialPropGetter(_env, "rage_unhurtrate_down")(_env, actor)
		local buff = global.NumericEffect(_env, "-unhurtrate", {
			"+Normal",
			"+Normal"
		}, UnHurtRateFactor)

		global.ApplyBuff_Debuff(_env, actor, target, {
			timing = 2,
			display = "UnHurtRateDown",
			group = "EquipSkill_Accesory_15004_effect",
			duration = 2,
			limit = 3,
			tags = {
				"STATUS",
				"NUMERIC",
				"DEBUFF",
				"UNHURTRATEDOWN",
				"DISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buff
		}, 1, 0)
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Armor_15006")) > 0 and global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "MORERAGECOUNT")) < 3 then
		local MoreRage = global.SpecialPropGetter(_env, "rage_morerage_down")(_env, actor)
		damage = damage + MoreRage
	end

	if global.MARKED(_env, "HYXia")(_env, target) or global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "CANNOT_RP_DOWN")) > 0 then
		damage = 0
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Boots_15110_1")) > 0 then
		local HurtRateFactor = global.SpecialPropGetter(_env, "boots_15110_1")(_env, actor)
		local buffeft1 = global.NumericEffect(_env, "-hurtrate", {
			"+Normal",
			"+Normal"
		}, HurtRateFactor)

		global.ApplyBuff(_env, global.FriendField(_env), {
			timing = 0,
			duration = 99,
			tags = {
				"COUNT",
				"UNDISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			global.count
		})
		global.ApplyBuff(_env, target, {
			duration = 3,
			group = "boots_15110_1_count",
			timing = 1,
			limit = 3,
			tags = {
				"HURTRATEDOWN",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"NUMERIC",
				"DEBUFF"
			}
		}, {
			buffeft1
		})
	end

	global.ApplyRPDamage(_env, target, damage)

	local buff_rpdown = global.SpecialNumericEffect(_env, "+rpdown", {
		"+Normal",
		"+Normal"
	}, 1)

	global.ApplyBuff(_env, target, {
		timing = 1,
		duration = 1,
		tags = {
			"RPDOWN"
		}
	}, {
		buff_rpdown
	})

	local buff_rpdown_applyed = global.SpecialNumericEffect(_env, "+rpdown_applyed", {
		"+Normal",
		"+Normal"
	}, 1)

	global.ApplyBuff(_env, actor, {
		timing = 1,
		duration = 1,
		tags = {
			"RPDOWN_APPLYED"
		}
	}, {
		buff_rpdown_applyed
	})
end

function all.ApplyRPEffect(_env, actor, target)
	local this = _env.this
	local global = _env.global
	local attacker = global.LoadUnit(_env, actor, "ATTACKER")
	local defender = global.LoadUnit(_env, target, "DEFENDER")
	local delrpprob_hurted = global.SpecialPropGetter(_env, "delrpprob_hurted")(_env, target)
	local delrpvalue_hurted = global.SpecialPropGetter(_env, "delrpvalue_hurted")(_env, target)

	if global.ProbTest(_env, delrpprob_hurted) then
		global.ApplyRPDamage_ResultCheck(_env, target, actor, delrpvalue_hurted)
	end

	local dazeprob_hurted = global.SpecialPropGetter(_env, "dazeprob_hurted")(_env, target)

	if global.ProbTest(_env, dazeprob_hurted) then
		local buffeft1 = global.Daze(_env)

		global.ApplyBuff(_env, actor, {
			timing = 2,
			duration = 2,
			display = "Daze",
			tags = {
				"STATUS",
				"DEBUFF",
				"DAZE",
				"ABNORMAL",
				"DISPELLABLE"
			}
		}, {
			buffeft1
		})
	end

	local addrpprob = global.SpecialPropGetter(_env, "addrpprob")(_env, actor)
	local addrpvalue = global.SpecialPropGetter(_env, "addrpvalue")(_env, actor)

	if global.ProbTest(_env, addrpprob) then
		global.ApplyRPRecovery(_env, actor, addrpvalue)
	end

	local rp = global.UnitPropGetter(_env, "rp")(_env, target)
	local delrppoint = global.SpecialPropGetter(_env, "delrppoint")(_env, actor)
	local delrprate = global.SpecialPropGetter(_env, "delrprate")(_env, actor)
	local delrpvalue = global.SpecialPropGetter(_env, "delrpvalue")(_env, actor)

	if delrppoint < rp and global.ProbTest(_env, delrprate) then
		global.ApplyRPDamage_ResultCheck(_env, actor, target, delrpvalue)
	end
end

function all.EvalDamage_FlagCheck(_env, actor, target, dmgFactor, passiveFactors)
	local this = _env.this
	local global = _env.global
	local Factors = {
		"atkrate",
		"atk",
		"hurtrate",
		"critrate"
	}
	local Flags = {
		"MASTER",
		"HERO",
		"SUMMONED",
		"ASSASSIN",
		"WARRIOR",
		"MAGE",
		"SUMMONER",
		"HEALER",
		"LIGHT",
		"DARK"
	}
	local FlagsPrename = {
		"Master_DmgExtra_",
		"Hero_DmgExtra_",
		"Summoned_DmgExtra_",
		"Assassin_DmgExtra_",
		"Warrior_DmgExtra_",
		"Mage_DmgExtra_",
		"Summoner_DmgExtra_",
		"Healer_DmgExtra_",
		"Light_DmgExtra_",
		"Dark_DmgExtra_"
	}
	local HealthCheck = {
		"目标生命低于",
		"目标生命高于"
	}
	local HealthCheckPrename = {
		"LowerHp_DmgExtra_",
		"HigherHp_DmgExtra_"
	}
	local Status = {
		"DAZE",
		"MUTE",
		"FREEZE",
		"COLD",
		"BURNING",
		"POISON",
		"TAUNT",
		"SHIELD"
	}
	local StatusPrename = {
		"DAZE_DmgExtra_",
		"MUTE_DmgExtra_",
		"FREEZE_DmgExtra_",
		"COLD_DmgExtra_",
		"BURNING_DmgExtra_",
		"POISON_DmgExtra_",
		"TAUNT_DmgExtra_",
		"SHIELD_DmgExtra_"
	}
	local Props = {
		"atkrate",
		"hurtrate",
		"defweaken",
		"critrate",
		"unhurtrate"
	}
	local Props2 = {
		"unhurtrate"
	}
	local Party = {
		"XiDe",
		"MoNvJiHui",
		"BuSiNiaoCaiTuan",
		"DongWenHui",
		"WeiNaSiXianJing",
		"ShiMengZhiShe"
	}
	local attacker = global.LoadUnit(_env, actor, "ALL")
	local defender = global.LoadUnit(_env, target, "ALL")
	local hurtedDefUpProb = global.SpecialPropGetter(_env, "hurtedDefUpProb")(_env, target)
	local hurtedDefUpRate = global.SpecialPropGetter(_env, "hurtedDefUpRate")(_env, target)

	if hurtedDefUpRate and hurtedDefUpRate ~= 0 and defender.defrate then
		local prob = global.EvalProb1(_env, attacker, defender, hurtedDefUpProb, 0)

		if global.ProbTest(_env, prob) then
			defender.defrate = defender.defrate + hurtedDefUpRate
		end
	end

	local hurtedUnHurtUpProb = global.SpecialPropGetter(_env, "hurtedUnHurtUpProb")(_env, target)
	local hurtedUnHurtUpRate = global.SpecialPropGetter(_env, "hurtedUnHurtUpRate")(_env, target)

	if hurtedUnHurtUpRate and hurtedUnHurtUpRate ~= 0 and defender.unhurtrate then
		local prob = global.EvalProb1(_env, attacker, defender, hurtedUnHurtUpProb, 0)

		if global.ProbTest(_env, 0.5) then
			local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, hurtedUnHurtUpRate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				display = "Dispel",
				group = "hurtedUnHurtUpProb",
				duration = 1,
				limit = 1,
				tags = {
					"HEAL",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			})
		end
	end

	local dispelprob = global.SpecialPropGetter(_env, "dispelprob")(_env, actor)
	local prob = global.EvalProb1(_env, attacker, defender, dispelprob, 0)

	if global.ProbTest(_env, prob) then
		global.DispelBuff(_env, target, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE"), 1)

		local buffeft2 = global.NumericEffect(_env, "+defrate", {
			"+Normal",
			"+Normal"
		}, 0)

		global.ApplyBuff(_env, target, {
			timing = 2,
			duration = 1,
			display = "Dispel",
			tags = {
				"HEAL",
				"UNDISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buffeft2
		})
	end

	local TargethpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, target)
	local LowerHpCheckRate = global.SpecialPropGetter(_env, "LowerHpCheckRate")(_env, actor)
	local HigherHpCheckRate = global.SpecialPropGetter(_env, "HigherHpCheckRate")(_env, actor)

	if TargethpRatio < LowerHpCheckRate then
		for _, prop in global.__iter__(Props) do
			local LowerHpValue = global.SpecialPropGetter(_env, "LowerHp_DmgExtra_" .. prop)(_env, actor)

			if LowerHpValue and LowerHpValue ~= 0 then
				attacker[prop] = attacker[prop] + LowerHpValue

				break
			end
		end
	elseif HigherHpCheckRate < TargethpRatio then
		for _, prop in global.__iter__(Props) do
			local HigherHpValue = global.SpecialPropGetter(_env, "HigherHp_DmgExtra_" .. prop)(_env, actor)

			if HigherHpValue and HigherHpValue ~= 0 then
				attacker[prop] = attacker[prop] + HigherHpValue

				break
			end
		end
	end

	local LowerHpCheckRate_PETS = global.SpecialPropGetter(_env, "LowerHpCheckRate_PETS")(_env, actor)
	local HigherHpCheckRate_PETS = global.SpecialPropGetter(_env, "HigherHpCheckRate_PETS")(_env, actor)

	if global.PETS(_env, target) and TargethpRatio < LowerHpCheckRate_PETS then
		for _, prop in global.__iter__(Props) do
			local LowerHpValue_PETS = global.SpecialPropGetter(_env, "LowerHp_DmgExtra_PETS_" .. prop)(_env, actor)

			if LowerHpValue_PETS and LowerHpValue_PETS ~= 0 then
				attacker[prop] = attacker[prop] + LowerHpValue_PETS

				break
			end
		end
	elseif global.PETS(_env, target) and HigherHpCheckRate_PETS < TargethpRatio then
		for _, prop in global.__iter__(Props) do
			local HigherHpValue_PETS = global.SpecialPropGetter(_env, "HigherHp_DmgExtra_PETS_" .. prop)(_env, actor)

			if HigherHpValue_PETS and HigherHpValue_PETS ~= 0 then
				attacker[prop] = attacker[prop] + HigherHpValue_PETS

				break
			end
		end
	end

	local LowerHpCheckRate_SUMMON = global.SpecialPropGetter(_env, "LowerHpCheckRate_SUMMON")(_env, actor)
	local HigherHpCheckRate_SUMMON = global.SpecialPropGetter(_env, "HigherHpCheckRate_SUMMON")(_env, actor)

	if global.SUMMONS(_env, target) and TargethpRatio < LowerHpCheckRate_SUMMON then
		for _, prop in global.__iter__(Props) do
			local LowerHpValue_SUMMON = global.SpecialPropGetter(_env, "LowerHp_DmgExtra_SUMMON_" .. prop)(_env, actor)

			if LowerHpValue_SUMMON and LowerHpValue_SUMMON ~= 0 then
				attacker[prop] = attacker[prop] + LowerHpValue_SUMMON

				break
			end
		end
	elseif global.SUMMONS(_env, target) and HigherHpCheckRate_SUMMON < TargethpRatio then
		for _, prop in global.__iter__(Props) do
			local HigherHpValue_SUMMON = global.SpecialPropGetter(_env, "HigherHp_DmgExtra_SUMMON_" .. prop)(_env, actor)

			if HigherHpValue_SUMMON and HigherHpValue_SUMMON ~= 0 then
				attacker[prop] = attacker[prop] + HigherHpValue_SUMMON

				break
			end
		end
	end

	for i = 1, #Flags do
		local flag = Flags[i]

		if global.MARKED(_env, flag)(_env, target) then
			for _, prop in global.__iter__(Props) do
				local FlagsValue = global.SpecialPropGetter(_env, FlagsPrename[i] .. prop)(_env, actor)

				if FlagsValue and FlagsValue ~= 0 then
					attacker[prop] = attacker[prop] + FlagsValue

					break
				end
			end
		end
	end

	for i = 1, #Flags do
		local flag = Flags[i]

		if global.MARKED(_env, flag)(_env, actor) then
			for _, prop in global.__iter__(Props2) do
				local FlagsValue = global.SpecialPropGetter(_env, FlagsPrename[i] .. prop)(_env, target)

				if FlagsValue and FlagsValue ~= 0 then
					defender[prop] = defender[prop] + FlagsValue

					break
				end
			end
		end
	end

	for m = 1, #Status do
		local status = Status[m]

		if global.INSTATUS(_env, status)(_env, target) then
			for _, prop in global.__iter__(Props) do
				local StatusValue = global.SpecialPropGetter(_env, StatusPrename[m] .. prop)(_env, actor)

				if StatusValue and StatusValue ~= 0 then
					attacker[prop] = attacker[prop] + StatusValue

					break
				end
			end
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "HGEr_Passive_No_Crit")) > 0 or global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "HGEr_Passive_Uni_No_Crit")) > 0 then
		attacker.critrate = 0
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15111_2")) > 0 then
		local singleweaken = 2 * global.SpecialPropGetter(_env, "singleweaken")(_env, actor)
		local singleunhurtratedown = 2 * global.SpecialPropGetter(_env, "singleunhurtratedown")(_env, actor)
		attacker.defweaken = attacker.defweaken + singleweaken
		defender.unhurtrate = defender.unhurtrate - singleunhurtratedown
	end

	local damage = global.EvalSingleDamage(_env, attacker, defender, dmgFactor)

	for i = 1, #Flags do
		local flag = Flags[i]

		if not global.MASTER(_env, actor) then
			if global.MARKED(_env, "SUMMONED")(_env, actor) then
				if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "DHB_Damage_Way")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Damage_Way_SUMMONER")) == 0 then
					damage.val = 0

					break
				end
			elseif global.MARKED(_env, flag)(_env, actor) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "DHB_Damage_Way")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Damage_Way_" .. flag)) == 0 then
				damage.val = 0

				break
			end
		end
	end

	if global.INSTATUS(_env, "Skill_MGNa_Passive_Key")(_env, actor) and global.PETS(_env, target) then
		local cost = global.GetCost(_env, target)

		if cost > 14 then
			damage.val = damage.val * 1.2
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15111_2_efc")) > 0 then
		global.DispelBuff(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15111_2_efc"), 99)
		global.DispelBuff(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15111_2_efc"), 99)
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Accesory_15110_1")) > 0 then
		local ShieldBreak = global.SpecialPropGetter(_env, "accesory_15110_1")(_env, actor)
		local Shield = global.UnitPropGetter(_env, "shield")(_env, target)
		damage.val = damage.val + ShieldBreak * Shield
	end

	return damage
end

function all.EvalAOEDamage_FlagCheck(_env, actor, target, dmgFactor, passiveFactors)
	local this = _env.this
	local global = _env.global
	local PassiveFlages = {
		"召唤物"
	}
	local PassiveFlagesPrename = {
		"Passive_Summoned_DmgExtra_"
	}
	local Flags = {
		"MASTER",
		"HERO",
		"SUMMONED",
		"ASSASSIN",
		"WARRIOR",
		"MAGE",
		"SUMMONER",
		"HEALER",
		"LIGHT",
		"DARK"
	}
	local FlagsPrename = {
		"Master_DmgExtra_",
		"Hero_DmgExtra_",
		"Summoned_DmgExtra_",
		"Assassin_DmgExtra_",
		"Warrior_DmgExtra_",
		"Mage_DmgExtra_",
		"Summoner_DmgExtra_",
		"Healer_DmgExtra_",
		"Light_DmgExtra_",
		"Dark_DmgExtra_"
	}
	local Status = {
		"DAZE",
		"MUTE",
		"FREEZE",
		"COLD",
		"BURNING",
		"POISON",
		"TAUNT",
		"SHIELD"
	}
	local StatusPrename = {
		"DAZE_DmgExtra_",
		"MUTE_DmgExtra_",
		"FREEZE_DmgExtra_",
		"COLD_DmgExtra_",
		"BURNING_DmgExtra_",
		"POISON_DmgExtra_",
		"PROVOKE_DmgExtra_",
		"SHIELD_DmgExtra_"
	}
	local Props = {
		"atkrate",
		"hurtrate",
		"defweaken",
		"critrate",
		"unhurtrate"
	}
	local Props2 = {
		"unhurtrate"
	}
	local Party = {
		"XiDe",
		"MoNvJiHui",
		"BuSiNiaoCaiTuan",
		"DongWenHui",
		"WeiNaSiXianJing",
		"ShiMengZhiShe"
	}
	local attacker = global.LoadUnit(_env, actor, "ALL")
	local defender = global.LoadUnit(_env, target, "ALL")
	local hurtedDefUpProb = global.SpecialPropGetter(_env, "hurtedDefUpProb")(_env, target)
	local hurtedDefUpRate = global.SpecialPropGetter(_env, "hurtedDefUpRate")(_env, target)

	if hurtedDefUpRate and hurtedDefUpRate ~= 0 and defender.defrate then
		local prob = global.EvalProb1(_env, attacker, defender, hurtedDefUpProb, 0)

		if global.ProbTest(_env, prob) then
			defender.defrate = defender.defrate + hurtedDefUpRate
		end
	end

	local hurtedUnHurtUpProb = global.SpecialPropGetter(_env, "hurtedUnHurtUpProb")(_env, target)
	local hurtedUnHurtUpRate = global.SpecialPropGetter(_env, "hurtedUnHurtUpRate")(_env, target)

	if hurtedUnHurtUpRate and hurtedUnHurtUpRate ~= 0 and defender.unhurtrate then
		local prob = global.EvalProb1(_env, attacker, defender, hurtedUnHurtUpProb, 0)

		if global.ProbTest(_env, prob) then
			defender.unhurtrate = defender.unhurtrate + hurtedUnHurtUpRate
		end
	end

	local dispelprob = global.SpecialPropGetter(_env, "dispelprob")(_env, actor)
	local prob = global.EvalProb1(_env, attacker, defender, dispelprob, 0)

	if global.ProbTest(_env, prob) then
		global.DispelBuff(_env, target, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE"), 1)

		local buffeft2 = global.NumericEffect(_env, "+defrate", {
			"+Normal",
			"+Normal"
		}, 0)

		global.ApplyBuff(_env, target, {
			timing = 2,
			duration = 1,
			display = "Dispel",
			tags = {
				"HEAL",
				"UNDISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buffeft2
		})
	end

	local TargethpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, target)
	local LowerHpCheckRate = global.SpecialPropGetter(_env, "LowerHpCheckRate")(_env, actor)
	local HigherHpCheckRate = global.SpecialPropGetter(_env, "HigherHpCheckRate")(_env, actor)

	if TargethpRatio < LowerHpCheckRate then
		for _, prop in global.__iter__(Props) do
			local LowerHpValue = global.SpecialPropGetter(_env, "LowerHp_DmgExtra_" .. prop)(_env, actor)

			if LowerHpValue and LowerHpValue ~= 0 then
				attacker[prop] = attacker[prop] + LowerHpValue

				break
			end
		end
	elseif HigherHpCheckRate < TargethpRatio then
		for _, prop in global.__iter__(Props) do
			local HigherHpValue = global.SpecialPropGetter(_env, "HigherHp_DmgExtra_" .. prop)(_env, actor)

			if HigherHpValue and HigherHpValue ~= 0 then
				attacker[prop] = attacker[prop] + HigherHpValue

				break
			end
		end
	end

	local LowerHpCheckRate_PETS = global.SpecialPropGetter(_env, "LowerHpCheckRate_PETS")(_env, actor)
	local HigherHpCheckRate_PETS = global.SpecialPropGetter(_env, "HigherHpCheckRate_PETS")(_env, actor)

	if global.PETS(_env, target) and TargethpRatio < LowerHpCheckRate_PETS then
		for _, prop in global.__iter__(Props) do
			local LowerHpValue_PETS = global.SpecialPropGetter(_env, "LowerHp_DmgExtra_PETS_" .. prop)(_env, actor)

			if LowerHpValue_PETS and LowerHpValue_PETS ~= 0 then
				attacker[prop] = attacker[prop] + LowerHpValue_PETS

				break
			end
		end
	elseif global.PETS(_env, target) and HigherHpCheckRate_PETS < TargethpRatio then
		for _, prop in global.__iter__(Props) do
			local HigherHpValue_PETS = global.SpecialPropGetter(_env, "HigherHp_DmgExtra_PETS_" .. prop)(_env, actor)

			if HigherHpValue_PETS and HigherHpValue_PETS ~= 0 then
				attacker[prop] = attacker[prop] + HigherHpValue_PETS

				break
			end
		end
	end

	local LowerHpCheckRate_SUMMON = global.SpecialPropGetter(_env, "LowerHpCheckRate_SUMMON")(_env, actor)
	local HigherHpCheckRate_SUMMON = global.SpecialPropGetter(_env, "HigherHpCheckRate_SUMMON")(_env, actor)

	if global.SUMMONS(_env, target) and TargethpRatio < LowerHpCheckRate_SUMMON then
		for _, prop in global.__iter__(Props) do
			local LowerHpValue_SUMMON = global.SpecialPropGetter(_env, "LowerHp_DmgExtra_SUMMON_" .. prop)(_env, actor)

			if LowerHpValue_SUMMON and LowerHpValue_SUMMON ~= 0 then
				attacker[prop] = attacker[prop] + LowerHpValue_SUMMON

				break
			end
		end
	elseif global.SUMMONS(_env, target) and HigherHpCheckRate_SUMMON < TargethpRatio then
		for _, prop in global.__iter__(Props) do
			local HigherHpValue_SUMMON = global.SpecialPropGetter(_env, "HigherHp_DmgExtra_SUMMON_" .. prop)(_env, actor)

			if HigherHpValue_SUMMON and HigherHpValue_SUMMON ~= 0 then
				attacker[prop] = attacker[prop] + HigherHpValue_SUMMON

				break
			end
		end
	end

	local extra_aoehurtrate = global.SpecialPropGetter(_env, "extra_aoehurtrate")(_env, actor)

	if extra_aoehurtrate then
		attacker.hurtrate = attacker.hurtrate + extra_aoehurtrate
	end

	for i = 1, #Flags do
		local flag = Flags[i]

		if global.MARKED(_env, flag)(_env, target) then
			for _, prop in global.__iter__(Props) do
				local FlagsValue = global.SpecialPropGetter(_env, FlagsPrename[i] .. prop)(_env, actor)

				if FlagsValue and FlagsValue ~= 0 then
					attacker[prop] = attacker[prop] + FlagsValue

					break
				end
			end
		end
	end

	for i = 1, #Flags do
		local flag = Flags[i]

		if global.MARKED(_env, flag)(_env, actor) then
			for _, prop in global.__iter__(Props2) do
				local FlagsValue = global.SpecialPropGetter(_env, FlagsPrename[i] .. prop)(_env, target)

				if FlagsValue and FlagsValue ~= 0 then
					defender[prop] = defender[prop] + FlagsValue

					break
				end
			end
		end
	end

	for m = 1, #Status do
		local status = Status[m]

		if global.INSTATUS(_env, status)(_env, target) then
			for _, prop in global.__iter__(Props) do
				local StatusValue = global.SpecialPropGetter(_env, StatusPrename[m] .. prop)(_env, actor)

				if StatusValue and StatusValue ~= 0 then
					attacker[prop] = attacker[prop] + StatusValue

					break
				end
			end
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "HGEr_Passive_No_Crit")) > 0 or global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "HGEr_Passive_Uni_No_Crit")) > 0 then
		attacker.critrate = 0
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15111_2")) > 0 then
		local singleweaken = global.SpecialPropGetter(_env, "singleweaken")(_env, actor)
		local singleunhurtratedown = global.SpecialPropGetter(_env, "singleunhurtratedown")(_env, actor)
		attacker.defweaken = attacker.defweaken + singleweaken
		defender.unhurtrate = defender.unhurtrate - singleunhurtratedown
	end

	local damage = global.EvalAOEDamage(_env, attacker, defender, dmgFactor)

	for i = 1, #Flags do
		local flag = Flags[i]

		if not global.MASTER(_env, actor) then
			if global.MARKED(_env, "SUMMONED")(_env, actor) then
				if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "DHB_Damage_Way")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Damage_Way_SUMMONER")) == 0 then
					damage.val = 0

					break
				end
			elseif global.MARKED(_env, flag)(_env, actor) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "DHB_Damage_Way")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Damage_Way_" .. flag)) == 0 then
				damage.val = 0

				break
			end
		end
	end

	if global.INSTATUS(_env, "Skill_MGNa_Passive_Key")(_env, actor) and global.PETS(_env, target) then
		local cost = global.GetCost(_env, target)

		if cost > 14 then
			damage.val = damage.val * 1.2
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15111_2_efc")) > 0 then
		global.DispelBuff(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15111_2_efc"), 99)
		global.DispelBuff(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Weapon_15111_2_efc"), 99)
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15120_2")) > 0 then
		local CureFactor = global.SpecialPropGetter(_env, "weapon_15120_2")(_env, actor)

		global.ApplyHPRecovery(_env, actor, damage.val * CureFactor)
	end

	return damage
end

function all.EvalRecovery_FlagCheck(_env, actor, target, healFactorRate, healFactorEx)
	local this = _env.this
	local global = _env.global
	local Flags = {
		"MASTER",
		"HERO",
		"SUMMONED",
		"ASSASSIN",
		"WARRIOR",
		"MAGE",
		"SUMMONER",
		"HEALER",
		"LIGHT",
		"DARK"
	}
	local FlagsPrename = {
		"Master_HealExtra_",
		"Hero_HealExtra_",
		"Summoned_HealExtra_",
		"Assassin_HealExtra_",
		"Warrior_HealExtra_",
		"Mage_HealExtra_",
		"Summoner_DmgExtra_",
		"Healer_HealExtra_",
		"Light_HealExtra_",
		"Dark_HealExtra_"
	}
	local Status = {
		"DAZE",
		"MUTE",
		"FREEZE",
		"COLD",
		"BURNING",
		"POISON",
		"TAUNT",
		"SHIELD"
	}
	local StatusPrename = {
		"DAZE_HealExtra_",
		"MUTE_HealExtra_",
		"FREEZE_HealExtra_",
		"COLD_HealExtra_",
		"BURNING_HealExtra_",
		"POISON_HealExtra_",
		"PROVOKE_HealExtra_",
		"SHIELD_HealExtra_"
	}
	local Props = {
		"atkrate",
		"critrate"
	}
	local Party = {
		"XiDe",
		"MoNvJiHui",
		"BuSiNiaoCaiTuan",
		"DongWenHui",
		"WeiNaSiXianJing",
		"ShiMengZhiShe"
	}
	local healer = global.LoadUnit(_env, actor, "ALL")
	local healee = global.LoadUnit(_env, target, "ALL")

	for i = 1, #Flags do
		local flag = Flags[i]

		if global.MARKED(_env, flag)(_env, actor) then
			for _, prop in global.__iter__(Props) do
				local FlagsValue = global.SpecialPropGetter(_env, FlagsPrename[i] .. prop)(_env, actor)

				if FlagsValue and FlagsValue ~= 0 then
					healer[prop] = healer[prop] + FlagsValue

					break
				end
			end
		end
	end

	for m = 1, #Status do
		local status = Status[m]

		if global.INSTATUS(_env, status)(_env, target) then
			for _, prop in global.__iter__(Props) do
				local StatusValue = global.SpecialPropGetter(_env, StatusPrename[m] .. prop)(_env, actor)

				if StatusValue and StatusValue ~= 0 then
					healer[prop] = healer[prop] + StatusValue

					break
				end
			end
		end
	end

	local heal = global.EvalRecovery(_env, healer, healee, {
		healFactorRate,
		healFactorEx
	})
	local LowerHp_HealExtra_RatioCheck = global.SpecialPropGetter(_env, "LowerHp_HealExtra_RatioCheck")(_env, actor)
	local LowerHp_HealExtra_ExtraRate = global.SpecialPropGetter(_env, "LowerHp_HealExtra_ExtraRate")(_env, actor)

	if LowerHp_HealExtra_RatioCheck and LowerHp_HealExtra_RatioCheck ~= 0 and healee.hpRatio < LowerHp_HealExtra_RatioCheck then
		heal = heal * (1 + LowerHp_HealExtra_ExtraRate)
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15117_2")) > 0 then
		local healeft = global.SpecialPropGetter(_env, "curerate_weapon_15117_2")(_env, actor)
		heal = heal * (1 + healeft)
	end

	return heal
end

function all.ApplyBuff_Buff(_env, actor, target, config, buffEffects, ratefactor, limitfactor)
	local this = _env.this
	local global = _env.global

	if global.ProbTest(_env, ratefactor) then
		local result = global.ApplyBuff(_env, target, config, buffEffects)

		if result then
			global.ActivateSpecificTrigger(_env, target, "BUFFED_BUFF")
			global.ActivateGlobalTrigger(_env, target, "UNIT_BUFFED_BUFF")
		end
	end
end

function all.ApplyBuff_Debuff(_env, actor, target, config, buffEffects, ratefactor, limitfactor)
	local this = _env.this
	local global = _env.global
	local attacker = global.LoadUnit(_env, actor, "ATTACKER")
	local defender = global.LoadUnit(_env, target, "DEFENDER")
	local result = global.ApplyBuff(_env, target, config, buffEffects)

	if result then
		global.ActivateSpecificTrigger(_env, target, "BUFFED_DEBUFF")

		local MainStage_BurningExtra_Check = global.SpecialPropGetter(_env, "MainStage_BurningExtra_Check")(_env, actor)

		if global.BUFF_MARKED_ALL(_env, "BURNING", "DISPELLABLE")(_env, result) and MainStage_BurningExtra_Check == 1 then
			local buffeft1 = global.HPPeriodDamage(_env, "Burning", attacker.atk * 0.3)

			global.ApplyBuff(_env, target, {
				timing = 1,
				display = "Burning",
				group = "Burning",
				duration = 2,
				limit = 99,
				tags = {
					"STATUS",
					"DEBUFF",
					"BURNING",
					"ABNORMAL",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local MainStage_PoisionExtra_Check = global.SpecialPropGetter(_env, "MainStage_PoisionExtra_Check")(_env, actor)

		if global.BUFF_MARKED_ALL(_env, "POISON", "DISPELLABLE")(_env, result) and MainStage_PoisionExtra_Check == 1 then
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
			local buffeft2 = global.HPPeriodDamage(_env, "Poison", maxHp * 0.05)

			global.ApplyBuff(_env, target, {
				timing = 1,
				display = "Poison",
				group = "Poison",
				duration = 2,
				limit = 10,
				tags = {
					"STATUS",
					"DEBUFF",
					"POISON",
					"ABNORMAL",
					"DISPELLABLE"
				}
			}, {
				buffeft2
			})
		end

		local MainStage_WeakExtra_Check = global.SpecialPropGetter(_env, "MainStage_WeakExtra_Check")(_env, actor)

		if global.BUFF_MARKED_ALL(_env, "WEAK", "DISPELLABLE")(_env, result) and MainStage_WeakExtra_Check == 1 then
			local buffeft3 = global.NumericEffect(_env, "-unhurtrate", {
				"+Normal",
				"+Normal"
			}, 0.2)

			global.ApplyBuff(_env, target, {
				timing = 1,
				duration = 2,
				display = "UnHurtRateDown",
				tags = {
					"STATUS",
					"DEBUFF",
					"UNHURTRATEDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft3
			})
		end

		return result
	end
end

function all.ApplyHPDamage_ResultCheck(_env, actor, target, damage, lowerLimit)
	local this = _env.this
	local global = _env.global

	global.DispelBuff(_env, actor, global.BUFF_MARKED(_env, "APPLYDAMAGEVALUE"), 99)

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "AJYHou_Passive")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "AJYHou_Passive_Done")) == 0 then
		local hp_ajyh = global.UnitPropGetter(_env, "hp")(_env, target)
		local shield_ajyh = global.UnitPropGetter(_env, "shield")(_env, target)

		if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "IMMUNE")) == 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "UNDEAD")) == 0 and damage.val > hp_ajyh + shield_ajyh then
			for _, unit in global.__iter__(global.RandomN(_env, 1, global.AllUnits(_env, global.TEAMMATES_OF(_env, target) * global.PETS - global.ONESELF(_env, target)))) do
				local buff_AJYHou = global.DeathImmuneEffect(_env, 1)

				global.ApplyBuff_Buff(_env, target, unit, {
					timing = 1,
					duration = 1,
					display = "Undead",
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"AJYHou_Passive_Undead",
						"DISPELLABLE",
						"UNSTEALABLE",
						"UNDEAD"
					}
				}, {
					buff_AJYHou
				}, 1, 0)
				global.ApplyHPDamage_ResultCheck(_env, actor, unit, damage)
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit)
				})

				damage.val = 0
				local buffeft_AJYHou = global.SpecialNumericEffect(_env, "+done", {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, target, {
					timing = 1,
					duration = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"AJYHou_Passive_Done",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft_AJYHou
				})
			end
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "SECTSKILL", "SectSkill_Master_XueZhan_3")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "xuezhan_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "xuezhan_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0

		if global.FriendMaster(_env) then
			local atk = global.UnitPropGetter(_env, "atk")(_env, global.FriendMaster(_env))
			ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor)
		end

		if not global.MASTER(_env, target) then
			damage.val = damage.val + ExDmg
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "DAGUNKILL", "YIYU")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "yiyu_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "yiyu_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0

		if global.FriendMaster(_env) then
			local atk = global.UnitPropGetter(_env, "atk")(_env, global.FriendMaster(_env))
			ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor)
		end

		if not global.MASTER(_env, target) then
			damage.val = damage.val + ExDmg
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "SP_KTSJKe_Passive_Key")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "sp_hexi_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "sp_hexi_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
		ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor)

		if not global.MASTER(_env, target) then
			damage.val = damage.val + ExDmg
		end
	end

	local unique_hurtrate = global.SpecialPropGetter(_env, "unique_hurtrate")(_env, actor)

	if unique_hurtrate and unique_hurtrate ~= 0 then
		damage.val = damage.val * (1 + unique_hurtrate)
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15005", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local DamageFactor = global.SpecialPropGetter(_env, "First_Unique_Accesory_15005")(_env, actor)
		local ExDamageFactor = global.SpecialPropGetter(_env, "First_Unique_Accesory_15005_Ex")(_env, actor)

		if global.PETS(_env, target) then
			damage.val = damage.val * (1 + ExDamageFactor)
		else
			damage.val = damage.val * (1 + DamageFactor)
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_15101_1", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local AtkRateFactor = global.SpecialPropGetter(_env, "Atk_EquipSkill_Boots_15101_1")(_env, actor)

		if global.MASTER(_env, target) and global.SpecialPropGetter(_env, "equipSkill_boots_15101_1")(_env, global.FriendField(_env)) < 3 then
			local cards = global.Slice(_env, global.SortBy(_env, global.CardsInWindow(_env, global.GetOwner(_env, actor)), "<", global.GetCardCost), 1, 1)
			local buff_hurt = global.SpecialNumericEffect(_env, "+equipSkill_boots_15101_1", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, AtkRateFactor)
			local cardvaluechange = global.CardCostEnchant(_env, "-", 2, 1)

			for _, card in global.__iter__(cards) do
				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"YINGLUO"
					}
				}, {
					buff_hurt
				})
				global.ApplyEnchant(_env, global.GetOwner(_env, actor), card, {
					timing = 0,
					duration = 99,
					tags = {
						"CARDBUFF",
						"YINGLUO",
						"UNDISPELLABLE"
					}
				}, {
					cardvaluechange
				})
				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, actor), card, {
					timing = 0,
					duration = 99,
					tags = {
						"CARDBUFF",
						"BUFF",
						"YINGLUO",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15101_1", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local HurtRateFactor = global.SpecialPropGetter(_env, "Hur_EquipSkill_Accesory_15101_1")(_env, actor)
		local DelRpValueFactor = global.SpecialPropGetter(_env, "Del_EquipSkill_Accesory_15101_1")(_env, actor)

		if global.MASTER(_env, target) then
			damage.val = damage.val * (1 + HurtRateFactor)

			global.ApplyRPDamage_ResultCheck(_env, actor, target, DelRpValueFactor)
		end
	end

	local hurt_Armor_15007 = global.SpecialPropGetter(_env, "hurt_Armor_15007")(_env, target)

	if hurt_Armor_15007 and hurt_Armor_15007 ~= 0 then
		global.ApplyEnergyDamage(_env, global.GetOwner(_env, actor), hurt_Armor_15007)
		global.DispelBuff(_env, target, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15007", "HURTED"), 99)

		local buff_count = global.SpecialNumericEffect(_env, "+count_Armor_15007", {
			"+Normal",
			"+Normal"
		}, 1)

		global.ApplyBuff(_env, global.EnemyField(_env), {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"UR_EQUIPMENT",
				"count_Armor_15007",
				"COUNT"
			}
		}, {
			buff_count
		})
	end

	local buffeft_damage = global.SpecialNumericEffect(_env, "+ApplyDamageValue", {
		"?Normal"
	}, damage.val)

	global.ApplyBuff(_env, actor, {
		timing = 0,
		duration = 99,
		tags = {
			"APPLYDAMAGEVALUE"
		}
	}, {
		buffeft_damage
	})

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) > 0 then
		damage.val = 0
	end

	if global.SelectBuffCount(_env, global.EnemyField(_env), global.BUFF_MARKED(_env, "LEIMu_Passive")) == 0 and global.MARKED(_env, "LEIMu")(_env, target) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "IMMUNE")) == 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "UNDEAD")) == 0 then
		local hp = global.UnitPropGetter(_env, "hp")(_env, target)
		local shield = global.UnitPropGetter(_env, "shield")(_env, target)

		if damage.val > hp + shield then
			damage.val = 0
			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, target, {
				timing = 0,
				duration = 99,
				tags = {
					"LEIMu_Passive_Done"
				}
			}, {
				buff
			})
		end
	end

	if global.SelectHeroPassiveCount(_env, target, "EquipSkill_Tops_15108_2") > 0 then
		local DamageFactor = global.SpecialPropGetter(_env, "EquipSkill_Armor_15108_2")(_env, target)

		if DamageFactor and DamageFactor ~= 0 then
			local summons_damage = damage.val * 0.3
			damage.val = damage.val * 0.7
			local summons_count = 0

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "EquipSkill_Armor_15108_2_check")))) do
				summons_count = summons_count + 1
			end

			summons_damage = summons_damage / summons_count

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "EquipSkill_Armor_15108_2_check")))) do
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit)
				})
				global.ApplyHPDamage(_env, unit, summons_damage)
			end
		end
	end

	local deers = global.FriendUnits(_env, global.SUMMONS * global.HASSTATUS(_env, "SummonedSNGLSi"))
	local deer_ratio = global.SpecialPropGetter(_env, "Skill_SNGLSi_Passive")(_env, global.FriendField(_env))

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) == 0 then
		damage = global.SNGLSi_Damage_Share(_env, deers, damage, deer_ratio)
	end

	local Skill_CKFSJi_Passive = global.SpecialPropGetter(_env, "Skill_CKFSJi_Passive")(_env, actor)

	if Skill_CKFSJi_Passive and Skill_CKFSJi_Passive ~= 0 then
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
		local HealRateFactor = Skill_CKFSJi_Passive
		local heal = global.EvalRecovery_FlagCheck(_env, actor, actor, HealRateFactor, 0)

		global.ApplyHPRecovery_ResultCheck(_env, actor, actor, heal)
	end

	local result = global.ApplyHPDamage(_env, target, damage, lowerLimit)

	global.ActivateSpecificTrigger(_env, target, "GET_ATTACKED")
	global.ActivateGlobalTrigger(_env, target, "UNIT_GET_ATTACKED")

	if result and result.deadly then
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, actor)
		local singlekillrecoveryrate = global.SpecialPropGetter(_env, "singlekillrecoveryrate")(_env, actor)

		if singlekillrecoveryrate and singlekillrecoveryrate ~= 0 then
			global.ApplyHPRecovery(_env, actor, maxHp * singlekillrecoveryrate)
		end

		local singlekillenergyrecoverrate = global.SpecialPropGetter(_env, "singlekillenergyrecoverrate")(_env, actor)
		local singlekillenergyrecoverfactor = global.SpecialPropGetter(_env, "singlekillenergyrecoverfactor")(_env, actor)

		if singlekillenergyrecoverrate and singlekillenergyrecoverrate ~= 0 and global.ProbTest(_env, singlekillenergyrecoverrate) then
			global.ApplyEnergyRecovery(_env, global.GetOwner(_env, actor), singlekillenergyrecoverfactor)
		end

		local singlekillragegainfactor = global.SpecialPropGetter(_env, "singlekillragegainfactor")(_env, actor)

		if singlekillragegainfactor and singlekillragegainfactor ~= 0 then
			global.ApplyRPRecovery(_env, actor, singlekillragegainfactor)
		end

		if global.PETS - global.SUMMONS(_env, target) then
			local killatkrate_PETS = global.SpecialPropGetter(_env, "killatkrate_PETS")(_env, actor)

			if killatkrate_PETS and killatkrate_PETS ~= 0 then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, killatkrate_PETS)

				for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS - global.SUMMONS)) do
					global.ApplyBuff(_env, unit, {
						timing = 2,
						display = "AtkRateUp",
						group = "Skill_MKLJLuo_Passive_Key",
						duration = 8,
						limit = 10,
						tags = {
							"NUMERIC",
							"BUFF",
							"AtkUp",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end
		end

		local killcritrate_self = global.SpecialPropGetter(_env, "killcritrate_self")(_env, actor)

		if killcritrate_self and killcritrate_self ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, killcritrate_self)

			global.ApplyBuff(_env, actor, {
				timing = 2,
				display = "CritRateUp",
				group = "EquipSkill_Accesory_BoDuoZhe",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			})
		end
	else
		local hurtrecoveryratio = global.SpecialPropGetter(_env, "hurtrecoveryratio")(_env, target)

		if hurtrecoveryratio and hurtrecoveryratio ~= 0 then
			local hurtrecoveryrate = global.SpecialPropGetter(_env, "hurtrecoveryrate")(_env, target)

			if global.ProbTest(_env, hurtrecoveryrate) then
				local TargetmaxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)

				global.ApplyHPRecovery(_env, target, TargetmaxHp * hurtrecoveryratio)
			end
		end

		local afteratk_debecuredrate = global.SpecialPropGetter(_env, "afteratk_debecuredrate")(_env, actor)

		if afteratk_debecuredrate and afteratk_debecuredrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "-becuredrate", {
				"+Normal",
				"+Normal"
			}, afteratk_debecuredrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "CureRateDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"CURERATEDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_despeedrate = global.SpecialPropGetter(_env, "afteratk_despeedrate")(_env, actor)

		if afteratk_despeedrate and afteratk_despeedrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "/speed", {
				"+Normal",
				"+Normal"
			}, afteratk_despeedrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "SpeedDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"SPEEDDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_muterate = global.SpecialPropGetter(_env, "afteratk_muterate")(_env, actor)

		if afteratk_muterate and afteratk_muterate ~= 0 and global.ProbTest(_env, afteratk_muterate) then
			local buffeft1 = global.Mute(_env)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 1,
				display = "Mute",
				tags = {
					"STATUS",
					"DEBUFF",
					"MUTE",
					"ABNORMAL",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_deatkrate = global.SpecialPropGetter(_env, "afteratk_deatkrate")(_env, actor)

		if afteratk_deatkrate and afteratk_deatkrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "-atkrate", {
				"+Normal",
				"+Normal"
			}, afteratk_deatkrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "AtkDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"ATKDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15110_1_UnHurtCheck")) > 0 then
			local UnHurtRateFactor = global.SpecialPropGetter(_env, "weapon_15110_1")(_env, actor)
			local UnHurtRateDown = global.NumericEffect(_env, "-unhurtrate", {
				"?Normal"
			}, UnHurtRateFactor)

			global.ApplyBuff(_env, target, {
				timing = 1,
				display = "UnHurtRateDown",
				group = "EquipSkill_Weapon_15110_1_UnHurt_Limit",
				duration = 3,
				limit = 5,
				tags = {
					"NUMERIC",
					"DEBUFF",
					"UNHURTRATEDOWN",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Weapon_15110_1_UnHurt"
				}
			}, {
				UnHurtRateDown
			})
		end
	end

	local extrapetshealrate = global.SpecialPropGetter(_env, "extrapetshealrate")(_env, actor)

	if extrapetshealrate and extrapetshealrate ~= 0 then
		local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

		for _, unit in global.__iter__(units) do
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

			global.ApplyHPRecovery(_env, unit, maxHp * extrapetshealrate)

			local buffeft2 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, unit, {
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
	end

	local singlesplitrate = global.SpecialPropGetter(_env, "singlesplitrate")(_env, actor)

	if singlesplitrate and singlesplitrate ~= 0 then
		for _, unit in global.__iter__(global.EnemyUnits(_env, global.NEIGHBORS_OF(_env, target))) do
			global.ApplyHPDamage(_env, unit, damage * singlesplitrate)
		end
	end

	if result and result.crit then
		local singlecritsplitrate = global.SpecialPropGetter(_env, "singlecritsplitrate")(_env, actor)

		if singlecritsplitrate and singlecritsplitrate ~= 0 then
			local splitval = damage.val

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.NEIGHBORS_OF(_env, target))) do
				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) == 0 then
					global.ApplyHPDamage(_env, unit, splitval * singlecritsplitrate)
				end
			end
		end

		if global.MARKED(_env, "QTQCi")(_env, actor) then
			local RpFactor = global.SpecialPropGetter(_env, "Skill_QTQCi_Passive_RP")(_env, actor)

			if RpFactor and RpFactor ~= 0 then
				global.ApplyRPRecovery(_env, actor, RpFactor)
			end
		end
	end

	if damage and damage.block then
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local blockrecoveryrate = global.SpecialPropGetter(_env, "blockrecoveryrate")(_env, target)

		if blockrecoveryrate and blockrecoveryrate ~= 0 then
			global.ApplyHPRecovery(_env, target, maxHp * blockrecoveryrate)
		end

		if global.MARKED(_env, "FGao")(_env, target) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Skill_FGao_Unique")) > 0 then
			local buff = global.SpecialNumericEffect(_env, "+daze_prepare", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, actor, {
				duration = 99,
				group = "FGao_Daze_Prepare",
				timing = 0,
				limit = 1,
				tags = {
					"FGao_Daze_Prepare",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
		end

		if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_15109_3")) > 0 then
			local buffeft1 = global.SpecialNumericEffect(_env, "+Armor_15109_3_Count", {
				"?Normal"
			}, 1)
			local RpFactor = global.SpecialPropGetter(_env, "Armor_15109_3")(_env, target)

			if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "Armor_15109_3_Count")) < 3 then
				global.ApplyRPRecovery(_env, target, RpFactor)
				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"Armor_15109_3_Count",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end

		if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boot_15109_3")) > 0 then
			local buffeft1 = global.SpecialNumericEffect(_env, "+Boot_15109_3_Count", {
				"?Normal"
			}, 1)
			local HealRateFactor = global.SpecialPropGetter(_env, "Boot_15109_3")(_env, target)
			local recovery = HealRateFactor * global.UnitPropGetter(_env, "maxHp")(_env, target)

			if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "Boot_15109_3_Count")) < 3 and global.UnitPropGetter(_env, "hpRatio")(_env, target) < 0.7 then
				global.ApplyHPRecovery(_env, target, recovery)
				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"Boot_15109_3_Count",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "RECORD_DMAGE")) > 0 then
		local buff_damage_count = global.SpecialNumericEffect(_env, "+damage_count", {
			"+Normal",
			"+Normal"
		}, damage.val)
		local buff_damage_from = global.SpecialNumericEffect(_env, "+damage_from", {
			"+Normal",
			"+Normal"
		}, 1)

		global.ApplyBuff(_env, target, {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"DAMAGECOUNT0408"
			}
		}, {
			buff_damage_count
		})
		global.ApplyBuff(_env, actor, {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"DAMAGEFROM0408"
			}
		}, {
			buff_damage_count
		})
	end

	return result
end

function all.ApplyAOEHPDamage_ResultCheck(_env, actor, target, damage, lowerLimit)
	local this = _env.this
	local global = _env.global

	global.DispelBuff(_env, actor, global.BUFF_MARKED(_env, "APPLYDAMAGEVALUE"), 99)

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "AJYHou_Passive")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "AJYHou_Passive_Done")) == 0 then
		local hp_ajyh = global.UnitPropGetter(_env, "hp")(_env, target)
		local shield_ajyh = global.UnitPropGetter(_env, "shield")(_env, target)

		if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "IMMUNE")) == 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "UNDEAD")) == 0 and damage.val > hp_ajyh + shield_ajyh then
			for _, unit in global.__iter__(global.RandomN(_env, 1, global.AllUnits(_env, global.TEAMMATES_OF(_env, target) * global.PETS - global.ONESELF(_env, target)))) do
				local buff_AJYHou = global.DeathImmuneEffect(_env, 1)

				global.ApplyBuff_Buff(_env, target, unit, {
					timing = 1,
					duration = 1,
					display = "Undead",
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"AJYHou_Passive_Undead",
						"DISPELLABLE",
						"UNSTEALABLE",
						"UNDEAD"
					}
				}, {
					buff_AJYHou
				}, 1, 0)
				global.ApplyAOEHPDamage_ResultCheck(_env, actor, unit, damage)
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit)
				})

				damage.val = 0
				local buffeft_AJYHou = global.SpecialNumericEffect(_env, "+done", {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, target, {
					timing = 1,
					duration = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"AJYHou_Passive_Done",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft_AJYHou
				})
			end
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "SECTSKILL", "SectSkill_Master_XueZhan_3")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "xuezhan_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "xuezhan_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0

		if global.FriendMaster(_env) then
			local atk = global.UnitPropGetter(_env, "atk")(_env, global.FriendMaster(_env))
			ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor)
		end

		if not global.MASTER(_env, target) then
			damage.val = damage.val + ExDmg
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "DAGUNKILL", "YIYU")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "yiyu_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "yiyu_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0

		if global.FriendMaster(_env) then
			local atk = global.UnitPropGetter(_env, "atk")(_env, global.FriendMaster(_env))
			ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor)
		end

		if not global.MASTER(_env, target) then
			damage.val = damage.val + ExDmg
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "SP_KTSJKe_Passive_Key")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "sp_hexi_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "sp_hexi_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
		ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor)

		if not global.MASTER(_env, target) then
			damage.val = damage.val + ExDmg
		end
	end

	local unique_hurtrate = global.SpecialPropGetter(_env, "unique_hurtrate")(_env, actor)

	if unique_hurtrate and unique_hurtrate ~= 0 then
		damage.val = damage.val * (1 + unique_hurtrate)
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15005", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local DamageFactor = global.SpecialPropGetter(_env, "First_Unique_Accesory_15005")(_env, actor)
		local ExDamageFactor = global.SpecialPropGetter(_env, "First_Unique_Accesory_15005_Ex")(_env, actor)

		if global.PETS(_env, target) then
			damage.val = damage.val * (1 + ExDamageFactor)
		else
			damage.val = damage.val * (1 + DamageFactor)
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_15101_1", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local AtkRateFactor = global.SpecialPropGetter(_env, "Atk_EquipSkill_Boots_15101_1")(_env, actor)

		if global.MASTER(_env, target) and global.SpecialPropGetter(_env, "equipSkill_boots_15101_1")(_env, global.FriendField(_env)) < 3 then
			local cards = global.Slice(_env, global.SortBy(_env, global.CardsInWindow(_env, global.GetOwner(_env, actor)), "<", global.GetCardCost), 1, 1)
			local buff_hurt = global.SpecialNumericEffect(_env, "+equipSkill_boots_15101_1", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, AtkRateFactor)
			local cardvaluechange = global.CardCostEnchant(_env, "-", 2, 1)

			for _, card in global.__iter__(cards) do
				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"YINGLUO"
					}
				}, {
					buff_hurt
				})
				global.ApplyEnchant(_env, global.GetOwner(_env, actor), card, {
					timing = 0,
					duration = 99,
					tags = {
						"CARDBUFF",
						"YINGLUO",
						"UNDISPELLABLE"
					}
				}, {
					cardvaluechange
				})
				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, actor), card, {
					timing = 0,
					duration = 99,
					tags = {
						"CARDBUFF",
						"BUFF",
						"YINGLUO",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15101_1", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local HurtRateFactor = global.SpecialPropGetter(_env, "Hur_EquipSkill_Accesory_15101_1")(_env, actor)
		local DelRpValueFactor = global.SpecialPropGetter(_env, "Del_EquipSkill_Accesory_15101_1")(_env, actor)

		if global.MASTER(_env, target) then
			damage.val = damage.val * (1 + HurtRateFactor)

			global.ApplyRPDamage_ResultCheck(_env, actor, target, DelRpValueFactor)
		end
	end

	local hurt_Armor_15007 = global.SpecialPropGetter(_env, "hurt_Armor_15007")(_env, target)

	if hurt_Armor_15007 and hurt_Armor_15007 ~= 0 then
		global.ApplyEnergyDamage(_env, global.GetOwner(_env, actor), hurt_Armor_15007)
		global.DispelBuff(_env, target, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15007", "HURTED"), 99)

		local buff_count = global.SpecialNumericEffect(_env, "+count_Armor_15007", {
			"+Normal",
			"+Normal"
		}, 1)

		global.ApplyBuff(_env, global.EnemyField(_env), {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"UR_EQUIPMENT",
				"count_Armor_15007",
				"COUNT"
			}
		}, {
			buff_count
		})
	end

	local buffeft_damage = global.SpecialNumericEffect(_env, "+ApplyDamageValue", {
		"?Normal"
	}, damage.val)

	global.ApplyBuff(_env, actor, {
		timing = 0,
		duration = 99,
		tags = {
			"APPLYDAMAGEVALUE"
		}
	}, {
		buffeft_damage
	})

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) > 0 then
		damage.val = 0
	end

	if global.SelectBuffCount(_env, global.EnemyField(_env), global.BUFF_MARKED(_env, "LEIMu_Passive")) == 0 and global.MARKED(_env, "LEIMu")(_env, target) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "IMMUNE")) == 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "UNDEAD")) == 0 then
		local hp = global.UnitPropGetter(_env, "hp")(_env, target)
		local shield = global.UnitPropGetter(_env, "shield")(_env, target)

		if damage.val > hp + shield then
			damage.val = 0
			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, target, {
				timing = 0,
				duration = 99,
				tags = {
					"LEIMu_Passive_Done"
				}
			}, {
				buff
			})
		end
	end

	if global.SelectHeroPassiveCount(_env, target, "EquipSkill_Tops_15108_2") > 0 then
		local DamageFactor = global.SpecialPropGetter(_env, "EquipSkill_Armor_15108_2")(_env, target)

		if DamageFactor and DamageFactor ~= 0 then
			local summons_damage = damage.val * 0.3
			damage.val = damage.val * 0.7
			local summons_count = 0

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "EquipSkill_Armor_15108_2_check")))) do
				summons_count = summons_count + 1
			end

			summons_damage = summons_damage / summons_count

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "EquipSkill_Armor_15108_2_check")))) do
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit)
				})
				global.ApplyHPDamage(_env, unit, summons_damage)
			end
		end
	end

	local deers = global.FriendUnits(_env, global.SUMMONS * global.HASSTATUS(_env, "SummonedSNGLSi"))
	local deer_ratio = global.SpecialPropGetter(_env, "Skill_SNGLSi_Passive")(_env, global.FriendField(_env))

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) == 0 then
		damage = global.SNGLSi_Damage_Share(_env, deers, damage, deer_ratio)
	end

	local result = global.ApplyHPDamage(_env, target, damage, lowerLimit)

	global.ActivateSpecificTrigger(_env, target, "GET_ATTACKED")
	global.ActivateGlobalTrigger(_env, target, "UNIT_GET_ATTACKED")

	if result and result.deadly then
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, actor)
		local aoekillrecoveryrate = global.SpecialPropGetter(_env, "aoekillrecoveryrate")(_env, actor)

		if aoekillrecoveryrate and aoekillrecoveryrate ~= 0 then
			global.ApplyHPRecovery(_env, actor, maxHp * aoekillrecoveryrate)
		end

		local aoekillenergyrecoverrate = global.SpecialPropGetter(_env, "aoekillenergyrecoverrate")(_env, actor)
		local aoekillenergyrecoverfactor = global.SpecialPropGetter(_env, "aoekillenergyrecoverfactor")(_env, actor)

		if global.ProbTest(_env, aoekillenergyrecoverrate) and aoekillenergyrecoverfactor then
			global.ApplyEnergyRecovery(_env, global.GetOwner(_env, actor), aoekillenergyrecoverfactor)
		end

		local aoekillragegainfactor = global.SpecialPropGetter(_env, "aoekillragegainfactor")(_env, actor)

		if aoekillragegainfactor and aoekillragegainfactor ~= 0 then
			global.ApplyRPRecovery(_env, actor, aoekillragegainfactor)
		end

		if global.PETS - global.SUMMONS(_env, target) then
			local killatkrate_PETS = global.SpecialPropGetter(_env, "killatkrate_PETS")(_env, actor)

			if killatkrate_PETS and killatkrate_PETS ~= 0 then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, killatkrate_PETS)

				for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS - global.SUMMONS)) do
					global.ApplyBuff(_env, unit, {
						timing = 2,
						display = "AtkRateUp",
						group = "Skill_MKLJLuo_Passive_Key",
						duration = 8,
						limit = 10,
						tags = {
							"NUMERIC",
							"BUFF",
							"AtkUp",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end
		end

		local killcritrate_self = global.SpecialPropGetter(_env, "killcritrate_self")(_env, actor)

		if killcritrate_self and killcritrate_self ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, killcritrate_self)

			global.ApplyBuff(_env, actor, {
				timing = 2,
				display = "CritRateUp",
				group = "EquipSkill_Accesory_BoDuoZhe",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			})
		end
	else
		local hurtrecoveryratio = global.SpecialPropGetter(_env, "hurtrecoveryratio")(_env, target)

		if hurtrecoveryratio and hurtrecoveryratio ~= 0 then
			local hurtrecoveryrate = global.SpecialPropGetter(_env, "hurtrecoveryrate")(_env, target)

			if global.ProbTest(_env, hurtrecoveryrate) then
				local TargetmaxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)

				global.ApplyHPRecovery(_env, target, TargetmaxHp * hurtrecoveryratio)
			end
		end

		local afteratk_debecuredrate = global.SpecialPropGetter(_env, "afteratk_debecuredrate")(_env, actor)

		if afteratk_debecuredrate and afteratk_debecuredrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "-becuredrate", {
				"+Normal",
				"+Normal"
			}, afteratk_debecuredrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "CureRateDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"CURERATEDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_despeedrate = global.SpecialPropGetter(_env, "afteratk_despeedrate")(_env, actor)

		if afteratk_despeedrate and afteratk_despeedrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "/speed", {
				"+Normal",
				"+Normal"
			}, afteratk_despeedrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "SpeedDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"SPEEDDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_muterate = global.SpecialPropGetter(_env, "afteratk_muterate")(_env, actor)

		if afteratk_muterate and afteratk_muterate ~= 0 and global.ProbTest(_env, afteratk_muterate) then
			local buffeft1 = global.Mute(_env)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 1,
				display = "Mute",
				tags = {
					"STATUS",
					"DEBUFF",
					"MUTE",
					"ABNORMAL",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_dazerate = global.SpecialPropGetter(_env, "afteratk_dazerate")(_env, actor)

		if afteratk_dazerate and afteratk_dazerate ~= 0 and global.ProbTest(_env, afteratk_dazerate) then
			local buffeft1 = global.Daze(_env)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 1,
				display = "Daze",
				tags = {
					"STATUS",
					"DEBUFF",
					"DAZE",
					"ABNORMAL",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_deatkrate = global.SpecialPropGetter(_env, "afteratk_deatkrate")(_env, actor)

		if afteratk_deatkrate and afteratk_deatkrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "-atkrate", {
				"+Normal",
				"+Normal"
			}, afteratk_deatkrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "AtkDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"ATKDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15110_1_UnHurtCheck")) > 0 then
			local UnHurtRateFactor = global.SpecialPropGetter(_env, "weapon_15110_1")(_env, actor)
			local UnHurtRateDown = global.NumericEffect(_env, "-unhurtrate", {
				"?Normal"
			}, UnHurtRateFactor)

			global.ApplyBuff(_env, target, {
				timing = 1,
				display = "UnHurtRateDown",
				group = "EquipSkill_Weapon_15110_1_UnHurt_Limit",
				duration = 3,
				limit = 5,
				tags = {
					"NUMERIC",
					"DEBUFF",
					"UNHURTRATEDOWN",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Weapon_15110_1_UnHurt"
				}
			}, {
				UnHurtRateDown
			})
		end
	end

	local extrapetshealrate = global.SpecialPropGetter(_env, "extrapetshealrate")(_env, actor)

	if extrapetshealrate and extrapetshealrate ~= 0 then
		local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

		for _, unit in global.__iter__(units) do
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

			global.ApplyHPRecovery(_env, unit, maxHp * extrapetshealrate)
		end
	end

	if damage and damage.crit then
		local aoecritsplitrate = global.SpecialPropGetter(_env, "aoecritsplitrate")(_env, actor)

		if aoecritsplitrate and aoecritsplitrate ~= 0 then
			local splitval = damage.val

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.NEIGHBORS_OF(_env, target))) do
				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) == 0 then
					global.ApplyHPDamage(_env, unit, splitval * aoecritsplitrate)
				end
			end
		end

		if global.MARKED(_env, "QTQCi")(_env, actor) then
			local RpFactor = global.SpecialPropGetter(_env, "Skill_QTQCi_Passive_RP")(_env, actor)

			if RpFactor and RpFactor ~= 0 then
				global.ApplyRPRecovery(_env, actor, RpFactor)
			end
		end
	end

	if damage and damage.block then
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local blockrecoveryrate = global.SpecialPropGetter(_env, "blockrecoveryrate")(_env, target)

		if blockrecoveryrate and blockrecoveryrate ~= 0 then
			global.ApplyHPRecovery(_env, target, maxHp * blockrecoveryrate)
		end

		if global.MARKED(_env, "FGao")(_env, target) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Skill_FGao_Unique")) > 0 then
			local buff = global.SpecialNumericEffect(_env, "+daze_prepare", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, actor, {
				duration = 99,
				group = "FGao_Daze_Prepare",
				timing = 0,
				limit = 1,
				tags = {
					"FGao_Daze_Prepare",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
		end

		if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_15109_3")) > 0 then
			local buffeft1 = global.SpecialNumericEffect(_env, "+Armor_15109_3_Count", {
				"?Normal"
			}, 1)
			local RpFactor = global.SpecialPropGetter(_env, "Armor_15109_3")(_env, target)

			if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "Armor_15109_3_Count")) < 3 then
				global.ApplyRPRecovery(_env, target, RpFactor)
				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"Armor_15109_3_Count",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end

		if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boot_15109_3")) > 0 then
			local buffeft1 = global.SpecialNumericEffect(_env, "+Boot_15109_3_Count", {
				"?Normal"
			}, 1)
			local HealRateFactor = global.SpecialPropGetter(_env, "Boot_15109_3")(_env, target)
			local recovery = HealRateFactor * global.UnitPropGetter(_env, "maxHp")(_env, target)

			if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "Boot_15109_3_Count")) < 3 and global.UnitPropGetter(_env, "hpRatio")(_env, target) < 0.7 then
				global.ApplyHPRecovery(_env, target, recovery)
				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"Boot_15109_3_Count",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "RECORD_DMAGE")) > 0 then
		local buff_damage_count = global.SpecialNumericEffect(_env, "+damage_count", {
			"+Normal",
			"+Normal"
		}, damage.val)
		local buff_damage_from = global.SpecialNumericEffect(_env, "+damage_from", {
			"+Normal",
			"+Normal"
		}, 0)

		global.ApplyBuff(_env, target, {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"DAMAGECOUNT0408"
			}
		}, {
			buff_damage_count
		})
		global.ApplyBuff(_env, actor, {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"DAMAGEFROM0408"
			}
		}, {
			buff_damage_count
		})
	end

	return result
end

function all.ApplyHPDamageN(_env, n, total, target, damages, actor, lowerLimit)
	local this = _env.this
	local global = _env.global

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "AJYHou_Passive")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "AJYHou_Passive_Done")) == 0 then
		local flag_ajyhou = 0
		local hp_ajyh = global.UnitPropGetter(_env, "hp")(_env, target)
		local shield_ajyh = global.UnitPropGetter(_env, "shield")(_env, target)

		if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "IMMUNE")) == 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "UNDEAD")) == 0 and damages[n].val > hp_ajyh + shield_ajyh then
			local count_AJYHou_Passive_Undead = 0
			local unit_has_this_undead = nil

			for _, unit in global.__iter__(global.AllUnits(_env, global.TEAMMATES_OF(_env, target) * global.PETS - global.ONESELF(_env, target))) do
				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "AJYHou_Passive_Undead")) > 0 then
					unit_has_this_undead = unit
					count_AJYHou_Passive_Undead = count_AJYHou_Passive_Undead + 1
				end
			end

			local buff_AJYHou = global.DeathImmuneEffect(_env, 1)

			if count_AJYHou_Passive_Undead == 0 then
				for _, unit in global.__iter__(global.RandomN(_env, 1, global.AllUnits(_env, global.TEAMMATES_OF(_env, target) * global.PETS - global.ONESELF(_env, target)))) do
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "AJYHou_Passive_Undead")) == 0 then
						global.ApplyBuff_Buff(_env, target, unit, {
							timing = 1,
							duration = 1,
							display = "Undead",
							tags = {
								"STATUS",
								"NUMERIC",
								"BUFF",
								"AJYHou_Passive_Undead",
								"DISPELLABLE",
								"UNSTEALABLE",
								"UNDEAD"
							}
						}, {
							buff_AJYHou
						}, 1, 0)
					end

					global.ApplyHPDamage_ResultCheck(_env, actor, unit, damages[n])
					global.AddAnim(_env, {
						loop = 1,
						anim = "cisha_zhanshupai",
						zOrder = "TopLayer",
						pos = global.UnitPos(_env, unit)
					})

					damages[n].val = 0
					flag_ajyhou = 1
				end
			else
				if global.SelectBuffCount(_env, unit_has_this_undead, global.BUFF_MARKED(_env, "AJYHou_Passive_Undead")) == 0 then
					global.ApplyBuff_Buff(_env, target, unit_has_this_undead, {
						timing = 1,
						duration = 1,
						display = "Undead",
						tags = {
							"STATUS",
							"NUMERIC",
							"BUFF",
							"AJYHou_Passive_Undead",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"UNDEAD"
						}
					}, {
						buff_AJYHou
					}, 1, 0)
				end

				global.ApplyHPDamage_ResultCheck(_env, actor, unit_has_this_undead, damages[n])
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit_has_this_undead)
				})

				damages[n].val = 0
				flag_ajyhou = 1
			end

			if n == total and flag_ajyhou == 1 then
				local buffeft_AJYHou = global.SpecialNumericEffect(_env, "+done", {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, target, {
					timing = 1,
					duration = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"AJYHou_Passive_Done",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft_AJYHou
				})
			end
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "SECTSKILL", "SectSkill_Master_XueZhan_3")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "xuezhan_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "xuezhan_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0

		if global.FriendMaster(_env) then
			local atk = global.UnitPropGetter(_env, "atk")(_env, global.FriendMaster(_env))
			ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor) / total
		end

		if not global.MASTER(_env, target) then
			damages[n].val = damages[n].val + ExDmg
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "DAGUNKILL", "YIYU")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "yiyu_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "yiyu_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0

		if global.FriendMaster(_env) then
			local atk = global.UnitPropGetter(_env, "atk")(_env, global.FriendMaster(_env))
			ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor) / total
		end

		if not global.MASTER(_env, target) then
			damages[n].val = damages[n].val + ExDmg
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "SP_KTSJKe_Passive_Key")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "sp_hexi_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "sp_hexi_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
		ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor) / total

		if not global.MASTER(_env, target) then
			damages[n].val = damages[n].val + ExDmg
		end
	end

	local unique_hurtrate = global.SpecialPropGetter(_env, "unique_hurtrate")(_env, actor)

	if unique_hurtrate and unique_hurtrate ~= 0 then
		damages[n].val = damages[n].val * (1 + unique_hurtrate)
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15005", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local DamageFactor = global.SpecialPropGetter(_env, "First_Unique_Accesory_15005")(_env, actor)
		local ExDamageFactor = global.SpecialPropGetter(_env, "First_Unique_Accesory_15005_Ex")(_env, actor)

		if global.PETS(_env, target) then
			damages[n].val = damages[n].val * (1 + ExDamageFactor)
		else
			damages[n].val = damages[n].val * (1 + DamageFactor)
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_15101_1", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local AtkRateFactor = global.SpecialPropGetter(_env, "Atk_EquipSkill_Boots_15101_1")(_env, actor)

		if global.MASTER(_env, target) and n == total and global.SpecialPropGetter(_env, "equipSkill_boots_15101_1")(_env, global.FriendField(_env)) < 3 then
			local cards = global.Slice(_env, global.SortBy(_env, global.CardsInWindow(_env, global.GetOwner(_env, actor)), "<", global.GetCardCost), 1, 1)
			local buff_hurt = global.SpecialNumericEffect(_env, "+equipSkill_boots_15101_1", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, AtkRateFactor)
			local cardvaluechange = global.CardCostEnchant(_env, "-", 2, 1)

			for _, card in global.__iter__(cards) do
				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"YINGLUO"
					}
				}, {
					buff_hurt
				})
				global.ApplyEnchant(_env, global.GetOwner(_env, actor), card, {
					timing = 0,
					duration = 99,
					tags = {
						"CARDBUFF",
						"YINGLUO",
						"UNDISPELLABLE"
					}
				}, {
					cardvaluechange
				})
				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, actor), card, {
					timing = 0,
					duration = 99,
					tags = {
						"CARDBUFF",
						"BUFF",
						"YINGLUO",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end
	end

	if n == total and global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15101_1", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local HurtRateFactor = global.SpecialPropGetter(_env, "Hur_EquipSkill_Accesory_15101_1")(_env, actor)
		local DelRpValueFactor = global.SpecialPropGetter(_env, "Del_EquipSkill_Accesory_15101_1")(_env, actor)

		if global.MASTER(_env, target) then
			damages[n].val = damages[n].val * (1 + HurtRateFactor)

			global.ApplyRPDamage_ResultCheck(_env, actor, target, DelRpValueFactor)
		end
	end

	local hurt_Armor_15007 = global.SpecialPropGetter(_env, "hurt_Armor_15007")(_env, target)

	if hurt_Armor_15007 and hurt_Armor_15007 ~= 0 and n == total then
		global.ApplyEnergyDamage(_env, global.GetOwner(_env, actor), hurt_Armor_15007)
		global.DispelBuff(_env, target, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15007", "HURTED"), 99)

		local buff_count = global.SpecialNumericEffect(_env, "+count_Armor_15007", {
			"+Normal",
			"+Normal"
		}, 1)

		global.ApplyBuff(_env, global.EnemyField(_env), {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"UR_EQUIPMENT",
				"count_Armor_15007",
				"COUNT"
			}
		}, {
			buff_count
		})
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) > 0 then
		damages[n].val = 0
	end

	if global.SelectBuffCount(_env, global.EnemyField(_env), global.BUFF_MARKED(_env, "LEIMu_Passive")) == 0 and global.MARKED(_env, "LEIMu")(_env, target) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "IMMUNE")) == 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "UNDEAD")) == 0 then
		local hp = global.UnitPropGetter(_env, "hp")(_env, target)
		local shield = global.UnitPropGetter(_env, "shield")(_env, target)

		if damages[n].val > hp + shield then
			damages[n].val = 0
			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, target, {
				timing = 0,
				duration = 99,
				tags = {
					"LEIMu_Passive_Done"
				}
			}, {
				buff
			})
		end
	end

	if global.SelectHeroPassiveCount(_env, target, "EquipSkill_Tops_15108_2") > 0 then
		local DamageFactor = global.SpecialPropGetter(_env, "EquipSkill_Armor_15108_2")(_env, target)

		if DamageFactor and DamageFactor ~= 0 then
			local summons_damage = damages[n].val * 0.3
			damages[n].val = damages[n].val * 0.7
			local summons_count = 0

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "EquipSkill_Armor_15108_2_check")))) do
				summons_count = summons_count + 1
			end

			summons_damage = summons_damage / summons_count

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "EquipSkill_Armor_15108_2_check")))) do
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit)
				})
				global.ApplyHPDamage(_env, unit, summons_damage)
			end
		end
	end

	local deers = global.FriendUnits(_env, global.SUMMONS * global.HASSTATUS(_env, "SummonedSNGLSi"))
	local deer_ratio = global.SpecialPropGetter(_env, "Skill_SNGLSi_Passive")(_env, global.FriendField(_env))

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) == 0 then
		damages[n] = global.SNGLSi_Damage_Share(_env, deers, damages[n], deer_ratio)
	end

	if n == total then
		local Skill_CKFSJi_Passive = global.SpecialPropGetter(_env, "Skill_CKFSJi_Passive")(_env, actor)

		if Skill_CKFSJi_Passive and Skill_CKFSJi_Passive ~= 0 then
			local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
			local HealRateFactor = Skill_CKFSJi_Passive
			local heal = global.EvalRecovery_FlagCheck(_env, actor, actor, HealRateFactor, 0)

			global.ApplyHPRecovery_ResultCheck(_env, actor, actor, heal)
		end
	end

	local result = global.ApplyHPDamage(_env, target, damages[n], lowerLimit, n ~= total)

	global.ActivateSpecificTrigger(_env, target, "GET_ATTACKED")
	global.ActivateGlobalTrigger(_env, target, "UNIT_GET_ATTACKED")

	if result and result.deadly then
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, actor)
		local singlekillrecoveryrate = global.SpecialPropGetter(_env, "singlekillrecoveryrate")(_env, actor)

		if singlekillrecoveryrate and singlekillrecoveryrate ~= 0 then
			global.ApplyHPRecovery(_env, actor, maxHp * singlekillrecoveryrate)
		end

		local singlekillenergyrecoverrate = global.SpecialPropGetter(_env, "singlekillenergyrecoverrate")(_env, actor)
		local singlekillenergyrecoverfactor = global.SpecialPropGetter(_env, "singlekillenergyrecoverfactor")(_env, actor)

		if global.ProbTest(_env, singlekillenergyrecoverrate) then
			global.ApplyEnergyRecovery(_env, global.GetOwner(_env, actor), singlekillenergyrecoverfactor)
		end

		local singlekillragegainfactor = global.SpecialPropGetter(_env, "singlekillragegainfactor")(_env, actor)

		if singlekillragegainfactor and singlekillragegainfactor ~= 0 then
			global.ApplyRPRecovery(_env, actor, singlekillragegainfactor)
		end

		if global.PETS - global.SUMMONS(_env, target) then
			local killatkrate_PETS = global.SpecialPropGetter(_env, "killatkrate_PETS")(_env, actor)

			if killatkrate_PETS and killatkrate_PETS ~= 0 then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, killatkrate_PETS)

				for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS - global.SUMMONS)) do
					global.ApplyBuff(_env, unit, {
						timing = 2,
						display = "AtkRateUp",
						group = "Skill_MKLJLuo_Passive_Key",
						duration = 8,
						limit = 10,
						tags = {
							"NUMERIC",
							"BUFF",
							"AtkUp",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end
		end

		local killcritrate_self = global.SpecialPropGetter(_env, "killcritrate_self")(_env, actor)

		if killcritrate_self and killcritrate_self ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, killcritrate_self)

			global.ApplyBuff(_env, actor, {
				timing = 2,
				display = "CritRateUp",
				group = "EquipSkill_Accesory_BoDuoZhe",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			})
		end

		local SkillRateFactor = global.SpecialPropGetter(_env, "Skill_HYe_Passive_SkillRateFactor")(_env, actor)

		if SkillRateFactor and SkillRateFactor ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, SkillRateFactor)

			global.ApplyBuff(_env, actor, {
				duration = 3,
				group = "Skill_HYe_Passive_SkillRateFactor",
				timing = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SKILLRATEUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			})
		end
	end

	local singlesplitrate = global.SpecialPropGetter(_env, "singlesplitrate")(_env, actor)

	if singlesplitrate and singlesplitrate ~= 0 then
		for _, unit in global.__iter__(global.EnemyUnits(_env, global.NEIGHBORS_OF(_env, target))) do
			global.ApplyHPDamage(_env, unit, damages[n] * singlesplitrate)
		end
	end

	if result and result.crit then
		local singlecritsplitrate = global.SpecialPropGetter(_env, "singlecritsplitrate")(_env, actor)

		if singlecritsplitrate and singlecritsplitrate ~= 0 then
			local splitval = damages[n].val

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.NEIGHBORS_OF(_env, target))) do
				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) == 0 then
					global.ApplyHPDamage(_env, unit, splitval * singlecritsplitrate)
				end
			end
		end

		if global.MARKED(_env, "QTQCi")(_env, actor) then
			local RpFactor = global.SpecialPropGetter(_env, "Skill_QTQCi_Passive_RP")(_env, actor)

			if RpFactor and RpFactor ~= 0 and n == total then
				global.ApplyRPRecovery(_env, actor, RpFactor)
			end
		end
	end

	if n == total then
		local extrapetshealrate = global.SpecialPropGetter(_env, "extrapetshealrate")(_env, actor)

		if extrapetshealrate and extrapetshealrate ~= 0 then
			local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			for _, unit in global.__iter__(units) do
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

				global.ApplyHPRecovery(_env, unit, maxHp * extrapetshealrate)
			end
		end

		local hurtrecoveryratio = global.SpecialPropGetter(_env, "hurtrecoveryratio")(_env, target)

		if hurtrecoveryratio and hurtrecoveryratio ~= 0 then
			local hurtrecoveryrate = global.SpecialPropGetter(_env, "hurtrecoveryrate")(_env, target)

			if global.ProbTest(_env, hurtrecoveryrate) then
				local TargetmaxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)

				global.ApplyHPRecovery(_env, target, TargetmaxHp * hurtrecoveryratio)
			end
		end

		local afteratk_debecuredrate = global.SpecialPropGetter(_env, "afteratk_debecuredrate")(_env, actor)

		if afteratk_debecuredrate and afteratk_debecuredrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "-becuredrate", {
				"+Normal",
				"+Normal"
			}, afteratk_debecuredrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "CureRateDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"CURERATEDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_despeedrate = global.SpecialPropGetter(_env, "afteratk_despeedrate")(_env, actor)

		if afteratk_despeedrate and afteratk_despeedrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "/speed", {
				"+Normal",
				"+Normal"
			}, afteratk_despeedrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "SpeedDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"SPEEDDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_muterate = global.SpecialPropGetter(_env, "afteratk_muterate")(_env, actor)

		if afteratk_muterate and afteratk_muterate ~= 0 and global.ProbTest(_env, afteratk_muterate) then
			local buffeft1 = global.Mute(_env)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 1,
				display = "Mute",
				tags = {
					"STATUS",
					"DEBUFF",
					"MUTE",
					"ABNORMAL",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_deatkrate = global.SpecialPropGetter(_env, "afteratk_deatkrate")(_env, actor)

		if afteratk_deatkrate and afteratk_deatkrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "-atkrate", {
				"+Normal",
				"+Normal"
			}, afteratk_deatkrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "AtkDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"ATKDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15110_1_UnHurtCheck")) > 0 then
			local UnHurtRateFactor = global.SpecialPropGetter(_env, "weapon_15110_1")(_env, actor)
			local UnHurtRateDown = global.NumericEffect(_env, "-unhurtrate", {
				"?Normal"
			}, UnHurtRateFactor)

			global.ApplyBuff(_env, target, {
				timing = 1,
				display = "UnHurtRateDown",
				group = "EquipSkill_Weapon_15110_1_UnHurt_Limit",
				duration = 3,
				limit = 5,
				tags = {
					"NUMERIC",
					"DEBUFF",
					"UNHURTRATEDOWN",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Weapon_15110_1_UnHurt"
				}
			}, {
				UnHurtRateDown
			})
		end

		if damages[n] and damages[n].block then
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
			local blockrecoveryrate = global.SpecialPropGetter(_env, "blockrecoveryrate")(_env, target)

			if blockrecoveryrate and blockrecoveryrate ~= 0 then
				global.ApplyHPRecovery(_env, target, maxHp * blockrecoveryrate)
			end

			if global.MARKED(_env, "FGao")(_env, target) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Skill_FGao_Unique")) > 0 then
				local buff = global.SpecialNumericEffect(_env, "+daze_prepare", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, actor, {
					duration = 99,
					group = "FGao_Daze_Prepare",
					timing = 0,
					limit = 1,
					tags = {
						"FGao_Daze_Prepare",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end

			if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_15109_3")) > 0 then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Armor_15109_3_Count", {
					"?Normal"
				}, 1)
				local RpFactor = global.SpecialPropGetter(_env, "Armor_15109_3")(_env, target)

				if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "Armor_15109_3_Count")) < 3 then
					global.ApplyRPRecovery(_env, target, RpFactor)
					global.ApplyBuff(_env, global.FriendField(_env), {
						timing = 0,
						duration = 99,
						tags = {
							"Armor_15109_3_Count",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end

			if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boot_15109_3")) > 0 then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Boot_15109_3_Count", {
					"?Normal"
				}, 1)
				local HealRateFactor = global.SpecialPropGetter(_env, "Boot_15109_3")(_env, target)
				local recovery = HealRateFactor * global.UnitPropGetter(_env, "maxHp")(_env, target)

				if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "Boot_15109_3_Count")) < 3 and global.UnitPropGetter(_env, "hpRatio")(_env, target) < 0.7 then
					global.ApplyHPRecovery(_env, target, recovery)
					global.ApplyBuff(_env, global.FriendField(_env), {
						timing = 0,
						duration = 99,
						tags = {
							"Boot_15109_3_Count",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end
		end
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "RECORD_DMAGE")) > 0 then
		local buff_damage_count = global.SpecialNumericEffect(_env, "+damage_count", {
			"+Normal",
			"+Normal"
		}, damages[n].val)
		local buff_damage_from = global.SpecialNumericEffect(_env, "+damage_from", {
			"+Normal",
			"+Normal"
		}, 0)

		global.ApplyBuff(_env, target, {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"DAMAGECOUNT0408"
			}
		}, {
			buff_damage_count
		})
		global.ApplyBuff(_env, actor, {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"DAMAGEFROM0408"
			}
		}, {
			buff_damage_count
		})
	end

	return result
end

function all.ApplyHPMultiDamage_ResultCheck(_env, actor, target, delays, damages, lowerLimit)
	local this = _env.this
	local global = _env.global

	return global.MultiDelayCall(_env, delays, global.ApplyHPDamageN, target, damages, actor, lowerLimit)
end

function all.ApplyAOEHPDamageN(_env, n, total, target, damages, actor, lowerLimit)
	local this = _env.this
	local global = _env.global

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "AJYHou_Passive")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "AJYHou_Passive_Done")) == 0 then
		local flag_ajyhou = 0
		local hp_ajyh = global.UnitPropGetter(_env, "hp")(_env, target)
		local shield_ajyh = global.UnitPropGetter(_env, "shield")(_env, target)

		if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "IMMUNE")) == 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "UNDEAD")) == 0 and damages[n].val > hp_ajyh + shield_ajyh then
			local count_AJYHou_Passive_Undead = 0
			local unit_has_this_undead = nil

			for _, unit in global.__iter__(global.AllUnits(_env, global.TEAMMATES_OF(_env, target) * global.PETS - global.ONESELF(_env, target))) do
				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "AJYHou_Passive_Undead")) > 0 then
					unit_has_this_undead = unit
					count_AJYHou_Passive_Undead = count_AJYHou_Passive_Undead + 1
				end
			end

			local buff_AJYHou = global.DeathImmuneEffect(_env, 1)

			if count_AJYHou_Passive_Undead == 0 then
				for _, unit in global.__iter__(global.RandomN(_env, 1, global.AllUnits(_env, global.TEAMMATES_OF(_env, target) * global.PETS - global.ONESELF(_env, target)))) do
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "AJYHou_Passive_Undead")) == 0 then
						global.ApplyBuff_Buff(_env, target, unit, {
							timing = 1,
							duration = 1,
							display = "Undead",
							tags = {
								"STATUS",
								"NUMERIC",
								"BUFF",
								"AJYHou_Passive_Undead",
								"DISPELLABLE",
								"UNSTEALABLE",
								"UNDEAD"
							}
						}, {
							buff_AJYHou
						}, 1, 0)
					end

					global.ApplyAOEHPDamage_ResultCheck(_env, actor, unit, damages[n])
					global.AddAnim(_env, {
						loop = 1,
						anim = "cisha_zhanshupai",
						zOrder = "TopLayer",
						pos = global.UnitPos(_env, unit)
					})

					damages[n].val = 0
					flag_ajyhou = 1
				end
			else
				if global.SelectBuffCount(_env, unit_has_this_undead, global.BUFF_MARKED(_env, "AJYHou_Passive_Undead")) == 0 then
					global.ApplyBuff_Buff(_env, target, unit_has_this_undead, {
						timing = 1,
						duration = 1,
						display = "Undead",
						tags = {
							"STATUS",
							"NUMERIC",
							"BUFF",
							"AJYHou_Passive_Undead",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"UNDEAD"
						}
					}, {
						buff_AJYHou
					}, 1, 0)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, actor, unit_has_this_undead, damages[n])
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit_has_this_undead)
				})

				damages[n].val = 0
				flag_ajyhou = 1
			end

			if n == total and flag_ajyhou == 1 then
				local buffeft_AJYHou = global.SpecialNumericEffect(_env, "+done", {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, target, {
					timing = 1,
					duration = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"AJYHou_Passive_Done",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft_AJYHou
				})
			end
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "SECTSKILL", "SectSkill_Master_XueZhan_3")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "xuezhan_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "xuezhan_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0

		if global.FriendMaster(_env) then
			local atk = global.UnitPropGetter(_env, "atk")(_env, global.FriendMaster(_env))
			ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor) / total
		end

		if not global.MASTER(_env, target) then
			damages[n].val = damages[n].val + ExDmg
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "DAGUNKILL", "YIYU")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "yiyu_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "yiyu_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0

		if global.FriendMaster(_env) then
			local atk = global.UnitPropGetter(_env, "atk")(_env, global.FriendMaster(_env))
			ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor) / total
		end

		if not global.MASTER(_env, target) then
			damages[n].val = damages[n].val + ExDmg
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "SP_KTSJKe_Passive_Key")) > 0 then
		local MaxHpRateFactor = global.SpecialPropGetter(_env, "sp_hexi_special_maxhp")(_env, actor)
		local AtkFactor = global.SpecialPropGetter(_env, "sp_hexi_special_atk")(_env, actor)
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
		local ExDmg = 0
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
		ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor) / total

		if not global.MASTER(_env, target) then
			damages[n].val = damages[n].val + ExDmg
		end
	end

	local unique_hurtrate = global.SpecialPropGetter(_env, "unique_hurtrate")(_env, actor)

	if unique_hurtrate and unique_hurtrate ~= 0 then
		damages[n].val = damages[n].val * (1 + unique_hurtrate)
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15005", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local DamageFactor = global.SpecialPropGetter(_env, "First_Unique_Accesory_15005")(_env, actor)
		local ExDamageFactor = global.SpecialPropGetter(_env, "First_Unique_Accesory_15005_Ex")(_env, actor)

		if global.PETS(_env, target) then
			damages[n].val = damages[n].val * (1 + ExDamageFactor)
		else
			damages[n].val = damages[n].val * (1 + DamageFactor)
		end
	end

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boots_15101_1", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local AtkRateFactor = global.SpecialPropGetter(_env, "Atk_EquipSkill_Boots_15101_1")(_env, actor)

		if global.MASTER(_env, target) and n == total and global.SpecialPropGetter(_env, "equipSkill_boots_15101_1")(_env, global.FriendField(_env)) < 3 then
			local cards = global.Slice(_env, global.SortBy(_env, global.CardsInWindow(_env, global.GetOwner(_env, actor)), "<", global.GetCardCost), 1, 1)
			local buff_hurt = global.SpecialNumericEffect(_env, "+equipSkill_boots_15101_1", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, AtkRateFactor)
			local cardvaluechange = global.CardCostEnchant(_env, "-", 2, 1)

			for _, card in global.__iter__(cards) do
				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UR_EQUIPMENT",
						"YINGLUO"
					}
				}, {
					buff_hurt
				})
				global.ApplyEnchant(_env, global.GetOwner(_env, actor), card, {
					timing = 0,
					duration = 99,
					tags = {
						"CARDBUFF",
						"YINGLUO",
						"UNDISPELLABLE"
					}
				}, {
					cardvaluechange
				})
				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, actor), card, {
					timing = 0,
					duration = 99,
					tags = {
						"CARDBUFF",
						"BUFF",
						"YINGLUO",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end
	end

	if n == total and global.SelectBuffCount(_env, actor, global.BUFF_MARKED_ALL(_env, "EquipSkill_Accesory_15101_1", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
		local HurtRateFactor = global.SpecialPropGetter(_env, "Hur_EquipSkill_Accesory_15101_1")(_env, actor)
		local DelRpValueFactor = global.SpecialPropGetter(_env, "Del_EquipSkill_Accesory_15101_1")(_env, actor)

		if global.MASTER(_env, target) then
			damages[n].val = damages[n].val * (1 + HurtRateFactor)

			global.ApplyRPDamage_ResultCheck(_env, actor, target, DelRpValueFactor)
		end
	end

	local hurt_Armor_15007 = global.SpecialPropGetter(_env, "hurt_Armor_15007")(_env, target)

	if hurt_Armor_15007 and hurt_Armor_15007 ~= 0 and n == total then
		global.ApplyEnergyDamage(_env, global.GetOwner(_env, actor), hurt_Armor_15007)
		global.DispelBuff(_env, target, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "UR_EQUIPMENT", "EquipSkill_Armor_15007", "HURTED"), 99)

		local buff_count = global.SpecialNumericEffect(_env, "+count_Armor_15007", {
			"+Normal",
			"+Normal"
		}, 1)

		global.ApplyBuff(_env, global.EnemyField(_env), {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"UR_EQUIPMENT",
				"count_Armor_15007",
				"COUNT"
			}
		}, {
			buff_count
		})
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) > 0 then
		damages[n].val = 0
	end

	if global.SelectBuffCount(_env, global.EnemyField(_env), global.BUFF_MARKED(_env, "LEIMu_Passive")) == 0 and global.MARKED(_env, "LEIMu")(_env, target) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "IMMUNE")) == 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "UNDEAD")) == 0 then
		local hp = global.UnitPropGetter(_env, "hp")(_env, target)
		local shield = global.UnitPropGetter(_env, "shield")(_env, target)

		if damages[n].val > hp + shield then
			damages[n].val = 0
			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, target, {
				timing = 0,
				duration = 99,
				tags = {
					"LEIMu_Passive_Done"
				}
			}, {
				buff
			})
		end
	end

	if global.SelectHeroPassiveCount(_env, target, "EquipSkill_Tops_15108_2") > 0 then
		local DamageFactor = global.SpecialPropGetter(_env, "EquipSkill_Armor_15108_2")(_env, target)

		if DamageFactor and DamageFactor ~= 0 then
			local summons_damage = damages[n].val * 0.3
			damages[n].val = damages[n].val * 0.7
			local summons_count = 0

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "EquipSkill_Armor_15108_2_check")))) do
				summons_count = summons_count + 1
			end

			summons_damage = summons_damage / summons_count

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "EquipSkill_Armor_15108_2_check")))) do
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit)
				})
				global.ApplyHPDamage(_env, unit, summons_damage)
			end
		end
	end

	local deers = global.FriendUnits(_env, global.SUMMONS * global.HASSTATUS(_env, "SummonedSNGLSi"))
	local deer_ratio = global.SpecialPropGetter(_env, "Skill_SNGLSi_Passive")(_env, global.FriendField(_env))

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) == 0 then
		damages[n] = global.SNGLSi_Damage_Share(_env, deers, damages[n], deer_ratio)
	end

	local result = global.ApplyHPDamage(_env, target, damages[n], lowerLimit, n ~= total)

	global.ActivateSpecificTrigger(_env, target, "GET_ATTACKED")
	global.ActivateGlobalTrigger(_env, target, "UNIT_GET_ATTACKED")

	if result and result.deadly then
		local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, actor)
		local aoekillrecoveryrate = global.SpecialPropGetter(_env, "aoekillrecoveryrate")(_env, actor)

		if aoekillrecoveryrate and aoekillrecoveryrate ~= 0 then
			global.ApplyHPRecovery(_env, actor, maxHp * aoekillrecoveryrate)
		end

		local aoekillenergyrecoverrate = global.SpecialPropGetter(_env, "aoekillenergyrecoverrate")(_env, actor)
		local aoekillenergyrecoverfactor = global.SpecialPropGetter(_env, "aoekillenergyrecoverfactor")(_env, actor)

		if aoekillenergyrecoverfactor and global.ProbTest(_env, aoekillenergyrecoverrate) then
			global.ApplyEnergyRecovery(_env, global.GetOwner(_env, actor), aoekillenergyrecoverfactor)
		end

		local aoekillragegainfactor = global.SpecialPropGetter(_env, "aoekillragegainfactor")(_env, actor)

		if aoekillragegainfactor and aoekillragegainfactor ~= 0 then
			global.ApplyRPRecovery(_env, actor, aoekillragegainfactor)
		end

		if global.PETS - global.SUMMONS(_env, target) then
			local killatkrate_PETS = global.SpecialPropGetter(_env, "killatkrate_PETS")(_env, actor)

			if killatkrate_PETS and killatkrate_PETS ~= 0 then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, killatkrate_PETS)

				for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS - global.SUMMONS)) do
					global.ApplyBuff(_env, unit, {
						timing = 2,
						display = "AtkRateUp",
						group = "Skill_MKLJLuo_Passive_Key",
						duration = 8,
						limit = 10,
						tags = {
							"NUMERIC",
							"BUFF",
							"AtkUp",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end
		end

		local killcritrate_self = global.SpecialPropGetter(_env, "killcritrate_self")(_env, actor)

		if killcritrate_self and killcritrate_self ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, killcritrate_self)

			global.ApplyBuff(_env, actor, {
				timing = 2,
				display = "CritRateUp",
				group = "EquipSkill_Accesory_BoDuoZhe",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			})
		end

		local SkillRateFactor = global.SpecialPropGetter(_env, "Skill_HYe_Passive_SkillRateFactor")(_env, actor)

		if SkillRateFactor and SkillRateFactor ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, SkillRateFactor)

			global.ApplyBuff(_env, actor, {
				duration = 3,
				group = "Skill_HYe_Passive_SkillRateFactor",
				timing = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SKILLRATEUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			})
		end
	end

	if damages[n] and damages[n].crit then
		local aoecritsplitrate = global.SpecialPropGetter(_env, "aoecritsplitrate")(_env, actor)

		if aoecritsplitrate and aoecritsplitrate ~= 0 then
			local splitval = damages[n].val

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.NEIGHBORS_OF(_env, target))) do
				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) == 0 then
					global.ApplyHPDamage(_env, unit, splitval * aoecritsplitrate)
				end
			end
		end

		if global.MARKED(_env, "QTQCi")(_env, actor) then
			local RpFactor = global.SpecialPropGetter(_env, "Skill_QTQCi_Passive_RP")(_env, actor)

			if RpFactor and RpFactor ~= 0 and n == total then
				global.ApplyRPRecovery(_env, actor, RpFactor)
			end
		end
	end

	if n == total then
		local extrapetshealrate = global.SpecialPropGetter(_env, "extrapetshealrate")(_env, actor)

		if extrapetshealrate and extrapetshealrate ~= 0 then
			local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			for _, unit in global.__iter__(units) do
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

				global.ApplyHPRecovery(_env, unit, maxHp * extrapetshealrate)
			end
		end

		local hurtrecoveryratio = global.SpecialPropGetter(_env, "hurtrecoveryratio")(_env, target)

		if hurtrecoveryratio and hurtrecoveryratio ~= 0 then
			local hurtrecoveryrate = global.SpecialPropGetter(_env, "hurtrecoveryrate")(_env, target)

			if global.ProbTest(_env, hurtrecoveryrate) then
				local TargetmaxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)

				global.ApplyHPRecovery(_env, target, TargetmaxHp * hurtrecoveryratio)
			end
		end

		local afteratk_debecuredrate = global.SpecialPropGetter(_env, "afteratk_debecuredrate")(_env, actor)

		if afteratk_debecuredrate and afteratk_debecuredrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "-becuredrate", {
				"+Normal",
				"+Normal"
			}, afteratk_debecuredrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "CureRateDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"CURERATEDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_despeedrate = global.SpecialPropGetter(_env, "afteratk_despeedrate")(_env, actor)

		if afteratk_despeedrate and afteratk_despeedrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "/speed", {
				"+Normal",
				"+Normal"
			}, afteratk_despeedrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "SpeedDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"SPEEDDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_muterate = global.SpecialPropGetter(_env, "afteratk_muterate")(_env, actor)

		if afteratk_muterate and afteratk_muterate ~= 0 and global.ProbTest(_env, afteratk_muterate) then
			local buffeft1 = global.Mute(_env)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 1,
				display = "Mute",
				tags = {
					"STATUS",
					"DEBUFF",
					"MUTE",
					"ABNORMAL",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_dazerate = global.SpecialPropGetter(_env, "afteratk_dazerate")(_env, actor)

		if afteratk_dazerate and afteratk_dazerate ~= 0 and global.ProbTest(_env, afteratk_dazerate) then
			local buffeft1 = global.Daze(_env)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 1,
				display = "Daze",
				tags = {
					"STATUS",
					"DEBUFF",
					"DAZE",
					"ABNORMAL",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		local afteratk_deatkrate = global.SpecialPropGetter(_env, "afteratk_deatkrate")(_env, actor)

		if afteratk_deatkrate and afteratk_deatkrate ~= 0 then
			local buffeft1 = global.NumericEffect(_env, "-atkrate", {
				"+Normal",
				"+Normal"
			}, afteratk_deatkrate)

			global.ApplyBuff(_env, target, {
				timing = 2,
				duration = 2,
				display = "AtkDown",
				tags = {
					"NUMERIC",
					"DEBUFF",
					"ATKDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end

		if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "EquipSkill_Weapon_15110_1_UnHurtCheck")) > 0 then
			local UnHurtRateFactor = global.SpecialPropGetter(_env, "weapon_15110_1")(_env, actor)
			local UnHurtRateDown = global.NumericEffect(_env, "-unhurtrate", {
				"?Normal"
			}, UnHurtRateFactor)

			global.ApplyBuff(_env, target, {
				timing = 1,
				display = "UnHurtRateDown",
				group = "EquipSkill_Weapon_15110_1_UnHurt_Limit",
				duration = 3,
				limit = 5,
				tags = {
					"NUMERIC",
					"DEBUFF",
					"UNHURTRATEDOWN",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"UR_EQUIPMENT",
					"EquipSkill_Weapon_15110_1_UnHurt"
				}
			}, {
				UnHurtRateDown
			})
		end

		if damages[n] and damages[n].block then
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, target)
			local blockrecoveryrate = global.SpecialPropGetter(_env, "blockrecoveryrate")(_env, target)

			if blockrecoveryrate and blockrecoveryrate ~= 0 then
				global.ApplyHPRecovery(_env, target, maxHp * blockrecoveryrate)
			end

			if global.MARKED(_env, "FGao")(_env, target) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Skill_FGao_Unique")) > 0 then
				local buff = global.SpecialNumericEffect(_env, "+daze_prepare", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, actor, {
					duration = 99,
					group = "FGao_Daze_Prepare",
					timing = 0,
					limit = 1,
					tags = {
						"FGao_Daze_Prepare",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end

			if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Armor_15109_3")) > 0 then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Armor_15109_3_Count", {
					"?Normal"
				}, 1)
				local RpFactor = global.SpecialPropGetter(_env, "Armor_15109_3")(_env, target)

				if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "Armor_15109_3_Count")) < 3 then
					global.ApplyRPRecovery(_env, target, RpFactor)
					global.ApplyBuff(_env, global.FriendField(_env), {
						timing = 0,
						duration = 99,
						tags = {
							"Armor_15109_3_Count",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end

			if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "EquipSkill_Boot_15109_3")) > 0 then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Boot_15109_3_Count", {
					"?Normal"
				}, 1)
				local HealRateFactor = global.SpecialPropGetter(_env, "Boot_15109_3")(_env, target)
				local recovery = HealRateFactor * global.UnitPropGetter(_env, "maxHp")(_env, target)

				if global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED_ALL(_env, "Boot_15109_3_Count")) < 3 and global.UnitPropGetter(_env, "hpRatio")(_env, target) < 0.7 then
					global.ApplyHPRecovery(_env, target, recovery)
					global.ApplyBuff(_env, global.FriendField(_env), {
						timing = 0,
						duration = 99,
						tags = {
							"Boot_15109_3_Count",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end
		end
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED_ALL(_env, "RECORD_DMAGE")) > 0 then
		local buff_damage_count = global.SpecialNumericEffect(_env, "+damage_count", {
			"+Normal",
			"+Normal"
		}, damages[n].val)
		local buff_damage_from = global.SpecialNumericEffect(_env, "+damage_from", {
			"+Normal",
			"+Normal"
		}, 0)

		global.ApplyBuff(_env, target, {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"DAMAGECOUNT0408"
			}
		}, {
			buff_damage_count
		})
		global.ApplyBuff(_env, actor, {
			timing = 0,
			duration = 99,
			tags = {
				"NUMERIC",
				"BUFF",
				"UNDISPELLABLE",
				"UNSTEALABLE",
				"DAMAGEFROM0408"
			}
		}, {
			buff_damage_count
		})
	end

	return result
end

function all.ApplyAOEHPMultiDamage_ResultCheck(_env, actor, target, delays, damages, lowerLimit)
	local this = _env.this
	local global = _env.global

	return global.MultiDelayCall(_env, delays, global.ApplyAOEHPDamageN, target, damages, actor, lowerLimit)
end

function all.ApplyHPRecovery_ResultCheck(_env, actor, target, heal, switch)
	local this = _env.this
	local global = _env.global
	local extrapetshealrate = global.SpecialPropGetter(_env, "extrapetshealrate")(_env, actor)

	if extrapetshealrate and extrapetshealrate ~= 0 then
		local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

		for _, unit in global.__iter__(units) do
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

			global.ApplyHPRecovery(_env, unit, maxHp * extrapetshealrate)
		end
	end

	local extrapetshealrate_OnHeal = global.SpecialPropGetter(_env, "extrapetshealrate_OnHeal")(_env, actor)

	if extrapetshealrate_OnHeal and extrapetshealrate_OnHeal ~= 0 then
		local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

		for _, unit in global.__iter__(units) do
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

			global.ApplyHPRecovery(_env, unit, maxHp * extrapetshealrate_OnHeal)

			local buffeft2 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, unit, {
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
	end

	local extramasterdefrate_OnHeal = global.SpecialPropGetter(_env, "extramasterdefrate_OnHeal")(_env, actor)

	if extramasterdefrate_OnHeal and extramasterdefrate_OnHeal ~= 0 then
		local master = global.FriendMaster(_env)

		if master then
			local buffeft1 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, extramasterdefrate_OnHeal)

			global.ApplyBuff(_env, master, {
				timing = 2,
				duration = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"DEFUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			})
		end
	end

	local CuredoubleFactor = global.SpecialPropGetter(_env, "CuredoubleFactor")(_env, actor)

	if CuredoubleFactor and CuredoubleFactor ~= 0 then
		heal = 2 * heal
	end

	local revive_one = global.SpecialPropGetter(_env, "revive_one")(_env, actor)

	if revive_one and revive_one ~= 0 then
		local reviveunit = global.ProbTest(_env, 0.2) and global.Revive_Check(_env, actor, 1, 0, {
			2,
			5,
			1,
			3,
			4,
			6,
			7,
			8,
			9
		})
	end

	local ExtraHP = global.SpecialPropGetter(_env, "ExtraHP")(_env, actor)

	if ExtraHP and ExtraHP ~= 0 then
		for _, friendunit in global.__iter__(global.RandomN(_env, 1, global.FriendUnits(_env))) do
			local heal1 = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, friendunit, ExtraHP, 0)

			global.ApplyHPRecovery(_env, friendunit, heal1)
		end
	end

	local BeCuredRage = global.SpecialPropGetter(_env, "BeCuredRage")(_env, target)

	if BeCuredRage and BeCuredRage ~= 0 then
		global.ApplyRPRecovery(_env, target, BeCuredRage)
	end

	return global.ApplyHPRecovery(_env, target, heal, switch)
end

function all.ApplyHPRecoveryN(_env, n, total, target, heals, actor, switch)
	local this = _env.this
	local global = _env.global

	if n == total then
		local extrapetshealrate = global.SpecialPropGetter(_env, "extrapetshealrate")(_env, actor)

		if extrapetshealrate and extrapetshealrate ~= 0 then
			local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			for _, unit in global.__iter__(units) do
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

				global.ApplyHPRecovery(_env, unit, maxHp * extrapetshealrate)
			end
		end

		local extrapetshealrate_OnHeal = global.SpecialPropGetter(_env, "extrapetshealrate_OnHeal")(_env, actor)

		if extrapetshealrate_OnHeal and extrapetshealrate_OnHeal ~= 0 then
			local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			for _, unit in global.__iter__(units) do
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

				global.ApplyHPRecovery(_env, unit, maxHp * extrapetshealrate_OnHeal)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, unit, {
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
		end

		local extramasterdefrate_OnHeal = global.SpecialPropGetter(_env, "extramasterdefrate_OnHeal")(_env, actor)

		if extramasterdefrate_OnHeal and extramasterdefrate_OnHeal ~= 0 then
			local master = global.FriendMaster(_env)

			if master then
				local buffeft1 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, extramasterdefrate_OnHeal)

				global.ApplyBuff(_env, master, {
					timing = 2,
					duration = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DEFUP",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end

		local BeCuredRage = global.SpecialPropGetter(_env, "BeCuredRage")(_env, target)

		if BeCuredRage and BeCuredRage ~= 0 then
			global.ApplyRPRecovery(_env, target, BeCuredRage)
		end
	end

	return global.ApplyHPRecovery(_env, target, heals[n], switch)
end

function all.ApplyHPMultiRecovery_ResultCheck(_env, actor, target, delays, heals)
	local this = _env.this
	local global = _env.global

	return global.MultiDelayCall(_env, delays, global.ApplyHPRecoveryN, target, heals, actor)
end

function all.ApplyRealDamage(_env, actor, target, dmgrange, dmgtype, damagerate, delays, multidamage, damage_compare, damageamount, lowerLimit)
	local this = _env.this
	local global = _env.global

	global.DispelBuff(_env, actor, global.BUFF_MARKED(_env, "REALDAMAGEVALUE"), 99)

	local result, damage = nil
	local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
	local atkrate = global.UnitPropGetter(_env, "atkrate")(_env, actor)
	local hurtrate = global.UnitPropGetter(_env, "hurtrate")(_env, actor)
	local critstrg = global.UnitPropGetter(_env, "critstrg")(_env, actor)
	local aoerate = global.UnitPropGetter(_env, "aoerate")(_env, actor)
	local singlerate = global.UnitPropGetter(_env, "singlerate")(_env, actor)
	local unhurtrate = global.UnitPropGetter(_env, "unhurtrate")(_env, target)
	local aoederate = global.UnitPropGetter(_env, "aoederate")(_env, target)
	local singlederate = global.UnitPropGetter(_env, "singlederate")(_env, target)

	if unhurtrate > 0 then
		unhurtrate = 0
	end

	if aoederate > 0 then
		aoederate = 0
	end

	if singlederate > 0 then
		singlederate = 0
	end

	local Flags = {
		"MASTER",
		"HERO",
		"SUMMONED",
		"ASSASSIN",
		"WARRIOR",
		"MAGE",
		"SUMMONER",
		"HEALER",
		"LIGHT",
		"DARK"
	}

	if dmgrange == 1 then
		damage = global.EvalDamage_FlagCheck(_env, actor, target, {
			1,
			1,
			0
		})
	elseif dmgrange == 2 then
		damage = global.EvalAOEDamage_FlagCheck(_env, actor, target, {
			1,
			1,
			0
		})
	end

	damage.val = atk * atkrate * (1 + hurtrate - unhurtrate) * damagerate

	if damage_compare then
		damage.crit = damage_compare.crit
	end

	if damage and damage.crit then
		damage.val = damage.val * (1.5 + critstrg)
	end

	if damageamount then
		damage.val = damageamount
		damage.crit = nil
	end

	damage.block = nil

	if dmgrange == 1 then
		damage.val = damage.val * (1 + singlerate - singlederate)
	elseif dmgrange == 2 then
		damage.val = damage.val * (1 + aoerate - aoederate)
	end

	local buffeft_damage = global.SpecialNumericEffect(_env, "+RealDamageValue", {
		"?Normal"
	}, damage.val)

	global.ApplyBuff(_env, actor, {
		timing = 0,
		duration = 99,
		tags = {
			"REALDAMAGEVALUE"
		}
	}, {
		buffeft_damage
	})

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) > 0 then
		damage.val = 0
	end

	if global.SelectBuffCount(_env, global.EnemyField(_env), global.BUFF_MARKED(_env, "LEIMu_Passive")) == 0 and global.MARKED(_env, "LEIMu")(_env, target) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "IMMUNE")) == 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "UNDEAD")) == 0 then
		local hp = global.UnitPropGetter(_env, "hp")(_env, target)
		local shield = global.UnitPropGetter(_env, "shield")(_env, target)

		if damage.val > hp + shield then
			damage.val = 0
			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, target, {
				timing = 0,
				duration = 99,
				tags = {
					"LEIMu_Passive_Done"
				}
			}, {
				buff
			})
		end
	end

	for i = 1, #Flags do
		local flag = Flags[i]

		if not global.MASTER(_env, actor) then
			if global.MARKED(_env, "SUMMONED")(_env, actor) then
				if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "DHB_Damage_Way")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Damage_Way_SUMMONER")) == 0 then
					damage.val = 0

					break
				end
			elseif global.MARKED(_env, flag)(_env, actor) and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "DHB_Damage_Way")) > 0 and global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "Damage_Way_" .. flag)) == 0 then
				damage.val = 0

				break
			end
		end
	end

	if dmgrange == 1 then
		if dmgtype == 1 then
			result = global.ApplyHPDamage_ResultCheck(_env, actor, target, damage, lowerLimit)
		elseif dmgtype == 2 then
			result = global.ApplyHPMultiDamage_ResultCheck(_env, actor, target, delays, global.SplitValue(_env, damage, multidamage), lowerLimit)
		end
	elseif dmgrange == 2 then
		if dmgtype == 1 then
			result = global.ApplyAOEHPDamage_ResultCheck(_env, actor, target, damage, lowerLimit)
		elseif dmgtype == 2 then
			result = global.ApplyAOEHPMultiDamage_ResultCheck(_env, actor, target, delays, global.SplitValue(_env, damage, multidamage), lowerLimit)
		end
	end

	global.DispelBuff(_env, actor, global.BUFF_MARKED(_env, "APPLYDAMAGEVALUE"), 99)

	return result
end

function all.EvalRealDamage(_env, actor, target, dmgrange, dmgtype, damagerate, delays, multidamage, damage_compare, damageamount, lowerLimit)
	local this = _env.this
	local global = _env.global
	local damage = nil
	local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
	local atkrate = global.UnitPropGetter(_env, "atkrate")(_env, actor)
	local hurtrate = global.UnitPropGetter(_env, "hurtrate")(_env, actor)
	local critstrg = global.UnitPropGetter(_env, "critstrg")(_env, actor)
	local aoerate = global.UnitPropGetter(_env, "aoerate")(_env, actor)
	local singlerate = global.UnitPropGetter(_env, "singlerate")(_env, actor)
	local unhurtrate = global.UnitPropGetter(_env, "unhurtrate")(_env, target)
	local aoederate = global.UnitPropGetter(_env, "aoederate")(_env, target)
	local singlederate = global.UnitPropGetter(_env, "singlederate")(_env, target)

	if unhurtrate > 0 then
		unhurtrate = 0
	end

	if aoederate > 0 then
		aoederate = 0
	end

	if singlederate > 0 then
		singlederate = 0
	end

	if dmgrange == 1 then
		damage = global.EvalDamage_FlagCheck(_env, actor, target, {
			1,
			1,
			0
		})
	elseif dmgrange == 2 then
		damage = global.EvalAOEDamage_FlagCheck(_env, actor, target, {
			1,
			1,
			0
		})
	end

	damage.val = atk * atkrate * (1 + hurtrate - unhurtrate) * damagerate

	if damage_compare then
		damage.crit = damage_compare.crit
	end

	if damage and damage.crit then
		damage.val = damage.val * (1.5 + critstrg)
	end

	if damageamount then
		damage.val = damageamount
		damage.crit = nil
	end

	damage.block = nil

	if dmgrange == 1 then
		damage.val = damage.val * (1 + singlerate - singlederate)
	elseif dmgrange == 2 then
		damage.val = damage.val * (1 + aoerate - aoederate)
	end

	return damage.val
end

function all.NoMove(_env, unit)
	local this = _env.this
	local global = _env.global
	local buff = global.NumericEffect(_env, "+def", {
		"+Normal",
		"+Normal"
	}, 0)

	global.ApplyBuff(_env, unit, {
		timing = 0,
		duration = 99,
		tags = {
			"CANNOT_MOVE"
		}
	}, {
		buff
	})
end

function all.CancelNoMove(_env, unit)
	local this = _env.this
	local global = _env.global

	global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "CANNOT_MOVE"), 99)
end

function all.transportExt_ResultCheck(_env, unit, cellid, runtime, flag)
	local this = _env.this
	local global = _env.global

	if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "CANNOT_MOVE")) == 0 then
		global.transportExt(_env, unit, cellid, runtime, flag)
	end
end

function all.SelectBuffCount_Unit(_env, units, tags)
	local this = _env.this
	local global = _env.global
	local count = 0

	for _, unit in global.__iter__(units) do
		if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, tags)) > 0 then
			count = count + 1
		end
	end

	return count
end

function all.Serious_Injury(_env, actor, target, ratio, duration, timing)
	local this = _env.this
	local global = _env.global
	local buff1 = global.HPRecoverRatioEffect(_env, -ratio)
	local buff2 = global.ShieldRatioEffect(_env, -ratio)

	global.ApplyBuff_Debuff(_env, actor, target, {
		display = "Injury",
		duration = duration,
		timing = timing,
		tags = {
			"STATUS",
			"DEBUFF",
			"INJURY",
			"ABNORMAL",
			"DISPELLABLE",
			"UNSTEALABLE"
		}
	}, {
		buff1,
		buff2
	}, 1, 0)
end

function all.BackToCard_ResultCheck(_env, unit, cond, location)
	local this = _env.this
	local global = _env.global
	local card = nil

	if cond == "card" then
		card = global.BackToCard(_env, unit, global.GetOwner(_env, unit))
	elseif cond == "window" then
		card = global.BackToWindow(_env, unit, location, global.GetOwner(_env, unit))
	end

	if card then
		global.ActivateSpecificTrigger(_env, unit, "BACK_CARD", {
			card = card
		})
		global.ActivateGlobalTrigger(_env, unit, "UNIT_BACK_CARD", {
			unit = unit,
			card = card
		})

		return card
	end
end

function all.Revive_Check(_env, actor, hpRatio, anger, location, unit)
	local this = _env.this
	local global = _env.global
	local reviveunit = nil

	if unit then
		reviveunit = global.ReviveByUnit(_env, unit, hpRatio, anger, location)
	else
		reviveunit = global.Revive(_env, hpRatio, anger, location)
	end

	if reviveunit and global.GetUnitCid(_env, actor) then
		global.AddStatus(_env, reviveunit, global.GetUnitCid(_env, actor))
	end

	return reviveunit
end

function all.CellRowLocation(_env, cell)
	local this = _env.this
	local global = _env.global
	local location = 0

	if global.abs(_env, global.IdOfCell(_env, cell)) == 1 or global.abs(_env, global.IdOfCell(_env, cell)) == 2 or global.abs(_env, global.IdOfCell(_env, cell)) == 3 then
		location = 1
	end

	if global.abs(_env, global.IdOfCell(_env, cell)) == 4 or global.abs(_env, global.IdOfCell(_env, cell)) == 5 or global.abs(_env, global.IdOfCell(_env, cell)) == 6 then
		location = 2
	end

	if global.abs(_env, global.IdOfCell(_env, cell)) == 7 or global.abs(_env, global.IdOfCell(_env, cell)) == 8 or global.abs(_env, global.IdOfCell(_env, cell)) == 9 then
		location = 3
	end

	return location
end

function all.CellColLocation(_env, cell)
	local this = _env.this
	local global = _env.global
	local location = 0

	if global.abs(_env, global.IdOfCell(_env, cell)) == 1 or global.abs(_env, global.IdOfCell(_env, cell)) == 4 or global.abs(_env, global.IdOfCell(_env, cell)) == 7 then
		location = 1
	end

	if global.abs(_env, global.IdOfCell(_env, cell)) == 2 or global.abs(_env, global.IdOfCell(_env, cell)) == 5 or global.abs(_env, global.IdOfCell(_env, cell)) == 8 then
		location = 2
	end

	if global.abs(_env, global.IdOfCell(_env, cell)) == 3 or global.abs(_env, global.IdOfCell(_env, cell)) == 6 or global.abs(_env, global.IdOfCell(_env, cell)) == 9 then
		location = 3
	end

	return location
end

return _M
