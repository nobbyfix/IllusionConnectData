local _G = _G
local class = _G.class
local assert = assert
local type = type
local unpack = unpack
local pairs = pairs
local ipairs = ipairs

module("legs")

local function GetClazzName(clazz)
	if _G.type(clazz) == "string" then
		return clazz
	elseif clazz.name ~= nil then
		return clazz:name()
	else
		return nil
	end
end

CommandEventHandler = class("CommandEventHandler", _G.objectlua.Object, _M)

function CommandEventHandler:initialize(commandExecutor, oneshot)
	super.initialize(self)

	self._commandExecutor = commandExecutor
	self._isOneshot = oneshot
end

function CommandEventHandler:setOneshot(oneshot)
	self._isOneshot = oneshot
end

function CommandEventHandler:isOneshot()
	return self._isOneshot
end

function CommandEventHandler:onCommandEvent(event)
	if self._commandExecutor == nil then
		return
	end

	self:_commandExecutor(event, self._isOneshot)
end

CommandMap = class("CommandMap", _G.DisposableObject, _M)

function CommandMap:initialize(eventDispatcher, injector)
	super.initialize(self)

	self._eventDispatcher = eventDispatcher
	self._injector = injector
	self._eventTypeMap = {}
end

function CommandMap:dispose()
	super.dispose(self)
end

function CommandMap:mapEvent(eventType, commandClazz, oneshot)
	assert(eventType ~= nil, "Nil value for `eventType`.")

	local eventHandlers = self._eventTypeMap[eventType]

	if eventHandlers == nil then
		eventHandlers = {}
		self._eventTypeMap[eventType] = eventHandlers
	end

	local clazzName = GetClazzName(commandClazz)

	assert(clazzName ~= nil)

	local handler = eventHandlers[clazzName]

	if handler ~= nil then
		handler:setOneshot(oneshot)
	else
		handler = CommandEventHandler:new(function (handler, event)
			if handler:isOneshot() then
				self:unmapEvent(eventType, commandClazz)
			end

			self:execute(commandClazz, event)
		end, oneshot)
		eventHandlers[clazzName] = handler

		self._eventDispatcher:addEventListener(eventType, handler, handler.onCommandEvent)
	end
end

function CommandMap:unmapEvent(eventType, commandClazz)
	assert(eventType ~= nil, "Nil value for `eventType`.")

	local eventHandlers = self._eventTypeMap[eventType]

	if eventHandlers == nil then
		return
	end

	local clazzName = GetClazzName(commandClazz)

	assert(clazzName ~= nil)

	local handler = eventHandlers[clazzName]

	if handler ~= nil then
		self._eventDispatcher:removeEventListener(eventType, handler, handler.onCommandEvent)

		eventHandlers[clazzName] = nil
	end
end

function CommandMap:unmapEvents()
	for eventType, eventHandlers in _G.pairs(self._eventTypeMap) do
		for clazzName, handler in _G.pairs(eventHandlers) do
			self._eventDispatcher:removeEventListener(eventType, handler, handler.onCommandEvent)
		end
	end

	self._eventTypeMap = {}
end

function CommandMap:hasEventCommand(eventType, commandClazz)
	assert(eventType ~= nil, "Nil value for `eventType`.")

	local eventHandlers = self._eventTypeMap[eventType]

	if eventHandlers == nil then
		return false
	end

	local clazzName = GetClazzName(commandClazz)

	assert(clazzName ~= nil)

	local handler = eventHandlers[clazzName]

	return handler ~= nil
end

function CommandMap:execute(commandClazz, event)
	local commandInst = self._injector:instantiate(commandClazz)

	assert(commandInst ~= nil, "Failed to instantiate the command class.")
	self:detainCommand(commandInst)
	commandInst:execute(event)
	self:releaseCommand(commandInst)
end

function CommandMap:detainCommand(command)
	if self._detainedCommands == nil then
		self._detainedCommands = {}
	end

	local oldCnt = self._detainedCommands[command]
	self._detainedCommands[command] = (oldCnt or 0) + 1
end

function CommandMap:releaseCommand(command)
	if self._detainedCommands == nil then
		return
	end

	local oldCnt = self._detainedCommands[command]

	if oldCnt == nil then
		return
	end

	assert(oldCnt > 0)

	if oldCnt > 1 then
		self._detainedCommands[command] = oldCnt - 1
	else
		command:dispose()

		self._detainedCommands[command] = nil
	end
end
