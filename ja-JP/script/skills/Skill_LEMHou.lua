local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_LEMHou_Normal = {
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
				1.05,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			933
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

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.3,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			367
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			450
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "LEMHou_Passive", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_LEMHou_Proud = {
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
				1.6,
				0
			}
		end

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.5
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1667
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_LEMHou"
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

		_env.num = global.Random(_env, 1, 3)

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local anim = "skill2"

			if _env.num == 1 then
				anim = "skill2_1"
			elseif _env.num == 2 then
				anim = "skill2_2"
			end

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.5,
				0
			}, 100, anim))
		end)
		exec["@time"]({
			767
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)
			damage.val = damage.val + global.UnitPropGetter(_env, "shield")(_env, _env.TARGET) * this.ShieldFactor

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			850
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "LEMHou_Passive", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_LEMHou_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Time = externs.Time

		if this.Time == nil then
			this.Time = 30
		end

		this.AbFactor = externs.AbFactor

		if this.AbFactor == nil then
			this.AbFactor = 0.3
		end

		this.ExSkillRateFactor = externs.ExSkillRateFactor

		if this.ExSkillRateFactor == nil then
			this.ExSkillRateFactor = 0.4
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2633
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LEMHou"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive)

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
		end)
		exec["@time"]({
			1733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbFactor)
			local buffeft2 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, this.ExSkillRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 4,
				display = "SkillRateUp",
				duration = this.Time,
				tags = {
					"LEMHou_Battle",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})

			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Absorption",
				tags = {}
			}, {
				buff
			})
		end)
		exec["@time"]({
			2600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and _env.unit ~= _env.ACTOR and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "LEMHou_Battle", "UNDISPELLABLE", "UNSTEALABLE")) > 0 and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "FREEZE")) == 0 and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "DAZE")) == 0 then
				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 1,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
				global.ExertRegularSkill(_env, _env.ACTOR)
			end
		end)

		return _env
	end
}
all.Skill_LEMHou_Passive = {
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
			120
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "FREEZE")) == 0 and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "DAZE")) == 0 then
				local buffeft = global.Taunt(_env)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"BUFF",
						"LEMHou_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				})

				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 1,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})

				if _env.unit then
					global.ExertRegularSkill(_env, _env.ACTOR)
				end

				global.DelayCall(_env, 105, global.DispelBuff, _env.unit, global.BUFF_MARKED_ALL(_env, "LEMHou_Passive", "UNDISPELLABLE", "UNSTEALABLE"), 99)
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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "LEMHou_Passive", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_LEMHou_Proud_EX = {
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
				2,
				0
			}
		end

		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.8
		end

		this.DefWeakenFactor = externs.DefWeakenFactor

		if this.DefWeakenFactor == nil then
			this.DefWeakenFactor = 0.5
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1667
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_LEMHou"
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
			local num = global.Random(_env, 1, 3)
			local anim = "skill2"

			if num == 1 then
				anim = "skill2_1"
			elseif num == 2 then
				anim = "skill2_2"
			end

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.5,
				0
			}, 100, anim))
		end)
		exec["@time"]({
			567
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft = global.NumericEffect(_env, "+defweaken", {
				"+Normal",
				"+Normal"
			}, this.DefWeakenFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "DefWeakenUp",
				tags = {
					"NUMERIC",
					"BUFF",
					"DEFWEAKENUP",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft
			})
		end)
		exec["@time"]({
			767
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)
			damage.val = damage.val + global.UnitPropGetter(_env, "shield")(_env, _env.TARGET) * this.ShieldFactor

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			850
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "LEMHou_Passive", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_LEMHou_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Time = externs.Time

		if this.Time == nil then
			this.Time = 40
		end

		this.AbFactor = externs.AbFactor

		if this.AbFactor == nil then
			this.AbFactor = 0.5
		end

		this.ExSkillRateFactor = externs.ExSkillRateFactor

		if this.ExSkillRateFactor == nil then
			this.ExSkillRateFactor = 0.7
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2633
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LEMHou"
		}, main)
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive)

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
		end)
		exec["@time"]({
			1733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbFactor)
			local buffeft2 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, this.ExSkillRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 4,
				display = "SkillRateUp",
				duration = this.Time,
				tags = {
					"LEMHou_Battle",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
			})

			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Absorption",
				tags = {}
			}, {
				buff
			})
		end)
		exec["@time"]({
			2550
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and _env.unit ~= _env.ACTOR and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "LEMHou_Battle", "UNDISPELLABLE", "UNSTEALABLE")) > 0 and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "FREEZE")) == 0 and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "DAZE")) == 0 then
				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 1,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
				global.ExertRegularSkill(_env, _env.ACTOR)
			end
		end)

		return _env
	end
}
all.Skill_LEMHou_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DeRageGainFactor = externs.DeRageGainFactor

		if this.DeRageGainFactor == nil then
			this.DeRageGainFactor = 0.8
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			120
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_AFTER_UNIQUE"
		}, passive)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "FREEZE")) == 0 and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "DAZE")) == 0 then
				local buffeft = global.Taunt(_env)
				local buff = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, this.DeRageGainFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"BUFF",
						"LEMHou_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft
				})
				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"BUFF",
						"LEMHou_Passive_Rp",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})

				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					duration = 1,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})

				if _env.unit then
					global.ExertRegularSkill(_env, _env.ACTOR)
				end

				global.DelayCall(_env, 105, global.DispelBuff, _env.unit, global.BUFF_MARKED_ALL(_env, "LEMHou_Passive", "UNDISPELLABLE", "UNSTEALABLE"), 99)
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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "LEMHou_Passive", "UNDISPELLABLE", "UNSTEALABLE"), 99)
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "LEMHou_Passive_Rp", "UNDISPELLABLE", "UNSTEALABLE"), 99)
			end
		end)

		return _env
	end
}

return _M
