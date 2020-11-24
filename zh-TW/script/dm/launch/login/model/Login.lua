loginTag = "/gsapi/game/login"
vmsDefaultUrl = ""
ServerMarkType = {
	kClose = 4,
	kRecommend = 2,
	kHot = 3,
	kNew = 1
}
ServerState = {
	kRed = 2,
	kClose = 4,
	kGray = 3,
	kGreen = 0,
	kNormal = 1
}
ServerStateImgNames = {
	[ServerState.kGreen] = "denglu_img_02.png",
	[ServerState.kNormal] = "denglu_img_02.png",
	[ServerState.kRed] = "denglu_img_03.png",
	[ServerState.kGray] = "denglu_img_01.png",
	[ServerState.kClose] = "denglu_img_03.png"
}
ServerInfo = class("ServerInfo")

ServerInfo:has("_secId", {
	is = "r"
})
ServerInfo:has("_secIdx", {
	is = "r"
})
ServerInfo:has("_name", {
	is = "r"
})
ServerInfo:has("_ip", {
	is = "r"
})
ServerInfo:has("_port", {
	is = "r"
})
ServerInfo:has("_version", {
	is = "r"
})
ServerInfo:has("_markType", {
	is = "rw"
})
ServerInfo:has("_state", {
	is = "r"
})
ServerInfo:has("_dailyLoginTimes", {
	is = "rw"
})
ServerInfo:has("_loginDays", {
	is = "rw"
})
ServerInfo:has("_vipLevel", {
	is = "rw"
})
ServerInfo:has("_openTime", {
	is = "rw"
})
ServerInfo:has("_registerFull", {
	is = "r"
})
ServerInfo:has("_onlineFull", {
	is = "r"
})
ServerInfo:has("_registerRecommend", {
	is = "r"
})
ServerInfo:has("_recommend", {
	is = "r"
})
ServerInfo:has("_headId", {
	is = "r"
})
ServerInfo:has("_level", {
	is = "r"
})
ServerInfo:has("_nickName", {
	is = "r"
})
ServerInfo:has("_lastLoginTime", {
	is = "r"
})
ServerInfo:has("_createTime", {
	is = "r"
})
ServerInfo:has("_logoutTs", {
	is = "r"
})
ServerInfo:has("_diamond", {
	is = "r"
})
ServerInfo:has("_regLimit", {
	is = "r"
})
ServerInfo:has("_isNewRecommend", {
	is = "r"
})

function ServerInfo:initialize()
	super.initialize(self)

	self._dailyLoginTimes = 0
	self._loginDays = 0
	self._vipLevel = 0
	self._openTime = 0
	self._registerFull = 0
	self._onlineFull = 0
	self._registerRecommend = 0
	self._state = ServerState.kGreen
	self._recommend = 0
	self._nickName = ""
	self._lastLoginTime = 0
	self._createTime = 0
	self._logoutTs = 0
	self._diamond = 0
	self._regLimit = false
	self._isNewRecommend = 0
end

function ServerInfo:sync(data)
	if data.sec then
		self._secId = data.sec
	end

	if data.secIndex then
		self._secIdx = data.secIndex
	end

	if data.name then
		self._name = data.name
	end

	if data.ip then
		self._ip = data.ip
	end

	if data.port then
		self._port = tonumber(data.port)
	end

	if data.headId then
		self._headId = data.headId
	end

	if data.level then
		self._level = data.level
	end

	if data.version then
		self._version = data.version
	end

	if data.maintain and data.maintain == 1 then
		self._state = ServerState.kGray
	elseif data.registerFull then
		self._state = data.registerFull
	end

	if data.recommend then
		self._recommend = data.recommend
	end

	if data.logoutTs then
		self._logoutTs = data.logoutTs
	end

	if data.dailyLoginTimes then
		self._dailyLoginTimes = data.dailyLoginTimes
	end

	if data.loginDays then
		self._loginDays = data.loginDays
	end

	if data.vip then
		self._vipLevel = data.vip
	end

	if data.open_time then
		self._openTime = data.open_time
	end

	if data.onlineFull then
		self._onlineFull = data.onlineFull
	end

	if data.registerRecommend then
		self._registerRecommend = data.registerRecommend
	end

	if data.nickname then
		self._nickName = data.nickname
	end

	if data.diamond then
		self._diamond = data.diamond
	end

	if data.lastLoginTime then
		self._lastLoginTime = data.lastLoginTime
	end

	if data.createTime then
		self._createTime = data.createTime
	end

	if data.logoutTs then
		self._logoutTs = data.logoutTs
	end

	if data.regLimit ~= nil then
		self._regLimit = data.regLimit
	end

	if data.isNewRecommend ~= nil then
		self._isNewRecommend = data.isNewRecommend
	end

	if self:getRegLimit() then
		self._state = ServerState.kClose
	end
