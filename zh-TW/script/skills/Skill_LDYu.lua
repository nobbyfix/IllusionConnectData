local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_LDYu_Normal = {
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
				-1.1,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			434
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
all.Skill_LDYu_Proud = {
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
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_LDYu"
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
				-1.1,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			467
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				367
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
		end)

		return _env
	end
}
all.Skill_LDYu_Unique = {
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
				4,
				0
			}
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 1.6
		end

		this.SingleRateFactor = externs.SingleRateFactor

		if this.SingleRateFactor == nil then
			this.SingleRateFactor = 0.4
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LDYu"
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
			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.ACTOR)), "<", global.UnitPropGetter(_env, "hp")), 1, 1)

			global.RetainObject(_env, _env.TARGET)
			global.GroundEft(_env, _env.ACTOR, "Ground_LDYu")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.2,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1934
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.FriendMaster(_env) then
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, global.FriendMaster(_env), this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, global.FriendMaster(_env), heal)
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				67,
				134,
				267,
				434
			}, global.SplitValue(_env, damage, {
				0.2,
				0.2,
				0.2,
				0.2,
				0.2
			}))

			local hp = global.UnitPropGetter(_env, "hp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local real_damage = hp * this.SingleRateFactor
			real_damage = global.min(_env, real_damage, atk * 3)

			global.ApplyHPDamage(_env, _env.ACTOR, real_damage)
			global.DelayCall(_env, 700, global.ApplyHPDamage, _env.TARGET, real_damage)

			for _, unit in global.__iter__(_env.units) do
				local hpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, unit)

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "CURSE")) > 0 or hpRatio == 1 then
					global.DelayCall(_env, 700, global.ApplyHPDamage, _env.TARGET, real_damage)
				else
					global.ApplyHPRecovery(_env, unit, real_damage, false)

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
			end
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LDYu_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleRateFactor = externs.SingleRateFactor

		if this.SingleRateFactor == nil then
			this.SingleRateFactor = 0.2
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
			local buffeft = global.SpecialNumericEffect(_env, "+LDYu_Enter", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"LDYu_Passive"
				}
			}, {
				buffeft
			})

			local buff_count = global.SpecialPropGetter(_env, "LDYu_Enter")(_env, global.FriendField(_env))

			if buff_count and buff_count ~= 0 then
				buff_count = global.min(_env, buff_count, 5)
				local buffeft = global.NumericEffect(_env, "+singlerate", {
					"+Normal",
					"+Normal"
				}, this.SingleRateFactor * buff_count)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "LDYu_Passive",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
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
all.Skill_LDYu_Passive_Key = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
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

			if global.FriendMaster(_env) and global.MARKED(_env, "LDYu")(_env, _env.ACTOR) then
				global.DispelBuff(_env, global.FriendMaster(_env), global.BUFF_MARKED(_env, "LDYu_Passive_Time"), 99)

				local buff = global.PassiveFunEffectBuff(_env, "LDYu_Back")

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"LDYu_Passive_Key"
					}
				}, {
					buff
				})

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, global.FriendMaster(_env), {
					duration = 20,
					group = "LDYu_Passive_Key",
					timing = 4,
					limit = 1,
					tags = {
						"STATUS",
						"LDYu_Passive_Time"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.LDYu_Back = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_DIE"
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
			local count = global.SelectBuffCount(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "LDYu_Back_Count"))

			if global.MARKED(_env, "LDYu")(_env, _env.unit) and global.SelectBuffCount(_env, global.FriendMaster(_env), global.BUFF_MARKED(_env, "LDYu_Passive_Time")) > 0 and count < 2 then
				local card = global.BackToCard_ResultCheck(_env, _env.unit, "card")

				if card then
					global.Kick(_env, _env.unit)

					local buff = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, global.FriendField(_env), {
						timing = 0,
						duration = 99,
						tags = {
							"LDYu_Back_Count"
						}
					}, {
						buff
					})
				end
			end
		end)

		return _env
	end
}
all.Skill_LDYu_Proud_EX = {
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

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 1.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_LDYu"
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
				-1.1,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			467
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hp")), 1, 1)

			for _, unit in global.__iter__(units) do
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

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				367
			}, global.SplitValue(_env, damage, {
				0.5,
				0.5
			}))
		end)

		return _env
	end
}
all.Skill_LDYu_Unique_EX = {
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
				5,
				0
			}
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 2
		end

		this.SingleRateFactor = externs.SingleRateFactor

		if this.SingleRateFactor == nil then
			this.SingleRateFactor = 0.4
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LDYu"
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
			_env.units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.ACTOR)), "<", global.UnitPropGetter(_env, "hp")), 1, 1)

			global.RetainObject(_env, _env.TARGET)
			global.GroundEft(_env, _env.ACTOR, "Ground_LDYu")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.2,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1934
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.FriendMaster(_env) then
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, global.FriendMaster(_env), this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, global.FriendMaster(_env), heal, true)
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				67,
				134,
				267,
				434
			}, global.SplitValue(_env, damage, {
				0.2,
				0.2,
				0.2,
				0.2,
				0.2
			}))

			local hp = global.UnitPropGetter(_env, "hp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local real_damage = hp * this.SingleRateFactor
			real_damage = global.min(_env, real_damage, atk * 3)

			global.ApplyHPDamage(_env, _env.ACTOR, real_damage)
			global.DelayCall(_env, 700, global.ApplyHPDamage, _env.TARGET, real_damage)

			for _, unit in global.__iter__(_env.units) do
				local hpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, unit)

				if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "CURSE")) > 0 or hpRatio == 1 then
					global.DelayCall(_env, 700, global.ApplyHPDamage, _env.TARGET, real_damage)
				else
					global.ApplyHPRecovery(_env, unit, real_damage, false)

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
			end
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LDYu_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleRateFactor = externs.SingleRateFactor

		if this.SingleRateFactor == nil then
			this.SingleRateFactor = 0.3
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
			local buffeft = global.SpecialNumericEffect(_env, "+LDYu_Enter", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"LDYu_Passive"
				}
			}, {
				buffeft
			})

			local buff_count = global.SpecialPropGetter(_env, "LDYu_Enter")(_env, global.FriendField(_env))

			if buff_count and buff_count ~= 0 then
				buff_count = global.min(_env, buff_count, 5)
				local buffeft = global.NumericEffect(_env, "+singlerate", {
					"+Normal",
					"+Normal"
				}, this.SingleRateFactor * buff_count)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "LDYu_Passive",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
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

return _M
