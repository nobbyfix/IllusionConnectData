local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.ArenaFixed_1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleDeRateFactor = externs.SingleDeRateFactor

		assert(this.SingleDeRateFactor ~= nil, "External variable `SingleDeRateFactor` is not provided.")

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
			"SELF:ENTER"
		}, passive)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive2)

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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.NumericEffect(_env, "+singlerate", {
				"+Normal",
				"+Normal"
			}, this.SingleDeRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, 0.35)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "ArenaFixed_1",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
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
			local master = global.FriendMaster(_env)

			if master then
				local buffeft3 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, 0.35)

				global.ApplyBuff(_env, master, {
					duration = 99,
					group = "ArenaFixed_1_2",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft3
				})
			end
		end)

		return _env
	end
}
all.ArenaFixed_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEDeRateFactor = externs.AOEDeRateFactor

		assert(this.AOEDeRateFactor ~= nil, "External variable `AOEDeRateFactor` is not provided.")

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
			"SELF:ENTER"
		}, passive)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive2)

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
			local buffeft1 = global.NumericEffect(_env, "+aoerate", {
				"+Normal",
				"+Normal"
			}, this.AOEDeRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "ArenaFixed_2",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end,
	passive2 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local master = global.FriendMaster(_env)

			if master then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, global.FriendMaster(_env))
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, 0.35)

				global.ApplyBuff(_env, master, {
					duration = 99,
					group = "ArenaFixed_2_2",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
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
all.ArenaFixed_3 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CriRateFactor = externs.CriRateFactor

		assert(this.CriRateFactor ~= nil, "External variable `CriRateFactor` is not provided.")

		this.RageFactor = externs.RageFactor

		assert(this.RageFactor ~= nil, "External variable `RageFactor` is not provided.")

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
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			0
		}, main)
		this.main = global["[trigger_by]"](this, {
			"UNIT_CRIT"
		}, main)

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
			local buffeft1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CriRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "ArenaFixed_3",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end,
	main = function (_env, externs)
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

			global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)
		end)

		return _env
	end
}
all.ArenaFixed_4 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageFactor = externs.RageFactor

		assert(this.RageFactor ~= nil, "External variable `RageFactor` is not provided.")

		this.BeCuredRateFactor = externs.BeCuredRateFactor

		assert(this.BeCuredRateFactor ~= nil, "External variable `BeCuredRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+becuredrate", {
				"+Normal",
				"+Normal"
			}, this.BeCuredRateFactor)
			local buff = global.SpecialNumericEffect(_env, "+BeCuredRage", {
				"+Normal",
				"+Normal"
			}, this.RageFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "ArenaFixed_4",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff,
				buffeft1
			})
		end)

		return _env
	end
}
all.ArenaFixed_5 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpRateFactor = externs.MaxHpRateFactor

		assert(this.MaxHpRateFactor ~= nil, "External variable `MaxHpRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			0
		}, main)
		this.main = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive)
		passive = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive)

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

			if not global.MASTER(_env, _env.ACTOR) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft1 = global.MaxHpEffect(_env, maxHp * 0.35)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_5",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft2 = global.NumericEffect(_env, "+reflection", {
					"+Normal",
					"+Normal"
				}, 0.25)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_5_2",
					timing = 0,
					limit = 99,
					tags = {
						"NUMERIC",
						"BUFF",
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
all.ArenaFixed_6 = {
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
			"SELF:KILL_UNIT"
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

			if global.ProbTest(_env, 0.4) then
				global.ApplyRPRecovery(_env, _env.ACTOR, 1000)
			end
		end)

		return _env
	end
}
all.ArenaFixed_7 = {
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
			local buffeft2 = global.SpecialNumericEffect(_env, "+delrppoint", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft3 = global.SpecialNumericEffect(_env, "+delrprate", {
				"+Normal",
				"+Normal"
			}, 0.5)
			local buffeft4 = global.SpecialNumericEffect(_env, "-delrpvalue", {
				"+Normal",
				"+Normal"
			}, 200)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "ArenaFixed_7",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2,
				buffeft3,
				buffeft4
			})
		end)

		return _env
	end
}
all.ArenaFixed_9 = {
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
			"SELF:BEFORE_UNIQUE"
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
			local RateFactor = 0.2
			local HpRateFactor = 0.5
			local RageFactor = 500
			local reviveunit = global.ProbTest(_env, RateFactor) and global.Revive(_env, HpRateFactor, RageFactor, {
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
		end)

		return _env
	end
}
all.ArenaFixed_10 = {
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
			local Healfactor = 2
			local buffeft = global.SpecialNumericEffect(_env, "+ExtraHP", {
				"+Normal",
				"+Normal"
			}, Healfactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "ArenaFixed_10",
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
		end)

		return _env
	end
}
all.ArenaFixed_11 = {
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
			local count = #global.EnemyUnits(_env, global.PETS - global.SUMMONS)
			local factor = 0.1
			local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, factor * count)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "ArenaFixed_11",
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
		end)

		return _env
	end
}
all.ArenaFixed_12 = {
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
		main = global["[duration]"](this, {
			0
		}, main)
		this.main = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, main)

		return this
	end,
	main = function (_env, externs)
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
			local def_factor = 0.2

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.SUMMONS(_env, _env.unit) then
				local buffeft1 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, def_factor)
				local buffeft2 = global.Taunt(_env)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "ArenaFixed_12",
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
				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					display = "Taunt",
					group = "ArenaFixed_12_taunt",
					duration = 99,
					limit = 1,
					tags = {
						"STATUS",
						"BUFF",
						"TAUNT",
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
all.ArenaFixed_14 = {
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
		main = global["[duration]"](this, {
			0
		}, main)
		this.main = global["[trigger_by]"](this, {
			"SELF:ENTER"
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
			local i = global.Random(_env, 1, 4)
			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, 0.1)
			local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, 0.1)
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft3 = global.ShieldEffect(_env, maxHp * 0.15)
			local buffeft4 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, 0.05)

			if i == 1 then
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "UnHurtRateUp",
					group = "ArenaFixed_14_1",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"UNHURTRATEUP"
					}
				}, {
					buffeft1
				})
			elseif i == 2 then
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "HurtRateUp",
					group = "ArenaFixed_14_2",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"HURTRATEUP"
					}
				}, {
					buffeft2
				})
			elseif i == 3 then
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "Shield",
					group = "ArenaFixed_14_3",
					duration = 99,
					limit = 1,
					tags = {
						"STATUS",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"SHIELD"
					}
				}, {
					buffeft3
				})
			else
				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "CritRateUp",
					group = "ArenaFixed_14_4",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"CRITRATEUP"
					}
				}, {
					buffeft4
				})
			end
		end)

		return _env
	end
}
all.ArenaFixed_15 = {
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
		main = global["[duration]"](this, {
			0
		}, main)
		this.main = global["[trigger_by]"](this, {
			"SELF:ENTER"
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
			local factor = 0.03
			local count = 0

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				count = count + global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "BUFF"))
			end

			local buffeft = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, factor * count)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				display = "HurtRateUp",
				group = "ArenaFixed_15",
				duration = 99,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"HURTRATEUP"
				}
			}, {
				buffeft
			})
		end)

		return _env
	end
}
all.ArenaFixed_18 = {
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

		_env.count = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.ACTOR) then
				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					_env.count = _env.count + 1
				end

				global.ApplyRPRecovery(_env, _env.ACTOR, _env.count * 70)
			end
		end)

		return _env
	end
}
all.ArenaFixed_19 = {
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
		passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_ACTION"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.count = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MARKED(_env, "SUMMONED")(_env, _env.ACTOR) then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.SUMMONS(_env, unit) then
						_env.count = _env.count + 1
					end
				end

				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ArenaFixed_19"), 99)

				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, 0.2 * _env.count)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_19",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"ArenaFixed_19"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.ArenaFixed_20 = {
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
		passive = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+reflection", {
					"+Normal",
					"+Normal"
				}, 0.15)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_20",
					timing = 0,
					limit = 5,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"REFLECTION"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.ArenaFixed_21 = {
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

		_env.count = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.ACTOR) then
				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					_env.count = _env.count + 1
				end

				local buffeft1 = global.NumericEffect(_env, "+critrate", {
					"+Normal",
					"+Normal"
				}, 0.08 * _env.count)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 1,
					duration = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"CRITRATE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.ArenaFixed_22 = {
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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive2)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.count1 = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.ACTOR) then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.MARKED(_env, "ASSASSIN")(_env, unit) then
						_env.count1 = _env.count1 + 1
					end
				end

				if _env.count1 > 2 then
					_env.count1 = 2
				end

				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, 0.2 * _env.count1)

				for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS)) do
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "skill_ArenaFixed_22")) > 0 then
						global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "skill_ArenaFixed_22"), 1)
					end

					global.ApplyBuff(_env, unit, {
						duration = 99,
						group = "ArenaFixed_22",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"CRITRATE",
							"skill ArenaFixed_22"
						}
					}, {
						buffeft1
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

		_env.count2 = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "ASSASSIN")(_env, _env.ACTOR) then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.MARKED(_env, "ASSASSIN")(_env, unit) then
						_env.count2 = _env.count2 + 1
					end
				end

				if _env.count2 > 2 then
					_env.count2 = 2
				end

				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, 0.2 * _env.count2)

				for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS)) do
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "skill_ArenaFixed_22")) > 0 then
						global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "skill_ArenaFixed_22"), 1)
					end

					global.ApplyBuff(_env, unit, {
						duration = 99,
						group = "ArenaFixed_22",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"CRITRATE",
							"skill_ArenaFixed_22"
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
all.ArenaFixed_23 = {
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

		_env.count = 0
		_env.count_default = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.ACTOR) then
				if global.MARKED(_env, "ASSASSIN")(_env, _env.ACTOR) then
					_env.count = 1
				end

				for _, unit in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "ASSASSIN"))) do
					_env.count = _env.count + 1
				end

				if global.FriendMaster(_env) then
					_env.count_default = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				if _env.count_default and _env.count_default ~= 0 then
					-- Nothing
				else
					local buff = global.SpecialNumericEffect(_env, "+startcount", {
						"+Normal",
						"+Normal"
					}, _env.count)

					if global.FriendMaster(_env) then
						global.ApplyBuff(_env, global.FriendMaster(_env), {
							duration = 99,
							group = "ArenaFixed_23_count",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"STARTCOUNT",
								"skill_ArenaFixed_23",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
					end
				end

				if global.FriendMaster(_env) then
					_env.count = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				if _env.count > 3 then
					local buffeft1 = global.NumericEffect(_env, "+critrate", {
						"+Normal",
						"+Normal"
					}, 0.2)
					local buffeft2 = global.NumericEffect(_env, "+critstrg", {
						"+Normal",
						"+Normal"
					}, 0.5)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "ArenaFixed_23",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"skill_ArenaFixed_23",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1,
						buffeft2
					})
				end
			end
		end)

		return _env
	end
}
all.ArenaFixed_24 = {
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

		_env.count = 0
		_env.count_default = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "MAGE")(_env, _env.ACTOR) then
				_env.count = 1

				for _, unit in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "MAGE"))) do
					_env.count = _env.count + 1
				end

				if global.FriendMaster(_env) then
					_env.count_default = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				if _env.count_default and _env.count_default ~= 0 then
					-- Nothing
				else
					local buff = global.SpecialNumericEffect(_env, "+startcount", {
						"+Normal",
						"+Normal"
					}, _env.count)

					if global.FriendMaster(_env) then
						global.ApplyBuff(_env, global.FriendMaster(_env), {
							duration = 99,
							group = "ArenaFixed_24_count",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"STARTCOUNT",
								"ArenaFixed_24",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
					end
				end

				if global.FriendMaster(_env) then
					_env.count = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				local buffeft1 = global.SpecialNumericEffect(_env, "+delrppoint", {
					"+Normal",
					"+Normal"
				}, 0)
				local buffeft2 = global.SpecialNumericEffect(_env, "+delrprate", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft3 = global.SpecialNumericEffect(_env, "+delrpvalue", {
					"+Normal",
					"+Normal"
				}, 40 * _env.count)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_24",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"ArenaFixed_24",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				})
			end
		end)

		return _env
	end
}
all.ArenaFixed_25 = {
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
		passive = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+aoerate", {
					"+Normal",
					"+Normal"
				}, 0.1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_25",
					timing = 0,
					limit = 5,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"REFLECTION"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.ArenaFixed_26 = {
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

		_env.count = 0
		_env.count_default = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.ACTOR) then
				if global.MARKED(_env, "MAGE")(_env, _env.ACTOR) then
					_env.count = 1
				end

				for _, unit in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "MAGE"))) do
					_env.count = _env.count + 1
				end

				if global.FriendMaster(_env) then
					_env.count_default = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				if _env.count_default and _env.count_default ~= 0 then
					-- Nothing
				else
					local buff = global.SpecialNumericEffect(_env, "+startcount", {
						"+Normal",
						"+Normal"
					}, _env.count)

					if global.FriendMaster(_env) then
						global.ApplyBuff(_env, global.FriendMaster(_env), {
							duration = 99,
							group = "ArenaFixed_26_count",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"STARTCOUNT",
								"ArenaFixed_26",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
					end
				end

				if global.FriendMaster(_env) then
					_env.count = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				if _env.count > 4 then
					local buffeft = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, 0.5)

					if global.MARKED(_env, "MAGE")(_env, _env.ACTOR) then
						global.ApplyBuff(_env, _env.ACTOR, {
							duration = 99,
							group = "ArenaFixed_26",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"ArenaFixed_26",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft
						})
					end
				end
			end
		end)

		return _env
	end
}
all.ArenaFixed_27 = {
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

		_env.count = 0
		_env.count_default = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.ACTOR) then
				if global.MARKED(_env, "ASSASSIN")(_env, _env.ACTOR) then
					_env.count = 1
				end

				for _, unit in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "ASSASSIN"))) do
					_env.count = _env.count + 1
				end

				if global.FriendMaster(_env) then
					_env.count_default = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				if _env.count_default and _env.count_default ~= 0 then
					-- Nothing
				else
					local buff = global.SpecialNumericEffect(_env, "+startcount", {
						"+Normal",
						"+Normal"
					}, _env.count)

					if global.FriendMaster(_env) then
						global.ApplyBuff(_env, global.FriendMaster(_env), {
							duration = 99,
							group = "ArenaFixed_27_count",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"STARTCOUNT",
								"ArenaFixed_27",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
					end
				end

				if global.FriendMaster(_env) then
					_env.count = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				if _env.count > 2 then
					local buffeft = global.NumericEffect(_env, "+critstrg", {
						"+Normal",
						"+Normal"
					}, 0.5)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "ArenaFixed_27",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"ArenaFixed_27",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft
					})
				end
			end
		end)

		return _env
	end
}
all.ArenaFixed_28 = {
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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
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

		_env.count = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "MAGE")(_env, _env.ACTOR) then
				local buffeft = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, 0.2)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_28",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"ArenaFixed_28",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
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
			local buff = global.NumericEffect(_env, "-unhurtrate", {
				"+Normal",
				"+Normal"
			}, 0.2)

			for _, unit1 in global.__iter__(global.AllUnits(_env, global.PETS)) do
				if global.SelectBuffCount(_env, unit1, global.BUFF_MARKED_ANY(_env, "DAZE", "MUTE")) ~= 0 and global.SelectBuffCount(_env, unit1, global.BUFF_MARKED_ALL(_env, "ArenaFixed_28", "UNHURTRATEDOWN")) == 0 then
					global.ApplyBuff(_env, unit1, {
						timing = 1,
						display = "UnHurtRateDown",
						group = "ArenaFixed_28_UnHurtRateDown",
						duration = 3,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"ArenaFixed_28",
							"UNHURTRATEDOWN",
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
	end
}
all.ArenaFixed_29 = {
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

		_env.count = 0
		_env.count_default = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.ACTOR) then
				if global.MARKED(_env, "HEALER")(_env, _env.ACTOR) then
					_env.count = 1
				end

				for _, unit in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "HEALER"))) do
					_env.count = _env.count + 1
				end

				if global.FriendMaster(_env) then
					_env.count_default = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				if _env.count_default and _env.count_default ~= 0 then
					-- Nothing
				else
					local buff = global.SpecialNumericEffect(_env, "+startcount", {
						"+Normal",
						"+Normal"
					}, _env.count)

					if global.FriendMaster(_env) then
						global.ApplyBuff(_env, global.FriendMaster(_env), {
							duration = 99,
							group = "ArenaFixed_29_count",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"STARTCOUNT",
								"ArenaFixed_29",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
					end
				end

				if global.FriendMaster(_env) then
					_env.count = global.SpecialPropGetter(_env, "startcount")(_env, global.FriendMaster(_env))
				end

				if _env.count > 1 then
					local buffeft = global.NumericEffect(_env, "+curerate", {
						"+Normal",
						"+Normal"
					}, 0.5)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "ArenaFixed_29",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"BUFF",
							"ArenaFixed_29",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft
					})

					if global.MARKED(_env, "HEALER")(_env, _env.ACTOR) then
						local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
						local buffeft1 = global.MaxHpEffect(_env, maxHp * 0.5)

						global.ApplyBuff(_env, _env.ACTOR, {
							duration = 99,
							group = "skill_ArenaFixed_29_MaxHp",
							timing = 0,
							limit = 1,
							tags = {
								"NUMERIC",
								"BUFF",
								"ArenaFixed_29",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buffeft1
						})
					end
				end
			end
		end)

		return _env
	end
}
all.ArenaFixed_HurtRateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Time1 = externs.Time1

		assert(this.Time1 ~= nil, "External variable `Time1` is not provided.")

		this.Time2 = externs.Time2

		assert(this.Time2 ~= nil, "External variable `Time2` is not provided.")

		this.Time3 = externs.Time3

		assert(this.Time3 ~= nil, "External variable `Time3` is not provided.")

		this.HurtRateFactor1 = externs.HurtRateFactor1

		assert(this.HurtRateFactor1 ~= nil, "External variable `HurtRateFactor1` is not provided.")

		this.HurtRateFactor2 = externs.HurtRateFactor2

		assert(this.HurtRateFactor2 ~= nil, "External variable `HurtRateFactor2` is not provided.")

		this.HurtRateFactor3 = externs.HurtRateFactor3

		assert(this.HurtRateFactor3 ~= nil, "External variable `HurtRateFactor3` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[schedule_in_cycles]"](this, {
			1000,
			ending = 999000,
			start = 1000,
			priority = 0
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.print(_env, "initial_Time1==-=", this.Time1)
			global.print(_env, "initial_Time2==-=", this.Time2)
			global.print(_env, "initial_Time3==-=", this.Time3)

			local Time = global.GetbattleTime(_env)
			Time = global.ceil(_env, Time / 1000)

			global.print(_env, "Time==-=", Time)
			global.print(_env, "--------------------------------------------------==-=", Time)

			if Time < this.Time1 then
				global.ShowEnhanceUp(_env, this.Time1 - Time, this.HurtRateFactor1 * 100)
			elseif Time == this.Time1 then
				local buff = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor1)

				for _, unit in global.__iter__(global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
					if not global.MASTER(_env, unit) and global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "ArenaFixed_HurtRateUp_1")) == 0 then
						global.ApplyBuff(_env, unit, {
							timing = 4,
							display = "HurtRateUp",
							group = "ArenaFixed_HurtRateUp",
							limit = 1,
							duration = this.Time2,
							tags = {
								"NUMERIC",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"ArenaFixed_HurtRateUp_1"
							}
						}, {
							buff
						})
					end
				end
			elseif this.Time1 < Time and Time < this.Time2 + this.Time1 then
				local Total_Time = this.Time2 + this.Time1

				global.ShowEnhanceUp(_env, Total_Time - Time, this.HurtRateFactor2 * 100)
			elseif Time == this.Time2 + this.Time1 then
				local buff = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor2)

				for _, unit in global.__iter__(global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
					global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "ArenaFixed_HurtRateUp_1"), 99)

					if not global.MASTER(_env, unit) and global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "ArenaFixed_HurtRateUp_2")) == 0 then
						global.ApplyBuff(_env, unit, {
							timing = 4,
							display = "HurtRateUp",
							group = "ArenaFixed_HurtRateUp",
							limit = 1,
							duration = this.Time3,
							tags = {
								"NUMERIC",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"ArenaFixed_HurtRateUp_2"
							}
						}, {
							buff
						})
					end
				end
			elseif Time > this.Time2 + this.Time1 and Time < this.Time3 + this.Time2 + this.Time1 then
				local Total_Time = this.Time3 + this.Time2 + this.Time1

				global.ShowEnhanceUp(_env, Total_Time - Time, this.HurtRateFactor3 * 100)
			elseif Time == this.Time3 + this.Time2 + this.Time1 then
				local buff = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor3)

				for _, unit in global.__iter__(global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
					global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "ArenaFixed_HurtRateUp_2"), 99)

					if not global.MASTER(_env, unit) and global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "ArenaFixed_HurtRateUp_3")) == 0 then
						global.ApplyBuff(_env, unit, {
							timing = 0,
							display = "HurtRateUp",
							group = "ArenaFixed_HurtRateUp",
							duration = 99,
							limit = 1,
							tags = {
								"NUMERIC",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"ArenaFixed_HurtRateUp_3"
							}
						}, {
							buff
						})
					end
				end

				global.HideEnhanceUp(_env)
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
			local Time = global.GetbattleTime(_env)
			Time = global.ceil(_env, Time / 1000)

			if not global.MASTER(_env, _env.unit) then
				if this.Time1 <= Time and Time < this.Time2 + this.Time1 then
					if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "ArenaFixed_HurtRateUp_1")) == 0 then
						local buff = global.NumericEffect(_env, "+hurtrate", {
							"+Normal",
							"+Normal"
						}, this.HurtRateFactor1)

						global.ApplyBuff(_env, _env.unit, {
							timing = 4,
							display = "HurtRateUp",
							group = "ArenaFixed_HurtRateUp",
							limit = 1,
							duration = this.Time2,
							tags = {
								"NUMERIC",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"ArenaFixed_HurtRateUp_1"
							}
						}, {
							buff
						})
					end
				elseif Time >= this.Time2 + this.Time1 and Time < this.Time3 + this.Time2 + this.Time1 then
					if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "ArenaFixed_HurtRateUp_2")) == 0 then
						local buff = global.NumericEffect(_env, "+hurtrate", {
							"+Normal",
							"+Normal"
						}, this.HurtRateFactor2)

						global.ApplyBuff(_env, _env.unit, {
							timing = 4,
							display = "HurtRateUp",
							group = "ArenaFixed_HurtRateUp",
							limit = 1,
							duration = this.Time3,
							tags = {
								"NUMERIC",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"ArenaFixed_HurtRateUp_2"
							}
						}, {
							buff
						})
					end
				elseif Time >= this.Time3 + this.Time2 + this.Time1 and global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "ArenaFixed_HurtRateUp_3")) == 0 then
					local buff = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.HurtRateFactor3)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						display = "HurtRateUp",
						group = "ArenaFixed_HurtRateUp",
						duration = 99,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"ArenaFixed_HurtRateUp_3"
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

return _M
