local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Sk_Friend_FBReduction = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Reduction = externs.Reduction

		assert(this.Reduction ~= nil, "External variable `Reduction` is not provided.")

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
			"SELF:HURTED"
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
			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.Reduction)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 3,
				duration = 1,
				display = "Shield",
				tags = {
					"STATUS",
					"NUMERIC",
					"FIRSTBLOODREDUCTION"
				}
			}, {
				buffeft1
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "FIRSTBLOODREDUCTION"))
			global.DispelBuff(_env, global.EnemyMaster(_env), global.BUFF_MARKED(_env, "FIRSTBLOODREDUCTION"))
		end)

		return _env
	end
}
all.Sk_Enemy_FBReduction = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Reduction = externs.Reduction

		assert(this.Reduction ~= nil, "External variable `Reduction` is not provided.")

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
			"SELF:HURTED"
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
			local buffeft1 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.Reduction)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 3,
				duration = 1,
				display = "Shield",
				tags = {
					"STATUS",
					"NUMERIC",
					"FIRSTBLOODREDUCTION"
				}
			}, {
				buffeft1
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "FIRSTBLOODREDUCTION"))
			global.DispelBuff(_env, global.EnemyMaster(_env), global.BUFF_MARKED(_env, "FIRSTBLOODREDUCTION"))
		end)

		return _env
	end
}
all.Skill_MainStage_EnemyEnergyAdjustment = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.EnergyAdjustmentRate = externs.EnergyAdjustmentRate

		assert(this.EnergyAdjustmentRate ~= nil, "External variable `EnergyAdjustmentRate` is not provided.")

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
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
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
			local count = #global.FriendUnits(_env)

			if count <= 3 then
				local buffeft1 = global.EnergyEffect(_env, this.EnergyAdjustmentRate)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 999,
					group = "Skill_MainStage_EnemyEnergyAdjustment",
					timing = 4,
					limit = 1,
					tags = {
						"STATUS",
						"Skill_MainStage_EnemyEnergyAdjustment",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local count = #global.FriendUnits(_env)

				if count > 3 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Skill_MainStage_EnemyEnergyAdjustment", "UNDISPELLABLE"), 99)
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local count = #global.FriendUnits(_env)

			if count <= 4 then
				local buffeft1 = global.EnergyEffect(_env, this.EnergyAdjustmentRate)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 999,
					group = "Skill_MainStage_EnemyEnergyAdjustment",
					timing = 4,
					limit = 1,
					tags = {
						"STATUS",
						"Skill_MainStage_EnemyEnergyAdjustment",
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
all.Skill_CombatDominating = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CombatDominating_HurtRateFactor = externs.CombatDominating_HurtRateFactor

		if this.CombatDominating_HurtRateFactor == nil then
			this.CombatDominating_HurtRateFactor = 0
		end

		this.CombatDominating_UnHurtRateFactor = externs.CombatDominating_UnHurtRateFactor

		if this.CombatDominating_UnHurtRateFactor == nil then
			this.CombatDominating_UnHurtRateFactor = 0
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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
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

			if this.CombatDominating_HurtRateFactor ~= 0 then
				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					if this.CombatDominating_HurtRateFactor > 0 then
						local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
							"+Normal",
							"+Normal"
						}, this.CombatDominating_HurtRateFactor)

						global.ApplyBuff(_env, unit, {
							duration = 99,
							group = "Skill_MainStage_CombatDominating_Hurtrate",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"Skill_MainStage_CombatDominating_Hurtrate"
							}
						}, {
							buffeft1
						})
					else
						local buffeft1 = global.NumericEffect(_env, "-hurtrate", {
							"+Normal",
							"+Normal"
						}, global.abs(_env, this.CombatDominating_HurtRateFactor))

						global.ApplyBuff(_env, unit, {
							duration = 99,
							group = "Skill_MainStage_CombatDominating_Hurtrate",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"Skill_MainStage_CombatDominating_Hurtrate"
							}
						}, {
							buffeft1
						})
					end
				end
			end

			if this.CombatDominating_UnHurtRateFactor ~= 0 then
				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					if this.CombatDominating_UnHurtRateFactor > 0 then
						local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
							"+Normal",
							"+Normal"
						}, this.CombatDominating_UnHurtRateFactor)

						global.ApplyBuff(_env, unit, {
							duration = 99,
							group = "Skill_MainStage_CombatDominating_UnHurtrate",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"Skill_MainStage_CombatDominating_UnHurtrate"
							}
						}, {
							buffeft2
						})
					else
						local buffeft2 = global.NumericEffect(_env, "-unhurtrate", {
							"+Normal",
							"+Normal"
						}, global.abs(_env, this.CombatDominating_UnHurtRateFactor))

						global.ApplyBuff(_env, unit, {
							duration = 99,
							group = "Skill_MainStage_CombatDominating_UnHurtrate",
							timing = 0,
							limit = 1,
							tags = {
								"STATUS",
								"NUMERIC",
								"UNDISPELLABLE",
								"UNSTEALABLE",
								"Skill_MainStage_CombatDominating_UnHurtrate"
							}
						}, {
							buffeft2
						})
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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				if this.CombatDominating_HurtRateFactor == 0 then
					-- Nothing
				elseif this.CombatDominating_HurtRateFactor > 0 then
					local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.CombatDominating_HurtRateFactor)

					global.ApplyBuff(_env, _env.unit, {
						duration = 99,
						group = "Skill_MainStage_CombatDominating_Hurtrate",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"Skill_MainStage_CombatDominating_Hurtrate"
						}
					}, {
						buffeft1
					})
				else
					local buffeft1 = global.NumericEffect(_env, "-hurtrate", {
						"+Normal",
						"+Normal"
					}, global.abs(_env, this.CombatDominating_HurtRateFactor))

					global.ApplyBuff(_env, _env.unit, {
						duration = 99,
						group = "Skill_MainStage_CombatDominating_Hurtrate",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"Skill_MainStage_CombatDominating_Hurtrate"
						}
					}, {
						buffeft1
					})
				end

				if this.CombatDominating_UnHurtRateFactor == 0 then
					-- Nothing
				elseif this.CombatDominating_UnHurtRateFactor > 0 then
					local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
						"+Normal",
						"+Normal"
					}, this.CombatDominating_UnHurtRateFactor)

					global.ApplyBuff(_env, _env.unit, {
						duration = 99,
						group = "Skill_MainStage_CombatDominating_UnHurtrate",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"Skill_MainStage_CombatDominating_UnHurtrate"
						}
					}, {
						buffeft2
					})
				else
					local buffeft2 = global.NumericEffect(_env, "-unhurtrate", {
						"+Normal",
						"+Normal"
					}, global.abs(_env, this.CombatDominating_UnHurtRateFactor))

					global.ApplyBuff(_env, _env.unit, {
						duration = 99,
						group = "Skill_MainStage_CombatDominating_UnHurtrate",
						timing = 0,
						limit = 1,
						tags = {
							"STATUS",
							"NUMERIC",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"Skill_MainStage_CombatDominating_UnHurtrate"
						}
					}, {
						buffeft2
					})
				end
			end
		end)

		return _env
	end
}
all.Fight_MaxCostBuff = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateFactor = externs.HurtRateFactor

		assert(this.HurtRateFactor ~= nil, "External variable `HurtRateFactor` is not provided.")

		this.UnHurtRateFactor = externs.UnHurtRateFactor

		assert(this.UnHurtRateFactor ~= nil, "External variable `UnHurtRateFactor` is not provided.")

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
			"UNIT_ENTER"
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
			local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+unhurtrate", {
				"+Normal",
				"+Normal"
			}, this.UnHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "Fight_MaxCostBuff",
				timing = 0,
				limit = 1,
				tags = {
					"NUMERIC",
					"Fight_MaxCostBuff",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local buffeft3 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.HurtRateFactor)
				local buffeft4 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnHurtRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "Fight_MaxCostBuff",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"Fight_MaxCostBuff",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft3,
					buffeft4
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_EnterDaze_Passive_1_1 = {
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
			"UNIT_ENTER"
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

			if global.EnemyMaster(_env) then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff(_env, global.EnemyMaster(_env), {
					timing = 1,
					duration = 99,
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.unit) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff(_env, global.EnemyMaster(_env), {
					timing = 1,
					duration = 99,
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
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
all.Skill_Enemy_MYKSi_Skill_Stop = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			934
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

			global.LockTime(_env, 500)
		end)

		return _env
	end
}
all.Skill_YSuo_Proud_1_3 = {
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
				1.5,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1334
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
				-1.4,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				200,
				400
			}, global.SplitValue(_env, damage, {
				0.3,
				0.3,
				0.4
			}))
		end)

		return _env
	end
}
all.Skill_YSuo_Unique_Special_1_3 = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2667
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_YSuo"
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
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "ALL")

			if global.INSTATUS(_env, "DoubleTime")(_env, _env.ACTOR) then
				global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
				global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

				local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

				global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
					0,
					400,
					900
				}, global.SplitValue(_env, damage, {
					0.3,
					0.3,
					0.4
				}))
			else
				global.AddStatus(_env, _env.ACTOR, "DoubleTime")

				local damage = {
					val = defender.maxHp * 0.55
				}

				global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
					0,
					400,
					900
				}, global.SplitValue(_env, damage, {
					0.3,
					0.3,
					0.4
				}))
			end
		end)
		exec["@time"]({
			2667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
			global.LockTime(_env, 500)
		end)

		return _env
	end
}
all.Skill_Enemy_MYKSi_Skill_Pause = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			834
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

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
			global.LockTime(_env, 2000)
			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2.4,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)
		exec["@time"]({
			834
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LDu_Saba_Passive_Death_Special_1_1 = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			834
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

		_env.masterextra = 1

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 100, "dieskill"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "ALL")

			if global.MASTER(_env, _env.TARGET) then
				_env.masterextra = 0.5
			else
				_env.masterextra = 1
			end

			global.ApplyHPDamage(_env, _env.TARGET, defender.maxHp * 0.3 * _env.masterextra)
		end)
		exec["@time"]({
			830
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Kick(_env, _env.ACTOR)
		end)

		return _env
	end
}
all.Skill_LDu_Saba_Passive_Death_Special_1_2 = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			834
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

		_env.masterextra = 1

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 100, "dieskill"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "ALL")

			if global.MASTER(_env, _env.TARGET) then
				_env.masterextra = 0.5
			else
				_env.masterextra = 1
			end

			global.ApplyHPDamage(_env, _env.TARGET, defender.maxHp * 0.25 * _env.masterextra)
		end)
		exec["@time"]({
			830
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Kick(_env, _env.ACTOR)
		end)

		return _env
	end
}
all.Skill_LDu_Saba_Passive_Death_Special_1_3 = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			834
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

		_env.masterextra = 1

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 100, "dieskill"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "ALL")

			if global.MASTER(_env, _env.TARGET) then
				_env.masterextra = 0.5
			else
				_env.masterextra = 1
			end

			global.ApplyHPDamage(_env, _env.TARGET, defender.maxHp * 0.2 * _env.masterextra)
		end)
		exec["@time"]({
			830
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Kick(_env, _env.ACTOR)
		end)

		return _env
	end
}
all.Skill_LDu_Unique_1_4 = {
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

		this.summonFactorHp = externs.summonFactorHp

		assert(this.summonFactorHp ~= nil, "External variable `summonFactorHp` is not provided.")

		this.summonFactorAtk = externs.summonFactorAtk

		assert(this.summonFactorAtk ~= nil, "External variable `summonFactorAtk` is not provided.")

		this.summonFactorDef = externs.summonFactorDef

		assert(this.summonFactorDef ~= nil, "External variable `summonFactorDef` is not provided.")

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2900
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_LDu"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_LDu_Skill3"
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

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
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
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local SummonedLDu1 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				1
			})

			if SummonedLDu1 then
				global.AddStatus(_env, SummonedLDu1, "SummonedLDu")

				local DmgRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu1, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu2 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				2
			})

			if SummonedLDu2 then
				global.AddStatus(_env, SummonedLDu2, "SummonedLDu")

				local DmgRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu2, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu3 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				3
			})

			if SummonedLDu3 then
				global.AddStatus(_env, SummonedLDu3, "SummonedLDu")

				local DmgRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu3, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end

			local SummonedLDu4 = global.Summon(_env, _env.ACTOR, "SummonedLDu", this.summonFactor, nil, {
				5
			})

			if SummonedLDu4 then
				global.AddStatus(_env, SummonedLDu4, "SummonedLDu")

				local DmgRateFactor = global.SpecialPropGetter(_env, "specialnum1")(_env, _env.ACTOR)
				local buffeft1 = global.SpecialNumericEffect(_env, "+Skill_LDu_Passive", {
					"?Normal"
				}, DmgRateFactor)

				global.ApplyBuff(_env, SummonedLDu4, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"Skill_LDu_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)
		exec["@time"]({
			2900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
			global.Speak(_env, _env.ACTOR, {
				{
					"Bubble1_4_2",
					4000
				}
			}, "", 0)
		end)

		return _env
	end
}
all.Skill_LDu_Passive_DieTransform_1_4 = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			2500
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

			global.Speak(_env, _env.ACTOR, {
				{
					"Skill_LDu_Passive_DieTransform_1_4",
					2500
				}
			}, "", 0)
			global.Perform(_env, _env.ACTOR, global.Animation(_env, "fakedie", nil, , 1))
			global.AddAnim(_env, {
				loop = 2,
				anim = "bianshen2_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Sound(_env, "Se_Skill_Change_1", 1)
			global.BossComing(_env)
		end)
		exec["@time"]({
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.AddAnim(_env, {
				loop = 1,
				anim = "bianshen_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Transform(_env, _env.ACTOR, 1)
			global.Sound(_env, "Se_Skill_Change_2", 1)
		end)

		return _env
	end
}
all.Skill_LDu_Unique_1_4_AOE = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2667
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LDu"
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
		end)
		exec["@time"]({
			1300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
					0,
					500,
					1000
				}, global.SplitValue(_env, damage, {
					0.25,
					0.33,
					0.42
				}))
			end
		end)
		exec["@time"]({
			2667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LDu_Unique_1_4_AOE_NewBee = {
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

		this.MasterDamageFactor = externs.MasterDamageFactor

		assert(this.MasterDamageFactor ~= nil, "External variable `MasterDamageFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2667
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LDu"
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

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.PETS)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end

			global.RetainObject(_env, global.EnemyMaster(_env))
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
			1300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
					0,
					500,
					1000
				}, global.SplitValue(_env, damage, {
					0.25,
					0.33,
					0.42
				}))
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, global.EnemyMaster(_env))
			global.ApplyRPEffect(_env, _env.ACTOR, global.EnemyMaster(_env))

			local Hp = global.UnitPropGetter(_env, "hp")(_env, global.EnemyMaster(_env))
			local damage = Hp * this.MasterDamageFactor
			damage = {
				val = damage
			}

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, global.EnemyMaster(_env), {
				0,
				500,
				1000
			}, global.SplitValue(_env, damage, {
				0.25,
				0.33,
				0.42
			}))
		end)
		exec["@time"]({
			2667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LDu_Passive_Bubble_1_4 = {
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
			1200
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:DYING"
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

			global.Speak(_env, _env.ACTOR, {
				{
					"Bubble1_4_1",
					4000
				}
			}, "", 0)

			local buffeft1 = global.ImmuneBuff(_env, global.BUFF_MARKED_ALL(_env, "DEBUFF", "DISPELLABLE"))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"DEBUFF",
					"IMMUNEBUFF",
					"UNDISPELLABLE"
				}
			}, {
				buffeft1
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

			global.Speak(_env, _env.ACTOR, {
				{
					"Bubble3_2_1",
					4000
				}
			}, "", 0)
		end)

		return _env
	end
}
all.Skill_LDu_Passive_DieFlee_1_4 = {
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
			1200
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

			global.Speak(_env, _env.ACTOR, {
				{
					"Bubble1_4_3",
					4000
				}
			}, "", 0)
		end)

		return _env
	end
}
all.Skill_Enemy_DieFlee2_1_1 = {
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
		main = global["[duration]"](this, {
			1200
		}, main)
		this.main = global["[trigger_by]"](this, {
			"SELF:DYING"
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

			global.WontDie(_env)
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ForceFlee(_env, 4000)
			global.Speak(_env, _env.ACTOR, {
				{
					"Bubble3_2_1",
					4000
				}
			}, "", 0)
		end)

		return _env
	end
}
all.Skill_ALPo_Unique_Special = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3400
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_ALPo"
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
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end

			global.HarmTargetView(_env, _env.units)
		end)
		exec["@time"]({
			1400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local buffeft1 = global.Mute(_env)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 1,
					display = "Mute",
					tags = {
						"STATUS",
						"DEBUFF",
						"MUTE",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
					0,
					200,
					400,
					600,
					1100
				}, global.SplitValue(_env, damage, {
					0.15,
					0.15,
					0.15,
					0.15,
					0.4
				}))
			end
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.SpawnAssist(_env, "M02S03Assist", global.GetOwner(_env, global.EnemyMaster(_env)), 9)
		end)
		exec["@time"]({
			3400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_MLYTLSha_Unique_Special = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3170
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_MLYTLSha"
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

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Speak(_env, _env.ACTOR, {
				{
					"Bubble2_3_Assist",
					4000
				}
			}, "", 0)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local healer = global.LoadUnit(_env, _env.ACTOR, "ALL")

			for _, friendunit in global.__iter__(global.FriendUnits(_env)) do
				local healee = global.LoadUnit(_env, friendunit, "ALL")
				local buffeft1 = global.HPLink(_env)

				global.ApplyBuff(_env, friendunit, {
					timing = 2,
					duration = 2,
					display = "HPLink",
					tags = {
						"NUMERIC",
						"BUFF",
						"HPLINK",
						"DISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})

				local heal = global.EvalRecovery(_env, healer, healee, {
					this.HealRateFactor,
					0
				})

				global.ApplyHPRecovery(_env, friendunit, heal)
			end
		end)
		exec["@time"]({
			3170
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_JDCZhang_Unique_Special = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2500
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_JDCZhang"
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

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.3,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			1700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.Daze(_env)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 1,
				duration = 2,
				display = "Daze",
				tags = {
					"STATUS",
					"DEBUFF",
					"DAZE",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XLai_Unique_Special = {
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

		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2850
		}, main)
		main = global["[cut_in]"](this, {
			"1#Hero_Unique_XLai"
		}, main)
		this.main = global["[load]"](this, {
			"Movie_XLai_Skill3"
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

		_env.Funits = nil
		_env.Eunits = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)

			local buffeft4 = global.RageGainEffect(_env, "-", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"DEBUFF",
					"ANGERRATEDOWN",
					"UNDISPELLABLE"
				}
			}, {
				buffeft4
			})
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			_env.Funits = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)
			_env.Eunits = global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

			global.HealTargetView(_env, _env.Funits)

			for _, unit in global.__iter__(_env.Eunits) do
				global.HarmTargetView(_env, {
					unit
				})
			end
		end)
		exec["@time"]({
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, Funit in global.__iter__(_env.Funits) do
				local heal1 = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, Funit, this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, Funit, heal1)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, Funit, {
					timing = 2,
					duration = 1,
					display = "Heal",
					tags = {
						"HEAL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2
				})
			end

			for _, Eunit in global.__iter__(_env.Eunits) do
				global.ApplyStatusEffect(_env, _env.ACTOR, Eunit)
				global.ApplyRPEffect(_env, _env.ACTOR, Eunit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, Eunit, this.dmgFactor)

				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, Eunit)
				})
				global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, Eunit, damage)
			end
		end)
		exec["@time"]({
			2850
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_ALSi_Unique_Special = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2870
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_ALSi"
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

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.2,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.Mute(_env)

			global.ApplyBuff(_env, _env.TARGET, {
				timing = 2,
				duration = 2,
				display = "Mute",
				tags = {
					"STATUS",
					"DEBUFF",
					"MUTE",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)
		exec["@time"]({
			2870
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_ALSi_Transform = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			2500
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

			global.Perform(_env, _env.ACTOR, global.Animation(_env, "fakedie", nil, , 1))
			global.AddAnim(_env, {
				loop = 2,
				anim = "bianshen2_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Sound(_env, "Se_Skill_Change_1", 1)
			global.BossComing(_env)
		end)
		exec["@time"]({
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.AddAnim(_env, {
				loop = 1,
				anim = "bianshen_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Transform(_env, _env.ACTOR, 1)
			global.Sound(_env, "Se_Skill_Change_2", 1)
		end)

		return _env
	end
}
all.Skill_MainStage_EnterAssist_Passive_2_6 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DelayFactor = externs.DelayFactor

		assert(this.DelayFactor ~= nil, "External variable `DelayFactor` is not provided.")

		this.AssistFactor = externs.AssistFactor

		assert(this.AssistFactor ~= nil, "External variable `AssistFactor` is not provided.")

		this.PositionFactor = externs.PositionFactor

		assert(this.PositionFactor ~= nil, "External variable `PositionFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[schedule_at_moments]"](this, {
			{
				this.DelayFactor
			}
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

			global.SpawnAssist(_env, this.AssistFactor, global.GetOwner(_env, global.EnemyMaster(_env)), this.PositionFactor)
		end)

		return _env
	end
}
all.Skill_MainStage_EnergyEffectUp_Passive_2_6 = {
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.EnergyEffect(_env, 1.25)

			global.ApplyBuff(_env, global.EnemyMaster(_env), {
				timing = 4,
				duration = 180000,
				tags = {
					"STATUS",
					"ENERGYEFFECTUP",
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
all.Skill_Frozen = {
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.Daze(_env)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "Freeze",
				tags = {
					"STATUS",
					"DEBUFF",
					"DAZE",
					"DISPELLABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.Skill_NFDDi_Unique_Special = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2900
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_NFDDi"
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

		_env.enemyunits = nil
		_env.count = 0

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

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.13, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			_env.enemyunits = global.EnemyUnits(_env)

			global.HarmTargetView(_env, _env.enemyunits)

			for _, enemyunit in global.__iter__(_env.enemyunits) do
				global.AssignRoles(_env, enemyunit, "target")
			end
		end)
		exec["@time"]({
			1300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ChangeBG(_env, "Battle_Scene_15")
		end)
		exec["@time"]({
			1600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, enemyunit in global.__iter__(_env.enemyunits) do
				local count = #global.FriendUnits(_env, global.PETS)

				global.ApplyStatusEffect(_env, _env.ACTOR, enemyunit)
				global.ApplyRPEffect(_env, _env.ACTOR, enemyunit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, enemyunit, this.dmgFactor)
				damage.val = damage.val * (1.1 - 0.1 * count)

				global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, enemyunit, {
					0,
					300,
					500
				}, global.SplitValue(_env, damage, {
					0.2,
					0.3,
					0.5
				}))
			end
		end)
		exec["@time"]({
			2900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_MainStage_MasterLowHpRecruit_Passive_3_2 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpRateFactor = externs.HpRateFactor

		assert(this.HpRateFactor ~= nil, "External variable `HpRateFactor` is not provided.")

		this.PositionFactor1 = externs.PositionFactor1

		assert(this.PositionFactor1 ~= nil, "External variable `PositionFactor1` is not provided.")

		this.PositionFactor2 = externs.PositionFactor2

		assert(this.PositionFactor2 ~= nil, "External variable `PositionFactor2` is not provided.")

		this.RecruitFactor1 = externs.RecruitFactor1

		assert(this.RecruitFactor1 ~= nil, "External variable `RecruitFactor1` is not provided.")

		this.RecruitFactor2 = externs.RecruitFactor2

		assert(this.RecruitFactor2 ~= nil, "External variable `RecruitFactor2` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR and _env.prevHpPercent >= this.HpRateFactor * 100 and _env.curHpPercent < this.HpRateFactor * 100 then
				if global.INSTATUS(_env, "Skill_MainStage_MasterLowHpRecruit_Passive_3_2b")(_env, _env.ACTOR) then
					-- Nothing
				elseif global.INSTATUS(_env, "Skill_MainStage_MasterLowHpRecruit_Passive_3_2a")(_env, _env.ACTOR) then
					for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, this.RecruitFactor2))) do
						global.RecruitCard(_env, card, this.PositionFactor2)
						global.AddStatus(_env, _env.ACTOR, "Skill_MainStage_MasterLowHpRecruit_Passive_3_2b")
					end
				else
					for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, this.RecruitFactor1))) do
						global.RecruitCard(_env, card, this.PositionFactor1)
						global.AddStatus(_env, _env.ACTOR, "Skill_MainStage_MasterLowHpRecruit_Passive_3_2a")
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_SSQXin_Unique_Special = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3300
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SSQXin"
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

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.13, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3_3"))

			_env.units = global.RandomN(_env, 3, global.EnemyUnits(_env))

			global.HarmTargetView(_env, _env.units)
			global.Speak(_env, _env.ACTOR, {
				{
					"Bubble3_5_4",
					2000
				}
			}, "", 0)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local buffeft1 = global.Daze(_env)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 2,
					display = "Daze",
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				})
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)
				damage.val = damage.val * 2.5

				global.ApplyHPDamage(_env, unit, damage)
			end
		end)
		exec["@time"]({
			2734
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.WontDie(_env)
			global.ForceFlee(_env, 4000)
			global.Speak(_env, _env.ACTOR, {
				{
					"Bubble3_5_6",
					4000
				}
			}, "", 0)
		end)
		exec["@time"]({
			3300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_Enemy_DieFlee3_5_1 = {
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
			1200
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:DYING"
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

			global.WontDie(_env)
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ForceFlee(_env, 4000)
			global.Speak(_env, _env.ACTOR, {
				{
					"Bubble3_5_5",
					4000
				}
			}, "", 0)
		end)

		return _env
	end
}
all.Skill_Enemy_MOGJiang_Skill_Special = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1500
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
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.5,
				0
			}, 100, "skill3"))
		end)
		exec["@time"]({
			800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				400
			}, global.SplitValue(_env, damage, {
				0.49,
				0.51
			}))
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.SpawnAssist(_env, "M04S06Assist", global.GetOwner(_env, global.EnemyMaster(_env)), 7)
		end)
		exec["@time"]({
			1500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LDu_Unique_5_2_Practice = {
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

		this.summonFactorHp = externs.summonFactorHp

		assert(this.summonFactorHp ~= nil, "External variable `summonFactorHp` is not provided.")

		this.summonFactorAtk = externs.summonFactorAtk

		assert(this.summonFactorAtk ~= nil, "External variable `summonFactorAtk` is not provided.")

		this.summonFactorDef = externs.summonFactorDef

		assert(this.summonFactorDef ~= nil, "External variable `summonFactorDef` is not provided.")

		this.summonFactorHpEx = externs.summonFactorHpEx

		assert(this.summonFactorHpEx ~= nil, "External variable `summonFactorHpEx` is not provided.")

		this.summonFactorAtkEx = externs.summonFactorAtkEx

		assert(this.summonFactorAtkEx ~= nil, "External variable `summonFactorAtkEx` is not provided.")

		this.summonFactorDefEx = externs.summonFactorDefEx

		assert(this.summonFactorDefEx ~= nil, "External variable `summonFactorDefEx` is not provided.")

		this.summonFactor = {
			this.summonFactorHp,
			this.summonFactorAtk,
			this.summonFactorDef
		}
		this.summonExtra = {
			this.summonFactorHpEx,
			this.summonFactorAtkEx,
			this.summonFactorDefEx
		}
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2900
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_LDu"
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

			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
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
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Summon(_env, _env.ACTOR, "SummonedLDu_1_4", this.summonFactor, this.summonExtra, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			})
			global.Summon(_env, _env.ACTOR, "SummonedLDu_1_4", this.summonFactor, this.summonExtra, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			})
			global.Summon(_env, _env.ACTOR, "SummonedLDu_1_4", this.summonFactor, this.summonExtra, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			})
			global.Summon(_env, _env.ACTOR, "SummonedLDu_1_4", this.summonFactor, this.summonExtra, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			})
			global.Summon(_env, _env.ACTOR, "SummonedLDu_1_4", this.summonFactor, this.summonExtra, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			})
			global.Summon(_env, _env.ACTOR, "SummonedLDu_1_4", this.summonFactor, this.summonExtra, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			})
			global.Summon(_env, _env.ACTOR, "SummonedLDu_1_4", this.summonFactor, this.summonExtra, {
				1,
				2,
				3,
				4,
				5,
				6,
				7,
				8
			})
		end)
		exec["@time"]({
			2900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_JSTDing_Unique_7_8 = {
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

		this.ShieldRateFactor = externs.ShieldRateFactor

		assert(this.ShieldRateFactor ~= nil, "External variable `ShieldRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_JSTDing"
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

			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, maxHp * this.ShieldRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 3,
				display = "Shield",
				tags = {
					"NUMERIC",
					"BUFF",
					"SHIELD",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1, 0)
			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			3167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_Transform_11_6_Death = {
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
			670
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

			global.Perform(_env, _env.ACTOR, global.Animation(_env, "die"))
		end)
		exec["@time"]({
			667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Transform(_env, _env.ACTOR, 1)
		end)

		return _env
	end
}
all.Skill_SGHQShou_Unique_MasterPos_11_11 = {
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

		this.summonFactorHpA = externs.summonFactorHpA

		assert(this.summonFactorHpA ~= nil, "External variable `summonFactorHpA` is not provided.")

		this.summonFactorAtkA = externs.summonFactorAtkA

		assert(this.summonFactorAtkA ~= nil, "External variable `summonFactorAtkA` is not provided.")

		this.summonFactorDefA = externs.summonFactorDefA

		assert(this.summonFactorDefA ~= nil, "External variable `summonFactorDefA` is not provided.")

		this.summonFactorHpB = externs.summonFactorHpB

		assert(this.summonFactorHpB ~= nil, "External variable `summonFactorHpB` is not provided.")

		this.summonFactorAtkB = externs.summonFactorAtkB

		assert(this.summonFactorAtkB ~= nil, "External variable `summonFactorAtkB` is not provided.")

		this.summonFactorDefB = externs.summonFactorDefB

		assert(this.summonFactorDefB ~= nil, "External variable `summonFactorDefB` is not provided.")

		this.summonFactorA = {
			this.summonFactorHpA,
			this.summonFactorAtkA,
			this.summonFactorDefA
		}
		this.summonFactorB = {
			this.summonFactorHpB,
			this.summonFactorAtkB,
			this.summonFactorDefB
		}
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3067
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_SGHQShou"
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
				-1.7,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPMultiDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, {
				0,
				500,
				700
			}, global.SplitValue(_env, damage, {
				0.3,
				0.3,
				0.4
			}))
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "Skill_SGHQShou_Unique_MasterPos_11_11")(_env, _env.ACTOR) then
				for _, summonunit in global.__iter__(global.FriendUnits(_env, global.INSTATUS(_env, "SummonedSGHQShou"))) do
					global.Kick(_env, summonunit)
				end

				local buffeft5 = global.HPLink(_env)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					display = "HPLink",
					group = "Skill_SGHQShou_Unique",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"HPLINK",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft5
				}, 1)

				local SummonedSGHQShouA = global.Summon(_env, _env.ACTOR, "SummonedSGHQShou_Vanessa", this.summonFactorA, nil, {
					2
				})

				if SummonedSGHQShouA then
					global.AddStatus(_env, SummonedSGHQShouA, "SummonedSGHQShou")
					global.ApplyBuff_Buff(_env, _env.ACTOR, SummonedSGHQShouA, {
						timing = 0,
						display = "HPLink",
						group = "Skill_SGHQShou_Unique",
						duration = 99,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"HPLINK",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft5
					}, 1)
				end

				local SummonedSGHQShouB = global.Summon(_env, _env.ACTOR, "SummonedSGHQShou_Lucy", this.summonFactorB, nil, {
					9
				})

				if SummonedSGHQShouB then
					global.AddStatus(_env, SummonedSGHQShouB, "SummonedSGHQShou")
					global.ApplyBuff_Buff(_env, _env.ACTOR, SummonedSGHQShouB, {
						timing = 0,
						display = "HPLink",
						group = "Skill_SGHQShou_Unique",
						duration = 99,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"HPLINK",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft5
					}, 1)
				end
			else
				for _, summonunit in global.__iter__(global.FriendUnits(_env, global.INSTATUS(_env, "SummonedSGHQShou"))) do
					global.Kick(_env, summonunit)
				end

				local buffeft5 = global.HPLink(_env)

				global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
					timing = 0,
					display = "HPLink",
					group = "Skill_SGHQShou_Unique",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"HPLINK",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft5
				}, 1)

				local SummonedSGHQShouA = global.Summon(_env, _env.ACTOR, "SummonedSGHQShou_Vanessa", this.summonFactorA, nil, {
					2
				})

				if SummonedSGHQShouA then
					global.AddStatus(_env, SummonedSGHQShouA, "SummonedSGHQShou")
					global.ApplyBuff_Buff(_env, _env.ACTOR, SummonedSGHQShouA, {
						timing = 0,
						display = "HPLink",
						group = "Skill_SGHQShou_Unique",
						duration = 99,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"HPLINK",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft5
					}, 1)
				end

				local SummonedSGHQShouB = global.Summon(_env, _env.ACTOR, "SummonedSGHQShou_Lucy", this.summonFactorB, nil, {
					9
				})

				if SummonedSGHQShouB then
					global.AddStatus(_env, SummonedSGHQShouB, "SummonedSGHQShou")
					global.ApplyBuff_Buff(_env, _env.ACTOR, SummonedSGHQShouB, {
						timing = 0,
						display = "HPLink",
						group = "Skill_SGHQShou_Unique",
						duration = 99,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"HPLINK",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft5
					}, 1)
				end

				global.AddStatus(_env, _env.ACTOR, "Skill_SGHQShou_Unique_MasterPos_11_11")
			end
		end)
		exec["@time"]({
			3067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_MainStage_AOEDeRate_Halo_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEDeRateFactor = externs.AOEDeRateFactor

		assert(this.AOEDeRateFactor ~= nil, "External variable `AOEDeRateFactor` is not provided.")

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
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:DIE"
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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				local buffeft1 = global.NumericEffect(_env, "+aoederate", {
					"+Normal",
					"+Normal"
				}, this.AOEDeRateFactor)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "Skill_MainStage_AOEDeRate_Halo_Passive",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_MainStage_AOEDeRate_Halo_Passive"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+aoederate", {
					"+Normal",
					"+Normal"
				}, this.AOEDeRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "Skill_MainStage_AOEDeRate_Halo_Passive",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_MainStage_AOEDeRate_Halo_Passive"
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "Skill_MainStage_AOEDeRate_Halo_Passive", "UNDISPELLABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_MainStage_KillRageGain_Halo_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageGainFactor = externs.RageGainFactor

		assert(this.RageGainFactor ~= nil, "External variable `RageGainFactor` is not provided.")

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
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:DIE"
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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				local buffeft1 = global.SpecialNumericEffect(_env, "+singlekillragegainfactor", {
					"+Normal",
					"+Normal"
				}, this.RageGainFactor)
				local buffeft2 = global.SpecialNumericEffect(_env, "+aoekillragegainfactor", {
					"+Normal",
					"+Normal"
				}, this.RageGainFactor)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "Skill_MainStage_KillRageGain_Halo_Passive",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_MainStage_KillRageGain_Halo_Passive"
					}
				}, {
					buffeft1,
					buffeft2
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+singlekillragegainfactor", {
					"+Normal",
					"+Normal"
				}, this.RageGainFactor)
				local buffeft2 = global.SpecialNumericEffect(_env, "+aoekillragegainfactor", {
					"+Normal",
					"+Normal"
				}, this.RageGainFactor)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "Skill_MainStage_KillRageGain_Halo_Passive",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_MainStage_KillRageGain_Halo_Passive"
					}
				}, {
					buffeft1,
					buffeft2
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "Skill_MainStage_KillRageGain_Halo_Passive", "UNDISPELLABLE"), 99)
			end
		end)

		return _env
	end
}
all.Skill_MainStage_Immune_Halo_Passive = {
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
			"UNIT_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:DIE"
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

			for _, unit in global.__iter__(global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "DEBUFF", "DISPELLABLE"))

				local buffeft1 = global.Immune(_env)
				local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DEBUFF"))

				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					display = "Immune",
					tags = {
						"NUMERIC",
						"BUFF",
						"IMMUNE",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_MainStage_ImmuneHalo_Passive"
					}
				}, {
					buffeft1,
					buffeft2
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and _env.unit ~= _env.ACTOR then
				local buffeft1 = global.Immune(_env)
				local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DEBUFF"))

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "Immune",
					tags = {
						"NUMERIC",
						"BUFF",
						"IMMUNE",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_MainStage_ImmuneHalo_Passive"
					}
				}, {
					buffeft1,
					buffeft2
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED_ALL(_env, "Skill_MainStage_ImmuneHalo_Passive"), 99)
			end
		end)

		return _env
	end
}
all.Skill_MainStage_PreEnter_Freeze = {
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.Daze(_env)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Freeze",
				tags = {
					"STATUS",
					"DEBUFF",
					"FREEZE",
					"UNDISPELLABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.Skill_MainStage_PreEnter_Daze = {
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.Daze(_env)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Daze",
				tags = {
					"STATUS",
					"DEBUFF",
					"DAZE",
					"UNDISPELLABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.Skill_MainStage_PreEnter_Immune = {
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.Immune(_env)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DEBUFF"))

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Immune",
				tags = {
					"STATUS",
					"BUFF",
					"IMMUNE",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"Skill_MainStage_ImmuneHalo_Passive"
				}
			}, {
				buffeft1,
				buffeft2
			})
		end)

		return _env
	end
}
all.Skill_MainStage_Boom = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1934
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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Prepare",
				tags = {
					"PREPARE"
				}
			}, {
				buffeft1
			})
		end)
		exec["@time"]({
			1000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1,
				0
			}, 200, "dieskill"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			1500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)
		exec["@time"]({
			1930
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Kick(_env, _env.ACTOR)
		end)

		return _env
	end
}
all.Skill_MainStage_BoomBoomBoom = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1734
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
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 1,
				display = "Prepare",
				tags = {
					"PREPARE"
				}
			}, {
				buffeft1
			})
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "dieskill"))

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1300
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local defender = global.LoadUnit(_env, unit, "DEFENDER")
				local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

				global.ApplyHPDamage(_env, unit, damage)
			end
		end)
		exec["@time"]({
			1730
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Kick(_env, _env.ACTOR)
		end)

		return _env
	end
}
all.Skill_MainStage_Mad_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DelayFactor = externs.DelayFactor

		assert(this.DelayFactor ~= nil, "External variable `DelayFactor` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.RageGainRateFactor = externs.RageGainRateFactor

		assert(this.RageGainRateFactor ~= nil, "External variable `RageGainRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[schedule_at_moments]"](this, {
			{
				this.DelayFactor
			}
		}, passive)

		return this
	end,
	passive = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.unit = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "+atkrate", {
				"+Normal",
				"+Normal"
			}, this.AtkRateFactor)
			local buffeft2 = global.NumericEffect(_env, "+Defrate", {
				"+Normal",
				"+Normal"
			}, this.DefRateFactor)
			local buffeft3 = global.RageGainEffect(_env, "+", {
				"+Normal",
				"+Normal"
			}, this.RageGainRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 4,
				display = "Mad",
				duration = global.DurationFactor,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2,
				buffeft3
			})
		end)

		return _env
	end
}
all.Skill_MainStage_MasterLowHpRecruit_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpRateFactor = externs.HpRateFactor

		assert(this.HpRateFactor ~= nil, "External variable `HpRateFactor` is not provided.")

		this.PositionFactor = externs.PositionFactor

		assert(this.PositionFactor ~= nil, "External variable `PositionFactor` is not provided.")

		this.RecruitFactor = externs.RecruitFactor

		assert(this.RecruitFactor ~= nil, "External variable `RecruitFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR and _env.prevHpPercent >= this.HpRateFactor * 100 and _env.curHpPercent < this.HpRateFactor * 100 then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, this.RecruitFactor))) do
					global.RecruitCard(_env, card, this.PositionFactor)
				end
			end
		end)

		return _env
	end
}
all.Skill_MainStage_HeroDieRecruit_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.PositionFactor = externs.PositionFactor

		assert(this.PositionFactor ~= nil, "External variable `PositionFactor` is not provided.")

		this.RecruitFactor = externs.RecruitFactor

		assert(this.RecruitFactor ~= nil, "External variable `RecruitFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:DIE"
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

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, this.RecruitFactor))) do
				global.RecruitCard(_env, card, this.PositionFactor)
			end
		end)

		return _env
	end
}
all.Skill_MainStage_PeriodicCardBuff_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.PeriodFactor = externs.PeriodFactor

		assert(this.PeriodFactor ~= nil, "External variable `PeriodFactor` is not provided.")

		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

		this.time = 0
		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[schedule_in_cycles]"](this, {
			this.PeriodFactor
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

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))) do
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
					timing = 2,
					display = "AtkUp",
					group = "Skill_MainStage_PeriodicCardBuff_Passive",
					duration = 3,
					limit = 10,
					tags = {
						"CARDBUFF",
						"ATKUP",
						"DEFUP",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_SingleDeRate_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SingleDeRateFactor = externs.SingleDeRateFactor

		assert(this.SingleDeRateFactor ~= nil, "External variable `SingleDeRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+singlederate", {
				"+Normal",
				"+Normal"
			}, this.SingleDeRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
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
all.Skill_MainStage_WarriorDeHurtRate_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.WarriorDeHurtRateFactor = externs.WarriorDeHurtRateFactor

		assert(this.WarriorDeHurtRateFactor ~= nil, "External variable `WarriorDeHurtRateFactor` is not provided.")

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+Warrior_DmgExtra_hurtrate", {
				"+Normal",
				"+Normal"
			}, this.WarriorDeHurtRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
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
all.Skill_MainStage_EnemyMasterCure_Die_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:DIE"
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
			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, global.EnemyMaster(_env))
			local heal = maxHp * this.HealRateFactor

			global.ApplyHPRecovery(_env, global.EnemyMaster(_env), heal)

			local buffeft2 = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, global.EnemyMaster(_env), {
				timing = 2,
				duration = 1,
				display = "Heal",
				tags = {
					"HEAL",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2
			})
		end)

		return _env
	end
}
all.Skill_MainStage_EnemyMasterHpLock_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpLockRateFactor = externs.HpLockRateFactor

		assert(this.HpLockRateFactor ~= nil, "External variable `HpLockRateFactor` is not provided.")

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
			"UNIT_ENTER"
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

			if global.EnemyMaster(_env) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, global.EnemyMaster(_env))

				global.ApplyHPReduce(_env, global.EnemyMaster(_env), maxHp * (1 - this.HpLockRateFactor))

				local buffeft1 = global.LimitHpEffect(_env, maxHp * this.HpLockRateFactor)

				global.ApplyBuff(_env, global.EnemyMaster(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.unit) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)

				global.ApplyHPReduce(_env, global.EnemyMaster(_env), maxHp * (1 - this.HpLockRateFactor))

				local buffeft1 = global.LimitHpEffect(_env, maxHp * this.HpLockRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_EnemyMasterBurning_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BurningRateFactor = externs.BurningRateFactor

		assert(this.BurningRateFactor ~= nil, "External variable `BurningRateFactor` is not provided.")

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
			"UNIT_ENTER"
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

			if global.EnemyMaster(_env) then
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local buffeft1 = global.HPPeriodDamage(_env, "Burning", attacker.atk * this.BurningRateFactor)

				global.ApplyBuff(_env, global.EnemyMaster(_env), {
					timing = 2,
					display = "Burning",
					group = "Burning",
					duration = 99,
					limit = 99,
					tags = {
						"STATUS",
						"DEBUFF",
						"BURNING",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.unit) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local buffeft1 = global.HPPeriodDamage(_env, "Burning", attacker.atk * this.BurningRateFactor)

				global.ApplyBuff(_env, global.EnemyMaster(_env), {
					timing = 2,
					display = "Burning",
					group = "Burning",
					duration = 99,
					limit = 99,
					tags = {
						"STATUS",
						"DEBUFF",
						"BURNING",
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
all.Skill_MainStage_EnemyMasterTaunt_Passive = {
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
			"UNIT_ENTER"
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

			if global.EnemyMaster(_env) then
				local buffeft1 = global.Taunt(_env)

				global.ApplyBuff(_env, global.EnemyMaster(_env), {
					timing = 2,
					duration = 99,
					tags = {
						"STATUS",
						"DEBUFF",
						"TAUNT",
						"UNDISPELLABLE"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.unit) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.Taunt(_env)

				global.ApplyBuff(_env, _env.unit, {
					timing = 2,
					duration = 99,
					tags = {
						"STATUS",
						"DEBUFF",
						"TAUNT",
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
all.Skill_MainStage_SummonBuff_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DefRateFactor = externs.DefRateFactor

		assert(this.DefRateFactor ~= nil, "External variable `DefRateFactor` is not provided.")

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

			if global.Summon(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)
				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, this.DefRateFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "AtkUp",
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_CardLock_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HeadCountFactor = externs.HeadCountFactor

		assert(this.HeadCountFactor ~= nil, "External variable `HeadCountFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		passive1 = global["[trigger_by]"](this, {
			"UNIT_REVIVE"
		}, passive1)
		passive1 = global["[trigger_by]"](this, {
			"UNIT_REBORN"
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		passive2 = global["[trigger_by]"](this, {
			"UNIT_KICK"
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_DIE"
		}, passive2)

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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.PETS(_env, _env.unit) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local count1 = #global.EnemyUnits(_env, global.PETS)

				if this.HeadCountFactor <= count1 and global.EnemyMaster(_env) then
					global.LockHeroCards(_env, global.GetOwner(_env, global.EnemyMaster(_env)))
				end
			end

			if global.PETS(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local count2 = #global.FriendUnits(_env, global.PETS)

				if this.HeadCountFactor <= count2 then
					global.LockHeroCards(_env, global.GetOwner(_env, _env.ACTOR))
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

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.PETS(_env, _env.unit) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local count1 = #global.EnemyUnits(_env, global.PETS)

				if count1 < this.HeadCountFactor and global.EnemyMaster(_env) then
					global.UnlockHeroCards(_env, global.GetOwner(_env, global.EnemyMaster(_env)))
				end
			end

			if global.PETS(_env, _env.unit) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local count2 = #global.FriendUnits(_env, global.PETS)

				if count2 < this.HeadCountFactor then
					global.UnlockHeroCards(_env, global.GetOwner(_env, _env.ACTOR))
				end
			end
		end)

		return _env
	end
}
all.Skill_MainStage_DieEnemyATK_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		assert(this.AtkRateFactor ~= nil, "External variable `AtkRateFactor` is not provided.")

		this.DurationFactor = externs.DurationFactor

		assert(this.DurationFactor ~= nil, "External variable `DurationFactor` is not provided.")

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

		return this
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

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.PETS)) do
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.AtkRateFactor)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					display = "AtkUp",
					duration = this.DurationFactor,
					tags = {
						"NUMERIC",
						"BUFF",
						"ATKRATEUP",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_DieMasterCure_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		this.passive = global["[trigger_by]"](this, {
			"SELF:DIE"
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

			if global.FriendMaster(_env) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, global.FriendMaster(_env))

				global.ApplyHPRecovery(_env, global.FriendMaster(_env), maxHp * this.HealRateFactor)

				local buffeft1 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, global.FriendMaster(_env), {
					timing = 2,
					duration = 1,
					display = "Heal",
					tags = {
						"HEAL",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_EnterAssist_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AssistFactor = externs.AssistFactor

		assert(this.AssistFactor ~= nil, "External variable `AssistFactor` is not provided.")

		this.PositionFactor = externs.PositionFactor

		assert(this.PositionFactor ~= nil, "External variable `PositionFactor` is not provided.")

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

			global.SpawnAssist(_env, this.AssistFactor, global.GetOwner(_env, global.EnemyMaster(_env)), this.PositionFactor)
		end)

		return _env
	end
}
all.Skill_MainStage_EnemyHeroHpReduce_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpRateFactor = externs.HpRateFactor

		assert(this.HpRateFactor ~= nil, "External variable `HpRateFactor` is not provided.")

		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)

		return this
	end,
	passive2 = function (_env, externs)
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

			if global.PETS(_env, _env.unit) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)

				global.ApplyHPReduce(_env, _env.unit, maxHp * (1 - this.HpRateFactor))
			end

			if global.SUMMONS(_env, _env.unit) and global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.unit)

				global.ApplyHPReduce(_env, _env.unit, maxHp * (1 - this.HpRateFactor))
			end
		end)

		return _env
	end
}
all.Skill_MainStage_BurningExtra_Friend_Passive = {
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
			"UNIT_ENTER"
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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_BurningExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "MainStage_BurningExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_BurningExtra_Check"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_BurningExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "MainStage_BurningExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_BurningExtra_Check"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_BurningExtra_Enemy_Passive = {
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
			"UNIT_ENTER"
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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_BurningExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "MainStage_BurningExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_BurningExtra_Check"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_BurningExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "MainStage_BurningExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_BurningExtra_Check"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_PoisonExtra_Friend_Passive = {
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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)

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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_PoisonExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "MainStage_PoisonExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_PoisonExtra_Check"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_PoisonExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "MainStage_PoisonExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_PoisonExtra_Check"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_PoisonExtra_Enemy_Passive = {
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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)

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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_PoisonExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "MainStage_PoisonExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_PoisonExtra_Check"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_PoisonExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "MainStage_PoisonExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_PoisonExtra_Check"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_WeakExtra_Friend_Passive = {
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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)

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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_WeaknExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "MainStage_WeaknExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_WeaknExtra_Check"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_WeaknExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "MainStage_WeaknExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_WeaknExtra_Check"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_WeakExtra_Enemy_Passive = {
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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_ENTER"
		}, passive2)

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

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_WeaknExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					duration = 99,
					group = "MainStage_WeaknExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_WeaknExtra_Check"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) ~= global.GetSide(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+MainStage_WeaknExtra_Check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "MainStage_WeaknExtra_Check",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"MainStage_WeaknExtra_Check"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_SecondRoundTransform_Passive = {
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
			"SELF:BEFORE_ACTION"
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

			if global.INSTATUS(_env, "Skill_MainStage_SecondRoundTransform_Passive")(_env, _env.ACTOR) then
				global.AddAnim(_env, {
					loop = 1,
					anim = "bianshen_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR) + {
						0.3,
						-1.3
					}
				})
				global.Transform(_env, _env.ACTOR, 1)
			else
				global.AddStatus(_env, _env.ACTOR, "Skill_MainStage_SecondRoundTransform_Passive")
			end
		end)

		return _env
	end
}
all.Skill_MainStage_EnterDaze_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DazeRoundFactor = externs.DazeRoundFactor

		assert(this.DazeRoundFactor ~= nil, "External variable `DazeRoundFactor` is not provided.")

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
			local buffeft1 = global.Daze(_env)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				display = "Daze",
				duration = this.DazeRoundFactor,
				tags = {
					"STATUS",
					"DEBUFF",
					"DAZE",
					"UNDISPELLABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.Skill_MainStage_EnterFreeze_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.FreezeRoundFactor = externs.FreezeRoundFactor

		assert(this.FreezeRoundFactor ~= nil, "External variable `FreezeRoundFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			0
		}, main)
		this.main = global["[trigger_by]"](this, {
			"SELF:ENTER"
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
			local buffeft1 = global.Daze(_env)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				display = "Freeze",
				duration = this.FreezeRoundFactor,
				tags = {
					"STATUS",
					"DEBUFF",
					"DAZE",
					"UNDISPELLABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.Skill_MainStage_ReviveAll_Passive = {
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

			global.Revive(_env, this.HpRateFactor, this.RageFactor, {
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
			global.Revive(_env, this.HpRateFactor, this.RageFactor, {
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
			global.Revive(_env, this.HpRateFactor, this.RageFactor, {
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
			global.Revive(_env, this.HpRateFactor, this.RageFactor, {
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
			global.Revive(_env, this.HpRateFactor, this.RageFactor, {
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
			global.Revive(_env, this.HpRateFactor, this.RageFactor, {
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
			global.Revive(_env, this.HpRateFactor, this.RageFactor, {
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
			global.Revive(_env, this.HpRateFactor, this.RageFactor, {
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
all.Skill_MainStage_AOEDeRate_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEDeRateFactor = externs.AOEDeRateFactor

		assert(this.AOEDeRateFactor ~= nil, "External variable `AOEDeRateFactor` is not provided.")

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
			local buffeft1 = global.NumericEffect(_env, "+aoederate", {
				"+Normal",
				"+Normal"
			}, this.AOEDeRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "Skill_MainStage_AOEDeRate_Passive",
				timing = 0,
				limit = 1,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"Skill_MainStage_AOEDeRate_Passive"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end
}
all.Skill_MainStage_EnemyMasterAOERate_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOERateFactor = externs.AOERateFactor

		assert(this.AOERateFactor ~= nil, "External variable `AOERateFactor` is not provided.")

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
			"UNIT_ENTER"
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

			if global.EnemyMaster(_env) then
				local buffeft1 = global.NumericEffect(_env, "+aoerate", {
					"+Normal",
					"+Normal"
				}, this.AOERateFactor)

				global.ApplyBuff(_env, global.EnemyMaster(_env), {
					duration = 99,
					group = "Skill_MainStage_EnemyMasterAOERate_Passive",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_MainStage_EnemyMasterAOERate_Passive"
					}
				}, {
					buffeft1
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

		_env.unit = externs.unit

		assert(_env.unit ~= nil, "External variable `unit` is not provided.")

		_env.event = externs.event

		assert(_env.event ~= nil, "External variable `event` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == global.EnemyMaster(_env) then
				local buffeft1 = global.NumericEffect(_env, "+aoerate", {
					"+Normal",
					"+Normal"
				}, this.AOERateFactor)

				global.ApplyBuff(_env, _env.unit, {
					duration = 99,
					group = "Skill_MainStage_EnemyMasterAOERate_Passive",
					timing = 0,
					limit = 1,
					tags = {
						"STATUS",
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE",
						"Skill_MainStage_EnemyMasterAOERate_Passive"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_EnterBubble_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BubbleIDFactor = externs.BubbleIDFactor

		assert(this.BubbleIDFactor ~= nil, "External variable `BubbleIDFactor` is not provided.")

		this.DurationFactor = externs.DurationFactor

		assert(this.DurationFactor ~= nil, "External variable `DurationFactor` is not provided.")

		this.DelayFactor = externs.DelayFactor

		assert(this.DelayFactor ~= nil, "External variable `DelayFactor` is not provided.")

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

			global.Speak(_env, _env.ACTOR, {
				{
					this.BubbleIDFactor,
					this.DurationFactor
				}
			}, "", this.DelayFactor)
		end)

		return _env
	end
}
all.Skill_MainStage_DieBubble_Passive_Death = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BubbleIDFactor = externs.BubbleIDFactor

		assert(this.BubbleIDFactor ~= nil, "External variable `BubbleIDFactor` is not provided.")

		this.DurationFactor = externs.DurationFactor

		assert(this.DurationFactor ~= nil, "External variable `DurationFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1200
		}, main)
		this.main = global["[trigger_by]"](this, {
			"SELF:DYING"
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

			global.WontDie(_env)
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ForceFlee(_env, 4000)
			global.Speak(_env, _env.ACTOR, {
				{
					this.BubbleIDFactor,
					this.DurationFactor
				}
			}, "", 0)
		end)

		return _env
	end
}
all.Skill_MainStage_RoundFleeBubble_Passive_Death = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.escaperound = externs.escaperound

		assert(this.escaperound ~= nil, "External variable `escaperound` is not provided.")

		this.BubbleIDFactor = externs.BubbleIDFactor

		assert(this.BubbleIDFactor ~= nil, "External variable `BubbleIDFactor` is not provided.")

		this.DurationFactor = externs.DurationFactor

		assert(this.DurationFactor ~= nil, "External variable `DurationFactor` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_ACTION"
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
			local round = global.SpecialPropGetter(_env, "escaperound")(_env, _env.ACTOR)

			if round == this.escaperound then
				global.ForceFlee(_env, 4000)
				global.Speak(_env, _env.ACTOR, {
					{
						this.BubbleIDFactor,
						this.DurationFactor
					}
				}, "", 0)
			else
				round = round + 1
				local buffeft1 = global.SpecialNumericEffect(_env, "+escaperound", {
					"+Normal",
					"+Normal"
				}, round)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "escaperound",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.Skill_MainStage_DieTransform_Hero_CommonUse = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1300
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

			global.Perform(_env, _env.ACTOR, global.Animation(_env, "fakedie"))
			global.AddAnim(_env, {
				loop = 2,
				anim = "bianshen2_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Sound(_env, "Se_Skill_Change_1", 1)
		end)
		exec["@time"]({
			650
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AddAnim(_env, {
				loop = 1,
				anim = "bianshen_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Transform(_env, _env.ACTOR, 1)
			global.Sound(_env, "Se_Skill_Change_2", 1)
		end)

		return _env
	end
}
all.Skill_MainStage_DieTransform_CommonUse = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1300
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

			global.Perform(_env, _env.ACTOR, global.Animation(_env, "fakedie"))
			global.AddAnim(_env, {
				loop = 2,
				anim = "bianshen2_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Sound(_env, "Se_Skill_Change_1", 1)
		end)
		exec["@time"]({
			650
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.AddAnim(_env, {
				loop = 1,
				anim = "bianshen_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Transform(_env, _env.ACTOR, 1)
			global.Sound(_env, "Se_Skill_Change_2", 1)
		end)

		return _env
	end
}
all.Skill_MainStage_DieTransform_BossComing = {
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

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			2500
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

			global.Perform(_env, _env.ACTOR, global.Animation(_env, "fakedie", nil, , 1))
			global.AddAnim(_env, {
				loop = 2,
				anim = "bianshen2_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Sound(_env, "Se_Skill_Change_1", 1)
			global.BossComing(_env)
		end)
		exec["@time"]({
			2000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.AddAnim(_env, {
				loop = 1,
				anim = "bianshen_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR) + {
					0.3,
					-1.3
				}
			})
			global.Transform(_env, _env.ACTOR, 1)
			global.Sound(_env, "Se_Skill_Change_2", 1)
		end)

		return _env
	end
}
all.Skill_MainStage_Start_BossComing = {
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.BossComingPause(_env)
		end)

		return _env
	end
}
all.Skill_Boss_AfterUnique_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SelfRageFactor = externs.SelfRageFactor

		if this.SelfRageFactor == nil then
			this.SelfRageFactor = 1000
		end

		this.MaxHpDamageFactor = externs.MaxHpDamageFactor

		if this.MaxHpDamageFactor == nil then
			this.MaxHpDamageFactor = 0.15
		end

		this.RageDamageFactor = externs.RageDamageFactor

		if this.RageDamageFactor == nil then
			this.RageDamageFactor = 500
		end

		this.BlockRateFactor = externs.BlockRateFactor

		if this.BlockRateFactor == nil then
			this.BlockRateFactor = 0.3
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
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
			local i = global.Random(_env, 1, 800)

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "AFTER_UNIQUE", "Skill_Boss_AfterUnique_Passive")) == 0 then
				if i <= 200 then
					global.ApplyRPRecovery(_env, _env.ACTOR, this.SelfRageFactor)
				elseif i < 401 then
					for _, unit in global.__iter__(global.EnemyUnits(_env)) do
						local MaxHp = global.UnitPropGetter(_env, "maxHp")(_env, unit)
						local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
							1,
							1,
							0
						})
						damage.val = MaxHp * this.MaxHpDamageFactor
						local buff_show = global.SpecialNumericEffect(_env, "+bossbo", {
							"+Normal",
							"+Normal"
						}, 1)

						global.ApplyBuff(_env, _env.ACTOR, {
							timing = 2,
							duration = 1,
							display = "BossAoeWave",
							tags = {}
						}, {
							buff_show
						})
						global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
					end
				elseif i < 601 then
					for _, unit in global.__iter__(global.EnemyUnits(_env)) do
						global.ApplyRPDamage(_env, unit, this.RageDamageFactor)

						local buff_show_rage = global.SpecialNumericEffect(_env, "+ragedown", {
							"+Normal",
							"+Normal"
						}, 1)

						global.ApplyBuff(_env, unit, {
							timing = 2,
							duration = 1,
							display = "RageDown",
							tags = {}
						}, {
							buff_show_rage
						})
					end
				else
					local buffeft1 = global.NumericEffect(_env, "+blockrate", {
						"+Normal",
						"+Normal"
					}, this.BlockRateFactor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
						timing = 2,
						display = "BlockRateUp",
						group = "Boss_AfterUnique_BlockRateUp",
						duration = 2,
						limit = 1,
						tags = {
							"NUMERIC",
							"BUFF",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
				end

				local buff_check = global.SpecialNumericEffect(_env, "+self_check", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 1,
					group = "Skill_Boss_AfterUnique_Passive",
					timing = 2,
					limit = 1,
					tags = {
						"AFTER_UNIQUE",
						"Skill_Boss_AfterUnique_Passive"
					}
				}, {
					buff_check
				})
			end
		end)

		return _env
	end
}
all.Skill_Detective_DieBubble_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BubbleIDFactor = externs.BubbleIDFactor

		assert(this.BubbleIDFactor ~= nil, "External variable `BubbleIDFactor` is not provided.")

		this.DurationFactor = externs.DurationFactor

		assert(this.DurationFactor ~= nil, "External variable `DurationFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1200
		}, main)
		this.main = global["[trigger_by]"](this, {
			"SELF:DYING"
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

			global.Speak(_env, _env.ACTOR, {
				{
					this.BubbleIDFactor,
					this.DurationFactor
				}
			}, "", 0)
		end)

		return _env
	end
}
all.Skill_Detective_DieBubble_Passive_HasHero = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HeroIDFactor = externs.HeroIDFactor

		assert(this.HeroIDFactor ~= nil, "External variable `HeroIDFactor` is not provided.")

		this.BubbleIDFactor = externs.BubbleIDFactor

		assert(this.BubbleIDFactor ~= nil, "External variable `BubbleIDFactor` is not provided.")

		this.DurationFactor = externs.DurationFactor

		assert(this.DurationFactor ~= nil, "External variable `DurationFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1200
		}, main)
		this.main = global["[trigger_by]"](this, {
			"SELF:DYING"
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
			local factor = 0

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				if global.MARKED(_env, "ZTXChang")(_env, unit) then
					factor = 1
				end
			end

			if factor == 1 then
				global.Speak(_env, _env.ACTOR, {
					{
						this.BubbleIDFactor,
						this.DurationFactor
					}
				}, "", 0)
			end
		end)

		return _env
	end
}

return _M
