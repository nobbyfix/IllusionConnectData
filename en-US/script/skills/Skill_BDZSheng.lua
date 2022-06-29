local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_BDZSheng_Normal = {
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
			800
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
			267
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
all.Skill_BDZSheng_Proud = {
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
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_BDZSheng"
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
			534
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
all.Skill_BDZSheng_Unique = {
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

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.15
		end

		this.RageSpdactor = externs.RageSpdactor

		if this.RageSpdactor == nil then
			this.RageSpdactor = 0.12
		end

		this.MaxHitFactor = externs.MaxHitFactor

		if this.MaxHitFactor == nil then
			this.MaxHitFactor = 3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3000
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_BDZSheng"
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
				-1,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2034
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.RageGainEffect(_env, "+", {
				"+Normal",
				"+Normal"
			}, this.RageSpdactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "RageGainUp",
				group = "BDZSheng_Unique",
				duration = 99,
				limit = 5,
				tags = {
					"NUMERIC",
					"BUFF",
					"RAGESPEEDUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})
			global.ShakeScreen(_env, {
				Id = 4,
				duration = 80,
				enhance = 5
			})

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local shield = global.UnitPropGetter(_env, "shield")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local max_realdamage = atk * this.MaxHitFactor
			local extra_damage = global.min(_env, shield, max_realdamage)

			if shield and shield ~= 0 then
				global.DelayCall(_env, 134, global.ApplyRealDamage, _env.ACTOR, _env.TARGET, 1, 1, 0, 0, 0, nil, extra_damage)
			end
		end)
		exec["@time"]({
			2800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_BDZSheng_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.2
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.2
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.ACTOR) == global.GetSide(_env, _env.unit) then
				if global.MARKED(_env, "WARRIOR")(_env, _env.unit) then
					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
					local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 0,
						duration = 99,
						display = "Shield",
						tags = {
							"BUFF",
							"SHIELD",
							"STATUS",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1
					})

					if global.FriendMaster(_env) then
						global.ApplyBuff(_env, global.FriendMaster(_env), {
							timing = 0,
							duration = 99,
							display = "Shield",
							tags = {
								"BUFF",
								"SHIELD",
								"STATUS",
								"DISPELLABLE",
								"STEALABLE"
							}
						}, {
							buffeft1
						})
					end
				elseif global.MARKED(_env, "HEALER")(_env, _env.unit) then
					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

					global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, _env.ACTOR, maxHp * this.HealRateFactor)

					local buffeft2 = global.NumericEffect(_env, "+defrate", {
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
						buffeft2
					})

					if global.FriendMaster(_env) then
						global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, global.FriendMaster(_env), maxHp * this.HealRateFactor)
						global.ApplyBuff(_env, global.FriendMaster(_env), {
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
			end
		end)

		return _env
	end
}
all.Skill_BDZSheng_Proud_EX = {
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
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_BDZSheng"
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
			534
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
all.Skill_BDZSheng_Unique_EX = {
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

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.25
		end

		this.RageSpdactor = externs.RageSpdactor

		if this.RageSpdactor == nil then
			this.RageSpdactor = 0.2
		end

		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.3
		end

		this.MaxHitFactor = externs.MaxHitFactor

		if this.MaxHitFactor == nil then
			this.MaxHitFactor = 3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3000
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_BDZSheng"
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
				-1,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2034
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
			local buffeft2 = global.RageGainEffect(_env, "+", {
				"+Normal",
				"+Normal"
			}, this.RageSpdactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "RageGainUp",
				group = "BDZSheng_Unique",
				duration = 99,
				limit = 5,
				tags = {
					"NUMERIC",
					"BUFF",
					"RAGESPEEDUP",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})
			global.ShakeScreen(_env, {
				Id = 4,
				duration = 80,
				enhance = 5
			})

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			local buffeft3 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

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
				buffeft3
			})

			local shield = global.UnitPropGetter(_env, "shield")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local max_realdamage = atk * this.MaxHitFactor
			local extra_damage = global.min(_env, shield, max_realdamage)

			if shield and shield ~= 0 then
				global.DelayCall(_env, 134, global.ApplyRealDamage, _env.ACTOR, _env.TARGET, 1, 1, 0, 0, 0, nil, extra_damage)
			end
		end)
		exec["@time"]({
			2800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_BDZSheng_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.3
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.3
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.ACTOR) == global.GetSide(_env, _env.unit) then
				if global.MARKED(_env, "WARRIOR")(_env, _env.unit) then
					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
					local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 0,
						duration = 99,
						display = "Shield",
						tags = {
							"BUFF",
							"SHIELD",
							"STATUS",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1
					})

					if global.FriendMaster(_env) then
						global.ApplyBuff(_env, global.FriendMaster(_env), {
							timing = 0,
							duration = 99,
							display = "Shield",
							tags = {
								"BUFF",
								"SHIELD",
								"STATUS",
								"DISPELLABLE",
								"STEALABLE"
							}
						}, {
							buffeft1
						})
					end
				elseif global.MARKED(_env, "HEALER")(_env, _env.unit) then
					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

					global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, _env.ACTOR, maxHp * this.HealRateFactor)

					local buffeft2 = global.NumericEffect(_env, "+defrate", {
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
						buffeft2
					})

					if global.FriendMaster(_env) then
						global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, global.FriendMaster(_env), maxHp * this.HealRateFactor)
						global.ApplyBuff(_env, global.FriendMaster(_env), {
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
			end
		end)

		return _env
	end
}

return _M
