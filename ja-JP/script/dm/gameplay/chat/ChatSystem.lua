EVT_CHAT_NEW_MESSAGE = "EVT_CHAT_NEW_MESSAGE"
EVT_CHAT_NEW_PRIVATEMESSAGE = "EVT_CHAT_NEW_PRIVATEMESSAGE"
EVT_CHAT_SEND_MESSAGE_SUCC = "EVT_CHAT_SEND_MESSAGE_SUCC"
EVT_CHAT_REMOVE_MESSAGE_SUCC = "EVT_CHAT_REMOVE_MESSAGE_SUCC"
EVT_CHAT_SHIELD_MESSAGE_SUCC = "EVT_CHAT_SHIELD_MESSAGE_SUCC"
ChatSystem = class("ChatSystem", Facade, _M)

ChatSystem:has("_service", {
	is = "r"
}):injectWith("ChatService")
ChatSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ChatSystem:has("_chat", {
	is = "r"
})
ChatSystem:has("_isOnlyShowSelf", {
	is = "rwb"
})
ChatSystem:has("_shieldList", {
	is = "rw"
})
ChatSystem:has("_shieldFriendList", {
	is = "rw"
})

function ChatSystem:initialize()
	super.initialize(self)

	self._isOnlyShowSelf = false
	self._shieldList = {}
	self._shieldFriendList = {}

	self:getEmotionData()
end

function ChatSystem:userInject(injector)
	self:initSystem()
end

function ChatSystem:initChannels()
	for _, channelId in pairs(ChannelId) do
		self._chat:createChannel(channelId)
	end
end

function ChatSystem:initSystem()
	self._chat = Chat:new()

	self:listenPushMessage()
	self:requestGetBlockList()
	self:initChannels()

	local roomTypes = {
		ChatRoomType.kWorld,
		ChatRoomType.kUnion,
		ChatRoomType.kPrivate
	}

	self:requestHistory(roomTypes, true)
end

