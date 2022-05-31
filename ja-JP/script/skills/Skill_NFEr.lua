local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_NFEr_Normal = {
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

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 200, "skill1"))
		end)
		exec["@time"]({
			367
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
all.Skill_NFEr_Proud = {
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
			"Hero_Proud_NFEr"
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
			800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
			global.ApplyHPRecovery(_env, _env.ACTOR, damage.val)
		end)

		return _env
	end
}
all.Skill_NFEr_Unique = {
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
			3100
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_NFEr"
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
			2100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local flag = 0
			local enemy_chosen = nil
			local hp_ratio_enemy = 0
			local hp_max_enemy = 0
			local friend_chosen = nil
			local hp_ratio_friend = 0
			local hp_max_friend = 0

			for _, unit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env, global.PETS - global.MARKED(_env, "SummonedNian")), ">", global.UnitPropGetter(_env, "hpRatio")), 1, 1)) do
				hp_ratio_enemy = global.UnitPropGetter(_env, "hpRatio")(_env, unit)
				hp_max_enemy = global.UnitPropGetter(_env, "maxHp")(_env, unit)
				enemy_chosen = unit
			end

			for _, unit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.MARKED(_env, "SummonedNian")), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)) do
				hp_ratio_friend = global.UnitPropGetter(_env, "hpRatio")(_env, unit)
				hp_max_friend = global.UnitPropGetter(_env, "maxHp")(_env, unit)
				friend_chosen = unit
			end

			if enemy_chosen and friend_chosen and hp_ratio_friend < hp_ratio_enemy then
				local buff_show = global.SpecialNumericEffect(_env, "+hpchange_show", {
					"?Normal"
				}, 0)

				global.ApplyBuff(_env, enemy_chosen, {
					timing = 1,
					duration = 1,
					display = "ChangeHp",
					tags = {}
				}, {
					buff_show
				})
				global.ApplyHPReduce(_env, enemy_chosen, hp_max_enemy * (hp_ratio_enemy - hp_ratio_friend))
				global.ApplyHPRecovery(_env, friend_chosen, hp_max_friend * (hp_ratio_enemy - hp_ratio_friend))

				flag = 1
			end

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if flag == 0 then
					damage.val = damage.val * 1.2
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			2900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_NFEr_Passive = {
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
			local buffeft = global.SpecialNumericEffect(_env, "+passive", {
				"?Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"AJYHou_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft
			})
		end)

		return _env
	end
}
all.Skill_NFEr_Proud_EX = {
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
			"Hero_Proud_NFEr"
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
			800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
			global.ApplyHPRecovery(_env, _env.ACTOR, damage.val)
			global.ApplyHPRecovery(_env, global.FriendMaster(_env), damage.val)
		end)

		return _env
	end
}
all.Skill_NFEr_Unique_EX = {
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
			3100
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_NFEr"
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
			2100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local flag = 0
			local enemy_chosen = nil
			local hp_ratio_enemy = 0
			local hp_max_enemy = 0
			local friend_chosen = nil
			local hp_ratio_friend = 0
			local hp_max_friend = 0

			for _, unit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env, global.PETS - global.MARKED(_env, "SummonedNian")), ">", global.UnitPropGetter(_env, "hpRatio")), 1, 1)) do
				hp_ratio_enemy = global.UnitPropGetter(_env, "hpRatio")(_env, unit)
				hp_max_enemy = global.UnitPropGetter(_env, "maxHp")(_env, unit)
				enemy_chosen = unit
			end

			for _, unit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.MARKED(_env, "SummonedNian")), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)) do
				hp_ratio_friend = global.UnitPropGetter(_env, "hpRatio")(_env, unit)
				hp_max_friend = global.UnitPropGetter(_env, "maxHp")(_env, unit)
				friend_chosen = unit
			end

			if enemy_chosen and friend_chosen and hp_ratio_friend < hp_ratio_enemy then
				local buff_show = global.SpecialNumericEffect(_env, "+hpchange_show", {
					"?Normal"
				}, 0)

				global.ApplyBuff(_env, enemy_chosen, {
					timing = 1,
					duration = 1,
					display = "ChangeHp",
					tags = {}
				}, {
					buff_show
				})
				global.ApplyHPReduce(_env, enemy_chosen, hp_max_enemy * (hp_ratio_enemy - hp_ratio_friend))
				global.ApplyHPRecovery(_env, friend_chosen, hp_max_friend * (hp_ratio_enemy - hp_ratio_friend))

				flag = 1
			end

			for _, unit in global.__iter__(_env.units) do
				local buffeft = global.NumericEffect(_env, "-becuredrate", {
					"+Normal",
					"+Normal"
				}, 0.3)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
					timing = 2,
					display = "BeCuredRateDown",
					group = "Skill_LFEr_Unique",
					duration = 2,
					limit = 1,
					tags = {
						"STATUS",
						"DEBUFF",
						"BECUREDRATEDOWN",
						"DISPELLABLE"
					}
				}, {
					buffeft
				}, 1, 0)
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if flag == 0 then
					damage.val = damage.val * 1.2
				end

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			2900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_NFEr_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		if this.ShieldRateFactor == nil then
			this.ShieldRateFactor = 0.2
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
			"SELF:BUFF_APPLYED"
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
			local buffeft = global.SpecialNumericEffect(_env, "+passive", {
				"?Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"AJYHou_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft
			})
		end)

		return _env
	end,
	passive2 = function (_env, externs)
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
			local count1 = global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "AJYHou_Passive_Done"))
			local count2 = global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "AJYHou_Passive_Shield"))

			if count1 ~= 0 and count2 == 0 then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 1,
					display = "Shield",
					group = "AJYHou_Passive_Shield",
					duration = 1,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"AJYHou_Passive_Shield",
						"SHIELD",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end
}

return _M
