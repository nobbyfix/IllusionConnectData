local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_TJHDe_Normal = {
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
all.Skill_TJHDe_Proud = {
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
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ALL")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local buffeft1 = global.ShieldEffect(_env, attacker.maxHp * 0.06 * (1 + global.ShieldStrgFactor(_env, attacker)))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 2,
				display = "Shield",
				tags = {
					"NUMERIC",
					"BUFF",
					"DEFUP",
					"SHIELD",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_TJHDe_Unique = {
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
			"1#Hero_Unique_TJHDe"
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
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ALL")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local buffeft1 = global.MaxHpEffect(_env, attacker.maxHp * 0.25 * (1 + global.NumBuffStrgFactor(_env, attacker)))
			local buffeft2 = global.NumericEffect(_env, "-atkrate", {
				"+Normal",
				"+Normal"
			}, 0.15)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 3,
				display = "MaxHpUp",
				tags = {
					"NUMERIC",
					"BUFF",
					"DEBUFF",
					"MAXHPUP",
					"ATKDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_TJHDe_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.buffFactorDefRate = externs.buffFactorDefRate

		assert(this.buffFactorDefRate ~= nil, "External variable `buffFactorDefRate` is not provided.")

		this.buffFactorDefEx = externs.buffFactorDefEx

		assert(this.buffFactorDefEx ~= nil, "External variable `buffFactorDefEx` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:HURTED"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.detail = externs.detail

		assert(_env.detail ~= nil, "External variable `detail` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.ProbTest(_env, 0.25) then
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ALL")
				local buffeft1 = global.NumericEffect(_env, "+def", {
					"+Normal",
					"+Normal"
				}, global.BuffFactorAtk(_env, _env.ACTOR, this.buffFactorDefRate, this.buffFactorDefEx) * (1 + global.NumBuffStrgFactor(_env, attacker)))

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 1,
					display = "DefUp",
					group = "Skill_TJHDe_Passive",
					duration = 3,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"DEFUP",
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
all.Skill_TJHDe_Proud_EX = {
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
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ALL")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local buffeft1 = global.ShieldEffect(_env, attacker.maxHp * 0.06 * (1 + global.ShieldStrgFactor(_env, attacker)))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 2,
				display = "Shield",
				tags = {
					"NUMERIC",
					"BUFF",
					"DEFUP",
					"SHIELD",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_TJHDe_Unique_EX = {
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
			"1#Hero_Unique_TJHDe"
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
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ALL")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local buffeft1 = global.MaxHpEffect(_env, attacker.maxHp * 0.25 * (1 + global.NumBuffStrgFactor(_env, attacker)))
			local buffeft2 = global.NumericEffect(_env, "-atkrate", {
				"+Normal",
				"+Normal"
			}, 0.15)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 3,
				display = "MaxHpUp",
				tags = {
					"NUMERIC",
					"BUFF",
					"DEBUFF",
					"MAXHPUP",
					"ATKDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_TJHDe_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.buffFactorDefRate = externs.buffFactorDefRate

		assert(this.buffFactorDefRate ~= nil, "External variable `buffFactorDefRate` is not provided.")

		this.buffFactorDefEx = externs.buffFactorDefEx

		assert(this.buffFactorDefEx ~= nil, "External variable `buffFactorDefEx` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:HURTED"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.detail = externs.detail

		assert(_env.detail ~= nil, "External variable `detail` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.ProbTest(_env, 0.25) then
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ALL")
				local buffeft1 = global.NumericEffect(_env, "+def", {
					"+Normal",
					"+Normal"
				}, global.BuffFactorAtk(_env, _env.ACTOR, this.buffFactorDefRate, this.buffFactorDefEx) * (1 + global.NumBuffStrgFactor(_env, attacker)))

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 1,
					display = "DefUp",
					group = "Skill_TJHDe_Passive",
					duration = 3,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"DEFUP",
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

return _M
