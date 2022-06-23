local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_SP_WTXXuan_Normal = {
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
			1167
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

			if global.INSTATUS(_env, "SP_WTXXuan_Benti")(_env, _env.ACTOR) then
				_env.units = global.RandomN(_env, 2, global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR)))

				global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill1"))
			else
				if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "SummonedCBJun_attack")) == 0 then
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
						-1.1,
						0
					}, 100, "skill1_1"))
				else
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
						-1,
						0
					}, 100, "skill1"))
				end

				global.AssignRoles(_env, _env.TARGET, "target")
			end
		end)
		exec["@time"]({
			467
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "SP_WTXXuan_Benti")(_env, _env.ACTOR) then
				for _, unit in global.__iter__(_env.units) do
					local buffeft1 = global.Diligent(_env)
					local buffeft2 = global.RageGainEffect(_env, "-", {
						"+Normal",
						"+Normal"
					}, 1)

					global.ApplyBuff(_env, unit, {
						timing = 2,
						duration = 1,
						tags = {
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1,
						buffeft2
					})
				end
			else
				global.ApplyStatusEffect(_env, _env.ACTOR, _env.TARGET)
				global.ApplyRPEffect(_env, _env.ACTOR, _env.TARGET)

				local damage = global.EvalDamage_FlagCheck(_env, _env.ACTOR, _env.TARGET, this.dmgFactor)

				global.ApplyHPDamage_ResultCheck(_env, _env.ACTOR, _env.TARGET, damage)
			end
		end)
		exec["@time"]({
			567
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "SP_WTXXuan_Benti")(_env, _env.ACTOR) then
				global.DiligentRound(_env, 100)
			end
		end)

		return _env
	end
}
all.Skill_SP_WTXXuan_Proud = {
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
			1400
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_WTXXuan"
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.RandomN(_env, 2, global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR)))

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
		end)
		exec["@time"]({
			1167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local buffeft1 = global.Diligent(_env)
				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft3 = global.NumericEffect(_env, "+exskillrate", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 1,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				})
			end
		end)
		exec["@time"]({
			1267
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DiligentRound(_env, 100)
		end)

		return _env
	end
}
all.Skill_SP_WTXXuan_Unique = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Quantity = externs.Quantity

		if this.Quantity == nil then
			this.Quantity = 2
		end

		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_WTXXuan"
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

			global.GroundEft(_env, _env.ACTOR, "Ground_SP_WTXXuan")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			_env.units = global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))

			global.HealTargetView(_env, _env.units)
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for i = 1, this.Quantity do
				local RoleModel = {
					"Model_SP_WTXXuan_CBJun_1",
					"Model_SP_WTXXuan_CBJun_2",
					"Model_SP_WTXXuan_CBJun_3",
					"Model_SP_WTXXuan_CBJun_4"
				}
				local num = global.Random(_env, 1, 4)

				if global.GetUnitCid(_env, _env.ACTOR) == "SP_WTXXuan" then
					global.print(_env, global.GetUnitCid(_env, _env.ACTOR), "=====")

					local card = global.InheritCardByConfig(_env, {
						cost = 3,
						uniqueSkill = "Skill_SP_WTXXuan_Normal",
						ignorePassive = true,
						card = _env.ACTOR,
						modelId = RoleModel[num]
					})

					if card then
						local buff = global.PassiveFunEffectBuff(_env, "SummonedCBJun_Passive", {
							HealRateFactor = 0,
							master = _env.ACTOR
						})

						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
							duration = 99,
							group = "SummonedCBJun_Passive",
							timing = 0,
							limit = 1,
							tags = {
								"CARDBUFF",
								"SummonedCBJun_Passive",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
						global.ClearCardFlags(_env, card, {
							"SUMMONER"
						})
					end
				else
					for i = 1, this.Quantity do
						local SummonedCBJun = global.Summon(_env, _env.ACTOR, "SummonedCBJun", {
							1,
							1,
							1
						}, nil, {
							global.Random(_env, 1, 9)
						})

						if SummonedCBJun then
							global.AddStatus(_env, SummonedCBJun, "SummonedCBJun")
						end
					end
				end
			end

			local friend_num = 0

			for _, friendunit in global.__iter__(_env.units) do
				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft3 = global.Diligent(_env)

				global.ApplyBuff_Buff(_env, _env.ACTOR, friendunit, {
					timing = 2,
					duration = 1,
					display = "SP_WTXXuan_fire",
					tags = {
						"STATUS",
						"DILIGENT",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2,
					buffeft3
				}, 1)

				friend_num = friend_num + 1
			end

			if friend_num > 5 then
				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "SP_WTXXuan"))) do
					local buffeft1 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.AtkRateFactor)

					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
						timing = 0,
						duration = 99,
						display = "AtkUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"ATKUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})
					global.FlyBallEffect(_env, _env.ACTOR, card)
				end
			end
		end)
		exec["@time"]({
			2700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.DiligentRound(_env, 100)
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_SP_WTXXuan_Passive = {
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.MASTER(_env, _env.ACTOR) then
				global.AddStatus(_env, _env.ACTOR, "SP_WTXXuan_Benti")
			end

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "CARDBUFF", "SummonedCBJun")) == 0 and not global.MASTER(_env, _env.ACTOR) then
				global.AddStatus(_env, _env.ACTOR, "SP_WTXXuan_Benti")

				for _, unit in global.__iter__(global.FriendUnits(_env, global.SUMMONS)) do
					local RoleModel = {
						"Model_SP_WTXXuan_CBJun_1",
						"Model_SP_WTXXuan_CBJun_2",
						"Model_SP_WTXXuan_CBJun_3",
						"Model_SP_WTXXuan_CBJun_4"
					}
					local num = global.Random(_env, 1, 4)
					local card = global.InheritCardByConfig(_env, {
						cost = 3,
						uniqueSkill = "Skill_SP_WTXXuan_Normal",
						ignorePassive = true,
						card = _env.ACTOR,
						modelId = RoleModel[num]
					})

					if card then
						local buff = global.PassiveFunEffectBuff(_env, "SummonedCBJun_Passive", {
							HealRateFactor = 0,
							master = _env.ACTOR
						})

						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
							duration = 99,
							group = "SummonedCBJun_Passive",
							timing = 0,
							limit = 1,
							tags = {
								"CARDBUFF",
								"SummonedCBJun",
								"SummonedCBJun_Passive",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
						global.ClearCardFlags(_env, card, {
							"SUMMONER"
						})
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_SP_WTXXuan_Passive_Key = {
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
			"UNIT_BEFORE_ACTION"
		}, passive1)
		local passive2 = __action(this, {
			name = "passive2",
			entry = prototype.passive2
		})
		passive2 = global["[duration]"](this, {
			0
		}, passive2)
		this.passive2 = global["[trigger_by]"](this, {
			"UNIT_AFTER_ACTION"
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
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MASTER(_env, _env.ACTOR) and global.SUMMONS(_env, _env.unit) then
				local buff = global.SpecialNumericEffect(_env, "+SP_WTXXuan_DoubleDamage", {
					"?Normal"
				}, 2)

				global.ApplyBuff(_env, _env.unit, {
					timing = 0,
					duration = 99,
					tags = {
						"STATUS",
						"BUFF",
						"SP_WTXXuan_Passive",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buff
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

			if global.GetSide(_env, _env.unit) == global.GetSide(_env, _env.ACTOR) and global.MASTER(_env, _env.ACTOR) and global.SUMMONS(_env, _env.unit) then
				global.DispelBuff(_env, _env.unit, global.BUFF_MARKED_ALL(_env, "STATUS", "BUFF", "SP_WTXXuan_Passive"), 99)
			end
		end)

		return _env
	end
}
all.SummonedCBJun_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.HealRateFactor = externs.HealRateFactor

		assert(this.HealRateFactor ~= nil, "External variable `HealRateFactor` is not provided.")

		this.master = externs.master

		assert(this.master ~= nil, "External variable `master` is not provided.")

		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			200
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
			"SELF:HURTED"
		}, passive2)
		local passive3 = __action(this, {
			name = "passive3",
			entry = prototype.passive3
		})
		passive3 = global["[duration]"](this, {
			0
		}, passive3)
		this.passive3 = global["[trigger_by]"](this, {
			"SELF:BEFORE_UNIQUE"
		}, passive3)
		local passive4 = __action(this, {
			name = "passive4",
			entry = prototype.passive4
		})
		passive4 = global["[duration]"](this, {
			0
		}, passive4)
		this.passive4 = global["[trigger_by]"](this, {
			"SELF:BEFORE_ACTION"
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
			local buffeft2 = global.RageGainEffect(_env, "-", {
				"+Normal",
				"+Normal"
			}, 2)
			local buffeft3 = global.NumericEffect(_env, "-exskillrate", {
				"+Normal",
				"+Normal"
			}, 2)

			global.ApplyBuff(_env, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft2,
				buffeft3
			})
			global.MarkSummoned(_env, _env.ACTOR, true)
			global.AddStatus(_env, _env.ACTOR, "SP_WTXXuan_CBJun")
			global.SetSummoner(_env, _env.ACTOR, this.master)

			if this.HealRateFactor and this.HealRateFactor ~= 0 then
				local heal = global.EvalRecovery_FlagCheck(_env, _env.ACTOR, global.FriendMaster(_env), this.HealRateFactor, 0)

				global.ApplyHPRecovery_ResultCheck(_env, _env.ACTOR, global.FriendMaster(_env), heal)
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

			global.KillTarget(_env, _env.ACTOR)
		end)

		return _env
	end,
	passive3 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "SP_WTXXuan_CBJun")(_env, _env.ACTOR) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "SummonedCBJun_attack")) == 0 then
				global.ApplyRealDamage(_env, _env.ACTOR, _env.primTrgt, 1, 1, 4)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"SummonedCBJun_attack"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end,
	passive4 = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.primTrgt = externs.primTrgt

		assert(_env.primTrgt ~= nil, "External variable `primTrgt` is not provided.")
		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			if global.INSTATUS(_env, "SP_WTXXuan_CBJun")(_env, _env.ACTOR) and global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED(_env, "SummonedCBJun_attack")) == 0 then
				global.ApplyRealDamage(_env, _env.ACTOR, _env.primTrgt, 1, 1, 4)

				local buffeft2 = global.NumericEffect(_env, "+defrate", {
					"+Normal",
					"+Normal"
				}, 0)

				global.ApplyBuff(_env, _env.ACTOR, {
					timing = 0,
					duration = 99,
					tags = {
						"SummonedCBJun_attack"
					}
				}, {
					buffeft2
				})
			end
		end)

		return _env
	end
}
all.Skill_SP_WTXXuan_Proud_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.RageFactor = externs.RageFactor

		if this.RageFactor == nil then
			this.RageFactor = 200
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			1400
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_SP_WTXXuan"
		}, main)

		return this
	end,
	main = function (_env, externs)
		local this = _env.this
		local global = _env.global
		local exec = _env["$executor"]
		_env.ACTOR = externs.ACTOR

		assert(_env.ACTOR ~= nil, "External variable `ACTOR` is not provided.")

		_env.units = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.RandomN(_env, 2, global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR)))

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill2"))
		end)
		exec["@time"]({
			1167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				local buffeft1 = global.Diligent(_env)
				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft3 = global.NumericEffect(_env, "+exskillrate", {
					"+Normal",
					"+Normal"
				}, 1)

				global.ApplyBuff(_env, unit, {
					timing = 2,
					duration = 1,
					tags = {
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft1,
					buffeft2,
					buffeft3
				})
			end

			global.DiligentRound(_env, 100)
			global.ApplyRPRecovery(_env, _env.ACTOR, this.RageFactor)
		end)

		return _env
	end
}
all.Skill_SP_WTXXuan_Unique_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Quantity = externs.Quantity

		if this.Quantity == nil then
			this.Quantity = 3
		end

		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.45
		end

		this.CostFactor = externs.CostFactor

		if this.CostFactor == nil then
			this.CostFactor = 1
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_WTXXuan"
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

			global.GroundEft(_env, _env.ACTOR, "Ground_SP_WTXXuan")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			_env.units = global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))

			global.HealTargetView(_env, _env.units)
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for i = 1, this.Quantity do
				local RoleModel = {
					"Model_SP_WTXXuan_CBJun_1",
					"Model_SP_WTXXuan_CBJun_2",
					"Model_SP_WTXXuan_CBJun_3",
					"Model_SP_WTXXuan_CBJun_4"
				}
				local num = global.Random(_env, 1, 4)

				if global.GetUnitCid(_env, _env.ACTOR) == "SP_WTXXuan" then
					local card = global.InheritCardByConfig(_env, {
						cost = 3,
						uniqueSkill = "Skill_SP_WTXXuan_Normal",
						ignorePassive = true,
						card = _env.ACTOR,
						modelId = RoleModel[num]
					})

					if card then
						local buff = global.PassiveFunEffectBuff(_env, "SummonedCBJun_Passive", {
							HealRateFactor = 2.5,
							master = _env.ACTOR
						})

						global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
							duration = 99,
							group = "SummonedCBJun_Passive",
							timing = 0,
							limit = 1,
							tags = {
								"CARDBUFF",
								"SummonedCBJun_Passive",
								"UNDISPELLABLE",
								"UNSTEALABLE"
							}
						}, {
							buff
						})
						global.ClearCardFlags(_env, card, {
							"SUMMONER"
						})
					end
				else
					local SummonedCBJun = global.Summon(_env, _env.ACTOR, "SummonedCBJun", {
						1,
						1,
						1
					}, nil, {
						global.Random(_env, 1, 9)
					})

					if SummonedCBJun then
						global.AddStatus(_env, SummonedCBJun, "SummonedCBJun")
					end
				end
			end

			local friend_num = 0

			for _, friendunit in global.__iter__(_env.units) do
				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft3 = global.Diligent(_env)

				global.ApplyBuff_Buff(_env, _env.ACTOR, friendunit, {
					timing = 2,
					duration = 1,
					display = "SP_WTXXuan_fire",
					tags = {
						"STATUS",
						"DILIGENT",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2,
					buffeft3
				}, 1)

				friend_num = friend_num + 1
			end

			global.DiligentRound(_env, 100)

			if friend_num > 5 and global.GetUnitCid(_env, _env.ACTOR) == "SP_WTXXuan" then
				for _, card in global.__iter__(global.CardsInWindow(_env, global.GetOwner(_env, _env.ACTOR), global.CARD_HERO_MARKED(_env, "SP_WTXXuan"))) do
					local buffeft1 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.AtkRateFactor)

					global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
						timing = 0,
						duration = 99,
						display = "AtkUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"ATKUP",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						buffeft1
					})

					local cardvaluechange = global.CardCostEnchant(_env, "-", this.CostFactor, 1)

					global.ApplyEnchant(_env, global.GetOwner(_env, _env.ACTOR), card, {
						tags = {
							"CARDBUFF",
							"SummonedCBJun",
							"UNDISPELLABLE"
						}
					}, {
						cardvaluechange
					})
					global.FlyBallEffect(_env, _env.ACTOR, card)
				end
			end
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_SP_WTXXuan_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.25
		end

		this.HealRateFactor = externs.HealRateFactor

		if this.HealRateFactor == nil then
			this.HealRateFactor = 2.5
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

			if global.SelectBuffCount(_env, _env.ACTOR, global.BUFF_MARKED_ALL(_env, "CARDBUFF", "SummonedCBJun")) == 0 and not global.MASTER(_env, _env.ACTOR) and global.GetUnitCid(_env, _env.ACTOR) == "SP_WTXXuan" then
				global.AddStatus(_env, _env.ACTOR, "SP_WTXXuan_Benti")

				for _, unit in global.__iter__(global.FriendUnits(_env, global.SUMMONS)) do
					local RoleModel = {
						"Model_SP_WTXXuan_CBJun_1",
						"Model_SP_WTXXuan_CBJun_2",
						"Model_SP_WTXXuan_CBJun_3",
						"Model_SP_WTXXuan_CBJun_4"
					}
					local num = global.Random(_env, 1, 4)

					if global.GetUnitCid(_env, _env.ACTOR) ~= "SP_WTXXuan" then
						local SummonedCBJun = global.Summon(_env, _env.ACTOR, "SummonedCBJun", {
							1,
							1,
							1
						}, nil, {
							global.Random(_env, 1, 9)
						})

						if SummonedCBJun then
							global.AddStatus(_env, SummonedCBJun, "SummonedCBJun")
						end
					else
						local card = global.InheritCardByConfig(_env, {
							cost = 3,
							uniqueSkill = "Skill_SP_WTXXuan_Normal",
							ignorePassive = true,
							card = _env.ACTOR,
							modelId = RoleModel[num]
						})

						if card then
							local buffeft1 = global.NumericEffect(_env, "+atkrate", {
								"+Normal",
								"+Normal"
							}, this.AtkRateFactor)

							global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
								timing = 0,
								duration = 99,
								tags = {
									"UNDISPELLABLE",
									"UNSTEALABLE"
								}
							}, {
								buffeft1
							})

							local buff = global.PassiveFunEffectBuff(_env, "SummonedCBJun_Passive", {
								HealRateFactor = this.HealRateFactor,
								master = _env.ACTOR
							})

							global.ApplyHeroCardBuff(_env, global.GetOwner(_env, _env.ACTOR), card, {
								duration = 99,
								group = "SummonedCBJun_Passive",
								timing = 0,
								limit = 1,
								tags = {
									"CARDBUFF",
									"SummonedCBJun_Passive",
									"UNDISPELLABLE",
									"UNSTEALABLE"
								}
							}, {
								buff
							})
							global.ClearCardFlags(_env, card, {
								"SUMMONER"
							})
						end
					end
				end
			end
		end)

		return _env
	end
}
all.Skill_SP_WTXXuan_Unique_Activity = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.Quantity = externs.Quantity

		if this.Quantity == nil then
			this.Quantity = 2
		end

		this.AtkRateFactor = externs.AtkRateFactor

		if this.AtkRateFactor == nil then
			this.AtkRateFactor = 0.3
		end

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			3167
		}, main)
		this.main = global["[cut_in]"](this, {
			"2#Hero_Unique_SP_WTXXuan"
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

			global.GroundEft(_env, _env.ACTOR, "Ground_SP_WTXXuan")
			global.EnergyRestrain(_env, _env.ACTOR, _env.TARGET)
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.FixedPos(_env, 0, 0, 2), 100, "skill3"))

			_env.units = global.FriendUnits(_env, -global.ONESELF(_env, _env.ACTOR))

			global.HealTargetView(_env, _env.units)
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for i = 1, this.Quantity do
				local SummonedCBJun = global.Summon(_env, _env.ACTOR, "SummonedCBJun", {
					1,
					1,
					1
				}, nil, {
					global.Random(_env, 1, 9)
				})

				if SummonedCBJun then
					global.AddStatus(_env, SummonedCBJun, "SummonedCBJun")
				end
			end

			local friend_num = 0

			for _, friendunit in global.__iter__(_env.units) do
				local buffeft2 = global.RageGainEffect(_env, "-", {
					"+Normal",
					"+Normal"
				}, 1)
				local buffeft3 = global.Diligent(_env)

				global.ApplyBuff_Buff(_env, _env.ACTOR, friendunit, {
					timing = 2,
					duration = 1,
					display = "SP_WTXXuan_fire",
					tags = {
						"STATUS",
						"DILIGENT",
						"UNDISPELLABLE",
						"UNSTEALABLE"
					}
				}, {
					buffeft2,
					buffeft3
				}, 1)

				friend_num = friend_num + 1
			end

			global.DiligentRound(_env, 100)

			if friend_num > 5 then
				for _, unit in global.__iter__(global.FriendUnits(_env, global.MARKED(_env, "CBJun"))) do
					local buffeft1 = global.NumericEffect(_env, "+atkrate", {
						"+Normal",
						"+Normal"
					}, this.AtkRateFactor)

					global.ApplyBuff(_env, unit, {
						timing = 2,
						duration = 99,
						display = "SP_WTXXuan_fire",
						tags = {
							"STATUS",
							"DILIGENT",
							"UNDISPELLABLE",
							"UNSTEALABLE"
						}
					}, {
						global.buffeft2,
						global.buffeft3
					}, 1)
				end
			end
		end)
		exec["@time"]({
			3000
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}

return _M
