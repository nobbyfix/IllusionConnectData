local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_Trap_ZFQi = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.LocationSet = externs.LocationSet

		assert(this.LocationSet ~= nil, "External variable `LocationSet` is not provided.")

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
			300
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
			local buff = global.SpecialNumericEffect(_env, "+Boost_buff", {
				"?Normal"
			}, 1)
			local buff2 = global.SpecialNumericEffect(_env, "+Boost_buff_display", {
				"?Normal"
			}, 0)
			local trap_boost_1_1 = global.BuffTrap(_env, {
				timing = 0,
				duration = 99,
				tags = {
					"BOOST"
				}
			}, {
				buff
			})
			local trap_boost_2_1 = global.BuffTrap(_env, {
				timing = 0,
				duration = 99,
				tags = {
					"BOOST"
				}
			}, {
				global.buff1
			})

			for i = 1, 9 do
				global.print(_env, "-==编号:", i)

				if this.LocationSet[i] == 1 then
					global.print(_env, "-==当前位置编号:", i)
					global.print(_env, "-==GetCellById(i):", global.GetCellById(_env, i))
					global.ApplyTrap(_env, global.GetCellById(_env, i), {
						display = "ZFQi_1_1",
						duration = 99,
						triggerLife = 99,
						tags = {
							"BOOSTON"
						}
					}, {
						trap_boost_1_1
					})
					global.ApplyTrap(_env, global.GetCellById(_env, i), {
						display = "ZFQi_2_1",
						duration = 99,
						triggerLife = 99,
						tags = {
							"BOOSTON"
						}
					}, {
						trap_boost_2_1
					})
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.SelectBuffCount(_env, _env.unit, global.BUFF_MARKED(_env, "BOOST")) > 0 then
				global.Sound(_env, "Se_Alert_Better_Egg", 1)
				global.print(_env, "-=强化:")

				local buff1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, 0.5)
				local buff2 = global.NumericEffect(_env, "-unhurtrate", {
					"+Normal",
					"+Normal"
				}, 0.5)
				local buff3 = global.NumericEffect(_env, "+unhurtrate", {
					"+Normal",
					"+Normal"
				}, 0)
				local trap_boost_1_2 = global.BuffTrap(_env, {
					timing = 0,
					duration = 5,
					tags = {
						"BOOST"
					}
				}, {
					buff3
				})

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "HurtRateUp",
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff1
				})
				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					display = "UnHurtRateDown",
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff2
				})
				global.ApplyTrap(_env, global.GetCell(_env, _env.unit), {
					display = "ZFQi_1_2",
					duration = 5,
					triggerLife = 1,
					tags = {
						"BOOSTON"
					}
				}, {
					trap_boost_1_2
				})
			end
		end)

		return _env
	end
}
all.Skill_BOSS_HeroRate = {
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
			"SELF:BEFORE_UNIQUE"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
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
			local buffeft1 = global.SpecialNumericEffect(_env, "+Hero_DmgExtra_hurtrate", {
				"+Normal",
				"+Normal"
			}, 10)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				display = "HurtRateUp",
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE",
					"Skill_BOSS_HeroRate"
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

			global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Skill_BOSS_HeroRate"), 99)
		end)

		return _env
	end
}
all.Skill_BOSS_Notice = {
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
		this.passive1 = global["[schedule_in_cycles]"](this, {
			1000
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

			if global.UnitPropGetter(_env, "rp")(_env, _env.ACTOR) >= 800 then
				global.Sound(_env, "Se_Alert_Skill_Active", 1)

				local buffeft1 = global.SpecialNumericEffect(_env, "+specialnum1", {
					"?Normal"
				}, 0)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 4,
					duration = 1,
					display = "BOSS_yujing",
					tags = {
						"Skill_BOSS_Notice",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})
			else
				global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Skill_BOSS_Notice"), 99)
			end

			global.print(_env, "着色buff层数:", global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_BOSS_Notice")))
		end)

		return _env
	end
}
all.Skill_BOSS_xige = {
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
			2000
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_HPCHANGE"
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
			local buffeft1 = global.DeathImmuneEffect(_env, 99)

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "Skill_BOSS_xige",
				timing = 0,
				limit = 1,
				tags = {
					"Skill_BOSS_xige",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			}, 1)
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

		_env.prevHpPercent = externs.prevHpPercent

		assert(_env.prevHpPercent ~= nil, "External variable `prevHpPercent` is not provided.")

		_env.curHpPercent = externs.curHpPercent

		assert(_env.curHpPercent ~= nil, "External variable `curHpPercent` is not provided.")

		_env.flag = 0
		_env.flag2 = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.unit == _env.ACTOR then
				local num = 20

				if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "Skill_BOSS_xige")) > 0 and num <= _env.prevHpPercent and _env.curHpPercent < num then
					global.PlayBGM(_env, "Mus_Battle_Animal_Boss_1_2")
					global.AddAnim(_env, {
						loop = 2,
						anim = "bianshen2_zhanshupai",
						zOrder = "TopLayer",
						pos = global.UnitPos(_env, _env.ACTOR) + {
							0.3,
							-1.3
						}
					})
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "Skill_BOSS_xige"), 99)

					_env.flag = 1
				end
			end
		end)
		exec["@time"]({
			1000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag == 1 and _env.flag2 == 0 then
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
				global.setRoleScale(_env, _env.ACTOR, 1.3)
				global.SetHSVColor(_env, _env.ACTOR, -33, 0, 0, 55)
				global.ApplyHPRecovery(_env, _env.ACTOR, global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR))

				local buffeft1 = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1
				})

				local buff_show = global.NumericEffect(_env, "+hurtrate", {
					"+Normal",
					"+Normal"
				}, 0)

				for i = 1, 5 do
					global.DelayCall(_env, 500 * i, global.ApplyBuff, _env.ACTOR, {
						timing = 0,
						duration = 99,
						display = "HurtRateUp",
						tags = {
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff_show
					})
				end

				_env.flag2 = 2
			end
		end)

		return _env
	end
}
all.Skill_XDE_Unique_Ver1 = {
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

		this.ProbRateFactor = externs.ProbRateFactor

		if this.ProbRateFactor == nil then
			this.ProbRateFactor = 1
		end

		this.HurtRateFactor = externs.HurtRateFactor

		if this.HurtRateFactor == nil then
			this.HurtRateFactor = 0.2
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3100
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_XDE"
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

			for _, unit in global.__iter__(global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))) do
				global.RetainObject(_env, unit)

				local buff = global.NumericEffect(_env, "+def", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, unit, {
					timing = 0,
					duration = 99,
					tags = {
						"XDE_TARGET"
					}
				}, {
					buff
				})
			end

			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local units = global.EnemyUnits(_env, global.HASBUFFTAG(_env, global.BUFF_MARKED(_env, "XDE_TARGET")))

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.13, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil) + {
				-0.8,
				0
			}, 100, "skill3_1"))

			for _, unit in global.__iter__(units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1733
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for k = 1, 4 do
				local prob = 1

				if k ~= 1 then
					prob = this.ProbRateFactor
				end

				global.DelayCall(_env, (k - 1) * 233, global.XDE_Attack, prob, this.HurtRateFactor)
			end
		end)
		exec["@time"]({
			3050
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "XDE_TARGET"), 99)
			end

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_XDE_Passive_Ver1 = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ProbRateFactor = externs.ProbRateFactor

		if this.ProbRateFactor == nil then
			this.ProbRateFactor = 0
		end

		this.Num = externs.Num

		if this.Num == nil then
			this.Num = 1
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

			if global.ProbTest(_env, this.ProbRateFactor) then
				local units = global.Slice(_env, global.SortBy(_env, global.FriendUnits(_env, global.PETS - global.SUMMONS - global.MARKED(_env, "DAGUN") - global.HASSTATUS(_env, "CANNOT_BACK_TO_CARD")), "<", global.UnitPropGetter(_env, "hpRatio")), 1, 1)

				for _, unit in global.__iter__(units) do
					global.Flee(_env, 1000, unit, true)
				end

				global.Flee(_env, 1000, _env.ACTOR, true)
			else
				local units = global.RandomN(_env, this.Num, global.EnemyUnits(_env, global.PETS - global.MARKED(_env, "DAGUN") - global.HASSTATUS(_env, "CANNOT_BACK_TO_CARD")))

				for _, unit in global.__iter__(units) do
					global.Flee(_env, 1000, unit, true)
				end
			end
		end)

		return _env
	end
}

return _M
