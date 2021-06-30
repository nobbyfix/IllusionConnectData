local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.SectSkill_Master_XueZhan_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RateFactor = externs.RateFactor

		if this.RateFactor == nil then
			this.RateFactor = 0.1
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

			if global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.RateFactor)
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.RateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					duration = 99,
					group = "SectSkill_Master_XueZhan_1",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_XueZhan_1",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_XueZhan_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local atk_master = 0

				if global.FriendMaster(_env) then
					atk_master = global.UnitPropGetter(_env, "atk")(_env, global.FriendMaster(_env))
				end

				local buff1 = global.NumericEffect(_env, "+atk", {
					"+Normal",
					"+Normal"
				}, atk_master * this.AtkRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_XueZhan_2",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_XueZhan_2",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff1
				}, 1, 0)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_XueZhan_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.12
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_ACTION"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
		}, passive2)

		return this
	end,
	passive1 = function (_env, externs)
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+xuezhan_special_atk", {
					"?Normal"
				}, 3)
				local buffeft2 = global.SpecialNumericEffect(_env, "+xuezhan_special_maxhp", {
					"?Normal"
				}, this.MaxHpRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_XueZhan_3",
					timing = 0,
					limit = 1,
					tags = {
						"SECTSKILL",
						"SectSkill_Master_XueZhan_3",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "SECTSKILL", "SectSkill_Master_XueZhan_3"), 99)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_XueZhan_4 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.1
		end

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.1
		end

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.1
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft3 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_XueZhan_4",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_XueZhan_4",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_XueZhan_5 = {
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

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.15
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_XueZhan_5",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_XueZhan_5",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_XueZhan_6 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_XueZhan_6",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_XueZhan_6",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LieSha_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

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

			if global.MASTER(_env, _env.ACTOR) and not global.MARKED(_env, "DAGUN")(_env, _env.ACTOR) then
				local buffeft = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					duration = 99,
					group = "SectSkill_Master_LieSha_1",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_LieSha_1",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LieSha_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CardChangeValueFactor = externs.CardChangeValueFactor

		assert(this.CardChangeValueFactor ~= nil, "External variable `CardChangeValueFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:PRE_ENTER"
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

			if not global.MARKED(_env, "DAGUN")(_env, _env.ACTOR) then
				local cards = global.Slice(_env, global.SortBy(_env, global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR)), ">", global.GetCardCost), 1, 4)

				for _, card in global.__iter__(cards) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.CardChangeValueFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"SectSkill_Master_LieSha_2",
							"UNDISPELLABLE"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LieSha_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MasterHurtRateFactor = externs.MasterHurtRateFactor

		assert(this.MasterHurtRateFactor ~= nil, "External variable `MasterHurtRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS - global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Master_DmgExtra_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.MasterHurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_LieSha_1",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_LieSha_1",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LieSha_4 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.1
		end

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.1
		end

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.1
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft3 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_BiLei_4",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_BiLei_4",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LieSha_5 = {
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

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.15
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_BiLei_5",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_BiLei_5",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LieSha_6 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_LieSha_6",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_LieSha_6",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_BiLei_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				duration = 99,
				group = "SectSkill_Master_BiLei_1",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"SECTSKILL",
					"SectSkill_Master_BiLei_1",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end
}
all.SectSkill_Master_BiLei_2 = {
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS - global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft = global.ShieldEffect(_env, maxHp * this.ShieldFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					timing = 0,
					display = "Shield",
					group = "SectSkill_Master_BiLei_2",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_BiLei_2",
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
all.SectSkill_Master_BiLei_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyExFactor = externs.EnergyExFactor

		if this.EnergyExFactor == nil then
			this.EnergyExFactor = 5
		end

		this.EnergyReduce = externs.EnergyReduce

		if this.EnergyReduce == nil then
			this.EnergyReduce = 1
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
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MARKED(_env, "DAGUN")(_env, _env.ACTOR) then
				global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.EnergyExFactor)
			end
		end)

		return _env
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
			local cards = global.Slice(_env, global.SortBy(_env, global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR)), ">", global.GetCardCost), 1, 1)

			for _, card in global.__iter__(cards) do
				local cardvaluechange = global.CardCostEnchant(_env, "-", this.EnergyReduce, 1)

				global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
					tags = {
						"CARDBUFF",
						"SectSkill_Master_BiLei_3",
						"UNDISPELLABLE"
					}
				}, {
					cardvaluechange
				})
			end
		end)

		return _env
	end
}
all.SectSkill_Master_BiLei_4 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.1
		end

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.1
		end

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.1
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft3 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_BiLei_4",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_BiLei_4",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_BiLei_5 = {
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

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.15
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_BiLei_5",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_BiLei_5",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_BiLei_6 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_BiLei_6",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_BiLei_6",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_FuHun_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEHurtRateFactor = externs.AOEHurtRateFactor

		if this.AOEHurtRateFactor == nil then
			this.AOEHurtRateFactor = 0.25
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

			if global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+aoerate", {
					"+Normal",
					"+Normal"
				}, this.AOEHurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					duration = 99,
					group = "SectSkill_Master_FuHun_1",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"AOERATEUP",
						"SectSkill_Master_FuHun_1",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_FuHun_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEHurtRateFactor = externs.AOEHurtRateFactor

		if this.AOEHurtRateFactor == nil then
			this.AOEHurtRateFactor = 0.3
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS - global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.NumericEffect(_env, "+aoerate", {
					"+Normal",
					"+Normal"
				}, this.AOEHurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_FuHun_2",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"AOERATEUP",
						"SectSkill_Master_FuHun_2",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_FuHun_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnHurtRateFactor = externs.UnHurtRateFactor

		if this.UnHurtRateFactor == nil then
			this.UnHurtRateFactor = 0.35
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

			if global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					duration = 3,
					group = "SectSkill_Master_FuHun_3",
					timing = 1,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"UNHURTRATEUP",
						"SectSkill_Master_FuHun_3",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_FuHun_4 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.1
		end

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.1
		end

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.1
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft3 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_BiLei_4",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_BiLei_4",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_FuHun_5 = {
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

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.15
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_BiLei_5",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_BiLei_5",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_FuHun_6 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_FuHun_6",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_FuHun_6",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_SenLing_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BeCuredRateFactor = externs.BeCuredRateFactor

		if this.BeCuredRateFactor == nil then
			this.BeCuredRateFactor = 0.25
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

			if global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+becuredrate", {
					"+Normal",
					"+Normal"
				}, this.BeCuredRateFactor)

				global.ApplyBuff_Debuff(_env, _env.ACTOR, global.FriendMaster(_env), {
					timing = 0,
					display = "BeCuredRateUp",
					duration = 99,
					limit = 1,
					tags = {
						"STATUS",
						"BUFF",
						"BECUREDRATEUP",
						"DISPELLABLE",
						"SectSkill_Master_SenLing_1"
					}
				}, {
					buffeft1
				}, 1, 0)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_SenLing_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CureFactor = externs.CureFactor

		assert(this.CureFactor ~= nil, "External variable `CureFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_ENTER",
			1
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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.HPPeriodRecover(_env, "HOT", maxHp * this.CureFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					timing = 1,
					display = "Hot",
					group = "SectSkill_Master_SenLing_2",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_SenLing_2",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_SenLing_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DeAOERateFactor = externs.DeAOERateFactor

		assert(this.DeAOERateFactor ~= nil, "External variable `DeAOERateFactor` is not provided.")

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

			for _, unit in global.__iter__(global.AllUnits(_env)) do
				local buffeft1 = global.NumericEffect(_env, "-aoerate", {
					"+Normal",
					"+Normal"
				}, this.DeAOERateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
					duration = 99,
					group = "SectSkill_Master_SenLing_3",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"SectSkill_Master_SenLing_3",
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
all.SectSkill_Master_SenLing_4 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.1
		end

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.1
		end

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.1
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft3 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_SenLing_4",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_SenLing_4",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_SenLing_5 = {
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

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.15
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_SenLing_5",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_SenLing_5",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_SenLing_6 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_SenLing_6",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_SenLing_6",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LiMing_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 10
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[schedule_in_cycles]"](this, {
			1000
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

			global.ApplyRPRecovery(_env, _env.ACTOR, this.RpFactor)
		end)

		return _env
	end
}
all.SectSkill_Master_LiMing_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.08
		end

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

			if global.MASTER(_env, _env.ACTOR) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS - global.SUMMONS(_env, _env.unit) and global.SpecialPropGetter(_env, global.GetUnitCid(_env, _env.unit))(_env, _env.ACTOR) == 0 then
				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					display = "HurtRateUp",
					group = "SectSkill_Master_LiMing_2",
					duration = 99,
					limit = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"HURTRATEUP",
						"SectSkill_Master_LiMing_2",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)

				local buffeft_flag = global.SpecialNumericEffect(_env, "+" .. global.GetUnitCid(_env, _env.unit), {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft_flag
				})
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LiMing_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkFactor = externs.AtkFactor

		if this.AtkFactor == nil then
			this.AtkFactor = 0.12
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
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
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local atkrate = global.UnitPropGetter(_env, "atkrate")(_env, _env.ACTOR)
				local atk_pet = atk * atkrate * this.AtkFactor
				local buffeft1 = global.NumericEffect(_env, "+atk", {
					"+Normal",
					"+Normal"
				}, atk_pet)

				for _, unit in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR))) do
					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), unit, {
						duration = 99,
						group = "SectSkill_Master_LiMing_3",
						timing = 0,
						limit = 99,
						tags = {
							"CARDBUFF",
							"NUMERIC",
							"BUFF",
							"SECTSKILL",
							"ATKUP",
							"SectSkill_Master_LiMing_3",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})
				end
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LiMing_4 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.1
		end

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.1
		end

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		if this.MaxHpRateFactor == nil then
			this.MaxHpRateFactor = 0.1
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft3 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_LiMing_4",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_LiMing_4",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LiMing_5 = {
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

		this.DefRateFactor = externs.DefRateFactor

		if this.DefRateFactor == nil then
			this.DefRateFactor = 0.15
		end

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_LiMing_5",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_LiMing_5",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LiMing_6 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and -global.SUMMONS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_LiMing_6",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_LiMing_6",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_WuShi = {
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
			"UNIT_ENTER"
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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+extra_aoehurtrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_FuHun",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_JiangJun = {
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
			"UNIT_ENTER"
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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+extra_aoehurtrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_FuHun",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_ZhaoHuan = {
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
			"UNIT_ENTER"
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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+extra_aoehurtrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_FuHun",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_XueZhan = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * this.MaxHpRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_XueZhan",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_XueZhan",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_LieSha = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MasterHurtRateFactor = externs.MasterHurtRateFactor

		assert(this.MasterHurtRateFactor ~= nil, "External variable `MasterHurtRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Master_DmgExtra_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.MasterHurtRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_LieSha",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_LieSha",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_BiLei = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyExFactor = externs.EnergyExFactor

		assert(this.EnergyExFactor ~= nil, "External variable `EnergyExFactor` is not provided.")

		this.StepEnergyExFactor = externs.StepEnergyExFactor

		assert(this.StepEnergyExFactor ~= nil, "External variable `StepEnergyExFactor` is not provided.")

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
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
		}, passive)

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.EnergyExFactor)
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				if _env.prevHpPercent >= 80 and _env.curHpPercent < 80 then
					if not global.INSTATUS(_env, "SectSkill_Master_BiLei_2_FirstTime1")(_env, _env.ACTOR) then
						global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.StepEnergyExFactor)
						global.AddStatus(_env, _env.ACTOR, "SectSkill_Master_BiLei_2_FirstTime1")
					end
				end

				if _env.prevHpPercent >= 70 and _env.curHpPercent < 70 then
					if not global.INSTATUS(_env, "SectSkill_Master_BiLei_2_FirstTime2")(_env, _env.ACTOR) then
						global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.StepEnergyExFactor)
						global.AddStatus(_env, _env.ACTOR, "SectSkill_Master_BiLei_2_FirstTime2")
					end
				end

				if _env.prevHpPercent >= 60 and _env.curHpPercent < 60 then
					if not global.INSTATUS(_env, "SectSkill_Master_BiLei_2_FirstTime3")(_env, _env.ACTOR) then
						global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.StepEnergyExFactor)
						global.AddStatus(_env, _env.ACTOR, "SectSkill_Master_BiLei_2_FirstTime3")
					end
				end

				if _env.prevHpPercent >= 50 and _env.curHpPercent < 50 then
					if not global.INSTATUS(_env, "SectSkill_Master_BiLei_2_FirstTime4")(_env, _env.ACTOR) then
						global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.StepEnergyExFactor)
						global.AddStatus(_env, _env.ACTOR, "SectSkill_Master_BiLei_2_FirstTime4")
					end
				end
			end
		end)

		return _env
	end
}
all.SectSkill_Master_FuHun = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEHurtRateFactor = externs.AOEHurtRateFactor

		assert(this.AOEHurtRateFactor ~= nil, "External variable `AOEHurtRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, global.AtkRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					duration = 99,
					group = "SectSkill_Master_FuHun",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_FuHun",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}
all.SectSkill_Master_SenLing = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldRateFactor = externs.ShieldRateFactor

		assert(this.ShieldRateFactor ~= nil, "External variable `ShieldRateFactor` is not provided.")

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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.PETS(_env, _env.unit) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)
				local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.unit, {
					timing = 0,
					display = "Shield",
					group = "SectSkill_Master_SenLing",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SECTSKILL",
						"SectSkill_Master_SenLing",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				}, 1)
			end
		end)

		return _env
	end
}

return _M
