LoginService = class("LoginService", Service, _M)
local cjson = require("cjson.safe")
local opType = {
	iOSAccount = 110006,
	login = 110001,
	announceNew = 110010,
	patFaceNew = 10012
}

function LoginService:initialize()
	super.initialize(self)
end

function LoginService:dispose()
	super.dispose(self)
end

function LoginService:getAnnounceData(url, params, blockUI, callback)
	local opCode = opType.announceNew
	local params = cjson.encode(params)
	local data = "opCode=" .. opCode .. "&params=" .. params

	easyHttpRequest(url, data, nil, callback, blockUI)
end

function LoginService:getPatFaceData(params, blockUI, callback)
	local request = self:newRequest(opType.patFaceNew, params, callback)

	self:sendRequest(request, blockUI)
end

function LoginService:requestPlayerInfo(params, blockUI, callback)
	local request = self:newRequest(10001, params, callback)

	self:sendRequest(request, blockUI)
end

function LoginService:requestLogin(url, info, callback)
	local opCode = opType.login
	local params = cjson.encode(info)
	local data = "opCode=" .. opCode .. "&params=" .. params

	easyHttpRequest(url, data, nil, callback)
end

function LoginService:vmsRequest(url, version, callback)
	local channel = ""

	if SDKHelper then
		channel = SDKHelper:getVerifyData()
	end

	local deviceInfo = app.getDevice():getDeviceInfo()
	local data = "opCode=100101&params=" .. cjson.encode({
		channel = channel,
		version = version,
		did = PlatformHelper:getSdkDid(),
		pass = SDKUtils.getGamePass()
	})

	easyHttpRequest(url, data, nil, callback)
end

function LoginService:iOSAccount(url, callback)
	local opCode = opType.iOSAccount
	local params = cjson.encode(info)
	local data = "opCode=" .. opCode

	easyHttpRequest(url, data, nil, callback)
end

function LoginService:requestCancleUnBindAccount(url, info, callback)
	local cjson = require("cjson.safe")
	local opCode = 110009
	local params = cjson.encode(info)
	local data = "opCode=" .. opCode .. "&params=" .. params

	easyHttpRequest(url, data, nil, callback)
end

function LoginService:requestUnBindAccount(url, params, callback)
	local cjson = require("cjson.safe")
	local opCode = 110008
	local info = cjson.encode(params)
	local data = "opCode=" .. opCode .. "&params=" .. info

	easyHttpRequest(url, data, nil, callback)
end
