local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_XHMao_Normal = {
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
				-0.65,
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
all.Skill_XHMao_Proud = {
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
			"Hero_Proud_XHMao"
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

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2.5,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			733
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
all.Skill_XHMao_Unique = {
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
				2.7,
				0
			}
		end

		this.CritRateFactor = externs.CritRateFactor

		if this.CritRateFactor == nil then
			this.CritRateFactor = 0.3
		end

		this.MaxNum = externs.MaxNum

		if this.MaxNum == nil then
			this.MaxNum = 2
		end

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 1
		end

		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 2
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XHMao"
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
		_env.flag = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

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

			local buffeft = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 1,
				group = "Skill_XHMao_Unique",
				timing = 2,
				limit = 1,
				tags = {
					"Skill_XHMao_Unique",
					"CRITRATEUP"
				}
			}, {
				buffeft
			})

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if damage.crit then
					_env.flag = _env.flag + 1
				end

				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)
				global.DelayCall(_env, 1267, global.ApplyAOEHPDamage_ResultCheck, _env.ACTOR, unit, damage)
			end

			if _env.flag > 0 then
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
			else
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3_1"))
			end

			global.HarmTargetView(_env, _env.units)
		end)
		exec["@time"]({
			2267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for i = 1, global.min(_env, _env.flag, this.MaxNum) do
				local SummonedXHMao = global.Summon(_env, _env.ACTOR, "SummonedXHMao", this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})

				if SummonedXHMao then
					global.AddStatus(_env, SummonedXHMao, "SummonedXHMao")

					if global.SelectHeroPassiveCount(_env, _env.ACTOR, "Hero_PBattle_XHMao_Awaken") > 0 then
						local buff = global.PassiveFunEffectBuff(_env, "Skill_XHMao_Wolf_Passive", {
							WolfRateFactor = 80
						})

						global.ApplyBuff(_env, SummonedXHMao, {
							duration = 99,
							group = "Skill_XHMao_Passive_Awaken",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
					end
				end
			end

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Skill_XHMao_Unique", "CRITRATEUP"), 99)
		end)
		exec["@time"]({
			3100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XHMao_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 200
		end

		this.WolfNum = externs.WolfNum

		if this.WolfNum == nil then
			this.WolfNum = 1
		end

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 1
		end

		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 2
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
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

			if global.FriendMaster(_env) then
				global.ApplyRPRecovery(_env, global.FriendMaster(_env), this.RateFactor)
			end

			for i = 1, this.WolfNum do
				local SummonedXHMao = global.Summon(_env, _env.ACTOR, "SummonedXHMao", this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})

				if SummonedXHMao then
					global.AddStatus(_env, SummonedXHMao, "SummonedXHMao")
				end
			end
		end)

		return _env
	end
}
all.Skill_XHMao_Passive_Key = {
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
			"SELF:PRE_ENTER"
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

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))) do
				global.addHeroCardSeatRules(_env, global.GetOwner(_env, _env.ACTOR), card, {
					"SUMMONED"
				}, {
					"die"
				})
			end
		end)

		return _env
	end
}
all.Skill_XHMao_Wolf_Normal = {
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
			833
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
				-0.85,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DispelBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "SHIELD", "DISPELLABLE"), 99)
			global.DispelBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "IMMUNE", "DISPELLABLE"), 99)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
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

			global.AddStatus(_env, _env.ACTOR, "SummonedXHMao")
		end)

		return _env
	end
}
all.Skill_XHMao_Proud_EX = {
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

		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 150
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1234
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XHMao"
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

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2.5,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			if global.FriendMaster(_env) then
				global.ApplyRPRecovery(_env, global.FriendMaster(_env), this.RateFactor)
			end
		end)

		return _env
	end
}
all.Skill_XHMao_Unique_EX = {
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
				3.35,
				0
			}
		end

		this.CritRateFactor = externs.CritRateFactor

		if this.CritRateFactor == nil then
			this.CritRateFactor = 0.45
		end

		this.MaxNum = externs.MaxNum

		if this.MaxNum == nil then
			this.MaxNum = 3
		end

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 1
		end

		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 2
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XHMao"
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
		_env.flag = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

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

			local buffeft = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 1,
				group = "Skill_XHMao_Unique",
				timing = 2,
				limit = 1,
				tags = {
					"Skill_XHMao_Unique",
					"CRITRATEUP"
				}
			}, {
				buffeft
			})

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if damage.crit then
					_env.flag = _env.flag + 1
				end

				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)
				global.DelayCall(_env, 1267, global.ApplyAOEHPDamage_ResultCheck, _env.ACTOR, unit, damage)
			end

			if _env.flag > 0 then
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
			else
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3_1"))
			end

			global.HarmTargetView(_env, _env.units)
		end)
		exec["@time"]({
			2267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for i = 1, global.min(_env, _env.flag, this.MaxNum) do
				local SummonedXHMao = global.Summon(_env, _env.ACTOR, "SummonedXHMao", this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})

				if SummonedXHMao then
					global.AddStatus(_env, SummonedXHMao, "SummonedXHMao")

					if global.SelectHeroPassiveCount(_env, _env.ACTOR, "Hero_PBattle_XHMao_Awaken") > 0 then
						local buff = global.PassiveFunEffectBuff(_env, "Skill_XHMao_Wolf_Passive", {
							WolfRateFactor = 80
						})

						global.ApplyBuff(_env, SummonedXHMao, {
							duration = 99,
							group = "Skill_XHMao_Passive_Awaken",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
					end
				end
			end

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Skill_XHMao_Unique", "CRITRATEUP"), 99)
		end)
		exec["@time"]({
			3100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XHMao_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 400
		end

		this.WolfNum = externs.WolfNum

		if this.WolfNum == nil then
			this.WolfNum = 2
		end

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 1
		end

		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 2
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
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

			if global.FriendMaster(_env) then
				global.ApplyRPRecovery(_env, global.FriendMaster(_env), this.RateFactor)
			end

			for i = 1, this.WolfNum do
				local SummonedXHMao = global.Summon(_env, _env.ACTOR, "SummonedXHMao", this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})

				if SummonedXHMao then
					global.AddStatus(_env, SummonedXHMao, "SummonedXHMao")
				end
			end
		end)

		return _env
	end
}
all.Skill_XHMao_Passive_Awaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 400
		end

		this.WolfNum = externs.WolfNum

		if this.WolfNum == nil then
			this.WolfNum = 2
		end

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 1
		end

		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 2
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.WolfRateFactor = externs.WolfRateFactor

		if this.WolfRateFactor == nil then
			this.WolfRateFactor = 100
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
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

			if global.FriendMaster(_env) then
				global.ApplyRPRecovery(_env, global.FriendMaster(_env), this.RateFactor)
			end

			for i = 1, this.WolfNum do
				local SummonedXHMao = global.Summon(_env, _env.ACTOR, "SummonedXHMao", this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})

				if SummonedXHMao then
					global.AddStatus(_env, SummonedXHMao, "SummonedXHMao")

					local buff = global.PassiveFunEffectBuff(_env, "Skill_XHMao_Wolf_Passive", {
						WolfRateFactor = this.WolfRateFactor
					})

					global.ApplyBuff(_env, SummonedXHMao, {
						duration = 99,
						group = "Skill_XHMao_Passive_Awaken",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"BUFF",
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
all.Skill_XHMao_Wolf_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.WolfRateFactor = externs.WolfRateFactor

		if this.WolfRateFactor == nil then
			this.WolfRateFactor = 100
		end

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

			if global.FriendMaster(_env) then
				global.ApplyRPRecovery(_env, global.FriendMaster(_env), this.WolfRateFactor)
			end

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				if global.MARKED(_env, "XHMao")(_env, unit) then
					global.ApplyRPRecovery(_env, unit, this.WolfRateFactor)
				end
			end
		end)

		return _env
	end
}

return _M
