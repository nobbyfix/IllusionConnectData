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

	if global.MARKED(_env, "HYXia")(_env, target) then
		damage = 0
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

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "HGEr_Passive_No_Crit")) > 0 then
		attacker.critrate = 0
	end

	local damage = global.EvalSingleDamage(_env, attacker, defender, dmgFactor)

	if global.INSTATUS(_env, "Skill_MGNa_Passive_Key")(_env, actor) and global.PETS(_env, target) then
		local cost = global.GetCost(_env, target)

		if cost > 14 then
			damage.val = damage.val * 1.2
		end
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) > 0 then
		damage.val = 0
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
		"PROVOKE",
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

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "HGEr_Passive_No_Crit")) > 0 then
		attacker.critrate = 0
	end

	local damage = global.EvalAOEDamage(_env, attacker, defender, dmgFactor)

	if global.INSTATUS(_env, "Skill_MGNa_Passive_Key")(_env, actor) and global.PETS(_env, target) then
		local cost = global.GetCost(_env, target)

		if cost > 14 then
			damage.val = damage.val * 1.2
		end
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) > 0 then
		damage.val = 0
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
		"PROVOKE",
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
						"UNDISPELLABLE",
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
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
		local ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor)

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

	local result = global.ApplyHPDamage(_env, target, damage, lowerLimit)

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
			for _, unit in global.__iter__(global.EnemyUnits(_env, global.NEIGHBORS_OF(_env, target))) do
				global.ApplyHPDamage(_env, unit, damage * singlecritsplitrate)
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
						"UNDISPELLABLE",
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
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
		local ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor)

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

	local result = global.ApplyHPDamage(_env, target, damage, lowerLimit)

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
	end

	local extrapetshealrate = global.SpecialPropGetter(_env, "extrapetshealrate")(_env, actor)

	if extrapetshealrate and extrapetshealrate ~= 0 then
		local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

		for _, unit in global.__iter__(units) do
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

			global.ApplyHPRecovery(_env, unit, maxHp * extrapetshealrate)
		end
	end

	if result and result.crit and global.MARKED(_env, "QTQCi")(_env, actor) then
		local RpFactor = global.SpecialPropGetter(_env, "Skill_QTQCi_Passive_RP")(_env, actor)

		if RpFactor and RpFactor ~= 0 then
			global.ApplyRPRecovery(_env, actor, RpFactor)
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
								"UNDISPELLABLE",
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
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
		local ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor) / total

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

	local result = global.ApplyHPDamage(_env, target, damages[n], lowerLimit, n ~= total)

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
			for _, unit in global.__iter__(global.EnemyUnits(_env, global.NEIGHBORS_OF(_env, target))) do
				global.ApplyHPDamage(_env, unit, damages[n] * singlecritsplitrate)
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
								"UNDISPELLABLE",
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
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
		local ExDmg = global.min(_env, maxHp * MaxHpRateFactor, atk * AtkFactor) / total

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

	local result = global.ApplyHPDamage(_env, target, damages[n], lowerLimit, n ~= total)

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

	if result and result.crit and global.MARKED(_env, "QTQCi")(_env, actor) then
		local RpFactor = global.SpecialPropGetter(_env, "Skill_QTQCi_Passive_RP")(_env, actor)

		if RpFactor and RpFactor ~= 0 and n == total then
			global.ApplyRPRecovery(_env, actor, RpFactor)
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

function all.ApplyHPRecovery_ResultCheck(_env, actor, target, heal)
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
		local reviveunit = global.ProbTest(_env, 0.2) and global.Revive(_env, 1, 0, {
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

	return global.ApplyHPRecovery(_env, target, heal)
end

function all.ApplyHPRecoveryN(_env, n, total, target, heals, actor)
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

	return global.ApplyHPRecovery(_env, target, heals[n])
end

function all.ApplyHPMultiRecovery_ResultCheck(_env, actor, target, delays, heals)
	local this = _env.this
	local global = _env.global

	return global.MultiDelayCall(_env, delays, global.ApplyHPRecoveryN, target, heals, actor)
end

function all.ApplyRealDamage(_env, actor, target, dmgrange, dmgtype, damagerate, delays, multidamage, damage_compare, damageamount, lowerLimit)
	local this = _env.this
	local global = _env.global
	local result, damage = nil
	local atk = global.UnitPropGetter(_env, "atk")(_env, actor)
	local atkrate = global.UnitPropGetter(_env, "atkrate")(_env, actor)
	local hurtrate = global.UnitPropGetter(_env, "hurtrate")(_env, actor)
	local critstrg = global.UnitPropGetter(_env, "critstrg")(_env, actor)
	local aoerate = global.UnitPropGetter(_env, "aoerate")(_env, actor)

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

	damage.val = atk * atkrate * (1 + hurtrate) * damagerate

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

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "GUIDIE_SHENYIN")) > 0 then
		damage.val = 0
	end

	if dmgrange == 1 then
		if dmgtype == 1 then
			result = global.ApplyHPDamage_ResultCheck(_env, actor, target, damage, lowerLimit)
		elseif dmgtype == 2 then
			result = global.ApplyHPMultiDamage_ResultCheck(_env, actor, target, delays, global.SplitValue(_env, damage, multidamage), lowerLimit)
		end
	elseif dmgrange == 2 then
		damage.val = damage.val * (1 + aoerate)

		if dmgtype == 1 then
			result = global.ApplyAOEHPDamage_ResultCheck(_env, actor, target, damage, lowerLimit)
		elseif dmgtype == 2 then
			result = global.ApplyAOEHPMultiDamage_ResultCheck(_env, actor, target, delays, global.SplitValue(_env, damage, multidamage), lowerLimit)
		end
	end

	return result
end

return _M
