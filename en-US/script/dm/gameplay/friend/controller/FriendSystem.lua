require("dm.gameplay.friend.model.FriendList")

FriendSystem = class("FriendSystem", legs.Actor)

FriendSystem:has("_friendService", {
	is = "r"
}):injectWith("FriendService")
FriendSystem:has("_friendModel", {
	is = "r"
})
FriendSystem:has("_hasNewApplyFriends", {
	is = "rw"
})
FriendSystem:has("_canShowFightBtn", {
	is = "rw"
})

EVT_FRIENDAPPLY_REFRESH = "EVT_FRIENDAPPLY_REFRESH"

function FriendSystem:initialize()
	super.initialize(self)

	self._friendModel = FriendList:new()
	self._hasNewApplyFriends = false
	self._canShowFightBtn = true
end

function FriendSystem:tryEnter(data)
	data = data or {}

	local function getDataSucc()
		if not data.tabType then
			local hasNewMsg = self:hasRecentNewMessage() or self:hasCanGetPowerFriends()

			if hasNewMsg then
				data.tabType = kFriendType.kGame
			elseif self:getHasNewApplyFriends() or self:getFriendModel():getFriendApplyCount() > 0 then
				data.tabType = kFriendType.kApply
			elseif self._friendModel:getFriendCount(kFriendType.kGame) == 0 then
				data.tabType = kFriendType.kFind
			end
		end

		if data.disCanShowFightBtn then
			self._canShowFightBtn = false
		end

		local view = self:getInjector():getInstance("FriendMainView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data))
	end

	self:requestFriendsMainInfo(getDataSucc)
end

function FriendSystem:queryRedPointState()
	return self:hasRecentNewMessage() or self:getHasNewApplyFriends() or self:getFriendModel():getFriendApplyCount() > 0 or self:hasCanGetPowerFriends()
end

function FriendSystem:addRecentFriend(data)
	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")

	self._friendModel:addRecentFriend(data, gameServerAgent:remoteTimeMillis())
end

function FriendSystem:getRecentList(limitCount)
	limitCount = limitCount or self._friendModel:getMaxRecentCount()
	limitCount = math.max(limitCount, self._friendModel:getMaxRecentCount())
	local list = {}
	local chatSystem = self:getInjector():getInstance(ChatSystem)
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local chat = chatSystem:getChat()
	local chatList = chat:getSortChannel(chat:getPrivateChannelMap())
	local recentFriend = self._friendModel:getRecentData()

	if recentFriend then
		list[1] = recentFriend
	end

	for i, data in pairs(chatList) do
		local messages = data:getMessages()
		local time = messages[#messages]:getTime()
		local strs = string.split(data:getId(), "-")
		local rid = strs[2] == developSystem:getPlayer():getRid() and strs[3] or strs[2]
		local senderInfo = chat:getSender(rid)
		local friend = self._friendModel:getFriendByRid(kFriendType.kGame, rid)

		if not friend and senderInfo ~= nil then
			friend = Friend:new()

			friend:synchronize(senderInfo)

			friend.time = time

			if not self:hasInList(list, rid) then
				list[#list + 1] = friend
			end
		end

		if limitCount <= #list then
			break
		end
	end

	table.sort(list, function (a, b)
		return b.time < a.time
	end)

	return list
end

function FriendSystem:hasInList(list, rid)
	for i, value in pairs(list) do
		if value:getRid() == rid then
			return true
		end
	end

	return false
end

function FriendSystem:hasRecentNewMessage()
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local chatSystem = self:getInjector():getInstance(ChatSystem)
	local chat = chatSystem:getChat()
	local list = self:getRecentList()

	for i, friendData in pairs(list) do
		local channelId = self:getChannelId(developSystem:getPlayer():getRid(), friendData:getRid())
		local channel = chat:getChannel(channelId)
		channel = channel or chat:createChannel(channelId)
		local roomType, roomId = channel:getRoomTypeAndId(self:getInjector())
		local isHasNew, count, max, min = self:hasNewMessage(channel, roomType, roomId)

		if isHasNew then
			return true
		end
	end

	return false
end

function FriendSystem:getChannelId(rid1, rid2)
	local id = "PRIVATE-"

	if rid2 < rid1 then
		id = id .. rid2 .. "-" .. rid1
	else
		id = id .. rid1 .. "-" .. rid2
	end

	return id
end

function FriendSystem:hasNewMessage(channel, roomType, roomId)
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local chatSystem = self:getInjector():getInstance(ChatSystem)
	local chat = chatSystem:getChat()
	local readMsgeId = chat:getReadMessageId(roomType, roomId) or 0
	local messages = channel:getMessages()

	if messages and #messages > 0 and readMsgeId < messages[#messages]:getId() then
		local count = 0

		for i, msg in pairs(messages) do
			if readMsgeId < msg:getId() and msg:getSenderId() ~= developSystem:getPlayer():getRid() then
				count = count + 1
			end
		end

		return count > 0, count, 999999, 0
	end

	return false, 0, 999999, 0
end

function FriendSystem:saveCurReadMessage(channel)
	local chatSystem = self:getInjector():getInstance(ChatSystem)

	if channel then
		local roomType, roomId = channel:getRoomTypeAndId(self:getInjector())
		local messages = channel:getMessages()

		if #messages > 0 then
			chatSystem:requestReadMessage(roomType, roomId, messages[#messages]:getId())
		end
	end
end

function FriendSystem:hasRedPoint()
	return self:hasRecentNewMessage() or self:getHasNewApplyFriends() or self:getFriendModel():getFriendApplyCount() > 0
end

function FriendSystem:getGiftPowerCount()
	return ConfigReader:getDataByNameIdAndKey("ConfigValue", "Friend_GiftPower", "content")
end

function FriendSystem:getGiftMaxGetTimes()
	local config = ConfigReader:getDataByNameIdAndKey("Reset", "Friend_Gift_MaxGetTimes", "ResetSystem")

	return config and config.setValue
end

function FriendSystem:getGiftMaxGiveTimes()
	local config = ConfigReader:getDataByNameIdAndKey("Reset", "Friend_Gift_MaxGiveTimes", "ResetSystem")

	return config and config.setValue
end

function FriendSystem:checkIsFriend(id)
	local list = self._friendModel:getFriendList(kFriendType.kGame)

	for i = 1, #list do
		if list[i]:getRid() == id then
			return true
		end
	end

	return false
end

function FriendSystem:requestFriendsMainInfo(callback)
	local params = {}

	self._friendService:requestFriendsMainInfo(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._friendModel:synchronize(response.data, kFriendType.kGame, true)
			self:dispatch(Event:new(EVT_FRIEND_GETFRIENDSLIST_SUCC, {}))

			local applyList = {
				friendsList = response.data.apply
			}

			self._friendModel:synchronize(applyList, kFriendType.kApply, true)

			if #applyList.friendsList > 0 then
				self:setHasNewApplyFriends(true)
			else
				self:setHasNewApplyFriends(false)
			end

			self:dispatch(Event:new(EVT_FRIEND_GETAPPLYLIST_SUCC, {
				response = applyList
			}))

			if callback then
				callback()
			end
		end
	end)
end

function FriendSystem:requestFriendsList(requestStart, requestEnd, callback, ins)
	local params = {
		start = requestStart,
		["end"] = requestEnd
	}

	self._friendService:requestFriendsList(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._friendModel:synchronize(response.data, kFriendType.kGame)
			self:dispatch(Event:new(EVT_FRIEND_GETFRIENDSLIST_SUCC, {}))

			if callback and checkDependInstance(ins) then
				callback()
			end
		end
	end)
end

function FriendSystem:requestGetPower(rid, callback)
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local bagSystem = developSystem:getBagSystem()
	local maxPowerLimti = bagSystem:getMaxPowerLimit()
	local params = {
		friend = rid
	}

	self._friendService:requestGetPower(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._friendModel:syncFriendfamiliarity(response.data.newClose)
			self._friendModel:syncReceiveStatus(response.data.receiveList)
			self:dispatch(Event:new(EVT_FRIEND_GERPOWER_SUCC, {
				response = response.data
			}))
			self:dispatch(Event:new(EVT_HOMEVIEW_REDPOINT_REF, {
				type = 2
			}))

			if self._friendModel:getReceiveTimes() > 0 then
				if response.data.rewardCounts == 0 then
					self:dispatch(ShowTipEvent({
						tip = Strings:get("Friend_UI27")
					}))
				else
					local str = Strings:get("Friend_Tip2", {
						num1 = response.data.rewardCounts * self:getGiftPowerCount(),
						num2 = self._friendModel:getReceiveTimes() * self:getGiftPowerCount()
					})

					if maxPowerLimti <= bagSystem:getPower() then
						str = Strings:get("Friend_Power_FullTips")
					end

					self:dispatch(ShowTipEvent({
						tip = str
					}))
				end
			else
				local str = Strings:get("Friend_Tip3", {
					num1 = response.data.rewardCounts * self:getGiftPowerCount(),
					num2 = self:getGiftMaxGetTimes() * self:getGiftPowerCount()
				})

				if maxPowerLimti <= bagSystem:getPower() then
					str = Strings:get("Friend_Power_FullTips")
				end

				self:dispatch(ShowTipEvent({
					tip = str
				}))
			end

			if callback then
				callback()
			end
		end
	end)
end

function FriendSystem:requestSendPower(rid, callback)
	local params = {
		friend = rid
	}

	self._friendService:requestSendPower(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if rid == "ALL" then
				if #response.data.sendList == 0 then
					self:dispatch(ShowTipEvent({
						tip = Strings:get("Friend_UI26")
					}))
				else
					self:dispatch(ShowTipEvent({
						tip = Strings:get("Friend_UI46", {
							num = #response.data.sendList
						})
					}))
				end
			else
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Friend_UI25")
				}))
			end

			self._friendModel:syncFriendfamiliarity(response.data.newClose)
			self._friendModel:syncSendStatus(response.data.sendList)
			self:dispatch(Event:new(EVT_FRIEND_SENDPOWER_SUCC, {
				response = response.data
			}))

			if callback then
				callback()
			end
		end
	end)
end

function FriendSystem:requestRecommendList(callback)
	local params = {}

	self._friendService:requestRecommendList(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			response.data.friendsList = response.data.recommend

			self._friendModel:synchronize(response.data, kFriendType.kFind, true)
			self:dispatch(Event:new(EVT_FRIEND_GETRECOMMENDLIST_SUCC, {}))

			if callback then
				callback()
			end
		end
	end)
end

function FriendSystem:requestFindFriend(name, callback)
	local params = {
		name = name
	}

	self._friendService:requestFindFriend(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			response.data.friendsList = {
				response.data.player
			}

			self._friendModel:synchronize(response.data, kFriendType.kFind, true)
			self:dispatch(Event:new(EVT_FRIEND_GETRECOMMENDLIST_SUCC, {}))

			if callback then
				callback()
			end
		end
	end)
end

function FriendSystem:requestAgreeFriend(rid, callback)
	local params = {
		rid = rid
	}

	self._friendService:requestAgreeFriend(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._friendModel:updateFriendCount(kFriendType.kGame, #response.data.agree)
			self._friendModel:removeFriend(kFriendType.kApply, response.data.agree)
			self:dispatch(Event:new(EVT_FRIEND_AGREEORREFUSE_SUCC, {}))
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Friend_UI17")
			}))

			if callback then
				callback()
			end
		elseif response.resCode == 11007 or response.resCode == 11005 then
			local data = {
				[#data + 1] = rid
			}

			self._friendModel:removeFriend(kFriendType.kApply, data)
			self:dispatch(Event:new(EVT_FRIEND_AGREEORREFUSE_SUCC, {}))
		end
	end)
end

function FriendSystem:requestRefuseFriend(rid, callback)
	local params = {
		rid = rid
	}

	self._friendService:requestRefuseFriend(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._friendModel:removeFriend(kFriendType.kApply, response.data.refuse)
			self:dispatch(Event:new(EVT_FRIEND_AGREEORREFUSE_SUCC, {}))

			if callback then
				callback()
			end
		end
	end)
end

function FriendSystem:requestDeleteFriend(rid, callback)
	local params = {
		rid = rid
	}

	self._friendService:requestDeleteFriend(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._friendModel:updateFriendCount(kFriendType.kGame, -1)
			self._friendModel:removeFriend(kFriendType.kGame, response.data.delFriends)
			self:dispatch(Event:new(EVT_FRIEND_DELECT_SUCC, {}))

			if callback then
				callback()
			end
		end
	end)
end

function FriendSystem:requestAddFriend(rid, remark, callback)
	local params = {
		rid = rid,
		remark = remark
	}

	self._friendService:requestAddFriend(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_FRIEND_ADD_SUCC, {
				response = response.data
			}))

			if callback then
				callback()
			end
		end
	end)
