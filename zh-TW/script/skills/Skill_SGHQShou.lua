local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SGHQShou_Betty_Normal = {
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
			634
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
				-1.7,
				0
			}, 100, "skill1"))
		end)
		exec["@time"]({
			300
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
all.Skill_SGHQShou_Betty_Proud = {
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
			900
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SGHQShou"
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

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
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
all.Skill_SGHQShou_Unique = {
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

		this.summonFactorHpA = externs.summonFactorHpA

		assert(this.summonFactorHpA ~= nil, "External variable `summonFactorHpA` is not provided.")

		this.summonFactorAtkA = externs.summonFactorAtkA

		assert(this.summonFactorAtkA ~= nil, "External variable `summonFactorAtkA` is not provided.")

		this.summonFactorDefA = externs.summonFactorDefA

		assert(this.summonFactorDefA ~= nil, "External variable `summonFactorDefA` is not provided.")

		this.summonFactorHpB = externs.summonFactorHpB

		assert(this.summonFactorHpB ~= nil, "External variable `summonFactorHpB` is not provided.")

		this.summonFactorAtkB = externs.summonFactorAtkB

		assert(this.summonFactorAtkB ~= nil, "External variable `summonFactorAtkB` is not provided.")

		this.summonFactorDefB = externs.summonFactorDefB

		assert(this.summonFactorDefB ~= nil, "External variable `summonFactorDefB` is not provided.")

		this.summonFactorA = {
			this.summonFactorHpA,
			this.summonFactorAtkA,
			this.summonFactorDefA
		}
		this.summonFactorB = {
			this.summonFactorHpB,
			this.summonFactorAtkB,
			this.summonFactorDefB
		}
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3067
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SGHQShou"
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
				-1.7,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				500,
				700
			}, global.SplitValue(_env, damage, {
				0.3,
				0.3,
				0.4
			}))
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, summonunit in global.__iter__(global.FriendUnits(_env, global.INSTATUS(_env, "SummonedSGHQShou"))) do
				global.Kick(_env, summonunit)
			end

			local buffeft5 = global.HPLink(_env)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "HPLink",
				group = "Skill_SGHQShou_Unique",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"HPLINK",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft5
			}, 1)

			local SummonedSGHQShouA = global.Summon(_env, _env.ACTOR, "SummonedSGHQShou_Vanessa", this.summonFactorA, nil, {
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

			if SummonedSGHQShouA then
				global.AddStatus(_env, SummonedSGHQShouA, "SummonedSGHQShou")
				global.ApplyBuff_Buff(_env, _env.ACTOR, SummonedSGHQShouA, {
					timing = 0,
					display = "HPLink",
					group = "Skill_SGHQShou_Unique",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"HPLINK",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft5
				}, 1)
			end

			local SummonedSGHQShouB = global.Summon(_env, _env.ACTOR, "SummonedSGHQShou_Lucy", this.summonFactorB, nil, {
				7,
				8,
				9,
				4,
				6,
				1,
				3,
				5,
				2
			})

			if SummonedSGHQShouB then
				global.AddStatus(_env, SummonedSGHQShouB, "SummonedSGHQShou")
				global.ApplyBuff_Buff(_env, _env.ACTOR, SummonedSGHQShouB, {
					timing = 0,
					display = "HPLink",
					group = "Skill_SGHQShou_Unique",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"HPLINK",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft5
				}, 1)
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
all.Skill_SGHQShou_Passive = {
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
			"UNIT_ENTER"
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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) and global.PETS(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, "SUMMONER")(_env, _env.unit) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "SGHQShou"))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", 1, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"WEDEKEY",
							"UNDISPELLABLE",
							"Skill_SGHQShou_Passive"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.Skill_SGHQShou_Vanessa_Normal = {
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
			1000
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
				-1.7,
				0
			}, 100, "skill1"))
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_SGHQShou_Vanessa_Proud = {
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
		this.main = global["[duration]"](this, {
			1167
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

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, nil, 2) + {
				-1.2,
				0
			}, 100, "skill2"))

			_env.units = global.EnemyUnits(_env, global.ROW_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, 0.15)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "CritRateUp",
				tags = {
					"NUMERIC",
					"BUFF",
					"CRITRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_SGHQShou_Vanessa_Passive = {
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
			local buffeft1 = global.Taunt(_env)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 3,
				display = "Taunt",
				tags = {
					"STATUS",
					"BUFF",
					"TAUNT",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.Skill_SGHQShou_Lucy_Normal = {
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
			667
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
				-1.7,
				0
			}, 100, "skill1"))
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_SGHQShou_Lucy_Proud = {
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
		this.main = global["[duration]"](this, {
			1000
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

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, 0.15)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "CritRateUp",
				tags = {
					"NUMERIC",
					"BUFF",
					"CRITRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_SGHQShou_Lucy_Passive = {
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
			"SELF:DIE"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
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
all.Skill_SGHQShou_Betty_Proud_EX = {
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

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			900
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SGHQShou"
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

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "CritRateUp",
				tags = {
					"NUMERIC",
					"BUFF",
					"CRITRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_SGHQShou_Unique_EX = {
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

		this.summonFactorHpA = externs.summonFactorHpA

		assert(this.summonFactorHpA ~= nil, "External variable `summonFactorHpA` is not provided.")

		this.summonFactorAtkA = externs.summonFactorAtkA

		assert(this.summonFactorAtkA ~= nil, "External variable `summonFactorAtkA` is not provided.")

		this.summonFactorDefA = externs.summonFactorDefA

		assert(this.summonFactorDefA ~= nil, "External variable `summonFactorDefA` is not provided.")

		this.summonFactorHpB = externs.summonFactorHpB

		assert(this.summonFactorHpB ~= nil, "External variable `summonFactorHpB` is not provided.")

		this.summonFactorAtkB = externs.summonFactorAtkB

		assert(this.summonFactorAtkB ~= nil, "External variable `summonFactorAtkB` is not provided.")

		this.summonFactorDefB = externs.summonFactorDefB

		assert(this.summonFactorDefB ~= nil, "External variable `summonFactorDefB` is not provided.")

		this.summonFactorA = {
			this.summonFactorHpA,
			this.summonFactorAtkA,
			this.summonFactorDefA
		}
		this.summonFactorB = {
			this.summonFactorHpB,
			this.summonFactorAtkB,
			this.summonFactorDefB
		}
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3067
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SGHQShou"
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
				-1.7,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				500,
				700
			}, global.SplitValue(_env, damage, {
				0.3,
				0.3,
				0.4
			}))
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, summonunit in global.__iter__(global.FriendUnits(_env, global.INSTATUS(_env, "SummonedSGHQShou"))) do
				global.Kick(_env, summonunit)
			end

			local buffeft5 = global.HPLink(_env)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "HPLink",
				group = "Skill_SGHQShou_Unique",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"HPLINK",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft5
			}, 1)

			local SummonedSGHQShouA = global.Summon(_env, _env.ACTOR, "SummonedSGHQShou_Vanessa", this.summonFactorA, nil, {
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

			if SummonedSGHQShouA then
				global.AddStatus(_env, SummonedSGHQShouA, "SummonedSGHQShou")
				global.ApplyBuff_Buff(_env, _env.ACTOR, SummonedSGHQShouA, {
					timing = 0,
					display = "HPLink",
					group = "Skill_SGHQShou_Unique",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"HPLINK",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft5
				}, 1)
			end

			local SummonedSGHQShouB = global.Summon(_env, _env.ACTOR, "SummonedSGHQShou_Lucy", this.summonFactorB, nil, {
				7,
				8,
				9,
				4,
				6,
				1,
				3,
				5,
				2
			})

			if SummonedSGHQShouB then
				global.AddStatus(_env, SummonedSGHQShouB, "SummonedSGHQShou")
				global.ApplyBuff_Buff(_env, _env.ACTOR, SummonedSGHQShouB, {
					timing = 0,
					display = "HPLink",
					group = "Skill_SGHQShou_Unique",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"HPLINK",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft5
				}, 1)
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
all.Skill_SGHQShou_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) and global.PETS(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, "SUMMONER")(_env, _env.unit) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "SGHQShou"))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", 1, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"WEDEKEY",
							"UNDISPELLABLE",
							"Skill_SGHQShou_Passive"
						}
					}, {
						cardvaluechange
					})

					local maxHp = global.GetHeroCardAttr(_env, card, "maxHp")
					local buffeft1 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.AtkRateFactor)
					local buffeft2 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
						timing = 0,
						duration = 99,
						tags = {
							"CARDBUFF",
							"Skill_SGHQShou_Passive",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1,
						buffeft2
					})
				end
			end
		end)

		return _env
	end
}
all.Skill_SGHQShou_Passive_Awaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		this.RPFactor = externs.RPFactor

		if this.RPFactor == nil then
			this.RPFactor = 200
		end

		this.MasterRPFactor = externs.MasterRPFactor

		if this.MasterRPFactor == nil then
			this.MasterRPFactor = 100
		end

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
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) then
				if global.PETS(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, "SUMMONER")(_env, _env.unit) then
					for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "SGHQShou"))) do
						local cardvaluechange = global.CardCostEnchant(_env, "-", 1, 1)

						global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
							tags = {
								"CARDBUFF",
								"WEDEKEY",
								"UNDISPELLABLE",
								"Skill_SGHQShou_Passive"
							}
						}, {
							cardvaluechange
						})

						local maxHp = global.GetHeroCardAttr(_env, card, "maxHp")
						local buffeft1 = global.NumericEffect(_env, "+atkrate", {
							"+Normal",
							"+Normal"
						}, this.AtkRateFactor)
						local buffeft2 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
							timing = 0,
							duration = 99,
							tags = {
								"CARDBUFF",
								"Skill_SGHQShou_Passive",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft1,
							buffeft2
						})
					end
				end

				if (global.MARKED(_env, "SummonedCBJun_Check")(_env, _env.unit) or global.MARKED(_env, "King_Check")(_env, _env.unit) or global.MARKED(_env, "SMSNv_BOTu_Check")(_env, _env.unit)) and global.SpecialPropGetter(_env, "Skill_SGHQShou_Passive_Awaken_Count")(_env, global.FriendField(_env)) < 5 then
					for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "SGHQShou"))) do
						local cardvaluechange = global.CardCostEnchant(_env, "-", 1, 1)

						global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
							tags = {
								"CARDBUFF",
								"WEDEKEY",
								"UNDISPELLABLE",
								"Skill_SGHQShou_Passive"
							}
						}, {
							cardvaluechange
						})

						local maxHp = global.GetHeroCardAttr(_env, card, "maxHp")
						local buffeft1 = global.NumericEffect(_env, "+atkrate", {
							"+Normal",
							"+Normal"
						}, this.AtkRateFactor)
						local buffeft2 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
							timing = 0,
							duration = 99,
							tags = {
								"CARDBUFF",
								"Skill_SGHQShou_Passive",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft1,
							buffeft2
						})

						local buffeft_count = global.SpecialNumericEffect(_env, "+Skill_SGHQShou_Passive_Awaken_Count", {
							"+Normal",
							"+Normal"
						}, 1)

						global.ApplyBuff(_env, global.FriendField(_env), {
							timing = 0,
							duration = 99,
							tags = {
								"Skill_SGHQShou_Passive_Awaken_Count"
							}
						}, {
							buffeft_count
						})
					end
				end
			end

			if global.MARKED(_env, "SGHQShou")(_env, _env.ACTOR) then
				local buff1 = global.PassiveFunEffectBuff(_env, "SGHQShou_Passive_Awaken_Field", {
					RPFactor = this.RPFactor,
					MasterRPFactor = this.MasterRPFactor
				})

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"SGHQShou_Passive_Awaken_Field"
					}
				}, {
					buff1
				})
			end
		end)

		return _env
	end
}
all.SGHQShou_Passive_Awaken_Field = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RPFactor = externs.RPFactor

		if this.RPFactor == nil then
			this.RPFactor = 200
		end

		this.MasterRPFactor = externs.MasterRPFactor

		if this.MasterRPFactor == nil then
			this.MasterRPFactor = 100
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

			if global.INSTATUS(_env, "SummonedSGHQShou")(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				for _, unit1 in global.__iter__(global.FriendUnits(_env, global.MARKED(_env, "SGHQShou"))) do
					global.ApplyRPRecovery(_env, unit1, this.RPFactor)
				end

				if global.FriendMaster(_env) then
					global.ApplyRPRecovery(_env, global.FriendMaster(_env), this.MasterRPFactor)
				end
			end
		end)

		return _env
	end
}

return _M
