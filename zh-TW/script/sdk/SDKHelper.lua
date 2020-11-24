local PlatformHelper = require("sdk.PlatformHelper")
local cjson = require("cjson.safe")
local SDKHelper = class("SDKHelper", legs.Actor)
EVT_LOGIN = "EVT_LOGIN"
EVT_SWITCH_ACCOUNT = "EVT_SWITCH_ACCOUNT"
EVT_LOG_OUT = "EVT_LOG_OUT"
EVT_PAY_OFF = "EVT_PAY_OFF"
local SDK_FUN = {
	CHECK_REALNAME_AUTH = "checkRealNameAuth",
	REPORT_DATA = "reportData",
	HIDE_FLOAT_VIEW = "hideFloatView",
	LOGIN = "login",
	PAY = "pay",
	SHOW_FLOAT_VIEW = "showFloatView",
	EXTURN_FUNCTION = "exturnFunction",
	EXIT = "exit",
	PAY_INIT = "payInit",
	PAY_INCOMPLETE = "payIncomplete",
	LOGOUT = "logout",
	INIT = "init",
	SWITCH_ACCOUNT = "switchAccount"
}
local EVENT_TYPE = {
	SDK_ORDER_SUCCESS = 1009,
	LOGOUT_SUCCESS = 1006,
	PAY_INCOMPLETE_SUCCESS = 1015,
	PAY_CANCEL = 1011,
	PAY_INCOMPLETE_NO = 1014,
	LOGIN_CANCEL = 1002,
	LOGIN_SUCCESS = 1000,
	LOGOUT_CANCEL = 1008,
	SWITCH_ACCOUNT_CANCEL = 1005,
	LOGIN_FAILURE = 1001,
	SWITCH_ACCOUNT_SUCCESS = 1003,
	PAY_INCOMPLETE_FAILURE = 1016,
	PAY_SUCCESS = 1012,
	SWITCH_ACCOUNT_FAILURE = 1004,
	PAY_COMPLETE = 1013,
	PAY_FAILURE = 1010,
	LOGOUT_FAILURE = 1007
}
local REPORT_TYPE = {
	LOGIN = "LOGIN",
	CREATE = "CREATE",
	UPLEVEL = "UPLEVEL"
}
local _noSdkSourceTable = {
	android = "dpstorm_android",
	mac = "dpstorm_ios",
	ios = "dpstorm_ios"
}

function SDKHelper:initialize()
	self:init()

	self.EVENT_TYPE = EVENT_TYPE
	self.cacheInfo = {}
	self.mSdkSource = nil
	self._repotParams = {}
end

function SDKHelper:dispose()
end

function SDKHelper:init()
	local this = self

	local function cb(_data)
		local params = nil

		if _data and _data ~= "" then
			params = cjson.decode(_data)
		end

		this:onSDKCallBack(params)
	end

	PlatformHelper:regSDKCallback(cb)

	if dpsAnySdk then
		dpsAnySdk.startup("")
	end

	self:adjustEventTracking(AdjustEventList.ADJUST_OPEN_GSAME_EVENT)
end

function SDKHelper:onSDKCallBack(params)
	if params == nil then
		return
	end

	local cmd = params.cmd

	if cmd == nil then
		return
	end

	local cb = self["sdk_cb_" .. cmd]

	if cb then
		cb(self, params)
	end
end

function SDKHelper:callMethod(methodName, params)
	PlatformHelper:callSDKFunction(methodName, params)
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
	print("SDKHelper:getSdkSource", self.mSdkSource)

	if not self.mSdkSource then
		self.mSdkSource = PlatformHelper:getSdkSource()

		if not self.mSdkSource then
			self.mSdkSource = ""
		end
	end

	return self.mSdkSource
end

function SDKHelper:getChannelID()
	print("SDKHelper:getChannelID", self.mChannelID)

	if not self.mChannelID then
		self.mChannelID = PlatformHelper:getChannelID()

		if not self.mChannelID then
			self.mChannelID = ""
		end
	end

	return self.mChannelID
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

function SDKHelper:pay(data)
	if not data then
		self:dispatch(ShowTipEvent({
			tip = "function SDKHelper:pay(data): data is nil"
		}))

		return
	end

	self:callMethod(SDK_FUN.PAY, data)
end

function SDKHelper:payInit(productList)
	self:callMethod(SDK_FUN.PAY_INIT, productList)
end

function SDKHelper:payIncomplete()
	self:callMethod(SDK_FUN.PAY_INCOMPLETE)
end

function SDKHelper:getServerId()
	return self:callMethod("getServerId")
end

function SDKHelper:report(reportType, data)
	if not data then
		self:dispatch(ShowTipEvent({
			tip = "SDKHelper:report(data): data is nil"
		}))

		return
	end

	local params = self._repotParams
	params.reportType = reportType

	for key, value in pairs(data) do
		params[key] = value
	end

	self:callMethod(SDK_FUN.REPORT_DATA, params)
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

function SDKHelper:getVerifyData()
	return ""
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

function SDKHelper:_adjustEvent(data)
	if device.platform == "mac" then
		return
	end

	if data.eventName == "eventTracking" then
		dpsAnySdk.callMethod("trackEvent", data.eventName, data.eventToken)
	elseif data.eventName == "revenueTracking" then
		dpsAnySdk.callMethod("trackEvent", data.eventName, data.eventToken, data.revenue, data.transactionId)
	end
