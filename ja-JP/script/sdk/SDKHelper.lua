require("sdk.SDKHelperEnum")

local PlatformHelper = require("sdk.PlatformHelper")
local cjson = require("cjson.safe")

if PlatformHelper:isIOS() then
	require("sdk.DPSAnySdk-iOS")
elseif PlatformHelper:isAndroid() then
	require("sdk.DPSAnySdk-Android")
else
	require("sdk.DPSAnySdk-mac")
end

local _noSdkSourceTable = {
	android = "dpstorm_android",
	mac = "dpstorm_ios",
	ios = "dpstorm_ios"
}
local SDKHelper = class("SDKHelper", DPSAnySdk, _M)

function SDKHelper:initialize()
	super.initialize(self)

	self.cacheInfo = {}
	self.mSdkSource = nil
	self.mChannelID = nil
	self._repotParams = {}
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

	if device.platform == "mac" then
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

function SDKHelper:login(data)
	self:callMethod(SDK_FUN.LOGIN)
end

function SDKHelper:onLoginCallBack(errorCode, params)
	if errorCode == "loginSuccess" then
		self:saveLoginInfo(params)
		self:dispatch(Event:new(EVT_LOGIN, {
			errorCode = tostring(errorCode),
			message = params
		}))
	elseif errorCode == "loginFailure" then
		self:dispatch(ShowTipEvent({
			tip = tostring(errorCode)
		}))
	end
end

function SDKHelper:switchAccount(data)
	self:callMethod(SDK_FUN.SWITCH_ACCOUNT)
end

function SDKHelper:onSwitchAccountCallBack(errorCode, params)
	if errorCode == "switchAccountSuccess" then
		self:saveLoginInfo(params)

		local scene = self:getInjector():getInstance("BaseSceneMediator", "activeScene")
		local topViewName = scene:getTopViewName()

		if topViewName ~= "LoginView" then
			REBOOT("REBOOT_NOUPDATE")
		end
	end

	self:dispatch(Event:new(EVT_SWITCH_ACCOUNT, {
		errorCode = tostring(errorCode),
		message = params
	}))
end

function SDKHelper:getInheritanceCode(data)
	print("SDKHelper:getInheritanceCode")
	self:callMethod(SDK_FUN.GET_INHERITANCECODE)
end

function SDKHelper:checkGooglePromoPurchase(data)
	dump(data, "SDKHelper:checkGooglePromoPurchase(data)")
	self:callMethod(SDK_FUN.CHECK_PURCHASE, cjson.encode(data))
end

function SDKHelper:onCheckGooglePromoPurchaseCallBack(errorCode, params)
	dump(errorCode, "onCheckGooglePromoPurchaseCallBack(errorCode)")
end

function SDKHelper:consumeGooglePromoPurchase(data)
	dump(data, "SDKHelper:consumeGooglePromoPurchase(data)")
	self:callMethod(SDK_FUN.CONSUME_PURCHASE, cjson.encode(data))
end

function SDKHelper:onConsumeGooglePromoPurchaseCallBack(errorCode, params)
	dump(errorCode, "onConsumeGooglePromoPurchaseCallBack(errorCode)")
end

function SDKHelper:deleteAccount(data)
	print("SDKHelper:deleteAccount")
	self:callMethod(SDK_FUN.DELETE_ACCOUNT)
end

function SDKHelper:onDeleteAccountCallBack(errorCode, params)
	if errorCode == "deleteAccountSuccess" then
		self:dispatch(Event:new(EVT_DELETE_ACCOUNT, {
			errorCode = tostring(errorCode),
			message = params
		}))
	end
end

function SDKHelper:bindAccount(data)
	dump(data, "SDKHelper:bindAccount(data)")
	self:callMethod(SDK_FUN.BIND_ACCOUNT)
end

function SDKHelper:onBindAccountCallBack(errorCode, params)
	dump(errorCode, "onBindAccountCallBack(errorCode)")
	self:dispatch(Event:new(EVT_BIND_ACCOUNT, {
		errorCode = tostring(errorCode),
		message = params
	}))
end

function SDKHelper:checkBindState(data)
	print("SDKHelper:checkBindState")
	self:callMethod(SDK_FUN.CHECK_BIND_STATE)
end

function SDKHelper:onCheckBindStateCallBack(errorCode, params)
	dump(errorCode, "onCheckBindStateCallBack(errorCode)")
	self:dispatch(Event:new(EVT_BIND_ACCOUNT, {
		errorCode = tostring(errorCode),
		message = params
	}))
end

function SDKHelper:bindPhone(data)
	print("SDKHelper:bindPhone")
	self:callMethod(SDK_FUN.BIND_PHONE)
end

function SDKHelper:onBindPhoneCallBack(errorCode, params)
	dump(errorCode, "onBindPhoneCallBack(errorCode)")
	self:dispatch(Event:new(EVT_BIND_ACCOUNT, {
		errorCode = tostring(errorCode),
		message = params
	}))
end

function SDKHelper:customerService(data)
	dump(data, "SDKHelper:customerService(data)")
	self:callMethod(SDK_FUN.CUSTOMER_SERVICE, cjson.encode(data))
end

function SDKHelper:requestReviewInApp(data)
	dump(data, "SDKHelper:requestReviewInApp(data)")
	self:callMethod(SDK_FUN.REQUEST_REVIEW_IN_APP, cjson.encode(data))
end

function SDKHelper:logOut(data)
	dump(data, "SDKHelper:logOut(data)")
	self:callMethod(SDK_FUN.LOGOUT)
end

function SDKHelper:onLogOutCallBack(errorCode, params)
	self:dispatch(Event:new(EVT_LOG_OUT, {
		errorCode = tostring(errorCode),
		message = params
	}))

	if errorCode == "logoutSuccess" then
		REBOOT("REBOOT_NOUPDATE")
	end
end

function SDKHelper:payInit(productList)
	self:callMethod(SDK_FUN.PAY_INIT, cjson.encode(productList))
end

function SDKHelper:payIncomplete()
	self:callMethod(SDK_FUN.PAY_INCOMPLETE)
end

function SDKHelper:onPayCallBack(errorCode, params)
	self:dispatch(Event:new(EVT_PAY_OFF, {
		errorCode = tostring(errorCode),
		message = params
	}))
end

function SDKHelper:userCenterByPwrdView()
	self:callMethod(SDK_FUN.USER_CENTER)
end

function SDKHelper:openUrl(data)
	if not data then
		self:dispatch(ShowTipEvent({
			tip = "function Sdk:openUrl(data): data is nil"
		}))

		return
	end

	self:callMethod(SDK_FUN.OPEM_URL, cjson.encode(data))
end

function SDKHelper:systemShare(data)
	self:callMethod(SDK_FUN.SYSTEM_SHARE, cjson.encode(data))
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

function SDKHelper:reportByAD(data)
	self:callMethod(SDK_FUN.TRACK_EVENT_AD, cjson.encode(data))
end

function SDKHelper:reportStatsData(data)
	self:callMethod(SDK_FUN.TRACK_EVENT_NAME, cjson.encode(data))
end

function SDKHelper:reportInitiatedCheckout(data)
	self:report(REPORT_TYPE.INITIATEDCHECKOUT, data)
end

function SDKHelper:reportFinishPurchase(data)
	self:report(REPORT_TYPE.FINISHPURCHASE, data)
end

return SDKHelper
