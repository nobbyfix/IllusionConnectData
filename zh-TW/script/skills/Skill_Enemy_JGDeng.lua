local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_Enemy_JGDeng_Normal = {
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
		this.main = global["[duration]"](this, {
			100
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]

		exec["@time"]({
			0
		}, _env, function (_env)
		end)

		return _env
	end
}
all.Skill_Enemy_JGDeng_Unique = {
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
		this.main = global["[duration]"](this, {
			500
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

			global.print(_env, "进入移动阶段")

			local direction_next = global.Turn_FlameMonster_Next(_env, _env.ACTOR, global.SpecialPropGetter(_env, "location0408")(_env, _env.ACTOR))
			local buff_up = global.SpecialNumericEffect(_env, "+location0408", {
				"+Normal",
				"+Normal"
			}, -global.SpecialPropGetter(_env, "location0408")(_env, _env.ACTOR) + direction_next)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"SET_LOCATION"
				}
			}, {
				buff_up
			})

			local location_next = global.Location_FlameMonster_Next(_env, _env.ACTOR, global.SpecialPropGetter(_env, "location0408")(_env, _env.ACTOR))

			if global.GetCellUnit(_env, location_next) then
				if global.MARKED(_env, "JGDeng")(_env, global.GetCellUnit(_env, location_next)) then
					if direction_next == 0 then
						direction_next = 1
					else
						direction_next = 0
					end

					local buff_up2 = global.SpecialNumericEffect(_env, "+location0408", {
						"+Normal",
						"+Normal"
					}, -global.SpecialPropGetter(_env, "location0408")(_env, _env.ACTOR) + direction_next)

					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 0,
						duration = 99,
						tags = {
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"SET_LOCATION"
						}
					}, {
						buff_up2
					})

					local location_next = global.Location_FlameMonster_Next(_env, _env.ACTOR, global.SpecialPropGetter(_env, "location0408")(_env, _env.ACTOR))

					if global.GetCellUnit(_env, location_next) then
						global.print(_env, "目标格被占，此回合停止移动")
					else
						global.transportExt(_env, _env.ACTOR, global.IdOfCell(_env, location_next), 200, 1)
					end
				else
					global.print(_env, "目标格被占，此回合停止移动")
				end
			else
				global.transportExt(_env, _env.ACTOR, global.IdOfCell(_env, location_next), 200, 1)
			end
		end)

		return _env
	end
}
all.Skill_Enemy_JGDeng_Passive1 = {
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
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:TRANSPORT"
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
			local buffeft1 = global.PassiveFunEffectBuff(_env, "Skill_KickChange", {})

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})

			local buff_up = global.SpecialNumericEffect(_env, "+location0408", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"SET_LOCATION",
					"RECORD_DMAGE"
				}
			}, {
				buff_up
			})

			local buff = global.SpecialNumericEffect(_env, "+Light_buff", {
				"?Normal"
			}, 1)
			local trap_lighton = global.BuffTrap(_env, {
				timing = 0,
				duration = 99,
				tags = {
					"LIGHTON"
				}
			}, {
				buff
			})
			local GetCells = global.EnemyCells(_env, global.COL_CELL_OF(_env, global.GetCell(_env, _env.ACTOR)))

			for _, mycell in global.__iter__(GetCells) do
				global.ApplyTrap(_env, mycell, {
					display = "Light_cheng",
					duration = 99,
					triggerLife = 99,
					tags = {
						"LIGHTON"
					}
				}, {
					trap_lighton
				})

				if global.GetCellUnit(_env, mycell) then
					global.DispelBuff(_env, global.GetCellUnit(_env, mycell), global.BUFF_MARKED_ALL(_env, "LIGHTSHADER"), 99)
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local count = 0
			local GetCells = global.EnemyCells(_env, global.COL_CELL_OF(_env, global.GetCell(_env, _env.ACTOR)))
			local GetCells2 = global.FriendCells(_env, global.COL_CELL_OF(_env, global.GetCell(_env, _env.ACTOR)))

			for _, mycell in global.__iter__(GetCells2) do
				if global.GetCellUnit(_env, mycell) and global.MARKED(_env, "JGDeng")(_env, global.GetCellUnit(_env, mycell)) then
					count = count + 1
				end
			end

			if count == 0 then
				for _, mycell in global.__iter__(GetCells) do
					if global.GetCellUnit(_env, mycell) then
						if not global.MASTER(_env, global.GetCellUnit(_env, mycell)) then
							global.DispelBuffTrap(_env, mycell, global.BUFF_MARKED(_env, "LIGHTON"))

							local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
								"?Normal"
							}, 1)

							global.ApplyBuff(_env, _env.unit, {
								timing = 0,
								duration = 99,
								display = "Shader_Black",
								tags = {
									"LIGHTSHADER",
									"UNSTEALABLE",
									"UNDISPELLABLE"
								}
							}, {
								buffeft1
							})
						end
					end

					global.DispelBuffTrap(_env, mycell, global.BUFF_MARKED(_env, "LIGHTON"))

					local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
						"?Normal"
					}, 1)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "Shader_Black",
						tags = {
							"LIGHTSHADER",
							"UNSTEALABLE",
							"UNDISPELLABLE"
						}
					}, {
						buffeft1
					})
				end
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

		_env.oldCell = externs.oldCell

		assert(_env.oldCell ~= nil, "External variable `oldCell` is not provided.")

		_env.newCell = externs.newCell

		assert(_env.newCell ~= nil, "External variable `newCell` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local count = 0
			local GetCells_off = global.EnemyCells(_env, global.COL_CELL_OF(_env, _env.oldCell))
			local GetCells_on = global.EnemyCells(_env, global.COL_CELL_OF(_env, _env.newCell))
			local GetCells2 = global.FriendCells(_env, global.COL_CELL_OF(_env, _env.oldCell))

			for _, mycell in global.__iter__(GetCells2) do
				if global.GetCellUnit(_env, mycell) and global.MARKED(_env, "JGDeng")(_env, global.GetCellUnit(_env, mycell)) then
					count = count + 1
				end
			end

			if count == 0 then
				for _, mycell in global.__iter__(GetCells_off) do
					global.DispelBuffTrap(_env, mycell, global.BUFF_MARKED(_env, "LIGHTON"))

					if global.GetCellUnit(_env, mycell) then
						local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
							"?Normal"
						}, 1)

						global.ApplyBuff(_env, global.GetCellUnit(_env, mycell), {
							timing = 0,
							duration = 99,
							display = "Shader_Black",
							tags = {
								"LIGHTSHADER",
								"UNSTEALABLE",
								"UNDISPELLABLE"
							}
						}, {
							buffeft1
						})
					end
				end
			end

			for _, mycell in global.__iter__(GetCells_on) do
				local buff = global.SpecialNumericEffect(_env, "+Light_buff", {
					"?Normal"
				}, 1)
				local trap_lighton = global.BuffTrap(_env, {
					timing = 0,
					duration = 99,
					tags = {
						"LIGHTON"
					}
				}, {
					buff
				})

				global.ApplyTrap(_env, mycell, {
					display = "Light_cheng",
					duration = 99,
					triggerLife = 99,
					tags = {
						"LIGHTON"
					}
				}, {
					trap_lighton
				})

				if global.GetCellUnit(_env, mycell) then
					global.DispelBuff(_env, global.GetCellUnit(_env, mycell), global.BUFF_MARKED_ALL(_env, "LIGHTSHADER"), 99)
				end
			end
		end)

		return _env
	end
}
all.Skill_Enemy_JGDeng_Passive1_1 = {
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
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:TRANSPORT"
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
			local buffeft1 = global.PassiveFunEffectBuff(_env, "Skill_KickChange", {})

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})

			local buff_up = global.SpecialNumericEffect(_env, "+location0408", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"SET_LOCATION",
					"RECORD_DMAGE"
				}
			}, {
				buff_up
			})

			local buff = global.SpecialNumericEffect(_env, "+Light_buff", {
				"?Normal"
			}, 1)
			local trap_lighton = global.BuffTrap(_env, {
				timing = 0,
				duration = 99,
				tags = {
					"LIGHTON"
				}
			}, {
				buff
			})
			local GetCells = global.EnemyCells(_env, global.COL_CELL_OF(_env, global.GetCell(_env, _env.ACTOR)))

			for _, mycell in global.__iter__(GetCells) do
				global.DispelBuffTrap(_env, mycell, global.BUFF_MARKED(_env, "LIGHTON"))
				global.ApplyTrap(_env, mycell, {
					display = "Light_lan",
					duration = 99,
					triggerLife = 99,
					tags = {
						"LIGHTON"
					}
				}, {
					trap_lighton
				})

				if global.GetCellUnit(_env, mycell) then
					global.DispelBuff(_env, global.GetCellUnit(_env, mycell), global.BUFF_MARKED_ALL(_env, "LIGHTSHADER"), 99)
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local count = 0
			local GetCells = global.EnemyCells(_env, global.COL_CELL_OF(_env, global.GetCell(_env, _env.ACTOR)))
			local GetCells2 = global.FriendCells(_env, global.COL_CELL_OF(_env, global.GetCell(_env, _env.ACTOR)))

			for _, mycell in global.__iter__(GetCells2) do
				if global.GetCellUnit(_env, mycell) and global.MARKED(_env, "JGDeng")(_env, global.GetCellUnit(_env, mycell)) then
					count = count + 1
				end
			end

			if count == 0 then
				for _, mycell in global.__iter__(GetCells) do
					global.DispelBuffTrap(_env, mycell, global.BUFF_MARKED(_env, "LIGHTON"))

					local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
						"?Normal"
					}, 1)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "Shader_Black",
						tags = {
							"LIGHTSHADER",
							"UNSTEALABLE",
							"UNDISPELLABLE"
						}
					}, {
						buffeft1
					})
				end
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

		_env.oldCell = externs.oldCell

		assert(_env.oldCell ~= nil, "External variable `oldCell` is not provided.")

		_env.newCell = externs.newCell

		assert(_env.newCell ~= nil, "External variable `newCell` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local count = 0
			local GetCells_off = global.EnemyCells(_env, global.COL_CELL_OF(_env, _env.oldCell))
			local GetCells_on = global.EnemyCells(_env, global.COL_CELL_OF(_env, _env.newCell))
			local GetCells2 = global.FriendCells(_env, global.COL_CELL_OF(_env, _env.oldCell))

			for _, mycell in global.__iter__(GetCells2) do
				if global.GetCellUnit(_env, mycell) and global.MARKED(_env, "JGDeng")(_env, global.GetCellUnit(_env, mycell)) then
					count = count + 1
				end
			end

			if count == 0 then
				for _, mycell in global.__iter__(GetCells_off) do
					global.DispelBuffTrap(_env, mycell, global.BUFF_MARKED(_env, "LIGHTON"))

					if global.GetCellUnit(_env, mycell) then
						local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
							"?Normal"
						}, 1)

						global.ApplyBuff(_env, global.GetCellUnit(_env, mycell), {
							timing = 0,
							duration = 99,
							display = "Shader_Black",
							tags = {
								"LIGHTSHADER",
								"UNSTEALABLE",
								"UNDISPELLABLE"
							}
						}, {
							buffeft1
						})
					end
				end
			end

			for _, mycell in global.__iter__(GetCells_on) do
				local buff = global.SpecialNumericEffect(_env, "+Light_buff", {
					"?Normal"
				}, 1)
				local trap_lighton = global.BuffTrap(_env, {
					timing = 0,
					duration = 99,
					tags = {
						"LIGHTON"
					}
				}, {
					buff
				})

				global.ApplyTrap(_env, mycell, {
					display = "Light_lan",
					duration = 99,
					triggerLife = 99,
					tags = {
						"LIGHTON"
					}
				}, {
					trap_lighton
				})

				if global.GetCellUnit(_env, mycell) then
					global.DispelBuff(_env, global.GetCellUnit(_env, mycell), global.BUFF_MARKED_ALL(_env, "LIGHTSHADER"), 99)
				end
			end
		end)

		return _env
	end
}
all.Skill_KickChange = {
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
			"UNIT_KICK"
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
			local count = 0
			local GetCells2 = global.FriendCells(_env, global.COL_CELL_OF(_env, global.GetCell(_env, _env.ACTOR)))

			for _, mycell in global.__iter__(GetCells2) do
				if global.GetCellUnit(_env, mycell) and global.MARKED(_env, "JGDeng")(_env, global.GetCellUnit(_env, mycell)) then
					count = count + 1
				end
			end

			if global.MARKED(_env, "JGDeng")(_env, _env.unit) and count == 0 then
				local GetCells = global.EnemyCells(_env, global.COL_CELL_OF(_env, global.GetCell(_env, _env.unit)))

				for _, mycell in global.__iter__(GetCells) do
					global.DispelBuffTrap(_env, mycell, global.BUFF_MARKED(_env, "LIGHTON"))

					local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
						"?Normal"
					}, 1)

					global.ApplyBuff(_env, _env.unit, {
						timing = 0,
						duration = 99,
						display = "Shader_Black",
						tags = {
							"LIGHTSHADER",
							"UNSTEALABLE",
							"UNDISPELLABLE"
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
all.Skill_Enemy_JGDeng_Passive2 = {
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
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_UNIQUE"
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
			local buff = global.SpecialNumericEffect(_env, "+Light_buff", {
				"?Normal"
			}, 1)
			local trap_lighton = global.BuffTrap(_env, {
				timing = 0,
				duration = 99,
				tags = {
					"LIGHTON"
				}
			}, {
				buff
			})
			local GetCells = global.FriendCells(_env)

			for _, mycell in global.__iter__(GetCells) do
				global.ApplyTrap(_env, mycell, {
					display = "Light_cheng",
					duration = 99,
					triggerLife = 99,
					tags = {
						"LIGHTON"
					}
				}, {
					trap_lighton
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.AllUnits(_env, global.PETS)
			local buff = global.SpecialNumericEffect(_env, "+Light_buff", {
				"?Normal"
			}, 1)
			local trap_lighton = global.BuffTrap(_env, {
				timing = 0,
				duration = 99,
				tags = {
					"LIGHTON"
				}
			}, {
				buff
			})
			local GetCells = global.FriendCells(_env)

			for _, myunit in global.__iter__(units) do
				if global.SelectTrapCount(_env, global.GetCell(_env, myunit), global.BUFF_MARKED(_env, "LIGHTON")) > 0 then
					global.ApplyBuff(_env, myunit, {
						timing = 0,
						duration = 99,
						tags = {
							"LIGHTON"
						}
					}, {
						buff
					})
				else
					global.DispelBuff(_env, myunit, global.BUFF_MARKED(_env, "LIGHTON"), 99)
				end
			end
		end)

		return _env
	end
}
all.Skill_Enemy_JGDeng_Passive2_2 = {
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
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_BEFORE_UNIQUE"
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+Light_color", {
				"?Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"BOSS_CHANGE"
				}
			}, {
				buffeft1
			})

			local buff = global.SpecialNumericEffect(_env, "+Light_buff", {
				"?Normal"
			}, 1)
			local trap_lighton = global.BuffTrap(_env, {
				timing = 0,
				duration = 99,
				tags = {
					"LIGHTON"
				}
			}, {
				buff
			})
			local GetCells = global.FriendCells(_env)

			for _, mycell in global.__iter__(GetCells) do
				global.ApplyTrap(_env, mycell, {
					display = "Light_lan",
					duration = 99,
					triggerLife = 99,
					tags = {
						"LIGHTON"
					}
				}, {
					trap_lighton
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.AllUnits(_env, global.PETS)
			local buff = global.SpecialNumericEffect(_env, "+Light_buff", {
				"?Normal"
			}, 1)
			local trap_lighton = global.BuffTrap(_env, {
				timing = 0,
				duration = 99,
				tags = {
					"LIGHTON"
				}
			}, {
				buff
			})
			local GetCells = global.FriendCells(_env)

			for _, myunit in global.__iter__(units) do
				if global.SelectTrapCount(_env, global.GetCell(_env, myunit), global.BUFF_MARKED(_env, "LIGHTON")) > 0 then
					global.ApplyBuff(_env, myunit, {
						timing = 0,
						duration = 99,
						tags = {
							"LIGHTON"
						}
					}, {
						buff
					})
				else
					global.DispelBuff(_env, myunit, global.BUFF_MARKED(_env, "LIGHTON"), 99)
				end
			end
		end)

		return _env
	end
}
all.Skill_Enemy_JGDeng_Passive3 = {
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
			2000
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_TRANSPORT"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive3)

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == -1 and global.IsMusician(_env, _env.unit) == 1 and global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "BOSSTRANS")) == 0 then
				for _, getunit in global.__iter__(global.AllUnits(_env, global.PETS)) do
					global.print(_env, "-=身上的光照强度：", global.SelectTrapCount(_env, global.GetCell(_env, getunit), global.BUFF_MARKED_ALL(_env, "LIGHTON")))

					if global.SelectTrapCount(_env, global.GetCell(_env, getunit), global.BUFF_MARKED_ALL(_env, "LIGHTON")) == 0 then
						if global.MARKED(_env, "SYJi")(_env, getunit) then
							-- Nothing
						elseif not global.MARKED(_env, "DAGUN")(_env, getunit) then
							global.DelayCall(_env, 500, global.Flee, 1000, getunit)
						end
					end
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

		_env.oldCell = externs.oldCell

		assert(_env.oldCell ~= nil, "External variable `oldCell` is not provided.")

		_env.newCell = externs.newCell

		assert(_env.newCell ~= nil, "External variable `newCell` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.unit) then
				-- Nothing
			elseif global.SelectTrapCount(_env, global.GetCell(_env, _env.unit), global.BUFF_MARKED(_env, "LIGHTON")) > 0 then
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "LIGHTSHADER"), 99)
			else
				local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "Shader_Black",
					tags = {
						"LIGHTSHADER",
						"UNSTEALABLE",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
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

			if global.MASTER(_env, _env.unit) then
				-- Nothing
			elseif global.SelectTrapCount(_env, global.GetCell(_env, _env.unit), global.BUFF_MARKED(_env, "LIGHTON")) > 0 then
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "LIGHTSHADER"), 99)
			else
				local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
					"?Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "Shader_Black",
					tags = {
						"LIGHTSHADER",
						"UNSTEALABLE",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_Enemy_JGDeng_Passive4 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.count = 0
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive1)

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
			this.count = this.count + 1
			local buffeft1 = global.SpecialNumericEffect(_env, "+Unique_count", {
				"?Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"UNIQUE_COUNT",
					"UNSTEALABLE",
					"UNDISPELLABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.Skill_Enemy_JGDeng_Passive5 = {
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

			global.ChangeBG(_env, "Terror_Scene05")
			global.PlayBGM(_env, "Mus_Battle_Research_Boss")

			local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_count", {
				"?Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"UNSTEALABLE",
					"UNDISPELLABLE",
					"BOSS_CHANGE",
					"BOSSTRANS"
				}
			}, {
				buffeft1
			})

			local units = global.FriendUnits(_env, global.MARKED(_env, "BIANSHENG"))

			if units[1] then
				for _, unit in global.__iter__(units) do
					global.Perform(_env, unit, global.Animation(_env, "fakedie", nil, , 1))
					global.FullInheritTransform(_env)
					global.Transform(_env, unit, 1, true)
				end
			end

			for _, mycell in global.__iter__(global.AllCells(_env)) do
				if global.SelectTrapCount(_env, mycell, global.BUFF_MARKED(_env, "LIGHTON")) > 0 then
					global.DispelBuffTrap(_env, mycell, global.BUFF_MARKED(_env, "LIGHTON"))

					local trap_lighton = global.BuffTrap(_env, {
						timing = 0,
						duration = 99,
						tags = {
							"LIGHTON"
						}
					}, {
						global.buff
					})

					global.ApplyTrap(_env, mycell, {
						display = "Light_lan",
						duration = 99,
						triggerLife = 99,
						tags = {
							"LIGHTON"
						}
					}, {
						trap_lighton
					})
				end
			end
		end)

		return _env
	end
}

function all.IsMusician(_env, unit)
	local this = _env.this
	local global = _env.global

	if global.MARKED(_env, "MLYTLSha")(_env, unit) or global.MARKED(_env, "FLBDSi")(_env, unit) or global.MARKED(_env, "PGNNi")(_env, unit) or global.MARKED(_env, "YZJiaA")(_env, unit) or global.MARKED(_env, "BDFen")(_env, unit) or global.MARKED(_env, "MYing")(_env, unit) or global.MARKED(_env, "YZJiaB")(_env, unit) then
		return 1
	else
		return 0
	end
end

return _M
