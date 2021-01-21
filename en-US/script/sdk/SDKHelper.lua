local PlatformHelper = require("sdk.PlatformHelper")
local cjson = require("cjson.safe")
EVT_LOGIN = "EVT_LOGIN"
EVT_SWITCH_ACCOUNT = "EVT_SWITCH_ACCOUNT"
EVT_LOG_OUT = "EVT_LOG_OUT"
EVT_PAY_OFF = "EVT_PAY_OFF"
EVT_BIND_ACCOUNT = "EVT_BIND_ACCOUNT"
EVT_SHARE = "EVT_SHARE"
SDK_FUN = {
	SET_LANGUAGE = "setLanguage",
	SHARE = "shareOtherPlatforms",
	LOGIN = "login",
	HIDE_FLOAT_VIEW = "hideFloatView",
	CHECK_REALNAME_AUTH = "checkRealNameAuth",
	USER_LOCATION_INFO = "getUserLocationInfo",
	SYSTEM_SHARE = "systemShare",
	EXTURN_FUNCTION = "exturnFunction",
	SHOW_CSD = "openAIHelpElva",
	PAY_INCOMPLETE = "payIncomplete",
	PAY_INIT = "payInit",
	INIT = "init",
	REPORT_DATA_AD = "trackEventAD",
	SWITCH_ACCOUNT = "switchAccount",
	REPORT_DATA_WM_SL = "wanmeiGameGetServerListEvent",
	USER_CENTER = "userCenterByPwrdView",
	REPORT_DATA = "reportData",
	OPEM_URL = "openUrlByGame",
	PAY = "pay",
	SHOW_FLOAT_VIEW = "showFloatView",
	EXIT = "exit",
	REQUEST_REVIEW_IN_APP = "requestReviewInApp",
	LOGOUT = "logout",
	REPORT_DATA_WM = "wanmeiTrackEvent",
	SHOW_BIND_PHONE = "showBindPhone"
}
REPORT_TYPE = {
	LOGOUT = "LOGOUT",
	LOGIN_ERROR = "LOGIN_ERROR",
	CREATE = "CREATE",
	UPLEVEL = "UPLEVEL",
	LOGIN = "LOGIN"
}
local _noSdkSourceTable = {
	android = "dpstorm_android",
	mac = "dpstorm_ios",
	windows = "dpstorm_ios",
	ios = "dpstorm_ios"
}

if PlatformHelper:isIOS() then
	require("sdk.DPSAnySdk-iOS")
elseif PlatformHelper:isAndroid() then
	require("sdk.DPSAnySdk-Android")
else
	require("sdk.DPSAnySdk-mac")
end

local SDKHelper = class("SDKHelper", DPSAnySdk, _M)

function SDKHelper:initialize()
	super.initialize(self)

	self.cacheInfo = {}
	self.mSdkSource = nil
	self.mChannelID = nil
	self._repotParams = {}
end

function SDKHelper:dispose()
end

function SDKHelper:isEnableSdk()
	if GameConfigs and GameConfigs.disabledSDKLogin then
		return false
	end

	if self:getSdkSource() ~= "" then
		return true
	end

	return false
end

function SDKHelper:getSdkSource()
	if not self.mSdkSource then
		self.mSdkSource = super.getSdkSource(self)

		if not self.mSdkSource then
			self.mSdkSource = ""
		end
	end

	return self.mSdkSource
end

function SDKHelper:getChannelID()
	if not self.mChannelID then
		self.mChannelID = super.getChannelID(self)

		if not self.mChannelID then
			self.mChannelID = ""
		end
	end

	return self.mChannelID
end

function SDKHelper:setOpenId(openId)
	if dpsAnySdk then
		return dpsAnySdk.setOpenId(tostring(openId))
	end
end

function SDKHelper:getOpenId()
	if dpsAnySdk then
		return dpsAnySdk.getOpenId()
	end

	return ""
end

function SDKHelper:login(data)
	self:callMethod(SDK_FUN.LOGIN)
end

function SDKHelper:switchAccount(data)
	self:callMethod(SDK_FUN.SWITCH_ACCOUNT)
end

function SDKHelper:logOut(data)
	self:callMethod(SDK_FUN.LOGOUT)
end

function SDKHelper:showBindPhone()
	self:callMethod(SDK_FUN.SHOW_BIND_PHONE)
end

function SDKHelper:payInit(productList)
	self:callMethod(SDK_FUN.PAY_INIT, cjson.encode(productList))
end

function SDKHelper:payIncomplete()
	self:callMethod(SDK_FUN.PAY_INCOMPLETE)
end

function SDKHelper:getVerifyData()
	return ""
end

function SDKHelper:getGlobalData(openId, isDefault)
	if self:getSdkSource() ~= "" and not isDefault then
		local extension_info = {}
		local extStr = self:readCacheValue("extension_info")

		if extStr and extStr ~= "" then
			extension_info = cjson.decode(extStr)
		end

		return {
			sdk_source = self:getSdkSource(),
			sdk_params = {
				uid = self:readCacheValue("uid"),
				userName = self:readCacheValue("userName"),
				accessToken = self:readCacheValue("accessToken"),
				any_sdk_id = self:readCacheValue("sdk_id"),
				any_app_id = self:readCacheValue("app_id"),
				any_merchant_id = self:readCacheValue("merchant_id"),
				extension_info = extension_info
			}
		}
	end

	self:setOpenId(tostring(openId))

	return {
		sdk_source = _noSdkSourceTable[tostring(device.platform)],
		sdk_params = {
			openid = string.urlencode(tostring(openId))
		}
	}
