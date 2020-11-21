require("sdk.IDPSAnySdk")
require("sdk.DPSAnySdkUtils")

DPSAnySdk = class("DPSAnySdk", legs.Actor)

function DPSAnySdk:initialize()
	super.initialize(self)
end

function DPSAnySdk:setGameContext(gameContext)
	self._gameContext = gameContext
end

function DPSAnySdk:callMethod(methodName, ...)
end

function DPSAnySdk:setOpenId(openId)
	return ""
end

function DPSAnySdk:getOpenId()
	return ""
end

function DPSAnySdk:getVendor()
	return ""
end

function DPSAnySdk:getSdkSource(default)
	return default or ""
end

function DPSAnySdk:getChannelID()
	return ""
end

function DPSAnySdk:getStatisticsBaseInfo()
	return ""
end

function DPSAnySdk:switchAccount(data)
end

function DPSAnySdk:logOut(data)
end

function DPSAnySdk:payOff(data)
end

function DPSAnySdk:getVerifyData()
	return ""
end

function DPSAnySdk:getGlobalData(openId)
	return ""
end

function DPSAnySdk:getGameId()
	return ""
end

function DPSAnySdk:getPlayerId()
	return ""
end

function DPSAnySdk:setLanguage(language)
end

function DPSAnySdk:requestReviewInApp(data)
end
