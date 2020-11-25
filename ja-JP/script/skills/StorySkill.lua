local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_JNLong_Unique_Story_Refresh = {
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

		this.summonFactorAtk = externs.summonFactorAtk

		assert(this.summonFactorAtk ~= nil, "External variable `summonFactorAtk` is not provided.")

		this.summonFactorDef = externs.summonFactorDef

		assert(this.summonFactorDef ~= nil, "External variable `summonFactorDef` is not provided.")

		this.summonFactorHp = externs.summonFactorHp

		assert(this.summonFactorHp ~= nil, "External variable `summonFactorHp` is not provided.")

		this.summonFactor = externs.summonFactor

		if this.summonFactor == nil then
			this.summonFactor = {
				this.summonFactorAtk,
				this.summonFactorDef,
				this.summonFactorHp
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2834
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_JNLong"
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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.9,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			2800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, summonunit in global.__iter__(global.FriendUnits(_env, global.INSTATUS(_env, "SummonedJNLong"))) do
				global.Kick(_env, summonunit)
			end

			local SummonedJNLongA = global.Summon(_env, _env.ACTOR, "SummonedJNLong", this.summonFactor, nil, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9
			})

			if SummonedJNLongA then
				global.AddStatus(_env, SummonedJNLongA, "SummonedJNLong")
			end

			local SummonedJNLongB = global.Summon(_env, _env.ACTOR, "SummonedJNLong", this.summonFactor, nil, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9
			})

			if SummonedJNLongB then
				global.AddStatus(_env, SummonedJNLongB, "SummonedJNLong")
			end

			local SummonedJNLongC = global.Summon(_env, _env.ACTOR, "SummonedJNLong", this.summonFactor, nil, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9
			})

			if SummonedJNLongC then
				global.AddStatus(_env, SummonedJNLongC, "SummonedJNLong")
			end
		end)
		exec["@time"]({
			2834
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_JNLong_Unique_Story_Add = {
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

		this.summonFactorAtk = externs.summonFactorAtk

		assert(this.summonFactorAtk ~= nil, "External variable `summonFactorAtk` is not provided.")

		this.summonFactorDef = externs.summonFactorDef

		assert(this.summonFactorDef ~= nil, "External variable `summonFactorDef` is not provided.")

		this.summonFactorHp = externs.summonFactorHp

		assert(this.summonFactorHp ~= nil, "External variable `summonFactorHp` is not provided.")

		this.summonFactor = externs.summonFactor

		if this.summonFactor == nil then
			this.summonFactor = {
				this.summonFactorAtk,
				this.summonFactorDef,
				this.summonFactorHp
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2834
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_JNLong"
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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.9,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			2800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, summonunit in global.__iter__(global.FriendUnits(_env, global.INSTATUS(_env, "SummonedJNLong"))) do
				global.Kick(_env, summonunit)
			end

			local SummonedJNLongA = global.Summon(_env, _env.ACTOR, "SummonedJNLong", this.summonFactor, nil, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9
			})

			if SummonedJNLongA then
				global.AddStatus(_env, SummonedJNLongA, "SummonedJNLong")
			end

			local SummonedJNLongB = global.Summon(_env, _env.ACTOR, "SummonedJNLong", this.summonFactor, nil, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9
			})

			if SummonedJNLongB then
				global.AddStatus(_env, SummonedJNLongB, "SummonedJNLong")
			end

			local SummonedJNLongC = global.Summon(_env, _env.ACTOR, "SummonedJNLong", this.summonFactor, nil, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8,
				9
			})

			if SummonedJNLongC then
				global.AddStatus(_env, SummonedJNLongC, "SummonedJNLong")
			end
		end)
		exec["@time"]({
			2834
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_CZheng_Passive_Story = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpRateFactor = externs.HpRateFactor

		assert(this.HpRateFactor ~= nil, "External variable `HpRateFactor` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
		}, passive1)

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
				if global.INSTATUS(_env, "SecondTime")(_env, _env.ACTOR) then
					-- Nothing
				elseif this.HpRateFactor <= _env.prevHpPercent and _env.curHpPercent < this.HpRateFactor then
					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)

					global.ApplyHPRecovery(_env, _env.ACTOR, maxHp)
					global.AddStatus(_env, _env.ACTOR, "SecondTime")
				end
			end
		end)

		return _env
	end
}
all.Skill_LLan_Unique_Story = {
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

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3100
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_LLan"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_LLan_Skill3"
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
		_env.masterextra = 0

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
			2600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
			end

			local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 3,
				display = "UnHurtRateUp",
				tags = {
					"STATUS",
					"BUFF",
					"UNHURTRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			})

			local buffeft3 = global.Taunt(_env)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 1,
				duration = 3,
				display = "Taunt",
				tags = {
					"STATUS",
					"BUFF",
					"TAUNT",
					"DISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft3
			})
		end)
		exec["@time"]({
			3100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_AfterAction_Revive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpRateFactor = externs.HpRateFactor

		assert(this.HpRateFactor ~= nil, "External variable `HpRateFactor` is not provided.")

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
			local reviveunit = global.Revive(_env, this.HpRateFactor, this.RageFactor, {
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

return _M
