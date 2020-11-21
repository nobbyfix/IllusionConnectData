local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack

module("legs")

Actor = class("Actor", _G.DisposableObject, _M)

Actor:has("_eventDispatcher", {
	is = "r"
}):injectWith("legs_sharedEventDispatcher")
Actor:has("_eventMap", {
	is = "r"
})

function Actor:initialize()
	super.initialize(self)
end

function Actor:dispose()
	if self._eventMap ~= nil then
		self._eventMap:dispose()

		self._eventMap = nil
	end

	super.dispose(self)
end

function Actor:getEventMap()
	if self._eventMap == nil then
		self._eventMap = EventMap:new()
	end

	return self._eventMap
end

function Actor:dispatch(event)
	local eventDispatcher = self:getEventDispatcher()

	if eventDispatcher ~= nil then
		return eventDispatcher:dispatchEvent(event)
	end
end
