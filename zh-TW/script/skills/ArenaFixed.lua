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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			0
		}, main)
		this.main = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
		}, main)
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif _env.unit == _env.ACTOR and _env.prevHpPercent < _env.curHpPercent then
				global.ApplyRPRecovery(_env, _env.ACTOR, 500)
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
			local buffeft1 = global.NumericEffect(_env, "+becuredrate", {
				"+Normal",
				"+Normal"
			}, this.BeCuredRateFactor)

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
all.ArenaFixed_8 = {
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
		passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
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

			if -global.MARKED(_env, "WARRIOR")(_env, _env.ACTOR) and global.MARKED(_env, "WARRIOR")(_env, global.FRONT_OF(_env, _env.ACTOR, true) * global.COL_OF(_env, _env.ACTOR)) then
				local buffeft1 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0.5)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_7",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"ArenaFixed_7"
					}
				}, {
					buffeft1
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				if -global.MARKED(_env, "WARRIOR")(_env, _env.ACTOR) then
					if global.MARKED(_env, "WARRIOR")(_env, global.FRONT_OF(_env, _env.ACTOR, true) * global.COL_OF(_env, _env.ACTOR)) then
						local buffeft1 = global.NumericEffect(_env, "+defrate", {
							"+Normal",
							"+Normal"
						}, 0.5)

						global.ApplyBuff(_env, _env.ACTOR, {
							duration = 99,
							group = "ArenaFixed_7",
							timing = 0,
							limit = 1,
							tags = {
								"NUMERIC",
								"BUFF",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"ArenaFixed_7"
							}
						}, {
							buffeft1
						})
					end
				else
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "ArenaFixed_7"))
				end
			end
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+revive_one", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "ArenaFixed_9",
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+ExtraHP", {
				"+Normal",
				"+Normal"
			}, 1)

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
				buffeft1
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+ExtraHP", {
				"+Normal",
				"+Normal"
			}, 1)

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

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

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
				global.buffeft2,
				global.buffeft3,
				global.buffeft4
			})
		end)

		return _env
	end
}

return _M
