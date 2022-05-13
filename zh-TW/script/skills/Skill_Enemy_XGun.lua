local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all

function all.Apply_San_Damage(_env, actor, target, damage)
	local this = _env.this
	local global = _env.global
	local buff = global.SpecialNumericEffect(_env, "-Current_San", {
		"+Normal",
		"+Normal"
	}, damage)

	global.ApplyBuff(_env, target, {
		timing = 0,
		duration = 99,
		tags = {}
	}, {
		buff
	})
	global.Perform(_env, target, global.Animation(_env, "hurt1"))

	local max = global.SpecialPropGetter(_env, "Max_San")(_env, target)
	local san = global.SpecialPropGetter(_env, "Current_San")(_env, target)
	local ratio = san / max

	if san < 0 then
		ratio = 0
	end

	global.UpdateFanProgress(_env, target, ratio)

	if san <= 0 then
		global.DelayCall(_env, 500, global.Flee, 1000, target)
	end
end

all.Skill_Enemy_XGun_Normal = {
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
			767
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
				-1.2,
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
all.Skill_Enemy_XGun_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.SanDivision = externs.SanDivision

		if this.SanDivision == nil then
			this.SanDivision = 2
		end

		this.SanDivision_Master = externs.SanDivision_Master

		if this.SanDivision_Master == nil then
			this.SanDivision_Master = 5
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1366
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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 1, 2, 2), 100, "skill2"))
		end)
		exec["@time"]({
			699
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(global.EnemyUnits(_env)) do
				local division = this.SanDivision

				if global.MASTER(_env, unit) then
					division = this.SanDivision_Master
				end

				local max_san = global.SpecialPropGetter(_env, "Max_San")(_env, unit)

				if max_san > 0 then
					local damage = max_san / division

					global.Apply_San_Damage(_env, _env.ACTOR, unit, damage)
				end
			end
		end)
		exec["@time"]({
			1366
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
			global.Kick(_env, _env.ACTOR)
		end)

		return _env
	end
}
all.Skill_LFKLFTe_Dagun_Unique_Activity = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.YiyuFactor = externs.YiyuFactor

		if this.YiyuFactor == nil then
			this.YiyuFactor = 0.32
		end

		this.HpFactor = externs.HpFactor

		if this.HpFactor == nil then
			this.HpFactor = 0.2
		end

		this.GongpingFactor = externs.GongpingFactor

		if this.GongpingFactor == nil then
			this.GongpingFactor = 3.6
		end

		this.abFactor = externs.abFactor

		if this.abFactor == nil then
			this.abFactor = 0.32
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1667
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

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buff = global.SpecialNumericEffect(_env, "+Dagun_Unique_Num", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {}
			}, {
				buff
			})

			_env.flag = global.SpecialPropGetter(_env, "Dagun_Unique_Num")(_env, global.FriendField(_env)) % 2

			global.SetDisplayZorder(_env, _env.ACTOR, 1000)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)

			if _env.flag == 0 then
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill2"))
			end

			if _env.flag == 1 then
				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					global.AssignRoles(_env, unit, "target")
				end

				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3"))
			end
		end)
		exec["@time"]({
			850
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag == 0 then
				local atk_master = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local buff1 = global.NumericEffect(_env, "+atk", {
					"+Normal",
					"+Normal"
				}, atk_master * this.YiyuFactor)
				local buff2 = global.Diligent(_env)
				local buff3 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)

				for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS)) do
					local buffeft1 = global.SpecialNumericEffect(_env, "+yiyu_special_atk", {
						"?Normal"
					}, 1.5)
					local buffeft2 = global.SpecialNumericEffect(_env, "+yiyu_special_maxhp", {
						"?Normal"
					}, this.HpFactor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
						timing = 0,
						duration = 99,
						display = "AtkUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"ATKUP",
							"DISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff1
					}, 1)
					global.ApplyBuff(_env, unit, {
						timing = 2,
						duration = 1,
						tags = {
							"STATUS",
							"DILIGENT",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"DAGUNKILL",
							"YIYU"
						}
					}, {
						buff2,
						buff3,
						buffeft1,
						buffeft2
					})
				end

				global.DiligentRound(_env)
			end

			if _env.flag == 1 then
				local buff = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, this.abFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"Skill_LFKLFTe_Dagun_Unique_Gongping"
					}
				}, {
					buff
				})

				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					global.ApplyRealDamage(_env, _env.ACTOR, unit, 2, 2, this.GongpingFactor, {
						0,
						433
					}, {
						0.5,
						0.5
					})
				end
			end
		end)
		exec["@time"]({
			1100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag == 0 then
				global.ResetDisplayZorder(_env, _env.ACTOR)
				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			1600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ResetDisplayZorder(_env, _env.ACTOR)
			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LFKLFTe_Dagun_Unique_Boss = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.YiyuFactor = externs.YiyuFactor

		if this.YiyuFactor == nil then
			this.YiyuFactor = 0.32
		end

		this.HpFactor = externs.HpFactor

		if this.HpFactor == nil then
			this.HpFactor = 0.2
		end

		this.GongpingFactor = externs.GongpingFactor

		if this.GongpingFactor == nil then
			this.GongpingFactor = 3.6
		end

		this.abFactor = externs.abFactor

		if this.abFactor == nil then
			this.abFactor = 0.32
		end

		this.xiaogunhp = externs.xiaogunhp

		if this.xiaogunhp == nil then
			this.xiaogunhp = 1
		end

		this.xiaogunatk = externs.xiaogunatk

		if this.xiaogunatk == nil then
			this.xiaogunatk = 1
		end

		this.xiaogundef = externs.xiaogundef

		if this.xiaogundef == nil then
			this.xiaogundef = 1
		end

		this.xiaogun_num = externs.xiaogun_num

		if this.xiaogun_num == nil then
			this.xiaogun_num = 1
		end

		this.xiaogun_pos = externs.xiaogun_pos

		if this.xiaogun_pos == nil then
			this.xiaogun_pos = {
				1
			}
		end

		this.xiaogun_rp = externs.xiaogun_rp

		if this.xiaogun_rp == nil then
			this.xiaogun_rp = {
				100
			}
		end

		this.summonFactor = {
			this.xiaogunhp,
			this.xiaogunatk,
			this.xiaogundef
		}
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1667
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

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buff = global.SpecialNumericEffect(_env, "+Dagun_Unique_Num", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {}
			}, {
				buff
			})

			_env.flag = global.SpecialPropGetter(_env, "Dagun_Unique_Num")(_env, global.FriendField(_env)) % 2

			global.SetDisplayZorder(_env, _env.ACTOR, 1000)
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)

			if _env.flag == 0 then
				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill2"))
			end

			if _env.flag == 1 then
				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					global.AssignRoles(_env, unit, "target")
				end

				global.Perform(_env, _env.ACTOR, global.Animation(_env, "skill3"))
			end
		end)
		exec["@time"]({
			850
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag == 0 then
				local atk_master = global.UnitPropGetter(_env, "atk")(_env, _env.ACTOR)
				local buff1 = global.NumericEffect(_env, "+atk", {
					"+Normal",
					"+Normal"
				}, atk_master * this.YiyuFactor)
				local buff2 = global.Diligent(_env)
				local buff3 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)

				for i = 1, this.xiaogun_num do
					local SummonedDGun = global.Summon(_env, _env.ACTOR, "SummonedDGun", this.summonFactor, nil, {
						this.xiaogun_pos[i]
					})

					if SummonedDGun then
						global.AddStatus(_env, SummonedDGun, "SummonedDGun")

						local buff_rp = global.SpecialNumericEffect(_env, "+XiaoGun_Rp", {
							"+Normal",
							"+Normal"
						}, this.xiaogun_rp[i])

						global.ApplyBuff(_env, SummonedDGun, {
							timing = 0,
							duration = 99
						}, {
							buff_rp
						})
					end
				end

				for _, unit in global.__iter__(global.FriendUnits(_env, global.PETS)) do
					local buffeft1 = global.SpecialNumericEffect(_env, "+yiyu_special_atk", {
						"?Normal"
					}, 1.5)
					local buffeft2 = global.SpecialNumericEffect(_env, "+yiyu_special_maxhp", {
						"?Normal"
					}, this.HpFactor)

					global.ApplyBuff_Buff(_env, _env.ACTOR, unit, {
						timing = 0,
						duration = 99,
						display = "AtkUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"ATKUP",
							"DISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buff1
					}, 1)
					global.ApplyBuff(_env, unit, {
						timing = 2,
						duration = 1,
						tags = {
							"STATUS",
							"DILIGENT",
							"UNDISPELLABLE",
							"UNSTEALABLE",
							"DAGUNKILL",
							"YIYU"
						}
					}, {
						buff2,
						buff3,
						buffeft1,
						buffeft2
					})
				end

				global.DiligentRound(_env)
			end

			if _env.flag == 1 then
				local buff = global.NumericEffect(_env, "+absorption", {
					"+Normal",
					"+Normal"
				}, this.abFactor)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"Skill_LFKLFTe_Dagun_Unique_Gongping"
					}
				}, {
					buff
				})

				for _, unit in global.__iter__(global.EnemyUnits(_env)) do
					global.ApplyRealDamage(_env, _env.ACTOR, unit, 2, 2, this.GongpingFactor, {
						0,
						433
					}, {
						0.5,
						0.5
					})
				end
			end
		end)
		exec["@time"]({
			1100
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if _env.flag == 0 then
				global.ResetDisplayZorder(_env, _env.ACTOR)
				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			1600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.ResetDisplayZorder(_env, _env.ACTOR)
			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_LFKLFTe_Dagun_Passive_Boss = {
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
			50
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
			50
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local buffeft1 = global.Immune(_env)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DEBUFF"))

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "DAGUN_IMMUNE",
				timing = 0,
				limit = 1,
				tags = {
					"DAGUN_IMMUNE"
				}
			}, {
				buffeft1,
				buffeft2
			})
			global.DaGun(_env, _env.ACTOR)
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

			if global.INSTATUS(_env, "SummonedDGun")(_env, _env.unit) then
				local rp = global.SpecialPropGetter(_env, "XiaoGun_Rp")(_env, _env.unit)

				global.ApplyRPRecovery(_env, _env.unit, rp)
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

			if global.INSTATUS(_env, "SummonedLFKLFTeLeftFoot")(_env, _env.unit) or global.INSTATUS(_env, "SummonedLFKLFTeRightFoot")(_env, _env.unit) then
				local left = 0
				local right = 0

				for _, unit in global.__iter__(global.FriendUnits(_env)) do
					if global.INSTATUS(_env, "SummonedLFKLFTeLeftFoot")(_env, unit) then
						left = left + 1
					end

					if global.INSTATUS(_env, "SummonedLFKLFTeRightFoot")(_env, unit) then
						right = right + 1
					end
				end

				if left == 0 and right == 0 then
					global.DispelBuff(_env, _env.ACTOR, global.BUFF_MARKED(_env, "DAGUN_IMMUNE"), 99)
				end
			end
		end)

		return _env
	end
}
all.Skill_LFKLFTe_Dagun_Passive_Boss_Foot = {
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
			"SELF:GET_ATTACKED"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"SELF:PRE_ENTER"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:ENTER"
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

			if global.FriendMaster(_env) then
				if global.INSTATUS(_env, "HasBothFeet")(_env, global.FriendMaster(_env)) then
					global.SwitchActionTo(_env, "hurt1", "hurt1", global.FriendMaster(_env))
				elseif global.INSTATUS(_env, "OnlyLeftFoot")(_env, global.FriendMaster(_env)) then
					global.SwitchActionTo(_env, "hurt1", "hurt1_2", global.FriendMaster(_env))
				elseif global.INSTATUS(_env, "OnlyRightFoot")(_env, global.FriendMaster(_env)) then
					global.SwitchActionTo(_env, "hurt1", "hurt1_3", global.FriendMaster(_env))
				end

				global.Perform(_env, global.FriendMaster(_env), global.Animation(_env, "hurt1"))
				global.ResetDisplayZorder(_env, global.FriendMaster(_env))
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

			if global.abs(_env, global.IdOfCell(_env, global.GetCell(_env, _env.ACTOR))) ~= 7 and global.abs(_env, global.IdOfCell(_env, global.GetCell(_env, _env.ACTOR))) ~= 9 then
				global.Kick(_env, _env.ACTOR)

				if global.FriendMaster(_env) then
					global.ResetDisplayZorder(_env, global.FriendMaster(_env))
					global.DaGun(_env, global.FriendMaster(_env))
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

			if global.abs(_env, global.IdOfCell(_env, global.GetCell(_env, _env.ACTOR))) == 7 then
				global.AddStatus(_env, _env.ACTOR, "SummonedLFKLFTeLeftFoot")

				local buff_left = global.SpecialNumericEffect(_env, "+DaGun_Left", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"DAGUN_LEFT"
					}
				}, {
					buff_left
				})
			elseif global.abs(_env, global.IdOfCell(_env, global.GetCell(_env, _env.ACTOR))) == 9 then
				global.AddStatus(_env, _env.ACTOR, "SummonedLFKLFTeRightFoot")

				local buff_right = global.SpecialNumericEffect(_env, "+DaGun_Right", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, global.FriendField(_env), {
					timing = 0,
					duration = 99,
					tags = {
						"DAGUN_RIGHT"
					}
				}, {
					buff_right
				})
			end

			global.NoMove(_env, _env.ACTOR)

			local buffeft1 = global.SpecialNumericEffect(_env, "+FootDamageRate", {
				"?Normal"
			}, 1)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"Skill_LFKLFTe_Passive",
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
all.Skill_SKong_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Tags1 = externs.Tags1

		if this.Tags1 == nil then
			this.Tags1 = {}
		end

		this.Position1 = externs.Position1

		if this.Position1 == nil then
			this.Position1 = {}
		end

		this.Tags2 = externs.Tags2

		if this.Tags2 == nil then
			this.Tags2 = {}
		end

		this.Position2 = externs.Position2

		if this.Position2 == nil then
			this.Position2 = {}
		end

		this.Tags3 = externs.Tags3

		if this.Tags3 == nil then
			this.Tags3 = {}
		end

		this.Position3 = externs.Position3

		if this.Position3 == nil then
			this.Position3 = {}
		end

		this.Tags4 = externs.Tags4

		if this.Tags4 == nil then
			this.Tags4 = {}
		end

		this.Position4 = externs.Position4

		if this.Position4 == nil then
			this.Position4 = {}
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		this.main = global["[duration]"](this, {
			1667
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
			local buff = global.SpecialNumericEffect(_env, "+SKong_Unique_Num", {
				"+Normal",
				"+Normal"
			}, 1)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				tags = {}
			}, {
				buff
			})
			global.DispelBuff(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "SKONG_DARK"), 99)

			local buff_sankai = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				display = "Sea_Dark_Leave",
				tags = {
					"SKONG_DARK_LEAVE"
				}
			}, {
				buff_sankai
			})
		end)
		exec["@time"]({
			850
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local num = global.SpecialPropGetter(_env, "SKong_Unique_Num")(_env, _env.ACTOR)
			local Tags = {}
			local Position = {}

			if num == 1 then
				Tags = this.Tags1
				Position = this.Position1
			elseif num == 2 then
				Tags = this.Tags2
				Position = this.Position2
			elseif num == 3 then
				Tags = this.Tags3
				Position = this.Position3
			elseif num == 4 then
				Tags = this.Tags4
				Position = this.Position4
			end

			if #Tags > 0 then
				for i = 1, #Tags do
					for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, Tags[i]))) do
						global.RecruitCard(_env, card, Position[i])
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_SKong_Passive = {
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
			520
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:ENTER"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			520
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

			global.SetDisplayZorder(_env, global.FriendField(_env), 1000)

			local buffeft1 = global.Immune(_env)
			local buffeft2 = global.ImmuneBuff(_env, global.BUFF_MARKED_ANY(_env, "DEBUFF"))

			global.ApplyBuff(_env, _env.ACTOR, {
				duration = 99,
				group = "SKong_IMMUNE",
				timing = 0,
				limit = 1,
				tags = {
					"SKONG_IMMUNE",
					"CANNOT_RP_DOWN"
				}
			}, {
				buffeft1,
				buffeft2
			})

			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				display = "Sea_Dark_In",
				tags = {
					"SKONG_DARK"
				}
			}, {
				buff
			})
			global.DelayCall(_env, 500, global.ApplyBuff, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				display = "Sea_Dark",
				tags = {
					"SKONG_DARK"
				}
			}, {
				buff
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

			global.DispelBuff(_env, global.FriendField(_env), global.BUFF_MARKED(_env, "SKONG_DARK_LEAVE"), 99)

			local buff = global.NumericEffect(_env, "+def", {
				"+Normal",
				"+Normal"
			}, 0)

			global.ApplyBuff(_env, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				display = "Sea_Dark_In",
				tags = {
					"SKONG_DARK"
				}
			}, {
				buff
			})
			global.DelayCall(_env, 500, global.ApplyBuff, global.FriendField(_env), {
				timing = 0,
				duration = 99,
				display = "Sea_Dark",
				tags = {
					"SKONG_DARK"
				}
			}, {
				buff
			})
		end)

		return _env
	end
}
all.Skill_SKong_Passive_Dagun = {
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
			520
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
			local master_maxhp = global.UnitPropGetter(_env, "maxHp")(_env, _env.ACTOR)
			local buff_hp = global.SpecialNumericEffect(_env, "+Ini_Hp", {
				"+Normal",
				"+Normal"
			}, master_maxhp)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99
			}, {
				buff_hp
			})

			for _, card in global.__iter__(global.CardsOfPlayer(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "LFKLFTe"))) do
				global.setEnterPauseTime(_env, global.GetOwner(_env, _env.ACTOR), card, 1500)
			end
		end)

		return _env
	end
}

return _M
