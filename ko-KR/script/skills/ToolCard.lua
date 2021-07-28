local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SYJi_Normal = {
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
			100
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]

		exec["@time"]({
			0
		}, _env, function (_env)
		end)

		return _env
	end
}
all.Skill_SYJi_Unique = {
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

		_env.selectCount = 0
		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil) + {
				-0.3,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.print(_env, "-=光炮线")

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.RetainObject(_env, unit)
				global.AssignRoles(_env, unit, "target")
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damageRadio = 3

				if not global.MASTER(_env, unit) then
					damageRadio = damageRadio * 8
				end

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					3,
					0
				})
				local result = global.ApplyRealDamage(_env, _env.ACTOR, unit, 2, 1, damageRadio, 0, 0, damage)
			end
		end)
		exec["@time"]({
			1433
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
			global.AddAnim(_env, {
				loop = 1,
				anim = "cisha_zhanshupai",
				zOrder = "TopLayer",
				pos = global.UnitPos(_env, _env.ACTOR)
			})
			global.RelocateExtraCard(_env, "hero", 15)
			global.Kick(_env, _env.ACTOR)
		end)

		return _env
	end
}
all.Skill_SYJi_Passive = {
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
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			300
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:DIE"
		}, passive4)

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
				global.SetHSVColor(_env, _env.ACTOR, -112, 0, 0, 0)
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
			local buffeft1 = global.PassiveFunEffectBuff(_env, "KickSYJi", {})

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1
			})
		end)

		return _env
	end,
	passive4 = function (_env, externs)
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

			global.Sound(_env, "Se_Skill_XGGun_Explode", 1)
		end)
		exec["@time"]({
			200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MASTER(_env, _env.ACTOR) then
				global.AddAnim(_env, {
					loop = 1,
					anim = "cisha_zhanshupai",
					zOrder = "TopLayer",
					pos = global.UnitPos(_env, _env.ACTOR)
				})
				global.RelocateExtraCard(_env, "hero", 15)
			end
		end)

		return _env
	end
}
all.KickSYJi = {
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
			"UNIT_KICK"
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MARKED(_env, "SYJi")(_env, _env.unit) then
				global.RelocateExtraCard(_env, "hero", 15)
			end
		end)

		return _env
	end
}
all.ToolCard_QHDeng = {
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
			1500
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.isLeft = externs.isLeft

		assert(_env.isLeft ~= nil, "External variable `isLeft` is not provided.")

		_env.cellId = externs.cellId

		assert(_env.cellId ~= nil, "External variable `cellId` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buff = global.SpecialNumericEffect(_env, "+Light_buff", {
				"?Normal"
			}, 1)
			local trap_lighton = global.BuffTrap(_env, {
				timing = 2,
				duration = 1,
				tags = {
					"LIGHTON"
				}
			}, {
				buff
			})
			local units = nil

			global.print(_env, "-=isLeft:", _env.isLeft)
			global.print(_env, "-=cellId:", _env.cellId)
			global.print(_env, "-=GetCellByIdcellId", global.CELL_IN_POS(_env, _env.cellId))

			if _env.isLeft then
				units = global.FriendCells(_env, global.CELL_IN_POS(_env, _env.cellId))
			else
				units = global.EnemyCells(_env, global.CELL_IN_POS(_env, _env.cellId))
			end

			if global.SelectBuffCount(_env, global.EnemyField(_env), global.BUFF_MARKED_ALL(_env, "BOSS_CHANGE")) > 0 then
				if global.SelectTrapCount(_env, units[1], global.BUFF_MARKED(_env, "LIGHTON")) > 0 then
					global.print(_env, "-=当前格子有打光，关闭")
					global.Sound(_env, "Se_Skill_Light_2", 1)
					global.DispelBuffTrap(_env, units[1], global.BUFF_MARKED(_env, "LIGHTON"))

					if global.GetCellUnit(_env, units[1]) then
						local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
							"?Normal"
						}, 1)

						global.ApplyBuff(_env, global.GetCellUnit(_env, units[1]), {
							timing = 0,
							duration = 99,
							display = "Shader_Black",
							tags = {
								"LIGHTSHADER",
								"UNSTEALABLE",
								"UNDISPELLABLE"
							}
						}, {
							buffeft1
						})
					end
				else
					global.Sound(_env, "Se_Skill_Light_1", 1)
					global.ApplyTrap(_env, units[1], {
						display = "Light_lan",
						duration = 99,
						triggerLife = 99,
						tags = {
							"LIGHTON"
						}
					}, {
						trap_lighton
					})

					if global.GetCellUnit(_env, units[1]) then
						global.DispelBuff(_env, global.GetCellUnit(_env, units[1]), global.BUFF_MARKED_ALL(_env, "LIGHTSHADER"), 99)
					end

					global.print(_env, "-=当前格子无打光，开灯")
				end
			elseif global.SelectTrapCount(_env, units[1], global.BUFF_MARKED(_env, "LIGHTON")) > 0 then
				global.print(_env, "-=当前格子有打光，关闭")
				global.Sound(_env, "Se_Skill_Light_2", 1)
				global.DispelBuffTrap(_env, units[1], global.BUFF_MARKED(_env, "LIGHTON"))

				if global.GetCellUnit(_env, units[1]) then
					local buffeft1 = global.SpecialNumericEffect(_env, "+Shader_Black", {
						"?Normal"
					}, 1)

					global.ApplyBuff(_env, global.GetCellUnit(_env, units[1]), {
						timing = 0,
						duration = 99,
						display = "Shader_Black",
						tags = {
							"LIGHTSHADER",
							"UNSTEALABLE",
							"UNDISPELLABLE"
						}
					}, {
						buffeft1
					})
				end
			else
				global.Sound(_env, "Se_Skill_Light_1", 1)
				global.ApplyTrap(_env, units[1], {
					display = "Light_cheng",
					duration = 99,
					triggerLife = 99,
					tags = {
						"LIGHTON"
					}
				}, {
					trap_lighton
				})

				if global.GetCellUnit(_env, units[1]) then
					global.DispelBuff(_env, global.GetCellUnit(_env, units[1]), global.BUFF_MARKED_ALL(_env, "LIGHTSHADER"), 99)
				end

				global.print(_env, "-=当前格子无打光，开灯")
			end

			global.RelocateExtraCard(_env, "skill", 8)
		end)

		return _env
	end
}

return _M
