EVT_LOGIN_REFRESH_SERVER = "EVT_LOGIN_REFRESH_SERVER"
EVT_ANNOUNCE_REFRESH_SERVER = "EVT_ANNOUNCE_REFRESH_SERVER"
EVT_PATFACE_REFRESH_SERVER = "EVT_PATFACE_REFRESH_SERVER"
EVT_REQUEST_LOGIN_SUCC = "EVT_REQUEST_LOGIN_SUCC"
LoginSystem = class("LoginSystem", Facade, _M)

LoginSystem:has("_curServer", {
	is = "rw"
})
LoginSystem:has("_loginService", {
	is = "r"
}):injectWith("LoginService")
LoginSystem:has("_gameServer", {
	is = "r"
}):injectWith("GameServerAgent")
LoginSystem:has("_login", {
	is = "r"
})
LoginSystem:has("_loginUrl", {
	is = "r"
})
LoginSystem:has("_playerRid", {
	is = "rw"
})
LoginSystem:has("_patFaceSaveData", {
	is = "rw"
})
LoginSystem:has("_announceSaveData", {
	is = "rw"
})
LoginSystem:has("_language", {
	is = "rw"
})
LoginSystem:has("_logoPvName", {
	is = "rw"
})
LoginSystem:has("_logoSize", {
	is = "rw"
})
LoginSystem:has("_isShowAnnounce", {
	is = "rw"
})

local cjson = require("cjson.safe")

function LoginSystem:initialize()
	super.initialize(self)

	self._login = Login:new()
	self._loginUrl = nil
	self._isShowAnnounce = true
	self._announceSaveData = nil
	self._patFaceSaveData = nil
	self._language = "ko"
end

function LoginSystem:vmsRequest(url, version, callback)
	if LOGIN_DEBUG then
		dump(url, "vms url")
		dump(version, "vms version")
	end

	self._loginService:vmsRequest(url, version, function (errorCode, response)
		local data = cjson.decode(response)
		local vmsInfo = data and data.data

		if vmsInfo and vmsInfo.data then
			if vmsInfo.data.webApiRoot then
				GameConfigs.webApiRoot = vmsInfo.data.webApiRoot
			elseif LOGIN_DEBUG then
				dump("vmsInfo.data.webApiRoot is nil")
			end

			if vmsInfo.data.switchConfig and type(vmsInfo.data.switchConfig) == "table" then
				for k, v in pairs(vmsInfo.data.switchConfig) do
					GameConfigs[tostring(k)] = v
				end
			end

			if callback then
				callback(errorCode, vmsInfo)
			end
		else
			DpsLogger:info("rtpvp", "vmsRequest: {}", response)
			self:dispatch(ShowTipEvent({
				tip = Strings:get("LOGIN_UI9") .. "vmsRequest"
			}))

			return
		end
	end)
end

function LoginSystem:getLoginUrl()
	return self._loginUrl
end

function LoginSystem:requestLogin(url, info, callback)
	info.did = PlatformHelper:getSdkDid()
	info.version = app:getAssetsManager():getCurrentVersion()
	info.baseversion = app.pkgConfig.packJobId

	if SDKUtils then
		info.pass = SDKUtils.getGamePass()
	end

	if LOGIN_DEBUG then
		dump(url, "login url")
		dump(info, "login info")
	end

	self._loginUrl = url

	self._loginService:requestLogin(url, info, function (errorCode, response)
		local responseData = cjson.decode(response)

		if errorCode == 200 and responseData and responseData.status == 0 then
			self._login:sync(responseData.data)

			if SDKHelper and SDKHelper:isEnableSdk() then
				SDKHelper:setOpenId(responseData.data.openid or "")
				SDKHelper:setOffTimeData(responseData.data.sdkData or {}, responseData.data.time)
			end

			self._user_type = responseData.data.user_type or 0

			self:dispatch(Event:new(EVT_REQUEST_LOGIN_SUCC))
		else
			self:dispatch(ShowTipEvent({
				tip = Strings:get("LOGIN_UI9")
			}))

			if LOGIN_DEBUG then
				dump(errorCode, "login errorCode: ")
				dump(responseData, "login response: ")
			end
		end

		if callback then
			callback(errorCode, responseData)
		end
	end)
end

