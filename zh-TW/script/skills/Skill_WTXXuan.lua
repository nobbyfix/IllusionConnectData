local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_WTXXuan_Normal = {
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
				-1.7,
				0
			}, 100, "skill1"))
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
all.Skill_WTXXuan_Proud = {
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
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_WTXXuan"
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
				-1.9,
				0
			}, 100, "skill2"))
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

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				200,
				567
			}, global.SplitValue(_env, damage, {
				0.3,
				0.3,
				0.4
			}))
		end)

		return _env
	end
}
all.Skill_WTXXuan_Unique = {
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

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2667
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_WTXXuan"
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
			_env.units = global.EnemyUnits(_env, global.ROW_OF(_env, _env.TARGET))

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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, nil, 2) + {
				-2.3,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1900
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
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			}, 1)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
					0,
					300
				}, global.SplitValue(_env, damage, {
					0.4,
					0.6
				}))
			end
		end)
		exec["@time"]({
			2667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_WTXXuan_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

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

		_env.count = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.FriendMaster(_env) then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, global.FriendMaster(_env), {
					timing = 2,
					duration = 3,
					display = "HurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"HURTRATEUP",
						"Skill_WTXXuan_Passive",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
			end

			local cards = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "MAGE"))

			for _, card in global.__iter__(cards) do
				local buffeft3 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
					duration = 3,
					group = "Skill_WTXXuan_Passive",
					timing = 2,
					limit = 1,
					tags = {
						"CARDBUFF",
						"Skill_WTXXuan_Passive",
						"HURTRATEUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft3
				})
			end
		end)

		return _env
	end
}
all.Skill_WTXXuan_Proud_EX = {
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

		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_WTXXuan"
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
				-1.9,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.FriendUnits(_env, global.MARKED(_env, "MAGE"))) do
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					timing = 0,
					duration = 99,
					display = "HurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"HURTRATEUP",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				200,
				567
			}, global.SplitValue(_env, damage, {
				0.3,
				0.3,
				0.4
			}))
		end)

		return _env
	end
}
all.Skill_WTXXuan_Unique_EX = {
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

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2667
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_WTXXuan"
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
			_env.units = global.EnemyUnits(_env, global.ROW_OF(_env, _env.TARGET))

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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, nil, 2) + {
				-2.3,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1900
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
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			}, 1)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
					0,
					300
				}, global.SplitValue(_env, damage, {
					0.4,
					0.6
				}))
			end
		end)
		exec["@time"]({
			2667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_WTXXuan_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.MageHurtRateFactor = externs.MageHurtRateFactor

		assert(this.MageHurtRateFactor ~= nil, "External variable `MageHurtRateFactor` is not provided.")

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

		_env.count = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local cards = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "MAGE"))

			for _, card in global.__iter__(cards) do
				_env.count = _env.count + 1
			end

			if global.FriendMaster(_env) then
				if _env.count > 4 then
					local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.HurtRateFactor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, global.FriendMaster(_env), {
						timing = 2,
						duration = 3,
						display = "HurtRateUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"HURTRATEUP",
							"Skill_WTXXuan_Passive",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
				else
					local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.MageHurtRateFactor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, global.FriendMaster(_env), {
						timing = 2,
						duration = 3,
						display = "HurtRateUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"HURTRATEUP",
							"Skill_WTXXuan_Passive",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
				end

				for _, card in global.__iter__(cards) do
					if _env.count > 4 then
						local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
							"+Normal",
							"+Normal"
						}, this.MageHurtRateFactor)

						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
							duration = 3,
							group = "Skill_WTXXuan_Passive",
							timing = 2,
							limit = 1,
							tags = {
								"CARDBUFF",
								"Skill_WTXXuan_Passive",
								"HURTRATEUP",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft2
						})
					else
						local buffeft3 = global.NumericEffect(_env, "+hurtrate", {
							"+Normal",
							"+Normal"
						}, this.HurtRateFactor)

						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
							duration = 3,
							group = "Skill_WTXXuan_Passive",
							timing = 2,
							limit = 1,
							tags = {
								"CARDBUFF",
								"Skill_WTXXuan_Passive",
								"HURTRATEUP",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft3
						})
					end
				end
			end
		end)

		return _env
	end
}

return _M
