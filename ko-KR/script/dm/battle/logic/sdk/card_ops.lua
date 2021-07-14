local exports = SkillDevKit or {}
local floor = math.floor
local ceil = math.ceil
local MakeFilter = _G.MakeFilter
local filterElements = _G.filterElements
local makeBuffMatchFunction = _G.makeBuffMatchFunction

function exports.GetCardCost(env, card)
	return card:getActualCost()
end

function exports.addHeroCardSeatRules(env, player, card, rules, dierules)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	return cardSystem:addHeroCardSeatRules(player, card, rules, dierules)
end

function exports.clearHeroCardSeatRules(env, player, card, rules, dierules)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	return cardSystem:clearHeroCardSeatRules(player, card, rules, dierules)
end

function exports.setEnterPauseTime(env, player, card, time)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	return cardSystem:setEnterPauseTime(player, card, time)
end

function exports.CARD_HERO_MARKED(env, flag)
	return MakeFilter(function (card)
		if card:getType() == "hero" then
			return card:hasFlag(flag)
		else
			return false
		end
	end)
end

function exports.CARD_HERO_GENRE(env, genre)
	return MakeFilter(function (_, card)
		if card then
			return card:isGenre(genre)
		end

		return false
	end)
end

function exports.CARD_COST_EQ(env, cost)
	return MakeFilter(function (card)
		return card:getActualCost() == cost
	end)
end

function exports.CARD_COST_LE(env, cost)
	return MakeFilter(function (card)
		return card:getActualCost() <= cost
	end)
end

function exports.CARD_COST_GE(env, cost)
	return MakeFilter(function (card)
		return cost <= card:getActualCost()
	end)
end

function exports.CARD_EXACT(env, exactCard)
	return MakeFilter(function (card)
		return card == exactCard
	end)
end

function exports.GetHeroCardAttr(env, card, key)
	if card:getType() == "hero" then
		local heroData = card:getHeroData()

		return heroData[key] or 0
	end

	return 0
end

function exports.CardsOfPlayer(env, player, cardfilter)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	return cardSystem:getHeroCards(player, cardfilter)
end

function exports.CardsInWindow(env, player, cardfilter)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	return cardSystem:getHeroCardsInWindow(player, cardfilter)
end

function exports.CardsInPool(env, player, cardfilter)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	return cardSystem:getHeroCardsInPool(player, cardfilter)
end

function exports.CardCostEnchant(env, type, value, priority)
	return CardCostEnchant:new({
		type = type,
		value = value,
		priority = priority
	})
end

function exports.ApplyEnchant(env, player, card, config, enchants)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	local enchantConfig = {
		duration = config.duration,
		timing = config.timing
	}
	local enchantObject = EnchantObject:new(enchantConfig, enchants)

	enchantObject:setSource(env["$actor"])

	local groupConfig = nil

	if config.group ~= nil then
		groupConfig = {
			group = config.group,
			limit = config.limit
		}
	end

	return cardSystem:applyEnchantOnCard(player, card, enchantObject, groupConfig, env["$id"])
end

function exports.ApplyHeroCardBuff(env, player, heroCard, buffConfig, buffEffects)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	local triggerBuff = TriggerBuff:new(buffConfig, buffEffects)

	return cardSystem:applyBuffsOnHeroCard(player, heroCard, triggerBuff, env["$id"])
end

function exports.SelectCardBuffCount(env, heroCard, tag)
	if not heroCard then
		return 0
	end

	if heroCard:getType() ~= "hero" then
		return 0
	end

	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return 0
	end

	return cardSystem:getTiggerBuffCountOnHeroCard(heroCard, tag)
end

function exports.SelectCardPassiveCount(env, heroCard, skillId)
	if not heroCard then
		return 0
	end

	if heroCard:getType() ~= "hero" then
		return 0
	end

	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return 0
	end

	return cardSystem:getPassiveCountOnHeroCard(heroCard, skillId)
end

function exports.DispelBuffOnHeroCard(env, heroCard, tags)
	if not heroCard then
		return 0
	end

	if heroCard:getType() ~= "hero" then
		return 0
	end

	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return 0
	end

	return cardSystem:getTiggerBuffCountOnHeroCard(heroCard, tags)
end

function exports.LockHeroCards(env, player, cardfilter)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	cardSystem:lockHeroCards(player, cardfilter)
end

function exports.UnlockHeroCards(env, player, cardfilter)
	local cardSystem = env.global["$CardSystem"]

	if cardSystem == nil then
		return nil
	end

	cardSystem:unlockHeroCards(player, cardfilter)
end
