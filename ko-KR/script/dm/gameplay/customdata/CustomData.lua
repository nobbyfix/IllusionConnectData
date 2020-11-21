CustomData = class("CustomData", objectlua.Object, _M)
PrefixType = {
	kGuide = "GUIDE",
	kStory = "STORY",
	kGlobal = "GLOBAL"
}

function CustomData:initialize(id)
	super.initialize(self)

	self._customData = {}
end

function CustomData:dispose()
	super.dispose(self)
end

function CustomData:sync(data)
	for key, value in pairs(data) do
		local keyData = string.split(key, "#")
		local prefixType = nil

		if #keyData == 1 then
			prefixType = PrefixType.kGlobal
			key = keyData[1]
		else
			prefixType = keyData[1]
			key = keyData[2]
		end

		self:setValue(prefixType, key, value)
	end
end

function CustomData:getValue(type, key, default)
	type = type or PrefixType.kGlobal
	local value = default
	local customData = self._customData[type]

	if customData and customData[key] ~= nil then
		value = customData[key] or value
	end

	return value
end

function CustomData:setValue(type, key, value)
	type = type or PrefixType.kGlobal
	local customData = self._customData[type]

	if customData == nil then
		customData = {}
		self._customData[type] = customData
	end

	customData[key] = value
end

function CustomData:getValuesByType(type)
	return self._customData[type]
end
