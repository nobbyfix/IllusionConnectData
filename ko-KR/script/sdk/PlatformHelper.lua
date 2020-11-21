local PlatformHelper = {}
local cjson = require("cjson.safe")
local isPlatformIOS = false
local isPlatformAndroid = false
local luaoc, luaj = nil
local PlatformClassPath = ""
local application = cc.Application:getInstance()
local target = application:getTargetPlatform()
local gameDid = nil

if target == 4 or target == 5 then
	isPlatformIOS = true
	luaoc = require("cocos.cocos2d.luaoc")
	PlatformClassPath = "DPSLuaHelper"
elseif target == 3 then
	isPlatformAndroid = true
	luaj = require("cocos.cocos2d.luaj")
	PlatformClassPath = "org/dpstrom/anysdk/DPSLuaHelper"
end

function PlatformHelper:isIOS()
	return isPlatformIOS
end

function PlatformHelper:isAndroid()
	return isPlatformAndroid
end

function PlatformHelper:regSDKCallback(cb)
	if self:isIOS() then
		luaoc.callStaticMethod(PlatformClassPath, "setLuaCallBack", {
			luaCallBack = cb
		})
	elseif self:isAndroid() then
		luaj.callStaticMethod(PlatformClassPath, "setLuaCallBack", {
			cb
		}, "(I)V")
	end
end

function PlatformHelper:callSDKFunction(cmd, params)
	if not cmd then
		return
	end

	local args = {
		cmd
	}

	if params and table.nums(params) > 0 then
		args[2] = cjson.encode(params)
	else
		args[2] = ""
	end

	if self:isIOS() then
		luaoc.callStaticMethod(PlatformClassPath, "commandFunction", {
			cmd = args[1],
			json = args[2]
		})
	elseif self:isAndroid() then
		luaj.callStaticMethod(PlatformClassPath, "commandFunction", args, "(Ljava/lang/String;Ljava/lang/String;)V")
	end
end

function PlatformHelper:getChannelID()
	if GameConfigs and GameConfigs.channel then
		return GameConfigs.channel
	end

	local channel = ""
	local success = false

	if self:isIOS() then
		success, channel = luaoc.callStaticMethod(PlatformClassPath, "getChannelID")
	elseif self:isAndroid() then
		success, channel = luaj.callStaticMethod(PlatformClassPath, "getChannelID", {}, "()Ljava/lang/String;")
	end

	if not success then
		channel = "test"
	end

	return channel
end

function PlatformHelper:getSdkSource()
	local channel = ""
	local success = false

	if self:isIOS() then
		success, channel = luaoc.callStaticMethod(PlatformClassPath, "getSdkSource")
	elseif self:isAndroid() then
		success, channel = luaj.callStaticMethod(PlatformClassPath, "getSdkSource", {}, "()Ljava/lang/String;")
	end

	if not success then
		channel = ""
	end

	return channel
end

function PlatformHelper:thirdUpdate()
	local channelID = self:getChannelID()
	local channel2url = {
		changyouKR_ios = "https://itunes.apple.com/kr/app/id1512656046",
		changyouKR_android = "market://details?id=com.cyou.illusionc.gp",
		changyouKR_onestore_android = "onestore://common/product/0000751086"
	}

	if channel2url[channelID] then
		cc.Application:getInstance():openURL(channel2url[channelID])

		return
	end

	if channelID == "dpstorm_android" then
		self:callSDKFunction("thirdUpdate", {})
	end
end

function PlatformHelper:isInstallApp(packageName)
	local success = false
	local isInstall = false

	if self:isIOS() then
		isInstall = false
	elseif self:isAndroid() then
		success, isInstall = luaj.callStaticMethod(PlatformClassPath, "isInstallApp", {
			packageName
		}, "(Ljava/lang/String;)Z")
	end

	return isInstall
end

function PlatformHelper:getGameId()
	local gid = 0
	local success = 0
	local success = false
	local channelID = self:getChannelID()

	if channelID == "dpstorm_android" or channelID == "dpstorm_ios" then
		if self:isIOS() then
			success, gid = luaoc.callStaticMethod(PlatformClassPath, "getGameId")
		elseif self:isAndroid() then
			success, gid = luaj.callStaticMethod(PlatformClassPath, "getGameId", {}, "()I")
		end
	end

	if not success then
		gid = 0
	end

	return gid
end

function PlatformHelper:getPlayerId()
	local pid = 0
	local success = 0
	local success = false
	local channelID = self:getChannelID()

	if channelID == "dpstorm_android" or channelID == "dpstorm_ios" then
		if self:isIOS() then
			success, pid = luaoc.callStaticMethod(PlatformClassPath, "getPlayerId")
		elseif self:isAndroid() then
			success, pid = luaj.callStaticMethod(PlatformClassPath, "getPlayerId", {}, "()I")
		end
	end

	if not success then
		pid = 0
	end

	return pid
end

function PlatformHelper:getSdkDid()
	if device.platform == "mac" then
		return ""
	end

	if gameDid and gameDid ~= "" then
		return gameDid
	end

	if self:isAndroid() and app.pkgConfig.packJobId and app.pkgConfig.packJobId > 3904 then
		local success, did = luaj.callStaticMethod(PlatformClassPath, "getDeviceID", {}, "()Ljava/lang/String;")

		if not success then
			did = app.getDevice():getDeviceInfo().deviceId or ""
		end

		gameDid = did
	else
		gameDid = app.getDevice():getDeviceInfo().deviceId or ""
	end

	return gameDid
end

function PlatformHelper:postCYData(params)
	self:callSDKFunction("postEvent", params)
end

return PlatformHelper
