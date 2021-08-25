local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_AMLBLTe_Normal = {
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
				-1.7,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			534
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
all.Skill_AMLBLTe_Proud = {
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
			1333
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_AMLBLTe"
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

		_env.target = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			833
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
all.Skill_AMLBLTe_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.shieldFactor = externs.shieldFactor

		if this.shieldFactor == nil then
			this.shieldFactor = 3
		end

		this.rpFactor = externs.rpFactor

		if this.rpFactor == nil then
			this.rpFactor = 200
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3734
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_AMLBLTe"
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

			local run = global.Animation(_env, "run", 100, nil, -1)
			run = global.MoveTo(_env, global.FixedPos(_env, 0, 0, 2), 100, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, "skill3_1")), false)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			1833
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.ACTOR) - global.MARKED(_env, "DAGUN"))

			if units[1] then
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_3"), false)
			else
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_2"), false)

				local buffeft1 = global.DeathImmuneEffect(_env, 1)

				if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "AMLBLTe_Undead")) == 0 then
					global.DelayCall(_env, 200, global.ApplyBuff_Buff, _env.ACTOR, _env.ACTOR, {
						timing = 0,
						display = "Undead",
						group = "AMLBLTe_Undead",
						duration = 99,
						limit = 1,
						tags = {
							"AMLBLTe_Undead",
							"UNDEAD",
							"STATUS",
							"DISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
				end
			end
		end)
		exec["@time"]({
			2467
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.EnemyUnits(_env, global.PETS - global.SUMMONS - global.MARKED(_env, "DAGUN"))

			if units[1] then
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_3"), false)
			else
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_2"), false)

				if global.FriendMaster(_env) then
					global.DelayCall(_env, 200, global.ApplyRPRecovery, global.FriendMaster(_env), this.rpFactor)
				end
			end
		end)
		exec["@time"]({
			3100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "XLDBLTe"))
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local shield = global.ShieldEffect(_env, atk * this.shieldFactor)

			if units[1] then
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_2"))

				shield = global.ShieldEffect(_env, atk * this.shieldFactor * 1.5)
			else
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_3"))
			end

			global.DelayCall(_env, 200, global.ApplyBuff_Buff, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "Shield",
				tags = {
					"SHIELD",
					"STATUS",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				shield
			}, 1, 0)

			if global.FriendMaster(_env) then
				global.DelayCall(_env, 200, global.ApplyBuff_Buff, _env.ACTOR, global.FriendMaster(_env), {
					timing = 0,
					duration = 99,
					display = "Shield",
					tags = {
						"SHIELD",
						"STATUS",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					shield
				}, 1, 0)
			end
		end)
		exec["@time"]({
			3700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_AMLBLTe_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefFactor = externs.DefFactor

		if this.DefFactor == nil then
			this.DefFactor = 0.1
		end

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 10
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:PRE_ENTER"
		}, passive1)
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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "AMLBLTe"))) do
					local buff = global.NumericEffect(_env, "+def", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
						timing = 0,
						duration = 99,
						tags = {
							"CARDBUFF",
							"INBORN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})
				end

				global.RefreshCardPool(_env, "INBORN")
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buff_trap = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)
				local trap = global.BuffTrap(_env, {
					timing = 2,
					duration = 1,
					tags = {}
				}, {
					buff_trap
				})

				for _, cell in global.__iter__(global.FriendCells(_env, global.NEIGHBORS_CELL_OF(_env, global.GetCell(_env, _env.ACTOR)) - global.CELL_HAS_UNIT(_env, _env.ACTOR))) do
					if global.SelectTrapCount(_env, cell, global.BUFF_MARKED(_env, "XLDBLTe_Yumao")) == 0 then
						global.ApplyTrap(_env, cell, {
							display = "fen_yumao",
							duration = 99,
							triggerLife = 99,
							tags = {
								"AMLBLTe_Yumao"
							}
						}, {
							trap
						})
					else
						global.DispelBuffTrap(_env, cell, global.BUFF_MARKED(_env, "XLDBLTe_Yumao"))
						global.ApplyTrap(_env, cell, {
							display = "fencheng_yumao",
							duration = 99,
							triggerLife = 99,
							tags = {
								"BOTH_Yumao"
							}
						}, {
							trap
						})
					end
				end

				local buff = global.PassiveFunEffectBuff(_env, "Skill_Cross_Buff_AMLBLTe", {
					DefFactor = this.DefFactor,
					RpFactor = this.RpFactor,
					actor = _env.ACTOR
				})

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"Skill_AMLBLTe_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}
all.Skill_Cross_Buff_AMLBLTe = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefFactor = externs.DefFactor

		assert(this.DefFactor ~= nil, "External variable `DefFactor` is not provided.")

		this.RpFactor = externs.RpFactor

		assert(this.RpFactor ~= nil, "External variable `RpFactor` is not provided.")

		this.actor = externs.actor

		assert(this.actor ~= nil, "External variable `actor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[schedule_in_cycles]"](this, {
			1000
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			100
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
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK_BY_OTHERSET"
		}, passive3)
		passive3 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"UNIT_DIE"
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

			if this.actor then
				for _, unit in global.__iter__(global.FriendUnits(_env, global.NEIGHBORS_OF(_env, this.actor) - global.ONESELF(_env, this.actor))) do
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "Cross_Buff_AMLBLTe")) == 0 then
						local buff = global.NumericEffect(_env, "+defrate", {
							"+Normal",
							"+Normal"
						}, this.DefFactor)

						global.ApplyBuff(_env, unit, {
							duration = 99,
							group = "Cross_Buff_AMLBLTe",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"BUFF",
								"Cross_Buff_AMLBLTe",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
					end

					global.ApplyRPRecovery(_env, unit, this.RpFactor)
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				for _, unit in global.__iter__(global.FriendUnits(_env, -global.NEIGHBORS_OF(_env, this.actor))) do
					global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Cross_Buff_AMLBLTe"), 99)
				end

				if _env.unit == this.actor then
					local buff_trap = global.NumericEffect(_env, "+defrate", {
						"+Normal",
						"+Normal"
					}, 0)
					local trap = global.BuffTrap(_env, {
						timing = 2,
						duration = 1,
						tags = {}
					}, {
						buff_trap
					})

					for _, cell in global.__iter__(global.FriendCells(_env, global.NEIGHBORS_CELL_OF(_env, _env.oldCell))) do
						global.DispelBuffTrap(_env, cell, global.BUFF_MARKED(_env, "AMLBLTe_Yumao"))
						global.DispelBuffTrap(_env, cell, global.BUFF_MARKED(_env, "BOTH_Yumao"))

						for _, cells_out in global.__iter__(global.FriendCells(_env, global.NEIGHBORS_CELL_OF(_env, cell) - global.ONESELF_CELL(_env, cell))) do
							if global.GetCellUnit(_env, cells_out) and global.MARKED(_env, "XLDBLTe")(_env, global.GetCellUnit(_env, cells_out)) then
								global.ApplyTrap(_env, cell, {
									display = "cheng_yumao",
									duration = 99,
									triggerLife = 99,
									tags = {
										"XLDBLTe_Yumao"
									}
								}, {
									trap
								})
							end
						end
					end

					for _, cell in global.__iter__(global.FriendCells(_env, global.NEIGHBORS_CELL_OF(_env, _env.newCell) - global.CELL_HAS_UNIT(_env, this.actor))) do
						if global.SelectTrapCount(_env, cell, global.BUFF_MARKED(_env, "XLDBLTe_Yumao")) == 0 then
							global.DelayCall(_env, 80, global.ApplyTrap, cell, {
								display = "fen_yumao",
								duration = 99,
								triggerLife = 99,
								tags = {
									"AMLBLTe_Yumao"
								}
							}, {
								trap
							})
						else
							global.DispelBuffTrap(_env, cell, global.BUFF_MARKED(_env, "XLDBLTe_Yumao"))
							global.DelayCall(_env, 80, global.ApplyTrap, cell, {
								display = "fencheng_yumao",
								duration = 99,
								triggerLife = 99,
								tags = {
									"BOTH_Yumao"
								}
							}, {
								trap
							})
						end
					end
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == this.actor then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "Cross_Buff_AMLBLTe"), 99)
				end

				for _, cell in global.__iter__(global.FriendCells(_env, global.NEIGHBORS_CELL_OF(_env, global.GetCell(_env, _env.unit)) - global.CELL_HAS_UNIT(_env, _env.unit))) do
					global.DispelBuffTrap(_env, cell, global.BUFF_MARKED(_env, "AMLBLTe_Yumao"))
					global.DispelBuffTrap(_env, cell, global.BUFF_MARKED(_env, "BOTH_Yumao"))

					for _, cells_out in global.__iter__(global.FriendCells(_env, global.NEIGHBORS_CELL_OF(_env, cell) - global.ONESELF_CELL(_env, cell))) do
						if global.GetCellUnit(_env, cells_out) and global.MARKED(_env, "XLDBLTe")(_env, global.GetCellUnit(_env, cells_out)) then
							local buff_trap = global.NumericEffect(_env, "+defrate", {
								"+Normal",
								"+Normal"
							}, 0)
							local trap = global.BuffTrap(_env, {
								timing = 2,
								duration = 1,
								tags = {}
							}, {
								buff_trap
							})

							global.ApplyTrap(_env, cell, {
								display = "cheng_yumao",
								duration = 99,
								triggerLife = 99,
								tags = {
									"XLDBLTe_Yumao"
								}
							}, {
								trap
							})
						end
					end
				end

				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_AMLBLTe_Passive"), 99)
			end
		end)

		return _env
	end
}
all.Skill_AMLBLTe_Proud_EX = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1333
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_AMLBLTe"
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

		_env.target = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			833
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
all.Skill_AMLBLTe_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.shieldFactor = externs.shieldFactor

		if this.shieldFactor == nil then
			this.shieldFactor = 3.5
		end

		this.rpFactor = externs.rpFactor

		if this.rpFactor == nil then
			this.rpFactor = 400
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3734
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_AMLBLTe"
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

			local run = global.Animation(_env, "run", 100, nil, -1)
			run = global.MoveTo(_env, global.FixedPos(_env, 0, 0, 2), 100, run)

			global.Perform(_env, _env.ACTOR, global.Sequence(_env, run, global.Animation(_env, "skill3_1")), false)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			1833
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.FriendUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.ACTOR) - global.MARKED(_env, "DAGUN"))

			if units[1] then
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_3"), false)
			else
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_2"), false)

				local buffeft1 = global.DeathImmuneEffect(_env, 1)

				if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "AMLBLTe_Undead")) == 0 then
					global.DelayCall(_env, 200, global.ApplyBuff_Buff, _env.ACTOR, _env.ACTOR, {
						timing = 0,
						display = "Undead",
						group = "AMLBLTe_Undead",
						duration = 99,
						limit = 1,
						tags = {
							"AMLBLTe_Undead",
							"UNDEAD",
							"STATUS",
							"DISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
				end
			end
		end)
		exec["@time"]({
			2467
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.EnemyUnits(_env, global.PETS - global.SUMMONS - global.MARKED(_env, "DAGUN"))

			if units[1] then
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_3"), false)
			else
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_2"), false)

				if global.FriendMaster(_env) then
					global.DelayCall(_env, 200, global.ApplyRPRecovery, global.FriendMaster(_env), this.rpFactor)
				end
			end
		end)
		exec["@time"]({
			3100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "XLDBLTe"))
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local shield = global.ShieldEffect(_env, atk * this.shieldFactor)

			if units[1] then
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_2"))

				shield = global.ShieldEffect(_env, atk * this.shieldFactor * 1.5)
			else
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3_3"))
			end

			global.DelayCall(_env, 200, global.ApplyBuff_Buff, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "Shield",
				tags = {
					"SHIELD",
					"STATUS",
					"DISPELLABLE",
					"STEALABLE"
				}
			}, {
				shield
			}, 1, 0)

			if global.FriendMaster(_env) then
				global.DelayCall(_env, 200, global.ApplyBuff_Buff, _env.ACTOR, global.FriendMaster(_env), {
					timing = 0,
					duration = 99,
					display = "Shield",
					tags = {
						"SHIELD",
						"STATUS",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					shield
				}, 1, 0)
			end
		end)
		exec["@time"]({
			3700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_AMLBLTe_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DefFactor = externs.DefFactor

		if this.DefFactor == nil then
			this.DefFactor = 0.15
		end

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 20
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:PRE_ENTER"
		}, passive1)
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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "AMLBLTe"))) do
					local buff = global.NumericEffect(_env, "+def", {
						"+Normal",
						"+Normal"
					}, 0)

					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
						timing = 0,
						duration = 99,
						tags = {
							"CARDBUFF",
							"INBORN",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff
					})
				end

				global.RefreshCardPool(_env, "INBORN")
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buff_trap = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)
				local trap = global.BuffTrap(_env, {
					timing = 2,
					duration = 1,
					tags = {}
				}, {
					buff_trap
				})

				for _, cell in global.__iter__(global.FriendCells(_env, global.NEIGHBORS_CELL_OF(_env, global.GetCell(_env, _env.ACTOR)) - global.CELL_HAS_UNIT(_env, _env.ACTOR))) do
					if global.SelectTrapCount(_env, cell, global.BUFF_MARKED(_env, "XLDBLTe_Yumao")) == 0 then
						global.ApplyTrap(_env, cell, {
							display = "fen_yumao",
							duration = 99,
							triggerLife = 99,
							tags = {
								"AMLBLTe_Yumao"
							}
						}, {
							trap
						})
					else
						global.DispelBuffTrap(_env, cell, global.BUFF_MARKED(_env, "XLDBLTe_Yumao"))
						global.ApplyTrap(_env, cell, {
							display = "fencheng_yumao",
							duration = 99,
							triggerLife = 99,
							tags = {
								"BOTH_Yumao"
							}
						}, {
							trap
						})
					end
				end

				local buff = global.PassiveFunEffectBuff(_env, "Skill_Cross_Buff_AMLBLTe", {
					DefFactor = this.DefFactor,
					RpFactor = this.RpFactor,
					actor = _env.ACTOR
				})

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"Skill_AMLBLTe_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
				})
			end
		end)

		return _env
	end
}

return _M
