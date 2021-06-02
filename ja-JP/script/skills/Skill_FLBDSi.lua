local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_FLBDSi_Normal = {
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
			933
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
all.Skill_FLBDSi_Proud = {
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

		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.08
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1434
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_FLBDSi"
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
				-1.9,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			867
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			for _, unit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), ">", global.UnitPropGetter(_env, "atk")), 1, 1)) do
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					timing = 0,
					display = "AtkUp",
					group = "Skill_FLBDSi_Proud",
					duration = 99,
					limit = 3,
					tags = {
						"Skill_FLBDSi_Proud",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"ATKUP",
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
all.Skill_FLBDSi_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.15
		end

		this.HpRateFactor = externs.HpRateFactor

		if this.HpRateFactor == nil then
			this.HpRateFactor = 0.15
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3567
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FLBDSi"
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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
		end)
		exec["@time"]({
			3067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)
				local buffeft2 = global.MaxHpEffect(_env, global.min(_env, maxHp * this.HpRateFactor, atk * 2))

				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					timing = 0,
					display = "AtkUp",
					group = "Skill_FLBDSi_Unique_AtkRate",
					duration = 99,
					limit = 2,
					tags = {
						"Skill_FLBDSi_Unique",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					duration = 99,
					group = "Skill_FLBDSi_Unique_MaxHpRate",
					timing = 0,
					limit = 2,
					tags = {
						"Skill_FLBDSi_Unique",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"MAXHPUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				}, 1, 0)
			end

			for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))) do
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local maxHp = global.GetHeroCardAttr(_env, card, "maxHp")
				local buffeft2 = global.MaxHpEffect(_env, global.min(_env, maxHp * this.HpRateFactor, atk * 2))

				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
					timing = 0,
					display = "AtkUp",
					group = "Skill_FLBDSi_Unique_AtkRate",
					duration = 99,
					limit = 2,
					tags = {
						"Skill_FLBDSi_Unique",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
					duration = 99,
					group = "Skill_FLBDSi_Unique_MaxHpRate",
					timing = 0,
					limit = 2,
					tags = {
						"Skill_FLBDSi_Unique",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"MAXHPUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
				global.FlyBallEffect(_env, _env.ACTOR, card)
			end
		end)

		return _env
	end
}
all.Skill_FLBDSi_Passive = {
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
			"SELF:PRE_ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK_BY_OTHERSET"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_DIE"
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

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "FLBDSi"))) do
				global.addHeroCardSeatRules(_env, global.GetOwner(_env, _env.ACTOR), card, {
					"LIGHT",
					"MAGE",
					"SUMMONER"
				}, {
					"kick",
					"kick",
					"kick"
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

		_env.newunit = externs.newunit

		assert(_env.newunit ~= nil, "External variable `newunit` is not provided.")

		_env.dierule = externs.dierule

		assert(_env.dierule ~= nil, "External variable `dierule` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, "FLBDSi")(_env, _env.newunit) and _env.dierule == "kick" and global.MASTER(_env, _env.ACTOR) then
				local cardlocation = global.GetCardWindowIndex(_env, _env.newunit)

				if cardlocation == 0 then
					cardlocation = global.Random(_env, 1, 4)
				end

				local card = global.BackToWindow(_env, _env.unit, cardlocation)
				local buff = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"Skill_FLBDSi_Passive"
					}
				}, {
					buff
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, "FLBDSi")(_env, _env.unit) and global.MASTER(_env, _env.ACTOR) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_FLBDSi_Passive")) > 0 then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "FLBDSi"))) do
					global.clearHeroCardSeatRules(_env, global.GetOwner(_env, _env.ACTOR), card, {
						"LIGHT",
						"MAGE",
						"SUMMONER"
					}, {
						"kick",
						"kick",
						"kick"
					})
				end
			end
		end)

		return _env
	end
}
all.Skill_FLBDSi_Proud_EX = {
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

		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.16
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1434
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_FLBDSi"
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
				-1.9,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			867
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			for _, unit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS), ">", global.UnitPropGetter(_env, "atk")), 1, 1)) do
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					timing = 0,
					display = "AtkUp",
					group = "Skill_FLBDSi_Proud",
					duration = 99,
					limit = 3,
					tags = {
						"Skill_FLBDSi_Proud",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"ATKUP",
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
all.Skill_FLBDSi_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.25
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
			3567
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FLBDSi"
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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
		end)
		exec["@time"]({
			3067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)
				local buffeft2 = global.MaxHpEffect(_env, global.min(_env, maxHp * this.HpRateFactor, atk * 2))

				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					timing = 0,
					display = "AtkUp",
					group = "Skill_FLBDSi_Unique_AtkRate",
					duration = 99,
					limit = 2,
					tags = {
						"Skill_FLBDSi_Unique",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1, 0)
				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					duration = 99,
					group = "Skill_FLBDSi_Unique_MaxHpRate",
					timing = 0,
					limit = 2,
					tags = {
						"Skill_FLBDSi_Unique",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"MAXHPUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				}, 1, 0)
			end

			for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))) do
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local maxHp = global.GetHeroCardAttr(_env, card, "maxHp")
				local buffeft2 = global.MaxHpEffect(_env, global.min(_env, maxHp * this.HpRateFactor, atk * 2))

				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
					timing = 0,
					display = "AtkUp",
					group = "Skill_FLBDSi_Unique_AtkRate",
					duration = 99,
					limit = 2,
					tags = {
						"Skill_FLBDSi_Unique",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"ATKUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
					duration = 99,
					group = "Skill_FLBDSi_Unique_MaxHpRate",
					timing = 0,
					limit = 2,
					tags = {
						"Skill_FLBDSi_Unique",
						"STATUS",
						"NUMERIC",
						"BUFF",
						"MAXHPUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
				global.FlyBallEffect(_env, _env.ACTOR, card)
			end
		end)

		return _env
	end
}
all.Skill_FLBDSi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyFactor = externs.EnergyFactor

		if this.EnergyFactor == nil then
			this.EnergyFactor = 3
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:PRE_ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK_BY_OTHERSET"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_DIE"
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

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "FLBDSi"))) do
				global.addHeroCardSeatRules(_env, global.GetOwner(_env, _env.ACTOR), card, {
					"LIGHT",
					"MAGE",
					"SUMMONER"
				}, {
					"kick",
					"kick",
					"kick"
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

		_env.newunit = externs.newunit

		assert(_env.newunit ~= nil, "External variable `newunit` is not provided.")

		_env.dierule = externs.dierule

		assert(_env.dierule ~= nil, "External variable `dierule` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, "FLBDSi")(_env, _env.newunit) and _env.dierule == "kick" and global.MASTER(_env, _env.ACTOR) then
				local cardlocation = global.GetCardWindowIndex(_env, _env.newunit)

				if cardlocation == 0 then
					cardlocation = global.Random(_env, 1, 4)
				end

				local card = global.BackToWindow(_env, _env.unit, cardlocation)
				local buff = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"Skill_FLBDSi_Passive"
					}
				}, {
					buff
				})

				local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyFactor, 1)

				global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
					tags = {
						"CARDBUFF",
						"UNDISPELLABLE",
						"Skill_FLBDSi_Passive_EX"
					}
				}, {
					cardvaluechange
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, "FLBDSi")(_env, _env.unit) and global.MASTER(_env, _env.ACTOR) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_FLBDSi_Passive")) > 0 then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "FLBDSi"))) do
					global.clearHeroCardSeatRules(_env, global.GetOwner(_env, _env.ACTOR), card, {
						"LIGHT",
						"MAGE",
						"SUMMONER"
					}, {
						"kick",
						"kick",
						"kick"
					})
				end
			end
		end)

		return _env
	end
}

return _M
