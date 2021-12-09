local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_XXFSi_Normal = {
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
				-1,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			567
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
all.Skill_XXFSi_Proud = {
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
			"Hero_Proud_XXFSi"
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
			_env.units = global.EnemyUnits(_env, global.ROW_OF(_env, _env.TARGET))

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill2"))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			667
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
all.Skill_XXFSi_Unique = {
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
				2.8,
				0
			}
		end

		this.AtkRateFactor1 = externs.AtkRateFactor1

		if this.AtkRateFactor1 == nil then
			this.AtkRateFactor1 = 5
		end

		this.AtkRateFactor2 = externs.AtkRateFactor2

		if this.AtkRateFactor2 == nil then
			this.AtkRateFactor2 = 7
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2267
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XXFSi"
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
			_env.units = global.EnemyUnits(_env, global.ROW_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "Ground_XXFSi")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, nil, 2) + {
				-2.1,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1767
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "UNDEAD")) < 3 then
				local buffeft1 = global.DeathImmuneEffect(_env, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "Undead",
					group = "Skill_XXFSi_Unique",
					duration = 99,
					limit = 3,
					tags = {
						"UNDEAD",
						"STATUS",
						"Skill_XXFSi_Unique",
						"DISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			if global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) < 0.5 and global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) >= 0.25 then
				this.dmgFactor[2] = this.AtkRateFactor1
			elseif global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) < 0.25 then
				this.dmgFactor[2] = this.AtkRateFactor2
			end

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.ROW_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			2200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XXFSi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.6
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
			"SELF:HURTED"
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "CURSE"), 99)

			local buffeft1 = global.HPRecoverRatioEffect(_env, -1)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "CURSE"))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "",
				group = "Skill_XXFSi_Passive_1",
				duration = 99,
				limit = 1,
				tags = {
					"STATUS",
					"Skill_XXFSi_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"DEBUFF"
				}
			}, {
				buffeft1,
				buffeft2
			})

			local cellId = global.GetCellId(_env, _env.ACTOR)
			local units = global.EnemyCells(_env, global.CELL_IN_POS(_env, -cellId))
			local target = global.GetCellUnit(_env, units[1])

			if target then
				local buffeft3 = global.SpecialNumericEffect(_env, "+Skill_XXFSi_Passive", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, target, {
					timing = 0,
					display = "",
					group = "Skill_XXFSi_Passive_2",
					duration = 99,
					limit = 1,
					tags = {
						"STATUS",
						"Skill_XXFSi_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft3
				})
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

		_env.detail = externs.detail

		assert(_env.detail ~= nil, "External variable `detail` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.detail.eft and _env.detail.eft ~= 0 then
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local damage = _env.detail.eft * this.DamageFactor
				damage = global.min(_env, damage, atk * 5)

				for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "Skill_XXFSi_Passive")))) do
					global.ApplyHPDamage(_env, unit, damage)
				end
			end
		end)

		return _env
	end
}
all.Skill_XXFSi_Proud_EX = {
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

		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 200
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1767
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XXFSi"
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
			_env.units = global.EnemyUnits(_env, global.ROW_OF(_env, _env.TARGET))

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill2"))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
			global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)
		end)

		return _env
	end
}
all.Skill_XXFSi_Unique_EX = {
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
				3.5,
				0
			}
		end

		this.AtkRateFactor1 = externs.AtkRateFactor1

		if this.AtkRateFactor1 == nil then
			this.AtkRateFactor1 = 6.125
		end

		this.AtkRateFactor2 = externs.AtkRateFactor2

		if this.AtkRateFactor2 == nil then
			this.AtkRateFactor2 = 8.8
		end

		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 30
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2267
		}, main)
		this.main = global["[cut_in]"](this, {
			"1 #Hero_Unique_XXFSi"
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
			_env.units = global.EnemyUnits(_env, global.ROW_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "Ground_XXFSi")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, nil, 2) + {
				-2.1,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1767
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "UNDEAD")) < 3 then
				local buffeft1 = global.DeathImmuneEffect(_env, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "Undead",
					group = "Skill_XXFSi_Unique",
					duration = 99,
					limit = 3,
					tags = {
						"UNDEAD",
						"STATUS",
						"Skill_XXFSi_Unique",
						"DISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			if global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) < 0.5 and global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) >= 0.25 then
				this.dmgFactor[2] = this.AtkRateFactor1
			elseif global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) < 0.25 then
				this.dmgFactor[2] = this.AtkRateFactor2
			end

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.ROW_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end

			local buffeft2 = global.PassiveFunEffectBuff(_env, "Skill_Sustained_RPRecovery", {
				RateFactor = this.RateFactor
			})

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 4,
				display = "CShieldRpUp",
				group = "Skill_XXFSi_Unique_EX_RP",
				duration = 30,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"DISPELLABLE",
					"UNSTEALABLE",
					"RPRECOVERY"
				}
			}, {
				buffeft2
			})
		end)
		exec["@time"]({
			2200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XXFSi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.8
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
			"SELF:HURTED"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"UNIT_BEKILLED"
		}, passive4)

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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "CURSE"), 99)

			local buffeft1 = global.HPRecoverRatioEffect(_env, -1)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "CURSE"))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "",
				group = "Skill_XXFSi_Passive_1",
				duration = 99,
				limit = 1,
				tags = {
					"STATUS",
					"Skill_XXFSi_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"DEBUFF"
				}
			}, {
				buffeft1,
				buffeft2
			})

			local cellId = global.GetCellId(_env, _env.ACTOR)
			local units = global.EnemyCells(_env, global.CELL_IN_POS(_env, -cellId))
			local target = global.GetCellUnit(_env, units[1])

			if target then
				local buffeft3 = global.SpecialNumericEffect(_env, "+Skill_XXFSi_Passive", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, target, {
					timing = 0,
					display = "",
					group = "Skill_XXFSi_Passive_2",
					duration = 99,
					limit = 1,
					tags = {
						"STATUS",
						"Skill_XXFSi_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft3
				})
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

		_env.detail = externs.detail

		assert(_env.detail ~= nil, "External variable `detail` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.detail.eft and _env.detail.eft ~= 0 then
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local damage = _env.detail.eft * this.DamageFactor
				damage = global.min(_env, damage, atk * 5)

				for _, unit in global.__iter__(global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "Skill_XXFSi_Passive")))) do
					global.ApplyHPDamage(_env, unit, damage)
					global.AddStatus(_env, unit, "XXFSi_Target")
				end
			end
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "XXFSi_Target")(_env, _env.unit) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "UNDEAD")) < 3 then
				local buffeft1 = global.DeathImmuneEffect(_env, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "Undead",
					group = "Skill_XXFSi_Unique",
					duration = 99,
					limit = 3,
					tags = {
						"UNDEAD",
						"STATUS",
						"Skill_XXFSi_Unique",
						"DISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.hurt = externs.hurt

		assert(_env.hurt ~= nil, "External variable `hurt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR and _env.hurt.deadly and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "UNDEAD")) < 3 then
				local buffeft1 = global.DeathImmuneEffect(_env, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "Undead",
					group = "Skill_XXFSi_Unique",
					duration = 99,
					limit = 3,
					tags = {
						"UNDEAD",
						"STATUS",
						"Skill_XXFSi_Unique",
						"DISPELLABLE",
						"UNSTEALABLE"
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
