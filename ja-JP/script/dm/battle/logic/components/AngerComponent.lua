local floor = math.floor
AngerRules = {
	kFromDamage = "a1",
	kAfterAction = "a2",
	kKilling = "a3",
	kPerSecond = "a4"
}
AngerComponent = class("AngerComponent", BaseComponent, _M)

AngerComponent:has("_growthRate", {
	is = "r"
})

function AngerComponent:initialize()
	super.initialize(self)

	self._growthRate = AttributeNumber:new(1)
end

function AngerComponent:initWithRawData(data)
	super.initWithRawData(self, data)
	self:setMaxAnger(1000)
	self:setAnger(data.anger or 0)
	self._growthRate:setBase(data.rageRate or 1)
	self:setupAngerRules(data.angerRules)
end

function AngerComponent:pauseRecovery()
	self._pause = true
end

function AngerComponent:resumeRecovery()
	self._pause = false
end

function AngerComponent:setAnger(val)
	if val < 0 then
		self._anger = 0
	else
		self._anger = val
	end
end

function AngerComponent:getAnger()
	local val = self._anger or 0
	local maxval = self._maxAnger or 0

	return val < maxval and val or maxval
end

function AngerComponent:setMaxAnger(val)
	assert(val >= 0, "Maximum anger point mustn't be negative!")

	self._maxAnger = val
end

function AngerComponent:getMaxAnger()
	return self._maxAnger or 0
end

function AngerComponent:isFull()
	local val = self._anger or 0
	local maxval = self._maxAnger or 0

	return val >= maxval
end

function AngerComponent:getAngerRatio()
	local val = self._anger or 0
	local maxval = self._maxAnger or 0

	return val >= maxval and 1 or val / maxval
end

function AngerComponent:accumulateAngerPoint(value)
	local anger0 = self:getAnger()

	self:setAnger(anger0 + value)

	local anger = self:getAnger()

	return anger - anger0, anger
end

function AngerComponent:applyDamage(value)
	if value < 0 then
		return nil
	end

	local anger0 = self:getAnger()

	self:setAnger(anger0 - value)

	local anger = self:getAnger()
	local effective = anger0 - anger

	return {
		raw = -value,
		eft = -effective,
		val = anger
	}
end

function AngerComponent:applyRecovery(value)
	local growthRate = self._growthRate:value()
	value = floor(value * growthRate)

	if value < 0 then
		return nil
	end

	local anger0 = self:getAnger()

	self:setAnger(anger0 + value)

	local anger = self:getAnger()
	local effective = anger - anger0

	return {
		raw = value,
		eft = effective,
		val = anger
	}
end

function AngerComponent:setupAngerRules(rules)
	local angerRules = {}

	if rules then
		for name, factors in pairs(rules) do
			if type(factors) == "number" then
				angerRules[name] = {
					factors
				}
			else
				angerRules[name] = factors
			end
		end
	end

	self._angerRules = angerRules
end

function AngerComponent:applyAngerRule(ruleName, a)
	if self._pause then
		return nil
	end

	local angerRules = self._angerRules
	local factors = angerRules and angerRules[ruleName]

	if factors == nil then
		return nil
	end

	local inc = factors[1] or 0

	if a and factors[2] then
		inc = inc + factors[2] * a
	end

	local growthRate = 1
	inc = floor(inc * growthRate)

	if inc <= 0 then
		return nil
	end

	return self:applyRecovery(inc)
end

function AngerComponent:getAngerRules()
	return self._angerRules
end

function AngerComponent:setAngerRules(rules)
	self._angerRules = rules
end

function AngerComponent:copyComponent(srcComp, ratio)
	self:setMaxAnger(1000)
	self:setAnger(0)

	self._angerRules = srcComp._angerRules
end
