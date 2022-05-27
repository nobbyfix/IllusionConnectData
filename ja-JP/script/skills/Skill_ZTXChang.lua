local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_ZTXChang_Normal = {
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

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.4,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			600
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
all.Skill_ZTXChang_Proud = {
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
			1600
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_ZTXChang"
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
				-1.3,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				300
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
		end)

		return _env
	end
}
all.Skill_ZTXChang_Unique = {
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

		this.HpDmgRateFactor = externs.HpDmgRateFactor

		assert(this.HpDmgRateFactor ~= nil, "External variable `HpDmgRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_ZTXChang"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_ZTXChang_Skill3"
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

		_env.petsextra = 0
		_env.exprob = 0

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
			global.AssignRoles(_env, _env.TARGET, "target")
			global.HarmTargetView(_env, {
				_env.TARGET
			})

			if global.INSTATUS(_env, "SecondTime")(_env, _env.ACTOR) then
				local selfmaxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPRecovery(_env, _env.ACTOR, selfmaxHp)
			end
		end)
		exec["@time"]({
			1700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			if global.PETS(_env, _env.TARGET) and not global.MARKED(_env, "SummonedNian")(_env, _env.TARGET) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET)
				_env.petsextra = maxHp * this.HpDmgRateFactor
				damage.val = damage.val + _env.petsextra
			end

			damage.val = global.BossDamage(_env, _env.ACTOR, _env.TARGET, damage.val)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				100,
				200,
				600
			}, global.SplitValue(_env, damage, {
				0.2,
				0.2,
				0.2,
				0.4
			}))
		end)
		exec["@time"]({
			2300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.PETS(_env, _env.TARGET) and not global.MARKED(_env, "SummonedNian")(_env, _env.TARGET) then
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ALL")
				local defender = global.LoadUnit(_env, _env.TARGET, "ALL")
				local OTKProb = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local prob = global.EvalProb1(_env, attacker, defender, OTKProb, 0)

				if global.ProbTest(_env, prob) then
					global.KillTarget(_env, _env.TARGET)
				end
			end
		end)
		exec["@time"]({
			3167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_ZTXChang_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.OTKProbFactor = externs.OTKProbFactor

		assert(this.OTKProbFactor ~= nil, "External variable `OTKProbFactor` is not provided.")

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+specialnum1", {
				"?Normal"
			}, this.OTKProbFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+specialnum2", {
				"?Normal"
			}, 0)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"Skill_ZTXChang_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1, 0)
		end)

		return _env
	end
}
all.Skill_ZTXChang_Unique_Awaken = {
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

		this.HpDmgRateFactor = externs.HpDmgRateFactor

		assert(this.HpDmgRateFactor ~= nil, "External variable `HpDmgRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			4850
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_ZTXChang"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_ZTXChang_Skill3"
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

		_env.petsextra = 0
		_env.exprob = 0
		_env.flag = 0
		_env.master = nil

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
			global.AssignRoles(_env, _env.TARGET, "target")
			global.HarmTargetView(_env, {
				_env.TARGET
			})

			if global.INSTATUS(_env, "SecondTime")(_env, _env.ACTOR) then
				local selfmaxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPRecovery(_env, _env.ACTOR, selfmaxHp)
			end
		end)
		exec["@time"]({
			1700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			if global.PETS(_env, _env.TARGET) and not global.MARKED(_env, "SummonedNian")(_env, _env.TARGET) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET)
				_env.petsextra = maxHp * this.HpDmgRateFactor
				damage.val = damage.val + _env.petsextra
			end

			damage.val = global.BossDamage(_env, _env.ACTOR, _env.TARGET, damage.val)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				100,
				200,
				600
			}, global.SplitValue(_env, damage, {
				0.2,
				0.2,
				0.2,
				0.4
			}))
		end)
		exec["@time"]({
			2300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.PETS(_env, _env.TARGET) and not global.MARKED(_env, "SummonedNian")(_env, _env.TARGET) then
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ALL")
				local defender = global.LoadUnit(_env, _env.TARGET, "ALL")
				local OTKProb = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local StepProbFactor = global.SpecialPropGetter(_env, "specialnum2")(_env, _env.ACTOR)

				if StepProbFactor and StepProbFactor ~= 0 then
					if defender.atk < attacker.atk then
						_env.exprob = global.floor(_env, (attacker.atk - defender.atk) * 20 / defender.atk) * StepProbFactor
					end

					local prob = global.EvalProb1(_env, attacker, defender, OTKProb + _env.exprob, 0)

					if global.ProbTest(_env, prob) then
						global.KillTarget(_env, _env.TARGET)

						_env.flag = 1
					end
				end
			end
		end)
		exec["@time"]({
			3167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag > 0 and global.EnemyMaster(_env) then
				_env.master = global.EnemyMaster(_env)

				global.HarmTargetView(_env, {
					_env.master
				})
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.master) + {
					-1.4,
					0
				}, 100, "skill3"))
				global.UnassignRoles(_env, _env.TARGET, "target")
				global.AssignRoles(_env, _env.master, "target")
				global.RetainObject(_env, _env.master)
			else
				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			3970
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.master)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.master)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.master, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.master, {
				0,
				100,
				200,
				600
			}, global.SplitValue(_env, damage, {
				0.2,
				0.2,
				0.2,
				0.4
			}))
		end)
		exec["@time"]({
			4837
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.master)
		end)

		return _env
	end
}
all.Skill_ZTXChang_Proud_EX = {
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

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1600
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_ZTXChang"
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
				-1.3,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			700
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
					"DISPELLABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				300
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
		end)

		return _env
	end
}
all.Skill_ZTXChang_Unique_EX = {
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

		this.HpDmgRateFactor = externs.HpDmgRateFactor

		assert(this.HpDmgRateFactor ~= nil, "External variable `HpDmgRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_ZTXChang"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_ZTXChang_Skill3"
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

		_env.petsextra = 0
		_env.exprob = 0

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
			global.AssignRoles(_env, _env.TARGET, "target")
			global.HarmTargetView(_env, {
				_env.TARGET
			})

			if global.INSTATUS(_env, "SecondTime")(_env, _env.ACTOR) then
				local selfmaxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPRecovery(_env, _env.ACTOR, selfmaxHp)
			end
		end)
		exec["@time"]({
			1700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			if global.PETS(_env, _env.TARGET) and not global.MARKED(_env, "SummonedNian")(_env, _env.TARGET) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.TARGET)
				_env.petsextra = maxHp * this.HpDmgRateFactor
				damage.val = damage.val + _env.petsextra
			end

			damage.val = global.BossDamage(_env, _env.ACTOR, _env.TARGET, damage.val)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				100,
				200,
				600
			}, global.SplitValue(_env, damage, {
				0.2,
				0.2,
				0.2,
				0.4
			}))
		end)
		exec["@time"]({
			2300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.PETS(_env, _env.TARGET) then
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ALL")
				local defender = global.LoadUnit(_env, _env.TARGET, "ALL")
				local OTKProb = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local StepProbFactor = global.SpecialPropGetter(_env, "specialnum2")(_env, _env.ACTOR)

				if StepProbFactor and StepProbFactor ~= 0 then
					if defender.atk < attacker.atk then
						_env.exprob = global.floor(_env, (attacker.atk - defender.atk) * 20 / defender.atk) * StepProbFactor
					end

					local prob = global.EvalProb1(_env, attacker, defender, OTKProb + _env.exprob, 0)

					if global.ProbTest(_env, prob) then
						global.KillTarget(_env, _env.TARGET)
					end
				end
			end
		end)
		exec["@time"]({
			3167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_ZTXChang_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.OTKProbFactor = externs.OTKProbFactor

		assert(this.OTKProbFactor ~= nil, "External variable `OTKProbFactor` is not provided.")

		this.StepProbFactor = externs.StepProbFactor

		assert(this.StepProbFactor ~= nil, "External variable `StepProbFactor` is not provided.")

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+specialnum1", {
				"?Normal"
			}, this.OTKProbFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+specialnum2", {
				"?Normal"
			}, this.StepProbFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"Skill_ZTXChang_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1, 0)
		end)

		return _env
	end
}

return _M
