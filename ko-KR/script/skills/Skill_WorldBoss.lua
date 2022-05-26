local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_WorldBoss_Unique_proud = {
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
			1100
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
			local buffeft1 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, 1)
			local buffeft3 = global.Diligent(_env)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 1,
				group = "Skill_WorldBoss_Unique_proud",
				timing = 2,
				limit = 1,
				tags = {
					"buff",
					"Boss_Unique_proud"
				}
			}, {
				buffeft1,
				buffeft3
			})
			global.DiligentRound(_env, 100)
		end)

		return _env
	end
}
all.Skill_WorldBoss_Unique_proud_ByMakeToMaster = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.time = externs.time

		assert(this.time ~= nil, "External variable `time` is not provided.")

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.SUMMONS(_env, _env.unit) == false then
				global.print(_env, "给在场和入场的加大招触发小技能被动")
				global.add_WorldBoss_Unique_proud(_env, _env.unit, this.time)
				global.Mechanism_effect(_env, false, this.time, _env.unit)
			end
		end)

		return _env
	end
}

function all.randomN_number(_env, n)
	local this = _env.this
	local global = _env.global
	local numer = n + 1
	local num = numer * 100
	local damage_list = {}

	for i = 1, n - 1 do
		local number = global.Random(_env, num)

		if number > number / numer * 1.5 then
			number = number / numer * 1.5
		end

		damage_list[#damage_list + 1] = number / 100
		num = num - number
	end

	damage_list[#damage_list + 1] = num / 100

	return damage_list
end

function all.BossDamage(_env, actor, unit, damage)
	local this = _env.this
	local global = _env.global

	if global.MARKED(_env, "SummonedNian")(_env, unit) then
		local atk = global.UnitPropGetter(_env, "atk")(_env, actor) * (1 + global.UnitPropGetter(_env, "hurtrate")(_env, actor) + global.UnitPropGetter(_env, "effectstrg")(_env, actor)) * 5

		if damage > atk then
			damage = atk
		end
	end

	return damage
end

function all.add_WorldBoss_PassiveFunEffectBuff(_env, time)
	local this = _env.this
	local global = _env.global

	global.add_WorldBoss_Unique_proud_Die(_env, time)
	global.Mechanism_effect(_env, true, time)
end

function all.add_WorldBoss_Unique_proud(_env, unit, time)
	local this = _env.this
	local global = _env.global
	local pbuff = global.PassiveFunEffectBuff(_env, "Skill_WorldBoss_Unique_proud")

	global.ApplyBuff(_env, unit, {
		group = "proud",
		timing = 4,
		limit = 1,
		duration = time,
		tags = {
			"buff",
			"Skill_WorldBoss_Unique_proud"
		}
	}, {
		pbuff
	})
end

function all.add_WorldBoss_Unique_proud_Die(_env, time)
	local this = _env.this
	local global = _env.global
	local buff = global.PassiveFunEffectBuff(_env, "Skill_WorldBoss_Unique_proud_ByMakeToMaster", {
		time = time
	})

	global.ApplyBuff(_env, global.FriendField(_env), {
		timing = 4,
		duration = time,
		tags = {
			"UNDISPELLABLE",
			"UNSTEALABLE"
		}
	}, {
		buff
	})

	for _, enemy in global.__iter__(global.EnemyUnits(_env)) do
		local pbuff = global.PassiveFunEffectBuff(_env, "Skill_WorldBoss_Unique_proud")

		global.ApplyBuff(_env, enemy, {
			group = "proud",
			timing = 4,
			limit = 1,
			duration = time,
			tags = {
				"buff",
				"Skill_WorldBoss_Unique_proud"
			}
		}, {
			pbuff
		})
	end
end

all.Skill_WorldBoss_mechanism = {
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

		_env.ratio = externs.ratio

		if _env.ratio == nil then
			_env.ratio = 2
		end

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local rate = global.UnitPropGetter(_env, "exskillrate")(_env, _env.ACTOR)
			local buffeft_rate = global.NumericEffect(_env, "-exskillrate", {
				"+Normal",
				"+Normal"
			}, rate / _env.ratio)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"Skill_WorldBoss_mechanism",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft_rate
			})
		end)

		return _env
	end
}

function all.SUMMON_ATTR(_env, actor)
	local this = _env.this
	local global = _env.global
	local units = global.EnemyUnits(_env)
	local sum = #units
	local atk = 0
	local def = 0
	local maxHp = 0

	for _, unit in global.__iter__(units) do
		atk = atk + global.UnitPropGetter(_env, "atk")(_env, unit)
		def = def + global.UnitPropGetter(_env, "def")(_env, unit)
		maxHp = maxHp + global.UnitPropGetter(_env, "maxHp")(_env, unit)
	end

	if maxHp < (atk - def) * 4 then
		maxHp = (atk - def) * 4
	end

	return {
		atk = atk,
		def = def,
		maxHp = maxHp
	}
end

function all.SUMMON_damage(_env, unit)
	local this = _env.this
	local global = _env.global
	local Increase_injury = 1

	if unit and global.IsAlive(_env, unit) and global.SUMMONS(_env, unit) then
		global.print(_env, "发现召唤物")

		Increase_injury = 10
	end

	return Increase_injury
end

function all.InjuryCheck(_env, unit)
	local this = _env.this
	local global = _env.global
	local Increase_injury = 1

	if unit == nil and global.IsAlive(_env, unit) == false then
		return Increase_injury
	end

	if global.UnitPropGetter(_env, "hpRatio")(_env, unit) > 0.5 then
		Increase_injury = 2
	end

	Increase_injury = 1 + global.UnitPropGetter(_env, "shield")(_env, unit) * 0.8 / global.UnitPropGetter(_env, "hp")(_env, unit)
	Increase_injury = Increase_injury + global.UnitPropGetter(_env, "unhurtrate")(_env, unit) * 0.8

	return Increase_injury
end

function all.SUMMON_ACTOR(_env, actor, SummonedId)
	local this = _env.this
	local global = _env.global
	local SUMMON_NUM = global.GetFriendField(_env, nil, "SUMMON_NUM")

	global.print(_env, "次数====", SUMMON_NUM)

	local units = global.EnemyUnits(_env)
	local sum = #units
	local attr = global.SUMMON_ATTR(_env, actor)
	local atk = attr.atk
	local def = attr.def

	if def > 10000 then
		def = 10000
	end

	local maxHp = attr.maxHp
	local atk_ration = atk / sum / global.UnitPropGetter(_env, "atk")(_env, actor)
	local def_ration = def / sum / global.UnitPropGetter(_env, "def")(_env, actor)
	local maxHp_ration = maxHp / sum / global.UnitPropGetter(_env, "maxHp")(_env, actor)
	local position = {
		5,
		7,
		9,
		4,
		6
	}
	local _Summoned = global.Summon(_env, actor, SummonedId, {
		maxHp_ration + SUMMON_NUM * 0.05,
		atk_ration + SUMMON_NUM * 0.05,
		def_ration
	}, nil, position)

	if _Summoned then
		global.MarkSummoned(_env, _Summoned, false)
		global.AddStatus(_env, _Summoned, SummonedId)
	end

	global.SetFriendField(_env, nil, SUMMON_NUM + 1, "SUMMON_NUM")
end

function all.Mechanism_effect(_env, sign, time, unit)
	local this = _env.this
	local global = _env.global
	local GetCells = global.EnemyCells(_env)

	for _, mycell in global.__iter__(GetCells) do
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
			duration = time,
			triggerLife = global.tine,
			tags = {
				"LIGHTON"
			}
		}, {
			trap_lighton
		})
	end
end

return _M
