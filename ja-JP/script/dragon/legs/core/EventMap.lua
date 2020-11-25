local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack
local pairs = pairs
local ipairs = ipairs
local next = next

module("legs")

local ListenerSet = {
	new = function (self)
		local obj = {}

		return _G.setmetatable(obj, {
			__index = self
		})
	end,
	add = function (self, target, listener, useCapture)
		if self._targets == nil then
			self._targets = {}
		end

		local listeners = self._targets[target]

		if listeners == nil then
			listeners = {}
			self._targets[target] = listeners
		end

		local types = listeners[listener]

		if types == nil then
			types = {}
			listeners[listener] = types
		end

		types[useCapture and 1 or 0] = true
	end,
	remove = function (self, target, listener, useCapture)
		if self._targets == nil then
			return false
		end

		local listeners = self._targets[target]

		if listeners == nil then
			return false
		end

		local types = listeners[listener]

		if types == nil then
			return false
		end

		local c = useCapture and 1 or 0
		local result = types[c] == true
		types[c] = nil

		if next(types) == nil then
			listeners[listener] = nil

			if next(listeners) == nil then
				self._targets[target] = nil
			end
		end

		return result
	end,
	contains = function (self, target, listener, useCapture)
		if self._targets == nil then
			return false
		end

		local listeners = self._targets[target]

		if listeners == nil then
			return false
		end

		local types = listeners[listener]

		if types == nil then
			return false
		end

		return types[useCapture and 1 or 0] == true
	end,
	clear = function (self)
		self._targets = nil
	end,
	all = function (self)
		if self._targets == nil then
			return function ()
				return nil, , 
			end
		end

		local result = {}

		for target, listeners in pairs(self._targets) do
			for listener, types in pairs(listeners) do
				for captureType, v in pairs(types) do
					result[#result + 1] = {
						target = target,
						listener = listener,
						useCapture = captureType == 1
					}
				end
			end
		end

		return function (result, last)
			local i = last + 1
			local e = result[i]

			if e == nil then
				return nil
			else
				return i, e.target, e.listener, e.useCapture
			end
		end, result, 0
	end
}
EventMap = class("EventMap", _G.DisposableObject, _M)

function EventMap:initialize()
	super.initialize(self)

	self._dispatcherToTypesMap = {}
end

function EventMap:dispose()
	self:unmapListeners()
end

function EventMap:mapListener(dispatcher, type, target, listener, useCapture, priority)
	assert(dispatcher ~= nil, " EventMap:mapListener : dispatcher should not be nil!")

	local eventTypeMap = self._dispatcherToTypesMap[dispatcher]

	if eventTypeMap == nil then
		eventTypeMap = {}
		self._dispatcherToTypesMap[dispatcher] = eventTypeMap
	end

	local lset = eventTypeMap[type]

	if lset == nil then
		lset = ListenerSet:new()
		eventTypeMap[type] = lset
	end

	lset:add(target, listener, useCapture or false)
	dispatcher:addEventListener(type, target, listener, useCapture or false, priority or 0)
end

function EventMap:unmapListener(dispatcher, type, target, listener, useCapture)
	local eventTypeMap = self._dispatcherToTypesMap[dispatcher]

	if eventTypeMap == nil then
		return
	end

	local lset = eventTypeMap[type]

	if dispatcher == nil or lset == nil then
		return
	end

	if lset:remove(target, listener, useCapture or false) then
		dispatcher:removeEventListener(type, target, listener, useCapture or false)
	end
end

function EventMap:unmapListeners()
	for dispatcher, eventTypeMap in pairs(self._dispatcherToTypesMap) do
		for type, set in pairs(eventTypeMap) do
			for i, target, listener, useCapture in set:all() do
				dispatcher:removeEventListener(type, target, listener, useCapture or false)
			end
		end
	end

	self._dispatcherToTypesMap = {}
end
