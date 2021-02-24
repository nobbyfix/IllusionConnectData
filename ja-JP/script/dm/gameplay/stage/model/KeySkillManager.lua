KeySkillManager = class("KeySkillManager", objectlua.Object, _M)

KeySkillManager:has("_developSystem", {
	is = "r"
})
KeySkillManager:has("_towerSystem", {
	is = "r"
})

kActiveHeroType = {
	kTower = "tower",
	kAll = "all"
}
local TargetOccupation = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Hero_TypeList", "content")
local TargetMaseter = ConfigReader:getKeysOfTable("MasterBase")
local TowerMaseter = ConfigReader:getKeysOfTable("TowerMaster")
local TargetCost = {}
local TargetCostUp = {}
local TargetCostDown = {}
local kActiveType = {
	kTypevalue = "typevalue",
	kAvgcost = "avgcost",
	kPercent = "percent",
	kTag = "tag",
	kMaster = "master"
}
local kActiveRange = {
	kGroup = "group",
	kHold = "hold"
}

function KeySkillManager:initialize()
	super.initialize(self)

	local startCost = 8
	local endCost = 20

	for i = startCost, endCost do
		local key = string.format("Cost%s", i)
		TargetCost[key] = i
	end

	for i = startCost, endCost do
		local key = string.format("Cost%sUp", i)
		TargetCostUp[key] = i
	end

	for i = startCost, endCost do
		local key = string.format("Cost%sDown", i)
		TargetCostDown[key] = i
	end
end

function KeySkillManager:checkTargetCost(hero, cost)
	local targetCost = hero.cost or hero:getCost()

	return targetCost == cost
end

function KeySkillManager:checkTargetCostUp(hero, cost)
	local targetCost = hero.cost or hero:getCost()

	return cost <= targetCost
end

function KeySkillManager:checkTargetCostDown(hero, cost)
	local targetCost = hero.cost or hero:getCost()

	return targetCost < cost
end

function KeySkillManager:checkTargetOccupation(hero, occupation)
	local targetType = hero.type or hero:getType()

	return targetType == occupation
end

function KeySkillManager:checkTargetHero(hero, heroId)
	local targetId = hero.id or hero:getId()

	return targetId == heroId
end

local TargetStar = {
	Star1 = 1,
	Star5 = 5,
	Star4 = 4,
	Star6 = 6,
	Star3 = 3,
	Star2 = 2
}

function KeySkillManager:checkTargetStar(hero, star)
	local targetStar = hero.star or hero:getStar()

	return targetStar == star
end

local TargetRarity = {
	Rarity12 = 12,
	Rarity14 = 14,
	Rarity13 = 13
}

function KeySkillManager:checkTargetRarity(hero, rarity)
	local targetRarity = hero.rareity or hero:getRarity()

	return targetRarity == rarity
end

local TargetStarUp = {
	Star3Up = 3,
	Star4Up = 4,
	Star5Up = 5,
	Star6Up = 6,
	Star1Up = 1,
	Star2Up = 2
}

function KeySkillManager:checkTargetStarUp(hero, star)
	local targetStar = hero.star or hero:getStar()

	return star <= targetStar
end

local TargetStarDown = {
	Star6Down = 1,
	Star2Down = 1,
	Star5Down = 1,
	Star3Down = 1,
	Star4Down = 1,
	Star1Down = 1
}

function KeySkillManager:checkTargetStarDown(hero, star)
	local targetStar = hero.star or hero:getStar()

	return targetStar < star
end

