local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_XBKLDi_Normal = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 1
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

		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill1"))
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, unit, this.HealRateFactor, 0)

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

		return _env
	end
}
all.Skill_XBKLDi_Proud = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 1.5
		end

		this.LessHp = externs.LessHp

		if this.LessHp == nil then
			this.LessHp = 0.3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1334
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XBKLDi"
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
			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
		end)
		exec["@time"]({
			534
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, unit, this.HealRateFactor, 0)
				local hpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, unit)

				if hpRatio < this.LessHp then
					heal = heal * 2
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

		return _env
	end
}
all.Skill_XBKLDi_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpFactor = externs.HpFactor

		if this.HpFactor == nil then
			this.HpFactor = 0.35
		end

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 1000
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2900
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XBKLDi"
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

			global.GroundEft(_env, _env.ACTOR, "Ground_Yiasong")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.3, 200)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
		end)
		exec["@time"]({
			1900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendDiedUnits(_env)
			local num = #units

			if units[num] then
				if global.MARKED(_env, "WARRIOR")(_env, units[num]) then
					local reviveunit = global.ReviveByUnit(_env, units[num], this.HpFactor, this.RpFactor, {
						2,
						5,
						1,
						3,
						4,
						6,
						7,
						8,
						9
					})

					if reviveunit then
						global.AddStatus(_env, reviveunit, "Skill_XBKLDi_Unique")
					end
				else
					local reviveunit = global.ReviveByUnit(_env, units[num], this.HpFactor, this.RpFactor, {
						7,
						8,
						9,
						4,
						6,
						5,
						1,
						3,
						2
					})

					if reviveunit then
						global.AddStatus(_env, reviveunit, "Skill_XBKLDi_Unique")
					end
				end
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
all.Skill_XBKLDi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 2.65
		end

		this.RpDamageFactor = externs.RpDamageFactor

		if this.RpDamageFactor == nil then
			this.RpDamageFactor = 300
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

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, unit, this.HealRateFactor, 0)

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
				global.ApplyRPDamage_ResultCheck(_env, _env.ACTOR, unit, this.RpDamageFactor)
			end
		end)

		return _env
	end
}
all.Skill_XBKLDi_Proud_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 2
		end

		this.LessHp = externs.LessHp

		if this.LessHp == nil then
			this.LessHp = 0.3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1334
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_XBKLDi"
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
			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
		end)
		exec["@time"]({
			534
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, unit, this.HealRateFactor, 0)
				local hpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, unit)

				if hpRatio < this.LessHp then
					heal = heal * 2
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

		return _env
	end
}
all.Skill_XBKLDi_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpFactor = externs.HpFactor

		if this.HpFactor == nil then
			this.HpFactor = 0.35
		end

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 1000
		end

		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2900
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XBKLDi"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive)

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

			global.GroundEft(_env, _env.ACTOR, "Ground_Yiasong")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.3, 200)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
		end)
		exec["@time"]({
			1900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendDiedUnits(_env)
			local num = #units

			if units[num] then
				if global.MARKED(_env, "WARRIOR")(_env, units[num]) then
					local reviveunit = global.ReviveByUnit(_env, units[num], this.HpFactor, this.RpFactor, {
						2,
						5,
						1,
						3,
						4,
						6,
						7,
						8,
						9
					})

					if reviveunit then
						global.AddStatus(_env, reviveunit, "Skill_XBKLDi_Unique")
					end
				else
					local reviveunit = global.ReviveByUnit(_env, units[num], this.HpFactor, this.RpFactor, {
						7,
						8,
						9,
						4,
						6,
						5,
						1,
						3,
						2
					})

					if reviveunit then
						global.AddStatus(_env, reviveunit, "Skill_XBKLDi_Unique")
					end
				end
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
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.INSTATUS(_env, "Skill_XBKLDi_Unique")(_env, _env.unit) then
				local buffeft = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "Skill_XBKLDi_Unique",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"HURTRATEUP",
						"Skill_XBKLDi_Unique",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				}, 1, 0)
			end
		end)

		return _env
	end
}
all.Skill_XBKLDi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 3.3
		end

		this.RpDamageFactor = externs.RpDamageFactor

		if this.RpDamageFactor == nil then
			this.RpDamageFactor = 500
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

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, unit, this.HealRateFactor, 0)

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
				global.ApplyRPDamage_ResultCheck(_env, _env.ACTOR, unit, this.RpDamageFactor)
			end
		end)

		return _env
	end
}

return _M
