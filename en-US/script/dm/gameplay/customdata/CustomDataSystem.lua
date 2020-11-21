CustomDataSystem = class("CustomDataSystem", Facade, _M)

CustomDataSystem:has("_service", {
	is = "r"
}):injectWith("CustomDataService")
CustomDataSystem:has("_customData", {
	is = "rw"
})

function CustomDataSystem:initialize()
	super.initialize(self)

	self._customData = CustomData:new()
end

function CustomDataSystem:requestSaveData(data, notShowWaiting, callback)
	local params = {
		updateData = data
	}

	self:getService():requestSaveData(params, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback()
		end
	end, notShowWaiting)
end

function CustomDataSystem:requestGetData(notShowWaiting, callback)
	self:getService():requestGetData(function (response)
		if response.resCode == GS_SUCCESS then
			self:sync(response.data.customData)

			if callback then
				callback()
			end
		end
	end, notShowWaiting)
end

function CustomDataSystem:requestDeleteData(data, notShowWaiting, callback)
	local params = {
		delData = data
	}

	self:getService():requestDeleteData(params, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback()
		end
	end, notShowWaiting)
end

function CustomDataSystem:sync(data)
	if data == nil then
		return
	end

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
	end

	self._customData:sync(data)
end

function CustomDataSystem:setValue(type, key, value, callback)
	type = type or PrefixType.kGlobal
	local saveData = {
		[type .. "#" .. key] = value
	}

	self:requestSaveData(saveData, true, function ()
		self._customData:setValue(type, key, value)

		if callback then
			callback()
		end
	end)
end

function CustomDataSystem:setValues(type, data)
	if data == nil then
		return
	end

	type = type or PrefixType.kGlobal
	local saveData = {}

	for key, value in pairs(data) do
		key = type .. "#" .. key
		saveData[key] = value
	end

	self:requestSaveData(saveData, true, function ()
		for key, value in pairs(data) do
			self._customData:setValue(type, key, value)
		end
	end)
end

function CustomDataSystem:getValue(type, key, default)
	return self._customData:getValue(type, key, default)
end

function CustomDataSystem:delValues(type, keys, callback)
	if keys == nil then
		return
	end

	type = type or PrefixType.kGlobal
	local delData = {}

	for _, key in pairs(keys) do
		key = type .. "#" .. key
		delData[#delData + 1] = key
	end

	self:requestDeleteData(delData, true, function ()
		for _, key in pairs(keys) do
			self._customData:setValue(type, key, nil)
		end

		if callback then
			callback()
		end
	end)
end

function CustomDataSystem:clearValuesByType(type)
	local keys = self._customData:getValuesByType(type)

	if keys == nil then
		return
	end

	local delData = {}

	for key, value in pairs(keys) do
		key = type .. "#" .. key
		delData[#delData + 1] = key
	end

	self:requestDeleteData(delData, true, function ()
		for key, value in pairs(keys) do
			self._customData:setValue(type, key, nil)
		end
	end)
end
