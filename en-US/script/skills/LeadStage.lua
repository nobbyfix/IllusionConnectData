local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.LeadStage_Energy = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Energy = externs.Energy

		if this.Energy == nil then
			this.Energy = 0
		end

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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyEnergyRecovery(_env, global.GetOwner(_env, _env.ACTOR), this.Energy)
		end)

		return _env
	end
}
all.LeadStage_XueZhan_skill = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.summonNum = externs.summonNum

		if this.summonNum == nil then
			this.summonNum = 2
		end

		this.summonFactorAtk = externs.summonFactorAtk

		if this.summonFactorAtk == nil then
			this.summonFactorAtk = 1
		end

		this.summonFactorDef = externs.summonFactorDef

		if this.summonFactorDef == nil then
			this.summonFactorDef = 1
		end

		this.summonFactorHp = externs.summonFactorHp

		if this.summonFactorHp == nil then
			this.summonFactorHp = 0.2
		end

		this.RageSpdFactor = externs.RageSpdFactor

		if this.RageSpdFactor == nil then
			this.RageSpdFactor = 0.1
		end

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
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
			local SummonedLengMo = global.Summon(_env, _env.ACTOR, "Summoned_LengMo", this.summonFactor, nil, {
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
			local SummonedHeiHei = global.Summon(_env, _env.ACTOR, "Summoned_HeiHei", this.summonFactor, nil, {
				7,
				9,
				8,
				4,
				6,
				5,
				1,
				3,
				2
			})

			if this.summonNum == 3 then
				local i = global.Random(_env, 1, 2)
				local Summoned3 = (i ~= 1 or global.Summon(_env, _env.ACTOR, "Summoned_LengMo", this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})) and global.Summon(_env, _env.ACTOR, "Summoned_HeiHei", this.summonFactor, nil, {
					global.Random(_env, 1, 9)
				})
			end

			local buff = global.RageGainEffect(_env, "+", {
				"+Normal",
				"+Normal"
			}, this.RageSpdFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"LeadStage_XueZhan_skill",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
		end)

		return _env
	end
}
all.LeadStage_LieSha_skill = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.MaxHpDamgeRate = externs.MaxHpDamgeRate

		if this.MaxHpDamgeRate == nil then
			this.MaxHpDamgeRate = 0.2
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			120
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
			100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.EnemyMaster(_env) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, global.EnemyMaster(_env))
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)

				global.ApplyRealDamage(_env, _env.ACTOR, global.EnemyMaster(_env), 1, 1, 0, 0, 0, nil, global.min(_env, maxHp * this.MaxHpDamgeRate, atk * 5))
				global.AnimForTrgt(_env, global.EnemyMaster(_env), {
					loop = 1,
					anim = "baodian_shoujibaodian",
					zOrder = "TopLayer",
					pos = {
						0.5,
						0.5
					}
				})
			end
		end)

		return _env
	end
}
all.LeadStage_BiLei_skill = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AoeDeRateFactor = externs.AoeDeRateFactor

		if this.AoeDeRateFactor == nil then
			this.AoeDeRateFactor = 0.2
		end

		this.UnCritRateFactor = externs.UnCritRateFactor

		if this.UnCritRateFactor == nil then
			this.UnCritRateFactor = 0.3
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
			local buffeft1 = global.NumericEffect(_env, "+aoederate", {
				"+Normal",
				"+Normal"
			}, this.AoeDeRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+uncritrate", {
				"+Normal",
				"+Normal"
			}, this.UnCritRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "LeadStage_BiLei",
				tags = {
					"NUMERIC",
					"BUFF",
					"LeadStage_BiLei_skill",
					"AOEDERATEUP",
					"UNCRITRATEUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			}, 1)
		end)

		return _env
	end
}
all.LeadStage_FuHun_skill = {
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
				1,
				0
			}
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			2700
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
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				global.AnimForTrgt(_env, _env.ACTOR, {
					loop = 1,
					anim = "cx_nengliangchongji",
					zOrder = "TopLayer",
					pos = {
						0.5,
						0.5
					}
				})
			end
		end)

		return _env
	end
}
all.LeadStage_SenLing_skill = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RecoveryFactor = externs.RecoveryFactor

		if this.RecoveryFactor == nil then
			this.RecoveryFactor = 0.04
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			650
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
		this.passive2 = global["[schedule_at_moments]"](this, {
			{
				60000
			}
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[schedule_in_cycles]"](this, {
			1000
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
			local buff_start = global.SpecialNumericEffect(_env, "+LeadStage_SenLing_start", {
				"+Normal",
				"+Normal"
			}, 1)
			local buff_show = global.SpecialNumericEffect(_env, "+LeadStage_SenLing", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 2,
				display = "LeadStage_SenLing_Start",
				tags = {
					"LeadStage_SenLing_skill_Start"
				}
			}, {
				buff_start
			})
			global.DelayCall(_env, 600, global.ApplyBuff, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "LeadStage_SenLing",
				tags = {
					"LeadStage_SenLing_skill",
					"Magic_Circle"
				}
			}, {
				buff_show
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "LeadStage_SenLing_skill", "Magic_Circle"), 99)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "LeadStage_SenLing_skill", "Magic_Circle")) > 0 then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)

					global.ApplyHPRecovery(_env, unit, maxHp * this.RecoveryFactor, true)
				end
			end
		end)

		return _env
	end
}
all.LeadStage_LiMing_skill = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 700
		end

		this.RageSpdFactor = externs.RageSpdFactor

		if this.RageSpdFactor == nil then
			this.RageSpdFactor = 0.1
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

			global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)

			local buff = global.RageGainEffect(_env, "+", {
				"+Normal",
				"+Normal"
			}, this.RageSpdFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "LeadStage_LiMing",
				tags = {
					"LeadStage_LiMing_skill",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			})
		end)

		return _env
	end
}

return _M
