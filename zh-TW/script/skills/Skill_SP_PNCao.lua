local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SP_PNCao_Normal = {
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
				1.1,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1100
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
				-2,
				0
			}, 100, "skill1"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			433
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
all.Skill_SP_PNCao_Proud = {
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
				1.8,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1767
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_PNCao"
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
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
all.Skill_SP_PNCao_Unique = {
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
				2.2,
				0
			}
		end

		this.MuouMageFactor = externs.MuouMageFactor

		if this.MuouMageFactor == nil then
			this.MuouMageFactor = 0.2
		end

		this.MuouHpFactor = externs.MuouHpFactor

		if this.MuouHpFactor == nil then
			this.MuouHpFactor = 0.15
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			4100
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_PNCao"
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

		_env.flag = 0
		_env.another = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buff_check = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"SP_PNCao_Check"
				}
			}, {
				buff_check
			})

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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				if global.MARKED(_env, "SP_PNCao")(_env, unit) then
					_env.flag = _env.flag + 1
				end
			end

			if _env.flag == 2 then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.MARKED(_env, "SP_PNCao")(_env, unit) and global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "SP_PNCao_Check")) == 0 then
						local buff = global.NumericEffect(_env, "+defrate", {
							"+Normal",
							"+Normal"
						}, 0)

						global.ApplyBuff(_env, unit, {
							timing = 0,
							duration = 99,
							display = "TouMing",
							tags = {
								"SP_PNCao_TouMing"
							}
						}, {
							buff
						})
					end
				end

				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
			else
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill4"))
			end

			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1833
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.Muou_Curse(_env, unit, this.MuouMageFactor, global.Muou_Num(_env, unit))
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if _env.flag == 1 then
					global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
						0,
						167,
						333,
						633,
						900,
						1067
					}, global.SplitValue(_env, damage, {
						0.15,
						0.15,
						0.15,
						0.15,
						0.15,
						0.25
					}))
				else
					global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
						0,
						167,
						233
					}, global.SplitValue(_env, damage, {
						0.3,
						0.3,
						0.4
					}))
				end

				local count = global.Muou_Num(_env, unit)
				local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local exdamage = global.min(_env, hp * this.MuouHpFactor, atk * 1.5) * count

				if global.PETS(_env, unit) then
					if _env.flag == 1 then
						global.DelayCall(_env, 1333, global.ApplyRealDamage, _env.ACTOR, unit, 2, 1, 0, 0, 0, nil, exdamage)
					else
						global.DelayCall(_env, 400, global.ApplyRealDamage, _env.ACTOR, unit, 2, 1, 0, 0, 0, nil, exdamage)
					end
				end
			end
		end)
		exec["@time"]({
			2367
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag == 2 then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "SP_PNCao_TouMing")) > 0 then
						global.ApplyRPDamage(_env, unit, 1000)

						_env.another = unit
					end
				end

				for _, unit in global.__iter__(_env.units) do
					global.Muou_Curse(_env, unit, this.MuouMageFactor, global.Muou_Num(_env, unit))
					global.ApplyStatusEffect(_env, _env.another, unit)
					global.ApplyRPEffect(_env, _env.another, unit)

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.another, unit, this.dmgFactor)

					global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
						0,
						67,
						300,
						633,
						800,
						900,
						1067
					}, global.SplitValue(_env, damage, {
						0.1,
						0.1,
						0.1,
						0.15,
						0.15,
						0.15,
						0.25
					}))

					local count = global.Muou_Num(_env, unit)
					local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
					local atk = global.UnitPropGetter(_env, "atk")(_env, _env.another)
					local exdamage = global.min(_env, hp * this.MuouHpFactor, atk * 1.5) * count

					if global.PETS(_env, unit) then
						global.DelayCall(_env, 1133, global.ApplyRealDamage, _env.another, unit, 2, 1, 0, 0, 0, nil, exdamage)
					end
				end
			end
		end)
		exec["@time"]({
			3600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag == 1 then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.MARKED(_env, "SP_PNCao")(_env, unit) then
						global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "SP_PNCao_Check"), 99)
						global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "SP_PNCao_TouMing"), 99)
					end
				end

				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
			else
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.MARKED(_env, "SP_PNCao")(_env, unit) then
						global.DelayCall(_env, 400, global.DispelBuff, unit, global.BUFF_MARKED(_env, "SP_PNCao_Check"), 99)
						global.DelayCall(_env, 400, global.DispelBuff, unit, global.BUFF_MARKED(_env, "SP_PNCao_TouMing"), 99)
					end
				end

				global.DelayCall(_env, 400, global.EnergyRestrainStop, _env.ACTOR, _env.TARGET)
			end
		end)

		return _env
	end
}
all.Skill_SP_PNCao_Passive = {
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

			if global.MASTER(_env, _env.ACTOR) and not global.MARKED(_env, "DAGUN")(_env, _env.ACTOR) then
				local RoleModel = {
					"Model_SP_PNCao_NNuo"
				}
				local num = global.GetSufaceIndex(_env, _env.ACTOR)

				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "SP_PNCao"))) do
					global.InheritCard(_env, card, RoleModel[num])
				end
			end
		end)

		return _env
	end
}

