local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_KMLa_Normal = {
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
			1570
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
				-0.7,
				0
			}, 200, "skill1"))
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_KMLa_Proud = {
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
			1570
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

		_env.damageextra = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 200, "skill2"))
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "ALL")

			if global.PETS(_env, _env.TARGET) then
				local buffeft1 = global.NumericEffect(_env, "+defweaken", {
					"+Normal",
					"+Normal"
				}, 0.2 * (1 + global.NumBuffStrgFactor(_env, attacker)))

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 1,
					display = "DefWeakenUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"DEFWEAKENUP",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})

				_env.damageextra = 0.06
			end

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)
			damage.val = damage.val + _env.damageextra * defender.maxHp

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_KMLa_Unique = {
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
			4000
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_KMLa"
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

		_env.damageextra = 0

		exec["@time"]({
			1000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 200, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			1400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "ALL")
			local buffeft1 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, 0.2 * (1 + global.NumBuffStrgFactor(_env, attacker)))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 2,
				display = "Absorption",
				tags = {
					"NUMERIC",
					"BUFF",
					"ATKUP",
					"ABSORPTIONUP",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})

			if global.PETS(_env, _env.TARGET) then
				local buffeft2 = global.NumericEffect(_env, "+defweaken", {
					"+Normal",
					"+Normal"
				}, 0.3 * (1 + global.NumBuffStrgFactor(_env, attacker)))

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 1,
					display = "DefWeakenUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"DEFWEAKENUP",
						"DISPELLABLE"
					}
				}, {
					buffeft2
				})

				_env.damageextra = 0.2
			end

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)
			damage.val = damage.val + _env.damageextra * defender.maxHp

			global.ApplyHPMultiDamage(_env, _env.TARGET, {
				0,
				300,
				1900
			}, global.SplitValue(_env, damage, {
				0.27,
				0.31,
				0.42
			}))
		end)

		return _env
	end
}
all.Skill_KMLa_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.buffFactorAtkRate = externs.buffFactorAtkRate

		assert(this.buffFactorAtkRate ~= nil, "External variable `buffFactorAtkRate` is not provided.")

		this.buffFactorAtkEx = externs.buffFactorAtkEx

		assert(this.buffFactorAtkEx ~= nil, "External variable `buffFactorAtkEx` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"SELF:UNIQUE_ACTION"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:ACTION"
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
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local buffeft1 = global.NumericEffect(_env, "+atk", {
				"+Normal",
				"+Normal"
			}, global.BuffFactorAtk(_env, _env.ACTOR, this.buffFactorAtkRate, this.buffFactorAtkEx) * (1 + global.NumBuffStrgFactor(_env, attacker)))
			local buffeft2 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, 0.02 * (1 + global.NumBuffStrgFactor(_env, attacker)))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				display = "AtkUp",
				group = "Skill_KMLa_Passive",
				duration = 3,
				limit = 3,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"AtkUP",
					"ABSORPTIONUP",
					"DISPELLABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})
		end)

		return _env
	end
}
all.Skill_KMLa_Proud_EX = {
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
			1570
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

		_env.damageextra = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 200, "skill2"))
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "ALL")

			if global.PETS(_env, _env.TARGET) then
				local buffeft1 = global.NumericEffect(_env, "+defweaken", {
					"+Normal",
					"+Normal"
				}, 0.2 * (1 + global.NumBuffStrgFactor(_env, attacker)))

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 1,
					display = "DefWeakenUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"DEFWEAKENUP",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})

				_env.damageextra = 0.06
			end

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)
			damage.val = damage.val + _env.damageextra * defender.maxHp

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_KMLa_Unique_EX = {
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
			4000
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_KMLa"
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

		_env.damageextra = 0

		exec["@time"]({
			1000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 200, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			1400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "ALL")
			local buffeft1 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, 0.2 * (1 + global.NumBuffStrgFactor(_env, attacker)))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 2,
				display = "Absorption",
				tags = {
					"NUMERIC",
					"BUFF",
					"ATKUP",
					"ABSORPTIONUP",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})

			if global.PETS(_env, _env.TARGET) then
				local buffeft2 = global.NumericEffect(_env, "+defweaken", {
					"+Normal",
					"+Normal"
				}, 0.3 * (1 + global.NumBuffStrgFactor(_env, attacker)))

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 1,
					display = "DefWeakenUp",
					tags = {
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"DEFWEAKENUP",
						"DISPELLABLE"
					}
				}, {
					buffeft2
				})

				_env.damageextra = 0.2
			end

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)
			damage.val = damage.val + _env.damageextra * defender.maxHp

			global.ApplyHPMultiDamage(_env, _env.TARGET, {
				0,
				300,
				1900
			}, global.SplitValue(_env, damage, {
				0.27,
				0.31,
				0.42
			}))
		end)

		return _env
	end
}
all.Skill_KMLa_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.buffFactorAtkRate = externs.buffFactorAtkRate

		assert(this.buffFactorAtkRate ~= nil, "External variable `buffFactorAtkRate` is not provided.")

		this.buffFactorAtkEx = externs.buffFactorAtkEx

		assert(this.buffFactorAtkEx ~= nil, "External variable `buffFactorAtkEx` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"SELF:UNIQUE_ACTION"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:ACTION"
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
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local buffeft1 = global.NumericEffect(_env, "+atk", {
				"+Normal",
				"+Normal"
			}, global.BuffFactorAtk(_env, _env.ACTOR, this.buffFactorAtkRate, this.buffFactorAtkEx) * (1 + global.NumBuffStrgFactor(_env, attacker)))
			local buffeft2 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, 0.02 * (1 + global.NumBuffStrgFactor(_env, attacker)))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				display = "AtkUp",
				group = "Skill_KMLa_Passive",
				duration = 3,
				limit = 3,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"AtkUP",
					"ABSORPTIONUP",
					"DISPELLABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})
		end)

		return _env
	end
}

return _M
