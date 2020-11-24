BuffTiming = {
	kAfterActing = 2,
	kOnRoundEnded = 3,
	kOnNewSecond = 4,
	kNever = 0,
	kBeforeActing = 1
}
BuffObject = class("BuffObject")

BuffObject:has("_config", {
	is = "r"
})
BuffObject:has("_duration", {
	is = "r"
})
BuffObject:has("_display", {
	is = "r"
})
BuffObject:has("_timing", {
	is = "r"
})
BuffObject:has("_source", {
	is = "rw"
})
BuffObject:has("_buffGroup", {
	is = "rw"
})

function BuffObject:initialize(config, effects)
	super.initialize(self)

	self._id = string.sub(tostring(self), 7)

	assert(effects ~= nil, "Invalid arguments")

	self._config = config
	self._effects = effects
	self._tagset = {}

	if config then
		self._duration = config.duration
		self._timing = config.timing
		self._display = config.display
		local tags = config.tags

		if tags ~= nil then
			local tagset = self._tagset

			for i = 1, #tags do
				tagset[tags[i]] = 1
			end
		end
	end
end

function BuffObject:cloneEffects()
	return self._effects
end

function BuffObject:getEffect(index)
	return self._effects and self._effects[index]
end

function BuffObject:clone()
	return self.class:new(self._config, self._effects)
end

function BuffObject:isMatched(buffTag)
	return self._tagset ~= nil and self._tagset[buffTag]
end

function BuffObject:addTag(tag)
	if tag ~= nil then
		local counter = self._tagset[tag]
		self._tagset[tag] = (counter or 0) + 1
	end
end

function BuffObject:removeTag(tag)
	local counter = self._tagset[tag]

	if counter > 1 then
		self._tagset[tag] = counter - 1
	else
		self._tagset[tag] = nil
	end
end

function BuffObject:takeEffect(target)
	if self._lifespan == nil then
		self:setupLifespan(self._duration)
	end

	self._target = target
	local rawTarget = target:getTargetObject()
	local effects = self._effects
	local eftdetails = nil

	for i = 1, #effects do
		local _, detail = effects[i]:takeEffect(rawTarget, self)

		if detail ~= nil then
			if eftdetails == nil then
				eftdetails = {}
			end

			eftdetails[#eftdetails + 1] = detail
		end
	end

	local detail = nil

	if self._display ~= nil or eftdetails ~= nil then
		detail = {
			buffId = self._groupId or self._id,
			disp = self._display,
			eft = eftdetails,
			dur = self._duration
		}
	end

	return target, detail
end

function BuffObject:cancelEffect(isBroke)
	local target = self._target

	if target == nil then
		return nil
	end

	local rawTarget = target:getTargetObject()
	local effects = self._effects
	local eftdetails = nil

	for i = #effects, 1, -1 do
		local _, detail = effects[i]:cancelEffect(rawTarget, self, isBroke)

		if detail ~= nil then
			if eftdetails == nil then
				eftdetails = {}
			end

			eftdetails[#eftdetails + 1] = detail
		end
	end

	self._target = nil
	local detail = nil

	if self._display ~= nil or eftdetails ~= nil then
		detail = {
			buffId = self._groupId or self._id,
			disp = self._display,
			eft = eftdetails
		}
	end

	return target, detail
end

function BuffObject:getActiveTarget()
	return self._target
end

function BuffObject:isActive()
	return self._target ~= nil
end

function BuffObject:isGroup()
	return false
end

function BuffObject:updateTiming(battleContext, timingMode)
	if self._timing ~= timingMode then
		return
	end

	if not self:decreaseLifespan(1, battleContext) then
		if self._display then
			return {
				buffId = self._groupId or self._id,
				disp = self._display,
				dur = self:getLifespan()
			}
		end

		return
	end
end

function BuffObject:setupLifespan(lifespan)
	self._lifespan = lifespan
end

function BuffObject:getLifespan()
	return self._lifespan or 0
end

function BuffObject:isUsedUp()
	if self:getLifespan() <= 0 then
		return true
	end
end

function BuffObject:decreaseLifespan(delta, battleContext)
	local lifespan = self._lifespan

	if lifespan == nil or lifespan <= 0 then
		return true
	end

	lifespan = lifespan - delta
	local usedup = lifespan <= 0
	self._lifespan = usedup and 0 or lifespan

	for _, effect in ipairs(self._effects) do
		effect:tick(battleContext, self)
	end

	return usedup
end

function BuffObject:resetLifespan()
	self._lifespan = self._duration
end

function BuffObject:setEffectValue(effect, name, value)
	local values = self[effect]

	if values == nil then
		if value == nil then
			return
		end

		self[effect] = {
			[name] = value
		}
	else
		values[name] = value
	end
end

function BuffObject:getEffectValue(effect, name)
	local values = self[effect]

	return values and values[name]
end
