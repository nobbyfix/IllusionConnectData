ActivityTpurchase = class("ActivityTpurchase", BaseActivity, _M)

ActivityTpurchase:has("_packageShopConfig", {
	is = "r"
})

function ActivityTpurchase:initialize()
	super.initialize(self)
end

function ActivityTpurchase:dispose()
	super.dispose(self)
end

function ActivityTpurchase:synchronize(data)
	if not data then
		return
	end

	super.synchronize(self, data)
end

function ActivityTpurchase:reset()
	super.reset(self)
end

function ActivityTpurchase:getTimePurchaseId()
	local activityConfig = self:getActivityConfig()
	local purchaseId = activityConfig.TimePurchaseId

	return purchaseId
end

function ActivityTpurchase:hasRedPoint()
	return false
end

function ActivityTpurchase:isBuy()
	return self._isBuy
end

function ActivityTpurchase:getConfigStartEndTime()
	if self._timeinfo == nil then
		local tiemData = {}

		if self._config and self._config.TimeFactor then
			local timeStamp = self._config.TimeFactor
			local _, _, y, mon, d, h, m, s = string.find(timeStamp.start[1], "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
			local table = {
				year = y,
				month = mon,
				day = d,
				hour = h,
				min = m,
				sec = s
			}
			local startTime = TimeUtil:timeByRemoteDate(table)
			local _, _, y, mon, d, h, m, s = string.find(timeStamp["end"], "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
			local table = {
				year = y,
				month = mon,
				day = d,
				hour = h,
				min = m,
				sec = s
			}
			local endTime = TimeUtil:timeByRemoteDate(table)
			tiemData.startTime = startTime
			tiemData.endTime = endTime
			self._timeinfo = tiemData
		end
	end

	return self._timeinfo
end

function ActivityTpurchase:getShopPackageConfig()
	if not self._packageShopConfig then
		self._packageShopConfig = ShopPackage:new(self:getTimePurchaseId())
	end

	return self._packageShopConfig
end
