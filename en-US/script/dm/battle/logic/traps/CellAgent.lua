CellAgent = class("CellAgent")

function CellAgent:initialize(cell)
	super.initialize(self)

	self._targetCell = cell
	self._trapRegistry = {}
	self._trapList = nil
end

function CellAgent:getCell()
	return self._targetCell
end

function CellAgent:getId()
	return self._targetCell and self._targetCell:getId()
end

function CellAgent:addTrapObject(trapObject)
	assert(trapObject ~= nil, "Invalid arguments")

	if self._trapRegistry[trapObject] ~= nil then
		return nil
	end

	self._trapRegistry[trapObject] = trapObject
	local trapList = self._trapList

	if trapList == nil then
		self._trapList = {
			trapObject
		}
	else
		trapList[table.maxn(trapList) + 1] = trapObject
	end

	return trapObject
end

function CellAgent:hasTrapObject(trapObject)
	return self._trapRegistry[trapObject] ~= nil
end

function CellAgent:getTraps()
	local trapList = self._trapList

	if trapList == nil then
		return {}
	end

	local trapRegistry = self._trapRegistry
	local holeIndex = nil

	for i = 1, table.maxn(trapList) do
		local trapObject = trapList[i]

		if trapRegistry[trapObject] == nil then
			trapList[i] = nil

			if holeIndex == nil then
				holeIndex = i
			end
		elseif holeIndex ~= nil then
			trapList[holeIndex] = trapObject
			trapList[i] = nil
			holeIndex = holeIndex + 1
		end
	end

	return self._trapList
end

function CellAgent:removeTrapObject(trapObject)
	assert(trapObject ~= nil, "Invalid arguments")

	if self._trapRegistry[trapObject] ~= trapObject then
		return nil
	end

	self._trapRegistry[trapObject] = nil

	return trapObject
end