function LoginSystem:iOSAccount(url, callback)
	self._loginService:iOSAccount(url, function (errorCode, response)
		local responseData = cjson.decode(response)

		if errorCode == 200 and responseData and responseData.status == 0 then
			if callback then
				callback(errorCode, responseData)
			end
		else
			self:dispatch(ShowTipEvent({
				tip = string.format("iOSAccount error,errorCode:%s", errorCode)
			}))
		end
	end)
end

function LoginSystem:getAnnounceData(data)
	local params = {
		sdkId = self._login:getSdkIdForAnnounce(),
		language = self._language
	}

	self._loginService:getAnnounceData(self._loginUrl, params, true, function (errorCode, response)
		local responseData = cjson.decode(response)
		self._announceSaveData = responseData

		self:dispatch(Event:new(EVT_ANNOUNCE_REFRESH_SERVER, {}))
	end)
end

function LoginSystem:getPatFaceData(data)
	local params = {
		language = self._language,
		isDeductTime = data.isDeductTime
	}

	self._loginService:getPatFaceData(params, false, function (response)
		self._patFaceSaveData = response

		self:dispatch(Event:new(EVT_PATFACE_REFRESH_SERVER, {}))
	end)
end

function LoginSystem:getPatFaceDataToSave(callback)
	local params = {
		isDeductTime = 1,
		language = self._language
	}

	self._loginService:getPatFaceData(params, false, function (response)
		self._patFaceSaveData = response

		if callback then
			callback()
		end
	end)
end

function LoginSystem:getAnnounceDataToSave(callback)
	local params = {
		sdkId = self._login:getSdkIdForAnnounce(),
		language = self._language
	}

	self._loginService:getAnnounceData(self._loginUrl, params, true, function (errorCode, response)
		local responseData = cjson.decode(response)
		self._announceSaveData = responseData

		if callback then
			callback()
		end
	end)
end

function LoginSystem:requestPlayerInfo(callback)
	local playerRid = self._playerRid
	local info = {}

	if SDKHelper then
		info = SDKHelper:getStatisticsBaseInfo()
	end

	info.user_type = self._user_type
	local params = {
		rid = playerRid,
		token = self._login:getGameServerToken(),
		baseInfo = info
	}

	self._loginService:requestPlayerInfo(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			local developSystem = self:getInjector():getInstance(DevelopSystem)

			if response.data.extra then
				if response.data.extra.timeOffset then
					self._gameServer:setTimeOffset(response.data.extra.timeOffset)
				end

				if response.data.extra.serverOpenTime then
					developSystem:setServerOpenTime(response.data.extra.serverOpenTime)
				end

				if response.data.extra.timeZone then
					local serverTimeZone = response.data.extra.timeZone / 1000 / 3600

					developSystem:setTimeZone(serverTimeZone)
				end
			end

			developSystem:syncPlayer(response.data.player)

			if SDKHelper:isEnableSdk() then
				local isnew = response.data.is_new

				if isnew == 1 then
					local player = developSystem:getPlayer()
					local serverInfo = self:getCurServer()

					if SDKHelper and SDKHelper:isEnableSdk() then
						SDKHelper:reportCreate({
							roleName = tostring(player:getNickName()),
							roleId = tostring(player:getRid()),
							roleLevel = tostring(player:getLevel()),
							roleCombat = checkint(developSystem:getCombat()),
							serverId = serverInfo:getSecId(),
							serverName = serverInfo:getName(),
							createTime = tostring(player:getCreateTime())
						})
						SDKHelper:postData({
							eventKey = "10009"
						})
					end
				end
			end

			local pushSystem = self:getInjector():getInstance(PushSystem)

			pushSystem:listen()

			local resetSystem = self:getInjector():getInstance(ResetSystem)

			resetSystem:listenResetPush()

			if response.data.player.shops then
				local shopSystem = self:getInjector():getInstance(ShopSystem)

				shopSystem:initSync(response.data.player.shops)
			end

			if response.data.extra and response.data.extra.friendApplyCount then
				local friendSystem = self:getInjector():getInstance(FriendSystem)

				friendSystem:getFriendModel():setFriendApplyCount(response.data.extra.friendApplyCount)
			end

			if response.data.player.customData then
				local customDataSystem = self:getInjector():getInstance(CustomDataSystem)

				customDataSystem:sync(response.data.player.customData)

				local monthSignInSystem = self:getInjector():getInstance(MonthSignInSystem)

				monthSignInSystem:syncTodayReward()
			else
				local customDataSystem = self:getInjector():getInstance(CustomDataSystem)

				customDataSystem:requestGetData(true)
			end

			if callback then
				callback()
			end

			StatisticSystem:setRid(playerRid)
		end
	end)
