local assert = _G.assert

module("pkg")

local all = _M.__all__ or {}
_M.__all__ = all
all.Skill_FEMSi_Normal = {
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
			1200
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

		_env.damageextra = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill1"))
		end)
		exec["@time"]({
			800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")

			if global.PETS(_env, _env.TARGET) then
				local cost = global.UnitPropGetter(_env, "cost")(_env, _env.TARGET)
				local damageextra = 0

				if cost > 2 then
					damageextra = (cost - 3) * 0.2
				end
			end

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)
			damage.val = damage.val * (1 + _env.damageextra)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_FEMSi_Proud = {
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
		this.main = global["[duration]"](this, {
			2000
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

		_env.damageextra = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")

			if global.PETS(_env, _env.TARGET) then
				local cost = global.UnitPropGetter(_env, "cost")(_env, _env.TARGET)
				local damageextra = 0

				if cost > 2 then
					damageextra = (cost - 3) * 0.2

					global.ApplyRPRecovery(_env, _env.ACTOR, (cost - 3) * 5)
				end
			end

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)
			damage.val = damage.val * (1 + _env.damageextra)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_FEMSi_Unique = {
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
			3000
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FEMSi"
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

		_env.damageextra = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")

			if global.PETS(_env, _env.TARGET) then
				local cost = global.UnitPropGetter(_env, "cost")(_env, _env.TARGET)
				local damageextra = 0

				if cost > 2 then
					damageextra = (cost - 3) * 0.2
					local buffeft1 = global.NumericEffect(_env, "+critrate", {
						"+Normal",
						"+Normal"
					}, (cost - 2) * 0.1 * (1 + global.NumBuffStrgFactor(_env, attacker)))
					local buffeft2 = global.NumericEffect(_env, "+critstrg", {
						"+Normal",
						"+Normal"
					}, (cost - 2) * 0.1 * (1 + global.NumBuffStrgFactor(_env, attacker)))

					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 2,
						duration = 1,
						display = "CritRateUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"ATKUP",
							"CRITRATEUP",
							"CRITSTRGUP",
							"DISPELLABLE"
						}
					}, {
						buffeft1,
						buffeft2
					})
				end
			end

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)
			damage.val = damage.val * (1 + _env.damageextra)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_FEMSi_Passive = {
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
			0
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
all.Skill_FEMSi_Proud_EX = {
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
		this.main = global["[duration]"](this, {
			2000
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

		_env.damageextra = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill2"))
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")

			if global.PETS(_env, _env.TARGET) then
				local cost = global.UnitPropGetter(_env, "cost")(_env, _env.TARGET)
				local damageextra = 0

				if cost > 2 then
					damageextra = (cost - 3) * 0.2

					global.ApplyRPRecovery(_env, _env.ACTOR, (cost - 3) * 5)
				end
			end

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)
			damage.val = damage.val * (1 + _env.damageextra)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_FEMSi_Unique_EX = {
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
			3000
		}, main)
		this.main = global["[cut_in]"](this, {
			"1#Hero_Unique_FEMSi"
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

		_env.damageextra = 0

		exec["@time"]({
			0
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global

			global.AssignRoles(_env, _env.TARGET, "target")
			global.GroundEft(_env, _env.ACTOR, "BGEffectBlack")
			global.Focus(_env, _env.ACTOR, global.FixedPos(_env, 0, 0, 2), 1.1, 80)
			global.Perform(_env, _env.ACTOR, global.CreateSkillAnimation(_env, global.UnitPos(_env, _env.TARGET) + {
				-1.7,
				0
			}, 100, "skill3"))
			global.HarmTargetView(_env, {
				_env.TARGET
			})
		end)
		exec["@time"]({
			1800
		}, _env, function (_env)
			local this = _env.this
			local global = _env.global
			local attacker = global.LoadUnit(_env, _env.ACTOR, "ATTACKER")
			local defender = global.LoadUnit(_env, _env.TARGET, "DEFENDER")

			if global.PETS(_env, _env.TARGET) then
				local cost = global.UnitPropGetter(_env, "cost")(_env, _env.TARGET)
				local damageextra = 0

				if cost > 2 then
					damageextra = (cost - 3) * 0.2
					local buffeft1 = global.NumericEffect(_env, "+critrate", {
						"+Normal",
						"+Normal"
					}, (cost - 2) * 0.1 * (1 + global.NumBuffStrgFactor(_env, attacker)))
					local buffeft2 = global.NumericEffect(_env, "+critstrg", {
						"+Normal",
						"+Normal"
					}, (cost - 2) * 0.1 * (1 + global.NumBuffStrgFactor(_env, attacker)))

					global.ApplyBuff(_env, _env.ACTOR, {
						timing = 2,
						duration = 1,
						display = "CritRateUp",
						tags = {
							"NUMERIC",
							"BUFF",
							"ATKUP",
							"CRITRATEUP",
							"CRITSTRGUP",
							"DISPELLABLE"
						}
					}, {
						buffeft1,
						buffeft2
					})
				end
			end

			local damage = global.EvalDamage(_env, attacker, defender, this.dmgFactor)

			global.ApplyDazeEffect(_env, _env.ACTOR, _env.TARGET)
			global.ApplyDelRPEffect(_env, _env.ACTOR, _env.TARGET)

			damage = global.CheckCtrlExDmg(_env, _env.ACTOR, _env.TARGET, damage)
			damage.val = damage.val * (1 + _env.damageextra)

			global.ApplyHPDamage(_env, _env.TARGET, damage)
		end)

		return _env
	end
}
all.Skill_FEMSi_Passive_EX = {
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
			0
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

return _M
