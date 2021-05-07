local CARD_WINDOW_SIZE = 4
BattleCardWindow = class("BattleCardWindow", objectlua.Object, _M)

function BattleCardWindow:initialize()
	super.initialize(self)

	self._cardsCount = 0
	self._cards = {}
end

function BattleCardWindow:setCardAtIndex(index, card)
	if index < 1 or CARD_WINDOW_SIZE < index then
		return nil
	end

	local oldCard = self._cards[index]
	self._cards[index] = card

	if card and card.setCardIndex then
		card:setCardIndex(index)
	end

	if not oldCard and card then
		self._cardsCount = self._cardsCount + 1
	elseif oldCard and not card then
		self._cardsCount = self._cardsCount - 1
	end
end

function BattleCardWindow:getCardAtIndex(index)
	return self._cards[index]
end

function BattleCardWindow:getCardsCount()
	return self._cardsCount
end

function BattleCardWindow:getWindowSize()
	return CARD_WINDOW_SIZE
end

function BattleCardWindow:isAllEmpty()
	return self._cardsCount == 0
end

function BattleCardWindow:hasEmptyIndex()
	return self._cardsCount < CARD_WINDOW_SIZE
end

function BattleCardWindow:nextEmptyIndex(start)
	if start == nil or start < 1 then
		start = 1
	end

	local cards = self._cards

	for i = start, CARD_WINDOW_SIZE do
		if cards[i] == nil then
			return i
		end
	end

	return nil
end

function BattleCardWindow:collectEmptyIndices(indices)
	local count = 0
	local cards = self._cards

	for i = 1, CARD_WINDOW_SIZE do
		if cards[i] == nil then
			if indices then
				indices[#indices + 1] = i
			end

			count = count + 1
		end
	end

	return count
end

function BattleCardWindow:collectNonEmptyIndices(indices)
	local count = 0
	local cards = self._cards

	for i = 1, CARD_WINDOW_SIZE do
		if cards[i] ~= nil then
			if indices then
				indices[#indices + 1] = i
			end

			count = count + 1
		end
	end

	return count
end

function BattleCardWindow:getCardArray()
	local result = {}
	local count = 0
	local cards = self._cards

	for i = 1, CARD_WINDOW_SIZE do
		if cards[i] ~= nil then
			count = count + 1
			result[count] = cards[i]
		end
	end

	return result, count
end

function BattleCardWindow:removeCard(card)
	local cards = self._cards

	for i = 1, CARD_WINDOW_SIZE do
		if cards[i] == card then
			cards[i] = nil
			self._cardsCount = self._cardsCount - 1
		end
	end
end

function BattleCardWindow:getCardIndex(card)
	local cards = self._cards

	for i = 1, CARD_WINDOW_SIZE do
		if cards[i] == card then
			return i
		end
	end
end

function BattleCardWindow:visitCards(visitor)
	local cards = self._cards

	for i = 1, CARD_WINDOW_SIZE do
		if cards[i] ~= nil and visitor(cards[i], i) then
			return true
		end
	end
end