end

function FriendSystem:requestOneKeyFriends(remark)
	local list = self._friendModel:getFriendList(kFriendType.kFind)
	local friendList = {}

	for i = 1, #list do
		local friend = list[i]
		local data = {
			remark = remark,
			rid = friend:getRid(),
			nickname = friend:getNickName()
		}
		friendList[#friendList + 1] = data
	end

	local params = {
		friendList = friendList
	}

	self._friendService:requestOneKeyFriends(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_FRIEND_ADD_SUCC, {
				needRefresh = true,
				response = response.data
			}))

			local status = response.data.status

			if status == 1 then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Add_All_Tips6")
				}))
			elseif status == 2 then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Add_All_Tips2", {
						name = response.data.errorFriend or ""
					})
				}))
			elseif status == 3 then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Add_All_Tips3", {
						name = response.data.errorFriend or ""
					})
				}))
			elseif status == 4 then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Add_All_Tips4")
				}))
			end
		end
	end)
end

function FriendSystem:requestApplyList(callback)
	local params = {}

	self._friendService:requestApplyList(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			response.data.friendsList = response.data.apply

			self._friendModel:synchronize(response.data, kFriendType.kApply, true)

			if #response.data.friendsList > 0 then
				self:setHasNewApplyFriends(true)
			end

			self:dispatch(Event:new(EVT_FRIEND_GETAPPLYLIST_SUCC, {
				response = response.data
			}))

			if callback then
				callback()
			end
		end
	end)
