local MIN_CARD_COST = 0
local MAX_CARD_COST = 30
CARD_TYPE = {
	kHeroCard = "hero",
	kSkillCard = "skill"
}
BattleCard = class("BattleCard", objectlua.Object, _M)

BattleCard:has("_id", {
	is = "rw"
})
BattleCard:has("_rawCost", {
	is = "rw"
})
BattleCard:has("_type", {
	is = "r"
})

function BattleCard:initialize(data)
	super.initialize(self)

	self._costTemp = OrderSet:new()
	self._costForever = OrderSet:new()
	self._costTempSource = {}
	self._costForeverSource = {}

	if data ~= nil then
		self:initWithData(data)
	end
end

function BattleCard:initWithData(data)
	self._id = data.id
	self._rawCost = data.cost

	return self
end

function BattleCard:getActualCost()
	local cost = self._rawCost
	cost = self._costForever:calc(cost, MIN_CARD_COST, MAX_CARD_COST)
	cost = self._costTemp:calc(cost, MIN_CARD_COST, MAX_CARD_COST)

	return cost
end

function BattleCard:applyCostEnchant(source, effectType, value, isTemp)
	if isTemp then
		self._costTemp:add(effectType, value)

		self._costTempSource[#self._costTempSource + 1] = source
	else
		self._costForever:add(effectType, value)

		self._costForeverSource[#self._costForeverSource + 1] = source
	end

	return {
		evt = "cardCost",
		card = self:getId(),
		cost = self:getActualCost(),
		rawCost = self._rawCost
	}
end

function BattleCard:cancelCostEnchant(source, isTemp)
	local changed = false

	if isTemp then
		for index, src in ipairs(self._costTempSource) do
			if src == source then
				table.remove(self._costTempSource, index)
				self._costTemp:remove(index)

				changed = true

				break
			end
		end
	else
		for index, src in ipairs(self._costForeverSource) do
			if src == source then
				table.remove(self._costForeverSource, index)
				self._costForever:remove(index)

				changed = true

				break
			end
		end
	end

	if changed then
		return {
			evt = "cardCost",
			card = self:getId(),
			cost = self:getActualCost(),
			rawCost = self._rawCost
		}
	end
end

function BattleCard:usedByPlayer(player, battleContext)
end

function BattleCard:lock()
	if not self._locked then
		self._locked = true

		return {
			locked = true,
			id = self:getId()
		}
	end
end

function BattleCard:unlock()
	if self._locked then
		self._locked = false

		return {
			locked = false,
			id = self:getId()
		}
	end
end

function BattleCard:isLocked()
	return self._locked
end

function BattleCard:dumpInformation()
	return {
		id = self:getId(),
		rawCost = self:getRawCost(),
		cost = self:getActualCost(),
		locked = self._locked
	}
end

function BattleCard:hasFlag(flag)
	return false
end

function BattleCard:isGenre(genre)
	return false
end

HeroCard = class("HeroCard", BattleCard, _M)

HeroCard:has("_heroData", {
	is = "r"
})
HeroCard:has("_cardAI", {
	is = "r"
})

function HeroCard:initWithData(data)
	super.initWithData(self, data)

	self._heroData = data.hero
	self._cardAI = data.cardAI
	self._type = CARD_TYPE.kHeroCard
	self._triggerBuffs = {}

	return self
end

function HeroCard:getType()
	return "hero"
end

function HeroCard:usedByPlayer(player, battleContext, trgtCellNo, cost, wontEvent)
	local animation = {
		name = "spawn"
	}
	local formationSystem = battleContext:getObject("FormationSystem")
	local unit, detail = formationSystem:SpawnUnit(player, self._heroData, trgtCellNo, animation, not wontEvent, cost or self:getActualCost())

	if not unit then
		return unit, detail
	end

	unit:setCardInfo({
		id = self._id,
		cost = self._rawCost,
		cardAI = self._cardAI,
		hero = self._heroData
	})

	local cardSystem = battleContext:getObject("CardSystem")

	cardSystem:sendTimingEvent(EVT_BATTLE_CARD_USED, {
		player = player
	})

	if #self._triggerBuffs > 0 then
		local buffSystem = battleContext:getObject("BuffSystem")

		buffSystem:recordEnterBuffs(unit, self._triggerBuffs)
	end

	return true
end

function HeroCard:dumpInformation()
	local info = super.dumpInformation(self)
	local data = self:getHeroData()
	info.hero = {
		id = data.id,
		genre = data.genre,
		model = data.modelId,
		level = data.level,
		maxHp = data.maxHp,
		def = data.def,
		atk = data.atk,
		star = data.star,
		quality = data.quality,
		rarity = data.rarity,
		ratio = data.ratio,
		addHurtRate = data.addHurtRate
	}
	info.type = "hero"

	if data and data.skills and data.skills.unique then
		info.unique = data.skills.unique.id
		info.uniqueLevel = data.skills.unique.level
	end

	return info
end

function HeroCard:hasFlag(flag)
	local data = self:getHeroData()

	if data.flags and #data.flags > 0 then
		for _, _flag in ipairs(data.flags) do
			if _flag == flag then
				return true
			end
		end
	end

	return false
end

function HeroCard:addTriggerBuff(triggerBuff)
	self._triggerBuffs[#self._triggerBuffs + 1] = triggerBuff
end

function HeroCard:isGenre(genre)
	local data = self:getHeroData()

	if data and data.genre and data.genre ~= "" and data.genre == genre then
		return true
	end

	return false
end

SkillCard = class("SkillCard", BattleCard, _M)

SkillCard:has("_skillData", {
	is = "r"
})
SkillCard:has("_autoWeight", {
	is = "r"
})

function SkillCard:initWithData(data)
	super.initWithData(self, data)

	self._skillData = data.skill
	self._skillPic = data.skillPic
	self._autoWeight = data.autoWeight

	return self
end

function SkillCard:getType()
	return "skill"
end

local function isValidUnit(unit)
	return not unit:isInStages(ULS_Dying, ULS_Dead, ULS_Kicked)
end

function SkillCard:usedByPlayer(player, battleContext, cost)
	local actor = player:getMasterUnit()

	if not actor or not isValidUnit(actor) then
		return false, "MasterNotAvailable"
	end

	local cost = cost or self:getActualCost()
	local energyInfo = nil

	if cost and cost > 0 then
		energyInfo = player:consumeEnergy(cost)

		if energyInfo == nil then
			return false, "EnergyNotEnough"
		end
	end

	if energyInfo then
		battleContext:getObject("ProcessRecorder"):recordObjectEvent(player:getId(), "SyncE", energyInfo)
	end

	local skill = BattleSkill:new(self._skillData)

	skill:setType(kBattleCardSkill)
	skill:setOwner(actor)

	local skillSystem = battleContext:getObject("SkillSystem")

	skill:build(skillSystem:getGlobalEnvironment())

	local actionScheduler = battleContext:getObject("ActionScheduler")

	return actionScheduler:exertSpecificSkill(actor, skill)
end

function SkillCard:dumpInformation()
	local info = super.dumpInformation(self)
	local data = self:getSkillData()
	info.type = "skill"
	info.skillPic = self._skillPic
	info.skill = {
		id = data.skillId,
		level = data.level
	}

	return info
end
