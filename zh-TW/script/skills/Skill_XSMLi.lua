local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_XSMLi_Normal = {
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
			967
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
				-1.6,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
			local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
				"+Normal",
				"+Normal"
			}, DeUnHurtRateFactor)

			global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
				timing = 0,
				display = "UnHurtRateDown",
				group = "Skill_XSMLi_Passive",
				duration = 99,
				limit = 3,
				tags = {
					"STATUS",
					"DEBUFF",
					"UNHURTRATEDOWN",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_XSMLi_Proud = {
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
			1870
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XSMLi"
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
			_env.units = global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env, global.PETS), ">", global.UnitPropGetter(_env, "hp")), 1, 1)

			if _env.units and _env.units[1] then
				for _, unit in global.__iter__(_env.units) do
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, unit) + {
						-1.7,
						0
					}, 100, "skill2"))

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				end
			else
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
					-1.7,
					0
				}, 100, "skill2"))
				global.AssignRoles(_env, _env.TARGET, "target")
			end
		end)
		exec["@time"]({
			1600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.units and _env.units[1] then
				for _, unit in global.__iter__(_env.units) do
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, unit)
					global.ApplyRPEffect(_env, _env.ACTOR, unit)

					local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
					local result = global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				end
			else
				local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
					"+Normal",
					"+Normal"
				}, DeUnHurtRateFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					timing = 0,
					display = "UnHurtRateDown",
					group = "Skill_XSMLi_Passive",
					duration = 99,
					limit = 3,
					tags = {
						"STATUS",
						"DEBUFF",
						"UNHURTRATEDOWN",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
				global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
				global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

				local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

				global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
			end
		end)

		return _env
	end
}
all.Skill_XSMLi_Unique = {
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
			3167
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_XSMLi"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_XSMLi_Skill3"
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

			_env.units = global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env, global.PETS), ">", global.UnitPropGetter(_env, "hp")), 1, 2)

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			if _env.units[2] then
				global.HarmTargetView(_env, _env.units)

				for _, unit in global.__iter__(_env.units) do
					global.AssignRoles(_env, unit, "target")
				end
			elseif _env.units[1] then
				for _, unit in global.__iter__(_env.units) do
					global.HarmTargetView(_env, _env.units)
					global.AssignRoles(_env, unit, "target")
				end

				if global.EnemyMaster(_env) then
					global.HarmTargetView(_env, {
						global.EnemyMaster(_env)
					})
					global.AssignRoles(_env, global.EnemyMaster(_env), "target")
				end
			else
				global.HarmTargetView(_env, {
					_env.TARGET
				})
				global.AssignRoles(_env, _env.TARGET, "target")
			end
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.units[2] then
				for _, unit in global.__iter__(_env.units) do
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, unit)
					global.ApplyRPEffect(_env, _env.ACTOR, unit)

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
					local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				end
			elseif _env.units[1] then
				for _, unit in global.__iter__(_env.units) do
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, unit)
					global.ApplyRPEffect(_env, _env.ACTOR, unit)

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
					local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				end

				if global.EnemyMaster(_env) then
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, global.EnemyMaster(_env), {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, global.EnemyMaster(_env))
					global.ApplyRPEffect(_env, _env.ACTOR, global.EnemyMaster(_env))

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, global.EnemyMaster(_env), this.dmgFactor)
					local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, global.EnemyMaster(_env), damage)
				end
			else
				local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
					"+Normal",
					"+Normal"
				}, DeUnHurtRateFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					timing = 0,
					display = "UnHurtRateDown",
					group = "Skill_XSMLi_Passive",
					duration = 99,
					limit = 3,
					tags = {
						"STATUS",
						"DEBUFF",
						"UNHURTRATEDOWN",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
				global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
				global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)
				local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
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
all.Skill_XSMLi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DeUnHurtRateFactor = externs.DeUnHurtRateFactor

		assert(this.DeUnHurtRateFactor ~= nil, "External variable `DeUnHurtRateFactor` is not provided.")

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+specialnum1", {
				"?Normal"
			}, this.DeUnHurtRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"Skill_XSMLi_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
		end)

		return _env
	end
}
all.Skill_XSMLi_Proud_EX = {
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

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1870
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XSMLi"
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
			_env.units = global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env, global.PETS), ">", global.UnitPropGetter(_env, "hp")), 1, 1)

			if _env.units and _env.units[1] then
				for _, unit in global.__iter__(_env.units) do
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, unit) + {
						-1.7,
						0
					}, 100, "skill2"))

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				end
			else
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
					-1.7,
					0
				}, 100, "skill2"))
				global.AssignRoles(_env, _env.TARGET, "target")
			end
		end)
		exec["@time"]({
			1600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbsorptionRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"ABSORPTIONUP",
					"CRITRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)

			if _env.units and _env.units[1] then
				for _, unit in global.__iter__(_env.units) do
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, unit)
					global.ApplyRPEffect(_env, _env.ACTOR, unit)

					local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
					local result = global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				end
			else
				local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
					"+Normal",
					"+Normal"
				}, DeUnHurtRateFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					timing = 0,
					display = "UnHurtRateDown",
					group = "Skill_XSMLi_Passive",
					duration = 99,
					limit = 3,
					tags = {
						"STATUS",
						"DEBUFF",
						"UNHURTRATEDOWN",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
				global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
				global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

				local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

				global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
			end
		end)

		return _env
	end
}
all.Skill_XSMLi_Unique_EX = {
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
			3167
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_XSMLi"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_XSMLi_Skill3"
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

			_env.units = global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env, global.PETS), ">", global.UnitPropGetter(_env, "hp")), 1, 3)

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			if _env.units[3] then
				global.HarmTargetView(_env, _env.units)

				for _, unit in global.__iter__(_env.units) do
					global.AssignRoles(_env, unit, "target")
				end
			elseif _env.units[2] then
				for _, unit in global.__iter__(_env.units) do
					global.HarmTargetView(_env, _env.units)
					global.AssignRoles(_env, unit, "target")
				end

				if global.EnemyMaster(_env) then
					global.HarmTargetView(_env, {
						global.EnemyMaster(_env)
					})
					global.AssignRoles(_env, global.EnemyMaster(_env), "target")
				end
			elseif _env.units[1] then
				for _, unit in global.__iter__(_env.units) do
					global.HarmTargetView(_env, _env.units)
					global.AssignRoles(_env, unit, "target")
				end

				if global.EnemyMaster(_env) then
					global.HarmTargetView(_env, {
						global.EnemyMaster(_env)
					})
					global.AssignRoles(_env, global.EnemyMaster(_env), "target")
				end
			else
				global.HarmTargetView(_env, {
					_env.TARGET
				})
				global.AssignRoles(_env, _env.TARGET, "target")
			end
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.units[3] then
				for _, unit in global.__iter__(_env.units) do
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, unit)
					global.ApplyRPEffect(_env, _env.ACTOR, unit)

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
					local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				end
			elseif _env.units[2] then
				for _, unit in global.__iter__(_env.units) do
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, unit)
					global.ApplyRPEffect(_env, _env.ACTOR, unit)

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
					local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				end

				if global.EnemyMaster(_env) then
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, global.EnemyMaster(_env), {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, global.EnemyMaster(_env))
					global.ApplyRPEffect(_env, _env.ACTOR, global.EnemyMaster(_env))

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, global.EnemyMaster(_env), this.dmgFactor)
					local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, global.EnemyMaster(_env), damage)
				end
			elseif _env.units[1] then
				for _, unit in global.__iter__(_env.units) do
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, unit)
					global.ApplyRPEffect(_env, _env.ACTOR, unit)

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
					local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				end

				if global.EnemyMaster(_env) then
					local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
					local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, DeUnHurtRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, global.EnemyMaster(_env), {
						timing = 0,
						display = "UnHurtRateDown",
						group = "Skill_XSMLi_Passive",
						duration = 99,
						limit = 3,
						tags = {
							"STATUS",
							"DEBUFF",
							"UNHURTRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.ApplyStatusEffect(_env, _env.ACTOR, global.EnemyMaster(_env))
					global.ApplyRPEffect(_env, _env.ACTOR, global.EnemyMaster(_env))

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, global.EnemyMaster(_env), this.dmgFactor)
					local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, global.EnemyMaster(_env), damage)
				end
			else
				local DeUnHurtRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
					"+Normal",
					"+Normal"
				}, DeUnHurtRateFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					timing = 0,
					display = "UnHurtRateDown",
					group = "Skill_XSMLi_Passive",
					duration = 99,
					limit = 3,
					tags = {
						"STATUS",
						"DEBUFF",
						"UNHURTRATEDOWN",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
				global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
				global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)
				local result = global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
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
all.Skill_XSMLi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DeUnHurtRateFactor = externs.DeUnHurtRateFactor

		assert(this.DeUnHurtRateFactor ~= nil, "External variable `DeUnHurtRateFactor` is not provided.")

		this.AbsorptionRateFactor = externs.AbsorptionRateFactor

		assert(this.AbsorptionRateFactor ~= nil, "External variable `AbsorptionRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbsorptionRateFactor)
			local buffeft2 = global.SpecialNumericEffect(_env, "+specialnum1", {
				"?Normal"
			}, this.DeUnHurtRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				duration = 99,
				group = "Skill_XSMLi_Passive_EX",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"ABSORPTIONUP",
					"Skill_XSMLi_Passive",
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
