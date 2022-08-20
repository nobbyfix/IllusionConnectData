local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_ZZBBWei_Normal = {
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
			4300
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
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.5,
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
		end)
		exec["@time"]({
			900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor1")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				if global.IsAlive(_env, _env.TARGET) then
					global.CancelTargetView(_env)
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				else
					local result = true

					for _, unit in global.__iter__(_env.units) do
						result = result and not global.IsAlive(_env, unit)
					end

					if result == true then
						global.Stop(_env)
					else
						global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
						global.HarmTargetView(_env, _env.units)

						for _, unit in global.__iter__(_env.units) do
							global.AssignRoles(_env, unit, "target")
						end
					end
				end
			else
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ExdmgFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor1")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					ExdmgFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			2500
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor2")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				if global.IsAlive(_env, _env.TARGET) then
					global.CancelTargetView(_env)
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				else
					local result = true

					for _, unit in global.__iter__(_env.units) do
						result = result and not global.IsAlive(_env, unit)
					end

					if result == true then
						global.Stop(_env)
					else
						global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
						global.HarmTargetView(_env, _env.units)

						for _, unit in global.__iter__(_env.units) do
							global.AssignRoles(_env, unit, "target")
						end
					end
				end
			else
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			3600
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ExdmgFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor2")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					ExdmgFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)

		return _env
	end
}
all.Skill_ZZBBWei_Proud = {
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
			4367
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_ZZBBWei"
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
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.5,
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
		exec["@time"]({
			1167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor1")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				if global.IsAlive(_env, _env.TARGET) then
					global.CancelTargetView(_env)
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				else
					local result = true

					for _, unit in global.__iter__(_env.units) do
						result = result and not global.IsAlive(_env, unit)
					end

					if result == true then
						global.Stop(_env)
					else
						global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
						global.HarmTargetView(_env, _env.units)

						for _, unit in global.__iter__(_env.units) do
							global.AssignRoles(_env, unit, "target")
						end
					end
				end
			else
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			2067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ExdmgFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor1")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					ExdmgFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			2767
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor2")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				if global.IsAlive(_env, _env.TARGET) then
					global.CancelTargetView(_env)
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				else
					local result = true

					for _, unit in global.__iter__(_env.units) do
						result = result and not global.IsAlive(_env, unit)
					end

					if result == true then
						global.Stop(_env)
					else
						global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
						global.HarmTargetView(_env, _env.units)

						for _, unit in global.__iter__(_env.units) do
							global.AssignRoles(_env, unit, "target")
						end
					end
				end
			else
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			3667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ExdmgFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor2")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					ExdmgFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)

		return _env
	end
}
all.Skill_ZZBBWei_Unique = {
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

		this.DazeRateFactor = externs.DazeRateFactor

		assert(this.DazeRateFactor ~= nil, "External variable `DazeRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			5400
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_ZZBBWei"
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

		_env.untis = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				local buffeft1 = global.Daze(_env)
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local defender = global.LoadUnit(_env, unit, "DEFENDER")
				local prob = global.EvalProb1(_env, attacker, defender, this.DazeRateFactor, 0)

				if global.ProbTest(_env, prob) then
					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 2,
						duration = 1,
						display = "Daze",
						tags = {
							"STATUS",
							"DEBUFF",
							"DAZE",
							"ABNORMAL",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
				end
			end
		end)
		exec["@time"]({
			2400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor1")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				global.CancelTargetView(_env)

				local result = true

				for _, unit in global.__iter__(_env.units) do
					result = result and not global.IsAlive(_env, unit)
				end

				if result == true then
					global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
					global.Stop(_env)
				else
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				end
			else
				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			3200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local DmgRateFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor1")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					DmgRateFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			3900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor2")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				global.CancelTargetView(_env)

				local result = true

				for _, unit in global.__iter__(_env.units) do
					result = result and not global.IsAlive(_env, unit)
				end

				if result == true then
					global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
					global.Stop(_env)
				else
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				end
			else
				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			4700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local DmgRateFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor2")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					DmgRateFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			5400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_ZZBBWei_Passive = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ProbRateFactor1 = externs.ProbRateFactor1

		assert(this.ProbRateFactor1 ~= nil, "External variable `ProbRateFactor1` is not provided.")

		this.ProbRateFactor2 = externs.ProbRateFactor2

		assert(this.ProbRateFactor2 ~= nil, "External variable `ProbRateFactor2` is not provided.")

		this.DmgRateFactor1 = externs.DmgRateFactor1

		assert(this.DmgRateFactor1 ~= nil, "External variable `DmgRateFactor1` is not provided.")

		this.DmgRateFactor2 = externs.DmgRateFactor2

		assert(this.DmgRateFactor2 ~= nil, "External variable `DmgRateFactor2` is not provided.")

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+ChainProbRateFactor1", {
				"?Normal"
			}, this.ProbRateFactor1)
			local buffeft2 = global.SpecialNumericEffect(_env, "+ChainProbRateFactor2", {
				"?Normal"
			}, this.ProbRateFactor2)
			local buffeft3 = global.SpecialNumericEffect(_env, "+ChainDmgRateFactor1", {
				"?Normal"
			}, this.DmgRateFactor1)
			local buffeft4 = global.SpecialNumericEffect(_env, "+ChainDmgRateFactor2", {
				"?Normal"
			}, this.DmgRateFactor2)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"Skill_ZZBBWei_Passive",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2,
				buffeft3,
				buffeft4
			}, 1, 0)
		end)

		return _env
	end
}
all.Skill_ZZBBWei_Proud_EX = {
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

		this.DazeRateFactor = externs.DazeRateFactor

		assert(this.DazeRateFactor ~= nil, "External variable `DazeRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			4367
		}, main)
		this.main = global["[proud]"](this, {
			"Hero_Proud_ZZBBWei"
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
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.5,
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

			local buffeft1 = global.Daze(_env)
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")
			local prob = global.EvalProb1(_env, attacker, defender, this.DazeRateFactor, 0)

			if global.ProbTest(_env, prob) then
				global.ApplyBuff_Debuff(_env, _env.ACTOR, _env.TARGET, {
					timing = 2,
					duration = 1,
					display = "Daze",
					tags = {
						"STATUS",
						"DEBUFF",
						"DAZE",
						"ABNORMAL",
						"DISPELLABLE"
					}
				}, {
					buffeft1
				}, this.DazeRateFactor, 0)
			end
		end)
		exec["@time"]({
			1167
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor1")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				if global.IsAlive(_env, _env.TARGET) then
					global.CancelTargetView(_env)
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				else
					local result = true

					for _, unit in global.__iter__(_env.units) do
						result = result and not global.IsAlive(_env, unit)
					end

					if result == true then
						global.Stop(_env)
					else
						global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
						global.HarmTargetView(_env, _env.units)

						for _, unit in global.__iter__(_env.units) do
							global.AssignRoles(_env, unit, "target")
						end
					end
				end
			else
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			2067
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ExdmgFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor1")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					ExdmgFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			2767
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor2")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				if global.IsAlive(_env, _env.TARGET) then
					global.CancelTargetView(_env)
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				else
					local result = true

					for _, unit in global.__iter__(_env.units) do
						result = result and not global.IsAlive(_env, unit)
					end

					if result == true then
						global.Stop(_env)
					else
						global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
						global.HarmTargetView(_env, _env.units)

						for _, unit in global.__iter__(_env.units) do
							global.AssignRoles(_env, unit, "target")
						end
					end
				end
			else
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			3667
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local ExdmgFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor2")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					ExdmgFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)

		return _env
	end
}
all.Skill_ZZBBWei_Unique_EX = {
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

		this.DazeRateFactor = externs.DazeRateFactor

		assert(this.DazeRateFactor ~= nil, "External variable `DazeRateFactor` is not provided.")

		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			5400
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_ZZBBWei"
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

		_env.untis = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)

				local buffeft1 = global.Daze(_env)
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local defender = global.LoadUnit(_env, unit, "DEFENDER")
				local prob = global.EvalProb1(_env, attacker, defender, this.DazeRateFactor, 0)

				if global.ProbTest(_env, prob) then
					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 2,
						duration = 1,
						display = "Daze",
						tags = {
							"STATUS",
							"DEBUFF",
							"DAZE",
							"ABNORMAL",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
				end
			end
		end)
		exec["@time"]({
			2400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor1")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				global.CancelTargetView(_env)

				local result = true

				for _, unit in global.__iter__(_env.units) do
					result = result and not global.IsAlive(_env, unit)
				end

				if result == true then
					global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
					global.Stop(_env)
				else
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				end
			else
				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			3200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local DmgRateFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor1")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					DmgRateFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			3900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor2")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				global.CancelTargetView(_env)

				local result = true

				for _, unit in global.__iter__(_env.units) do
					result = result and not global.IsAlive(_env, unit)
				end

				if result == true then
					global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
					global.Stop(_env)
				else
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				end
			else
				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			4700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local DmgRateFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor2")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					DmgRateFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			5400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
	end
}
all.Skill_ZZBBWei_Passive_EX = {
	__new__ = function (prototype, externs, global)
		local __function = global.__skill_function__
		local __action = global.__skill_action__
		local this = global.__skill({
			global = global
		}, prototype, externs)
		this.ProbRateFactor1 = externs.ProbRateFactor1

		assert(this.ProbRateFactor1 ~= nil, "External variable `ProbRateFactor1` is not provided.")

		this.ProbRateFactor2 = externs.ProbRateFactor2

		assert(this.ProbRateFactor2 ~= nil, "External variable `ProbRateFactor2` is not provided.")

		this.DmgRateFactor1 = externs.DmgRateFactor1

		assert(this.DmgRateFactor1 ~= nil, "External variable `DmgRateFactor1` is not provided.")

		this.DmgRateFactor2 = externs.DmgRateFactor2

		assert(this.DmgRateFactor2 ~= nil, "External variable `DmgRateFactor2` is not provided.")

		this.CritRateFactor = externs.CritRateFactor

		assert(this.CritRateFactor ~= nil, "External variable `CritRateFactor` is not provided.")

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
			local buffeft1 = global.SpecialNumericEffect(_env, "+ChainProbRateFactor1", {
				"?Normal"
			}, this.ProbRateFactor1)
			local buffeft2 = global.SpecialNumericEffect(_env, "+ChainProbRateFactor2", {
				"?Normal"
			}, this.ProbRateFactor2)
			local buffeft3 = global.SpecialNumericEffect(_env, "+ChainDmgRateFactor1", {
				"?Normal"
			}, this.DmgRateFactor1)
			local buffeft4 = global.SpecialNumericEffect(_env, "+ChainDmgRateFactor2", {
				"?Normal"
			}, this.DmgRateFactor2)
			local buffeft5 = global.NumericEffect(_env, "+critrate", {
				"+Normal",
				"+Normal"
			}, this.CritRateFactor)

			global.ApplyBuff_Buff(_env, _env.ACTOR, _env.ACTOR, {
				timing = 0,
				duration = 99,
				tags = {
					"STATUS",
					"NUMERIC",
					"BUFF",
					"Skill_ZZBBWei_Passive_EX",
					"UNDISPELLABLE",
					"UNSTEALABLE"
				}
			}, {
				buffeft1,
				buffeft2,
				buffeft3,
				buffeft4,
				buffeft5
			}, 1, 0)
		end)

		return _env
	end
}
all.Skill_ZZBBWei_Unique_SelfAwaken = {
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

		this.DazeRateFactor = externs.DazeRateFactor

		assert(this.DazeRateFactor ~= nil, "External variable `DazeRateFactor` is not provided.")

		this.flag = 0
		local main = __action(this, {
			name = "main",
			entry = prototype.main
		})
		main = global["[duration]"](this, {
			5400
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_ZZBBWei"
		}, main)
		local passive1 = __action(this, {
			name = "passive1",
			entry = prototype.passive1
		})
		passive1 = global["[duration]"](this, {
			4367
		}, passive1)
		this.passive1 = global["[trigger_by]"](this, {
			"SELF:AFTER_UNIQUE"
		}, passive1)

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

		_env.untis = nil

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.print(_env, "运行")

			_env.units = global.EnemyUnits(_env, global.COL_OF(_env, _env.TARGET))

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
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
			global.HarmTargetView(_env, _env.units)

			for _, unit in global.__iter__(_env.units) do
				global.AssignRoles(_env, unit, "target")
			end
		end)
		exec["@time"]({
			1700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, this.dmgFactor)

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
				global.SelfEX_ASSASSIN_OneStage_Break(_env, _env.ACTOR, unit)

				local buffeft1 = global.Daze(_env)
				local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
				local defender = global.LoadUnit(_env, unit, "DEFENDER")
				local prob = global.EvalProb1(_env, attacker, defender, this.DazeRateFactor, 0)

				if global.ProbTest(_env, prob) then
					global.ApplyBuff_Debuff(_env, _env.ACTOR, unit, {
						timing = 2,
						duration = 1,
						display = "Daze",
						tags = {
							"STATUS",
							"DEBUFF",
							"DAZE",
							"ABNORMAL",
							"DISPELLABLE"
						}
					}, {
						buffeft1
					}, 1, 0)
				end
			end
		end)
		exec["@time"]({
			2400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor1")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				global.CancelTargetView(_env)

				this.flag = 1
				local result = true

				for _, unit in global.__iter__(_env.units) do
					result = result and not global.IsAlive(_env, unit)
				end

				if result == true then
					global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
					global.Stop(_env)

					this.flag = 2
				else
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				end
			else
				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			3200
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local DmgRateFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor1")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					DmgRateFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			3900
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local prob = global.SpecialPropGetter(_env, "ChainProbRateFactor2")(_env, _env.ACTOR)

			if global.ProbTest(_env, prob) then
				global.CancelTargetView(_env)

				local result = true

				for _, unit in global.__iter__(_env.units) do
					result = result and not global.IsAlive(_env, unit)
				end

				if result == true then
					global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
					global.Stop(_env)
				else
					global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET, 0, nil), 100, "skill3"))
					global.HarmTargetView(_env, _env.units)

					for _, unit in global.__iter__(_env.units) do
						global.AssignRoles(_env, unit, "target")
					end
				end
			else
				global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
				global.Stop(_env)
			end
		end)
		exec["@time"]({
			4700
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local DmgRateFactor = global.SpecialPropGetter(_env, "ChainDmgRateFactor2")(_env, _env.ACTOR)

			for _, unit in global.__iter__(_env.units) do
				global.ApplyStatusEffect(_env, _env.ACTOR, unit)
				global.ApplyRPEffect(_env, _env.ACTOR, unit)

				local damage = global.EvalAOEDamage_FlagCheck(_env, _env.ACTOR, unit, {
					1,
					DmgRateFactor,
					0
				})

				global.ApplyAOEHPDamage_ResultCheck(_env, _env.ACTOR, unit, damage)
			end
		end)
		exec["@time"]({
			5400
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.EnergyRestrainStop(_env, _env.ACTOR, _env.TARGET)
		end)

		return _env
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

			if this.flag == 0 or this.flag == 2 and global.IsAlive(_env, global.EnemyMaster(_env)) then
				global.SelfEX_ASSASSIN_OneStage_Double(_env, _env.ACTOR)
			end
		end)

		return _env
	end
}

return _M
