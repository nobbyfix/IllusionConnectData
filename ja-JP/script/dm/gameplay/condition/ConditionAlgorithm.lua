ConditionAlgorithm = class("ConditionAlgorithm", legs.Actor)

function ConditionAlgorithm:initialize(conditionkeeper)
	super.initialize(self)

	self._conditionkeeper = conditionkeeper

	self:register()
end

function ConditionAlgorithm:register()
	self._conditionkeeper:registerAlgorlthm("REACH", self.reach)
	self._conditionkeeper:registerAlgorlthm("REACHCOUNT", self.reachCount)
	self._conditionkeeper:registerAlgorlthm("LESSTHAN", self.lessThan)
end

function ConditionAlgorithm:reach(a, factor)
	return factor[1] <= a
end

function ConditionAlgorithm:reachCount(array, factor)
	local count = 0

	for i, value in pairs(array) do
		if factor[1] <= value then
			count = count + 1
		end
	end

	return factor[2] <= count
end

function ConditionAlgorithm:lessThan(a, factor)
	return a <= factor[1]
end
