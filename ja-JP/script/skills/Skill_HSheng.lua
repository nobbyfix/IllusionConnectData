local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_HSheng_Normal = {
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
			1200
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
			}, 200, "skill1"))
		end)
		exec["@time"]({
			800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_HSheng_Proud = {
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
			2000
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
			}, 200, "skill2"))
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)

			global.ApplyHPDamage(_env, _env.TARGET, damage)

			local buffeft1 = global.Mute(_env)

			global.ApplyBuff(_env, _env.TARGET, {
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
		end)

		return _env
	end
}
all.Skill_HSheng_Unique = {
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
		this.main = global["[cut_in]"](this, {
			"1#Hero_Uniqu_HSheng"
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
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 200, "skill3"))
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)

			global.ApplyHPDamage(_env, _env.TARGET, damage)

			for _, unit in global.__iter__(global.RandomN(_env, 3, global.EnemyUnits(_env))) do
				local buffeft1 = global.Mute(_env)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 2,
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
		end)

		return _env
	end
}
all.Skill_HSheng_Passive = {
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
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local buffeft1 = global.NumericEffect(_env, "+atk", {
				"+Normal",
				"+Normal"
			}, global.BuffFactorAtk(_env, _env.ACTOR, this.buffFactorAtkRate, this.buffFactorAtkEx) * (1 + global.NumBuffStrgFactor(_env, attacker)))
			local buffeft2 = global.NumericEffect(_env, "+effectrate", {
				"+Normal",
				"+Normal"
			}, 0.05)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 3,
				display = "AtkUp",
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"ATKUP",
					"EFFECTRATEUP",
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
all.Skill_HSheng_Proud_EX = {
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
			2000
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
			}, 200, "skill2"))
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)

			global.ApplyHPDamage(_env, _env.TARGET, damage)

			local buffeft1 = global.Mute(_env)

			global.ApplyBuff(_env, _env.TARGET, {
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
		end)

		return _env
	end
}
all.Skill_HSheng_Unique_EX = {
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
		this.main = global["[cut_in]"](this, {
			"1#Hero_Uniqu_HSheng"
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
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 200, "skill3"))
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)

			global.ApplyHPDamage(_env, _env.TARGET, damage)

			for _, unit in global.__iter__(global.RandomN(_env, 3, global.EnemyUnits(_env))) do
				local buffeft1 = global.Mute(_env)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 2,
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
		end)

		return _env
	end
}
all.Skill_HSheng_Passive_EX = {
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
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local buffeft1 = global.NumericEffect(_env, "+atk", {
				"+Normal",
				"+Normal"
			}, global.BuffFactorAtk(_env, _env.ACTOR, this.buffFactorAtkRate, this.buffFactorAtkEx) * (1 + global.NumBuffStrgFactor(_env, attacker)))
			local buffeft2 = global.NumericEffect(_env, "+effectrate", {
				"+Normal",
				"+Normal"
			}, 0.05)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 3,
				display = "AtkUp",
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"ATKUP",
					"EFFECTRATEUP",
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
