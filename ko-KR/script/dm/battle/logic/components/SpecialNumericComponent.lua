local floor = math.floor
local ceil = math.ceil
local ToIntMethod = {
	Floor = function (g)
		return function (self)
			return floor(g(self))
		end
	end,
	Ceil = function (g)
		return function (self)
			return ceil(g(self))
		end
	end,
	Round = function (g)
		return function (self)
			return floor(g(self) + 0.5)
		end
	end
}

local function numericAttribute(toInt)
	local attr = AttributeNumber:new()

	if toInt ~= nil then
		attr.value = toInt(attr.value)
	end

	return attr
end

SpecialNumericComponent = class("SpecialNumericComponent", BaseComponent, _M)

function SpecialNumericComponent:initialize()
	super.initialize(self)

	self._attrs = {}
end

function SpecialNumericComponent:initWithRawData(data)
	super.initWithRawData(self, data)
end

function SpecialNumericComponent:attributes()
	return self._attrs
end

function SpecialNumericComponent:getAttribute(name)
	if self._attrs[name] then
		return self._attrs[name]
	else
		attr = numericAttribute()
		attr.name = name
		self._attrs[name] = attr

		return attr
	end
end

function SpecialNumericComponent:getAttrValue(name)
	local attr = self._attrs[name]

	return attr and attr:value() or 0
end

function SpecialNumericComponent:getAttrBase(name)
	local attr = self._attrs[name]

	return attr and attr:getBase() or 0
end

function SpecialNumericComponent:copyComponent(srcComp, ratio)
end
