local class = _G.class
local objectlua = _G.objectlua
local next = _G.next

module("event", package.seeall)

EventDispatcher = class("EventDispatcher", objectlua.Object)

function EventDispatcher:initialize()
	super.initialize(self)

	self._eventMapping = {}
end

function EventDispatcher:addEventListener(type, object, listener, useCapture, priority)
	if self._eventMapping == nil then
		self._eventMapping = {}
	end

	local listeners = self._eventMapping[type]

	if listeners == nil then
		listeners = EventListenerBucket:new()
		self._eventMapping[type] = listeners
	end

	return listeners:addListener(object, listener, useCapture or false, priority or 0)
end

function EventDispatcher:hasEventListener(type)
	local listeners = self._eventMapping and self._eventMapping[type]

	return listeners ~= nil and listeners:count() > 0
end

function EventDispatcher:removeEventListener(type, object, listener, useCapture)
	local listeners = self._eventMapping and self._eventMapping[type]

	if listeners == nil then
		return
	end

	return listeners:removeListener(object, listener, useCapture)
end

function EventDispatcher:dispatchEvent(event)
	local eventType = event:getType()
	local listeners = self._eventMapping and self._eventMapping[eventType]

	if listeners == nil then
		return
	end

	event:setTarget(self)
	event:setCurrentTarget(self)
	event:setCurrentPhase(EventPhase.kAtTarget)

	return listeners:dispatch(event, false)
end

function EventDispatcher:clearAllListeners()
	if self._eventMapping == nil or next(self._eventMapping) == nil then
		return
	end

	self._eventMapping = nil
end
