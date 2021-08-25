local exports = SkillDevKit or {}
local floor = math.floor
local ceil = math.ceil
local filterElements = _G.filterElements

local function RandomElemInArray(env, array)
	if array == nil or #array == 0 then
		return nil
	end

	local random = env.global.random

	return array[random(1, #array)]
end

function exports.AddStatus(env, unit, status)
	local flagComp = unit:getComponent("Flag")

	flagComp:addStatus(status)
end

function exports.RemoveStatus(env, unit, status)
	local flagComp = unit:getComponent("Flag")

	flagComp:removeStatus(status)
end

function exports.INSTATUS(env, status)
	return MakeFilter(function (_, unit)
		local flagComp = unit:getComponent("Flag")

		return flagComp:hasStatus(status)
	end)
end

function exports.INANYSTATUS(env, statusArr)
	return MakeFilter(function (_, unit)
		local flagComp = unit:getComponent("Flag")

		return flagComp:hasAnyStatus(statusArr)
	end)
end

function exports.Stop(env)
	local excutor = env.global["$SkillSystem"]:getSkillExecutor()

	excutor:stopAction(env, "special skill")
end

function exports.ApplyEnergyDamage(env, player, energy)
	local energyInfo = player:reduceEnergy(energy)

	env.global.RecordImmediately(env, player:getId(), "SyncE", energyInfo)
end

function exports.FlyBallEffect(env, unit, card)
	local player = env["$actor"]:getOwner()
	local cardSystem = env.global["$CardSystem"]
	local effectInfo = {
		index = cardSystem:getCardIdx(player, card)
	}

	env.global.RecordImmediately(env, unit:getId(), "FlyBallToCard", effectInfo)

	return true
end

function exports.ApplyEnergyRecovery(env, player, energy)
	if not player then
		return
	end

	local energyInfo = player:recoverEnergy(energy)

	env.global.RecordImmediately(env, player:getId(), "SyncERecovery", energyInfo)
end

function exports.Recruit(env, cardfilter, location, cost)
	local player = env["$actor"]:getOwner()
	local battleField = env.global["$BattleContext"]:getObject("BattleField")
	local cellId = battleField:findEmptyCellId(player:getSide(), location)

	if not cellId then
		return
	end

	local cardsInWindow = player:getCardWindow():getCardArray()

	if #cardsInWindow == 0 or cardsInWindow[1]:getType() ~= CARD_TYPE.kHeroCard then
		return
	end

	local cardsInPool = player:getCardPool():getCardArray()

	if cardfilter then
		cardsInWindow = filterElements(cardsInWindow, cardfilter)
		cardsInPool = filterElements(cardsInPool, cardfilter)
	end

	local windowCount = #cardsInWindow
	local poolCount = #cardsInPool

	if windowCount + poolCount == 0 then
		return
	end

	local resultIndex = env.global.random(1, windowCount + poolCount)
	local resultCard = nil

	if resultIndex <= windowCount then
		resultCard = cardsInWindow[resultIndex]

		resultCard:usedByPlayer(player, env.global["$BattleContext"], cellId, cost or 0, true)

		local idx = player:getCardWindow():getCardIndex(resultCard)
		local newCard, nextCard = player:fillCardAtIndex(idx)

		env.global.RecordImmediately(env, player:getId(), "RecruitCard", {
			type = "hero",
			idx = idx,
			card = newCard and newCard:dumpInformation() or 0,
			next = nextCard and nextCard:dumpInformation() or 0
		})
		env.global["$SkillSystem"]:activateGlobalTrigger("HERO_CARD_CHANGEED", {
			player = player,
			idx = resultIndex,
			oldcard = resultCard,
			newcard = newCard
		})
	else
		resultCard = cardsInPool[resultIndex - windowCount]

		resultCard:usedByPlayer(player, env.global["$BattleContext"], cellId, cost or 0, true)

		local removed, isFront = player:getCardPool():removeCard(resultCard)

		if removed then
			if isFront then
				local nextCard = player:getCardPool():getFrontCard()

				env.global.RecordImmediately(env, player:getId(), "RecruitCard", {
					type = "hero",
					next = nextCard and nextCard:dumpInformation() or 0
				})
			else
				env.global.RecordImmediately(env, player:getId(), "RecruitCard", {
					type = "hero"
				})
			end
		end
	end
end

function exports.RecruitCard(env, card, location, cost, otherPlayer)
	local player = otherPlayer or env["$actor"]:getOwner()
	local battleField = env.global["$BattleContext"]:getObject("BattleField")
	local cellId = battleField:findEmptyCellId(player:getSide(), location)

	if not cellId then
		return false
	end

	if card:isLocked() then
		return false
	end

	local cardWindow = player:getCardWindow()
	local index = cardWindow:getCardIndex(card)

	if index then
		local ok, detail = card:usedByPlayer(player, env.global["$BattleContext"], cellId, cost or 0, true)

		if not ok then
			return false
		end

		local newCard, nextCard = player:fillCardAtIndex(index)

		env.global.RecordImmediately(env, player:getId(), "RecruitCard", {
			type = "hero",
			idx = index,
			card = newCard and newCard:dumpInformation() or 0,
			next = nextCard and nextCard:dumpInformation() or 0
		})
		env.global["$SkillSystem"]:activateGlobalTrigger("HERO_CARD_CHANGEED", {
			player = player,
			idx = idx,
			oldcard = card,
			newcard = newCard
		})

		local spawnUnit = detail

		return spawnUnit
	else
		local removed, isFront = player:getCardPool():removeCard(card)

		if removed then
			local ok, detail = card:usedByPlayer(player, env.global["$BattleContext"], cellId, cost or 0, true)

			if not ok then
				return false
			end

			if isFront then
				local nextCard = player:getCardPool():getFrontCard()

				env.global.RecordImmediately(env, player:getId(), "RecruitCard", {
					type = "hero",
					next = nextCard and nextCard:dumpInformation() or 0
				})
			else
				env.global.RecordImmediately(env, player:getId(), "RecruitCard", {
					type = "hero"
				})
			end

			local spawnUnit = detail

			return spawnUnit
		else
			return false
		end
	end
end

function exports.DiligentRound(env, duration)
	local battlelogic = env.global["$BattleContext"]:getObject("BattleLogic")

	battlelogic:dispatchMessage({
		type = "DILIGENT_ROUND",
		args = {
			duration = duration
		}
	})
end

function exports.TruthBubble(env, unit)
	env.global.RecordImmediately(env, unit:getId(), "TruthBubble", {
		seed = env.global.random(1, 65535)
	})
end

function exports.InheritCard(env, card, modelId)
	if card and card:getType() == "hero" then
		local player = env["$actor"]:getOwner()
		local _cardInfo = card:getCardInfo()
		local cardSystem = env.global["$CardSystem"]
		local cardInfo = cardSystem:genNewHeroCard(player, _cardInfo, "b")

		if cardInfo.hero and cardInfo.hero.skills then
			for k, v in pairs(cardInfo.hero.skills.passive or {}) do
				if v.skillType and v.skillType == "Equip" then
					table.remove(cardInfo.hero.skills.passive, k)
				end
			end
		end

		cardInfo.hero.modelId = modelId

		if player:getCardState() == "skill" then
			for i = 1, 4 do
				local card_ws = player:takeCardAtIndex(i)

				if card_ws then
					player:backCardToPool(card_ws)
				end
			end

			player:setCardPool(player:getHeroCardPool())
			player:setupCardWindowWithHeroCards()
			env.global.RecordImmediately(env, player:getId(), "RemoveSCard")
		end

		local card = player:getCardPool():insertCardByInfo(cardInfo)

		env.global.RecordImmediately(env, player:getId(), "BackToCard", {
			type = "hero",
			card = card and card:dumpInformation() or 0
		})

		for idx = 1, 4 do
			if player:takeCardAtIndex(idx) == nil then
				local newCard, nextCard = player:fillCardAtIndex(idx)

				env.global.RecordImmediately(env, player:getId(), "Card", {
					type = "hero",
					idx = idx,
					card = newCard and newCard:dumpInformation() or 0,
					next = nextCard and nextCard:dumpInformation() or 0
				})
				env.global["$SkillSystem"]:activateGlobalTrigger("HERO_CARD_CHANGEED", {
					player = player,
					idx = idx,
					newcard = newCard
				})

				return card
			end
		end

		return card
	end

	return nil
end

function exports.BackToCard(env, unit)
	local player = env["$actor"]:getOwner()

	if unit:getCardInfo() then
		local formationSystem = env.global["$FormationSystem"]

		formationSystem:forbidenRevive(unit)

		local cardSystem = env.global["$CardSystem"]
		local cardInfo = cardSystem:genNewHeroCard(player, unit:getCardInfo(), "b")

		if player:getCardState() == "skill" then
			for i = 1, 4 do
				local card_ws = player:takeCardAtIndex(i)

				if card_ws then
					player:backCardToPool(card_ws)
				end
			end

			player:setCardPool(player:getHeroCardPool())
			player:setupCardWindowWithHeroCards()
			env.global.RecordImmediately(env, player:getId(), "RemoveSCard")
		end

		local card = player:getCardPool():insertCardByInfo(cardInfo)

		env.global.RecordImmediately(env, player:getId(), "BackToCard", {
			type = "hero",
			card = card and card:dumpInformation() or 0
		})

		for idx = 1, 4 do
			if player:takeCardAtIndex(idx) == nil then
				local newCard, nextCard = player:fillCardAtIndex(idx)

				env.global.RecordImmediately(env, player:getId(), "Card", {
					type = "hero",
					idx = idx,
					card = newCard and newCard:dumpInformation() or 0,
					next = nextCard and nextCard:dumpInformation() or 0
				})
				env.global["$SkillSystem"]:activateGlobalTrigger("HERO_CARD_CHANGEED", {
					player = player,
					idx = idx,
					newcard = newCard
				})

				return card
			end
		end

		return card
	end
end

function exports.BackToWindow(env, unit, windowIndex)
	local player = env["$actor"]:getOwner()

	if unit:getCardInfo() then
		local formationSystem = env.global["$FormationSystem"]

		formationSystem:forbidenRevive(unit)

		local cardSystem = env.global["$CardSystem"]
		local cardInfo = cardSystem:genNewHeroCard(player, unit:getCardInfo(), "b")

		if player:getCardState() == "skill" then
			for i = 1, 4 do
				local card_ws = player:takeCardAtIndex(i)

				if card_ws then
					player:backCardToPool(card_ws)
				end
			end

			player:setCardPool(player:getHeroCardPool())
			player:setupCardWindowWithHeroCards()
			env.global.RecordImmediately(env, player:getId(), "RemoveSCard")
		end

		local card = player:getCardPool():insertCardByInfo(cardInfo)

		env.global.RecordImmediately(env, player:getId(), "BackToCard", {
			type = "hero",
			card = card and card:dumpInformation() or 0
		})

		if windowIndex and windowIndex > 0 then
			local idx = windowIndex
			local card_ws = player:takeCardAtIndex(idx)

			if card_ws then
				player:backCardToPoolAtIndex(card_ws, 0)
			end

			local newCard, nextCard = player:fillCardAtIndex(idx)

			env.global.RecordImmediately(env, player:getId(), "Card", {
				type = "hero",
				idx = idx,
				card = newCard and newCard:dumpInformation() or 0,
				next = nextCard and nextCard:dumpInformation() or 0
			})
			env.global["$SkillSystem"]:activateGlobalTrigger("HERO_CARD_CHANGEED", {
				player = player,
				idx = idx,
				newcard = newCard
			})
		end

		return card
	end
end

function exports.RefreshCardPool(env, buffTag)
	local player = env["$actor"]:getOwner()

	for i = 1, 4 do
		local windowIndex = i
		local idx = windowIndex
		local card_ws = player:takeCardAtIndex(idx)

		if card_ws then
			player:backCardToPoolAtIndex(card_ws, 1)
		end
	end

	local cardSystem = env.global["$CardSystem"]

	cardSystem:sortCardInPool(player, buffTag)

	local cards = {}

	for i = 1, 4 do
		local card = player:fillCardAtIndex(i)
		cards[i] = card and card:dumpInformation() or 0
	end

	env.global.RecordImmediately(env, player:getId(), "RelocatCardWindow", {
		cards = cards,
		cardPoolSize = player:getCardPool():getTotalCount(),
		nextCard = player:getNextCard() and player:getNextCard():dumpInformation()
	})
end

function exports.RelocateExtraCard(env, cardType, cost)
	local player = env["$actor"]:getOwner()
	local extraCardPool = player:getExtraCardPool()
	local cardInstance = nil
	local windowIndex = 0

	for i = 1, 2 do
		if extraCardPool:getCardAtIndex(i):getType() == cardType then
			cardInstance = extraCardPool:getCardAtIndex(i)
			windowIndex = i

			break
		end
	end

	local cardSystem = env.global["$CardSystem"]
	local card = nil

	if cardType == "hero" then
		if not cardInstance:getCardInfo() then
			return
		end

		local cardInfo = cardSystem:genNewHeroCard(player, cardInstance:getCardInfo(), "b", true)
		card = player:getExtraCardPool():repleaceCard(cardInfo, windowIndex)
	end

	if cardType == "skill" then
		if not cardInstance:getSkillInfo() then
			return
		end

		local cardInfo = cardSystem:genNewSkillCard(cardInstance:getSkillInfo())
		card = player:getExtraCardPool():repleaceCard(cardInfo, windowIndex)
	end

	if cost and cost >= 0 then
		card:setRawCost(cost)
	end

	env.global.RecordImmediately(env, player:getId(), "BackToExtraCard", {
		type = cardType,
		idx = 4 + windowIndex,
		card = card and card:dumpInformation() or 0
	})

	if windowIndex and windowIndex > 0 then
		local idx = windowIndex
		local newCard = player:fillExtraCardAtIndex(idx)

		env.global.RecordImmediately(env, player:getId(), "Card", {
			next = 0,
			idx = 4 + idx,
			type = cardType,
			card = newCard and newCard:dumpInformation() or 0
		})
		env.global["$SkillSystem"]:activateGlobalTrigger("HERO_CARD_CHANGEED", {
			player = player,
			idx = idx,
			newcard = newCard
		})
	end
end

function exports.BackToExtraWindow(env, unit, windowIndex)
	local player = env["$actor"]:getOwner()

	if unit:getCardInfo() then
		local formationSystem = env.global["$FormationSystem"]

		formationSystem:forbidenRevive(unit)

		local cardSystem = env.global["$CardSystem"]
		local cardInfo = cardSystem:genNewHeroCard(player, unit:getCardInfo(), "b")
		local card = player:getExtraCardPool():insertCardByInfoAtIndex(cardInfo, windowIndex)

		env.global.RecordImmediately(env, player:getId(), "BackToExtraCard", {
			type = "hero",
			card = card and card:dumpInformation() or 0
		})

		if windowIndex and windowIndex > 0 then
			local idx = windowIndex
			local newCard = player:fillExtraCardAtIndex(idx)

			env.global.RecordImmediately(env, player:getId(), "Card", {
				next = 0,
				type = "hero",
				idx = idx,
				card = newCard and newCard:dumpInformation() or 0
			})
			env.global["$SkillSystem"]:activateGlobalTrigger("HERO_CARD_CHANGEED", {
				player = player,
				idx = idx,
				newcard = newCard
			})
		end

		return card
	end
end

function exports.GetCardWindowIndex(env, unit)
	if not unit then
		return 0
	end

	local cardInfo = unit:getCardInfo()

	if not cardInfo then
		return 0
	end

	if cardInfo.cardIndex then
		return cardInfo.cardIndex
	end

	return 0
end

function exports.GetAttackEffects(env, unit)
	local effects = unit:getAttackEffect()

	if effects and next(effects) then
		return effects
	end

	return {}
end

function exports.SelectHeroPassiveCount(env, unit, skillId)
	if not unit then
		return 0
	end

	local formationSystem = env.global["$FormationSystem"]

	if formationSystem == nil then
		return 0
	end

	return formationSystem:getPassiveCountOnHero(unit, skillId)
end

function exports.IsAwaken(env, unit)
	if not unit then
		return false
	end

	return unit:getAwakenLevel() > 0
end

function exports.HolyHide(env, unit, alpha)
	env.global.RecordImmediately(env, unit:getId(), "HolyHide", {
		alpha = alpha
	})
end

function exports.SummonEnemy(env, source, summonId, summonFactor, summonExtra, location, curHpRatio)
	local formationSystem = env.global["$FormationSystem"]
	local actor = env["$actor"]
	local factors = {
		hpRatio = summonFactor and summonFactor[1] or 1,
		atkRatio = summonFactor and summonFactor[2] or 1,
		defRatio = summonFactor and summonFactor[3] or 1,
		hpEx = summonExtra and summonExtra[1] or 0,
		atkEx = summonExtra and summonExtra[2] or 0,
		defEx = summonExtra and summonExtra[3] or 0,
		curHpRatio = curHpRatio or 1
	}

	return formationSystem:summonEnemy(actor, source, summonId, factors, location)
end

function exports.ActivateSpecificTrigger(env, unit, event, detail)
	local skillSystem = env.global["$SkillSystem"]

	skillSystem:activateSpecificTrigger(unit, event, detail)
end

function exports.ActivateGlobalTrigger(env, unit, event, detail)
	local skillSystem = env.global["$SkillSystem"]
	detail = detail or {}
	detail.unit = unit

	skillSystem:activateGlobalTrigger(event, detail)
end

function exports.ExertUniqueSkill(env, unit)
	local battleContext = env.global["$BattleContext"]
	local actionScheduler = battleContext:getObject("ActionScheduler")
	local skillComp = unit:getComponent("Skill")

	skillComp:setUniqueSkillRoutine(nil)
	actionScheduler:exertUniqueSkill(unit, kBattleUniqueSkill, true)
end
