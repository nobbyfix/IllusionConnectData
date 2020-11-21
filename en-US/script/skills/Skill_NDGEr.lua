local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_NDGEr_Normal = {
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
			1000
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
all.Skill_NDGEr_Proud = {
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
			1367
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_NDGEr"
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
				-0.9,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			233
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
all.Skill_NDGEr_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		this.HotRateFactor = externs.HotRateFactor

		assert(this.HotRateFactor ~= nil, "External variable `HotRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2767
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_NDGEr"
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

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			_env.units = global.FriendUnits(_env)

			global.HealTargetView(_env, _env.units)
		end)
		exec["@time"]({
			1700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, unit, this.HealRateFactor, 0)

				if global.MASTER(_env, unit) then
					local ExCureRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)

					if ExCureRateFactor and ExCureRateFactor ~= 0 then
						local healer = global.LoadUnit(_env, _env.ACTOR, "ALL")
						local buffeft1 = global.HPPeriodRecover(_env, "HOT", healer.atk * this.HotRateFactor * (1 + ExCureRateFactor))

						global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
							timing = 1,
							duration = 3,
							display = "Hot",
							tags = {
								"STATUS",
								"BUFF",
								"HOT",
								"DISPELLABLE",
								"STEALABLE"
							}
						}, {
							buffeft1
						}, 1)

						heal.val = heal.val * (1 + ExCureRateFactor)
					end
				end

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, unit, heal)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, unit, {
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
			2767
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_NDGEr_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ExCureRateFactor = externs.ExCureRateFactor

		assert(this.ExCureRateFactor ~= nil, "External variable `ExCureRateFactor` is not provided.")

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
			}, this.ExCureRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "AtkUp",
				tags = {
					"STATUS",
					"NUMERIC",
					"Skill_NDGEr_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end
}
all.Skill_NDGEr_Proud_EX = {
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
			1367
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_NDGEr"
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
				-0.9,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			233
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
			global.DispelBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE"), 1)

			local buffeft3 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 2,
				duration = 1,
				display = "Dispel",
				tags = {
					"DISPEL",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft3
			})
		end)

		return _env
	end
}
all.Skill_NDGEr_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		this.HotRateFactor = externs.HotRateFactor

		assert(this.HotRateFactor ~= nil, "External variable `HotRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2767
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_NDGEr"
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

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			_env.units = global.FriendUnits(_env)

			global.HealTargetView(_env, _env.units)
		end)
		exec["@time"]({
			1700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, unit, this.HealRateFactor, 0)

				if global.MASTER(_env, unit) then
					local ExCureRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)

					if ExCureRateFactor and ExCureRateFactor ~= 0 then
						local healer = global.LoadUnit(_env, _env.ACTOR, "ALL")
						local buffeft1 = global.HPPeriodRecover(_env, "HOT", healer.atk * this.HotRateFactor * (1 + ExCureRateFactor))

						global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
							timing = 1,
							duration = 3,
							display = "Hot",
							tags = {
								"STATUS",
								"BUFF",
								"HOT",
								"DISPELLABLE",
								"STEALABLE"
							}
						}, {
							buffeft1
						}, 1)

						heal.val = heal.val * (1 + ExCureRateFactor)
					end
				end

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, unit, heal)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, unit, {
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
			2767
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_NDGEr_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ExCureRateFactor = externs.ExCureRateFactor

		assert(this.ExCureRateFactor ~= nil, "External variable `ExCureRateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

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
			}, this.ExCureRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+curerate", {
				"+Normal",
				"+Normal"
			}, this.CureRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"Skill_NDGEr_Passive_EX",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1)
		end)

		return _env
	end
}

return _M
