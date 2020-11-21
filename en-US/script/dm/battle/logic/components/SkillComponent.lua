kBattleExtraPasvSkill = "EXPASV"
kBattlePassiveSkill = "PASV"
kBattleNormalSkill = "NORM"
kBattleProudSkill = "PROUD"
kBattleUniqueSkill = "UNIQ"
kBattleDoubleHitSkill = "DBL"
kBattleCounterSkill = "CNTR"
kBattleDeathSkill = "DEATH"
kBattleMasterSkill1 = "MSTR1"
kBattleMasterSkill2 = "MSTR2"
kBattleMasterSkill3 = "MSTR3"
kBattleCardSkill = "CARD"
SkillComponent = class("SkillComponent", BaseComponent, _M)

function SkillComponent:initialize()
	super.initialize(self)

	self._skills = {}
end

function SkillComponent:initWithRawData(data)
	super.initWithRawData(self, data)

	self._skills = {}
	local skills = data.skills or {}

	if skills.passive then
		local passive = skills.passive
		local skillList = {}

		for i = 1, #passive do
			skillList[i] = BattleSkill:new(passive[i])
		end

		self:setupSkillList(kBattlePassiveSkill, skillList)
	end

	if skills.extrapasv then
		local extrapasv = skills.extrapasv
		local skillList = {}

		for i = 1, #extrapasv do
			skillList[i] = BattleSkill:new(extrapasv[i])
		end

		self:setupSkillList(kBattleExtraPasvSkill, skillList)
	end

	if skills.normal then
		self:setupSkill(kBattleNormalSkill, BattleSkill:new(skills.normal))
	end

	if skills.proud then
		self:setupSkill(kBattleProudSkill, BattleSkill:new(skills.proud))
	end

	if skills.unique then
		self:setupSkill(kBattleUniqueSkill, BattleSkill:new(skills.unique))
	end

	if skills.dblhit then
		self:setupSkill(kBattleDoubleHitSkill, BattleSkill:new(skills.dblhit))
	end

	if skills.cntrhit then
		self:setupSkill(kBattleCounterSkill, BattleSkill:new(skills.cntrhit))
	end

	if skills.death then
		self:setupSkill(kBattleDeathSkill, BattleSkill:new(skills.death))
	end

	if skills.master1 then
		self:setupSkill(kBattleMasterSkill1, BattleSkill:new(skills.master1))
	end

	if skills.master2 then
		self:setupSkill(kBattleMasterSkill2, BattleSkill:new(skills.master2))
	end

	if skills.master3 then
		self:setupSkill(kBattleMasterSkill3, BattleSkill:new(skills.master3))
	end
end

function SkillComponent:setupSkill(type, skill)
	if skill then
		skill:setType(type)
		skill:setOwner(self:getEntity())
	end

	self._skills[type] = skill
end

function SkillComponent:setupSkillList(type, skillList)
	if skillList then
		for i = 1, #skillList do
			skillList[i]:setType(type)
			skillList[i]:setOwner(self:getEntity())
		end
	end

	self._skills[type] = skillList
end

function SkillComponent:getSkill(type)
	return self._skills[type]
end

function SkillComponent:setUniqueSkillRoutine(routine)
	self._uniqueSkillRoutine = routine
end

function SkillComponent:getUniqueSkillRoutine()
	return self._uniqueSkillRoutine
end

function SkillComponent:copyComponent(srcComp, ratio)
	for skillType, skill in pairs(srcComp._skills) do
		if kBattlePassiveSkill == skillType or kBattleExtraPasvSkill == skillType then
			local skillList = skill
			self._skills[skillType] = {}

			for i, skill in ipairs(skillList) do
				self._skills[skillType][i] = skill:clone()
			end
		else
			self._skills[skillType] = skill:clone()
		end
	end
end
