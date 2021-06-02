BattleUnitType = {
	kHero = 2,
	kMaster = 1
}
BattleUnit = class("BattleUnit", BattleEntity, _M)

local function registBasicComponents(unit)
	unit:addComponent("Health", HealthComponent:new())
	unit:addComponent("Anger", AngerComponent:new())
	unit:addComponent("Numeric", NumericComponent:new())
	unit:addComponent("SpecialNumeric", SpecialNumericComponent:new())
	unit:addComponent("Position", PositionComponent:new())
	unit:addComponent("Flag", FlagComponent:new())
	unit:addComponent("Skill", SkillComponent:new())
	unit:addComponent("FSM", unit:getFSM())

	return unit
end

function BattleUnit.class:createMasterUnit(id)
	local unit = BattleUnit:new(id)

	unit:setUnitType(BattleUnitType.kMaster)
	registBasicComponents(unit)

	return unit
end

function BattleUnit.class:createHeroUnit(id)
	local unit = BattleUnit:new(id)

	unit:setUnitType(BattleUnitType.kHero)
	registBasicComponents(unit)

	return unit
end

function BattleUnit:copyUnit(srcUnit, ratio)
	super.copyUnit(self, srcUnit, ratio)
	self:copyRawData(srcUnit)
end

function BattleUnit:copyRawData(srcUnit)
	self._modelId = srcUnit:getModelId()
	self._quality = srcUnit:getQuality()
	self._level = srcUnit:getLevel()
	self._star = srcUnit:getStar()
	self._cost = srcUnit:getCost()
	self._masterRage = srcUnit:getMasterRage()
	self._genre = srcUnit:getGenre()
	self._suppress = srcUnit:getSuppress()
	self._transformData = srcUnit:getTransformData()
	self._inheritData = srcUnit:getInheritData()
	self._cardInfo = srcUnit:getCardInfo()
	self._awakenLevel = srcUnit:getAwakenLevel()
	self._modelScale = srcUnit:getModelScale()
	self._heroCost = srcUnit:getHeroCost()
	self._cid = srcUnit:getCid()
	self._enemyCost = srcUnit:getEnemyCost()
	self._attackEffect = srcUnit:getAttackEffect()
end

function BattleUnit:inheritUnit(srcUnit, info)
	self:copyRawData(srcUnit)

	self._isSummoned = true
	self._cost = info.cost or 0
	self._modelId = info.modelId
	self._killAnger = info.killAnger
	self._masterRage = info.masterRage
	self._genre = info.genre
	local components = self._components

	for name, comp in pairs(components) do
		if name == "Health" then
			comp:copyComponent(srcUnit:getComponent(name), info or 1)
		elseif name == "Numeric" then
			comp:copyComponent(srcUnit:getComponent(name), info or 1)
		elseif name == "Skill" then
			comp:initWithRawData({
				skills = info.skills
			})
		elseif name == "Anger" then
			comp:initWithRawData(info)
		elseif name == "Flag" then
			comp:initWithRawData(info)
		else
			comp:copyComponent(srcUnit:getComponent(name), 1)
		end
	end
end

BattleUnit:has("_unitType", {
	is = "rw"
})
BattleUnit:has("_modelId", {
	is = "rw"
})
BattleUnit:has("_uid", {
	is = "rw"
})
BattleUnit:has("_cid", {
	is = "rw"
})
BattleUnit:has("_quality", {
	is = "rw"
})
BattleUnit:has("_killAnger", {
	is = "r"
})
BattleUnit:has("_level", {
	is = "rw"
})
BattleUnit:has("_star", {
	is = "rw"
})
BattleUnit:has("_cost", {
	is = "rw"
})
BattleUnit:has("_enemyCost", {
	is = "rw"
})
BattleUnit:has("_masterRage", {
	is = "rw"
})
BattleUnit:has("_transformData", {
	is = "r"
})
BattleUnit:has("_inheritData", {
	is = "r"
})
BattleUnit:has("_summoner", {
	is = "rw"
})
BattleUnit:has("_cardInfo", {
	is = "rw"
})
BattleUnit:has("_rarity", {
	is = "rw"
})
BattleUnit:has("_qualityId", {
	is = "rw"
})
BattleUnit:has("_genre", {
	is = "rw"
})
BattleUnit:has("_suppress", {
	is = "rw"
})
BattleUnit:has("_awakenLevel", {
	is = "rw"
})
BattleUnit:has("_isProcessingBoss", {
	is = "rw"
})
BattleUnit:has("_modelScale", {
	is = "rw"
})
BattleUnit:has("_heroCost", {
	is = "rw"
})
BattleUnit:has("_surfaceIndex", {
	is = "rw"
})
BattleUnit:has("_attackEffect", {
	is = "rw"
})