function KeySkillManager:checkIsConditionReach(hero, tags)
	local reach = true

	for i = 1, #tags do
		local tag = tags[i]

		if TargetCost[tag] then
			reach = self:checkTargetCost(hero, TargetCost[tag])

			if not reach then
				return false
			end
		elseif TargetStar[tag] then
			reach = self:checkTargetStar(hero, TargetStar[tag])

			if not reach then
				return false
			end
		elseif TargetRarity[tag] then
			reach = self:checkTargetRarity(hero, TargetRarity[tag])

			if not reach then
				return false
			end
		elseif TargetCostUp[tag] then
			reach = self:checkTargetCostUp(hero, TargetCostUp[tag])

			if not reach then
				return false
			end
		elseif TargetCostDown[tag] then
			reach = self:checkTargetCostDown(hero, TargetCostDown[tag])

			if not reach then
				return false
			end
		elseif TargetStarUp[tag] then
			reach = self:checkTargetStarUp(hero, TargetStarUp[tag])

			if not reach then
				return false
			end
		elseif TargetStarDown[tag] then
			reach = self:checkTargetStarDown(hero, TargetStarDown[tag])

			if not reach then
				return false
			end
		elseif table.indexof(TargetOccupation, tag) then
			reach = self:checkTargetOccupation(hero, tag)

			if not reach then
				return false
			end
		elseif table.indexof(TargetMaseter, tag) then
			reach = self:checkTargetHero(hero, tag)

			if not reach then
				return false
			end
		elseif table.indexof(TowerMaseter, tag) then
			reach = self:checkTargetHero(hero, tag)

			if not reach then
				return false
			end
		else
			local heroConfig = ConfigReader:getRecordById("HeroBase", tag)

			if heroConfig then
				reach = self:checkTargetHero(hero, tag)

				if not reach then
					return false
				end
			end
		end
	end

	return reach
end

function KeySkillManager:checkConditionReachTotal(conditions)
	local heroesSame = {}

	for i = 1, #conditions do
		local tag = conditions[i]
		local heroesTemp = self._skillActiveParamsTotalCache[tag]

		if i == 1 then
			heroesSame = table.copy(heroesTemp, heroesSame)
		else
			for heroId, v in pairs(heroesSame) do
				if not heroesTemp[heroId] then
					heroesSame[heroId] = nil
				end
			end
		end
	end

	return heroesSame
end

