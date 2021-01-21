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

local PlatformHelper = {
	isIOS = function (self)
		return isPlatformIOS
	end,
	isAndroid = function (self)
		return isPlatformAndroid
	end,
	getChannelID = function (self)
		if self:isAndroid() then
			local success, channel = luaj.callStaticMethod(PlatformClassPath, "getChannelID", {}, "()Ljava/lang/String;")

			if not success then
				channel = "test"
			end

			return channel
		elseif self:isIOS() then
			return "wanmeiGlobal_ios"
		end

		return nil
	end,
	thirdUpdate = function (self)
		local channelID = self:getChannelID()
		local channel2url = {
			wanmeiGlobal_android = "https://play.google.com/store/apps/details?id=com.superprism.illusion",
			wanmeiGlobal_ios = "https://itunes.apple.com/app/id1514571062"
		}

		if channel2url[channelID] then
			cc.Application:getInstance():openURL(channel2url[channelID])

			return
		end

		if channelID == "dpstorm_android" then
			self:callSDKFunction("thirdUpdate", {})
		end
	end,
	callSDKFunction = function (self, cmd, params)
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
			-- Nothing
		elseif self:isAndroid() then
			luaj.callStaticMethod(PlatformClassPath, "commandFunction", args, "(Ljava/lang/String;Ljava/lang/String;)V")
		end
	end,
	isInstallApp = function (self, packageName)
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
	end,
	getSdkDid = function (self)
		if device.platform == "mac" or device.platform == "windows" then
			return ""
		end

		if gameDid and gameDid ~= "" then
			return gameDid
		end

		if self:isAndroid() then
			local success, did = luaj.callStaticMethod(PlatformClassPath, "getDeviceID", {}, "()Ljava/lang/String;")

			if not success then
				did = app.getDevice():getDeviceInfo().deviceId or ""
			end

			gameDid = did
		else
			gameDid = app.getDevice():getDeviceInfo().deviceId or ""
		end

		return gameDid
	end,
	reportByUpdate = function (self, event, url)
		self:callSDKFunction("wanmeiGameUpdateAssetEvent", {
			state = event,
			url = url
		})
	end
}

return PlatformHelper
