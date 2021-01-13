local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_PGNNi_Normal = {
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
			1000
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
			567
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
all.Skill_PGNNi_Proud = {
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
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_PGNNi"
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
				-1.6,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			933
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.TARGET)), "<", global.UnitPropGetter(_env, "hp")), 1, 1)) do
				if not global.MASTER(_env, _env.TARGET) then
					global.transportExt(_env, _env.TARGET, global.IdOfCell(_env, global.GetCell(_env, unit)), 200, 1)
				end
			end
		end)

		return _env
	end
}
all.Skill_PGNNi_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateDownFactor = externs.HurtRateDownFactor

		if this.HurtRateDownFactor == nil then
			this.HurtRateDownFactor = 0.3
		end

		this.ExSkillRateFactor = externs.ExSkillRateFactor

		if this.ExSkillRateFactor == nil then
			this.ExSkillRateFactor = 1
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3067
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_PGNNi"
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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2233
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "-hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateDownFactor)

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
					timing = 2,
					duration = 2,
					display = "HurtRateDown",
					tags = {
						"STATUS",
						"DEBUFF",
						"UNHURTRATEDOWN",
						"Skill_PGNNi_Unique",
						"DISPELLALBE"
					}
				}, {
					buffeft1
				}, 1, 0)
			end

			local buffeft2 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, this.ExSkillRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 2,
				tags = {
					"NUMERIC",
					"BUFF",
					"EXSKILLRATE",
					"Skill_PGNNi_Unique",
					"UNDISPELLABLE"
				}
			}, {
				buffeft2
			})
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
all.Skill_PGNNi_Passive = {
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
			3000
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
			local runtime = 1200
			local delay = 1500

			for _, cell1 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 1))) do
				for _, cell2 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 4))) do
					for _, cell3 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 7))) do
						if global.GetCellUnit(_env, cell1) then
							if global.GetCellUnit(_env, cell2) then
								global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 4, runtime, 1)
							elseif global.GetCellUnit(_env, cell3) then
								global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 7, runtime, 1)
							end
						elseif global.GetCellUnit(_env, cell2) and global.GetCellUnit(_env, cell3) then
							global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell2), 7, runtime, 1)
						end
					end
				end
			end

			for _, cell1 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 2))) do
				for _, cell2 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 5))) do
					if global.GetCellUnit(_env, cell1) and global.GetCellUnit(_env, cell2) then
						global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 5, runtime, 1)
					end
				end
			end

			for _, cell1 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 3))) do
				for _, cell2 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 6))) do
					for _, cell3 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 9))) do
						if global.GetCellUnit(_env, cell1) then
							if global.GetCellUnit(_env, cell2) then
								global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 6, runtime, 1)
							elseif global.GetCellUnit(_env, cell3) then
								global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 9, runtime, 1)
							end
						elseif global.GetCellUnit(_env, cell2) and global.GetCellUnit(_env, cell3) then
							global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell2), 9, runtime, 1)
						end
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_PGNNi_Passive_Key = {
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
			"SELF:PRE_ENTER"
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

			if global.MASTER(_env, _env.ACTOR) then
				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "PGNNi"))) do
					local cost = global.GetCardCost(_env, card)
					local cardvaluechange = global.CardCostEnchant(_env, "-", 1, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"Skill_BLTu_PGNNi",
							"UNDISPELLABLE"
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
all.Skill_PGNNi_Proud_EX = {
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
			1167
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_PGNNi"
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
				-1.6,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			933
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.Slice(_env, global.SortBy(_env, global.EnemyUnits(_env, global.PETS - global.SUMMONS - global.ONESELF(_env, _env.TARGET)), "<", global.UnitPropGetter(_env, "hp")), 1, 1)) do
				if not global.MASTER(_env, _env.TARGET) then
					global.transportExt(_env, _env.TARGET, global.IdOfCell(_env, global.GetCell(_env, unit)), 200, 1)
				end
			end
		end)

		return _env
	end
}
all.Skill_PGNNi_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HurtRateDownFactor = externs.HurtRateDownFactor

		if this.HurtRateDownFactor == nil then
			this.HurtRateDownFactor = 0.4
		end

		this.ExSkillRateFactor = externs.ExSkillRateFactor

		if this.ExSkillRateFactor == nil then
			this.ExSkillRateFactor = 1
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3067
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_PGNNi"
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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			2233
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.NumericEffect(_env, "-hurtrate", {
				"+Normal",
				"+Normal"
			}, this.HurtRateDownFactor)

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
					timing = 2,
					duration = 2,
					display = "HurtRateDown",
					tags = {
						"STATUS",
						"DEBUFF",
						"UNHURTRATEDOWN",
						"Skill_PGNNi_Unique",
						"DISPELLALBE"
					}
				}, {
					buffeft1
				}, 1, 0)
			end

			local buffeft2 = global.NumericEffect(_env, "+exskillrate", {
				"+Normal",
				"+Normal"
			}, this.ExSkillRateFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 2,
				duration = 2,
				tags = {
					"NUMERIC",
					"BUFF",
					"EXSKILLRATE",
					"Skill_PGNNi_Unique",
					"UNDISPELLABLE"
				}
			}, {
				buffeft2
			})
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
all.Skill_PGNNi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ShieldFactor = externs.ShieldFactor

		if this.ShieldFactor == nil then
			this.ShieldFactor = 0.2
		end

		local passive = __action(this, {
			name = "passive",
			entry = prototype.passive
		})
		passive = global["[duration]"](this, {
			3000
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
			local runtime = 1200
			local delay = 1500

			for _, cell1 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 1))) do
				for _, cell2 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 4))) do
					for _, cell3 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 7))) do
						if global.GetCellUnit(_env, cell1) then
							if global.GetCellUnit(_env, cell2) then
								global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 4, runtime, 1)
							elseif global.GetCellUnit(_env, cell3) then
								global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 7, runtime, 1)
							end
						elseif global.GetCellUnit(_env, cell2) and global.GetCellUnit(_env, cell3) then
							global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell2), 7, runtime, 1)
						end
					end
				end
			end

			for _, cell1 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 2))) do
				for _, cell2 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 5))) do
					if global.GetCellUnit(_env, cell1) and global.GetCellUnit(_env, cell2) then
						global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 5, runtime, 1)
					end
				end
			end

			for _, cell1 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 3))) do
				for _, cell2 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 6))) do
					for _, cell3 in global.__iter__(global.EnemyCells(_env, global.CELL_IN_POS(_env, 9))) do
						if global.GetCellUnit(_env, cell1) then
							if global.GetCellUnit(_env, cell2) then
								global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 6, runtime, 1)
							elseif global.GetCellUnit(_env, cell3) then
								global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell1), 9, runtime, 1)
							end
						elseif global.GetCellUnit(_env, cell2) and global.GetCellUnit(_env, cell3) then
							global.DelayCall(_env, delay, global.transportExt, global.GetCellUnit(_env, cell2), 9, runtime, 1)
						end
					end
				end
			end

			local maxHp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
			local buffeft1 = global.ShieldEffect(_env, global.min(_env, maxHp * this.ShieldFactor, atk * 2))

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 99,
				display = "Shield",
				tags = {
					"NUMERIC",
					"BUFF",
					"DISPELLABLE",
					"STEALABLE",
					"SHIELD"
				}
			}, {
				buffeft1
			}, 1)
		end)

		return _env
	end
}

return _M