function KeySkillManager:syncKeySkillCache()
	self._skillActiveParamsTotalCache = {}
	self._skillActiveParamsHoldCache = {}

	for index = 1, #TargetOccupation do
		local key = TargetOccupation[index]

		if not self._skillActiveParamsTotalCache[key] then
			self._skillActiveParamsTotalCache[key] = {}
			self._skillActiveParamsHoldCache[key] = {}
		end
	end

	local heroSystem = self._developSystem:getHeroSystem()
	self._allHeroList = heroSystem:getHeroShowIds()

	for i = 1, #self._allHeroList do
		local heroInfo = self._allHeroList[i]

		for key, value in pairs(TargetCost) do
			if not self._skillActiveParamsTotalCache[key] then
				self._skillActiveParamsTotalCache[key] = {}
				self._skillActiveParamsHoldCache[key] = {}
			end

			local reach = self:checkTargetCost(heroInfo, value)

			if reach then
				self._skillActiveParamsTotalCache[key][heroInfo.id] = 1

				if heroInfo.showType == HeroShowType.kHas then
					self._skillActiveParamsHoldCache[key][heroInfo.id] = 1
				end
			end
		end

		for key, value in pairs(TargetStar) do
			if not self._skillActiveParamsTotalCache[key] then
				self._skillActiveParamsTotalCache[key] = {}
				self._skillActiveParamsHoldCache[key] = {}
			end

			local reach = self:checkTargetStar(heroInfo, value)

			if reach then
				self._skillActiveParamsTotalCache[key][heroInfo.id] = 1

				if heroInfo.showType == HeroShowType.kHas then
					self._skillActiveParamsHoldCache[key][heroInfo.id] = 1
				end
			end
		end

		for key, value in pairs(TargetRarity) do
			if not self._skillActiveParamsTotalCache[key] then
				self._skillActiveParamsTotalCache[key] = {}
				self._skillActiveParamsHoldCache[key] = {}
			end

			local reach = self:checkTargetRarity(heroInfo, value)

			if reach then
				self._skillActiveParamsTotalCache[key][heroInfo.id] = 1

				if heroInfo.showType == HeroShowType.kHas then
					self._skillActiveParamsHoldCache[key][heroInfo.id] = 1
				end
			end
		end

		for key, value in pairs(TargetCostUp) do
			if not self._skillActiveParamsTotalCache[key] then
				self._skillActiveParamsTotalCache[key] = {}
				self._skillActiveParamsHoldCache[key] = {}
			end

			local reach = self:checkTargetCostUp(heroInfo, value)

			if reach then
				self._skillActiveParamsTotalCache[key][heroInfo.id] = 1

				if heroInfo.showType == HeroShowType.kHas then
					self._skillActiveParamsHoldCache[key][heroInfo.id] = 1
				end
			end
		end

		for key, value in pairs(TargetCostDown) do
			if not self._skillActiveParamsTotalCache[key] then
				self._skillActiveParamsTotalCache[key] = {}
				self._skillActiveParamsHoldCache[key] = {}
			end

			local reach = self:checkTargetCostDown(heroInfo, value)

			if reach then
				self._skillActiveParamsTotalCache[key][heroInfo.id] = 1

				if heroInfo.showType == HeroShowType.kHas then
					self._skillActiveParamsHoldCache[key][heroInfo.id] = 1
				end
			end
		end

		for key, value in pairs(TargetStarUp) do
			if not self._skillActiveParamsTotalCache[key] then
				self._skillActiveParamsTotalCache[key] = {}
				self._skillActiveParamsHoldCache[key] = {}
			end

			local reach = self:checkTargetStarUp(heroInfo, value)

			if reach then
				self._skillActiveParamsTotalCache[key][heroInfo.id] = 1

				if heroInfo.showType == HeroShowType.kHas then
					self._skillActiveParamsHoldCache[key][heroInfo.id] = 1
				end
			end
		end

		for key, value in pairs(TargetStarDown) do
			if not self._skillActiveParamsTotalCache[key] then
				self._skillActiveParamsTotalCache[key] = {}
				self._skillActiveParamsHoldCache[key] = {}
			end

			local reach = self:checkTargetStarDown(heroInfo, value)

			if reach then
				self._skillActiveParamsTotalCache[key][heroInfo.id] = 1

				if heroInfo.showType == HeroShowType.kHas then
					self._skillActiveParamsHoldCache[key][heroInfo.id] = 1
				end
			end
		end

		if not self._skillActiveParamsTotalCache[heroInfo.type] then
			self._skillActiveParamsTotalCache[heroInfo.type] = {}
			self._skillActiveParamsHoldCache[heroInfo.type] = {}
		end

		self._skillActiveParamsTotalCache[heroInfo.type][heroInfo.id] = 1

		if heroInfo.showType == HeroShowType.kHas then
			self._skillActiveParamsHoldCache[heroInfo.type][heroInfo.id] = 1
		end
	end
end

function KeySkillManager:checkIsKeySkillActive(conditions, targetIds, extra)
	if not conditions then
		return false
	end

	local heroSystem = self._developSystem:getHeroSystem()
	self._ownHeroList = heroSystem:getOwnHeroIds(true)
	self._allHeroList = heroSystem:getHeroShowIds()

	for i = 1, #conditions do
		local condition = conditions[i]
		local reach = self:isConditionReach(condition, targetIds, extra.heroType, extra.masterId)

		if reach then
			return true
		end
	end

	return false
end

local typeFuncMap = {
	[kActiveType.kTag] = function (KeySkillManager, condition, targetIds, heroType)
		return KeySkillManager:checkTagCondition(condition, targetIds, heroType)
	end,
	[kActiveType.kMaster] = function (KeySkillManager, condition, targetIds, heroType, masterId)
		return KeySkillManager:checkMasterCondition(condition, targetIds, heroType, masterId)
	end,
	[kActiveType.kAvgcost] = function (KeySkillManager, condition, targetIds, heroType)
		return KeySkillManager:checkAvgCostCondition(condition, targetIds, heroType)
	end,
	[kActiveType.kPercent] = function (KeySkillManager, condition, targetIds, heroType)
		return KeySkillManager:checkPercentCondition(condition, targetIds, heroType)
	end,
	[kActiveType.kTypevalue] = function (KeySkillManager, condition, targetIds, heroType)
		return KeySkillManager:checkTypeValueCondition(condition, targetIds, heroType)
	end
}

