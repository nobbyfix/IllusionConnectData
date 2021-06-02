local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_QBTe_Normal = {
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
			834
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
				-2,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			634
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
all.Skill_QBTe_Proud = {
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
			"Hero_Proud_QBTe"
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
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			}, 200, "skill2"))
		end)
		exec["@time"]({
			867
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ExDmgFactor = global.SpecialPropGetter(_env, "exfactor")(_env, _env.ACTOR)

			if #_env.units == 2 then
				global.LoveDaze(_env, _env.units[1], _env.units[2])
			end

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if #_env.units == 2 and global.INSTATUS(_env, "Skill_QBTe_Passive_EX")(_env, _env.ACTOR) then
					damage.val = damage.val * (1 + ExDmgFactor)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				local animarray = global.GetAttackEffects(_env, _env.ACTOR)

				global.AddAnim(_env, {
					loop = 1,
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit),
					anim = animarray[1]
				})
			end
		end)

		return _env
	end
}
all.Skill_QBTe_Unique = {
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
				2.2,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3034
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_QBTe"
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
			2367
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units_top = global.EnemyUnits(_env, global.TOP_COL)
			local units_mid = global.EnemyUnits(_env, global.MID_COL)
			local units_bottom = global.EnemyUnits(_env, global.BOTTOM_COL)
			local ExDmgFactor = global.SpecialPropGetter(_env, "exfactor")(_env, _env.ACTOR)

			if #units_top == 2 then
				global.LoveDaze(_env, units_top[1], units_top[2])
			end

			if #units_mid == 2 then
				global.LoveDaze(_env, units_mid[1], units_mid[2])
			end

			if #units_bottom == 2 then
				global.LoveDaze(_env, units_bottom[1], units_bottom[2])
			end

			local animarray = global.GetAttackEffects(_env, _env.ACTOR)

			for _, unit in global.__iter__(units_top) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if #units_top == 2 and global.INSTATUS(_env, "Skill_QBTe_Passive_EX")(_env, _env.ACTOR) then
					damage.val = damage.val * (1 + ExDmgFactor)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				global.AddAnim(_env, {
					loop = 1,
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit),
					anim = animarray[1]
				})
			end

			for _, unit in global.__iter__(units_mid) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if #units_mid == 2 and global.INSTATUS(_env, "Skill_QBTe_Passive_EX")(_env, _env.ACTOR) then
					damage.val = damage.val * (1 + ExDmgFactor)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				global.AddAnim(_env, {
					loop = 1,
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit),
					anim = animarray[1]
				})
			end

			for _, unit in global.__iter__(units_bottom) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if #units_bottom == 2 and global.INSTATUS(_env, "Skill_QBTe_Passive_EX")(_env, _env.ACTOR) then
					damage.val = damage.val * (1 + ExDmgFactor)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				global.AddAnim(_env, {
					loop = 1,
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit),
					anim = animarray[1]
				})
			end
		end)
		exec["@time"]({
			2800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_QBTe_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
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

			global.AddStatus(_env, _env.ACTOR, "Skill_QBTe_Passive")
		end)

		return _env
	end
}

function all.CellRowLocation(_env, cell)
	local this = _env.this
	local global = _env.global
	local location = 0

	if global.abs(_env, global.IdOfCell(_env, cell)) == 1 or global.abs(_env, global.IdOfCell(_env, cell)) == 2 or global.abs(_env, global.IdOfCell(_env, cell)) == 3 then
		location = 1
	end

	if global.abs(_env, global.IdOfCell(_env, cell)) == 4 or global.abs(_env, global.IdOfCell(_env, cell)) == 5 or global.abs(_env, global.IdOfCell(_env, cell)) == 6 then
		location = 2
	end

	if global.abs(_env, global.IdOfCell(_env, cell)) == 7 or global.abs(_env, global.IdOfCell(_env, cell)) == 8 or global.abs(_env, global.IdOfCell(_env, cell)) == 9 then
		location = 3
	end

	return location
end

function all.CellColLocation(_env, cell)
	local this = _env.this
	local global = _env.global
	local location = 0

	if global.abs(_env, global.IdOfCell(_env, cell)) == 1 or global.abs(_env, global.IdOfCell(_env, cell)) == 4 or global.abs(_env, global.IdOfCell(_env, cell)) == 7 then
		location = 1
	end

	if global.abs(_env, global.IdOfCell(_env, cell)) == 2 or global.abs(_env, global.IdOfCell(_env, cell)) == 5 or global.abs(_env, global.IdOfCell(_env, cell)) == 8 then
		location = 2
	end

	if global.abs(_env, global.IdOfCell(_env, cell)) == 3 or global.abs(_env, global.IdOfCell(_env, cell)) == 6 or global.abs(_env, global.IdOfCell(_env, cell)) == 9 then
		location = 3
	end

	return location
