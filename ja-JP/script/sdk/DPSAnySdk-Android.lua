local cjson = require("cjson.safe")
local luaj = require("cocos.cocos2d.luaj")
local PlatformClassPath = "org/dpstrom/anysdk/DPSLuaHelper"
EVENT_TYPE = {
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
	BIND_FAILURE = 1022,
	SWITCH_ACCOUNT_FAILURE = 1004,
	BIND_SUCCESS = 1021,
	PAY_FAILURE = 1010,
	LOGOUT_FAILURE = 1007
}
DPSAnySdk = class("DPSAnySdk", legs.Actor)

function DPSAnySdk:initialize()
	super.initialize(self)

	local function cb(_data)
		local params = nil

		if _data and _data ~= "" then
			params = cjson.decode(_data)
		end

		self:onSDKCallBack(params)
	end

	self:regSDKCallback(cb)
end

function DPSAnySdk:onSDKCallBack(params)
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

function DPSAnySdk:regSDKCallback(cb)
	luaj.callStaticMethod(PlatformClassPath, "setLuaCallBack", {
		cb
	}, "(I)V")
end

function DPSAnySdk:callMethod(methodName, params)
	self:callSDKFunction(methodName, params or "")
end

function DPSAnySdk:callSDKFunction(cmd, params)
	if not cmd then
		return
	end

	local args = {
		cmd
	}

	if params and type(params) == "table" then
		if table.nums(params) > 0 then
			args[2] = cjson.encode(params)
		else
			args[2] = ""
		end
	elseif params and type(params) == "string" then
		args[2] = params
	end

	luaj.callStaticMethod(PlatformClassPath, "commandFunction", args, "(Ljava/lang/String;Ljava/lang/String;)V")
end

function DPSAnySdk:getSdkSource()
	local channel = ""
	local success = false
	success, channel = luaj.callStaticMethod(PlatformClassPath, "getSdkSource", {}, "()Ljava/lang/String;")

	if not success then
		channel = ""
	end

	return channel
end

function DPSAnySdk:getChannelID()
	if GameConfigs and GameConfigs.channel then
		return GameConfigs.channel
	end

	local success, channel = luaj.callStaticMethod(PlatformClassPath, "getChannelID", {}, "()Ljava/lang/String;")

	if not success then
		channel = "test"
	end

	return channel
end

function DPSAnySdk:getGameId()
	local gid = 0
	local success = 0
	local success = false
	local channelID = self:getChannelID()

	if channelID == "dpstorm_android" or channelID == "dpstorm_ios" then
		success, gid = luaj.callStaticMethod(PlatformClassPath, "getGameId", {}, "()I")
	end

	if not success then
		gid = 0
	end

	return gid
end

function DPSAnySdk:getPlayerId()
	local pid = 0
	local success = 0
	local success = false
	local channelID = self:getChannelID()

	if channelID == "dpstorm_android" or channelID == "dpstorm_ios" then
		success, pid = luaj.callStaticMethod(PlatformClassPath, "getPlayerId", {}, "()I")
	end

	if not success then
		pid = 0
	end

	return pid
end

function DPSAnySdk:setOpenId(openId)
	if dpsAnySdk then
		return dpsAnySdk.setOpenId(tostring(openId))
	end
end

function DPSAnySdk:getOpenId()
	if dpsAnySdk then
		return dpsAnySdk.getOpenId()
	end

	return ""
end

function DPSAnySdk:payOff(data)
	if not data then
		self:dispatch(ShowTipEvent({
			tip = "function SDKHelper:payOff(data): data is nil"
		}))

		return
	end

	self:callMethod("pay", data)
end

function DPSAnySdk:sdk_cb_login(params)
	local errorCode = "loginFailure"

	if EVENT_TYPE.LOGIN_SUCCESS == params.eventType then
		errorCode = "loginSuccess"
	end

	self:onLoginCallBack(errorCode, params.playerInfo)
end

function DPSAnySdk:sdk_cb_logout(params)
	local errorCode = "logoutFailure"

	if EVENT_TYPE.LOGOUT_SUCCESS == params.eventType then
		errorCode = "logoutSuccess"
	end

	self:onLogOutCallBack(errorCode, params)
end

function DPSAnySdk:sdk_cb_switchAccount(params)
	local errorCode = "switchAccountFailure"

	if EVENT_TYPE.SWITCH_ACCOUNT_SUCCESS == params.eventType then
		errorCode = "switchAccountSuccess"
	end

	self:onSwitchAccountCallBack(errorCode, params.playerInfo)
end

function DPSAnySdk:sdk_cb_payInit(params)
	local errorCode = "payInitSuccess"

	self:onPayCallBack(errorCode, params)
end

function DPSAnySdk:sdk_cb_pay(params)
	local errorCode = "payFailure"

	if EVENT_TYPE.PAY_SUCCESS == params.eventType then
		errorCode = "paySuccess"
	end

	self:onPayCallBack(errorCode, params)
end

function DPSAnySdk:sdk_cb_bindAccount(params)
	local errorCode = "bindFailure"

	if EVENT_TYPE.BIND_SUCCESS == params.eventType then
		errorCode = "bindSuccess"
	end

	self:onBindAccountCallBack(errorCode, params)
end

function DPSAnySdk:sdk_cb_deleteAccount(params)
	local errorCode = "deleteAccountFailure"

	if EVENT_TYPE.LOGIN_SUCCESS == params.eventType then
		errorCode = "deleteAccountSuccess"
	end

	self:onDeleteAccountCallBack(errorCode, params)
end

function DPSAnySdk:sdk_cb_payIncomplete(params)
	local errorCode = "payIncFailure"

	if EVENT_TYPE.PAY_INCOMPLETE_NO == params.eventType then
		errorCode = "payNoIncomplete"
	elseif EVENT_TYPE.PAY_INCOMPLETE_SUCCESS == params.eventType then
		errorCode = "payIncComplete"
	end

	self:onPayCallBack(errorCode, params)
end

function DPSAnySdk:report(reportType, data)
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

	self:callMethod("reportData", params)
end