function ChatSystem:tryEnter(data)
	local view = self:getInjector():getInstance("chatMainView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, data))
end

function ChatSystem:updateActiveMember()
	local player = self:getDevelopSystem():getPlayer()
	local activeMembers = self._chat:getActiveMembers()
	local rid = player:getRid()
	local clubSystem = self:getInjector():getInstance(ClubSystem)
	local sender = {
		id = rid,
		nickname = player:getNickName(),
		level = player:getLevel(),
		vipLevel = player:getVipLevel(),
		slogan = player:getSlogan(),
		combat = self:getDevelopSystem():getTeamByType(StageTeamType.STAGE_NORMAL):getCombat(),
		headImg = player:getHeadId(),
		clubName = clubSystem:getName(),
		heroes = self:getHeroes(),
		master = {
			self:getDevelopSystem():getTeamByType(StageTeamType.STAGE_NORMAL):getMasterId()
		},
		gender = player:getGender(),
		city = player:getCity(),
		birthday = player:getBirthday(),
		tags = player:getTags(),
		headFrame = player:getCurHeadFrame()
	}
	activeMembers[rid] = sender
end

function ChatSystem:getHeroes(...)
	local heroes = {}
	local teamHeroes = self._developSystem:getTeamByType(StageTeamType.STAGE_NORMAL):getHeroes()
	local heroSystem = self._developSystem:getHeroSystem()

	for i = 1, #teamHeroes do
		local hero = heroSystem:getHeroById(teamHeroes[i])

		if hero then
			local data = {
				hero:getId(),
				hero:getLevel(),
				hero:getStar(),
				hero:getQuality(),
				hero:getRarity()
			}
			heroes[#heroes + 1] = data
		end
	end

	return heroes
end

function ChatSystem:isMySend(message)
	local messageType = message:getType()

	if messageType == MessageType.kPlayer then
		local player = self:getDevelopSystem():getPlayer()

		return message:getSenderId() == player:getRid()
	end

	return false
end

function ChatSystem:requestHistory(roomTypes, notShowWaiting, callback)
	local params = {
		channels = roomTypes
	}

	self:getService():requestHistory(params, function (response)
		if response.resCode == GS_SUCCESS then
			self._chat:syncHistory(response.data)

			if callback then
				callback()
			end
		end
	end, notShowWaiting)
end

function ChatSystem:requestSendMessage(roomType, roomId, message, callback)
	local params = {
		channel = roomType,
		groupId = roomId,
		content = message
	}

	self:getService():requestSendMessage(params, function (response)
		if response.resCode == GS_SUCCESS then
			local playerData = response.data.playerInfo

			if playerData then
				self._chat:syncActiveMembers(playerData)
			end

			if callback then
				callback(response.data)
			end

			self:dispatch(Event:new(EVT_CHAT_SEND_MESSAGE_SUCC, {
				message = message
			}))
			self:dispatch(Event:new(EVT_REDPOINT_REFRESH))
		end
	end, true)
end

function ChatSystem:requestReadMessage(roomType, roomId, messageId, callback)
	local params = {
		channel = roomType,
		groupId = roomId,
		msgId = messageId
	}

	self:getService():requestReadMessage(params, function (response)
		if response.resCode == GS_SUCCESS then
			self._chat:syncReadMessageId(roomType, roomId, messageId)
			self:dispatch(Event:new(EVT_REDPOINT_REFRESH))

			if callback then
				callback()
			end
		end
	end, true)
end

function ChatSystem:listenPushMessage()
	self:getService():listenPushMessage(function (response)
		if response then
			if response.playerInfo then
				local senderData = response.playerInfo
				local data = {
					[senderData.id] = senderData
				}

				self._chat:syncActiveMembers(data)
			end

			if response.configId == "Announce_Club_Join" then
				local roleId = response.params.rid
				local player = self:getInjector():getInstance(DevelopSystem):getPlayer()

				if player:getRid() == roleId then
					self:dispatch(Event:new(EVT_HOMEVIEW_REDPOINT_REF, {
						showRedPoint = 1,
						type = 4
					}))
				end
			end

			if response.configId == "Announce_Club_JobChange1" then
				self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
			end

			local message = self._chat:syncMessage(response)

			if not message then
				return
			end

			local channelIds = message:getChannelIds()

			for _, v in pairs(channelIds) do
				local strs = string.split(v, "-")
				local channelType = strs[1]

				if channelType == ChannelType.kPrivate then
					self:dispatch(Event:new(EVT_CHAT_NEW_PRIVATEMESSAGE, {
						message = message,
						channelId = v
					}))

					break
				end
			end

			self:dispatch(Event:new(EVT_CHAT_NEW_MESSAGE, {
				message = message
			}))
		end
	end)
end

function ChatSystem:requestBlockUser(block, unblock, callback)
	local params = {
		block = block,
		unblock = unblock
	}

	self:getService():requestBlockUser(params, function (response)
		if response.resCode == GS_SUCCESS then
			if response.data then
				self._shieldList = response.data.blockList or {}
				self._shieldFriendList = response.data.friendBlockList or {}
			end

			if callback then
				callback(response.data)
			end

			self:dispatch(Event:new(EVT_CHAT_SHIELD_MESSAGE_SUCC, {
				data = response.data
			}))
		end
	end, true)
end

function ChatSystem:getShieldList()
	local list = {}

	for key, value in pairs(self._shieldList) do
		list[#list + 1] = value
	end

	return list
end

function ChatSystem:getBlockUserStatus(senderId)
	return self._shieldList[senderId]
end

function ChatSystem:getBlockUserFriendStatus(senderId)
	return table.indexof(self._shieldFriendList, senderId)
end

function ChatSystem:requestGetBlockList()
	local params = {}

	self:getService():requestGetBlockList(params, function (response)
		if response.resCode == GS_SUCCESS and response.data then
			self._shieldList = response.data.blockList or {}
			self._shieldFriendList = response.data.friendBlockList or {}
		end
	end, true)
end

function ChatSystem:getEmotionData()
	if not self._emotionData then
		self._emotionData = ConfigReader:getDataTable("ChatEmoji")
	end

	return self._emotionData
end

function ChatSystem:getEmotionList()
	local list = {}

	for Id, data in pairs(self._emotionData) do
		if not list[data.Type] then
			list[data.Type] = {}
		end

		list[data.Type][#list[data.Type] + 1] = data
	end

	for Id, data in pairs(list) do
		table.sort(data, function (a, b)
			return a.Sort < b.Sort
		end)
	end

	return list
end

function ChatSystem:getEmotionDataById(id)
	return self._emotionData[id]
end

function ChatSystem:requestRemoveMessage(channelId, playerId, callback)
	local params = {
		friendRid = playerId
	}

	self:getService():requestRemoveMessage(params, function (response)
		if response.resCode == GS_SUCCESS then
			self._chat:delMessage(channelId)

			if callback then
				callback(response.data)
			end

			self:dispatch(Event:new(EVT_CHAT_REMOVE_MESSAGE_SUCC, {
				channelId = channelId,
				playerId = playerId
			}))
		end
	end, true)
end
