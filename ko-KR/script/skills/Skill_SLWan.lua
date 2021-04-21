local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SLWan_Normal = {
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
			900
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
			533
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)
			local RealDamageFactor = global.SpecialPropGetter(_env, "Skill_SLWan_Passive")(_env, _env.ACTOR)
			damage.val = damage.val * (1 - RealDamageFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
			global.DelayCall(_env, 120, global.ApplyRealDamage, _env.ACTOR, _env.TARGET, 1, 1, this.dmgFactor[2] * RealDamageFactor, 0, 0, damage)
		end)

		return _env
	end
}
all.Skill_SLWan_Proud = {
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
			"Hero_Proud_SLWan"
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
				-1,
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
			local RealDamageFactor = global.SpecialPropGetter(_env, "Skill_SLWan_Passive")(_env, _env.ACTOR)
			damage.val = damage.val * (1 - RealDamageFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				433
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
			global.DelayCall(_env, 120, global.ApplyRealDamage, _env.ACTOR, _env.TARGET, 1, 2, this.dmgFactor[2] * RealDamageFactor, {
				0,
				433
			}, {
				0.5,
				0.5
			}, damage)
		end)

		return _env
	end
}
all.Skill_SLWan_Unique = {
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
				5.5,
				0
			}
		end

		this.RageSpdFactor = externs.RageSpdFactor

		if this.RageSpdFactor == nil then
			this.RageSpdFactor = 35
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2933
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SLWan"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:BUFF_APPLYED"
		}, passive)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[schedule_in_cycles]"](this, {
			1000
		}, passive2)

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
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)

			if global.INSTATUS(_env, "SLWan_Charged")(_env, _env.ACTOR) then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "STATUS", "SLWan_Prepare", "UNDISPELLABLE", "UNSTEALABLE"), 1)
			end
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)

			if global.INSTATUS(_env, "SLWan_Charged")(_env, _env.ACTOR) then
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
				global.HarmTargetView(_env, _env.units)
			else
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3_1"))
			end

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "SLWan_Charged")(_env, _env.ACTOR) then
				for _, unit in global.__iter__(_env.units) do
					global.ApplyStatusEffect(_env, _env.ACTOR, unit)
					global.ApplyRPEffect(_env, _env.ACTOR, unit)

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
					local RealDamageFactor = global.SpecialPropGetter(_env, "Skill_SLWan_Passive")(_env, _env.ACTOR)
					damage.val = damage.val * (1 - RealDamageFactor)

					global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
					global.DelayCall(_env, 120, global.ApplyRealDamage, _env.ACTOR, unit, 2, 1, this.dmgFactor[2] * RealDamageFactor, 0, 0, damage)
				end
			else
				local buff = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"SLWan_Prepare",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end
		end)
		exec["@time"]({
			2300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "SLWan_Charged")(_env, _env.ACTOR) then
				global.SwitchActionTo(_env, "die", "die")
				global.SwitchActionTo(_env, "down", "down")
				global.SwitchActionTo(_env, "hurt1", "hurt1")
				global.SwitchActionTo(_env, "run", "run")
				global.SwitchActionTo(_env, "stand", "stand")
				global.SwitchActionTo(_env, "win", "win")
				global.RemoveStatus(_env, _env.ACTOR, "SLWan_Charged")
			else
				global.AddStatus(_env, _env.ACTOR, "SLWan_Charged")
				global.SwitchActionTo(_env, "die", "die_1")
				global.SwitchActionTo(_env, "down", "down_1")
				global.SwitchActionTo(_env, "hurt1", "hurt1_1")
				global.SwitchActionTo(_env, "run", "run_1")
				global.SwitchActionTo(_env, "stand", "stand_1")
				global.SwitchActionTo(_env, "win", "win_1")
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			2900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end,
	passive = function (_env, externs)
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

			if global.BuffIsMatched(_env, _env.buff, "FREEZE") or global.BuffIsMatched(_env, _env.buff, "DAZE") or global.BuffIsMatched(_env, _env.buff, "MUTE") then
				global.SwitchActionTo(_env, "die", "die")
				global.SwitchActionTo(_env, "down", "down")
				global.SwitchActionTo(_env, "hurt1", "hurt1")
				global.SwitchActionTo(_env, "run", "run")
				global.SwitchActionTo(_env, "stand", "stand")
				global.SwitchActionTo(_env, "win", "win")
				global.RemoveStatus(_env, _env.ACTOR, "SLWan_Charged")
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "STATUS", "SLWan_Prepare", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RageSpdFactor)
			end
		end)

		return _env
	end
}
all.Skill_SLWan_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RatioFactor = externs.RatioFactor

		if this.RatioFactor == nil then
			this.RatioFactor = 0.25
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

		return this
	end,
	passive1 = function (_env, externs)
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
			local buff = global.SpecialNumericEffect(_env, "+Skill_SLWan_Passive", {
				"+Normal",
				"+Normal"
			}, this.RatioFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"Skill_SLWan_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
		end)

		return _env
	end
}
all.Skill_SLWan_Passive_Key = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 500
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive2)

		return this
	end,
	passive1 = function (_env, externs)
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
			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"Skill_SLWan_Passive_Key",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
		end)

		return _env
	end,
	passive2 = function (_env, externs)
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "STATUS", "Skill_SLWan_Passive_Key", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RpFactor)
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "STATUS", "Skill_SLWan_Passive_Key", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_SLWan_Proud_EX = {
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

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 100
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SLWan"
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
				-1,
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
			local RealDamageFactor = global.SpecialPropGetter(_env, "Skill_SLWan_Passive")(_env, _env.ACTOR)
			damage.val = damage.val * (1 - RealDamageFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				433
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
			global.DelayCall(_env, 120, global.ApplyRealDamage, _env.ACTOR, _env.TARGET, 1, 2, this.dmgFactor[2] * RealDamageFactor, {
				0,
				433
			}, {
				0.5,
				0.5
			}, damage)

			if global.INSTATUS(_env, "SLWan_Charged")(_env, _env.ACTOR) then
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RpFactor)
			end
		end)

		return _env
	end
}
all.Skill_SLWan_Unique_EX = {
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
				7,
				0
			}
		end

		this.RageSpdFactor = externs.RageSpdFactor

		if this.RageSpdFactor == nil then
			this.RageSpdFactor = 50
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2933
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SLWan"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:BUFF_APPLYED"
		}, passive)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[schedule_in_cycles]"](this, {
			1000
		}, passive2)

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
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)

			if global.INSTATUS(_env, "SLWan_Charged")(_env, _env.ACTOR) then
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "STATUS", "SLWan_Prepare", "UNDISPELLABLE", "UNSTEALABLE"), 1)
			end
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)

			if global.INSTATUS(_env, "SLWan_Charged")(_env, _env.ACTOR) then
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
				global.HarmTargetView(_env, _env.units)
			else
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3_1"))
			end

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "SLWan_Charged")(_env, _env.ACTOR) then
				for _, unit in global.__iter__(_env.units) do
					global.ApplyStatusEffect(_env, _env.ACTOR, unit)
					global.ApplyRPEffect(_env, _env.ACTOR, unit)

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
					local RealDamageFactor = global.SpecialPropGetter(_env, "Skill_SLWan_Passive")(_env, _env.ACTOR)
					damage.val = damage.val * (1 - RealDamageFactor)

					global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
					global.DelayCall(_env, 120, global.ApplyRealDamage, _env.ACTOR, unit, 2, 1, this.dmgFactor[2] * RealDamageFactor, 0, 0, damage)
				end
			else
				local buff = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"SLWan_Prepare",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end
		end)
		exec["@time"]({
			2300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "SLWan_Charged")(_env, _env.ACTOR) then
				global.SwitchActionTo(_env, "die", "die")
				global.SwitchActionTo(_env, "down", "down")
				global.SwitchActionTo(_env, "hurt1", "hurt1")
				global.SwitchActionTo(_env, "run", "run")
				global.SwitchActionTo(_env, "stand", "stand")
				global.SwitchActionTo(_env, "win", "win")
				global.RemoveStatus(_env, _env.ACTOR, "SLWan_Charged")
			else
				global.AddStatus(_env, _env.ACTOR, "SLWan_Charged")
				global.SwitchActionTo(_env, "die", "die_1")
				global.SwitchActionTo(_env, "down", "down_1")
				global.SwitchActionTo(_env, "hurt1", "hurt1_1")
				global.SwitchActionTo(_env, "run", "run_1")
				global.SwitchActionTo(_env, "stand", "stand_1")
				global.SwitchActionTo(_env, "win", "win_1")
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			2900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end,
	passive = function (_env, externs)
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

			if global.BuffIsMatched(_env, _env.buff, "FREEZE") or global.BuffIsMatched(_env, _env.buff, "DAZE") or global.BuffIsMatched(_env, _env.buff, "MUTE") then
				global.SwitchActionTo(_env, "die", "die")
				global.SwitchActionTo(_env, "down", "down")
				global.SwitchActionTo(_env, "hurt1", "hurt1")
				global.SwitchActionTo(_env, "run", "run")
				global.SwitchActionTo(_env, "stand", "stand")
				global.SwitchActionTo(_env, "win", "win")
				global.RemoveStatus(_env, _env.ACTOR, "SLWan_Charged")
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "STATUS", "SLWan_Prepare", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RageSpdFactor)
			end
		end)

		return _env
	end
}
all.Skill_SLWan_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RatioFactor = externs.RatioFactor

		if this.RatioFactor == nil then
			this.RatioFactor = 0.35
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)

		return this
	end,
	passive1 = function (_env, externs)
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
			local buff = global.SpecialNumericEffect(_env, "+Skill_SLWan_Passive", {
				"+Normal",
				"+Normal"
			}, this.RatioFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"Skill_SLWan_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
		end)

		return _env
	end
}

return _M
