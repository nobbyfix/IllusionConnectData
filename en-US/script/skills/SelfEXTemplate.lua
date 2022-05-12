local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all

function all.SelfEX_Curse_OneStage_Reflex(_env, actor)
	local this = _env.this
	local global = _env.global
	local debuff_friend = nil

	for _, unit in global.__iter__(global.FriendUnits(_env)) do
		if global.SelectBuffCount(_env, unit, global.BUFF_MARKED_ALL(_env, "DEBUFF")) > 0 then
			debuff_friend = unit
		end
	end

	if debuff_friend and global.IsAlive(_env, debuff_friend) then
		local Eunit = global.RandomN(_env, 1, global.EnemyUnits(_env, global.PETS - global.SUMMONS))[1]

		if Eunit then
			local PassiveBuff = global.PassiveFunEffectBuff(_env, "SelfEX_Curse_OneStage_Reflex_SubSkill", {
				unit = debuff_friend
			})

			global.ApplyBuff_Buff(_env, actor, Eunit, {
				timing = 0,
				duration = 1,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				PassiveBuff
			})
			global.ActivateGlobalTrigger(_env, debuff_friend, "REFLEX_STEALBUFF", {
				unit = debuff_friend
			})
		end
	end
end

all.SelfEX_Curse_OneStage_Reflex_SubSkill = {
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
			"REFLEX_STEALBUFF"
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

			global.print(_env, "开始转移buff===")
			global.StealBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "DEBUFF"), 1)

			local nilBuff = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				tags = {
					"nil"
				}
			}, {
				nilBuff
			})
		end)

		return _env
	end
}

function all.SelfEX_Cure_OneStage_Choice(_env, actor, unit, allChoice)
	local this = _env.this
	local global = _env.global
	local buffFactor = {
		def = 0.11,
		atk = 0.033
	}
	local unit_hpRatio = global.UnitPropGetter(_env, "hpRatio")(_env, unit)
	local actor_atk = global.UnitPropGetter(_env, "atk")(_env, actor) * buffFactor.atk
	local actor_def = global.UnitPropGetter(_env, "def")(_env, actor) * buffFactor.def

	if allChoice then
		global.SelfEX_Cure_OneStage_Choice_SubFunction_Buff1(_env, actor, unit, actor_atk)
		global.SelfEX_Cure_OneStage_Choice_SubFunction_Buff2(_env, actor, unit, actor_def)
	elseif unit_hpRatio >= 0.5 then
		global.SelfEX_Cure_OneStage_Choice_SubFunction_Buff1(_env, actor, unit, actor_atk)
	else
		global.SelfEX_Cure_OneStage_Choice_SubFunction_Buff2(_env, actor, unit, actor_def)
	end
end

function all.SelfEX_Cure_OneStage_Choice_SubFunction_Buff1(_env, actor, unit, atk)
	local this = _env.this
	local global = _env.global
	local buff1 = global.NumericEffect(_env, "+atk", {
		"+Normal",
		"+Normal"
	}, atk)

	global.ApplyBuff_Buff(_env, actor, unit, {
		duration = 99,
		display = "AtkUp",
		group = "SelfEX_Cure_OneStage_Choice_SubFunction_Buff1",
		timing = 0,
		limit = 6,
		tags = {
			"BUFF"
		}
	}, {
		buff1
	})
end

function all.SelfEX_Cure_OneStage_Choice_SubFunction_Buff2(_env, actor, unit, def)
	local this = _env.this
	local global = _env.global
	local buff2 = global.NumericEffect(_env, "+def", {
		"+Normal",
		"+Normal"
	}, def)

	global.ApplyBuff_Buff(_env, actor, unit, {
		duration = 99,
		display = "DefUp",
		group = "SelfEX_Cure_OneStage_Choice_SubFunction_Buff2",
		timing = 0,
		limit = 6,
		tags = {
			"BUFF"
		}
	}, {
		buff2
	})
end

return _M
