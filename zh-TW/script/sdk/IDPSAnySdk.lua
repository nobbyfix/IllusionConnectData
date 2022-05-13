IDPSAnySdk = interface("IDPSAnySdk")

function IDPSAnySdk:setGameContext(gameContext)
end

function IDPSAnySdk:setOpenId(openId)
end

function IDPSAnySdk:getOpenId()
end

function IDPSAnySdk:getVendor()
end

function IDPSAnySdk:getSdkSource()
end

function IDPSAnySdk:getGlobalData(openId)
end

function IDPSAnySdk:login(data)
end

function IDPSAnySdk:switchAccount(data)
end

function IDPSAnySdk:logOut(data)
end

function IDPSAnySdk:payOff(data)
end

function IDPSAnySdk:report(data)
end

function IDPSAnySdk:onLogin(errorCode, message)
end

function IDPSAnySdk:onLogOut(errorCode, message)
end

function IDPSAnySdk:onSwitchAccount(errorCode, message)
end

function IDPSAnySdk:onPayOff(errorCode, message)
end

function IDPSAnySdk:getVerifyData()
end
