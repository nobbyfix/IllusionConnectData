HealthComponent = class("HealthComponent", BaseComponent, _M)

function HealthComponent:initialize()
	self._shieldRatio = 1
	self._hpRecoverRatio = 1

	super.initialize(self)
end

function HealthComponent:initWithRawData(data)
	super.initWithRawData(self, data)

	local ratio = data.ratio or 1

	self:setMaxHp(data.maxHp * ratio * (GameConfigs and GameConfigs.healthMulti or 1))
	self:setHp((data.hp or data.maxHp) * ratio * (GameConfigs and GameConfigs.healthMulti or 1))
end

function HealthComponent:setHp(val)
	if val < 0 then
		self._hp = 0
	else
		local hp0 = self._hp
		local upLimit = self:getHpUpLimit()

		if upLimit then
			if upLimit <= hp0 then
				if val < hp0 then
					self._hp = val
				end
			elseif upLimit < val then
				self._hp = upLimit
			else
				self._hp = val
			end
		else
			self._hp = val
		end
	end
end

function HealthComponent:getHp()
	local val = self._hp or 0
	val = math.max(val, 0)
	local maxval = self._maxHp or 0

	return val < maxval and val or maxval
end

function HealthComponent:setMaxHp(val)
	assert(val >= 0, "Maximum HP mustn't be negative!")

	self._maxHp = val
end

function HealthComponent:getMaxHp()
	return self._maxHp or 0
end

function HealthComponent:getHpRatio()
	local val = self:getHp()
	local maxval = self._maxHp or 0

	return val >= maxval and 1 or val / maxval
end

function HealthComponent:ratioOfMaxHp(value)
	local maxval = self._maxHp or 0

	return value >= maxval and 1 or value / maxval
end

function HealthComponent:isDying()
	return (self._hp or 0) <= 0
end

function HealthComponent:applyDamage(value, lowerLimitValue)
	if value < 0 then
		return nil
	end

	local hp0 = self:getHp()
	local result = {
		raw = value
	}
	local finalValue = hp0 - value

	if lowerLimitValue ~= nil and finalValue < lowerLimitValue then
		finalValue = lowerLimitValue
		result.limited = true
	end

	if finalValue == hp0 then
		result.eft = 0
		result.val = hp0
	else
		self:setHp(finalValue)

		local hp = self:getHp()
		result.eft = hp0 - hp
		result.val = hp

		if hp <= 0 and hp0 > 0 then
			result.deadly = true
		end
	end

	return result
end

function HealthComponent:applyRecovery(value)
	value = value * self:getHpRecoverRatio()

	if value < 0 then
		return nil
	end

	value = math.floor(value)
	local hp0 = self:getHp()

	self:setHp(hp0 + value)

	local hp = self:getHp()
	local effective = hp - hp0

	return {
		raw = value,
		eft = effective,
		val = hp
	}
end

function HealthComponent:modifyMaxHp(eft)
	local maxHp, hp = nil
	local maxHp0 = self:getMaxHp()
	maxHp = math.max(maxHp0 + eft, 1)

	self:setMaxHp(maxHp)

	if eft >= 0 then
		local hp0 = self:getHp()
		hp = hp0 + eft / maxHp0 * hp0

		self:setHp(hp)
	end

	hp = self:getHp()

	return hp, maxHp
end

function HealthComponent:copyComponent(srcComp, ratio)
	ratio = ratio or 1
	local hpRatio = type(ratio) == "table" and (ratio.hpRatio or 1) or ratio
	local hpEx = type(ratio) == "table" and ratio.hpEx or 0
	local curHpRatio = type(ratio) == "table" and (ratio.curHpRatio or 1) or 1

	self:setMaxHp(srcComp:getMaxHp() * hpRatio + hpEx)
	self:setHp(self:getMaxHp() * curHpRatio)
end

function HealthComponent:getShield()
	local val = self._shield or 0

	return val >= 0 and val or 0
end