end

Login = class("Login", objectlua.Object)

Login:has("_uid", {
	is = "r"
})
Login:has("_isnew", {
	is = "r"
})
Login:has("_serverList", {
	is = "r"
})
Login:has("_recommendList", {
	is = "r"
})
Login:has("_recentlyList", {
	is = "r"
})
Login:has("_lastLoginSec", {
	is = "r"
})
Login:has("_announce", {
	is = "r"
})
Login:has("_serverGroup", {
	is = "r"
})
Login:has("_secNamesMap", {
	is = "r"
})
Login:has("_serverTime", {
	is = "r"
})

TEST_SERVER = {
	{
		name = "服务器",
		sec = GameConfigs.svid or 11,
		ip = GameConfigs.serverIP or "192.168.1.17",
		port = GameConfigs.serverPort or 8888,
		registerFull = ServerState.kClose
	}
}

function Login:initialize()
	super.initialize(self)

	self._uid = nil
	self._isnew = nil
	self._serverList = {}
	self._recommendList = {}
	self._recentlyList = {}
	self._lastLoginSec = nil
	self._gameServerToken = ""
	self._serverGroup = {}
	self._secNamesMap = nil
	self._serverTime = 0
	self._serverIndexArr = {}
end

function Login:sync(data)
	local uid = data and data.uid

	if uid then
		self._uid = uid
	end

	if data.sec_show_name then
		self._secNamesMap = data.sec_show_name
	end

	local is_new = data and data.is_new

	if is_new then
		self._isnew = is_new
	end

	local secListData = data and data.sec_list
	self._gameServerToken = data and data.token

	if data.time then
		self._serverTime = data.time
	end

	if secListData then
		self._curServer = nil

		table.sort(secListData, function (a, b)
			return a.open_time < b.open_time
		end)

		self._serverList = {}
		self._recommendList = {}

		for index, serverData in ipairs(secListData) do
			local serverInfo = ServerInfo:new()

			serverInfo:sync(serverData)

			local serverIndex = #self._serverList + 1
			self._serverList[serverIndex] = serverInfo

			if not serverInfo:getRegLimit() and serverInfo:getIsNewRecommend() == 1 then
				table.insert(self._serverIndexArr, serverIndex)
			end

			local state = serverInfo:getState()

			if state ~= ServerState.kGray and state ~= ServerState.kClose and (serverInfo:getRecommend() == 1 or index == #secListData and state ~= ServerState.kRed or index == #secListData - 1 and serverInfo:getRegisterRecommend() == 1) then
				serverInfo:setMarkType(ServerMarkType.kRecommend)

				self._recommendList[#self._recommendList + 1] = serverInfo
			elseif serverInfo:getRegLimit() and not serverInfo:getHeadId() then
				serverInfo:setMarkType(ServerMarkType.kClose)
			elseif state == ServerState.kRed then
				serverInfo:setMarkType(ServerMarkType.kHot)
			end
		end

		table.sort(self._recommendList, function (a, b)
			return b:getOpenTime() < a:getOpenTime()
		end)
	end

	local recentlyListData = nil

	if data and data.sec_role_info then
		recentlyListData = data.sec_role_info
	end

	if recentlyListData then
		for sec, serverData in pairs(recentlyListData) do
			local serverInfo = self:getServerBySec(sec)

			if serverInfo then
				serverInfo:sync(serverData)

				self._recentlyList[#self._recentlyList + 1] = serverInfo
			end
		end

		table.sort(self._recentlyList, function (a, b)
			return b:getLogoutTs() < a:getLogoutTs()
		end)
	end

	if data and data.player_info then
		self._lastLoginSec = data.player_info.last_login_sec
	end

	if data and data.announce then
		self._announce = data.announce
	end
end

function Login:getServerBySec(sec)
	for i, value in pairs(self._serverList) do
		if tostring(value:getSecId()) == tostring(sec) then
			return value
		end
	end

	return self._serverList[#self._serverList]
end

function Login:getGameServerToken()
	if self._gameServerToken == "" or not self._gameServerToken then
		return ""
	end

	return self._gameServerToken
end

function Login:getRandomServer()
	if not self._curServer then
		local length = #self._serverIndexArr

		if length == 0 then
			length = 1
		end

		local randomIndex = math.random(1, length)
		local index = self._serverIndexArr[randomIndex]
		self._curServer = self._serverList[index]

		if not self._curServer then
			self._curServer = self._serverList[#self._serverList]
		end
	end

	return self._curServer
end
