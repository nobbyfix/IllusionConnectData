local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_KMLa_Normal = {
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
				-1.2,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			500
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
all.Skill_KMLa_Proud = {
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
			1200
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_KMLa"
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

		_env.num = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2.2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.RandomN(_env, 1, global.FriendUnits(_env, global.PETS - global.SUMMONS))) do
				local buffeft1 = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, 0.2)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "Skill_KMLa_Proud",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"ABSORPTION"
					}
				}, {
					buffeft1
				})
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_KMLa_Unique = {
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
			3200
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_KMLa"
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

		_env.count1 = 0
		_env.count = 0

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
				-1.9,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local hp = global.UnitPropGetter(_env, "hp")(_env, _env.TARGET)

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage + hp * 0.12)
		end)
		exec["@time"]({
			3200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_KMLa_Passive_Death = {
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
			670
		}, main)

		return this
	end,
	main = function (_env, externs)
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

			if not global.INSTATUS(_env, "Skill_KMLa_Passive_Transformed")(_env, _env.ACTOR) then
				global.AddAnim(_env, {
					loop = 2,
					anim = "huanrao_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-0.8
					}
				})
				global.Sound(_env, "Se_Skill_Change_1", 1)
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "fakedie"))
			end
		end)
		exec["@time"]({
			667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.INSTATUS(_env, "Skill_KMLa_Passive_Transformed")(_env, _env.ACTOR) then
				global.FullInheritTransform(_env)
				global.Transform(_env, _env.ACTOR, 1)
				global.AddStatus(_env, _env.ACTOR, "Skill_KMLa_Passive_Transformed")
				global.AddAnim(_env, {
					loop = 1,
					anim = "die_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-1.3
					}
				})
				global.Sound(_env, "Se_Skill_Change_2", 1)

				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPReduce(_env, _env.ACTOR, maxHp * 0.99)
				global.ApplyRPRecovery(_env, _env.ACTOR, 1000)
			end
		end)

		return _env
	end
}
all.Skill_KMLa_Proud_EX = {
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
			1067
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_KMLa"
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

		_env.num = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2.2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.RandomN(_env, 1, global.FriendUnits(_env, global.PETS - global.SUMMONS))) do
				local buffeft1 = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, 0.3)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "Skill_KMLa_Proud",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"ABSORPTION"
					}
				}, {
					buffeft1
				})
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_KMLa_Unique_EX = {
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
			3200
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_KMLa"
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

		_env.count1 = 0
		_env.count = 0

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
				-1.9,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local hp = global.UnitPropGetter(_env, "hp")(_env, _env.TARGET)

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage + hp * 0.17)
		end)
		exec["@time"]({
			3200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_KMLa_Passive_Death_EX = {
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
			670
		}, main)

		return this
	end,
	main = function (_env, externs)
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

			if not global.INSTATUS(_env, "Skill_KMLa_Passive_Transformed2")(_env, _env.ACTOR) then
				global.AddAnim(_env, {
					loop = 2,
					anim = "huanrao_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-0.8
					}
				})
				global.Sound(_env, "Se_Skill_Change_1", 1)
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "fakedie"))
			end
		end)
		exec["@time"]({
			667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "Skill_KMLa_Passive_Transformed2")(_env, _env.ACTOR) then
				-- Nothing
			elseif global.INSTATUS(_env, "Skill_KMLa_Passive_Transformed")(_env, _env.ACTOR) then
				global.FullInheritTransform(_env)
				global.Transform(_env, _env.ACTOR, 1)
				global.AddStatus(_env, _env.ACTOR, "Skill_KMLa_Passive_Transformed2")
				global.AddAnim(_env, {
					loop = 1,
					anim = "die_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-1.3
					}
				})
				global.Sound(_env, "Se_Skill_Change_2", 1)

				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPReduce(_env, _env.ACTOR, maxHp * 0.99)
				global.ApplyRPRecovery(_env, _env.ACTOR, 1000)

				local maxatk = global.UnitPropGetter(_env, "atkrate")(_env, _env.ACTOR)
				local buffeft1 = global.NumericEffect(_env, "-atkrate", {
					"+Normal",
					"+Normal"
				}, maxatk / 2)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "Skill_TPGZhu_Passive_Death",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			else
				global.FullInheritTransform(_env)
				global.Transform(_env, _env.ACTOR, 1)
				global.AddStatus(_env, _env.ACTOR, "Skill_KMLa_Passive_Transformed")
				global.AddAnim(_env, {
					loop = 1,
					anim = "die_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-1.3
					}
				})
				global.Sound(_env, "Se_Skill_Change_2", 1)

				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

				global.ApplyHPReduce(_env, _env.ACTOR, maxHp * 0.99)
				global.ApplyRPRecovery(_env, _env.ACTOR, 1000)
			end
		end)

		return _env
	end
}

return _M