end

function SDKHelper:adjustEventTracking(token)
	if token == nil then
		return
	end

	local reportData = {
		eventName = "eventTracking",
		eventToken = token
	}

	self:_adjustEvent(reportData)
end

function SDKHelper:adjustRevenueTracking(token, orderId, price, currency)
	local reportData = {
		eventName = "revenueTracking",
		eventToken = token,
		revenue = tostring(price) .. "," .. currency,
		transactionId = tostring(orderId)
	}

	self:_adjustEvent(reportData)
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

	if sdkSource == "" then
		sdkSource = _noSdkSourceTable[tostring(device.platform)]
	end

	if device.platform == "mac" then
		return {
			mac = "",
			did = "",
			ks_channel = "",
			imei = "",
			idfv = "",
			ks_packageChannel = "",
			os = "mac_os",
			xingeToken = "",
			baseVersion = "1.0.0",
			platform = "mac",
			idfa = "",
			dtype = "",
			pass = "",
			ip = "",
			channel = "mac-simulator",
			version = "1.0.0",
			openid = openId,
			source = sdkSource
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

	local channel = self:getChannelID() or device.platform
	local ks_channel = self:readCacheValue("ks_channel") or ""
	local ks_packageChannel = self:readCacheValue("ks_packageChannel") or ""
	local did = PlatformHelper:getSdkDid()

	return {
		openid = openId,
		source = sdkSource,
		baseVersion = baseVersion,
		version = version,
		platform = deviceInfo.systemName,
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
		ks_packageChannel = ks_packageChannel
	}
end

function SDKHelper:sdk_cb_login(params)
	local errorCode = "loginFailure"

	if EVENT_TYPE.LOGIN_SUCCESS == params.eventType then
		errorCode = "loginSuccess"

		self:adjustEventTracking(AdjustEventList.ADJUST_LOGIN_SUCCESS_EVENT)

		local loginType = self:getLoginWay()

		if loginType == "mamba_login" then
			self:adjustEventTracking(AdjustEventList.ADJUST_LOGIN_MB_SUCCESS_EVENT)
		elseif loginType == "google_login" then
			self:adjustEventTracking(AdjustEventList.ADJUST_LOGIN_G_SUCCESS_EVENT)
		elseif loginType == "facebook_login" then
			self:adjustEventTracking(AdjustEventList.ADJUST_LOGIN_FB_SUCCESS_EVENT)
		end

		self:saveLoginInfo(params.playerInfo)
	end

	self:dispatch(Event:new(EVT_LOGIN, {
		errorCode = errorCode,
		message = params
	}))
end

function SDKHelper:sdk_cb_logout(params)
	local errorCode = "logoutFailure"

	if EVENT_TYPE.LOGOUT_SUCCESS == params.eventType then
		errorCode = "logoutSuccess"
	end

	self:dispatch(Event:new(EVT_LOG_OUT, {
		errorCode = errorCode,
		message = params
	}))

	if errorCode == "logoutSuccess" then
		REBOOT("REBOOT_NOUPDATE")
	end
end

function SDKHelper:sdk_cb_switchAccount(params)
	local errorCode = "switchAccountFailure"

	if EVENT_TYPE.SWITCH_ACCOUNT_SUCCESS == params.eventType then
		errorCode = "switchAccountSuccess"

		self:saveLoginInfo(params.playerInfo)

		local scene = self:getInjector():getInstance("BaseSceneMediator", "activeScene")
		local topViewName = scene:getTopViewName()

		if topViewName ~= "LoginView" then
			REBOOT("REBOOT_NOUPDATE")
		end
	end

	self:dispatch(Event:new(EVT_SWITCH_ACCOUNT, {
		errorCode = errorCode,
		message = params
	}))
end

function SDKHelper:sdk_cb_pay(params)
	local errorCode = "payFailure"

	if EVENT_TYPE.PAY_SUCCESS == params.eventType then
		errorCode = "paySuccess"
	end

	self:dispatch(Event:new(EVT_PAY_OFF, {
		errorCode = errorCode,
		message = params
	}))
end

function SDKHelper:sdk_cb_payInit(params)
	local errorCode = "payInitSuccess"

	self:dispatch(Event:new(EVT_PAY_OFF, {
		errorCode = errorCode,
		message = params
	}))
end

function SDKHelper:sdk_cb_payIncomplete(params)
	local errorCode = "payIncFailure"

	if EVENT_TYPE.PAY_INCOMPLETE_NO == params.eventType then
		errorCode = "payNoIncomplete"
	elseif EVENT_TYPE.PAY_INCOMPLETE_SUCCESS == params.eventType then
		errorCode = "payIncComplete"
	end

	self:dispatch(Event:new(EVT_PAY_OFF, {
		errorCode = errorCode,
		message = params
	}))
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
	self:saveCacheValue("loginway", params.loginway or "")
	self:setOpenId(tostring(self:readCacheValue("uid")))
end

function SDKHelper:saveCacheValue(key, value)
	self.cacheInfo[key] = value
end

function SDKHelper:readCacheValue(key)
	return self.cacheInfo[key]
end

function SDKHelper:getLoginWay()
	return self:readCacheValue("loginway")
end

return SDKHelper