function BattleUnit:initialize(id)
	super.initialize(self, id)

	self._lifeStage = ULS_Newborn
	self._fsm = FSMComponent:new()
end

function BattleUnit:initWithRawData(data)
	self._uid = self._uid or data.uid
	self._cid = self._cid or data.cid
	self._modelId = data.modelId
	self._quality = data.quality
	self._level = data.level
	self._star = data.star
	self._cost = data.cost or 0
	self._masterRage = data.masterRage or 0
	self._transformData = data.transform
	self._noRevive = data.noRevive
	self._rarity = data.rarity
	self._qualityId = data.qualityId
	self._genre = data.genre
	self._suppress = data.suppress
	self._heroShow = data.heroShow
	self._awakenLevel = data.awakenLevel or 0
	self._isProcessingBoss = data.isProcessingBoss
	self._modelScale = data.modelScale
	self._heroCost = data.heroCost or -1
	self._surfaceIndex = data.surfaceIndex or 0
	self._attackEffect = data.attackEffect
	self._enemyCost = data.enemyCost

	super.initWithRawData(self, data)

	if data.accessories ~= nil then
		self:addComponent("Bag", BagComponent:create(data.accessories))
	end

	self._inheritData = data
end

function BattleUnit:inheritTransform()
	if self._transformData then
		local newTransform = table.deepcopy(self._inheritData, {})
		newTransform.transform = nil
		self._transformData.transform = newTransform
	end
end

function BattleUnit:fullInheritTransform()
	if self._transformData then
		local newTransform = table.deepcopy(self._inheritData, {})
		newTransform.anger = 0
		self._transformData = newTransform
	end
end

function BattleUnit:transformWithData(data)
	self:initWithRawData(data)
end

function BattleUnit:setOwner(owner)
	self._owner = owner
	self._side = owner and owner:getSide()
end

function BattleUnit:getOwner()
	return self._owner
end

function BattleUnit:getSide()
	return self._side
end

ULS_Newborn = "newborn"
ULS_Normal = "normal"
ULS_Dying = "dying"
ULS_Reviving = "reviving"
ULS_Dead = "dead"
ULS_Kicked = "kicked"

function BattleUnit:getLifeStage()
	return self._lifeStage
end

function BattleUnit:setLifeStage(stage)
	self._lifeStage = stage
end

function BattleUnit:isInStages(...)
	local stage = self._lifeStage
	local args = {
		...
	}

	for i = 1, #args do
		if stage == args[i] then
			return stage
		end
	end

	return nil
end

function BattleUnit:hasFlag(flag)
	local flagComp = self:getComponent("Flag")

	return flagComp ~= nil and flagComp:hasFlag(flag)
end

function BattleUnit:isBoss()
	if self._isBoss == nil then
		self._isBoss = self:hasFlag("BOSS")
	end

	return self._isBoss
end

function BattleUnit:getFlagCheckers()
	local genreComp = self:getComponent("Genre")

	return {
		["$ANY"] = function ()
			return true
		end,
		["$HERO"] = function (target)
			return target:getUnitType() == BattleUnitType.kHero
		end,
		["$MASTER"] = function (target)
			return target:getUnitType() == BattleUnitType.kMaster
		end,
		["$SUMMONED"] = function (target)
			return target._isSummoned == true
		end,
		["$DPS"] = function (target)
			return genreComp ~= nil and genreComp:getGenre() == Genres.kDPS
		end,
		["$GANK"] = function (target)
			return genreComp ~= nil and genreComp:getGenre() == Genres.kGank
		end,
		["$TANK"] = function (target)
			return genreComp ~= nil and genreComp:getGenre() == Genres.kTank
		end
	}
