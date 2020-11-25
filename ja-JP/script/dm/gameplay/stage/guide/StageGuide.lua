StageGuide = {}

local function deepCopy(desc, src)
	local d = desc or {}

	for k, v in pairs(src) do
		if type(v) == "table" then
			d[k] = deepCopy({}, v)
		else
			d[k] = v
		end
	end

	return d
end

function StageGuide:setInjector(injector)
	self._injector = injector
end

function StageGuide:newUnitData(player, heroId, idx)
	local isEnemy = player:getSide() == kBattleSideB
	local protoFactory = PrototypeFactory:getInstance()
	local eneryHeroPrototype = protoFactory:getEneryHeroPrototype(heroId)
	local heroData = deepCopy({}, eneryHeroPrototype:getHeroData())
	local summon = {}
	local summonMap = {}
	heroData = BattleDataHelper:fillHeroData(heroData, player:getId(), "ih", idx, isEnemy, summon, summonMap)

	if #summon > 0 then
		player:fillSummonInfo(summon)
	end

	return heroData
end

function StageGuide:newMasterUnitData(player, heroId, idx)
	local isEnemy = player:getSide() == kBattleSideB
	local protoFactory = PrototypeFactory:getInstance()
	local eneryMasterPrototype = protoFactory:getEneryMasterPrototype(heroId)
	local masterData = deepCopy({}, eneryMasterPrototype:getMasterData())
	local summon = {}
	local summonMap = {}
	masterData = BattleDataHelper:fillMasterData(masterData, player, 1, isEnemy, summon, summonMap)

	if #summon > 0 then
		player:fillSummonInfo(summon)
	end

	return masterData
end

function StageGuide:spawnUnit(context, player, cell, heroData, isMaster)
	local battleLogic = context:getObject("BattleLogic")
	local formationSystem = context:getObject("FormationSystem")
	local animation = {
		dur = 1000,
		name = "init"
	}

	formationSystem:SpawnUnit(player, heroData, cell, animation, false, isMaster)
end

function StageGuide:newHeroCard(player, heroId, idx)
	local isEnemy = player:getSide() == kBattleSideB
	local protoFactory = PrototypeFactory:getInstance()
	local eneryHeroPrototype = protoFactory:getEneryHeroPrototype(heroId)
	local cardData = deepCopy({}, eneryHeroPrototype:getEneryData())
	local summon = {}
	local summonMap = {}
	cardData.hero.transform = nil
	local card = BattleDataHelper:fillCardData(cardData, player:getId(), "ic", idx, isEnemy, summon, summonMap)

	if #summon > 0 then
		player:fillSummonInfo(summon)
	end

	return HeroCard:new(card)
end

function StageGuide:insertCard(context, player, card, wndIdx)
	if not card then
		return
	end

	local battleRecorder = context:getObject("BattleRecorder")
	local newCard, oldCard = player:insertCardAtIndex(wndIdx, card)

	if battleRecorder ~= nil then
		battleRecorder:recordEvent(player:getId(), "SwapCard", {
			idx = wndIdx,
			type = card:getType(),
			card = newCard and newCard:dumpInformation() or 0,
			reduce = oldCard ~= nil
		})
	end

	return true
end
