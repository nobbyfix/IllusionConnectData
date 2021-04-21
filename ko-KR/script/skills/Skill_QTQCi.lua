local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_QTQCi_Normal = {
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
			734
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
				-1.9,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
			global.AnimForTrgt(_env, _env.TARGET, {
				loop = 1,
				anim = "shou1_huaqishouji",
				zOrder = "TopLayer",
				pos = {
					0.5,
					0.5
				}
			})
		end)

		return _env
	end
}
all.Skill_QTQCi_Proud = {
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
				1.2,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1434
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_QTQCi"
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

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			}, 100, "skill2"))

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				global.AnimForTrgt(_env, unit, {
					loop = 1,
					anim = "shou1_huaqishouji",
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
all.Skill_QTQCi_Unique = {
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
				2.7,
				0
			}
		end

		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.4
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2567
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_QTQCi"
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

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			}, 100, "skill3"))

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.AssignRoles(_env, unit, "target")
			end

			global.HarmTargetView(_env, _env.units)
		end)
		exec["@time"]({
			1900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if global.CellRowLocation(_env, global.GetCell(_env, unit)) == 1 then
					global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
					global.AnimForTrgt(_env, unit, {
						loop = 1,
						anim = "shou1_huaqishouji",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
					})
				elseif global.CellRowLocation(_env, global.GetCell(_env, unit)) == 2 then
					global.DelayCall(_env, 67, global.ApplyAOEHPDamage_ResultCheck, _env.ACTOR, unit, damage)
					global.DelayCall(_env, 67, global.AnimForTrgt, unit, {
						loop = 1,
						anim = "shou1_huaqishouji",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
					})
				elseif global.CellRowLocation(_env, global.GetCell(_env, unit)) == 3 then
					damage.val = damage.val * (1 + this.DamageFactor)

					global.DelayCall(_env, 134, global.ApplyAOEHPDamage_ResultCheck, _env.ACTOR, unit, damage)
					global.DelayCall(_env, 134, global.AnimForTrgt, unit, {
						loop = 1,
						anim = "shou2_huaqishouji",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
					})
				end
			end
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
all.Skill_QTQCi_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CritFactor = externs.CritFactor

		if this.CritFactor == nil then
			this.CritFactor = 0.35
		end

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 150
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
			local buff_rp = global.SpecialNumericEffect(_env, "+Skill_QTQCi_Passive_RP", {
				"+Normal",
				"+Normal"
			}, this.RpFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"Skill_QTQCi_Passive"
				}
			}, {
				buff_rp
			})

			local buff1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 2,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"CRITRATEUP"
				}
			}, {
				buff1
			}, 1, 0)
		end)

		return _env
	end
}
all.Skill_QTQCi_Passive_Key = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HpFactor = externs.HpFactor

		if this.HpFactor == nil then
			this.HpFactor = 1
		end

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 1
		end

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			0
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"UNIT_DIE"
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) and global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, "ZTXChang")(_env, _env.unit) then
				for _, unit in global.__iter__(global.FriendDiedUnits(_env)) do
					if global.MARKED(_env, "QTQCi")(_env, unit) then
						local reviveunit = global.ReviveByUnit(_env, unit, this.HpFactor, this.RpFactor * 1000, {
							global.abs(_env, global.GetCellId(_env, _env.unit))
						})

						if reviveunit then
							global.AddStatus(_env, reviveunit, "Skill_QTQCi_Passive_Key")
						end
					end
				end

				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "QTQCi"))) do
					local Aibo = global.RecruitCard(_env, card, {
						global.abs(_env, global.GetCellId(_env, _env.unit))
					})

					if Aibo then
						global.AddStatus(_env, Aibo, "Skill_QTQCi_Passive_Key")
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_QTQCi_Proud_EX = {
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
				1.2,
				0
			}
		end

		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.4
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1434
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_QTQCi"
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

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			}, 100, "skill2"))

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if global.CellRowLocation(_env, global.GetCell(_env, unit)) == 3 then
					damage.val = damage.val * (1 + this.DamageFactor)

					global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
					global.AnimForTrgt(_env, unit, {
						loop = 1,
						anim = "shou2_huaqishouji",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
					})
				else
					global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
					global.AnimForTrgt(_env, unit, {
						loop = 1,
						anim = "shou1_huaqishouji",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
					})
				end
			end
		end)

		return _env
	end
}
all.Skill_QTQCi_Unique_EX = {
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
				3.35,
				0
			}
		end

		this.DamageFactor = externs.DamageFactor

		if this.DamageFactor == nil then
			this.DamageFactor = 0.4
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			2567
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_QTQCi"
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

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
			end
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) * {
				0,
				1
			}, 100, "skill3"))

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.AssignRoles(_env, unit, "target")
			end

			global.HarmTargetView(_env, _env.units)
		end)
		exec["@time"]({
			1900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if global.CellRowLocation(_env, global.GetCell(_env, unit)) == 1 then
					global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
					global.AnimForTrgt(_env, unit, {
						loop = 1,
						anim = "shou1_huaqishouji",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
					})
				elseif global.CellRowLocation(_env, global.GetCell(_env, unit)) == 2 then
					global.DelayCall(_env, 67, global.ApplyAOEHPDamage_ResultCheck, _env.ACTOR, unit, damage)
					global.DelayCall(_env, 67, global.AnimForTrgt, unit, {
						loop = 1,
						anim = "shou1_huaqishouji",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
					})
				elseif global.CellRowLocation(_env, global.GetCell(_env, unit)) == 3 then
					damage.val = damage.val * (1 + this.DamageFactor)

					global.DelayCall(_env, 134, global.ApplyAOEHPDamage_ResultCheck, _env.ACTOR, unit, damage)
					global.DelayCall(_env, 134, global.AnimForTrgt, unit, {
						loop = 1,
						anim = "shou2_huaqishouji",
						zOrder = "TopLayer",
						pos = {
							0.5,
							0.5
						}
					})
				end
			end
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
all.Skill_QTQCi_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.CritFactor = externs.CritFactor

		if this.CritFactor == nil then
			this.CritFactor = 0.5
		end

		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 300
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
			local buff_rp = global.SpecialNumericEffect(_env, "+Skill_QTQCi_Passive_RP", {
				"+Normal",
				"+Normal"
			}, this.RpFactor)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"Skill_QTQCi_Passive"
				}
			}, {
				buff_rp
			})

			local buff1 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 2,
				duration = 2,
				tags = {
					"NUMERIC",
					"BUFF",
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"CRITRATEUP"
				}
			}, {
				buff1
			}, 1, 0)
		end)

		return _env
	end
}

return _M
