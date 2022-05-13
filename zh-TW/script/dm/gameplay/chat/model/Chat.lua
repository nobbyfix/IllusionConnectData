ChatRoomType = {
	kPrivate = 5,
	kWorld = 1,
	kTeam = 3,
	kUnion = 2,
	kChatRoom = 6,
	kSelf = 4
}
Chat = class("Chat", objectlua.Object, _M)

Chat:has("_activeMembers", {
	is = "rw"
})
Chat:has("_privateChannelMap", {
	is = "rw"
})
Chat:has("_readMap", {
	is = "rw"
})

function Chat:initialize()
	super.initialize(self)

	self._channelMap = {}
	self._privateChannelMap = {}
	self._chatRoomChannelMap = {}
	self._activeMembers = {}
	self._readMap = {}
end

function Chat:syncActiveMembers(data)
	for rid, sender in pairs(data) do
		self._activeMembers[rid] = sender
	end
end

function Chat:syncHistory(data)
	local membersData = data.members

	if membersData then
		self:syncActiveMembers(membersData)
	end

	local roomsData = data.rooms

	if roomsData == nil then
		return
	end

	for roomType, chatData in pairs(roomsData) do
		for roomId, roomData in pairs(chatData) do
			local messagesData = roomData.messages

			for _, messageData in pairs(messagesData) do
				self:syncMessage(messageData, true)
			end
		end
	end

	for channelId, channel in pairs(self._channelMap) do
		if channel:getType() == ChannelType.kFlow then
			channel:clear()
		end

		if channel:getType() == ChannelType.kBase then
			channel:clear()
		end
	end

	self:refreshAllChannels()

	if data.read then
		self:syncReadData(data.read)
	end
end

function Chat:refreshAllChannels()
	for channelId, channel in pairs(self._channelMap) do
		if channel:isDirty() then
			channel:refresh()
		end
	end
end

function Chat:createChannel(channelId)
	local strs = string.split(channelId, "-")
	local channelType = strs[1]
	local channel = nil

	if channelType == ChannelType.kBase then
		channel = BaseChannel:new(channelId)
	elseif channelType == ChannelType.kChat then
		channel = ChatChannel:new(channelId)
	elseif channelType == ChannelType.kPrivate then
		channel = PrivateChannel:new(channelId)
		self._privateChannelMap[channelId] = channel
	elseif channelType == ChannelType.kChatRoom then
		channel = ChatRoomChannel:new(channelId)
		self._chatRoomChannelMap[channelId] = channel
	elseif channelType == ChannelType.kFilter then
		channel = FilterChannel:new(channelId, FilterRulesMap[channelId])

		channel:setOwner(self)
	elseif channelType == ChannelType.kFlow then
		channel = FlowChannel:new(channelId)
	end

	self._channelMap[channelId] = channel

	return channel
end

function Chat:createMessage(messageData)
	local message = nil
	local messageType = messageData.type

	if messageType == MessageType.kSystem then
		message = SystemMessage:new()
	elseif messageType == MessageType.kPlayer then
		message = PlayerMessage:new()
	end

	if message then
		message:sync(messageData)
	end

	return message
end

function Chat:messgeToChannel(message, isOld)
	local channelIds = message:getChannelIds()

	for _, channelId in pairs(channelIds) do
		local channel = self._channelMap[channelId]

		if channel == nil then
			channel = self:createChannel(channelId)
		end

		if channel then
			channel:addMessage(message, isOld)
		end

		if not isOld then
			for filterChannelId, filterRules in pairs(FilterRulesMap) do
				local filterChannel = self._channelMap[filterChannelId]

				if filterChannel then
					filterChannel:addMessage(channelId, message)
				end
			end
		end
	end
end

function Chat:syncMessage(messageData, isOld)
	if messageData.sender and self:getShieldSender(messageData.sender) then
		return
	end

	local message = self:createMessage(messageData)

	self:messgeToChannel(message, isOld)

	return message
end

function Chat:delMessage(channelId)
	self._privateChannelMap[channelId] = nil
	self._channelMap[channelId] = nil
end

function Chat:getShieldSender(id)
	local chatSystem = DmGame:getInstance()._injector:getInstance("ChatSystem")
	local status = chatSystem:getBlockUserStatus(id)

	return status
end

function Chat:setShieldSender(id)
	local cjson = require("cjson.safe")
	local data = {}
	local str = cjson.encode(data)
	local developSystem = DmGame:getInstance()._injector:getInstance("DevelopSystem")
	local value = cc.UserDefault:getInstance():getStringForKey(developSystem:getPlayer():getRid() .. "chat-shield-sender", str)
	value = cjson.decode(value)
	value[id] = 1
	str = cjson.encode(value)

	cc.UserDefault:getInstance():setStringForKey(developSystem:getPlayer():getRid() .. "chat-shield-sender", str)
end

function Chat:getChannel(channelId)
	return self._channelMap[channelId]
end

function Chat:getSender(id)
	return self._activeMembers[id]
end

function Chat:getSortChannel(channelMap)
	local list = {}

	for k, channel in pairs(channelMap) do
		if #channel:getMessages() > 0 then
			list[#list + 1] = channel
		end
	end

	table.sort(list, function (a, b)
		local aMessages = a:getMessages()
		local bMessages = b:getMessages()
		local aMsg = aMessages[#aMessages]
		local bMsg = bMessages[#bMessages]

		return bMsg:getTime() < aMsg:getTime()
	end)

	return list
end

function Chat:syncReadData(data)
	for roomType, chatData in pairs(data) do
		if self._readMap[tonumber(roomType)] == nil then
			self._readMap[tonumber(roomType)] = {}
		end

		for roomId, messageId in pairs(chatData) do
			self._readMap[tonumber(roomType)][roomId] = messageId
		end
	end
end

function Chat:getReadMessageId(roomType, roomId)
	if self._readMap[roomType] ~= nil then
		return self._readMap[roomType][roomId]
	end

	return nil
end

function Chat:syncReadMessageId(roomType, roomId, messageId)
	if self._readMap[roomType] == nil then
		self._readMap[roomType] = {}
	end

	self._readMap[roomType][roomId] = messageId
end
