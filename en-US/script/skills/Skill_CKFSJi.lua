local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_CKFSJi_Normal = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.15
		end

		this.MaxHealRateFactor = externs.MaxHealRateFactor

		if this.MaxHealRateFactor == nil then
			this.MaxHealRateFactor = 1.5
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

		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hp")), 1, 1)

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill1"))
		end)
		exec["@time"]({
			300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local heal = (maxHp - hp) * this.HealRateFactor
				heal = global.min(_env, atk * this.MaxHealRateFactor, heal)

				if heal ~= 0 then
					global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, unit, heal)
				end

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
all.Skill_CKFSJi_Proud = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.2
		end

		this.MaxHealRateFactor = externs.MaxHealRateFactor

		if this.MaxHealRateFactor == nil then
			this.MaxHealRateFactor = 3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_CKFSJi"
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
			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hp")), 1, 1)

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
		end)
		exec["@time"]({
			700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local heal = (maxHp - hp) * this.HealRateFactor
				heal = global.min(_env, atk * this.MaxHealRateFactor, heal)

				if heal ~= 0 then
					global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, unit, heal)
				end

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
all.Skill_CKFSJi_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.6
		end

		this.Period = externs.Period

		if this.Period == nil then
			this.Period = 25
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2400
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_CKFSJi"
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
			100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
		end)
		exec["@time"]({
			1267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local Swtich = false

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				if global.PETS - global.SUMMONS(_env, unit) then
					global.ResetBuffsLifespan(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "Skill_CKFSJi_Unique"))

					local buffeft = global.PassiveFunEffectBuff(_env, "Skill_SleepingBeautyCastle", {
						HealRateFactor = this.HealRateFactor,
						Period = this.Period,
						Swtich = Swtich
					})

					global.ApplyBuff(_env, unit, {
						duration = 30,
						group = "CKFSJi_Unique",
						timing = 4,
						limit = 1,
						tags = {
							"BUFF",
							"Skill_CKFSJi_Unique",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft
					})
				end

				if global.MASTER(_env, unit) then
					global.ResetBuffsLifespan(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "Skill_CKFSJi_Unique"))

					local buffeft = global.PassiveFunEffectBuff(_env, "Skill_SleepingBeautyCastle", {
						HealRateFactor = this.HealRateFactor,
						Period = this.Period,
						Swtich = Swtich
					})

					global.ApplyBuff(_env, unit, {
						duration = 30,
						group = "CKFSJi_Unique",
						timing = 4,
						limit = 1,
						tags = {
							"BUFF",
							"Skill_CKFSJi_Unique",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft
					})

					local buffeft2 = global.PassiveFunEffectBuff(_env, "Skill_SleepingBeautyCastle_Switch")

					global.ApplyBuff(_env, unit, {
						timing = 0,
						duration = 99,
						tags = {
							"STATUS",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft2
					})
				end
			end

			local buff_trap = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)
			local trap = global.BuffTrap(_env, {
				timing = 2,
				duration = 1,
				tags = {
					"SleepingBeautyCastle"
				}
			}, {
				buff_trap
			})
			local cell1 = global.FriendCells(_env, global.CELL_IN_POS(_env, 5))

			global.DispelBuffTrap(_env, cell1[1], global.BUFF_MARKED(_env, "SleepingBeautyCastle"))
			global.ApplyTrap(_env, cell1[1], {
				display = "Castle",
				duration = 99,
				triggerLife = 99,
				tags = {
					"SleepingBeautyCastle"
				}
			}, {
				trap
			})
		end)
		exec["@time"]({
			2300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_CKFSJi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleRateFactor = externs.SingleRateFactor

		if this.SingleRateFactor == nil then
			this.SingleRateFactor = 0.15
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 1.5
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_BEFORE_ACTION"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_BEFORE_UNIQUE"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS - global.SUMMONS(_env, _env.unit) and not global.MASTER(_env, _env.unit) then
				local buffeft = global.NumericEffect(_env, "+singlerate", {
					"+Normal",
					"+Normal"
				}, this.SingleRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 1,
					group = "Skill_CKFSJi_Passive_1",
					timing = 1,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"Skill_CKFSJi_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				}, 1, 0)

				local buff = global.SpecialNumericEffect(_env, "+Skill_CKFSJi_Passive", {
					"+Normal",
					"+Normal"
				}, this.HealRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					duration = 1,
					group = "Skill_CKFSJi_Passive_2",
					timing = 1,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"Skill_CKFSJi_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}
all.Skill_SleepingBeautyCastle = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		this.Period = externs.Period

		assert(this.Period ~= nil, "External variable `Period` is not provided.")

		this.Swtich = externs.Swtich

		assert(this.Swtich ~= nil, "External variable `Swtich` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:HURTED"
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

		return this
	end,
	passive1 = function (_env, externs)
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
			local cell = global.FriendCells(_env, global.CELL_IN_POS(_env, 5))
			local count = global.SelectTrapCount(_env, cell[1], global.BUFF_MARKED(_env, "SleepingBeautyCastle"))

			if _env.detail.eft and _env.detail.eft ~= 0 and count > 0 then
				local LastHeal = global.SpecialPropGetter(_env, "Skill_Sustained_HPRecovery_Period_LastHeal")(_env, _env.ACTOR)
				local Heal = _env.detail.eft * this.HealRateFactor
				Heal = Heal + LastHeal

				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_SleepingBeautyCastle"), 99)

				local buff = global.PassiveFunEffectBuff(_env, "Skill_Sustained_HPRecovery_Period", {
					Period = this.Period,
					Heal = Heal,
					Swtich = this.Swtich
				})

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 4,
					duration = this.Period,
					tags = {
						"BUFF",
						"Skill_SleepingBeautyCastle",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local cell = global.FriendCells(_env, global.CELL_IN_POS(_env, 5))
			local count = global.SelectTrapCount(_env, cell[1], global.BUFF_MARKED(_env, "SleepingBeautyCastle"))

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and count > 0 and global.PETS - global.SUMMONS(_env, _env.unit) and global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "Skill_CKFSJi_Unique")) == 0 then
				local buffeft = global.PassiveFunEffectBuff(_env, "Skill_SleepingBeautyCastle", {
					HealRateFactor = this.HealRateFactor,
					Period = this.Period,
					Swtich = this.Swtich
				})

				global.ApplyBuff(_env, _env.unit, {
					timing = 4,
					duration = 30,
					tags = {
						"BUFF",
						"Skill_CKFSJi_Unique",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				})
			end
		end)

		return _env
	end
}
all.Skill_SleepingBeautyCastle_Switch = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"SELF:BUFF_BROKED"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"SELF:BUFF_CANCELED"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"SELF:BUFF_STEALED"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:BUFF_ENDED"
		}, passive3)

		return this
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "Skill_CKFSJi_Unique") then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Skill_CKFSJi_Unique"), 99)
				end

				for _, cell in global.__iter__(global.FriendCells(_env, global.CELL_IN_POS(_env, 5))) do
					global.DispelBuffTrap(_env, cell, global.BUFF_MARKED(_env, "SleepingBeautyCastle"))
				end
			end
		end)

		return _env
	end
}
all.Skill_CKFSJi_Proud_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.3
		end

		this.MaxHealRateFactor = externs.MaxHealRateFactor

		if this.MaxHealRateFactor == nil then
			this.MaxHealRateFactor = 3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_CKFSJi"
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
			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), "<", global.UnitPropGetter(_env, "hp")), 1, 1)

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
		end)
		exec["@time"]({
			700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local heal = (maxHp - hp) * this.HealRateFactor
				heal = global.min(_env, atk * this.MaxHealRateFactor, heal)

				if heal ~= 0 then
					global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, unit, heal)
				end

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
all.Skill_CKFSJi_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 0.8
		end

		this.Period = externs.Period

		if this.Period == nil then
			this.Period = 25
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2400
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_CKFSJi"
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
			100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
		end)
		exec["@time"]({
			1267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local Swtich = true

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				if global.PETS - global.SUMMONS(_env, unit) then
					global.ResetBuffsLifespan(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "Skill_CKFSJi_Unique"))

					local buffeft = global.PassiveFunEffectBuff(_env, "Skill_SleepingBeautyCastle", {
						HealRateFactor = this.HealRateFactor,
						Period = this.Period,
						Swtich = Swtich
					})

					global.ApplyBuff(_env, unit, {
						duration = 30,
						group = "CKFSJi_Unique",
						timing = 4,
						limit = 1,
						tags = {
							"BUFF",
							"Skill_CKFSJi_Unique",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft
					})
				end

				if global.MASTER(_env, unit) then
					global.ResetBuffsLifespan(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "Skill_CKFSJi_Unique"))

					local buffeft = global.PassiveFunEffectBuff(_env, "Skill_SleepingBeautyCastle", {
						HealRateFactor = this.HealRateFactor,
						Period = this.Period,
						Swtich = Swtich
					})

					global.ApplyBuff(_env, unit, {
						duration = 30,
						group = "CKFSJi_Unique",
						timing = 4,
						limit = 1,
						tags = {
							"BUFF",
							"Skill_CKFSJi_Unique",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft
					})

					local buffeft2 = global.PassiveFunEffectBuff(_env, "Skill_SleepingBeautyCastle_Switch")

					global.ApplyBuff(_env, unit, {
						timing = 0,
						duration = 99,
						tags = {
							"STATUS",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft2
					})
				end
			end

			local buff_trap = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)
			local trap = global.BuffTrap(_env, {
				timing = 2,
				duration = 1,
				tags = {
					"SleepingBeautyCastle"
				}
			}, {
				buff_trap
			})
			local cell1 = global.FriendCells(_env, global.CELL_IN_POS(_env, 5))

			global.DispelBuffTrap(_env, cell1[1], global.BUFF_MARKED(_env, "SleepingBeautyCastle"))
			global.ApplyTrap(_env, cell1[1], {
				display = "Castle",
				duration = 99,
				triggerLife = 99,
				tags = {
					"SleepingBeautyCastle"
				}
			}, {
				trap
			})
		end)
		exec["@time"]({
			2300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_CKFSJi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleRateFactor = externs.SingleRateFactor

		if this.SingleRateFactor == nil then
			this.SingleRateFactor = 0.25
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 2.5
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_BEFORE_ACTION"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_BEFORE_UNIQUE"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS - global.SUMMONS(_env, _env.unit) and not global.MASTER(_env, _env.unit) then
				local buffeft = global.NumericEffect(_env, "+singlerate", {
					"+Normal",
					"+Normal"
				}, this.SingleRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 1,
					group = "Skill_CKFSJi_Passive_1",
					timing = 1,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"Skill_CKFSJi_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				}, 1, 0)

				local buff = global.SpecialNumericEffect(_env, "+Skill_CKFSJi_Passive", {
					"+Normal",
					"+Normal"
				}, this.HealRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					duration = 1,
					group = "Skill_CKFSJi_Passive_2",
					timing = 1,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"Skill_CKFSJi_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}

return _M