end

function all.LoveDaze(_env, unit1, unit2)
	local this = _env.this
	local global = _env.global
	local buffeft = global.Daze(_env)

	global.ApplyBuff_Debuff(_env, _env.ACTOR, unit1, {
		timing = 2,
		duration = 1,
		display = "Daze",
		tags = {
			"STATUS",
			"DEBUFF",
			"DAZE",
			"DISPELLABLE"
		}
	}, {
		buffeft
	}, 1, 0)
	global.ApplyBuff_Debuff(_env, _env.ACTOR, unit2, {
		timing = 2,
		duration = 1,
		display = "Daze",
		tags = {
			"STATUS",
			"DEBUFF",
			"DAZE",
			"DISPELLABLE"
		}
	}, {
		buffeft
	}, 1, 0)

	local animarray = global.GetAttackEffects(_env, _env.ACTOR)

	if global.CellRowLocation(_env, global.GetCell(_env, unit1)) == 1 and global.CellRowLocation(_env, global.GetCell(_env, unit2)) == 3 then
		global.AnimForTrgt(_env, unit1, {
			loop = 1,
			zOrder = "TopLayer",
			pos = {
				-0.6,
				0.5
			},
			anim = animarray[2]
		})
	else
		global.AnimForTrgt(_env, unit1, {
			loop = 1,
			zOrder = "TopLayer",
			pos = {
				-0.1,
				0.5
			},
			anim = animarray[2]
		})
	end
end

all.Skill_QBTe_Proud_EX = {
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
				1.85,
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
			"Hero_Proud_QBTe"
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
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			}, 200, "skill2"))
		end)
		exec["@time"]({
			867
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ExDmgFactor = global.SpecialPropGetter(_env, "exfactor")(_env, _env.ACTOR)

			if #_env.units == 2 then
				global.LoveDaze(_env, _env.units[1], _env.units[2])
			end

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if #_env.units == 2 and global.INSTATUS(_env, "Skill_QBTe_Passive_EX")(_env, _env.ACTOR) then
					damage.val = damage.val * (1 + ExDmgFactor)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				local animarray = global.GetAttackEffects(_env, _env.ACTOR)

				global.AddAnim(_env, {
					loop = 1,
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit),
					anim = animarray[1]
				})
			end
		end)

		return _env
	end
}
all.Skill_QBTe_Unique_EX = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3034
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_QBTe"
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
			2367
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units_top = global.EnemyUnits(_env, global.TOP_COL)
			local units_mid = global.EnemyUnits(_env, global.MID_COL)
			local units_bottom = global.EnemyUnits(_env, global.BOTTOM_COL)
			local ExDmgFactor = global.SpecialPropGetter(_env, "exfactor")(_env, _env.ACTOR)

			if #units_top == 2 then
				global.LoveDaze(_env, units_top[1], units_top[2])
			end

			if #units_mid == 2 then
				global.LoveDaze(_env, units_mid[1], units_mid[2])
			end

			if #units_bottom == 2 then
				global.LoveDaze(_env, units_bottom[1], units_bottom[2])
			end

			local animarray = global.GetAttackEffects(_env, _env.ACTOR)

			for _, unit in global.__iter__(units_top) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if #units_top == 2 and global.INSTATUS(_env, "Skill_QBTe_Passive_EX")(_env, _env.ACTOR) then
					damage.val = damage.val * (1 + ExDmgFactor)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				global.AddAnim(_env, {
					loop = 1,
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit),
					anim = animarray[1]
				})
			end

			for _, unit in global.__iter__(units_mid) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if #units_mid == 2 and global.INSTATUS(_env, "Skill_QBTe_Passive_EX")(_env, _env.ACTOR) then
					damage.val = damage.val * (1 + ExDmgFactor)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				global.AddAnim(_env, {
					loop = 1,
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit),
					anim = animarray[1]
				})
			end

			for _, unit in global.__iter__(units_bottom) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if #units_bottom == 2 and global.INSTATUS(_env, "Skill_QBTe_Passive_EX")(_env, _env.ACTOR) then
					damage.val = damage.val * (1 + ExDmgFactor)
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				global.AddAnim(_env, {
					loop = 1,
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, unit),
					anim = animarray[1]
				})
			end
		end)
		exec["@time"]({
			2800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_QBTe_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ExFactor = externs.ExFactor

		if this.ExFactor == nil then
			this.ExFactor = 0.25
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

			global.AddStatus(_env, _env.ACTOR, "Skill_QBTe_Passive_EX")

			local buffeft1 = global.SpecialNumericEffect(_env, "+exfactor", {
				"?Normal"
			}, this.ExFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "Skill_QBTe_Passive_EX",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"Skill_QBTe_Passive_EX",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}

return _M