end

function BattleUnit:getCell()
	local posComp = self:getComponent("Position")
	local cell = posComp and posComp:getCell()

	return cell
end

function BattleUnit:getPosition()
	local posComp = self:getComponent("Position")
	local cell = posComp and posComp:getCell()

	return cell and cell:getPosition()
end

function BattleUnit:canRevive()
	return self._noRevive ~= true
end

function BattleUnit:forbidenRevive()
	self._noRevive = true
end

function BattleUnit:getFSM()
	return self._fsm
end

function BattleUnit:update(dt, battleContext)
	self._fsm:update(dt, battleContext)
end

function BattleUnit:dumpInformation()
	local hpComp = self:getComponent("Health")
	local angerComp = self:getComponent("Anger")
	local posComp = self:getComponent("Position")
	local flagComp = self:getComponent("Flag")
	local cell = posComp:getCell()
	local skills = nil
	local unitType = self:getUnitType()

	if unitType == BattleUnitType.kMaster then
		skills = {}
		local skillComp = self:getComponent("Skill")

		if skillComp then
			local skillObj = skillComp:getSkill(kBattleMasterSkill1)

			if skillObj then
				skills[1] = skillObj:dumpInformation()
			else
				skills[1] = ""
			end

			local skillObj = skillComp:getSkill(kBattleMasterSkill2)

			if skillObj then
				skills[2] = skillObj:dumpInformation()
			else
				skills[2] = ""
			end

			local skillObj = skillComp:getSkill(kBattleMasterSkill3)

			if skillObj then
				skills[3] = skillObj:dumpInformation()
			else
				skills[3] = ""
			end
		end
	end

	return {
		id = self:getId(),
		roleType = unitType,
		model = self:getModelId(),
		cell = cell and cell:getId(),
		hp = hpComp:getHp(),
		maxHp = hpComp:getMaxHp(),
		anger = angerComp:getAnger(),
		maxAnger = angerComp:getMaxAnger(),
		cost = self:getCost(),
		skills = skills,
		cid = self._cid,
		genre = self._genre,
		suppress = self._suppress,
		heroShow = self._heroShow,
		isProcessingBoss = self._isProcessingBoss,
		awakenLevel = self._awakenLevel,
		modelScale = self._modelScale,
		isSummoned = self._isSummoned,
		side = self._side,
		flags = flagComp:getFlags()
	}
end

function BattleUnit:isSummoned()
	return self._isSummoned
end

function BattleUnit:setIsSummoned(isSummon)
	self._isSummoned = isSummon
end

function BattleUnit:getFoe()
	return self._foe
end

function BattleUnit:setFoe(foeId)
	self._foe = foeId
end

function BattleUnit:clearFoe()
	self._foe = nil
end

function BattleUnit:getProvokeTarget(...)
	return self._provoke
end

function BattleUnit:setProvokeTarget(unit)
	self._provoke = unit
end

function BattleUnit:cancelProvokeTarget(unit)
	if self._provoke == unit then
		self._provoke = nil
	end
end

function BattleUnit:clearStatus(battleContext)
	local buffSystem = battleContext:getObject("BuffSystem")

	buffSystem:cleanupBuffsOnTarget(self)
end

function BattleUnit:isDying()
	local hpComp = self:getComponent("Health")

	return hpComp and hpComp:isDying()
end

function BattleUnit:calcDroppingItems()
	local bagComp = self:getComponent("Bag")

	if bagComp == nil then
		return nil
	end

	local hpComp = self:getComponent("Health")
	local hp = hpComp:getHp()
	local maxHp = hpComp:getMaxHp()

	return bagComp:dropItems(function (packet)
		return packet.hpRatio ~= nil and hp <= packet.hpRatio * maxHp
	end)
end