function HealthComponent:addShield(shieldValue, upLimit, source)
	shieldValue = shieldValue * self:getShieldRatio()
	local newValue = self:getShield() + shieldValue
	self._shield = upLimit and upLimit < newValue and upLimit or newValue
	self._shieldSources = self._shieldSources or {}

	if source then
		self._shieldSources[#self._shieldSources + 1] = source
	end

	return self._shield
end

function HealthComponent:addShieldRatio(ratio)
	self._shieldRatio = self:getShieldRatio() + ratio
end

function HealthComponent:addHpRecoverRatio(ratio)
	self._hpRecoverRatio = self:getHpRecoverRatio() + ratio
end

function HealthComponent:getHpRecoverRatio()
	return self._hpRecoverRatio or 1
end

function HealthComponent:getShieldRatio()
	return self._shieldRatio or 1
end

function HealthComponent:cancelShield(source)
	if self._shieldSources then
		for i = 1, #self._shieldSources do
			if self._shieldSources[i] == source then
				table.remove(self._shieldSources, i)

				break
			end
		end
	end

	if self._shieldSources == nil or #self._shieldSources == 0 then
		self._shield = 0
	end

	return self._shield
end

function HealthComponent:consumeShield(value)
	local shield = self._shield
	local sources = self._shieldSources

	if shield == nil or shield == 0 then
		return nil
	end

	if value < self._shield then
		self._shield = self._shield - value

		return {
			cost = value,
			val = self._shield
		}
	else
		self._shield = 0
		self._shieldSources = {}

		return {
			val = 0,
			cost = shield,
			sources = sources
		}
	end
end

function HealthComponent:resetShield()
	self._shield = 0
	self._shieldSources = {}
end

function HealthComponent:addImmune()
	if not self._immune then
		self._immune = 1
	else
		self._immune = self._immune + 1
	end
end

function HealthComponent:isImmune()
	return self._immune and self._immune > 0
end

function HealthComponent:cancelImmune()
	if not self._immune then
		return
	end

	self._immune = self._immune - 1

	if self._immune <= 0 then
		self._immune = nil
	end
end

function HealthComponent:setTrasforHpComp(target, radio)
	self._tansforHpComp = target
	self._tansforHpRadio = radio
end

function HealthComponent:removeTrasforHpComp()
	self._tansforHpComp = nil
	self._tansforHpRadio = nil
end

function HealthComponent:getTrasforHpComp()
	if self._tansforHpComp and self._tansforHpComp:getEntity() then
		return {
			comp = self._tansforHpComp,
			radio = self._tansforHpRadio
		}
	end

	return nil
end

function HealthComponent:addExtraLife(value, source)
	assert(value > 0)

	local extraLives = self._extraLives

	if extraLives == nil then
		extraLives = {
			value = value,
			sources = {
				source
			}
		}
		self._extraLives = extraLives
	else
		extraLives.value = extraLives.value + value
		extraLives.sources[#extraLives.sources + 1] = source
	end

	return extraLives.value
end

function HealthComponent:removeExtraLife(source)
	local extraLives = self._extraLives

	if extraLives == nil then
		return nil
	end

	local sources = extraLives.sources

	for i = 1, #sources do
		if sources[i] == source then
			table.remove(sources, i)

			break
		end
	end

	local remaining = extraLives.value

	if #sources == 0 then
		remaining = 0
		self._extraLives = nil
	end

	return remaining
end

function HealthComponent:getExtraLives()
	local extraLives = self._extraLives

	return extraLives and extraLives.value or 0
end

function HealthComponent:consumeExtraLife()
	local extraLives = self._extraLives

	if extraLives == nil then
		return nil
	end

	local remain = extraLives.value - 1

	if remain <= 0 then
		self._extraLives = nil

		return {
			remain = 0,
			sources = extraLives.sources
		}
	else
		extraLives.value = remain

		return {
			remain = remain
		}
	end
end

function HealthComponent:addHpUpLimit(value, source)
	assert(value > 0)

	local upLimit = self._hpUpLimit

	if upLimit == nil then
		upLimit = {
			value = value,
			sources = {
				source
			}
		}
		self._hpUpLimit = upLimit
	else
		upLimit.value = value
		upLimit.sources[#extraLives.sources + 1] = source
	end

	return upLimit.value
end

function HealthComponent:cancelHpUpLimit(source)
	local upLimit = self._hpUpLimit

	if upLimit == nil then
		return nil
	end

	local sources = upLimit.sources

	for i = 1, #sources do
		if sources[i] == source then
			table.remove(sources, i)

			break
		end
	end

	local remaining = upLimit.value

	if #sources == 0 then
		self._hpUpLimit = nil
	end

	return remaining
end

function HealthComponent:getHpUpLimit()
	local upLimit = self._hpUpLimit

	return upLimit and upLimit.value
end
