local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.CrusadeNewBuffs_AOEBasisAttackUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AOEBasisAttUpFactor1 = externs.AOEBasisAttUpFactor1

		if this.AOEBasisAttUpFactor1 == nil then
			this.AOEBasisAttUpFactor1 = 0
		end

		this.AOEBasisAttUpFactor2 = externs.AOEBasisAttUpFactor2

		if this.AOEBasisAttUpFactor2 == nil then
			this.AOEBasisAttUpFactor2 = 0.4
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "MAGE")(_env, _env.ACTOR) then
				local buffeft2 = global.NumericEffect(_env, "+critrate", {
					"+Normal",
					"+Normal"
				}, this.AOEBasisAttUpFactor2)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeNewBuffs_AOEBasisAttackUp",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"AOE",
						"ATKRATE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_ATTBasisAttackUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ATTBasisAttUpFactor1 = externs.ATTBasisAttUpFactor1

		if this.ATTBasisAttUpFactor1 == nil then
			this.ATTBasisAttUpFactor1 = 0.25
		end

		this.ATTBasisAttUpFactor2 = externs.ATTBasisAttUpFactor2

		if this.ATTBasisAttUpFactor2 == nil then
			this.ATTBasisAttUpFactor2 = 0
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "ASSASSIN")(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.ATTBasisAttUpFactor1)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeNewBuffs_ATTBasisAttackUp",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"ATKRATE",
						"ATTACK"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_DEFEnterShield = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DEFEnterShieldFactor = externs.DEFEnterShieldFactor

		if this.DEFEnterShieldFactor == nil then
			this.DEFEnterShieldFactor = 0.5
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "WARRIOR")(_env, _env.ACTOR) then
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft1 = global.ShieldEffect(_env, maxHp * this.DEFEnterShieldFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 2,
					display = "Shield",
					group = "CrusadeNewBuffs_DEFEnterShield",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SHIELD"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_DEFReboundUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DEFReboundUpFactor = externs.DEFReboundUpFactor

		if this.DEFReboundUpFactor == nil then
			this.DEFReboundUpFactor = 0.5
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "WARRIOR")(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+reflection", {
					"+Normal",
					"+Normal"
				}, this.DEFReboundUpFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "Reflect",
					group = "CrusadeNewBuffs_DEFReboundUp",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"REFLECTION",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
				global.print(_env, global.fanshang)
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_CUREEffevtimprove = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CURETreatedTriFactor = externs.CURETreatedTriFactor

		if this.CURETreatedTriFactor == nil then
			this.CURETreatedTriFactor = 0.3
		end

		this.CUREEffevtFactor = externs.CUREEffevtFactor

		if this.CUREEffevtFactor == nil then
			this.CUREEffevtFactor = 1
		end

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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+LowerHp_HealExtra_RatioCheck", {
					"+Normal",
					"+Normal"
				}, this.CURETreatedTriFactor)
				local buffeft2 = global.SpecialNumericEffect(_env, "+LowerHp_HealExtra_ExtraRate", {
					"+Normal",
					"+Normal"
				}, this.CUREEffevtFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 1,
					display = "BeCureRateUp",
					group = "CrusadeNewBuffs_CUREEffevtimprove",
					duration = 1,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"SHIELD",
						"DISPELLABLE",
						"STEALABLE"
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
all.CrusadeNewBuffs_CUREEnterSpend = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CUREEnterSpendFactor = externs.CUREEnterSpendFactor

		if this.CUREEnterSpendFactor == nil then
			this.CUREEnterSpendFactor = 3
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR))) do
					if global.MARKED(_env, "HEALER")(_env, card) then
						local cardvaluechange = global.CardCostEnchant(_env, "-", this.CUREEnterSpendFactor, 1)

						global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
							tags = {
								"CARDBUFF",
								"UNDISPELLABLE"
							}
						}, {
							cardvaluechange
						})
					end
				end
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_BasisSuppress = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.BasisSuppressFactor = externs.BasisSuppressFactor

		if this.BasisSuppressFactor == nil then
			this.BasisSuppressFactor = 0.2
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "ASSASSIN")(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Mage_DmgExtra_hurtrate", {
					"?Normal"
				}, this.BasisSuppressFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeNewBuffs_BasisSuppress",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				})
			elseif global.MARKED(_env, "MAGE")(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Warrior_DmgExtra_hurtrate", {
					"?Normal"
				}, this.BasisSuppressFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeNewBuffs_BasisSuppress",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				})
			elseif global.MARKED(_env, "WARRIOR")(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Assassin_DmgExtra_hurtrate", {
					"?Normal"
				}, this.BasisSuppressFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeNewBuffs_BasisSuppress",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
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
all.CrusadeNewBuffs_SpecialSuppress = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SpecialSuppressFactor = externs.SpecialSuppressFactor

		if this.SpecialSuppressFactor == nil then
			this.SpecialSuppressFactor = 0.2
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			0
		}, passive)
		passive = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "LIGHT")(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Assassin_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)
				local buffeft2 = global.SpecialNumericEffect(_env, "+Mage_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)
				local buffeft3 = global.SpecialNumericEffect(_env, "+Warrior_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)
				local buffeft4 = global.SpecialNumericEffect(_env, "+Summoner_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)
				local buffeft5 = global.SpecialNumericEffect(_env, "+Healer_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeNewBuffs_BasisSuppress",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3,
					buffeft4,
					buffeft5
				})
			elseif global.MARKED(_env, "DARK")(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Assassin_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)
				local buffeft2 = global.SpecialNumericEffect(_env, "+Mage_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)
				local buffeft3 = global.SpecialNumericEffect(_env, "+Warrior_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)
				local buffeft4 = global.SpecialNumericEffect(_env, "+Summoner_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)
				local buffeft5 = global.SpecialNumericEffect(_env, "+Healer_DmgExtra_hurtrate", {
					"?Normal"
				}, this.SpecialSuppressFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeNewBuffs_BasisSuppress",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3,
					buffeft4,
					buffeft5
				})
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_LowEnergyBasisUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.LowEnergyFactor = externs.LowEnergyFactor

		if this.LowEnergyFactor == nil then
			this.LowEnergyFactor = 14
		end

		this.LowEnergyAttFactor = externs.LowEnergyAttFactor

		if this.LowEnergyAttFactor == nil then
			this.LowEnergyAttFactor = 0.2
		end

		this.LowEnergyLifeFactor = externs.LowEnergyLifeFactor

		if this.LowEnergyLifeFactor == nil then
			this.LowEnergyLifeFactor = 0.2
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.GetCost(_env, _env.ACTOR) < this.LowEnergyFactor then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.LowEnergyAttFactor)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft2 = global.MaxHpEffect(_env, maxHp * this.LowEnergyLifeFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeNewBuffs_LowEnergyBasisUp",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"CrusadeNewBuffs_LowEnergyBasisUp",
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
all.CrusadeNewBuffs_HighEnergyBasisUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HighEnergyFactor = externs.HighEnergyFactor

		if this.HighEnergyFactor == nil then
			this.HighEnergyFactor = 16
		end

		this.HighEnergyAttFactor = externs.HighEnergyAttFactor

		if this.HighEnergyAttFactor == nil then
			this.HighEnergyAttFactor = 0.2
		end

		this.HighEnergyLifeFactor = externs.HighEnergyLifeFactor

		if this.HighEnergyLifeFactor == nil then
			this.HighEnergyLifeFactor = 0.2
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif this.HighEnergyFactor < global.GetCost(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+atkrate", {
					"+Normal",
					"+Normal"
				}, this.HighEnergyAttFactor)
				local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
				local buffeft2 = global.MaxHpEffect(_env, maxHp * this.HighEnergyLifeFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					duration = 99,
					group = "CrusadeNewBuffs_HighEnergyBasisUp",
					timing = 0,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"CrusadeNewBuffs_HighEnergyBasisUp",
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
all.CrusadeNewBuffs_TauntedWeaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.TauntedWeakenFactor = externs.TauntedWeakenFactor

		if this.TauntedWeakenFactor == nil then
			this.TauntedWeakenFactor = 0.5
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "-PROVOKE_DmgExtra_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.TauntedWeakenFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
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
all.CrusadeNewBuffs_DazedWeaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.DazedWeakenFactor = externs.DazedWeakenFactor

		if this.DazedWeakenFactor == nil then
			this.DazedWeakenFactor = 1
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+DAZE_DmgExtra_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.DazedWeakenFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					display = "HurtRateUp",
					tags = {
						"NUMERIC",
						"BUFF",
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
all.CrusadeNewBuffs_CritHurtrateUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.UnCritHurtrateFactor = externs.UnCritHurtrateFactor

		if this.UnCritHurtrateFactor == nil then
			this.UnCritHurtrateFactor = 0.1
		end

		this.CritHurtrateFactor = externs.CritHurtrateFactor

		if this.CritHurtrateFactor == nil then
			this.CritHurtrateFactor = 0.5
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
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_CRIT"
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "-hurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnCritHurtrateFactor)
				local buffeft2 = global.NumericEffect(_env, "+critstrg", {
					"+Normal",
					"+Normal"
				}, this.CritHurtrateFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE"
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

			global.print(_env, 2222222222222.0)

			if not global.MASTER(_env, _env.unit) then
				local buffeft3 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.UnCritHurtrateFactor)

				global.ApplyBuff(_env, _env.unit, {
					timing = 1,
					duration = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft3
				})
				global.print(_env, 1111111111111.0)
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_ProudSkillProUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ProudSkillProUpFactor = externs.ProudSkillProUpFactor

		if this.ProudSkillProUpFactor == nil then
			this.ProudSkillProUpFactor = 1
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

			if not global.MASTER(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+exskillrate", {
					"+Normal",
					"+Normal"
				}, this.ProudSkillProUpFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
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
all.CrusadeNewBuffs_CurseProudSkillProUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CurseProudSkillProUpFactor = externs.CurseProudSkillProUpFactor

		if this.CurseProudSkillProUpFactor == nil then
			this.CurseProudSkillProUpFactor = 1
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "DARK")(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+exskillrate", {
					"+Normal",
					"+Normal"
				}, this.CurseProudSkillProUpFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
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
all.CrusadeNewBuffs_SupProudSkillProUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SupProudSkillProUpFactor = externs.SupProudSkillProUpFactor

		if this.SupProudSkillProUpFactor == nil then
			this.SupProudSkillProUpFactor = 1
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "LIGHT")(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "+exskillrate", {
					"+Normal",
					"+Normal"
				}, this.SupProudSkillProUpFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"NUMERIC",
						"BUFF",
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
all.CrusadeNewBuffs_PlayerWeaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.PlayerWeakenFactor = externs.PlayerWeakenFactor

		if this.PlayerWeakenFactor == nil then
			this.PlayerWeakenFactor = 0.3
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif not global.MARKED(_env, "MAGE")(_env, _env.ACTOR) then
				local buffeft1 = global.SpecialNumericEffect(_env, "+Master_DmgExtra_hurtrate", {
					"+Normal",
					"+Normal"
				}, this.PlayerWeakenFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "",
					group = "CrusadeNewBuffs_PlayerWeaken",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"MASTER"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_CureDefWeaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CureDefWeakenFactor = externs.CureDefWeakenFactor

		if this.CureDefWeakenFactor == nil then
			this.CureDefWeakenFactor = 0.4
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "HEALER")(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "-unhurtrate", {
					"+Normal",
					"+Normal"
				}, this.CureDefWeakenFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "",
					group = "CrusadeNewBuffs_CureDefWeaken",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"UNHURTRATE"
					}
				}, {
					buffeft1
				})
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_AttLowHPAttackUp = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AttHPFactor = externs.AttHPFactor

		if this.AttHPFactor == nil then
			this.AttHPFactor = 30
		end

		this.AttLowHPAttackUpFactor = externs.AttLowHPAttackUpFactor

		if this.AttLowHPAttackUpFactor == nil then
			this.AttLowHPAttackUpFactor = 1
		end

		this.AttHPSuckUpFactor = externs.AttHPSuckUpFactor

		if this.AttHPSuckUpFactor == nil then
			this.AttHPSuckUpFactor = 0.3
		end

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

			if _env.unit == _env.ACTOR and global.MARKED(_env, "ASSASSIN")(_env, _env.ACTOR) then
				if this.AttHPFactor <= _env.prevHpPercent and _env.curHpPercent < this.AttHPFactor then
					local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
						"+Normal",
						"+Normal"
					}, this.AttLowHPAttackUpFactor)
					local buffeft2 = global.NumericEffect(_env, "+absorption", {
						"+Normal",
						"+Normal"
					}, this.AttHPSuckUpFactor)

					global.ApplyBuff(_env, _env.ACTOR, {
						duration = 99,
						group = "CrusadeNewBuffs_AttLowHPAttackUp",
						timing = 0,
						limit = 1,
						tags = {
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

				if _env.prevHpPercent < this.AttHPFactor and this.AttHPFactor <= _env.curHpPercent then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "CrusadeNewBuffs_AttLowHPAttackUp", "UNDISPELLABLE"), 99)
				end
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_LowEnergyLower = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.LowEnergyFactor = externs.LowEnergyFactor

		if this.LowEnergyFactor == nil then
			this.LowEnergyFactor = 15
		end

		this.LowEnergyLowerFactor = externs.LowEnergyLowerFactor

		if this.LowEnergyLowerFactor == nil then
			this.LowEnergyLowerFactor = 3
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_COST_LE(_env, this.LowEnergyFactor - 1))) do
					local cardvaluechange = global.CardCostEnchant(_env, "-", this.LowEnergyLowerFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"UNDISPELLABLE",
							"CrusadeBuffs_EnergyDown_HigherThanX"
						}
					}, {
						cardvaluechange
					})
				end
			end
		end)

		return _env
	end
}
all.CrusadeNewBuffs_ATTAOEAttWeaken = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ATTAOEWeakenFactor = externs.ATTAOEWeakenFactor

		if this.ATTAOEWeakenFactor == nil then
			this.ATTAOEWeakenFactor = 0.3
		end

		this.OtherUpFactor = externs.OtherUpFactor

		if this.OtherUpFactor == nil then
			this.OtherUpFactor = 0.3
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

			if global.MASTER(_env, _env.ACTOR) then
				-- Nothing
			elseif global.MARKED(_env, "ASSASSIN")(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "-hurtrate", {
					"+Normal",
					"+Normal"
				}, this.ATTAOEWeakenFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "",
					group = "CrusadeNewBuffs_ATTAOEAttWeaken",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				})
			elseif global.MARKED(_env, "MAGE")(_env, _env.ACTOR) then
				local buffeft1 = global.NumericEffect(_env, "-hurtrate", {
					"+Normal",
					"+Normal"
				}, this.ATTAOEWeakenFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "",
					group = "CrusadeNewBuffs_ATTAOEAttWeaken",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft1
				})
			else
				local buffeft2 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, this.OtherUpFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					display = "",
					group = "CrusadeNewBuffs_ATTAOEAttWeaken",
					duration = 99,
					limit = 1,
					tags = {
						"NUMERIC",
						"BUFF",
						"DISPELLABLE",
						"STEALABLE"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}

return _M
