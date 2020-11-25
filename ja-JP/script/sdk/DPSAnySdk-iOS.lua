local cjson = require("cjson.safe")

require("sdk.IDPSAnySdk")
require("sdk.DPSAnySdkUtils")

DPSAnySdk = class("DPSAnySdk", legs.Actor)

DPSAnySdk:implements(IDPSAnySdk)
DPSAnySdk:has("_gameContext", {
	is = "r"
})

function DPSAnySdk:initialize()
	super.initialize(self)

	if dpsAnySdk then
		dpsAnySdk.startup("")

		dpsAnySdk.listener = self
	end
end

function DPSAnySdk:setGameContext(gameContext)
	self._gameContext = gameContext
end

function DPSAnySdk:callMethod(methodName, ...)
	if dpsAnySdk then
		return dpsAnySdk.callMethod(methodName, ...)
	end
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

function DPSAnySdk:getVendor()
	if dpsAnySdk then
		return dpsAnySdk.getVendor()
	end

	return ""
end

function DPSAnySdk:getSdkSource(default)
	if dpsAnySdk then
		if dpsAnySdk.getSdkSource() == "" then
			return default or ""
		else
			return dpsAnySdk.getSdkSource()
		end
	end

	return default or ""
end

function DPSAnySdk:getChannelID()
	if dpsAnySdk then
		if dpsAnySdk.getSdkChannel() == "" then
			return default or ""
		else
			return dpsAnySdk.getSdkChannel()
		end
	end

	return default or ""
end

function DPSAnySdk:getStatisticsBaseInfo()
	return DPSAnySdkUtils.getStatisticsBaseInfo(self:getOpenId(), self:getSdkSource())
end

function DPSAnySdk:switchAccount(data)
	self:callMethod("switchAccount")
end

function DPSAnySdk:logOut(data)
	super.logOut(self, data)
	self:callMethod("logOut")
end

function DPSAnySdk:payOff(data)
	if not data then
		self:dispatch(ShowTipEvent({
			tip = "function Sdk:payOff(data): data is nil"
		}))

		return
	end

	self:callMethod("payOff", cjson.encode(data))
end

function DPSAnySdk:getVerifyData()
	if self:getSdkSource() == "any_sdk_ios" then
		self:callMethod("getPid")

		return dpsAnySdk.getUserValue("pid")
	end

	return ""
end

function DPSAnySdk:getGameId()
	return dpsAnySdk.getUserValue("gid")
end

function DPSAnySdk:getPlayerId()
	return dpsAnySdk.getUserValue("pid")
end

function DPSAnySdk:onPayInit(errorCode, message)
	local params = cjson.decode(message)

	self:onPayCallBack(errorCode, params)
end

function DPSAnySdk:onLogin(errorCode, message)
	local params = cjson.decode(message)

	self:onLoginCallBack(errorCode, params)
end

function DPSAnySdk:onLogOut(errorCode, message)
	local params = cjson.decode(message)

	self:onLogOutCallBack(errorCode, params)
end

function DPSAnySdk:onPayOff(errorCode, message)
	local params = cjson.decode(message)

	self:onPayCallBack(errorCode, params)
end

function DPSAnySdk:onSwitchAccount(errorCode, message)
	local params = cjson.decode(message)

	self:onSwitchAccountCallBack(errorCode, params)
end

function DPSAnySdk:onBindAccount(errorCode, message)
	local params = cjson.decode(message)

	self:onBindAccountCallBack(errorCode, params)
end

function DPSAnySdk:onDeleteAccount(errorCode, message)
	local params = cjson.decode(message)

	self:onDeleteAccountCallBack(errorCode, params)
end

function DPSAnySdk:report(reportType, data)
	if not data then
		self:dispatch(ShowTipEvent({
			tip = "SDKHelper:report(data): data is nil"
		}))

		return
	end

	local roleId = tostring(data.roleId)
	local roleName = tostring(data.roleName)
	local roleLevel = tostring(data.roleLevel)
	local serverId = tostring(data.serverId)
	local serverName = tostring(data.serverName)
	local vipLevel = tostring(data.vip)

	if REPORT_TYPE.LOGIN == reportType then
		self:callMethod("trackEventRoleLogin", roleId, roleName, roleLevel, serverId, serverName, vipLevel)
	elseif REPORT_TYPE.UPLEVEL == reportType then
		self:callMethod("trackEventRoleUpLevel", roleLevel)
	elseif REPORT_TYPE.CREATE == reportType then
		-- Nothing
	elseif REPORT_TYPE.INITIATEDCHECKOUT == reportType then
		self:callMethod("trackEventInitiatedCheckout", roleLevel)
	elseif REPORT_TYPE.FINISHPURCHASE == reportType then
		-- Nothing
	elseif REPORT_TYPE.LOGOUT == reportType then
		self:callMethod("trackEventRoleLogout", roleLevel)
	elseif REPORT_TYPE.LOGIN_ERROR == reportType then
		self:callMethod("trackEventRoleLoginError", roleId, serverId, vipLevel, roleLevel)
	end
end
