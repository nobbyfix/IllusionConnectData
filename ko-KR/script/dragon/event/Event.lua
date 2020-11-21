local class = _G.class
local objectlua = _G.objectlua

module("event", package.seeall)

EventPhase = {
	kAtTarget = 2,
	kBubbling = 3,
	kCapturing = 1
}
Event = class("Event", objectlua.Object)

Event:has("_type", {
	is = "r"
})
Event:has("_target", {
	is = "rw"
})
Event:has("_currentTarget", {
	is = "rw"
})
Event:has("_currentPhase", {
	is = "rw"
})
Event:has("_data", {
	is = "rw"
})

function Event:initialize(type, data)
	super.initialize(self)

	self._type = type
	self._data = data
	self._stopPropagation = false
	self._stopImmediatelyPropagation = false
end

function Event:stopPropagation()
	self._stopPropagation = true
end

function Event:willStopPropagation()
	return self._stopPropagation
end

function Event:stopImmediatelyPropagation()
	self._stopImmediatelyPropagation = true
end

function Event:willStopImmediatelyPropagation()
	return self._stopImmediatelyPropagation
end
