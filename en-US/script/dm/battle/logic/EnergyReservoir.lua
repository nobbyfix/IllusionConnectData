local floor = math.floor
EnergyReservoir = class("EnergyReservoir")
local kDefaultCapacity = 10
local kDefaultBase = 0
local kDefaultScale = {
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1,
	1
}

EnergyReservoir:has("_capacity", {
	is = "rw"
})
EnergyReservoir:has("_baseEnergy", {
	is = "rw"
})

function EnergyReservoir:initialize()
	super.initialize(self)

	self._capacity = kDefaultCapacity
	self._baseEnergy = kDefaultBase
	self._energy = 0
	self._speed = AttributeNumber:new()
	self._speedScale = AttributeNumber:new()

	self._speedScale:setBase(1)
end

function EnergyReservoir:initWithData(data)
	self._capacity = data and data.capacity or kDefaultCapacity
	self._baseEnergy = data and data.base or kDefaultBase
	self._scaleConfig = data and data.scale or kDefaultScale

	return self
end

function EnergyReservoir:getSpeedComponent()
	return self._speed
end

function EnergyReservoir:setBaseSpeed(val)
	self._speed:setBase(val)
end

function EnergyReservoir:getSpeedValue()
	return self._speed:value() * self._speedScale:value()
end

function EnergyReservoir:getEnergy()
	return self._energy or 0
end

function EnergyReservoir:addEnergy(delta)
	local result = (self._energy or 0) + delta

	if result < 0 then
		self._energy = 0
	elseif self._capacity < result then
		self._energy = self._capacity
	elseif tonumber(string.format("%d", delta)) == delta then
		self._energy = result
	else
		tmpDelta = delta - floor(delta)
		local tmpEnergy = floor((self._tmpEnergy or 0) + tmpDelta * 1000)
		self._energy = floor(result)

		if tmpEnergy < 1000 then
			self._tmpEnergy = tmpEnergy
		else
			local remain = tmpEnergy % 1000
			local incremental = floor((tmpEnergy - remain) / 1000)
			local newValue = self:addEnergy(incremental)

			if newValue < self._capacity then
				self._tmpEnergy = remain
			else
				self._tmpEnergy = 0
			end

			self._immediateSpeed = self:getSpeedValue()
		end
	end

	return self._energy
end

function EnergyReservoir:isEnough(required)
	return required <= self._energy
end

function EnergyReservoir:consume(cost)
	local cost = math.ceil(cost)
	local energy = self._energy or 0

	if cost <= energy then
		local speed = nil

		if self._capacity < energy then
			self._immediateSpeed = self:getSpeedValue()
		end

		self._energy = energy - cost

		return {
			self._energy,
			self._tmpEnergy * 0.001,
			self._immediateSpeed
		}
	end

	return nil
end

function EnergyReservoir:reduce(cost)
	local energy = self._energy or 0

	if cost > energy then
		cost = energy
	end

	return self:consume(cost)
end

function EnergyReservoir:recover(value)
	self:addEnergy(value)

	return {
		self._energy,
		self._tmpEnergy * 0.001,
		self._immediateSpeed
	}
end

function EnergyReservoir:start(battleContext)
	self._energy = self._baseEnergy or kDefaultBase
	self._tmpEnergy = 0
	self._immediateSpeed = nil
end

function EnergyReservoir:update(dt, count, speedScale)
	local energyScale = self._scaleConfig[count] or 1
	local changed = false

	if self._speedScale:value() ~= energyScale * speedScale then
		self._speedScale:setBase(energyScale * speedScale)

		changed = true
	end

	local isKeyframe = false

	if self._immediateSpeed == nil then
		self._immediateSpeed = self:getSpeedValue()
		isKeyframe = true
	else
		local capacity = self:getCapacity()
		local oldValue = self:getEnergy()

		if capacity <= oldValue then
			return
		end

		local tmpEnergy = floor((self._tmpEnergy or 0) + self._immediateSpeed * dt)

		if tmpEnergy < 1000 then
			self._tmpEnergy = tmpEnergy

			if changed then
				self._immediateSpeed = self:getSpeedValue()
			end
		else
			local remain = tmpEnergy % 1000
			local incremental = (tmpEnergy - remain) / 1000
			local newValue = self:addEnergy(incremental)

			if newValue < capacity then
				self._tmpEnergy = remain
			else
				self._tmpEnergy = 0
			end

			isKeyframe = oldValue ~= newValue
			self._immediateSpeed = self:getSpeedValue()
		end
	end

	if changed then
		return {
			self._energy,
			self._tmpEnergy * 0.001,
			self._immediateSpeed
		}
	end

	if isKeyframe then
		return {
			self._energy,
			self._tmpEnergy * 0.001,
			self._immediateSpeed
		}
	end
end
