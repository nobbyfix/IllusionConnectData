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
			}, 0.5)

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

			if global.MARKED(_env, global.quanti)(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Aoe_Hurt", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_2",
					timing = 0,
					limit = 1,
					tags = {
						"ArenaFixed_2"
					}
				}, {
					buffeft1
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
				local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, 0.1)

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
					buffeft1,
					buffeft2
				})
			end
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
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			0
		}, main)
		this.main = global["[trigger_by]"](this, {
			"SELF:CRIT"
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

			global.ApplyRPRecovery(_env, _env.ACTOR, 500)
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

				global.ApplyRPRecovery(_env, _env.ACTOR, _env.count * 80)
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

				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "ArenaFixed_7"), 99)

				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, 0.2 * _env.count)

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
					group = "ArenaFixed_8",
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
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "skill ArenaFixed_10")) > 0 then
						global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "skill ArenaFixed_10"), 1)
					end

					global.ApplyBuff(_env, unit, {
						duration = 99,
						group = "ArenaFixed_10",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"CRITRATE",
							"skill ArenaFixed_10"
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
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "skill ArenaFixed_10")) > 0 then
						global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "BUFF", "UNDISPELLABLE", "UNSTEALABLE", "skill ArenaFixed_10"), 1)
					end

					global.ApplyBuff(_env, unit, {
						duration = 99,
						group = "ArenaFixed_10",
						timing = 0,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"CRITRATE",
							"skill ArenaFixed_10"
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

		_env.count = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.ACTOR) then
				for _, unit in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.MARKED(_env, "ASSASSIN"))) do
					_env.count = _env.count + 1
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
						group = "ArenaFixed_11",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"skill ArenaFixed_11",
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "MAGE")(_env, _env.ACTOR) then
				for _, unit in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.MARKED(_env, "MAGE"))) do
					_env.count = _env.count + 1
				end

				local buffeft1 = global.SpecialNumericEffect(_env, "+specialnum1", {
					"?Normal"
				}, 40 * _env.count)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "ArenaFixed_12",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"skill ArenaFixed_12",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.ArenaFixed_13 = {
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
					group = "ArenaFixed_13",
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

return _M
