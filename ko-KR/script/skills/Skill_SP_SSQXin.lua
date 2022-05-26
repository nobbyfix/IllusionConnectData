local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SP_SSQXin_Normal = {
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
				1.1,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1033
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
all.Skill_SP_SSQXin_Proud = {
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
				1.8,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1433
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_SSQXin"
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
				-0.5,
				0
			}, 100, "skill2"))
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
all.Skill_SP_SSQXin_Unique = {
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

		this.RealFactor = externs.RealFactor

		if this.RealFactor == nil then
			this.RealFactor = 1.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2733
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_SSQXin"
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

		_env.master = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "Ground_SP_SSQXin")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1933
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local overdamage = 0
			local total = 0
			local applydamage = 0

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
				local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
				local shield = global.UnitPropGetter(_env, "shield")(_env, unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)

				if global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) < 0.5 then
					local buffeft1 = global.Daze(_env)

					global.ApplyBuff(_env, unit, {
						timing = 4,
						duration = 15,
						display = "Freeze",
						tags = {
							"STATUS",
							"DEBUFF",
							"FREEZE",
							"ABNORMAL",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					})
				end

				if global.UnitPropGetter(_env, "hpRatio")(_env, unit) > 0.5 then
					local realdamage = global.EvalRealDamage(_env, _env.ACTOR, unit, 2, 1, this.RealFactor, 0, 0, damage)
					damage.val = damage.val + realdamage
					damage.val = global.BossDamage(_env, _env.ACTOR, unit, damage.val)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				applydamage = global.SpecialPropGetter(_env, "ApplyDamageValue")(_env, _env.ACTOR)
				overdamage = applydamage - hp - shield

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "UNDEAD")) > 0 then
					overdamage = applydamage - hp - shield + 1
				end

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) > 0 then
					overdamage = applydamage
				end

				overdamage = global.max(_env, overdamage, 0)
				total = total + overdamage
			end

			if total > 0 then
				global.DelayCall(_env, 500, global.ApplyHPRecovery, _env.ACTOR, total)
			end
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_SP_SSQXin_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UndeadTimes = externs.UndeadTimes

		if this.UndeadTimes == nil then
			this.UndeadTimes = 1
		end

		this.EffectTimes = externs.EffectTimes

		if this.EffectTimes == nil then
			this.EffectTimes = 1
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
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_TRANSFORM"
		}, passive3)

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
			local buffeft1 = global.DeathImmuneEffect(_env, this.UndeadTimes)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "Undead",
				group = "Skill_SP_SSQXin_Passive",
				duration = 99,
				limit = 1,
				tags = {
					"UNDEAD",
					"STATUS",
					"Skill_SP_SSQXin_Passive",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.isRevive = externs.isRevive

		assert(_env.isRevive ~= nil, "External variable `isRevive` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendUnits(_env, global.MARKED(_env, "SP_SSQXin"))

			if units[1] and _env.isRevive == true and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.SpecialPropGetter(_env, "SP_SSQXin_Passive_count")(_env, global.FriendField(_env)) < this.EffectTimes then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff(_env, _env.unit, {
					timing = 4,
					duration = 15,
					display = "Freeze",
					tags = {
						"STATUS",
						"DEBUFF",
						"FREEZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})

				local buffeft2 = global.SpecialNumericEffect(_env, "+SP_SSQXin_Passive_count", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {}
				}, {
					buffeft2
				})
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

		_env.isTransform = externs.isTransform

		assert(_env.isTransform ~= nil, "External variable `isTransform` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendUnits(_env, global.MARKED(_env, "SP_SSQXin"))

			if units[1] and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and _env.isTransform == true and global.SpecialPropGetter(_env, "SP_SSQXin_Passive_count")(_env, global.FriendField(_env)) < this.EffectTimes then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff(_env, _env.unit, {
					timing = 4,
					duration = 15,
					display = "Freeze",
					tags = {
						"STATUS",
						"DEBUFF",
						"FREEZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})

				local buffeft2 = global.SpecialNumericEffect(_env, "+SP_SSQXin_Passive_count", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.Skill_SP_SSQXin_Proud_EX = {
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
				1.8,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1033
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_SSQXin"
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
				-0.5,
				0
			}, 100, "skill2"))
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

			local buffeft1 = global.Daze(_env)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 4,
				duration = 15,
				display = "Freeze",
				tags = {
					"STATUS",
					"DEBUFF",
					"FREEZE",
					"ABNORMAL",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.Skill_SP_SSQXin_Unique_EX = {
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

		this.RealFactor = externs.RealFactor

		if this.RealFactor == nil then
			this.RealFactor = 1.8
		end

		this.Factor = externs.Factor

		if this.Factor == nil then
			this.Factor = 0.5
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2733
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_SSQXin"
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

		_env.master = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "Ground_SP_SSQXin")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1933
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local exdamage = global.SpecialPropGetter(_env, "SP_SSQXin_overdamage")(_env, _env.ACTOR) * this.Factor

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "SP_SSQXin_OVERDAMAGE"), 99)

			local overdamage = 0
			local total = 0
			local applydamage = 0

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
				damage.val = damage.val + exdamage
				local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
				local shield = global.UnitPropGetter(_env, "shield")(_env, unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)

				if global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) < 0.5 then
					local buffeft1 = global.Daze(_env)

					global.ApplyBuff(_env, unit, {
						timing = 4,
						duration = 15,
						display = "Freeze",
						tags = {
							"STATUS",
							"DEBUFF",
							"FREEZE",
							"ABNORMAL",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					})
				end

				if global.UnitPropGetter(_env, "hpRatio")(_env, unit) > 0.5 then
					local realdamage = global.EvalRealDamage(_env, _env.ACTOR, unit, 2, 1, this.RealFactor, 0, 0, damage)
					damage.val = damage.val + realdamage
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				applydamage = global.SpecialPropGetter(_env, "ApplyDamageValue")(_env, _env.ACTOR)
				overdamage = applydamage - hp - shield

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "UNDEAD")) > 0 then
					overdamage = applydamage - hp - shield + 1
				end

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) > 0 then
					overdamage = applydamage
				end

				overdamage = global.max(_env, overdamage, 0)
				total = total + overdamage
			end

			if total > 0 then
				global.DelayCall(_env, 500, global.ApplyHPRecovery, _env.ACTOR, total)

				local buffeft = global.SpecialNumericEffect(_env, "+SP_SSQXin_overdamage", {
					"+Normal",
					"+Normal"
				}, total)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"SP_SSQXin_OVERDAMAGE"
					}
				}, {
					buffeft
				})
			end
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_SP_SSQXin_Unique_Awaken = {
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

		this.RealFactor = externs.RealFactor

		if this.RealFactor == nil then
			this.RealFactor = 1.8
		end

		this.Factor = externs.Factor

		if this.Factor == nil then
			this.Factor = 0.5
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2733
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SP_SSQXin"
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

		_env.master = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "Ground_SP_SSQXin")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1933
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local exdamage = global.SpecialPropGetter(_env, "SP_SSQXin_overdamage")(_env, _env.ACTOR) * this.Factor

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "SP_SSQXin_OVERDAMAGE"), 99)

			local overdamage = 0
			local total = 0
			local applydamage = 0

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
				damage.val = damage.val + exdamage
				local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
				local shield = global.UnitPropGetter(_env, "shield")(_env, unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)

				if global.UnitPropGetter(_env, "hpRatio")(_env, _env.ACTOR) < 0.5 then
					local buffeft1 = global.Daze(_env)

					global.ApplyBuff(_env, unit, {
						timing = 4,
						duration = 15,
						display = "Freeze",
						tags = {
							"STATUS",
							"DEBUFF",
							"FREEZE",
							"ABNORMAL",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					})
				end

				if global.UnitPropGetter(_env, "hpRatio")(_env, unit) > 0.5 then
					local realdamage = global.EvalRealDamage(_env, _env.ACTOR, unit, 2, 1, this.RealFactor, 0, 0, damage)
					damage.val = damage.val + realdamage
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				applydamage = global.SpecialPropGetter(_env, "ApplyDamageValue")(_env, _env.ACTOR)
				overdamage = applydamage - hp - shield

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "UNDEAD")) > 0 then
					overdamage = applydamage - hp - shield + 1
				end

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ANY(_env, "IMMUNE", "GUIDIE_SHENYIN", "Invisible_Immune", "DAGUN_IMMUNE", "SKONG_IMMUNE")) > 0 then
					overdamage = applydamage
				end

				overdamage = global.max(_env, overdamage, 0)
				total = total + overdamage
			end

			if total > 0 then
				global.DelayCall(_env, 500, global.ApplyHPRecovery, _env.ACTOR, total)

				local buffeft = global.SpecialNumericEffect(_env, "+SP_SSQXin_overdamage", {
					"+Normal",
					"+Normal"
				}, total)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"SP_SSQXin_OVERDAMAGE"
					}
				}, {
					buffeft
				})
			end
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_SP_SSQXin_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UndeadTimes = externs.UndeadTimes

		if this.UndeadTimes == nil then
			this.UndeadTimes = 2
		end

		this.EffectTimes = externs.EffectTimes

		if this.EffectTimes == nil then
			this.EffectTimes = 2
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
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_TRANSFORM"
		}, passive3)

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
			local buffeft1 = global.DeathImmuneEffect(_env, this.UndeadTimes)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "Undead",
				group = "Skill_SP_SSQXin_Passive",
				duration = 99,
				limit = 1,
				tags = {
					"UNDEAD",
					"STATUS",
					"Skill_SP_SSQXin_Passive",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.isRevive = externs.isRevive

		assert(_env.isRevive ~= nil, "External variable `isRevive` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendUnits(_env, global.MARKED(_env, "SP_SSQXin"))

			if units[1] and _env.isRevive == true and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.SpecialPropGetter(_env, "SP_SSQXin_Passive_count")(_env, global.FriendField(_env)) < this.EffectTimes then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff(_env, _env.unit, {
					timing = 4,
					duration = 15,
					display = "Freeze",
					tags = {
						"STATUS",
						"DEBUFF",
						"FREEZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})

				local buffeft2 = global.SpecialNumericEffect(_env, "+SP_SSQXin_Passive_count", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {}
				}, {
					buffeft2
				})
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

		_env.isTransform = externs.isTransform

		assert(_env.isTransform ~= nil, "External variable `isTransform` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendUnits(_env, global.MARKED(_env, "SP_SSQXin"))

			if units[1] and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and _env.isTransform == true and global.SpecialPropGetter(_env, "SP_SSQXin_Passive_count")(_env, global.FriendField(_env)) < this.EffectTimes then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff(_env, _env.unit, {
					timing = 4,
					duration = 15,
					display = "Freeze",
					tags = {
						"STATUS",
						"DEBUFF",
						"FREEZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})

				local buffeft2 = global.SpecialNumericEffect(_env, "+SP_SSQXin_Passive_count", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.Skill_SP_SSQXin_Passive_Awaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UndeadTimes = externs.UndeadTimes

		if this.UndeadTimes == nil then
			this.UndeadTimes = 2
		end

		this.EffectTimes = externs.EffectTimes

		if this.EffectTimes == nil then
			this.EffectTimes = 2
		end

		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.15
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
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_TRANSFORM"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"UNIT_BUFF_APPLYED"
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
			local buffeft1 = global.DeathImmuneEffect(_env, this.UndeadTimes)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				display = "Undead",
				group = "Skill_SP_SSQXin_Passive",
				duration = 99,
				limit = 1,
				tags = {
					"UNDEAD",
					"STATUS",
					"Skill_SP_SSQXin_Passive",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.isRevive = externs.isRevive

		assert(_env.isRevive ~= nil, "External variable `isRevive` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendUnits(_env, global.MARKED(_env, "SP_SSQXin"))

			if units[1] and _env.isRevive == true and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.SpecialPropGetter(_env, "SP_SSQXin_Passive_count")(_env, global.FriendField(_env)) < this.EffectTimes then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff(_env, _env.unit, {
					timing = 4,
					duration = 15,
					display = "Freeze",
					tags = {
						"STATUS",
						"DEBUFF",
						"FREEZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})

				local buffeft2 = global.SpecialNumericEffect(_env, "+SP_SSQXin_Passive_count", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {}
				}, {
					buffeft2
				})
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

		_env.isTransform = externs.isTransform

		assert(_env.isTransform ~= nil, "External variable `isTransform` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendUnits(_env, global.MARKED(_env, "SP_SSQXin"))

			if units[1] and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and _env.isTransform == true and global.SpecialPropGetter(_env, "SP_SSQXin_Passive_count")(_env, global.FriendField(_env)) < this.EffectTimes then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff(_env, _env.unit, {
					timing = 4,
					duration = 15,
					display = "Freeze",
					tags = {
						"STATUS",
						"DEBUFF",
						"FREEZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})

				local buffeft2 = global.SpecialNumericEffect(_env, "+SP_SSQXin_Passive_count", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {}
				}, {
					buffeft2
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

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.BuffIsMatched(_env, _env.buff, "FREEZE") then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					display = "HurtRateUp",
					group = "Skill_SP_SSQXin_Passive_Awaken_Hurt",
					duration = 99,
					limit = 3,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
			end
		end)

		return _env
	end
}

return _M
