local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_FTLEShi_Normal = {
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
			1034
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
			500
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
all.Skill_FTLEShi_Proud = {
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
			1433
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_FTLEShi"
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
				-1.4,
				0
			}, 100, "skill2"))
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
				500
			}, global.SplitValue(_env, damage, {
				0.4,
				0.6
			}))
		end)

		return _env
	end
}
all.Skill_FTLEShi_Unique = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3000
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_FTLEShi"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_FTLEShi_Skill3"
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
				-1.4,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buffeft1 = global.Taunt(_env)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 3,
				display = "Taunt",
				tags = {
					"NUMERIC",
					"BUFF",
					"TAUNT",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_FTLEShi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		assert(this.ShieldRateFactor ~= nil, "External variable `ShieldRateFactor` is not provided.")

		this.ExShieldRateFactor = externs.ExShieldRateFactor

		assert(this.ExShieldRateFactor ~= nil, "External variable `ExShieldRateFactor` is not provided.")

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

		_env.count1 = 0
		_env.count2 = 0
		_env.RateFactor = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "ZTXChang"))) do
				_env.count1 = 1
			end

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "CLMan"))) do
				_env.count2 = 1
			end

			if _env.count1 + _env.count2 == 2 then
				_env.RateFactor = this.ShieldRateFactor + this.ExShieldRateFactor
			else
				_env.RateFactor = this.ShieldRateFactor
			end

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, maxHp * _env.RateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 4,
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
			}, 1)
		end)

		return _env
	end
}
all.Skill_FTLEShi_Proud_EX = {
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

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1433
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_FTLEShi"
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
				-1.4,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "BlockRateUp",
				group = "Skill_FTLEShi_Proud",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"BLOCKRATEUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1
			}, 1)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				500
			}, global.SplitValue(_env, damage, {
				0.4,
				0.6
			}))
		end)

		return _env
	end
}
all.Skill_FTLEShi_Unique_EX = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3000
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_FTLEShi"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_FTLEShi_Skill3"
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
				-1.4,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buffeft1 = global.Taunt(_env)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 3,
				display = "Taunt",
				tags = {
					"NUMERIC",
					"BUFF",
					"TAUNT",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_FTLEShi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		assert(this.ShieldRateFactor ~= nil, "External variable `ShieldRateFactor` is not provided.")

		this.ExShieldRateFactor = externs.ExShieldRateFactor

		assert(this.ExShieldRateFactor ~= nil, "External variable `ExShieldRateFactor` is not provided.")

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

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

		_env.count1 = 0
		_env.count2 = 0
		_env.RateFactor = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "ZTXChang"))) do
				_env.count1 = 1
			end

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "CLMan"))) do
				_env.count2 = 1
			end

			if _env.count1 + _env.count2 == 2 then
				_env.RateFactor = this.ShieldRateFactor + this.ExShieldRateFactor
			else
				_env.RateFactor = this.ShieldRateFactor
			end

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, maxHp * _env.RateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 4,
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
			}, 1)

			local buffeft2 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "BlockRateUp",
				group = "Skill_FTLEShi_Passive_EX",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"BLOCKRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			}, 1)
		end)

		return _env
	end
}
all.Skill_FTLEShi_Unique_Awaken = {
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

		this.SingleDRateFactor = externs.SingleDRateFactor

		if this.SingleDRateFactor == nil then
			this.SingleDRateFactor = 0.15
		end

		this.DefExtraRateFactor = externs.DefExtraRateFactor

		if this.DefExtraRateFactor == nil then
			this.DefExtraRateFactor = 0.03
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3000
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_FTLEShi"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_FTLEShi_Skill3"
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

		_env.count = 0

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
				-1.4,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buffeft1 = global.Taunt(_env)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 3,
				display = "Taunt",
				tags = {
					"NUMERIC",
					"BUFF",
					"TAUNT",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)

			if global.FriendMaster(_env) then
				_env.count = _env.count + global.DispelBuff(_env, global.FriendMaster(_env), global.BUFF_MARKED_ALL(_env, "DEBUFF", "DISPELLABLE"), 99)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, global.FriendMaster(_env), {
					timing = 2,
					duration = 1,
					display = "Purify",
					tags = {
						"DISPEL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
			end

			local buffeft3 = global.NumericEffect(_env, "+singlederate", {
				"+Normal",
				"+Normal"
			}, this.SingleDRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				display = "SingleUnHurtRateUp",
				group = "Skill_FTLEShi_Unique_EX_1",
				duration = 2,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft3
			}, 1, 0)
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_FTLEShi_Passive_Awaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		assert(this.ShieldRateFactor ~= nil, "External variable `ShieldRateFactor` is not provided.")

		this.ExShieldRateFactor = externs.ExShieldRateFactor

		assert(this.ExShieldRateFactor ~= nil, "External variable `ExShieldRateFactor` is not provided.")

		this.BlockRateFactor = externs.BlockRateFactor

		assert(this.BlockRateFactor ~= nil, "External variable `BlockRateFactor` is not provided.")

		this.DamageDownFactor = externs.DamageDownFactor

		if this.DamageDownFactor == nil then
			this.DamageDownFactor = 0.4
		end

		this.DownFactor = 1 - this.DamageDownFactor
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
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		passive1 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_DIE"
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
			"UNIT_TRANSPORT"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"UNIT_BUFF_APPLYED"
		}, passive4)
		local passive5 = __action(this, {
			name = "passive5",
			entry = prototype.passive5
		})
		passive5 = global["[duration]"](this, {
			0
		}, passive5)
		passive5 = global["[trigger_by]"](this, {
			"SELF:BUFF_BROKED"
		}, passive5)
		passive5 = global["[trigger_by]"](this, {
			"SELF:BUFF_CANCELED"
		}, passive5)
		passive5 = global["[trigger_by]"](this, {
			"SELF:BUFF_STEALED"
		}, passive5)
		this.passive5 = global["[trigger_by]"](this, {
			"SELF:BUFF_ENDED"
		}, passive5)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.count1 = 0
		_env.count2 = 0
		_env.RateFactor = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "ZTXChang"))) do
				_env.count1 = 1
			end

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "CLMan"))) do
				_env.count2 = 1
			end

			if _env.count1 + _env.count2 == 2 then
				_env.RateFactor = this.ShieldRateFactor + this.ExShieldRateFactor
			else
				_env.RateFactor = this.ShieldRateFactor
			end

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, maxHp * _env.RateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 4,
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
			}, 1)

			local buffeft2 = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "BlockRateUp",
				group = "Skill_FTLEShi_Passive_EX",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"BLOCKRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			}, 1)
			global.Skill_FTLEShi_Defend(_env, _env.ACTOR, this.DownFactor)

			local buff = global.PassiveFunEffectBuff(_env, "Skill_FTLEShi_Passive_Awaken_Kick", {})

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"Skill_FTLEShi_Passive_Awaken_Kick"
				}
			}, {
				buff
			})
		end)

		return _env
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

			if global.MARKED(_env, "FTLEShi")(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				for _, unit_one in global.__iter__(global.FriendUnits(_env)) do
					global.DispelBuff(_env, unit_one, global.BUFF_MARKED(_env, "Skill_FTLEShi_Passive_Awaken"), 99)
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				global.Skill_FTLEShi_Defend(_env, _env.ACTOR, this.DownFactor)
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

		_env.oldCell = externs.oldCell

		assert(_env.oldCell ~= nil, "External variable `oldCell` is not provided.")

		_env.newCell = externs.newCell

		assert(_env.newCell ~= nil, "External variable `newCell` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.CellColLocation(_env, _env.oldCell) ~= global.CellColLocation(_env, _env.newCell) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				global.Skill_FTLEShi_Defend(_env, _env.ACTOR, this.DownFactor)
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MARKED(_env, "FTLEShi")(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and (global.BuffIsMatched(_env, _env.buff, "FREEZE") or global.BuffIsMatched(_env, _env.buff, "DAZE") or global.BuffIsMatched(_env, _env.buff, "MUTE")) then
				for _, unit_one in global.__iter__(global.FriendUnits(_env)) do
					global.DispelBuff(_env, unit_one, global.BUFF_MARKED(_env, "Skill_FTLEShi_Passive_Awaken"), 99)
				end
			end
		end)

		return _env
	end,
	passive5 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if (global.BuffIsMatched(_env, _env.buff, "FREEZE") or global.BuffIsMatched(_env, _env.buff, "DAZE") or global.BuffIsMatched(_env, _env.buff, "MUTE")) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "FREEZE")) == 0 and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "DAZE")) == 0 and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "MUTE")) == 0 then
				global.Skill_FTLEShi_Defend(_env, _env.ACTOR, this.DownFactor)
			end
		end)

		return _env
	end
}
all.Skill_FTLEShi_Passive_Awaken_Kick = {
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
		passive = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_KICK"
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

			if global.MARKED(_env, "FTLEShi")(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				for _, unit_one in global.__iter__(global.FriendUnits(_env)) do
					global.DispelBuff(_env, unit_one, global.BUFF_MARKED(_env, "Skill_FTLEShi_Passive_Awaken", "UNDISPELLABLE"), 99)
				end

				global.DispelBuff(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "Skill_FTLEShi_Passive_Awaken_Kick"), 99)
			end
		end)

		return _env
	end
}

