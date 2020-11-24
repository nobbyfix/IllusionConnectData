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

function exports.ApplyEnergyRecovery(env, player, energy)
	local energyInfo = player:recoverEnergy(energy)

	env.global.RecordImmediately(env, player:getId(), "SyncERecovery", energyInfo)
end

function exports.Recruit(env, cardfilter, location)
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

		resultCard:usedByPlayer(player, env.global["$BattleContext"], cellId, 0, true)

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

		resultCard:usedByPlayer(player, env.global["$BattleContext"], cellId, 0, true)

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

function exports.RecruitCard(env, card, location)
	local player = env["$actor"]:getOwner()
	local battleField = env.global["$BattleContext"]:getObject("BattleField")
	local cellId = battleField:findEmptyCellId(player:getSide(), location)

	if not cellId then
		return
	end

	local cardWindow = player:getCardWindow()
	local index = cardWindow:getCardIndex(card)

	if index then
		card:usedByPlayer(player, env.global["$BattleContext"], cellId, 0, true)

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
	else
		local removed, isFront = player:getCardPool():removeCard(card)

		if removed then
			card:usedByPlayer(player, env.global["$BattleContext"], cellId, 0, true)

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

function exports.DiligentRound(env)
	local battlelogic = env.global["$BattleContext"]:getObject("BattleLogic")

	battlelogic:dispatchMessage({
		type = "DILIGENT_ROUND"
	})
end

function exports.TruthBubble(env, unit)
	env.global.RecordImmediately(env, unit:getId(), "TruthBubble", {
		seed = env.global.random(1, 65535)
	})
end

function exports.BackToCard(env, unit)
	local player = env["$actor"]:getOwner()

	if unit:getCardInfo() and player:getCardState() ~= "skill" then
		local cardSystem = env.global["$CardSystem"]
		local cardInfo = cardSystem:genNewHeroCard(unit:getCardInfo(), "b")
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