function all.Muou_Curse(_env, target, factor, num)
	local this = _env.this
	local global = _env.global
	local buff = global.NumericEffect(_env, "+defrate", {
		"+Normal",
		"+Normal"
	}, 0)

	if num == 0 then
		local buffeft1 = global.SpecialNumericEffect(_env, "-Mage_DmgExtra_unhurtrate", {
			"?Normal"
		}, factor)
		local buffeft2 = global.SpecialNumericEffect(_env, "-Assassin_DmgExtra_unhurtrate", {
			"?Normal"
		}, factor)

		global.ApplyBuff(_env, target, {
			timing = 0,
			duration = 99,
			display = "Muou1",
			tags = {
				"DEBUFF",
				"MUOU1",
				"MUOU",
				"DISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buffeft1,
			buffeft2
		})
	elseif num == 1 then
		global.DispelBuff(_env, target, global.BUFF_MARKED(_env, "MUOU1"), 99)

		local buffeft1 = global.SpecialNumericEffect(_env, "-Mage_DmgExtra_unhurtrate", {
			"?Normal"
		}, factor * 2)
		local buffeft2 = global.SpecialNumericEffect(_env, "-Assassin_DmgExtra_unhurtrate", {
			"?Normal"
		}, factor * 2)

		global.ApplyBuff(_env, target, {
			timing = 0,
			duration = 99,
			display = "Muou2",
			tags = {
				"DEBUFF",
				"MUOU2",
				"MUOU",
				"DISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buffeft1,
			buffeft2
		})
	elseif num == 2 then
		global.DispelBuff(_env, target, global.BUFF_MARKED(_env, "MUOU2"), 99)

		local buffeft1 = global.SpecialNumericEffect(_env, "-Mage_DmgExtra_unhurtrate", {
			"?Normal"
		}, factor * 3)
		local buffeft2 = global.SpecialNumericEffect(_env, "-Assassin_DmgExtra_unhurtrate", {
			"?Normal"
		}, factor * 3)

		global.ApplyBuff(_env, target, {
			timing = 0,
			duration = 99,
			display = "Muou3",
			tags = {
				"DEBUFF",
				"MUOU3",
				"MUOU",
				"DISPELLABLE",
				"UNSTEALABLE"
			}
		}, {
			buffeft1,
			buffeft2
		})
	end
end

function all.Muou_Num(_env, target)
	local this = _env.this
	local global = _env.global
	local num = 0

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "MUOU1")) > 0 then
		num = 1
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "MUOU2")) > 0 then
		num = 2
	end

	if global.SelectBuffCount(_env, target, global.BUFF_MARKED(_env, "MUOU3")) > 0 then
		num = 3
	end

	return num
end

