EVT_BATTLE_CARD_USED = "evt_battle_card_used"
CardSystem = class("CardSystem", BattleSubSystem)

function CardSystem:initialize()
	super.initialize(self)

	self._playerRegistry = {}
	self._cardAgentRegistry = {}
	self._timingEventDispatcher = BattleEventDispatcher:new()
end

function CardSystem:startup(battleContext)
	super.startup(self, battleContext)

	return self
end

function CardSystem:getHeroCards(player, cardfilter)
	local cardsInWindow = player:getCardWindow():getCardArray()

	if player:getCardState() == "skill" then
		return {}
	end

	local cardsInPool = player:getCardPool():getCardArray()
	local result = {}

	for _, card in ipairs(cardsInWindow) do
		if not cardfilter or cardfilter(card) then
			result[#result + 1] = card
		end
	end

	for _, card in ipairs(cardsInPool) do
		if not cardfilter or cardfilter(card) then
			result[#result + 1] = card
		end
	end

	return result
end

function CardSystem:getHeroCardsInWindow(player, cardfilter)
	local cardsInWindow = player:getCardWindow():getCardArray()

	if #cardsInWindow == 0 or cardsInWindow[1]:getType() ~= CARD_TYPE.kHeroCard then
		return {}
	end

	local result = {}

	for _, card in ipairs(cardsInWindow) do
		if not cardfilter or cardfilter(card) then
			result[#result + 1] = card
		end
	end

	return result
end

function CardSystem:getHeroCardsInPool(player, cardfilter)
	local cardsInPool = player:getCardPool():getCardArray()
	local result = {}

	for _, card in ipairs(cardsInPool) do
		if not cardfilter or cardfilter(card) then
			result[#result + 1] = card
		end
	end

	return result
end

function CardSystem:getTiggerBuffCountOnHeroCard(card, tag)
	local triggerBuffs = card:getTriggerBuff()
	local count = 0

	for k, v in pairs(triggerBuffs) do
		local config = v:getBuffConfig()

		for k_, v_ in pairs(config.tags) do
			if tag == v_ then
				count = count + 1
			end
		end
	end

	return count
end

function CardSystem:dispelTiggerOnHeroCard(card, tags)
	local triggerBuffs = card:getTriggerBuff()

	for k, v in pairs(triggerBuffs) do
		local config = v:getBuffConfig()
		local isMatched = false

		for k_, v_ in pairs(config.tags) do
			for k, tag_ in pairs(tags) do
				if tag_ == v_ then
					isMatched = true

					break
				end
			end

			if isMatched then
				break
			end
		end

		if isMatched then
			card:removeTriggerBuff(v)
		end
	end
end

function CardSystem:getCardIdx(player, card)
	return player:getCardWindow():getCardIndex(card)
end

function CardSystem:genNewHeroCard(player, cardInfo, appendix)
	local entityManager = self._battleContext:getObject("EntityManager")
	local cardsInWindow = player:getCardWindow()
	local info = {}

	table.deepcopy(cardInfo, info)

	info.id = info.id .. appendix
	info.hero.id = info.hero.id .. appendix
	local index = 0

	repeat
		info.id = info.id .. index
		info.hero.id = info.hero.id .. index
		index = index + 1
	until entityManager:fetchEntity(info.hero.id) == nil and cardsInWindow:getCardById(info.hero.id) == nil

	return info
end

function CardSystem:genNewSkillCard(actor, skillData)
	local cardInfo = actor:getCardInfo()

	if cardInfo then
		return {
			id = cardInfo.id,
			cost = cardInfo.cost,
			model = cardInfo.hero.modelId,
			actor = actor,
			skill = skillData
		}
	end
end

function CardSystem:removeSkillCardForActor(actor)
	local player = actor:getOwner()

	if player:getCardState() == "skill" then
		local cardPool = player:getCardPool()
		local cardsInPool = cardPool:getCardArray()
		local result = {}

		for idx, card in ipairs(cardsInPool) do
			if card:getActor() == actor then
				cardPool:removeCard(card, idx)

				return
			end
		end

		local cardWindow = player:getCardWindow()
		local cardsInWindow = cardWindow:getCardArray()

		for idx, card in ipairs(cardsInWindow) do
			if card:getActor() == actor then
				local newCard, nextCard = player:fillCardAtIndex(idx)

				env.global.RecordImmediately(env, player:getId(), "Card", {
					type = "hero",
					idx = idx,
					card = newCard and newCard:dumpInformation() or 0,
					next = nextCard and nextCard:dumpInformation() or 0
				})

				return
			end
		end
	end
end

function CardSystem:addHeroCardSeatRules(player, card, rules, killOrKick)
	if card:getType() == "hero" then
		for k, v in pairs(rules) do
			card:addSeatRule(v, killOrKick[k])
		end

		local info = card:dumpInformation()
		local idx = self:getCardIdx(player, card)

		self._processRecorder:recordObjectEvent(player:getId(), "UpdateHeroCard", {
			cardInfo = info,
			idx = idx
		})

		return true
	end

	return false
end

function CardSystem:clearHeroCardSeatRules(player, card, rules, killOrKick)
	if card:getType() == "hero" then
		for k, v in pairs(rules) do
			card:subSeatRule(v, killOrKick[k])
		end

		local info = card:dumpInformation()
		local idx = self:getCardIdx(player, card)

		self._processRecorder:recordObjectEvent(player:getId(), "UpdateHeroCard", {
			cardInfo = info,
			idx = idx
		})

		return true
	end

	return false
end

function CardSystem:lockHeroCards(player, cardfilter)
	local cards = self:getHeroCards(player, cardfilter)

	for _, card in ipairs(cards) do
		local detail = card:lock()

		if detail then
			detail.idx = self:getCardIdx(player, card)

			self._processRecorder:recordObjectEvent(player:getId(), "LockCard", detail)
		end
	end
end

function CardSystem:unlockHeroCards(player, cardfilter)
	local cards = self:getHeroCards(player, cardfilter)

	for _, card in ipairs(cards) do
		local detail = card:unlock()

		if detail then
			detail.idx = self:getCardIdx(player, card)

			self._processRecorder:recordObjectEvent(player:getId(), "UnlockCard", detail)
		end
	end
end

function CardSystem:retrieveCardAgent(player, card, autoCreate)
	local cardAgentRegistry = self._cardAgentRegistry[player]

	if not cardAgentRegistry then
		if not autoCreate then
			return nil
		else
			cardAgentRegistry = {}
			self._cardAgentRegistry[player] = cardAgentRegistry
		end
	end

	local cardAgent = cardAgentRegistry[card]

	if cardAgent ~= nil or not autoCreate then
		return cardAgent
	end

	cardAgent = CardAgent:new(card)
	cardAgentRegistry[card] = cardAgent

	return cardAgent
end

function CardSystem:discardCardAgent(player, card)
	local cardAgentRegistry = self._cardAgentRegistry[player]

	if not cardAgentRegistry then
		return nil
	end

	local cardAgent = cardAgentRegistry[card]
	cardAgentRegistry[card] = nil

	return cardAgent
end

function CardSystem:addTimingListener(event, listener, priority)
	self._timingEventDispatcher:addListener(event, listener, priority)
end

function CardSystem:removeTimingListener(event, listener, priority)
	self._timingEventDispatcher:removeListener(event, listener, priority)
end

function CardSystem:sendTimingEvent(event, args)
	self._timingEventDispatcher:dispatchEvent(event, args)
end

function CardSystem:applyEnchantOnCard(player, card, enchantObject, groupConfig, workId)
	assert(enchantObject ~= nil, "Invalid arguments")

	local cardAgent = self:retrieveCardAgent(player, card, true)

	assert(cardAgent ~= nil)

	if groupConfig ~= nil then
		if groupConfig.limit and groupConfig.limit <= 0 then
			local enchantGroup = cardAgent:retrieveEnchantGroup(groupConfig.group)

			if enchantGroup ~= nil then
				self:cancelEnchant(player, card, enchantGroup)
			end
		else
			local enchantGroup = cardAgent:retrieveEnchantGroup(groupConfig.group)

			if enchantGroup ~= nil then
				local result, detail = self:attachEnchantWithGroup(enchantObject, enchantGroup, groupConfig.limit)

				if detail and self._processRecorder then
					self._processRecorder:recordObjectEvent(player:getId(), "StackEnchant", detail, workId)
				end
			else
				local enchantGroup = cardAgent:createEnchantGroup(groupConfig.group, enchantObject)
				local added = cardAgent:addEnchantObject(enchantGroup)

				if not added then
					return
				end

				local appliedTarget, detail = enchantGroup:takeEnchant(cardAgent)

				if appliedCard == nil then
					return nil
				end

				if enchantGroup:getEvent() and enchantGroup:getDuration() and enchantGroup:getDuration() > 0 then
					enchantGroup:setListener(function (event, args)
						if args.player == player then
							enchantGroup:updateTiming(self._battleContext)

							if enchantGroup:isUsedUp() then
								self:cancelEnchant(player, card, enchantGroup)
							end
						end
					end)
					self:addTimingListener(enchantGroup:getEvent(), enchantGroup:getListener(), 1)
				end

				if detail and self._processRecorder then
					self._processRecorder:recordObjectEvent(player:getId(), "AddEnchant", detail, workId)
				end
			end
		end
	else
		local added = cardAgent:addEnchantObject(enchantObject)

		if not added then
			return
		end

		local appliedCard, detail = enchantObject:takeEnchant(cardAgent)

		if appliedCard == nil then
			return nil
		end

		if enchantObject:getEvent() and enchantObject:getDuration() and enchantObject:getDuration() > 0 then
			enchantObject:setListener(function (event, args)
				if args.player == player then
					enchantObject:updateTiming(self._battleContext)

					if enchantObject:isUsedUp() then
						self:cancelEnchant(player, card, enchantObject)
					end
				end
			end)
			self:addTimingListener(enchantObject:getEvent(), enchantObject:getListener(), 1)
		end

		if detail and self._processRecorder then
			detail.idx = self:getCardIdx(player, card)

			self._processRecorder:recordObjectEvent(player:getId(), "AddEnchant", detail, workId)
		end
	end
end

function CardSystem:attachEnchantWithGroup(enchantObject, enchantGroup, groupLimit)
	if enchantObject == nil or enchantGroup == nil then
		return false
	end

	return enchantGroup:stack(enchantObject, groupLimit)
end

function CardSystem:cancelEnchant(player, card, enchantObject)
	local cardAgent = self:retrieveCardAgent(player, card)

	if cardAgent and cardAgent:removeEnchantObject(enchantObject) then
		local sucess, detail = enchantObject:cancelEnchant(cardAgent)

		if enchantObject:isGroup() then
			cardAgent:discardEnchantGroup(enchantObject:getGroupId())
		end

		if sucess and self._processRecorder then
			detail.idx = self:getCardIdx(player, card)

			self._processRecorder:recordObjectEvent(player:getId(), "RmEnchant", detail)
		end

		local listener = enchantObject:getListener()

		if listener then
			self:removeTimingListener(enchantObject:getEvent(), listener)
		end
	end
end

function CardSystem:cleanEnchantsOnCard(player, card)
	local cardAgent = self:retrieveCardAgent(player, card)
	local enchantList = cardAgent and cardAgent:getEnchants()

	if enchantList then
		for i, enchant in ipairs(enchantList) do
			if cardAgent:removeEnchantObject(enchant) then
				local sucess, detail = enchant:cancelEnchant(cardAgent)

				if enchant:isGroup() then
					cardAgent:discardEnchantGroup(enchant:getGroupId())
				end

				if sucess and self._processRecorder then
					self._processRecorder:recordObjectEvent(player:getId(), "RmEnchant", detail)
				end
			end
		end
	end

	self:discardCardAgent(player, cell)
end

function CardSystem:cleanAllEnchantsByPlayer(player)
end

function CardSystem:cleanAllEnchants()
end

function CardSystem:applyBuffsOnHeroCard(player, heroCard, triggerBuff, workId)
	heroCard:addTriggerBuff(triggerBuff)

	local idx = self:getCardIdx(player, heroCard)

	self._processRecorder:recordObjectEvent(player:getId(), "TriggerBuff", {
		idx = idx
	}, workId)
end

function CardSystem:cleanup()
end
