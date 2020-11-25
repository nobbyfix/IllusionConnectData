local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_Enemy_YLMNYi_Normal = {
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
			600
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
all.Skill_Enemy_YLMNYi_Proud = {
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
			934
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.TARGET) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET)
				local buffeft2 = global.HPPeriodDamage(_env, "Poison", maxHp * 0.05)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
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
				}, 1, 0)
				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					duration = 2,
					group = "Poison",
					timing = 1,
					limit = 10,
					tags = {
						"STATUS",
						"DEBUFF",
						"POISON",
						"DISPELLABLE"
					}
				}, {
					buffeft2
				}, 1, 0)
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				400
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
		end)

		return _env
	end
}
all.Skill_Enemy_YLMNYi_Skill = {
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
			1100
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

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-0.7,
				0
			}, 100, "skill2"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.TARGET) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET)
				local buffeft2 = global.HPPeriodDamage(_env, "Poison", maxHp * 0.05)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
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
				}, 1, 0)
				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					duration = 2,
					group = "Poison",
					timing = 1,
					limit = 10,
					tags = {
						"STATUS",
						"DEBUFF",
						"POISON",
						"DISPELLABLE"
					}
				}, {
					buffeft2
				}, 1, 0)
				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					duration = 2,
					group = "Poison",
					timing = 1,
					limit = 10,
					tags = {
						"STATUS",
						"DEBUFF",
						"POISON",
						"DISPELLABLE"
					}
				}, {
					buffeft2
				}, 1, 0)
				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					duration = 2,
					group = "Poison",
					timing = 1,
					limit = 10,
					tags = {
						"STATUS",
						"DEBUFF",
						"POISON",
						"DISPELLABLE"
					}
				}, {
					buffeft2
				}, 1, 0)
				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					duration = 2,
					group = "Poison",
					timing = 1,
					limit = 10,
					tags = {
						"STATUS",
						"DEBUFF",
						"POISON",
						"DISPELLABLE"
					}
				}, {
					buffeft2
				}, 1, 0)
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				200,
				500
			}, global.SplitValue(_env, damage, {
				0.3,
				0.3,
				0.4
			}))
		end)
		exec["@time"]({
			1100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_Enemy_YLMNYi_Passive = {
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

return _M