end

function FriendSystem:requestSimpleFriendInfo(rid, callback)
	local params = {
		friendRid = rid
	}

	self._friendService:requestSimpleFriendInfo(params, true, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback(response.data)
		end
	end)
end

local __bases = {
	31536000,
	15768000,
	2592000,
	86400,
	3600,
	60,
	1
}

function FriendSystem:formatApplyTime(time)
	if time < 60 then
		return Strings:get("Friend_UI19")
	end

	return self:formatOnlineTime(time)
end

function FriendSystem:formatOnlineTime(time)
	local a = time
	local farmat = {}

	for index, value in pairs(__bases) do
		local x = math.floor(a / value)
		farmat[index] = x
		a = a - x * value
	end

	if farmat[1] > 0 then
		return Strings:get("Friend_UI43", {
			year = farmat[1]
		})
	end

	if farmat[2] > 0 then
		return Strings:get("Friend_UI43_1", {
			halfyear = farmat[2]
		})
	end

	if farmat[3] > 0 then
		return Strings:get("Friend_UI43_2", {
			month = farmat[3]
		})
	end

	if farmat[4] > 0 then
		return Strings:get("Friend_UI22", {
			day = farmat[4]
		})
	end

	if farmat[5] > 0 then
		return Strings:get("Friend_UI21", {
			hour = farmat[5]
		})
	end

	if farmat[6] > 0 then
		return Strings:get("Friend_UI20", {
			min = farmat[6]
		})
	end

	return Strings:get("Friend_UI20", {
		min = 1
	})
