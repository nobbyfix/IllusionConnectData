local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.FlameMonster_0408 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.direction = externs.direction

		if this.direction == nil then
			this.direction = 0
		end

		this.BurningDps = externs.BurningDps

		if this.BurningDps == nil then
			this.BurningDps = 2000
		end

		this.TimeSlice = externs.TimeSlice

		if this.TimeSlice == nil then
			this.TimeSlice = 1000
		end

		this.BurningTime = externs.BurningTime

		if this.BurningTime == nil then
			this.BurningTime = 15
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
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			500
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
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
			local buff_up = global.SpecialNumericEffect(_env, "+location0408", {
				"+Normal",
				"+Normal"
			}, this.direction)

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
			300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.PassiveFunEffectBuff(_env, "BurningSelf", {
				burningDps = this.BurningDps,
				timeSlice = this.TimeSlice
			})

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "DAMAGEFROM0408")) > 0 then
					global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.unit, {
						timing = 4,
						display = "Burning",
						group = "BurningSelf",
						limit = 1,
						duration = this.BurningTime,
						tags = {
							"STATUS",
							"DEBUFF",
							"BURNING",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
					global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "DAMAGEFROM0408"), 99)
				end

				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "DAMAGECOUNT0408"), 99)
			end
		end)

		return _env
	end
}

function all.Move_FlameMonster(_env, unit, location, duration, speed)
	local this = _env.this
	local global = _env.global

	if global.GetCellUnit(_env, location) then
		global.print(_env, "目标格被占，此回合停止移动")
	else
		global.transportExt(_env, unit, location, duration, speed)
	end
end

function all.Location_FlameMonster_Next(_env, unit, direction)
	local this = _env.this
	local global = _env.global

	global.print(_env, "进入到目标格判断，方向为：", direction)

	if direction == 0 then
		local cellId0 = global.GetCellId(_env, unit) + 1

		global.print(_env, "取得格子ID为：", cellId0)

		local units = global.FriendCells(_env, global.CELL_IN_POS(_env, -cellId0))

		global.print(_env, "下一个目标格为：", global.IdOfCell(_env, units[1]))
		global.print(_env, "下一个目标格方向为：", direction)

		return units[1]
	end

	if direction == 1 then
		local cellId1 = global.GetCellId(_env, unit) - 1

		global.print(_env, "取得格子ID为：", cellId1)

		local units = global.FriendCells(_env, global.CELL_IN_POS(_env, -cellId1))

		global.print(_env, "下一个目标格为：", global.IdOfCell(_env, units[1]))
		global.print(_env, "下一个目标格方向为：", direction)

		return units[1]
	end
end

function all.Turn_FlameMonster_Next(_env, unit, direction)
	local this = _env.this
	local global = _env.global

	if global.CellColLocation(_env, global.GetCell(_env, unit)) == 1 and direction == 0 then
		direction = 1

		global.print(_env, "在上列碰见了墙壁，改变方向为下：", direction)
	end

	if global.CellColLocation(_env, global.GetCell(_env, unit)) == 3 and direction == 1 then
		direction = 0

		global.print(_env, "在下列碰见了墙壁，改变方向为上：", direction)
	end

	global.print(_env, "转向判定后改变方向为：", direction)

	return direction
end

all.BurningSelf = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.burningDps = 10000
		this.timeSlice = 1000
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[schedule_in_cycles]"](this, {
			this.timeSlice
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

			global.ApplyHPReduce(_env, _env.ACTOR, this.burningDps)
		end)

		return _env
	end
}
all.DO_NOTHING_HYXia = {
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
all.FlameMonster_0408_Move = {
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
			200
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
				if global.MARKED(_env, "HYXia")(_env, global.GetCellUnit(_env, location_next)) then
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

return _M
