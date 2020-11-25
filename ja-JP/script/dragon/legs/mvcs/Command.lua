local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack

module("legs")

Command = class("Command", _G.DisposableObject, _M)

Command:has("_eventDispatcher", {
	is = "r"
}):injectWith("legs_sharedEventDispatcher")
Command:has("_commandMap", {
	is = "r"
}):injectWith("legs_contextCommandMap")
Command:has("_mediatorMap", {
	is = "r"
}):injectWith("legs_contextMediatorMap")

function Command:initialize()
	super.initialize(self)
end

function Command:dispatch(event)
	local eventDispatcher = self:getEventDispatcher()

	if eventDispatcher ~= nil then
		return eventDispatcher:dispatchEvent(event)
	end
end

function Command:execute(event)
end