end

function SDKHelper:getStatisticsBaseInfo()
	local openId = self:getOpenId()
	local sdkSource = self:getSdkSource()
	local channel = GameConfigs.channel

	if sdkSource == "" then
		sdkSource = _noSdkSourceTable[tostring(device.platform)]
	end

	if device.platform == "mac" or device.platform == "windows" then
		return {
			atype = 0,
			did = "",
			gid = 0,
			imei = "",
			idfv = "",
			ks_packageChannel = "",
			os = "mac_os",
			mac = "",
			ks_channel = "",
			xingeToken = "",
			baseVersion = "1.0.0",
			platform = "mac",
			idfa = "",
			dtype = "",
			pass = "",
			ip = "",
			pid = 0,
			version = "1.0.0",
			openid = openId,
			source = sdkSource,
			channel = channel or "mac-simulator"
		}
	end

	local deviceInfo = app.getDevice():getDeviceInfo()
	local baseVersion = app.pkgConfig and app.pkgConfig.packJobId
	local version = app:getAssetsManager():getCurrentVersion()
	local ipAddress = ""
	local macAddress = ""
	local idfa = ""
	local idfv = ""
	local imei = ""

	if app and app.getDevice then
		ipAddress = app.getDevice().getIPAddress and app.getDevice():getIPAddress()
		macAddress = app.getDevice().getMacAddress and app.getDevice():getMacAddress()
		idfa = app.getDevice().getIDFA and app.getDevice():getIDFA()
		idfv = app.getDevice().getIDFV and app.getDevice():getIDFV()
		imei = app.getDevice().getIMEI and app.getDevice():getIMEI()
	end

	local xingeToken = ""

	if app and app.getXGPushServiceToken then
		xingeToken = app.getXGPushServiceToken()
	end

	channel = channel or self:getChannelID() or device.platform
	local ks_channel = self:readCacheValue("ks_channel") or ""
	local ks_packageChannel = self:readCacheValue("ks_packageChannel") or ""
	local loginType = self:readCacheValue("loginType")
	local gid = self:getGameId()
	local pid = self:getPlayerId()
	local extension_info = self:readCacheValue("extension_info") or ""
	local did = PlatformHelper:getSdkDid()

	return {
		openid = openId,
		source = sdkSource,
		baseVersion = baseVersion,
		version = version,
		platform = device.platform,
		os = deviceInfo.systemName .. " " .. deviceInfo.systemVersion,
		dtype = deviceInfo.deviceName,
		did = did,
		pass = SDKUtils.getGamePass(),
		ip = ipAddress,
		idfa = idfa,
		idfv = idfv,
		mac = macAddress,
		imei = imei,
		xingeToken = xingeToken,
		channel = channel,
		ks_channel = ks_channel,
		ks_packageChannel = ks_packageChannel,
		atype = loginType,
		gid = gid,
		pid = pid,
		extension_info = extension_info
	}
end

function SDKHelper:userCenterByPwrdView()
	self:callMethod(SDK_FUN.USER_CENTER)
end

function SDKHelper:systemShare(data)
	self:callMethod(SDK_FUN.SYSTEM_SHARE, cjson.encode(data))
end

function SDKHelper:userQuestion(url)
	self:callMethod(SDK_FUN.OPEM_URL, cjson.encode({
		showNavbar = true,
		url = url
	}))
end

function SDKHelper:getUserLocationInfo()
	self:callMethod(SDK_FUN.USER_LOCATION_INFO)
end

function SDKHelper:reportLogin(data)
	self:report(REPORT_TYPE.LOGIN, data)
end

function SDKHelper:reportCreate(data)
	self:report(REPORT_TYPE.CREATE, data)
end

function SDKHelper:reportUpLevel(data)
	self:report(REPORT_TYPE.UPLEVEL, data)
end

function SDKHelper:reportLogout(data)
	self:report(REPORT_TYPE.LOGOUT, data)
end

function SDKHelper:reportLoginError(data)
	self:report(REPORT_TYPE.LOGIN_ERROR, data)
end

function SDKHelper:saveLoginInfo(params)
	self:saveCacheValue("uid", params.uid or "")
	self:saveCacheValue("userName", params.username or "")
	self:saveCacheValue("accessToken", params.token or "")
	self:saveCacheValue("sdk_id", params.sdk_id or "")
	self:saveCacheValue("app_id", params.app_id or "")
	self:saveCacheValue("merchant_id", params.merchant_id or "")
	self:saveCacheValue("extension_info", params.extension_info or "")
	self:saveCacheValue("ks_channel", params.channel or "")
	self:saveCacheValue("ks_packageChannel", params.packageChannel or "")
	self:setOpenId(tostring(self:readCacheValue("uid")))
	self:saveCacheValue("loginType", params.loginType or 0)
end

function SDKHelper:saveCacheValue(key, value)
	self.cacheInfo[key] = value
end

function SDKHelper:readCacheValue(key)
	return self.cacheInfo[key]
end

return SDKHelper
