local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack
local event = event

module("legs")

Context = class("Context", _G.DisposableObject, _M)

Context:has("_injector", {
	is = "r"
})
Context:has("_eventDispatcher", {
	is = "r"
})
Context:has("_commandMap", {
	is = "r"
})
Context:has("_mediatorMap", {
	is = "r"
})
Context:has("_viewMap", {
	is = "r"
})

function Context:initialize(injector, sharedEventDispatcher)
	super.initialize(self)

	self._injector = injector
	self._eventDispatcher = sharedEventDispatcher
	self._commandMap = CommandMap:new(self:getEventDispatcher(), injector)
	local viewEventDispatcher = event.EventDispatcher:new()
	self._viewMap = ViewMap:new(viewEventDispatcher, injector)
	self._mediatorMap = MediatorMap:new(viewEventDispatcher, injector)

	self:registerInjections(self._injector)
end

function Context:dispose()
	self:unregisterInjections(self._injector)

	if self._commandMap ~= nil then
		self._commandMap:dispose()

		self._commandMap = nil
	end

	if self._mediatorMap ~= nil then
		self._mediatorMap:dispose()

		self._mediatorMap = nil
	end

	if self._viewMap ~= nil then
		self._viewMap:dispose()

		self._viewMap = nil
	end

	super.dispose(self)
end

function Context:registerInjections(injector)
	injector:mapValue("legs_sharedEventDispatcher", self._eventDispatcher)
	injector:mapValue("legs_contextCommandMap", self._commandMap)
	injector:mapValue("legs_contextViewMap", self._viewMap)
	injector:mapValue("legs_contextMediatorMap", self._mediatorMap)
end

function Context:unregisterInjections(injector)
	injector:unmap("legs_sharedEventDispatcher")
	injector:unmap("legs_contextCommandMap")
	injector:unmap("legs_contextViewMap")
	injector:unmap("legs_contextMediatorMap")
end

function Context:startup()
end

function Context:shutdown()
	self:dispose()
end