function KeySkillManager:isConditionReach(conditions, targetIds, heroType, masterId)
	for i = 1, #conditions do
		local condition = conditions[i]
		local type = condition.type
		local reachTemp = typeFuncMap[type](self, condition, targetIds, heroType, masterId)

		if not reachTemp then
			return false
		end
	end

	return true
end

function KeySkillManager:checkMasterCondition(condition, targetIds, heroType, masterId)
	local masterSystem = self._developSystem:getMasterSystem()
	local checkIds = {
		masterId
	}
	local checkTeamIds = true
	local range = condition.range
	local param = condition.param or {}
	local scope = condition.scope
	local heroes = {}

	for index = 1, #checkIds do
		local heroId = checkTeamIds and checkIds[index] or checkIds[index].id
		local hero = {
			getId = function ()
				return masterId
			end
		}
		local active = false

		for tagIndex = 1, #param do
			local reachTemp = self:checkIsConditionReach(hero, param[tagIndex])

			if reachTemp then
				active = true

				break
			end
		end

		if active and not table.indexof(heroes, heroId) then
			heroes[#heroes + 1] = heroId
		end
	end

	local heroNum = #heroes

	return scope[1] <= heroNum and heroNum <= scope[2]
end

function KeySkillManager:checkTagCondition(condition, targetIds, heroType)
	local heroSystem = self._developSystem:getHeroSystem()
	local checkIds = nil
	local checkTeamIds = true
	local range = condition.range

	if range == kActiveRange.kGroup then
		checkIds = targetIds
	elseif range == kActiveRange.kHold then
		checkIds = self._ownHeroList
		checkTeamIds = false
	end

	local param = condition.param or {}
	local scope = condition.scope
	local heroes = {}

	for index = 1, #checkIds do
		local heroId = checkTeamIds and checkIds[index] or checkIds[index].id
		local hero = nil

		if heroType == kActiveHeroType.kTower and checkTeamIds then
			hero = self._towerSystem:getHeroById(heroId)
			hero.id = hero:getBaseId()
		else
			hero = heroSystem:getHeroById(heroId)
		end

		local active = false

		for tagIndex = 1, #param do
			local reachTemp = self:checkIsConditionReach(hero, param[tagIndex])

			if reachTemp then
				active = true

				break
			end
		end

		if active and not table.indexof(heroes, heroId) then
			heroes[#heroes + 1] = heroId
		end
	end

	local heroNum = #heroes

	return scope[1] <= heroNum and heroNum <= scope[2]
end

function KeySkillManager:checkAvgCostCondition(condition, targetIds, heroType)
	local heroSystem = self._developSystem:getHeroSystem()
	local checkIds = nil
	local range = condition.range

	if range == kActiveRange.kGroup then
		checkIds = targetIds
	elseif range == kActiveRange.kHold then
		checkIds = targetIds

		return false
	end

	local param = condition.param or {}
	local scope = condition.scope
	local heroes = {}
	local totalCost = 0

	for index = 1, #checkIds do
		local heroId = checkIds[index]
		local hero = nil

		if heroType == kActiveHeroType.kTower then
			hero = self._towerSystem:getHeroById(heroId)
			hero.id = hero:getBaseId()
		else
			hero = heroSystem:getHeroById(heroId)
		end

		if #param == 0 then
			totalCost = totalCost + hero:getCost()
			heroes[#heroes + 1] = heroId
		else
			local active = false

			for tagIndex = 1, #param do
				local reachTemp = self:checkIsConditionReach(hero, param[tagIndex])

				if reachTemp then
					active = true

					break
				end
			end

			if active and not table.indexof(heroes, heroId) then
				totalCost = totalCost + hero:getCost()
				heroes[#heroes + 1] = heroId
			end
		end
	end

	local heroNum = #heroes

	if heroNum == 0 then
		return false
	end

	local avgcost = totalCost / heroNum
	local reachTemp = self:checkScopeCondition(avgcost, scope)

	return reachTemp
end

function KeySkillManager:checkPercentCondition(condition, targetIds, heroType)
	local heroSystem = self._developSystem:getHeroSystem()
	local checkIds = nil
	local range = condition.range

	if range == kActiveRange.kGroup then
		checkIds = targetIds

		return false
	elseif range == kActiveRange.kHold then
		checkIds = self._ownHeroList
	end

	local param = condition.param or {}
	local scope = condition.scope
	local heroes = {}
	local totalTargetHeroes = 0
	local totalHeroes, ownHeroesNum = nil

	if #param == 0 then
		ownHeroesNum = #self._ownHeroList
		totalHeroes = #self._allHeroList
	else
		local heroesTemp = {}

		for tagIndex = 1, #param do
			local reachTemp = self:checkConditionReachTotal(param[tagIndex])

			for id, v in pairs(reachTemp) do
				heroesTemp[id] = 1
			end
		end

		totalTargetHeroes = table.nums(heroesTemp)

		if totalTargetHeroes == 0 then
			return false
		end

		for index = 1, #checkIds do
			local heroId = checkIds[index].id
			local hero = heroSystem:getHeroById(heroId)
			local active = false

			for tagIndex = 1, #param do
				local reachTemp = self:checkIsConditionReach(hero, param[tagIndex])

				if reachTemp then
					active = true

					break
				end
			end

			if active and not table.indexof(heroes, heroId) then
				heroes[#heroes + 1] = heroId
			end
		end
	end

	local percent = nil

	if ownHeroesNum then
		percent = ownHeroesNum / totalHeroes * 100
	else
		local heroNum = #heroes
		percent = heroNum / totalTargetHeroes * 100
	end

	local reachTemp = self:checkScopeCondition(percent, scope)

	return reachTemp
end

function KeySkillManager:checkTypeValueCondition(condition, targetIds, heroType)
	local heroSystem = self._developSystem:getHeroSystem()
	local checkIds = nil
	local range = condition.range

	if range == kActiveRange.kGroup then
		checkIds = targetIds
	elseif range == kActiveRange.kHold then
		checkIds = targetIds

		return false
	end

	local param = condition.param or {}
	local scope = condition.scope
	local types = {}

	for index = 1, #checkIds do
		local heroId = checkIds[index]
		local hero = nil

		if heroType == kActiveHeroType.kTower then
			hero = self._towerSystem:getHeroById(heroId)
			hero.id = hero:getBaseId()
		else
			hero = heroSystem:getHeroById(heroId)
		end

		local occupation = hero:getType()

		if #param == 0 then
			types[occupation] = 1
		elseif not types[occupation] then
			local active = false

			for tagIndex = 1, #param do
				local reachTemp = self:checkIsConditionReach(hero, param[tagIndex])

				if reachTemp then
					active = true

					break
				end
			end

			if active then
				types[occupation] = 1
			end
		end
	end

	local typeNum = table.nums(types)

	return scope[1] <= typeNum and typeNum <= scope[2]
end

function KeySkillManager:checkScopeCondition(targetNum, scope)
	local reach = true
	local param1 = scope[1][2]
	local param2 = scope[2][2]
	local scope1 = scope[1][1]
	local scope2 = scope[2][1]

	if targetNum < scope1 or scope2 < targetNum then
		return false
	end

	if param1 == 0 and param2 == 0 then
		return scope1 < targetNum and targetNum < scope2
	elseif param1 == 0 and param2 == 1 then
		return scope1 < targetNum and targetNum <= scope2
	elseif param1 == 1 and param2 == 1 then
		return scope1 <= targetNum and targetNum <= scope2
	elseif param1 == 1 and param2 == 0 then
		return scope1 <= targetNum and targetNum < scope2
	end

	return reach
end
