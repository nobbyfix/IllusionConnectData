MessageType = {
	kPlayer = 2,
	kSystem = 1,
	kTrick = 3
}
MessageStatus = {
	kSending = 1,
	kInvail = 0,
	kSendSuc = 2,
	kSendFail = 3
}
BaseMessage = class("BaseMessage", objectlua.Object, _M)

BaseMessage:has("_id", {
	is = "rw"
})
BaseMessage:has("_time", {
	is = "rw"
})
BaseMessage:has("_type", {
	is = "rw"
})
BaseMessage:has("_content", {
	is = "rw"
})
BaseMessage:has("_channelIds", {
	is = "rw"
})
BaseMessage:has("_params", {
	is = "rw"
})
BaseMessage:has("_extraData", {
	is = "rw"
})
BaseMessage:has("_emotionId", {
	is = "rw"
})

function BaseMessage:initialize()
	super.initialize(self)

	self._content = ""
	self._channelIds = {}
	self._params = {}
	self._extraData = {}
end

function BaseMessage:sync(data)
	if data.id then
		self._id = data.id
	end

	if data.time then
		self._time = data.time
	end

	if data.type then
		self._type = data.type
	end

	if data.params then
		self._params = data.params
	end

	if data.channelIds then
		self._channelIds = data.channelIds
	end

	if data.extraData then
		self._extraData = data.extraData
	end
end

function BaseMessage:getUrlData()
	if self._channelIds then
		local data = {}

		for k, v in pairs(self._channelIds) do
			if v == ChannelId.kSystem then
				data.tabType = ChatTabType.kSystem
			elseif v == ChannelId.kWorld then
				data.tabType = ChatTabType.kWorld
			elseif v == ChannelId.kUnion then
				data.tabType = ChatTabType.kUnion
			elseif v == ChannelId.kTeam then
				data.tabType = ChatTabType.kTeam
			end
		end

		return data
	end

	return nil
end

function BaseMessage:isPrivateMessage()
	if self._channelIds then
		for k, v in pairs(self._channelIds) do
			local strs = string.split(v, "-")

			if strs[1] == ChannelType.kPrivate then
				return true
			end
		end
	end

	return false
end

SystemMessage = class("SystemMessage", BaseMessage, _M)

SystemMessage:has("_config", {
	is = "rw"
})
SystemMessage:has("_labelType", {
	is = "rw"
})

function SystemMessage:initialize()
	super.initialize(self)

	self._labelType = SystemMsgLabelType.kSystem
end

function SystemMessage:sync(data)
	super.sync(self, data)

	if data.content then
		self._content = data.content
	end

	if data.configId then
		self._config = ConfigReader:getRecordById("Announce", tostring(data.configId))
	end

	if self._config then
		self:parseContent()
	end
end

function SystemMessage:parseContent()
	if self._config.Channel then
		self._channelIds = self._config.Channel
	end

	if self._config.Label then
		self._labelType = self._config.Label
	end

	local env = {}

	if self._params then
		for k, v in pairs(self._params) do
			env[k] = v
		end

		env.clubname = self._params.clubName or self._params.clubname
		env.nickname1 = self._params.attName
		env.nickname2 = self._params.defName
		env.num = self._params.star
		env.fontName = TTF_FONT_FZYH_M

		if self._params.heroId then
			local heroInfo = ConfigReader:getRecordById("HeroBase", self._params.heroId)

			if heroInfo then
				self._params.heroName = Strings:get(heroInfo.Name)
				env.heroname = self._params.heroName
			end
		end

		if self._params.pos then
			self._params.job = ClubPositionNameStr[self._params.pos]
			env.job = self._params.job
		end

		if self._params.itemId then
			local nameId = ConfigReader:getDataByNameIdAndKey("ItemConfig", self._params.itemId, "Name")
			env.equipname = Strings:get(nameId)
		end

		if self._params.surfaceId then
			local nameId = ConfigReader:getDataByNameIdAndKey("Surface", self._params.surfaceId, "Name")
			env.surface = Strings:get(nameId)
		end

		if self._params.award then
			env.award = RewardSystem:getName(self._params.award)
		end
	end

	local content = Strings:get(self._config.Words[1], env)
	self._content = content
end

function SystemMessage:getTimes()
	return self._config.Times or 1
end

function SystemMessage:getPriority()
	return self._config.Priority or 1
end

function SystemMessage:getUrl()
	return self._config.Link
end

function SystemMessage:getExpireTime()
	return self._config.ExpireTime * 1000
end

function SystemMessage:isExpire(currentTime)
	currentTime = currentTime or os.time() * 1000
	local time = self:getTime()
	time = time or currentTime
	local expireTime = self:getExpireTime()

	return expireTime < currentTime - time
end

PlayerMessage = class("PlayerMessage", BaseMessage, _M)

PlayerMessage:has("_senderId", {
	is = "rw"
})
PlayerMessage:has("_status", {
	is = "rw"
})

function PlayerMessage:initialize()
	super.initialize(self)

	self._status = MessageStatus.kInvail
end

function PlayerMessage:sync(data)
	super.sync(self, data)

	if data.sender then
		self._senderId = data.sender
	end

	if data.status then
		self._status = data.status
	end

	if data.params then
		self._params = data.params

		if self._params.heroId then
			local heroNameId = ConfigReader:getDataByNameIdAndKey("HeroBase", self._params.heroId, "Name")
			self._params.heroName = Strings:get(heroNameId)
		end

		self._params.fontName = TTF_FONT_FZYH_R

		if self._params.job then
			self._params.Job = ClubPositionNameStr[self._params.job]
		end
	end

	if data.content then
		local content = xmlEscape(data.content)
		content = string.format("<font face='asset/font/CustomFont_FZYH_R.TTF' size='18' color='#343434'>%s</font>", content)
		self._content = content
	elseif data.contentId then
		if type(data.contentId) ~= "table" then
			self._content = Strings:get(data.contentId, self._params)
		else
			self._content = ""

			for i, value in pairs(data.contentId) do
				self._content = self._content .. Strings:get(value, self._params)
			end
		end
	elseif data.emotionId then
		self._emotionId = data.emotionId
	end
end
