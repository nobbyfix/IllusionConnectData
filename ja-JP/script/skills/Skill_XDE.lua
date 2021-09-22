local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all

function all.XDE_Attack(_env, ProbRateFactor, HurtRateFactor)
	local this = _env.this
	local global = _env.global
	local units = global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "XDE_TARGET")))

	if global.ProbTest(_env, ProbRateFactor) and units[1] then
		global.CancelTargetView(_env)
		global.HarmTargetView(_env, units)
		global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil) + {
			-0.8,
			0
		}, 1, "skill3_2"))
		global.AnimForTrgt(_env, _env.ACTOR, {
			loop = 1,
			anim = "main_sufeidazhao",
			zOrder = "TopLayer",
			pos = {
				0.5,
				0.5
			}
		})
		global.Sound(_env, "Se_Skill_XDE_Particle_Hit_3", 1)

		if HurtRateFactor ~= 0 then
			local buff = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, HurtRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "HurtRateUp",
				group = "XDE_HurtRate",
				duration = 99,
				limit = 5,
				tags = {
					"NUMERIC",
					"BUFF",
					"HURTRATEUP",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			}, 1, 0)
		end

		local i = 1

		for _, unit in global.__iter__(units) do
			i = i + 1

			global.ApplyStatusEffect(_env, _env.ACTOR, unit)
			global.ApplyRPEffect(_env, _env.ACTOR, unit)

			local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

			global.DelayCall(_env, i * 66, global.ApplyAOEHPDamage_ResultCheck, _env.ACTOR, unit, damage)
		end
	else
		global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil) + {
			-0.8,
			0
		}, 1, "skill3_3"))

		for _, unit in global.__iter__(global.EnemyUnits(_env)) do
			global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "XDE_TARGET"), 99)
		end

		global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		global.DelayCall(_env, 200, global.Stop)
	end
end

all.Skill_XDE_Normal = {
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
			1066
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
				-1.8,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			833
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
all.Skill_XDE_Proud = {
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
			1267
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XDE"
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			766
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				200,
				500
			}, global.SplitValue(_env, damage, {
				0.25,
				0.25,
				0.5
			}))
		end)

		return _env
	end
}
all.Skill_XDE_Unique = {
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
				2.7,
				0
			}
		end

		this.ProbRateFactor = externs.ProbRateFactor

		if this.ProbRateFactor == nil then
			this.ProbRateFactor = 0.5
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3100
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XDE"
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

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.RetainObject(_env, unit)

				local buff = global.NumericEffect(_env, "+def", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					tags = {
						"XDE_TARGET"
					}
				}, {
					buff
				})
			end

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "XDE_TARGET")))

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.13, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil) + {
				-0.8,
				0
			}, 100, "skill3_1"))

			for _, unit in global.__iter__(units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for k = 1, 4 do
				local prob = 1

				if k ~= 1 then
					prob = this.ProbRateFactor
				end

				global.DelayCall(_env, (k - 1) * 233, global.XDE_Attack, prob, 0)
			end
		end)
		exec["@time"]({
			3050
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "XDE_TARGET"), 99)
			end

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XDE_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ProbRateFactor = externs.ProbRateFactor

		if this.ProbRateFactor == nil then
			this.ProbRateFactor = 0.5
		end

		this.Num = externs.Num

		if this.Num == nil then
			this.Num = 1
		end

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

			if global.SpecialPropGetter(_env, "XDE_Passive")(_env, global.FriendField(_env)) == 0 then
				local buff_check = global.SpecialNumericEffect(_env, "+XDE_Passive", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"XDE_Passive_Check"
					}
				}, {
					buff_check
				})

				if global.ProbTest(_env, this.ProbRateFactor) then
					global.Sound(_env, "Se_Skill_XDE_Cat_Leave", 1)
					global.Flee(_env, 1000, _env.ACTOR, true)
				else
					local units = global.RandomN(_env, this.Num, global.EnemyUnits(_env, global.PETS - global.SUMMONS - global.MARKED(_env, "DAGUN") - global.HASSTATUS(_env, "CANNOT_BACK_TO_CARD")))

					for _, unit in global.__iter__(units) do
						global.Flee(_env, 1000, unit, true)
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_XDE_Proud_EX = {
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
				2,
				0
			}
		end

		this.SkillRateFactor = externs.SkillRateFactor

		if this.SkillRateFactor == nil then
			this.SkillRateFactor = 0.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1267
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XDE"
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
				-1.8,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			766
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				200,
				500
			}, global.SplitValue(_env, damage, {
				0.25,
				0.25,
				0.5
			}))

			local buffeft = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, this.SkillRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "Skill_XDE_Proud_EX",
				timing = 0,
				limit = 5,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft
			})
		end)

		return _env
	end
}
all.Skill_XDE_Unique_EX = {
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
				3.35,
				0
			}
		end

		this.ProbRateFactor = externs.ProbRateFactor

		if this.ProbRateFactor == nil then
			this.ProbRateFactor = 0.5
		end

		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3100
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XDE"
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

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.RetainObject(_env, unit)

				local buff = global.NumericEffect(_env, "+def", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					tags = {
						"XDE_TARGET"
					}
				}, {
					buff
				})
			end

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "XDE_TARGET")))

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.13, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil) + {
				-0.8,
				0
			}, 100, "skill3_1"))

			for _, unit in global.__iter__(units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for k = 1, 4 do
				local prob = 1

				if k ~= 1 then
					prob = this.ProbRateFactor
				end

				global.DelayCall(_env, (k - 1) * 233, global.XDE_Attack, prob, this.HurtRateFactor)
			end
		end)
		exec["@time"]({
			3050
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "XDE_TARGET"), 99)
			end

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XDE_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ProbRateFactor = externs.ProbRateFactor

		if this.ProbRateFactor == nil then
			this.ProbRateFactor = 0.5
		end

		this.Num = externs.Num

		if this.Num == nil then
			this.Num = 2
		end

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

			if global.SpecialPropGetter(_env, "XDE_Passive")(_env, global.FriendField(_env)) == 0 then
				local buff_check = global.SpecialNumericEffect(_env, "+XDE_Passive", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"XDE_Passive_Check"
					}
				}, {
					buff_check
				})

				if global.ProbTest(_env, this.ProbRateFactor) then
					global.Sound(_env, "Se_Skill_XDE_Cat_Leave", 1)
					global.Flee(_env, 1000, _env.ACTOR, true)
				else
					local units = global.RandomN(_env, this.Num, global.EnemyUnits(_env, global.PETS - global.SUMMONS - global.MARKED(_env, "DAGUN") - global.HASSTATUS(_env, "CANNOT_BACK_TO_CARD")))

					for _, unit in global.__iter__(units) do
						global.Flee(_env, 1000, unit, true)
					end
				end
			end
		end)

		return _env
	end
}

return _M
