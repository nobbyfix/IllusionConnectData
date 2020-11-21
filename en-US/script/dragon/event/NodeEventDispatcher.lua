local Node = cc and cc.Node

if Node == nil then
	return
end

local EventDispatcherProto = event.EventDispatcher.__prototype__
Node.addEventListener = EventDispatcherProto.addEventListener
Node.hasEventListener = EventDispatcherProto.hasEventListener
Node.removeEventListener = EventDispatcherProto.removeEventListener
Node.clearAllListeners = EventDispatcherProto.clearAllListeners

local function findAncestors(self, ancestors)
	local node = self:getParent()
	local n = #ancestors + 1

	while node ~= nil do
		n = n + 1
		ancestors[n] = node
		node = node:getParent()
	end

	return ancestors
end

local function triggerListeners(self, event, eventType, useCapture)
	local evtType = eventType or event:getType()
	local listeners = self._eventMapping and self._eventMapping[evtType]

	if listeners == nil then
		return
	end

	event:setCurrentTarget(self)

	return listeners:dispatch(event, useCapture)
end

local function capture(self, ancestors, event, eventType)
	local count = #ancestors

	if count == 0 then
		return true
	end

	event:setCurrentPhase(EventPhase.kCapturing)

	for i = count, 1, -1 do
		local node = ancestors[i]

		triggerListeners(node, event, eventType, true)

		if event:willStopImmediatelyPropagation() or event:willStopPropagation() then
			return false
		end
	end

	return true
end

local function atTarget(self, event, eventType)
	event:setCurrentPhase(EventPhase.kAtTarget)
	triggerListeners(self, event, eventType, false)

	if event:willStopImmediatelyPropagation() or event:willStopPropagation() then
		return false
	end

	return true
end

local function bubble(self, ancestors, event, eventType)
	local count = #ancestors

	if count == 0 then
		return true
	end

	event:setCurrentPhase(EventPhase.kBubbling)

	for i = 1, count do
		local node = ancestors[i]

		triggerListeners(node, event, eventType, false)

		if event:willStopImmediatelyPropagation() or event:willStopPropagation() then
			return false
		end
	end

	return true
end

function Node:dispatchEvent(event)
	repeat
		local ancestors = {}

		findAncestors(self, ancestors)
		event:setTarget(self)

		local eventType = event:getType()

		if not capture(self, ancestors, event, eventType) then
			break
		end

		if not atTarget(self, event, eventType) then
			break
		end

		bubble(self, ancestors, event, eventType)
	until true
end
