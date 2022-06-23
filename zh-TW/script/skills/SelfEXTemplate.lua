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
			"BUFF",
			"DISPELLABLE",
			"STEALABLE"
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
			"BUFF",
			"DISPELLABLE",
			"STEALABLE"
		}
	}, {
		buff2
	})
end

function all.SelfEX_Cure_OneStage_Secret(_env, actor)
	local this = _env.this
	local global = _env.global
	local pbuff = global.PassiveFunEffectBuff(_env, "SelfEX_Cure_OneStage_Secret_SubSkill")

	global.ApplyBuff_Buff(_env, actor, actor, {
		duration = 99,
		group = "SelfEX_Cure_OneStage_Secret",
		timing = 0,
		limit = 1,
		tags = {
			"SelfEX_Cure_OneStage_Secret"
		}
	}, {
		pbuff
	})
end

all.SelfEX_Cure_OneStage_Secret_SubSkill = {
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

			global.print(_env, "进来了")

			local num = global.GetFriendField(_env, _env.ACTOR, "SelfEX_Cure_OneStage_Secret_SubSkill")

			if num > 0 then
				return
			end

			global.print(_env, global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR), global.SUMMONS(_env, _env.unit) == false, _env.event.isRevive, "[[[[[[[[[")

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.SUMMONS(_env, _env.unit) == false and _env.event.isRevive == nil then
				global.SelfEX_Cure_OneStage_Secret_Sub(_env, _env.ACTOR, _env.unit)
				global.SetFriendField(_env, _env.ACTOR, num + 1, "SelfEX_Cure_OneStage_Secret_SubSkill")
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "SelfEX_Cure_OneStage_Secret"), 99)
			end
		end)

		return _env
	end
}

function all.SelfEX_Cure_OneStage_Secret_Sub(_env, actor, unit)
	local this = _env.this
	local global = _env.global
	local effect = {
		global.SelfEX_Cure_OneStage_Secret_SubFunction_Buff1,
		global.SelfEX_Cure_OneStage_Secret_SubFunction_Buff2,
		global.SelfEX_Cure_OneStage_Secret_SubFunction_Buff3
	}

	effect[global.Random(_env, 1, 3)](_env, actor, unit)
end

function all.SelfEX_Cure_OneStage_Secret_SubFunction_Buff1(_env, actor, unit)
	local this = _env.this
	local global = _env.global
	local buff1 = global.NumericEffect(_env, "-atkrate", {
		"+Normal",
		"+Normal"
	}, 0.2)

	global.ApplyBuff_Buff(_env, actor, unit, {
		timing = 0,
		duration = 99,
		display = "AtkDown",
		tags = {
			"DEBUFF",
			"DISPELLABLE",
			"STEALABLE"
		}
	}, {
		buff1
	})
end

function all.SelfEX_Cure_OneStage_Secret_SubFunction_Buff2(_env, actor, unit)
	local this = _env.this
	local global = _env.global
	local buff2 = global.DamageTransferEffect(_env, unit, 0.1)

	if global.FriendMaster(_env) then
		global.ApplyBuff_Buff(_env, actor, global.FriendMaster(_env), {
			timing = 4,
			duration = 20,
			display = "FanGao_Shield",
			tags = {
				"DEBUFF",
				"DISPELLABLE",
				"STEALABLE"
			}
		}, {
			buff2
		})
	end
end

function all.SelfEX_Cure_OneStage_Secret_SubFunction_Buff3(_env, actor, unit)
	local this = _env.this
	local global = _env.global
	local buff3 = global.NumericEffect(_env, "-def", {
		"+Normal",
		"+Normal"
	}, 0)

	global.ApplyBuff_Buff(_env, actor, unit, {
		timing = 0,
		duration = 99,
		display = "NoKick",
		tags = {
			"UnKick",
			"DEBUFF",
			"DISPELLABLE",
			"STEALABLE"
		}
	}, {
		buff3
	})
end

function all.SelfEX_Defend_OneStage_Together(_env, actor)
	local this = _env.this
	local global = _env.global
	local friends = global.FriendUnits(_env, global.BACK_OF(_env, actor, true) * global.NEIGHBORS_OF(_env, actor) * global.COL_OF(_env, actor))

	if #friends > 0 then
		local pbuff = global.PassiveFunEffectBuff(_env, "SelfEX_Defend_OneStage_Together_SubSkill", {
			friend = actor
		})

		global.ApplyBuff_Buff(_env, actor, friends[1], {
			timing = 3,
			duration = 2,
			tags = {
				"BUFF",
				"DISPELLABLE",
				"STEALABLE",
				"SelfEX_Defend_OneStage_Together_SubSkill"
			}
		}, {
			pbuff
		})
	end
end

all.SelfEX_Defend_OneStage_Together_SubSkill = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.friend = externs.friend

		assert(this.friend ~= nil, "External variable `friend` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:HURTED"
		}, passive)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.attacker = externs.attacker

		assert(_env.attacker ~= nil, "External variable `attacker` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.IsAlive(_env, _env.attacker) and global.IsAlive(_env, this.friend) and global.IsAlive(_env, _env.ACTOR) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "SelfEX_Defend_OneStage_Together_SubSkill")) > 0 then
				global.ApplyHPDamage_Check(_env, _env.attacker, this.friend, {
					1,
					1,
					0
				})
			end
		end)

		return _env
	end
}

return _M
