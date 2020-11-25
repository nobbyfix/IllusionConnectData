local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_Enemy_YLJSi_Normal = {
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
				-1.7,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
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
all.Skill_Enemy_YLJSi_Proud = {
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

		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

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

		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))

			for _, Eunit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env), "<", global.UnitPropGetter(_env, "hp")), 1, 1)) do
				global.AssignRoles(_env, Eunit, "target")
			end
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, Funit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, Funit, this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, Funit, heal)
			end

			for _, Eunit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env), "<", global.UnitPropGetter(_env, "hp")), 1, 1)) do
				global.AssignRoles(_env, Eunit, "target")
				global.ApplyStatusEffect(_env, _env.ACTOR, Eunit)
				global.ApplyRPEffect(_env, _env.ACTOR, Eunit)

				local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, Eunit, this.dmgFactor)

				global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, Eunit, damage)
			end
		end)

		return _env
	end
}
all.Skill_Enemy_YLJSi_Skill_Summon = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
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
		this.main = global["[duration]"](this, {
			1267
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

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
		end)
		exec["@time"]({
			1100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local SummonedYLJSi_Heal = global.Summon(_env, _env.ACTOR, "SummonedYLJSi_Heal", this.summonFactorA, nil, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9
			})
			local SummonedYLJSi_AOE = global.Summon(_env, _env.ACTOR, "SummonedYLJSi_AOE", this.summonFactorB, nil, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9
			})
		end)
		exec["@time"]({
			1267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_Enemy_YLJSi_Skill_Heal = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1267
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

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))

			_env.Funits = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 3)

			for _, unit in global.__iter__(_env.Funits) do
				global.AssignRoles(_env, unit, "target")
			end

			global.HealTargetView(_env, _env.Funits)
		end)
		exec["@time"]({
			1100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, Funit in global.__iter__(_env.Funits) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, Funit, this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, Funit, heal)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, Funit, {
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
		end)
		exec["@time"]({
			1267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_Enemy_YLJSi_Skill_AOE = {
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
			1267
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

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))

			_env.units = global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env), "<", global.UnitPropGetter(_env, "hp")), 1, 3)

			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			1267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_Enemy_YLJSi_Skill_Friend = {
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

		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1267
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

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))

			_env.units = global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env), "<", global.UnitPropGetter(_env, "hp")), 1, 3)

			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, Funit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 3)) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, Funit, this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, Funit, heal)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, Funit, {
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

			for _, Eunit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env), "<", global.UnitPropGetter(_env, "hp")), 1, 3)) do
				global.ApplyStatusEffect(_env, _env.ACTOR, Eunit)
				global.ApplyRPEffect(_env, _env.ACTOR, Eunit)

				local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, Eunit, this.dmgFactor)

				global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, Eunit, damage)
			end
		end)
		exec["@time"]({
			1267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_Enemy_YLJSi_Passive = {
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