function all.Skill_FTLEShi_Defend(_env, actor, DownFactor)
	local this = _env.this
	local global = _env.global

	if global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "FREEZE")) ~= 0 or global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "DAZE")) ~= 0 or global.SelectBuffCount(_env, actor, global.BUFF_MARKED(_env, "MUTE")) ~= 0 then
		return
	end

	for _, unit in global.__iter__(global.FriendUnits(_env)) do
		global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Skill_FTLEShi_Passive_Awaken"), 99)
	end

	local flag = 0
	local unit1 = global.FriendUnits(_env, global.COL_OF(_env, actor) * global.BACK_OF(_env, actor, true) * global.NEIGHBORS_OF(_env, actor))
	local unit2 = global.FriendUnits(_env, global.COL_OF(_env, actor) * global.BACK_OF(_env, actor, true) - global.NEIGHBORS_OF(_env, actor))

	if unit1[1] and global.PETS - global.SUMMONS - global.MARKED(_env, "DAGUN") - global.MARKED(_env, "SummonedNian")(_env, unit1[1]) and flag == 0 then
		local buff = global.DamageTransferEffect(_env, actor, DownFactor)

		global.ApplyBuff(_env, unit1[1], {
			timing = 0,
			display = "Hudun_hskji",
			group = "Skill_FTLEShi_Passive_Awaken_DamageTransfer",
			duration = 99,
			limit = 1,
			tags = {
				"STATUS",
				"NUMERIC",
				"Skill_FTLEShi_Passive_Awaken",
				"UNDISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buff
		})

		flag = 1
	elseif unit2[1] and global.PETS - global.SUMMONS - global.MARKED(_env, "DAGUN") - global.MARKED(_env, "SummonedNian")(_env, unit2[1]) and flag == 0 then
		local buff = global.DamageTransferEffect(_env, actor, DownFactor)

		global.ApplyBuff(_env, unit2[1], {
			timing = 0,
			display = "Hudun_hskji",
			group = "Skill_FTLEShi_Passive_Awaken_DamageTransfer",
			duration = 99,
			limit = 1,
			tags = {
				"STATUS",
				"NUMERIC",
				"Skill_FTLEShi_Passive_Awaken",
				"UNDISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buff
		})

		flag = 1
	end
end

return _M
