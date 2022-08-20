local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SP_ALSi_Normal = {
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
			870
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
				-0.6,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			533
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_SP_ALSi_Proud = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1230
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_ALSi"
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

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.2,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_SP_ALSi_Unique = {
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
				4,
				0
			}
		end

		this.LockTime = externs.LockTime

		if this.LockTime == nil then
			this.LockTime = 25
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3230
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_ALSi"
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
			global.GroundEft(_env, _env.ACTOR, "Ground_SP_ALSi")

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR) - global.ONESELF(_env, _env.TARGET))) do
				global.setRootVisible(_env, unit, false)
			end

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 1.8, 600)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 100, "skill3"))
			global.DelayCall(_env, 1600, global.FocusCamera, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1, 10)
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)
			global.DelayCall(_env, 30, global.ShakeScreen, {
				Id = 3,
				duration = 50,
				enhance = 7
			})
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)
			local result = global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			if result and result.deadly ~= true then
				local target = _env.TARGET

				if target and (global.SUMMONS(_env, target) or global.MASTER(_env, target) or global.MARKED(_env, "DAGUN")(_env, target) or global.MARKED(_env, "SummonedNian")(_env, target)) then
					target = nil
				end

				if target ~= nil and global.MARKED(_env, "SummonedNian")(_env, global.EnemyMaster(_env)) then
					global.ThrownKick(_env, target, true)
				end

				if target ~= nil and (global.MARKED(_env, "Player_Master")(_env, global.EnemyMaster(_env)) or global.MARKED(_env, "DAGUN")(_env, global.EnemyMaster(_env)) or global.MARKED(_env, "SP_DDing")(_env, global.EnemyMaster(_env))) then
					global.ThrownKick(_env, target, false)

					for i = 1, 4 do
						local card_window = global.CardAtWindowIndex(_env, global.GetOwner(_env, _env.TARGET), i)

						if card_window == nil then
							local card = global.BackToCard_ResultCheck(_env, target, "window", i)

							if card then
								local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_SP_ALSi_Unique_val", {
									"+Normal",
									"+Normal"
								}, damage.val)

								global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.TARGET), card, {
									timing = 0,
									duration = 99,
									tags = {
										"CARDBUFF",
										"Skill_SP_ALSi_Unique_Dmg",
										"UNDISPELLABLE",
										"UNSTEALABLE"
									}
								}, {
									buffeft1
								})
								global.LockHeroCards(_env, global.GetOwner(_env, _env.TARGET), nil, {
									anim = "alsi_baoshiaixin",
									loop = true,
									card = card,
									time = this.LockTime * 1000
								})
								global.LockCardFlag(_env, _env.TARGET, card, this.LockTime)
							end
						end

						if i == 4 and card_window ~= nil then
							local card_lock = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.TARGET), global.CARD_HERO_MARKED(_env, "LOCK"))

							if #card_lock < 3 then
								local cardlocation = global.Random(_env, 1, 4)
								local card = global.BackToCard_ResultCheck(_env, target, "window", cardlocation)

								if card then
									local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_SP_ALSi_Unique_val", {
										"+Normal",
										"+Normal"
									}, damage.val)

									global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.TARGET), card, {
										timing = 0,
										duration = 99,
										tags = {
											"CARDBUFF",
											"Skill_SP_ALSi_Unique_Dmg",
											"UNDISPELLABLE",
											"UNSTEALABLE"
										}
									}, {
										buffeft1
									})
									global.LockHeroCards(_env, global.GetOwner(_env, _env.TARGET), nil, {
										anim = "alsi_baoshiaixin",
										loop = true,
										card = card,
										time = this.LockTime * 1000
									})
									global.LockCardFlag(_env, _env.TARGET, card, this.LockTime)
								end
							end

							if #card_lock >= 3 then
								local card = global.BackToCard_ResultCheck(_env, target, "card")

								if card then
									local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_SP_ALSi_Unique_val", {
										"+Normal",
										"+Normal"
									}, damage.val)

									global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.TARGET), card, {
										timing = 0,
										duration = 99,
										tags = {
											"CARDBUFF",
											"Skill_SP_ALSi_Unique_Dmg",
											"UNDISPELLABLE",
											"UNSTEALABLE"
										}
									}, {
										buffeft1
									})
									global.LockHeroCards(_env, global.GetOwner(_env, _env.TARGET), nil, {
										anim = "alsi_baoshiaixin",
										loop = true,
										card = card,
										time = this.LockTime * 1000
									})
									global.LockCardFlag(_env, _env.TARGET, card, this.LockTime)
								end
							end
						end
					end
				elseif target ~= nil then
					global.ThrownKick(_env, target, false)
				end
			end
		end)
		exec["@time"]({
			3230
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)

			for _, unit in global.__iter__(global.AllUnits(_env)) do
				global.setRootVisible(_env, unit, true)
			end
		end)

		return _env
	end
}
all.Skill_SP_ALSi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RPFactor = externs.RPFactor

		if this.RPFactor == nil then
			this.RPFactor = 150
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_DIE"
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

			global.ApplyRPRecovery(_env, _env.ACTOR, this.RPFactor)
		end)

		return _env
	end
}
all.Skill_SP_ALSi_Passive_Key = {
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
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		passive4 = global["[trigger_by]"](this, {
			"UNIT_KICK_BY_OTHERSET"
		}, passive4)
		passive4 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive4)
		local passive5 = __action(this, {
			name = "passive5",
			entry = prototype.passive5
		})
		passive5 = global["[duration]"](this, {
			0
		}, passive5)
		passive5 = global["[trigger_by]"](this, {
			"UNIT_BUFF_STEALED"
		}, passive5)
		passive5 = global["[trigger_by]"](this, {
			"UNIT_BUFF_CANCELED"
		}, passive5)
		passive5 = global["[trigger_by]"](this, {
			"UNIT_BUFF_BROKED"
		}, passive5)
		this.passive5 = global["[trigger_by]"](this, {
			"UNIT_BUFF_ENDED"
		}, passive5)

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

			if global.MARKED(_env, "SP_ALSi")(_env, _env.ACTOR) then
				global.SP_ALSi_Taunt(_env)
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

			if global.MARKED(_env, "SP_ALSi")(_env, _env.ACTOR) and global.CellColLocation(_env, _env.oldCell) ~= global.CellColLocation(_env, _env.newCell) and _env.unit ~= _env.ACTOR and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				global.SP_ALSi_Taunt(_env)
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

			if global.MARKED(_env, "SP_ALSi")(_env, _env.ACTOR) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				global.SP_ALSi_Taunt(_env)
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
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

			if global.MARKED(_env, "SP_ALSi")(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				for _, units in global.__iter__(global.EnemyUnits(_env)) do
					global.DispelBuff(_env, units, global.BUFF_MARKED(_env, "Skill_SP_ALSi_Key"), 99)
				end
			end

			if global.MARKED(_env, "SP_ALSi")(_env, _env.ACTOR) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				global.SP_ALSi_Taunt(_env)
			end
		end)

		return _env
	end,
	passive5 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.buff = externs.buff

		assert(_env.buff ~= nil, "External variable `buff` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MARKED(_env, "SP_ALSi")(_env, _env.ACTOR) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) and global.BuffIsMatched(_env, _env.buff, "IMMUNE") and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "IMMUNE")) == 0 then
				global.SP_ALSi_Taunt(_env)
			end
		end)

		return _env
	end
}

