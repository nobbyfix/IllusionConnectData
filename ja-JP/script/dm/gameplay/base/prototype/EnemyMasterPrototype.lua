EnemyMasterPrototype = class("EnemyMasterPrototype", objectlua.Object, _M)

EnemyMasterPrototype:has("_config", {
	is = "r"
})

function EnemyMasterPrototype:initialize(eneryId)
	super.initialize(self)

	self._config = ConfigReader:getRecordById("EnemyMaster", eneryId)
end

function EnemyMasterPrototype:getMasterData()
	if self._masterData then
		return self._masterData
	end

	local level = self._config.Level
	local skillLevel = math.min(level, 10)
	local skills = {}
	local normalSkillId = self._config.AttackSkill

	if self:checkSkillIdIsNone(normalSkillId) then
		skills.normal = {
			skillId = normalSkillId,
			level = skillLevel
		}
	end

	local masterSkill1 = self._config.MasterSkill1

	if self:checkSkillIdIsNone(masterSkill1) then
		skills.master1 = {
			skillId = masterSkill1,
			level = skillLevel
		}
	end

	local masterSkill2 = self._config.MasterSkill2

	if self:checkSkillIdIsNone(masterSkill2) then
		skills.master2 = {
			skillId = masterSkill2,
			level = skillLevel
		}
	end

	local masterSkill3 = self._config.MasterSkill3

	if self:checkSkillIdIsNone(masterSkill3) then
		skills.master3 = {
			skillId = masterSkill3,
			level = skillLevel
		}
	end

	local passiveSkillConfig = self._config.PassiveSkill
	local passive = {}

	for i = 1, #passiveSkillConfig do
		local skillId = passiveSkillConfig[i]

		if self:checkSkillIdIsNone(skillId) then
			passive[#passive + 1] = {
				skillId = skillId,
				level = skillLevel
			}
		end
	end

	passive[#passive + 1] = {
		level = 1,
		skillId = "Fight_MaxCostBuff"
	}

	if #passive > 0 then
		skills.passive = passive
	end

	local normalSkillId = self._config.NormalSkill

	if self:checkSkillIdIsNone(normalSkillId) then
		skills.normal = {
			skillId = normalSkillId,
			level = skillLevel
		}
	end

	local proudSkillId = self._config.ProudSkill

	if self:checkSkillIdIsNone(proudSkillId) then
		skills.proud = {
			skillId = proudSkillId,
			level = skillLevel
		}
	end

	local doubleSkillId = self._config.DoubleSkill

	if self:checkSkillIdIsNone(doubleSkillId) then
		skills.dblhit = {
			skillId = doubleSkillId,
			level = skillLevel
		}
	end

	local counterSkillId = self._config.CounterSkill

	if self:checkSkillIdIsNone(counterSkillId) then
		skills.cntrhit = {
			skillId = counterSkillId,
			level = skillLevel
		}
	end

	local deathSkillId = self._config.DeathSkill

	if self:checkSkillIdIsNone(deathSkillId) then
		skills.death = {
			skillId = deathSkillId,
			level = skillLevel
		}
	end

	local flags = self._config.Flags or {}
	flags[#flags + 1] = "MASTER"

	if self._config.Type then
		local typeFlags = ConfigReader:getDataByNameIdAndKey("ConfigValue", "TypeFlags", "content")[self._config.Type]

		if typeFlags then
			flags[#flags + 1] = typeFlags
		end
	end

	self._masterData = {
		modelId = self._config.RoleModel,
		id = self._config.Id,
		genre = self._config.Type,
		property = self._config.Property,
		flags = flags,
		star = self._config.Star,
		level = level,
		quality = self._config.Quality,
		skills = skills,
		angerRules = self._config.RageRules,
		uncritrate = self._config.UncritRate,
		unhurtrate = self._config.UnhurtRate,
		def = self._config.Defence,
		atkweaken = self._config.AtkWeaken,
		hp = self._config.InitHp and self._config.InitHp * self._config.Hp,
		maxHp = self._config.Hp,
		critstrg = self._config.CritStrg,
		unblockrate = self._config.UnblockRate,
		atk = self._config.Attack,
		curerate = self._config.CureRate,
		becuredrate = self._config.BeCuredRate,
		blockrate = self._config.BlockRate,
		reflection = self._config.Reflection,
		critrate = self._config.CritRate,
		absorption = self._config.Absorption,
		blockstrg = self._config.BlockStrg,
		hurtrate = self._config.HurtRate,
		defweaken = self._config.DefWeaken,
		defrate = self._config.DefRate,
		atkrate = self._config.AtkRate,
		anger = self._config.RageBase,
		speed = self._config.Speed,
		skillrate = self._config.SkillRate,
		counterrate = self._config.CounterRate,
		doublerate = self._config.DoubleRate,
		effectrate = self._config.EffectRate,
		uneffectrate = self._config.UneffectRate,
		effectstrg = self._config.EffectStrg,
		accessories = self._config.Loot,
		transform = self._config.Transform,
		aoederate = self._config.AOEDerate,
		heroShow = self._config.HeroShow,
		isProcessingBoss = self._config.IsProcessingBoss
	}

	return self._masterData
end

function EnemyMasterPrototype:checkSkillIdIsNone(skillId)
	if not skillId or skillId == "" or skillId == "None" then
		return false
	end

	return true
end
