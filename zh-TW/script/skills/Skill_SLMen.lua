local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SLMen_Normal = {
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
		main = global["[duration]"](this, {
			934
		}, main)
		this.main = global["[load]"](this, {
			"Movie_SLMen_Skill1_F",
			"Movie_SLMen_Skill1_B"
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

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill1"))

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
				local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				if global.PETS - global.SUMMONS(_env, unit) and result and result.deadly then
					local AtkRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local CritRateFactor = global.SpecialPropGetter(_env, "specialnum2")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, AtkRateFactor)
					local buffeft2 = global.NumericEffect(_env, "+critrate", {
						"+Normal",
						"+Normal"
					}, CritRateFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 2,
						display = "AtkUp",
						group = "Skill_SLMen_Passive",
						duration = 5,
						limit = 5,
						tags = {
							"NUMERIC",
							"BUFF",
							"DISPELLABLE",
							"STEALABLE"
						}
					}, {
						buffeft1,
						buffeft2
					})
				end
			end
		end)

		return _env
	end
}
all.Skill_SLMen_Proud = {
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
			1267
		}, main)
		main = global["[proud]"](this, {
			"Hero_Proud_SLMen"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_SLMen_Skill2"
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
		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil) + {
				-0.7,
				0
			}, 100, "skill2"))

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
				local result = global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
					0,
					100,
					200
				}, global.SplitValue(_env, damage, {
					0.33,
					0.33,
					0.34
				}))
			end
		end)

		return _env
	end
}
all.Skill_SLMen_Unique = {
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

		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3534
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_SLMen"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_SLMen_Skill3"
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
			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

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
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if global.MARKED(_env, "SUMMONED")(_env, unit) then
					damage.val = damage.val * this.RateFactor
				end

				local result = global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
					0,
					300,
					600,
					900,
					1200
				}, global.SplitValue(_env, damage, {
					0.2,
					0.2,
					0.2,
					0.2,
					0.2
				}))
			end
		end)
		exec["@time"]({
			3534
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_SLMen_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_ENTER"
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

		_env.num = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.PETS)) do
				_env.num = _env.num + 1
			end

			local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor * _env.num)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				duration = 99,
				group = "Skill_SLMen_Passive",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"HURTRATEUP",
					"Skill_SLMen_Passive",
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
all.Skill_SLMen_Proud_EX = {
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
			1267
		}, main)
		main = global["[proud]"](this, {
			"Hero_Proud_SLMen"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_SLMen_Skill2"
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
		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil) + {
				-0.7,
				0
			}, 100, "skill2"))

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			600
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
					"STATUS",
					"NUMERIC",
					"BUFF",
					"ATKUP",
					"CRITRATEUP",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
				local result = global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
					0,
					100,
					200
				}, global.SplitValue(_env, damage, {
					0.33,
					0.33,
					0.34
				}))
			end
		end)

		return _env
	end
}
all.Skill_SLMen_Unique_EX = {
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

		this.RateFactor = externs.RateFactor

		assert(this.RateFactor ~= nil, "External variable `RateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3534
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_SLMen"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_SLMen_Skill3"
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
			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

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
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if global.MARKED(_env, "SUMMONED")(_env, unit) then
					damage.val = damage.val * this.RateFactor
				end

				local result = global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
					0,
					300,
					600,
					900,
					1200
				}, global.SplitValue(_env, damage, {
					0.2,
					0.2,
					0.2,
					0.2,
					0.2
				}))
			end
		end)
		exec["@time"]({
			3534
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_SLMen_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_ENTER"
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

		_env.num = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.PETS)) do
				_env.num = _env.num + 1
			end

			local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor * _env.num)
			local buffeft2 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor * _env.num)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				duration = 99,
				group = "Skill_SLMen_Passive_EX",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"HURTRATEUP",
					"Skill_SLMen_Passive_EX",
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
