local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_FGao_Normal = {
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
				-1.7,
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
all.Skill_FGao_Proud = {
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

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.15
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_FGao"
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			834
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local shield = global.ShieldEffect(_env, global.min(_env, maxHp * this.ShieldFactor, atk * 2.5))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 3,
				display = "Shield",
				group = "Skill_NCai_Unique",
				duration = 1,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				shield
			}, 1)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_FGao_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BlockRateFactor = externs.BlockRateFactor

		if this.BlockRateFactor == nil then
			this.BlockRateFactor = 0.4
		end

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.45
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2867
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FGao"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
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
			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "Ground_Fangao")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 1200)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local buffeft = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)
			local shield = global.ShieldEffect(_env, global.min(_env, maxHp * this.ShieldFactor, atk * 6))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 3,
				display = "Shield",
				group = "Skill_FGao_Unique",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"BLOCKRATEUP",
					"Skill_FGao_Unique",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				shield,
				buffeft
			}, 1)
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "FGao_Daze_Prepare", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
				local buff = global.Daze(_env)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
					timing = 2,
					duration = 1,
					display = "Daze",
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buff
				}, 1, 0)
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "FGao_Daze_Prepare", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_FGao_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.1
		end

		this.DamageDownFactor = externs.DamageDownFactor

		if this.DamageDownFactor == nil then
			this.DamageDownFactor = 0.2
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_APPLYED"
		}, passive2)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local shield = global.ShieldEffect(_env, global.min(_env, maxHp * this.ShieldFactor, atk * 2))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 1,
				display = "Shield",
				group = "Skill_FGao_Passive",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"Skill_FGao_Passive",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				shield
			}, 1)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
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

			if global.BuffIsMatched(_env, _env.buff, "SHIELD") then
				local buff = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.DamageDownFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					duration = 99,
					group = "FGao_Passive_UnHurtRateUp",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_FGao_Passive_UnHurtRateUp"
					}
				}, {
					buff
				}, 1, 0)
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

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "SHIELD") then
				local shield = global.UnitPropGetter(_env, "shield")(_env, _env.ACTOR)

				if shield == 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "Skill_FGao_Passive_UnHurtRateUp"), 99)
				end
			end
		end)

		return _env
	end
}
all.Skill_FGao_Passive_Key = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DamageDownFactor = externs.DamageDownFactor

		if this.DamageDownFactor == nil then
			this.DamageDownFactor = 0.5
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
		passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
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

			if global.MARKED(_env, "FGao")(_env, _env.ACTOR) then
				local buff = global.DamageTransferEffect(_env, _env.ACTOR, this.DamageDownFactor)

				if global.FriendMaster(_env) then
					global.ApplyBuff(_env, global.FriendMaster(_env), {
						timing = 4,
						display = "FanGao_Shield",
						group = "Skill_FGao_Passive_Key",
						duration = 20,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"Skill_FGao_Passive_Key",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})
				end
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

			if global.MARKED(_env, "FGao")(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.FriendMaster(_env) then
				global.DispelBuff(_env, global.FriendMaster(_env), global.BUFF_MARKED_ALL(_env, "Skill_FGao_Passive_Key", "UNDISPELLABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_FGao_Proud_EX = {
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

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.25
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_FGao"
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			834
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local shield = global.ShieldEffect(_env, global.min(_env, maxHp * this.ShieldFactor, atk * 2.5))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 3,
				display = "Shield",
				group = "Skill_NCai_Unique",
				duration = 1,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				shield
			}, 1)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_FGao_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BlockRateFactor = externs.BlockRateFactor

		if this.BlockRateFactor == nil then
			this.BlockRateFactor = 0.5
		end

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.55
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2867
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FGao"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
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
			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "Ground_Fangao")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 1200)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local buffeft = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)
			local shield = global.ShieldEffect(_env, global.min(_env, maxHp * this.ShieldFactor, atk * 6))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 3,
				display = "Shield",
				group = "Skill_FGao_Unique",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"BLOCKRATEUP",
					"Skill_FGao_Unique",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				shield,
				buffeft
			}, 1)
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "FGao_Daze_Prepare", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
				local buff = global.Daze(_env)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
					timing = 2,
					duration = 1,
					display = "Daze",
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buff
				}, 1, 0)
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "FGao_Daze_Prepare", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_FGao_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.15
		end

		this.DamageDownFactor = externs.DamageDownFactor

		if this.DamageDownFactor == nil then
			this.DamageDownFactor = 0.35
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:BUFF_APPLYED"
		}, passive2)
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local shield = global.ShieldEffect(_env, global.min(_env, maxHp * this.ShieldFactor, atk * 2))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 1,
				display = "Shield",
				group = "Skill_FGao_Passive",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"Skill_FGao_Passive",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				shield
			}, 1)
		end)

		return _env
	end,
	passive2 = function (_env, externs)
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

			if global.BuffIsMatched(_env, _env.buff, "SHIELD") then
				local buff = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.DamageDownFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					duration = 99,
					group = "FGao_Passive_UnHurtRateUp",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_FGao_Passive_UnHurtRateUp"
					}
				}, {
					buff
				}, 1, 0)
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

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.BuffIsMatched(_env, _env.buff, "SHIELD") then
				local shield = global.UnitPropGetter(_env, "shield")(_env, _env.ACTOR)

				if shield == 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "UNDISPELLABLE", "UNSTEALABLE", "Skill_FGao_Passive_UnHurtRateUp"), 99)
				end
			end
		end)

		return _env
	end
}
all.Skill_FGao_Unique_Awaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BlockRateFactor = externs.BlockRateFactor

		if this.BlockRateFactor == nil then
			this.BlockRateFactor = 0.5
		end

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.55
		end

		this.HpRateFactor = externs.HpRateFactor

		if this.HpRateFactor == nil then
			this.HpRateFactor = 0.25
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2867
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FGao"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
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
			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "Ground_Fangao")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 1200)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local buffeft = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)
			local shield = global.ShieldEffect(_env, global.min(_env, maxHp * this.ShieldFactor, atk * 6))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 3,
				display = "Shield",
				group = "Skill_FGao_Unique",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"BLOCKRATEUP",
					"Skill_FGao_Unique",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				shield,
				buffeft
			}, 1)
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "FGao_Daze_Prepare", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
				local buff = global.Daze(_env)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
					timing = 2,
					duration = 1,
					display = "Daze",
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buff
				}, 1, 0)
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "FGao_Daze_Prepare", "UNDISPELLABLE", "UNSTEALABLE"), 99)

				local hp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local damage = global.min(_env, hp * this.HpRateFactor, atk * 2.8)

				global.ApplyRealDamage(_env, _env.ACTOR, _env.unit, 1, 1, 0, 0, 0, nil, damage)
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.unit)
				})
			end
		end)

		return _env
	end
}
all.Skill_FGao_Unique_SelfAwaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BlockRateFactor = externs.BlockRateFactor

		if this.BlockRateFactor == nil then
			this.BlockRateFactor = 0.5
		end

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.55
		end

		this.HpRateFactor = externs.HpRateFactor

		if this.HpRateFactor == nil then
			this.HpRateFactor = 0.25
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2867
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FGao"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
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
			_env.units = global.EnemyUnits(_env)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.GroundEft(_env, _env.ACTOR, "Ground_Fangao")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 1200)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			2267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local buffeft = global.NumericEffect(_env, "+blockrate", {
				"+Normal",
				"+Normal"
			}, this.BlockRateFactor)
			local shield = global.ShieldEffect(_env, global.min(_env, maxHp * this.ShieldFactor, atk * 6))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 3,
				display = "Shield",
				group = "Skill_FGao_Unique",
				duration = 2,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"BLOCKRATEUP",
					"Skill_FGao_Unique",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				shield,
				buffeft
			}, 1)
		end)
		exec["@time"]({
			2800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
			global.SelfEX_Defend_OneStage_Together(_env, _env.ACTOR)
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "FGao_Daze_Prepare", "UNDISPELLABLE", "UNSTEALABLE")) > 0 then
				local buff = global.Daze(_env)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
					timing = 2,
					duration = 1,
					display = "Daze",
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buff
				}, 1, 0)
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "FGao_Daze_Prepare", "UNDISPELLABLE", "UNSTEALABLE"), 99)

				local hp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local damage = global.min(_env, hp * this.HpRateFactor, atk * 2.8)

				global.ApplyRealDamage(_env, _env.ACTOR, _env.unit, 1, 1, 0, 0, 0, nil, damage)
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.unit)
				})
			end
		end)

		return _env
	end
}

return _M
