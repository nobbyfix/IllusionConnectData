CardAgent = class("CardAgent")

function CardAgent:initialize(card)
	super.initialize(self)

	self._targetCard = card
	self._enchantRegistry = {}
	self._enchantList = nil
end

function CardAgent:getCard()
	return self._targetCard
end

function CardAgent:getId()
	return self._targetCard and self._targetCard:getId()
end

function CardAgent:addEnchantObject(enchantObject)
	assert(enchantObject ~= nil, "Invalid arguments")

	if self._enchantRegistry[enchantObject] ~= nil then
		return nil
	end

	self._enchantRegistry[enchantObject] = enchantObject
	local enchantList = self._enchantList

	if enchantList == nil then
		self._enchantList = {
			enchantObject
		}
	else
		enchantList[table.maxn(enchantList) + 1] = enchantObject
	end

	return enchantObject
end

function CardAgent:hasEnchantObject(enchantObject)
	return self._enchantRegistry[enchantObject] ~= nil
end

function CardAgent:getEnchants()
	local enchantList = self._enchantList

	if enchantList == nil then
		return {}
	end

	local enchantRegistry = self._enchantRegistry
	local holeIndex = nil

	for i = 1, table.maxn(enchantList) do
		local enchantObject = enchantList[i]

		if enchantRegistry[enchantObject] == nil then
			enchantList[i] = nil

			if holeIndex == nil then
				holeIndex = i
			end
		elseif holeIndex ~= nil then
			enchantList[holeIndex] = enchantObject
			enchantList[i] = nil
			holeIndex = holeIndex + 1
		end
	end

	return self._enchantList
end

function CardAgent:removeEnchantObject(enchantObject)
	assert(enchantObject ~= nil, "Invalid arguments")

	if self._enchantRegistry[enchantObject] ~= enchantObject then
		return nil
	end

	self._enchantRegistry[enchantObject] = nil

	return enchantObject
end

function CardAgent:retrieveEnchantGroup(groupId)
	if groupId == nil then
		return nil
	end

	local enchantGroups = self._enchantGroups

	if enchantGroups == nil then
		enchantGroups = {}
		self._enchantGroups = enchantGroups
	end

	local enchantGroup = enchantGroups[groupId]

	return enchantGroup
end

function CardAgent:createEnchantGroup(groupId, enchantObject)
	if groupId == nil then
		return nil
	end

	local enchantGroups = self._enchantGroups

	if enchantGroups == nil then
		enchantGroups = {}
		self._enchantGroups = enchantGroups
	end

	local enchantGroup = enchantGroups[groupId]

	if enchantGroup == nil and groupId ~= nil and enchantObject then
		enchantGroup = EnchantGroup:new(enchantObject)

		enchantGroup:setGroupId(groupId)

		enchantGroups[groupId] = enchantGroup
	end

	return enchantGroup
end

function CardAgent:discardEnchantGroup(groupId)
	local enchantGroups = self._enchantGroups

	if enchantGroups == nil or groupId == nil then
		return nil
	end

	local enchantGroup = enchantGroups[groupId]
	enchantGroups[groupId] = nil

	return enchantGroup
end
