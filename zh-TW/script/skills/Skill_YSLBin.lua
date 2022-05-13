local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_YSLBin_Normal = {
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
			967
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
				-2.2,
				0
			}, 100, "skill1"))
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
all.Skill_YSLBin_Proud = {
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
		main = global["[duration]"](this, {
			1200
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_YSLBin"
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

		_env.num = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2.2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MARKED(_env, "Master_XueZhan")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_LieSha")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_BiLei")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_FuHun")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_SenLing")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_WuShi")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_JiangJun")(_env, _env.TARGET) then
				if not global.MARKED(_env, "MASTER_ZhaoHuan")(_env, _env.TARGET) then
					if #global.SelectBuffs(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE", "STEALABLE")) > 0 then
						local buffeft1 = global.NumericEffect(_env, "+critrate", {
							"+Normal",
							"+Normal"
						}, 0.08)

						global.ApplyBuff(_env, _env.ACTOR, {
							duration = 99,
							group = "Skill_YSLBin_Proud",
							timing = 0,
							limit = 1,
							tags = {
								"NUMERIC",
								"BUFF",
								"CRITRATE"
							}
						}, {
							buffeft1
						})
					end

					global.StealBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE", "STEALABLE"), 1)
				end
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_YSLBin_Unique = {
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
			3200
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_YSLBin"
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

		_env.count1 = 0
		_env.count = 0

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
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MARKED(_env, "Master_XueZhan")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_LieSha")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_BiLei")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_FuHun")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_SenLing")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_WuShi")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_JiangJun")(_env, _env.TARGET) then
				if not global.MARKED(_env, "MASTER_ZhaoHuan")(_env, _env.TARGET) then
					_env.count = #global.SelectBuffs(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE", "STEALABLE"))

					for count1 = 0, _env.count do
						local buffeft1 = global.NumericEffect(_env, "+critrate", {
							"+Normal",
							"+Normal"
						}, 0.06)

						global.ApplyBuff(_env, _env.ACTOR, {
							duration = 99,
							group = "Skill_YSLBin_Unique",
							timing = 0,
							limit = 5,
							tags = {
								"NUMERIC",
								"BUFF",
								"CRITRATE",
								"DISPELLABLE",
								"STEALABLE"
							}
						}, {
							buffeft1
						})
					end

					global.StealBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE", "STEALABLE"), _env.count)
				end
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			3200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_YSLBin_Passive = {
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

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.count = 0
		_env.max = 0
		_env.unit = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit1 in global.__iter__(global.EnemyUnits(_env)) do
				if global.MARKED(_env, "MASTER")(_env, unit1) then
					-- Nothing
				elseif _env.max < global.UnitPropGetter(_env, "rp")(_env, unit1) then
					_env.max = global.UnitPropGetter(_env, "rp")(_env, unit1)
					_env.unit = unit1
				end
			end

			_env.max = _env.max * 0.8

			if _env.unit then
				global.ApplyRPDamage_ResultCheck(_env, _env.ACTOR, _env.unit, _env.max)
			end

			for _, unit2 in global.__iter__(global.FriendUnits(_env)) do
				_env.count = _env.count + 1
			end

			_env.max = _env.max / _env.count

			for _, unit3 in global.__iter__(global.FriendUnits(_env)) do
				if not global.MARKED(_env, "MASTER")(_env, unit3) then
					global.ApplyRPRecovery(_env, unit3, _env.max)
				end
			end
		end)

		return _env
	end
}
all.Skill_YSLBin_Proud_EX = {
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
		main = global["[duration]"](this, {
			1200
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_YSLBin"
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

		_env.num = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-2.2,
				0
			}, 100, "skill2"))
			global.AssignRoles(_env, _env.TARGET, "target")
		end)
		exec["@time"]({
			600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MARKED(_env, "Master_XueZhan")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_LieSha")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_BiLei")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_FuHun")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_SenLing")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_WuShi")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_JiangJun")(_env, _env.TARGET) then
				if not global.MARKED(_env, "MASTER_ZhaoHuan")(_env, _env.TARGET) then
					if #global.SelectBuffs(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE", "STEALABLE")) > 0 then
						local buffeft1 = global.NumericEffect(_env, "+critrate", {
							"+Normal",
							"+Normal"
						}, 0.12)

						global.ApplyBuff(_env, _env.ACTOR, {
							duration = 99,
							group = "Skill_YSLBin_Proud_EX",
							timing = 0,
							limit = 1,
							tags = {
								"NUMERIC",
								"BUFF",
								"CRITRATE"
							}
						}, {
							buffeft1
						})
					end

					global.StealBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE", "STEALABLE"), 1)
				end
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_YSLBin_Unique_EX = {
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
			3200
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_YSLBin"
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

		_env.count1 = 0
		_env.count = 0

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
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if not global.MARKED(_env, "Master_XueZhan")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_LieSha")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_BiLei")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_FuHun")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_SenLing")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_WuShi")(_env, _env.TARGET) and not global.MARKED(_env, "MASTER_JiangJun")(_env, _env.TARGET) then
				if not global.MARKED(_env, "MASTER_ZhaoHuan")(_env, _env.TARGET) then
					_env.count = #global.SelectBuffs(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE", "STEALABLE"))

					for count1 = 0, _env.count do
						local buffeft1 = global.NumericEffect(_env, "+critrate", {
							"+Normal",
							"+Normal"
						}, 0.08)

						global.ApplyBuff(_env, _env.ACTOR, {
							duration = 99,
							group = "Skill_YSLBin_Unique_EX",
							timing = 0,
							limit = 5,
							tags = {
								"NUMERIC",
								"BUFF",
								"CRITRATE",
								"DISPELLABLE",
								"STEALABLE"
							}
						}, {
							buffeft1
						})
					end

					global.StealBuff(_env, _env.TARGET, global.BUFF_MARKED_ALL(_env, "BUFF", "DISPELLABLE", "STEALABLE"), _env.count)
				end
			end

			global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

			local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

			global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
		end)
		exec["@time"]({
			3200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_YSLBin_Passive_EX = {
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

		return this
	end,
	passive1 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.count = 0
		_env.max = 0
		_env.unit = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit1 in global.__iter__(global.EnemyUnits(_env)) do
				if global.MARKED(_env, "MASTER")(_env, unit1) then
					-- Nothing
				elseif _env.max < global.UnitPropGetter(_env, "rp")(_env, unit1) then
					_env.max = global.UnitPropGetter(_env, "rp")(_env, unit1)
					_env.unit = unit1
				end
			end

			if _env.unit then
				global.ApplyRPDamage_ResultCheck(_env, _env.ACTOR, _env.unit, _env.max)
			end

			for _, unit2 in global.__iter__(global.FriendUnits(_env)) do
				_env.count = _env.count + 1
			end

			_env.max = _env.max / _env.count

			for _, unit3 in global.__iter__(global.FriendUnits(_env)) do
				if not global.MARKED(_env, "MASTER")(_env, unit3) then
					global.ApplyRPRecovery(_env, unit3, _env.max)
				end
			end
		end)

		return _env
	end
}

return _M
