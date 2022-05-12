local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_LFEr_Normal = {
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
			1034
		}, main)
		this.main = global["[load]"](this, {
			"Movie_LFEr_Skill1"
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
				-1.3,
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
all.Skill_LFEr_Proud = {
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
			1500
		}, main)
		main = global["[proud]"](this, {
			"Hero_Proud_LFEr"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_LFEr_Skill2"
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1000
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
all.Skill_LFEr_Unique = {
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

		this.DeBeCuredRateFactor = externs.DeBeCuredRateFactor

		assert(this.DeBeCuredRateFactor ~= nil, "External variable `DeBeCuredRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3000
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_LFEr"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_LFEr_Skill3"
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
		_env.friendunits = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, global.GetSide(_env, _env.TARGET), 0, 2) + {
				-0.4,
				0
			}, 100, "skill3"))

			_env.friendunits = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			global.HealTargetView(_env, _env.friendunits)
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.friendunits[1] then
				for _, Funit in global.__iter__(_env.friendunits) do
					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, Funit)

					global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, Funit, {
						val = maxHp
					}, false, true)

					local buffeft2 = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, Funit, {
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

					local buffeft3 = global.NumericEffect(_env, "-becuredrate", {
						"+Normal",
						"+Normal"
					}, this.DeBeCuredRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, Funit, {
						timing = 0,
						display = "BeCuredRateDown",
						group = "Skill_LFEr_Unique",
						duration = 99,
						limit = 1,
						tags = {
							"STATUS",
							"DEBUFF",
							"BECUREDRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft3
					}, 1, 0)
				end
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.AddAnim(_env, {
				loop = 1,
				anim = "cisha_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.TARGET)
			})
			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
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
all.Skill_LFEr_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.FriendMaster(_env) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, global.FriendMaster(_env))

				global.ApplyHPRecovery(_env, global.FriendMaster(_env), maxHp * this.HealRateFactor)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, global.FriendMaster(_env), {
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
all.Skill_LFEr_Proud_EX = {
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

		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1500
		}, main)
		main = global["[proud]"](this, {
			"Hero_Proud_LFEr"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_LFEr_Skill2"
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			for _, unit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)) do
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, unit, this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, unit, heal, false, true)

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
all.Skill_LFEr_Unique_EX = {
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

		this.DeBeCuredRateFactor = externs.DeBeCuredRateFactor

		assert(this.DeBeCuredRateFactor ~= nil, "External variable `DeBeCuredRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3000
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_LFEr"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_LFEr_Skill3"
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
		_env.friendunits = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, global.GetSide(_env, _env.TARGET), 0, 2) + {
				-0.4,
				0
			}, 100, "skill3"))

			_env.friendunits = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			global.HealTargetView(_env, _env.friendunits)
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.friendunits[1] then
				for _, Funit in global.__iter__(_env.friendunits) do
					if global.IsAlive(_env, Funit) == false then
						break
					end

					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, Funit)

					global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, Funit, {
						val = maxHp
					}, false, true)

					local buffeft2 = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyBuff(_env, Funit, {
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

					local buffeft3 = global.NumericEffect(_env, "-becuredrate", {
						"+Normal",
						"+Normal"
					}, this.DeBeCuredRateFactor)

					global.ApplyBuff_Debuff(_env, _env.ACTOR, Funit, {
						timing = 0,
						display = "BeCuredRateDown",
						group = "Skill_LFEr_Unique",
						duration = 99,
						limit = 1,
						tags = {
							"STATUS",
							"DEBUFF",
							"BECUREDRATEDOWN",
							"DISPELLABLE"
						}
					}, {
						buffeft3
					}, 1, 0)
				end
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.AddAnim(_env, {
				loop = 1,
				anim = "cisha_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.TARGET)
			})
			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
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
all.Skill_LFEr_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		this.CureRateFactor = externs.CureRateFactor

		assert(this.CureRateFactor ~= nil, "External variable `CureRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+curerate", {
				"+Normal",
				"+Normal"
			}, this.CureRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"Skill_LFEr_Passive_EX",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.FriendMaster(_env) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, global.FriendMaster(_env))

				global.ApplyHPRecovery(_env, global.FriendMaster(_env), maxHp * this.HealRateFactor)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, global.FriendMaster(_env), {
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

return _M