end

function LoginSystem:getServerList()
	return self._login:getServerList()
end

function LoginSystem:setCurServer(server)
	self._curServer = server
end

function LoginSystem:getCurServer()
	if self._curServer == nil then
		local lastServerId = self._login:getLastLoginSec()

		if lastServerId then
			self._curServer = self._login:getServerBySec(lastServerId)
		end

		if not self._curServer then
			self._curServer = self._login:getRandomServer()
		end
	end

	return self._curServer
end

function LoginSystem:getUid()
	return self._login:getUid()
end

function LoginSystem:getAnnounce()
	return self._login:getAnnounce()
end

function LoginSystem:randomLoadingView()
	local config = nil
	local loadingIdList = ConfigReader:getDataByNameIdAndKey("ConfigValue", "LoadingConfigDefault", "content")

	if loadingIdList and #loadingIdList > 0 then
		local index = math.random(1, #loadingIdList)
		config = ConfigReader:getRecordById("Loading", loadingIdList[index])
	end

	return config

	local serverInfo = self:getCurServer()
	local maxTimes = ConfigReader:getDataByNameIdAndKey("ConfigValue", "LoadingTime", "content")
	local loginTimes = serverInfo:getDailyLoginTimes()

	if maxTimes < loginTimes or loginTimes == 0 then
		local loadingIdList = ConfigReader:getDataByNameIdAndKey("ConfigValue", "LoadingConfigDefault", "content")

		if loadingIdList and #loadingIdList > 0 then
			local index = math.random(1, #loadingIdList)
			config = ConfigReader:getRecordById("Loading", loadingIdList[index])
		end
	else
		local loginDays = serverInfo:getLoginDays()
		local vipLevel = serverInfo:getVipLevel()
		local specialConfig = ConfigReader:getDataByNameIdAndKey("ConfigValue", "LoadingConfig", "content")

		if specialConfig then
			local idList = {}

			for _, value in pairs(specialConfig) do
				local condition = value.condition

				if condition then
					local isDay = false
					local isVip = false

					if condition.day then
						isDay = loginDays == condition.day
					else
						isDay = true
					end

					if condition.vip then
						isVip = vipLevel == condition.vip
					else
						isVip = true
					end

					if isDay and isVip then
						idList = value.loading

						break
					end
				end
			end

			if not idList or #idList < 1 then
				idList = ConfigReader:getDataByNameIdAndKey("ConfigValue", "LoadingConfigDefault", "content")
			end

			if idList and #idList > 0 then
				local index = math.random(1, #idList)
				config = ConfigReader:getRecordById("Loading", idList[index])
			end
		end
	end

	return config
end

function LoginSystem:getGamePoliceAgreeSta()
	local agreePolicy = CommonUtils.getDataFromLocalByKey("GAME_POLICY_AGREE")

	return agreePolicy and agreePolicy.GAME_POLICY_AGREE
end

function LoginSystem:saveGamePoliceAgreeSta(state)
	CommonUtils.saveDataToLocalByKey({
		GAME_POLICY_AGREE = state
	}, "GAME_POLICY_AGREE")
end

function LoginSystem:requestCancleUnBindAccount(accountId, callback)
	local params = {
		accountId = tostring(accountId)
	}

	self._loginService:requestCancleUnBindAccount(self:getLoginUrl(), params, callback)
end

function LoginSystem:requestUnBindAccount(accountId, callback)
	local params = {
		accountId = tostring(accountId)
	}

	self._loginService:requestUnBindAccount(self:getLoginUrl(), params, callback)
end

function LoginSystem:getLimitTimeBg()
	local allBg = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Newyear_MainLoginScene", "content")

	if allBg then
		for i, v in pairs(allBg) do
			if v.time then
				local startDate = TimeUtil:parseDateTime(nil, v.time.start)
				local curTime = self:getInjector():getInstance(GameServerAgent):remoteTimestamp()
				local startTs = TimeUtil:timeByRemoteDate(startDate)
				local endDate = TimeUtil:parseDateTime(nil, v.time["end"])
				local endTs = TimeUtil:timeByRemoteDate(endDate)

				if startTs < curTime and curTime < endTs then
					return v.id
				end
			end
		end
	end
end