function all.SP_ALSi_Taunt(_env)
	local this = _env.this
	local global = _env.global

	for _, unit in global.__iter__(global.EnemyUnits(_env)) do
		global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Skill_SP_ALSi_Key"), 99)
	end

	for _, unit in global.__iter__(global.EnemyUnits(_env, global.MID_COL)) do
		local enemyfront = global.EnemyUnits(_env, global.FRONT_OF(_env, unit, true) * global.COL_OF(_env, unit))

		if #enemyfront <= 0 then
			local buffeft = global.Taunt(_env)

			global.ApplyBuff(_env, unit, {
				timing = 0,
				display = "Taunt",
				group = "Skill_SP_ALSi_Key_Taunt",
				duration = 99,
				limit = 1,
				tags = {
					"Skill_SP_ALSi_Key",
					"STATUS",
					"TAUNT",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft
			})

			break
		end
	end
end

all.Skill_SP_ALSi_Proud_EX = {
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

		this.AbsFactor = externs.AbsFactor

		if this.AbsFactor == nil then
			this.AbsFactor = 0.15
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1230
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_ALSi"
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

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.2,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local buff = global.NumericEffect(_env, "+absorption", {
				"+Normal",
				"+Normal"
			}, this.AbsFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				display = "Absorption",
				group = "Skill_SP_ALSi_Proud_EX",
				duration = 3,
				limit = 1,
				tags = {
					"NUMERIC",
					"BUFF",
					"ABSORPTION",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buff
			}, 1, 0)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_SP_ALSi_Unique_EX = {
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
				5,
				0
			}
		end

		this.LockTime = externs.LockTime

		if this.LockTime == nil then
			this.LockTime = 35
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3230
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_ALSi"
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
			global.GroundEft(_env, _env.ACTOR, "Ground_SP_ALSi")

			for _, unit in global.__iter__(global.AllUnits(_env, -global.ONESELF(_env, _env.ACTOR) - global.ONESELF(_env, _env.TARGET))) do
				global.setRootVisible(_env, unit, false)
			end

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.FocusCamera(_env, _env.ACTOR, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 1.8, 600)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 100, "skill3"))
			global.DelayCall(_env, 1600, global.FocusCamera, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1, 10)
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)
			global.DelayCall(_env, 30, global.ShakeScreen, {
				Id = 3,
				duration = 50,
				enhance = 7
			})
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)
			local result = global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)

			if result and result.deadly ~= true then
				local target = _env.TARGET

				if target and (global.SUMMONS(_env, target) or global.MASTER(_env, target) or global.MARKED(_env, "DAGUN")(_env, target) or global.MARKED(_env, "SummonedNian")(_env, target)) then
					target = nil
				end

				if target ~= nil and global.MARKED(_env, "SummonedNian")(_env, global.EnemyMaster(_env)) then
					global.ThrownKick(_env, target, true)
				end

				if target ~= nil and (global.MARKED(_env, "Player_Master")(_env, global.EnemyMaster(_env)) or global.MARKED(_env, "DAGUN")(_env, global.EnemyMaster(_env)) or global.MARKED(_env, "SP_DDing")(_env, global.EnemyMaster(_env))) then
					global.ThrownKick(_env, target, false)

					for i = 1, 4 do
						local card_window = global.CardAtWindowIndex(_env, global.GetOwner(_env, _env.TARGET), i)

						if card_window == nil then
							local card = global.BackToCard_ResultCheck(_env, target, "window", i)

							if card then
								local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_SP_ALSi_Unique_val", {
									"+Normal",
									"+Normal"
								}, damage.val)

								global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.TARGET), card, {
									timing = 0,
									duration = 99,
									tags = {
										"CARDBUFF",
										"Skill_SP_ALSi_Unique_Dmg",
										"UNDISPELLABLE",
										"UNSTEALABLE"
									}
								}, {
									buffeft1
								})
								global.LockHeroCards(_env, global.GetOwner(_env, _env.TARGET), nil, {
									anim = "alsi_baoshiaixin",
									loop = true,
									card = card,
									time = this.LockTime * 1000
								})
								global.LockCardFlag(_env, _env.TARGET, card, this.LockTime)
							end
						end

						if i == 4 and card_window ~= nil then
							local card_lock = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.TARGET), global.CARD_HERO_MARKED(_env, "LOCK"))

							if #card_lock < 3 then
								local cardlocation = global.Random(_env, 1, 4)
								local card = global.BackToCard_ResultCheck(_env, target, "window", cardlocation)

								if card then
									local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_SP_ALSi_Unique_val", {
										"+Normal",
										"+Normal"
									}, damage.val)

									global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.TARGET), card, {
										timing = 0,
										duration = 99,
										tags = {
											"CARDBUFF",
											"Skill_SP_ALSi_Unique_Dmg",
											"UNDISPELLABLE",
											"UNSTEALABLE"
										}
									}, {
										buffeft1
									})
									global.LockHeroCards(_env, global.GetOwner(_env, _env.TARGET), nil, {
										anim = "alsi_baoshiaixin",
										loop = true,
										card = card,
										time = this.LockTime * 1000
									})
									global.LockCardFlag(_env, _env.TARGET, card, this.LockTime)
								end
							end

							if #card_lock >= 3 then
								local card = global.BackToCard_ResultCheck(_env, target, "card")

								if card then
									local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_SP_ALSi_Unique_val", {
										"+Normal",
										"+Normal"
									}, damage.val)

									global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.TARGET), card, {
										timing = 0,
										duration = 99,
										tags = {
											"CARDBUFF",
											"Skill_SP_ALSi_Unique_Dmg",
											"UNDISPELLABLE",
											"UNSTEALABLE"
										}
									}, {
										buffeft1
									})
									global.LockHeroCards(_env, global.GetOwner(_env, _env.TARGET), nil, {
										anim = "alsi_baoshiaixin",
										loop = true,
										card = card,
										time = this.LockTime * 1000
									})
									global.LockCardFlag(_env, _env.TARGET, card, this.LockTime)
								end
							end
						end
					end
				elseif target ~= nil then
					global.ThrownKick(_env, target, false)
				end
			end
		end)
		exec["@time"]({
			3230
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)

			for _, unit in global.__iter__(global.AllUnits(_env)) do
				global.setRootVisible(_env, unit, true)
			end
		end)

		return _env
	end
}
all.Skill_SP_ALSi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RPFactor = externs.RPFactor

		if this.RPFactor == nil then
			this.RPFactor = 200
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive)
		this.SingleFactor = externs.SingleFactor

		if this.SingleFactor == nil then
			this.SingleFactor = 0.3
		end

		this.AoeFactor = externs.AoeFactor

		if this.AoeFactor == nil then
			this.AoeFactor = 0.1
		end

		this.ShieldMaxFactor = externs.ShieldMaxFactor

		if this.ShieldMaxFactor == nil then
			this.ShieldMaxFactor = 3.5
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

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				global.ApplyRPRecovery(_env, _env.ACTOR, this.RPFactor)
			end
		end)

		return _env
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

			global.AddStatus(_env, _env.ACTOR, "Passive_EX")

			local buff1 = global.SpecialNumericEffect(_env, "+SP_ALSi_SingleFactor", {
				"+Normal",
				"+Normal"
			}, this.SingleFactor)
			local buff2 = global.SpecialNumericEffect(_env, "+SP_ALSi_AoeFactor", {
				"+Normal",
				"+Normal"
			}, this.AoeFactor)
			local buff3 = global.SpecialNumericEffect(_env, "+SP_ALSi_ShieldMaxFactor", {
				"+Normal",
				"+Normal"
			}, this.ShieldMaxFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"SP_ALSi_1"
				}
			}, {
				buff1,
				buff2,
				buff3
			})

			local buffeft1 = global.PassiveFunEffectBuff(_env, "Skill_SP_ALSi_Unique_Dmg_Field", {})

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"Skill_SP_ALSi_Unique_Dmg_Field",
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
all.Skill_SP_ALSi_Unique_Dmg_Field = {
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local buffCount = global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "Skill_SP_ALSi_Unique_Dmg"))

				if buffCount > 0 then
					global.ApplyHPReduce(_env, _env.unit, global.SpecialPropGetter(_env, "Skill_SP_ALSi_Unique_val")(_env, _env.unit))
					global.DispelBuff(_env, _env.unit, global.BUFF_MARKED(_env, "Skill_SP_ALSi_Unique_Dmg"), 99)
				end
			end
		end)

		return _env
	end
}

function all.LockCardFlag(_env, target, card, locktime)
	local this = _env.this
	local global = _env.global
	local buff = global.NumericEffect(_env, "+def", {
		"+Normal",
		"+Normal"
	}, 0)

	global.ApplyHeroCardBuff(_env, global.GetOwner(_env, target), card, {
		group = "SP_ALSi_LOCK",
		timing = 4,
		limit = 1,
		duration = locktime,
		tags = {
			"LOCK_ALSi",
			"UNDISPELLABLE",
			"UNSTEALABLE"
		}
	}, {
		buff
	})
	global.DelayCall(_env, locktime * 1000, global.DispelBuffOnHeroCard, card, "LOCK_ALSi")
	global.AddCardFlags(_env, card, {
		"LOCK"
	})
	global.DelayCall(_env, locktime * 1000, global.ClearCardFlags, card, {
		"LOCK"
	})
end

return _M
