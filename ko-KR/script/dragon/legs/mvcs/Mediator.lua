local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack

module("legs")

Mediator = class("Mediator", _G.DisposableObject, _M)

Mediator:has("_eventDispatcher", {
	is = "r"
}):injectWith("legs_sharedEventDispatcher")
Mediator:has("_mediatorMap", {
	is = "r"
}):injectWith("legs_contextMediatorMap")
Mediator:has("_viewMap", {
	is = "r"
}):injectWith("legs_contextViewMap")
Mediator:has("_eventMap", {
	is = "r"
})

function Mediator:initialize()
	super.initialize(self)
end

function Mediator:dispose()
	if self._eventMap ~= nil then
		self._eventMap:dispose()

		self._eventMap = nil
	end

	super.dispose(self)
end

function Mediator:getView()
	return self._view
end

function Mediator:getViewName()
	return self._viewName
end

function Mediator:setView(viewComponent)
	self._view = viewComponent
	self._viewName = nil

	if viewComponent ~= nil and viewComponent.getViewName ~= nil then
		self._viewName = viewComponent:getViewName()
	end
end

function Mediator:getChildView(fullname)
	return self._view and self._view:getChildByFullName(fullname)
end

function Mediator:getEventMap()
	if self._eventMap == nil then
		self._eventMap = EventMap:new()
	end

	return self._eventMap
end

function Mediator:mapEventListener(dispatcher, type, target, listener, useCapture, priority)
	local eventMap = self:getEventMap()

	eventMap:mapListener(dispatcher, type, target, listener, useCapture, priority)
end

function Mediator:unmapEventListener(dispatcher, type, target, listener, useCapture)
	if self._eventMap ~= nil then
		self._eventMap:unmapListener(dispatcher, type, target, listener, useCapture)
	end
end

function Mediator:dispatch(event)
	local eventDispatcher = self:getEventDispatcher()

	if eventDispatcher ~= nil then
		return eventDispatcher:dispatchEvent(event)
	end
end

function Mediator:onRegister()
end

function Mediator:onRemove()
	if self._eventMap ~= nil then
		self._eventMap:unmapListeners()
	end
end