end

function FriendSystem:getRecommendMessage(recommendType, param)
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local player = developSystem:getPlayer()
	local config = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Friend_Recommend_Message", "content")

	if recommendType == "Level" then
		return Strings:get(config[recommendType], {
			factor = player:getNickName()
		})
	end

	if recommendType == "" or recommendType == nil then
		return Strings:get(config.NoReason, {
			factor = player:getNickName()
		})
	end

	return Strings:get(config[recommendType], {
		factor = param
	})
end

function FriendSystem:hasCanSendPowerFriends()
	local list = self._friendModel:getFriendList(kFriendType.kGame)

	for i, value in pairs(list) do
		if value:getCanSend() then
			return true
		end
	end

	return false
end

function FriendSystem:hasCanGetPowerFriends()
	local receveState = self._friendModel:getReceiveTimes()

	if receveState < 1 then
		return false
	end

	local list = self._friendModel:getFriendList(kFriendType.kGame)

	for i, value in pairs(list) do
		if value:getCanReceive() then
			return true
		end
	end

	return false
end

function FriendSystem:getReceveStateAsBool()
	local receveState = self._friendModel:getReceiveTimes()

	if receveState < 1 then
		return false
	end

	return true
end

function FriendSystem:setHasApplyList(addFriends)
	if not addFriends then
		return
	end

	if not self._hasApplyList then
		self._hasApplyList = {}
	end

	for i, value in pairs(addFriends) do
		if self._hasApplyList[value] == nil then
			self._hasApplyList[value] = true
		end
	end
end

function FriendSystem:clearHasApplyList()
	self._hasApplyList = {}
end

function FriendSystem:getHasApplyList()
	if self._hasApplyList then
		return self._hasApplyList
	end

	return {}
end

function FriendSystem:showFriendPlayerInfoView(rid, record)
	local settingSystem = self:getInjector():getInstance(SettingSystem)

	settingSystem:requestPlayerInfo(rid, function (response)
		local data = response.data
		local view = self:getInjector():getInstance("settingView")

		self:getEventDispatcher():dispatchEvent(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			player = data,
			record = record
		}))
	end)
end
