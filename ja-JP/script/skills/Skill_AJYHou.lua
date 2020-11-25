local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_AJYHou_Normal = {
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
all.Skill_AJYHou_Proud = {
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

		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.CROSS_OF(_env, _env.TARGET))

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

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")

				local defender = global.LoadUnit(_env, unit, "DEFENDER")
				local damage = global.EvalAOEDamage(_env, attacker, defender, this.dmgFactor)

				global.ApplyDazeEffect(_env, _env.ACTOR, unit)
				global.ApplyDelRPEffect(_env, _env.ACTOR, unit)

				damage = global.CheckCtrlExDmg(_env, _env.ACTOR, unit, damage)

				global.ApplyHPDamage(_env, unit, damage)
			end
		end)

		return _env
	end
}
all.Skill_AJYHou_Unique = {
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
			"1#Hero_Unique_AJYHou"
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
		_env.count = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2) + {
				0.5,
				0
			}, 200, "skill3"))

			_env.units = global.EnemyUnits(_env, global.CROSS_OF(_env, _env.TARGET))

			global.HarmTargetView(_env, _env.units)
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")

				local defender = global.LoadUnit(_env, unit, "DEFENDER")
				local damage = global.EvalAOEDamage(_env, attacker, defender, this.dmgFactor)

				global.ApplyDazeEffect(_env, _env.ACTOR, unit)
				global.ApplyDelRPEffect(_env, _env.ACTOR, unit)

				damage = global.CheckCtrlExDmg(_env, _env.ACTOR, unit, damage)

				global.ApplyHPDamage(_env, unit, damage)

				if #_env.units > 2 then
					local count = 0.75
					local prob = global.EvalProb1(_env, attacker, defender, count, 0)

					if global.ProbTest(_env, prob) then
						local buffeft1 = global.Daze(_env)

						global.ApplyBuff(_env, unit, {
							timing = 1,
							duration = 1,
							display = "Daze",
							tags = {
								"STATUS",
								"DEBUFF",
								"DAZE",
								"DISPELLALBE"
							}
						}, {
							buffeft1
						})
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_AJYHou_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.buffFactorDotRate = externs.buffFactorDotRate

		assert(this.buffFactorDotRate ~= nil, "External variable `buffFactorDotRate` is not provided.")

		this.buffFactorDotEx = externs.buffFactorDotEx

		assert(this.buffFactorDotEx ~= nil, "External variable `buffFactorDotEx` is not provided.")

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

			for _, enemyunit in global.__iter__(global.RandomN(_env, 1, global.EnemyUnits(_env))) do
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local buffeft1 = global.HPPeriodDamage(_env, "Burning", global.BuffFactorDot(_env, _env.ACTOR, this.buffFactorDotRate, this.buffFactorDotEx))

				global.ApplyBuff(_env, enemyunit, {
					timing = 1,
					duration = 3,
					display = "Burning",
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
		end)

		return _env
	end
}
all.Skill_AJYHou_Proud_EX = {
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

		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.CROSS_OF(_env, _env.TARGET))

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

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")

				local defender = global.LoadUnit(_env, unit, "DEFENDER")
				local damage = global.EvalAOEDamage(_env, attacker, defender, this.dmgFactor)

				global.ApplyDazeEffect(_env, _env.ACTOR, unit)
				global.ApplyDelRPEffect(_env, _env.ACTOR, unit)

				damage = global.CheckCtrlExDmg(_env, _env.ACTOR, unit, damage)

				global.ApplyHPDamage(_env, unit, damage)
			end
		end)

		return _env
	end
}
all.Skill_AJYHou_Unique_EX = {
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
			"1#Hero_Unique_AJYHou"
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
		_env.count = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2) + {
				0.5,
				0
			}, 200, "skill3"))

			_env.units = global.EnemyUnits(_env, global.CROSS_OF(_env, _env.TARGET))

			global.HarmTargetView(_env, _env.units)
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")

				local defender = global.LoadUnit(_env, unit, "DEFENDER")
				local damage = global.EvalAOEDamage(_env, attacker, defender, this.dmgFactor)

				global.ApplyDazeEffect(_env, _env.ACTOR, unit)
				global.ApplyDelRPEffect(_env, _env.ACTOR, unit)

				damage = global.CheckCtrlExDmg(_env, _env.ACTOR, unit, damage)

				global.ApplyHPDamage(_env, unit, damage)

				if #_env.units > 2 then
					local count = 0.75
					local prob = global.EvalProb1(_env, attacker, defender, count, 0)

					if global.ProbTest(_env, prob) then
						local buffeft1 = global.Daze(_env)

						global.ApplyBuff(_env, unit, {
							timing = 1,
							duration = 1,
							display = "Daze",
							tags = {
								"STATUS",
								"DEBUFF",
								"DAZE",
								"DISPELLALBE"
							}
						}, {
							buffeft1
						})
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_AJYHou_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.buffFactorDotRate = externs.buffFactorDotRate

		assert(this.buffFactorDotRate ~= nil, "External variable `buffFactorDotRate` is not provided.")

		this.buffFactorDotEx = externs.buffFactorDotEx

		assert(this.buffFactorDotEx ~= nil, "External variable `buffFactorDotEx` is not provided.")

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

			for _, enemyunit in global.__iter__(global.RandomN(_env, 1, global.EnemyUnits(_env))) do
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local buffeft1 = global.HPPeriodDamage(_env, "Burning", global.BuffFactorDot(_env, _env.ACTOR, this.buffFactorDotRate, this.buffFactorDotEx))

				global.ApplyBuff(_env, enemyunit, {
					timing = 1,
					duration = 3,
					display = "Burning",
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
		end)

		return _env
	end
}

return _M
