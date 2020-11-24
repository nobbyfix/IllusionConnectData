local class = _G.class
local objectlua = _G.objectlua

module("event", package.seeall)

EventListenerList = class("EventListenerList", objectlua.Object)

function EventListenerList:initialize()
	super.initialize(self)

	self._listenerDictionary = {}
	self._orderedListeners = {}
	self._runningListeners = {}
end

function EventListenerList:queryListenerInfo(object, listener)
	if object == nil then
		return self._listenerDictionary[listener]
	else
		local objectRelated = self._listenerDictionary[object]

		return objectRelated and objectRelated[listener]
	end
end

function EventListenerList:setListenerInfo(object, listener, info)
	if object == nil then
		self._listenerDictionary[listener] = info
	else
		local objectRelated = self._listenerDictionary[object]

		if objectRelated == nil then
			if info ~= nil then
				self._listenerDictionary[object] = {
					[listener] = info
				}
			end
		else
			objectRelated[listener] = info
		end
	end
end

function EventListenerList:addListener(object, listener, priority)
	local info = self:queryListenerInfo(object, listener)
	local theList = self._orderedListeners

	if info == nil then
		local pos = #theList

		while pos > 0 do
			local cur = theList[pos]

			if cur.priority <= priority then
				break
			end

			theList[pos + 1] = cur
			cur.index = pos + 1
			pos = pos - 1
		end

		info = {
			priority = priority,
			object = object,
			listener = listener,
			index = pos + 1
		}
		theList[pos + 1] = info

		self:setListenerInfo(object, listener, info)
	else
		local pos = info.index
		local oldPriority = info.priority

		if priority < oldPriority then
			pos = pos - 1

			while pos > 0 do
				local cur = theList[pos]

				if cur.priority <= priority then
					break
				end

				theList[pos + 1] = cur
				cur.index = pos + 1
				pos = pos - 1
			end

			info.index = pos + 1
			theList[pos + 1] = info
		else
			local total = #theList
			pos = pos + 1

			while total >= pos do
				local cur = theList[pos]

				if priority < cur.priority then
					break
				end

				theList[pos - 1] = cur
				cur.index = pos - 1
				pos = pos + 1
			end

			info.index = pos - 1
			theList[pos - 1] = info
		end
	end
end

function EventListenerList:removeListener(object, listener)
	local info = self:queryListenerInfo(object, listener)

	if info == nil then
		return
	end

	local theList = self._orderedListeners
	local pos = info.index
	local total = #theList

	while pos < total do
		local cur = theList[pos + 1]
		theList[pos] = cur
		cur.index = pos
		pos = pos + 1
	end

	theList[pos] = nil
end

function EventListenerList:count()
	return #self._orderedListeners
end

function EventListenerList:dispatch(event)
	local orderedListeners = self._orderedListeners
	local count = #orderedListeners

	if count > 0 then
		local runningListeners = self._runningListeners

		for i = 1, count do
			runningListeners[i] = orderedListeners[i]
		end

		runningListeners[count + 1] = nil

		for i = 1, count do
			local cur = runningListeners[i]

			if cur.object then
				cur.listener(cur.object, event)
			else
				cur.listener(event)
			end

			if event:willStopImmediatelyPropagation() then
				break
			end
		end
	end
end

EventListenerBucket = class("EventListenerBucket", objectlua.Object)

function EventListenerBucket:initialize()
	super.initialize(self)
end

function EventListenerBucket:getListenerList(useCapture, autoCreate)
	local targetListeners = nil

	if useCapture then
		targetListeners = self._captureListeners

		if targetListeners == nil and autoCreate then
			targetListeners = EventListenerList:new()
			self._captureListeners = targetListeners
		end
	else
		targetListeners = self._nonCaptureListeners

		if targetListeners == nil and autoCreate then
			targetListeners = EventListenerList:new()
			self._nonCaptureListeners = targetListeners
		end
	end

	return targetListeners
end

function EventListenerBucket:addListener(object, listener, useCapture, priority)
	local targetListeners = self:getListenerList(useCapture, true)

	targetListeners:addListener(object, listener, priority)
end

function EventListenerBucket:removeListener(object, listener, useCapture)
	local targetListeners = self:getListenerList(useCapture, false)

	if targetListeners then
		targetListeners:removeListener(object, listener)
	end
end

function EventListenerBucket:count()
	local count = 0
	local listenerList = self._captureListeners

	if listenerList then
		count = count + (listenerList:count() or 0)
	end

	local listenerList = self._nonCaptureListeners

	if listenerList then
		count = count + (listenerList:count() or 0)
	end

	return count
end

function EventListenerBucket:dispatch(event, useCapture)
	if useCapture == nil then
		useCapture = event:getCurrentPhase() == EventPhase.kCapturing
	end

	local targetListeners = self:getListenerList(useCapture, false)

	if targetListeners then
		targetListeners:dispatch(event)
	end
end