all.Skill_SP_PNCao_Proud_EX = {
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
				1.8,
				0
			}
		end

		this.exdmgFactor = externs.exdmgFactor

		if this.exdmgFactor == nil then
			this.exdmgFactor = {
				1,
				0.5,
				0
			}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1767
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_PNCao"
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
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
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

			local exdamage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.exdmgFactor)
			local count = global.Muou_Num(_env, _env.TARGET)
			exdamage.val = exdamage.val * count

			global.DelayCall(_env, 500, global.ApplyHPDamage_ResultCheck, _env.ACTOR, _env.TARGET, exdamage)
		end)

		return _env
	end
}
all.Skill_SP_PNCao_Unique_EX = {
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

		this.MuouMageFactor = externs.MuouMageFactor

		if this.MuouMageFactor == nil then
			this.MuouMageFactor = 0.2
		end

		this.MuouHpFactor = externs.MuouHpFactor

		if this.MuouHpFactor == nil then
			this.MuouHpFactor = 0.25
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			4100
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_PNCao"
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

		_env.flag = 0
		_env.another = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buff_check = global.NumericEffect(_env, "+defrate", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"SP_PNCao_Check"
				}
			}, {
				buff_check
			})

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

			for _, unit in global.__iter__(global.FriendUnits(_env)) do
				if global.MARKED(_env, "SP_PNCao")(_env, unit) then
					_env.flag = _env.flag + 1
				end
			end

			if _env.flag == 2 then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.MARKED(_env, "SP_PNCao")(_env, unit) and global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "SP_PNCao_Check")) == 0 then
						local buff = global.NumericEffect(_env, "+defrate", {
							"+Normal",
							"+Normal"
						}, 0)

						global.ApplyBuff(_env, unit, {
							timing = 0,
							duration = 99,
							display = "TouMing",
							tags = {
								"SP_PNCao_TouMing"
							}
						}, {
							buff
						})
					end
				end

				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))
			else
				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill4"))
			end

			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1833
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.Muou_Curse(_env, unit, this.MuouMageFactor, global.Muou_Num(_env, unit))
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				if _env.flag == 1 then
					global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
						0,
						167,
						333,
						633,
						900,
						1067
					}, global.SplitValue(_env, damage, {
						0.15,
						0.15,
						0.15,
						0.15,
						0.15,
						0.25
					}))
				else
					global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
						0,
						167,
						233
					}, global.SplitValue(_env, damage, {
						0.3,
						0.3,
						0.4
					}))
				end

				local count = global.Muou_Num(_env, unit)
				local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
				local atk = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local exdamage = global.min(_env, hp * this.MuouHpFactor, atk * 1.5) * count

				if global.PETS(_env, unit) then
					if _env.flag == 1 then
						global.DelayCall(_env, 1333, global.ApplyRealDamage, _env.ACTOR, unit, 2, 1, 0, 0, 0, nil, exdamage)
					else
						global.DelayCall(_env, 400, global.ApplyRealDamage, _env.ACTOR, unit, 2, 1, 0, 0, 0, nil, exdamage)
					end
				end
			end
		end)
		exec["@time"]({
			2367
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag == 2 then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.SelectBuffCount(_env, unit, global.BUFF_MARKED(_env, "SP_PNCao_TouMing")) > 0 then
						global.ApplyRPDamage(_env, unit, 1000)

						_env.another = unit
					end
				end

				for _, unit in global.__iter__(_env.units) do
					global.Muou_Curse(_env, unit, this.MuouMageFactor, global.Muou_Num(_env, unit))
					global.ApplyStatusEffect(_env, _env.another, unit)
					global.ApplyRPEffect(_env, _env.another, unit)

					local damage = global.EvalAOEDamage_FlagCheck(_env, _env.another, unit, this.dmgFactor)

					global.ApplyAOEHPMultiDamage_ResultCheck(_env, _env.ACTOR, unit, {
						0,
						67,
						300,
						633,
						800,
						900,
						1067
					}, global.SplitValue(_env, damage, {
						0.1,
						0.1,
						0.1,
						0.15,
						0.15,
						0.15,
						0.25
					}))

					local count = global.Muou_Num(_env, unit)
					local hp = global.UnitPropGetter(_env, "hp")(_env, unit)
					local atk = global.UnitPropGetter(_env, "atk")(_env, _env.another)
					local exdamage = global.min(_env, hp * this.MuouHpFactor, atk * 1.5) * count

					if global.PETS(_env, unit) then
						global.DelayCall(_env, 1133, global.ApplyRealDamage, _env.another, unit, 2, 1, 0, 0, 0, nil, exdamage)
					end
				end
			end
		end)
		exec["@time"]({
			3600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag == 1 then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.MARKED(_env, "SP_PNCao")(_env, unit) then
						global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "SP_PNCao_Check"), 99)
						global.DispelBuff(_env, unit, global.BUFF_MARKED(_env, "SP_PNCao_TouMing"), 99)
					end
				end

				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
			else
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.MARKED(_env, "SP_PNCao")(_env, unit) then
						global.DelayCall(_env, 400, global.DispelBuff, unit, global.BUFF_MARKED(_env, "SP_PNCao_Check"), 99)
						global.DelayCall(_env, 400, global.DispelBuff, unit, global.BUFF_MARKED(_env, "SP_PNCao_TouMing"), 99)
					end
				end

				global.DelayCall(_env, 400, global.EnergyRestrainStop, _env.ACTOR, _env.TARGET)
			end
		end)

		return _env
	end
}
all.Skill_SP_PNCao_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RpFactor = externs.RpFactor

		if this.RpFactor == nil then
			this.RpFactor = 1000
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) and not global.MARKED(_env, "DAGUN")(_env, _env.ACTOR) then
				local RoleModel = {
					"Model_SP_PNCao_NNuo"
				}
				local num = global.GetSufaceIndex(_env, _env.ACTOR)

				for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "SP_PNCao"))) do
					global.InheritCard(_env, card, RoleModel[num])
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

			if global.MARKED(_env, "SP_PNCao")(_env, _env.unit) and global.MASTER(_env, _env.ACTOR) then
				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.MARKED(_env, "SP_PNCao")(_env, unit) then
						global.ApplyRPRecovery(_env, unit, this.RpFactor)
					end
				end
			end
		end)

		return _env
	end
}

return _M
