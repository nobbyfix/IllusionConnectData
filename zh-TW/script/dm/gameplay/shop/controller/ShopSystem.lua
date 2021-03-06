EVT_SHOP_REFRESH_SUCC = "EVT_SHOP_REFRESH_SUCC"
EVT_SHOP_BUY_REFRESH_SUCC = "EVT_SHOP_BUY_REFRESH_SUCC"
EVT_BUY_PACKAGE_SUCC = "EVT_BUY_PACKAGE_SUCC"
EVT_REFRESH_PACKAGE_SUCC = "EVT_REFRESH_PACKAGE_SUCC"
EVT_SELL_DEBRIS_SUCC = "EVT_SELL_DEBRIS_SUCC"

require("dm.gameplay.monthSignIn.controller.ResetUtils")
require("dm.gameplay.shop.model.Shop")
require("dm.gameplay.shop.model.ShopPackage")
require("dm.gameplay.shop.model.ShopReset")
require("dm.gameplay.shop.model.ShopSurface")

ShopSystem = class("ShopSystem", legs.Actor)

ShopSystem:has("_shop", {
	is = "rw"
})
ShopSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ShopSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
ShopSystem:has("_packageList", {
	is = "rw"
})
ShopSystem:has("_customDataSystem", {
	is = "r"
}):injectWith("CustomDataSystem")
ShopSystem:has("_packageResetList", {
	is = "rw"
})
ShopSystem:has("_rechargeAndVipModel", {
	is = "r"
}):injectWith("RechargeAndVipModel")
ShopSystem:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
ShopSystem:has("_rechargeAndVipSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")
ShopSystem:has("_surfaceSystem", {
	is = "r"
}):injectWith("SurfaceSystem")
ShopSystem:has("_shopService", {
	is = "r"
}):injectWith("ShopService")
ShopSystem:has("_playInstance", {
	is = "rw"
})

KMonthCardType = {
	KMonthCardForever = "monthCardF",
	KMonthCardSubscribe = "MonthCard_SubScribe",
	KMonthCard = "MonthCard_1"
}
kShopResetType = {
	KResetWeek = "Week",
	KResetMonth = "Month",
	KResetDay = "Day",
	KResetUnlimit = "unlimit"
}
ShopSpecialId = {
	kShopMall = "Shop_Mall",
	kShopSurfacePackage = "Shop_SurfacePackage",
	kShopReset = "Shop_Reset",
	KLuckyBag = "LuckyBag",
	kShopNormal = "Shop_Normal",
	kShopSurface = "Shop_Surface",
	kShopTimeLimit = "Shop_TimeLimit",
	kShopMonthcard = "Shop_Monthcard",
	kShopPackage = "Shop_Package",
	kShopRecommend = "Shop_Recommend"
}
ShopDirectPackageType = {
	ShopSpecialId.kShopPackage,
	ShopSpecialId.kShopSurfacePackage,
	ShopSpecialId.kShopTimeLimit
}
kShopResetTypeSort = {
	kShopResetType.KResetDay,
	kShopResetType.KResetWeek,
	kShopResetType.KResetMonth
}
ShopUnlockId = {
	kShopMall = "Charge_System",
	kShopMonthcard = "Shop_Monthcard",
	kShopSurface = "Unlock_Shop_Surface",
	kShopReset = "Shop_Reset",
	kShop = "Shop_Unlock",
	kShopNormal = "Shop_Unlock",
	kShopSurfacePackage = "Shop_SurfacePackage",
	kShopTimeLimit = "Shop_TimeLimit",
	kShopPackage = "Package_Shop",
	kShopRecommend = "Shop_Recommend"
}
ShopUnlockTip = {
	kShopMall = "Unlock_Charge_System_Tips",
	kShopMonthcard = "Unlock_Charge_System_Tips",
	kShopSurface = "Unlock_Charge_System_Tips",
	kShopReset = "Unlock_Charge_System_Tips",
	kShop = "Unlock_Charge_System_Tips",
	kShopNormal = "Unlock_Charge_System_Tips",
	kShopSurfacePackage = "Unlock_Charge_System_Tips",
	kShopTimeLimit = "Unlock_Charge_System_Tips",
	kShopPackage = "Unlock_Charge_System_Tips",
	kShopRecommend = "Unlock_Charge_System_Tips"
}
KShopBuyType = {
	KFree = 1,
	KMoney = 0,
	KCoin = 2
}

function ShopSystem:initialize()
	super.initialize(self)

	self._shop = Shop:new()
	self._packageList = {}
	self._packageResetList = {}
	self._surfaceList = {}
	self._playInstance = false
end

function ShopSystem:userInject()
	self._bagSystem = self._developSystem:getBagSystem()
	self._heroSystem = self._developSystem:getHeroSystem()
end

function ShopSystem:checkEnabled(data)
	local canShow = true
	local unlock = true
	local tips = ""
	unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShop)
	canShow = self._systemKeeper:canShow(ShopUnlockId.kShop)

	if not canShow then
		return canShow, unlock, Strings:get(ShopUnlockTip.kShop)
	end

	if not unlock then
		return canShow, unlock, tips
	end

	if data and data.shopId then
		if data.shopId == ShopSpecialId.kShopNormal then
			-- Nothing
		elseif data.shopId == ShopSpecialId.kShopMall then
			unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopMall)
			canShow = self._systemKeeper:canShow(ShopUnlockId.kShopMall)

			if not canShow then
				return canShow, unlock, Strings:get(ShopUnlockTip.kShopMall)
			end

			if not unlock then
				return canShow, unlock, tips
			end
		elseif data.shopId == ShopSpecialId.kShopPackage then
			unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopPackage)
			canShow = self._systemKeeper:canShow(ShopUnlockId.kShopPackage)

			if not canShow then
				return canShow, unlock, Strings:get(ShopUnlockTip.kShopPackage)
			end

			if not unlock then
				return canShow, unlock, tips
			end
		elseif data.shopId == ShopSpecialId.kShopSurface then
			unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopSurface)
			canShow = self._systemKeeper:canShow(ShopUnlockId.kShopSurface)

			if not canShow then
				return canShow, unlock, Strings:get(ShopUnlockTip.kShopSurface)
			end

			if not unlock then
				return canShow, unlock, tips
			end
		elseif data.shopId == ShopSpecialId.kShopMonthcard then
			unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopMonthcard)
			canShow = self._systemKeeper:canShow(ShopUnlockId.kShopMonthcard)

			if not canShow then
				return canShow, unlock, Strings:get(ShopUnlockTip.kShopMonthcard)
			end

			if not unlock then
				return canShow, unlock, tips
			end
		elseif data.shopId == ShopSpecialId.kShopSurfacePackage then
			unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopSurfacePackage)
			canShow = self._systemKeeper:canShow(ShopUnlockId.kShopSurfacePackage)

			if not canShow then
				return canShow, unlock, Strings:get(ShopUnlockTip.kShopSurfacePackage)
			end

			if not unlock then
				return canShow, unlock, tips
			end
		elseif data.shopId == ShopSpecialId.kShopTimeLimit then
			unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopTimeLimit)
			canShow = self._systemKeeper:canShow(ShopUnlockId.kShopTimeLimit)

			if not canShow then
				return canShow, unlock, Strings:get(ShopUnlockTip.kShopTimeLimit)
			end

			if not unlock then
				return canShow, unlock, tips
			end
		else
			local shopId = data.shopId
			local config = ConfigReader:getRecordById("Shop", shopId)

			if config then
				unlock, tips = self._systemKeeper:isUnlock(config.UnlockSystem)
				canShow = self._systemKeeper:canShow(config.UnlockSystem)

				if not canShow then
					return canShow, unlock, Strings:get(ShopUnlockTip.kShopNormal)
				end

				if not unlock then
					return canShow, unlock, tips
				end
			end
		end
	end

	return canShow, unlock, tips
end

function ShopSystem:tryEnter(data)
	local canShow, unlock, tips = self:checkEnabled(data)

	if not canShow then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = tips
		}))

		return
	end

	if not unlock then
		self:dispatch(ShowTipEvent({
			tip = tips
		}))
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)

		return
	end

	self:checkMainShopIdForSubNormalShopId(data)
	self:enterShop(data)
end

function ShopSystem:checkMainShopIdForSubNormalShopId(data)
	local config = ConfigReader:getRecordById("Shop", data.shopId)

	if config then
		self._fresh = true
		local idx = self:getShopGroupIdx(data.shopId)

		if idx then
			data.rightTabIndex = idx
			data.shopId = ShopSpecialId.kShopNormal
		end
	end
end

function ShopSystem:getShopGroupIdx(shopId)
	local shopTabIds = ConfigReader:getRecordById("ConfigValue", "Shop_ShowSequence").content
	local list = {}

	for i = 1, #shopTabIds do
		local shopId = shopTabIds[i]
		local shopGroup = self:getShopGroupById(shopId)

		if shopGroup then
			local config = ConfigReader:getRecordById("Shop", shopId)
			local unlock, tips = self._systemKeeper:isUnlock(config.UnlockSystem)
			local canShow = self._systemKeeper:canShow(config.UnlockSystem)

			if canShow and unlock then
				list[#list + 1] = shopId
			end
		end
	end

	if #list > 0 then
		return table.indexof(list, shopId) or 1
	end

	return nil
end

function ShopSystem:enterShop(data)
	local entryData = data or {}

	if not data or not data.shopId then
		entryData.shopId = ShopSpecialId.kShopRecommend
	end

	local function callback()
		local view = self:getInjector():getInstance("ShopView")

		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, entryData))
	end

	if entryData.shopId == ShopSpecialId.kShopSurface then
		self:requestGetSurfaceShop(callback)
	elseif entryData.shopId == ShopSpecialId.kShopPackage or entryData.shopId == ShopSpecialId.kShopSurfacePackage or entryData.shopId == ShopSpecialId.kShopTimeLimit then
		self:requestGetPackageShop(callback)
	else
		callback()
	end
end

function ShopSystem:tryEnterByRecruit()
	local canShow = true
	local unlock = true
	local tips = ""
	unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShop)
	canShow = self._systemKeeper:canShow(ShopUnlockId.kShop)

	if not canShow then
		self:dispatch(ShowTipEvent({
			tip = Strings:get(ShopUnlockTip.kShop)
		}))

		return
	end

	if not unlock then
		self:dispatch(ShowTipEvent({
			tip = tips
		}))

		return
	end

	local data = {
		shopId = ShopSpecialId.kShopNormal
	}

	self:enterShop(data)
end

function ShopSystem:tryEnterDebris()
	local data = {
		shopId = ShopSpecialId.kShopNormal
	}

	self:enterShop(data)
end

function ShopSystem:getLeftShowTabs()
	local leftTabArr = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "Shop_Sort", "content")
	local showArr = {}
	local showMap = {}

	for i = 1, #leftTabArr do
		local shopId = leftTabArr[i]
		local config = ConfigReader:getRecordById("Shop", shopId)

		if config then
			local unlock, tips = self._systemKeeper:isUnlock(config.UnlockSystem)
			local canShow = self._systemKeeper:canShow(config.UnlockSystem)

			if canShow and unlock then
				local index = #showArr + 1
				showArr[index] = {
					shopId = shopId,
					name = {
						Strings:get(config.Name),
						""
					},
					unlockKey = config.UnlockSystem
				}
				showMap[shopId] = {
					index = index,
					unlockKey = config.UnlockSystem
				}
			end
		elseif shopId == ShopSpecialId.kShopNormal then
			local unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopNormal)
			local canShow = self._systemKeeper:canShow(ShopUnlockId.kShopNormal)

			if unlock and canShow then
				local index = #showArr + 1
				showArr[index] = {
					unlockKey = "Shop_Mystery",
					shopId = shopId,
					name = {
						Strings:get("shop_UI22"),
						""
					}
				}
				showMap[shopId] = {
					unlockKey = "Shop_Mystery",
					index = index
				}
			end
		elseif shopId == ShopSpecialId.kShopMall then
			local unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopMall)
			local canShow = self._systemKeeper:canShow(ShopUnlockId.kShopMall)

			if canShow and unlock then
				local index = #showArr + 1
				showArr[index] = {
					shopId = shopId,
					name = {
						Strings:get("shop_UI23"),
						""
					},
					unlockKey = ShopUnlockId.kShopMall
				}
				showMap[shopId] = {
					index = index,
					unlockKey = ShopUnlockId.kShopMall
				}
			end
		elseif shopId == ShopSpecialId.kShopPackage then
			local list = self:getPackageList(shopId)
			local unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopPackage)
			local canShow = self._systemKeeper:canShow(ShopUnlockId.kShopPackage)

			if #list > 0 and canShow and unlock then
				local index = #showArr + 1
				showArr[index] = {
					shopId = shopId,
					name = {
						Strings:get("shop_UI28"),
						""
					},
					unlockKey = ShopUnlockId.kShopPackage
				}
				showMap[shopId] = {
					index = index,
					unlockKey = ShopUnlockId.kShopPackage
				}
			end
		elseif shopId == ShopSpecialId.kShopRecommend then
			local unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopRecommend)
			local canShow = self._systemKeeper:canShow(ShopUnlockId.kShopRecommend)

			if canShow and unlock then
				local index = #showArr + 1
				showArr[index] = {
					shopId = shopId,
					name = {
						Strings:get("shop_UI40"),
						""
					},
					unlockKey = ShopUnlockId.kShopRecommend
				}
				showMap[shopId] = {
					index = index,
					unlockKey = ShopUnlockId.kShopRecommend
				}
			end
		elseif shopId == ShopSpecialId.kShopReset then
			local unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopReset)
			local canShow = self._systemKeeper:canShow(ShopUnlockId.kShopReset)

			if canShow and unlock then
				local index = #showArr + 1
				showArr[index] = {
					shopId = shopId,
					name = {
						Strings:get("shop_UI41"),
						""
					},
					unlockKey = ShopUnlockId.kShopReset
				}
				showMap[shopId] = {
					index = index,
					unlockKey = ShopUnlockId.kShopReset
				}
			end
		elseif shopId == ShopSpecialId.kShopSurface then
			local unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopSurface)
			local canShow = self._systemKeeper:canShow(ShopUnlockId.kShopSurface)

			if canShow and unlock then
				local index = #showArr + 1
				showArr[index] = {
					shopId = shopId,
					name = {
						Strings:get("shop_UI42"),
						""
					},
					unlockKey = ShopUnlockId.kShopSurface
				}
				showMap[shopId] = {
					index = index,
					unlockKey = ShopUnlockId.kShopSurface
				}
			end
		elseif shopId == ShopSpecialId.kShopMonthcard then
			local unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopMonthcard)
			local canShow = self._systemKeeper:canShow(ShopUnlockId.kShopMonthcard)

			if canShow and unlock then
				local index = #showArr + 1
				showArr[index] = {
					shopId = shopId,
					name = {
						Strings:get("shop_UI52"),
						""
					},
					unlockKey = ShopUnlockId.kShopMonthcard
				}
				showMap[shopId] = {
					index = index,
					unlockKey = ShopUnlockId.kShopMonthcard
				}
			end
		elseif shopId == ShopSpecialId.kShopSurfacePackage then
			local list = self:getPackageList(shopId)
			local unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopSurfacePackage)
			local canShow = self._systemKeeper:canShow(ShopUnlockId.kShopSurfacePackage)

			if #list > 0 and canShow and unlock then
				local index = #showArr + 1
				showArr[index] = {
					shopId = shopId,
					name = {
						Strings:get("Shop_SurfacePackage_Name"),
						""
					},
					unlockKey = ShopUnlockId.kShopSurfacePackage
				}
				showMap[shopId] = {
					index = index,
					unlockKey = ShopUnlockId.kShopSurfacePackage
				}
			end
		elseif shopId == ShopSpecialId.kShopTimeLimit then
			local list = self:getPackageList(shopId)
			local unlock, tips = self._systemKeeper:isUnlock(ShopUnlockId.kShopTimeLimit)
			local canShow = self._systemKeeper:canShow(ShopUnlockId.kShopTimeLimit)

			if #list > 0 and canShow and unlock then
				local index = #showArr + 1
				showArr[index] = {
					shopId = shopId,
					name = {
						Strings:get("Shop_TimeLimit_Name"),
						""
					},
					unlockKey = ShopUnlockId.kShopTimeLimit
				}
				showMap[shopId] = {
					index = index,
					unlockKey = ShopUnlockId.kShopTimeLimit
				}
			end
		end
	end

	return showArr, showMap
end

function ShopSystem:isShowShopSellView()
	local entrys = self:getCanSellBagEntrys()

	return #entrys ~= 0
end

function ShopSystem:doReset(resetId, value, data)
	value = value or 0

	if resetId == ResetId.kShopReset and data then
		self._shop:initSync(data)
		self:dispatch(Event:new(EVT_REFRESHSHOPBYRSET_SUCC, {}))
	end
end

function ShopSystem:formatTime(time)
	local text = ""
	local day = 86400
	local d = math.floor(time / day)
	local h = math.floor((time - d * day) / 3600)
	local m = math.floor((time - d * day - h * 3600) / 60)
	local s = time - d * day - h * 3600 - m * 60

	if d >= 1 then
		text = tostring(d) .. Strings:get("SHOP_REFRESH_TIME_TEXT")
	end

	text = text .. string.format(" %02d:%02d:%02d", h, m, s)

	return text
end

function ShopSystem:syncDiffShop(data)
	if data.player and data.player.shops then
		if data.player.shops then
			self._shop:sync(data.player.shops)
		end

		if data.player.packShopItems then
			self:syncPackage(data.player.packShopItems)
		end
	end

	if data.shop then
		self._shop:syncSpecialShop(data.shop)
	end
end

function ShopSystem:initSync(data)
	self._shop:initSync(data)
end

function ShopSystem:sync(data)
	self._shop:sync(data)
	self:dispatch(Event:new(EVT_SHOP_SYNCHRONIZED))
end

function ShopSystem:syncSurface(data)
	self._surfaceList = {}

	for i, id in pairs(data) do
		self._surfaceList[id] = ShopSurface:new(id)

		self._surfaceList[id]:setStock(1)
		self._surfaceList[id]:setIndex(i)
	end
end

function ShopSystem:getSurfaceList()
	local list = {}
	local keyList = ConfigReader:getKeysOfTable("ShopSurface")

	for i = 1, #keyList do
		local key = keyList[i]
		local surfaceId = ConfigReader:getDataByNameIdAndKey("ShopSurface", key, "Surface")
		local hide = ConfigReader:getDataByNameIdAndKey("ShopSurface", key, "Hide")

		if hide == 1 then
			local canBuySurface = self._surfaceList[key]
			local hasSurface = self._surfaceSystem:getSurfaceById(surfaceId)

			if hasSurface and hasSurface:getUnlock() then
				local surfaceItem = ShopSurface:new(key)

				table.insert(list, surfaceItem)
			elseif canBuySurface then
				table.insert(list, canBuySurface)
			end
		end
	end

	table.sort(list, function (a, b)
		if a:getStock() == b:getStock() then
			return a:getSort() < b:getSort()
		end

		return a:getStock() == 1
	end)

	return list
end

function ShopSystem:getShopSurfaceById(surfaceId)
	for i, v in pairs(self._surfaceList) do
		if v:getSurfaceId() == surfaceId then
			return v
		end
	end

	return nil
end

function ShopSystem:syncPackage(data)
	for id, value in pairs(data) do
		if self._packageList[id] then
			self._packageList[id]:sync(value)
		elseif self:checkIsResetPackage(id) then
			self._packageList[id] = ShopReset:new(id)

			self._packageList[id]:sync(value)
		elseif self:checkIsNormalPackage(id) then
			self._packageList[id] = ShopPackage:new(id)

			self._packageList[id]:sync(value)
		end
	end
end

function ShopSystem:checkPackageExist(id)
	return self._packageList[id] ~= nil and true or false
end

function ShopSystem:checkIsResetPackage(id)
	return ConfigReader:getRecordById("ShopReset", id)
end

function ShopSystem:checkIsNormalPackage(id)
	return ConfigReader:getRecordById("PackageShop", id)
end

function ShopSystem:getFreePackage(packageType)
	local freePackage = {}
	local list = self:getPackageList(packageType)

	for id, package in pairs(list) do
		if package:getIsFree() == KShopBuyType.KFree and package:getLeftCount() > 0 then
			freePackage[#freePackage + 1] = package
		end
	end

	return freePackage
end

function ShopSystem:getPackageById(packageId)
	return self._packageList[packageId]
end

function ShopSystem:getPackageList(packageType)
	local packageType = packageType and packageType or nil
	local buyPackItems = self._developSystem:getPlayer():getBuyPackItems()
	local list = {}
	local osPlatform = "ios"

	for id, package in pairs(self._packageList) do
		local add = true
		local condition = package:getClientCondition()

		if condition and condition.LEVEL and self._developSystem:getLevel() < condition.LEVEL then
			add = false
		end

		local function choose()
			if not package:getIsHide() and package:getCanBuy() and add and package:getPlatform() == osPlatform then
				local prepose = package:getPrepose()

				if #prepose > 0 then
					local canShow = true

					for i = 1, #prepose do
						local packageId = prepose[i]

						if not table.indexof(buyPackItems, packageId) then
							canShow = false

							break
						end
					end

					if canShow then
						list[#list + 1] = package
					end
				else
					list[#list + 1] = package
				end
			end
		end

		if packageType == nil then
			choose()
		elseif package:getShopSort() == packageType then
			choose()
		end
	end

	table.sort(list, function (a, b)
		local times1 = a:getLeftCount()
		local times2 = b:getLeftCount()

		if times1 == 0 or times2 == 0 then
			return times2 < times1
		else
			return a:getSort() < b:getSort()
		end
	end)

	return list
end

function ShopSystem:getResetShopEndMills(id)
	local serverTimeMap = DmGame:getInstance()._injector:getInstance("GameServerAgent"):remoteTimestamp()
	local tb = os.date("*t", serverTimeMap)
	local shopReset_RefreshTime = ConfigReader:getDataByNameIdAndKey("Reset", "ShopReset_RefreshTime", "ResetSystem")
	local resetTime = shopReset_RefreshTime.resetTime[1]
	local _, _, h, m, s = string.find(resetTime, "(%d+):(%d+):(%d+)")
	local table = {
		hour = h,
		min = m,
		sec = s
	}
	local dayMil = TimeUtil:getTimeByDateForTargetTime(table)
	local resetHour = tb.hour < tonumber(h) and dayMil or dayMil + 86400

	if id == kShopResetType.KResetDay then
		return resetHour
	elseif id == kShopResetType.KResetWeek then
		local w = tb.wday == 1 and 7 or tb.wday - 1

		if w == 1 and tb.hour < tonumber(h) then
			return resetHour
		end

		local s = (7 - w) * 24 * 60 * 60
		local s1 = 86400 - (tb.hour * 60 * 60 + tb.min * 60 + tb.sec)
		local s2 = tonumber(h) * 60 * 60
		local sum = s + s1 + s2
		local sectime = serverTimeMap + sum

		return sectime
	elseif id == kShopResetType.KResetMonth then
		if tb.day == 1 and tb.hour < tonumber(h) then
			tb.month = tb.month
		else
			tb.month = tb.month + 1
		end

		tb.day = 1
		tb.hour = h
		tb.min = m
		tb.sec = s

		return TimeUtil:getTimeByDateForTargetTime(tb)
	end

	return 0
end

function ShopSystem:checkTimeTagShow(package)
	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local curMills = gameServerAgent:remoteTimeMillis()
	local curTime = gameServerAgent:remoteTimestamp()
	local start = package:getStartMills()
	local end_ = package:getEndMills()
	local times1 = package:getLeftCount()
	local times2 = package:getStorage()

	if curTime < start or end_ < curTime then
		return false
	end

	if not package:getCDTime() and times1 == 0 then
		return false
	end

	return true
end

function ShopSystem:syncDeleteData(data)
	if data.player and data.player.shops then
		for groupId, data in pairs(data.player.shops) do
			if data.positions then
				self:getShopGroupById(groupId):delGoods(data.positions)
			end
		end
	end

	if data.player and data.player.surfaceShop then
		for index, i in pairs(data.player.surfaceShop) do
			for id, v in pairs(self._surfaceList) do
				if v:getIndex() == index then
					self._surfaceList[id] = nil
				end
			end
		end
	end

	if data.player and data.player.packShopItems then
		for delId, i in pairs(data.player.packShopItems) do
			for id, v in pairs(self._packageList) do
				if delId == id then
					self._packageList[id] = nil
				end
			end
		end
	end
end

function ShopSystem:getShopGroupById(groupId)
	return self._shop:getShopGroupById(groupId)
end

function ShopSystem:getShopGoodById(groupId, goodId)
	return self:getShopGroupById(groupId):getShopGoodById(goodId)
end

function ShopSystem:getShopGoodByIndex(groupId, index)
	return self:getShopGroupById(groupId):getShopGoodByIndex(index)
end

function ShopSystem:getNextRefreshTime(shopId)
	local shopGroup = self._shop:getShopGroupById(shopId)
	local resetSystem = shopGroup:getShopConfig().ResetSystem
	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local curTime = gameServerAgent:remoteTimestamp()

	if resetSystem.resetMode == "CD" or resetSystem.resetMode == "NONE" then
		return nil
	else
		return ResetUtils:getNextRefreshTime(curTime, resetSystem)
	end
end

function ShopSystem:hasResetTime(shopId)
	local shopGroup = self._shop:getShopGroupById(shopId)
	local resetSystem = shopGroup:getShopConfig().ResetSystem
	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local curTime = gameServerAgent:remoteTimestamp()

	if resetSystem.resetMode == "CD" or resetSystem.resetMode == "NONE" then
		return nil
	end

	return true
end

function ShopSystem:getCurSystemTime()
	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")

	return gameServerAgent:remoteTimestamp()
end

function ShopSystem:getCanSellBagEntrys()
	local function filterFunc(entry)
		if entry and entry.item then
			if entry.item:getType() == ItemPages.kConsumable and entry.item:getSubType() == ComsumableKind.kGoldSell and entry.item:getSellNumber() ~= -1 then
				return true
			end

			return false
		end
	end

	local bagItems = self._bagSystem:getAllEntryIds(filterFunc)

	return bagItems
end

function ShopSystem:getCanExchangeBagEntries()
	local bagItems = {}
	local heroes = self._heroSystem:getOwnHeroIds()

	for i = 1, #heroes do
		local heroId = heroes[i].id
		local hero = self._heroSystem:getHeroById(heroId)

		if hero and hero:isMaxStar() then
			local fragId = heroes[i].fragId
			local item = self._bagSystem:getEntryById(fragId)

			if item then
				table.insert(bagItems, item)
			end
		end
	end

	return bagItems
end

function ShopSystem:getRefreshRemainTime(shopId)
	local shopGroup = self:getShopGroupById(shopId)

	if shopGroup then
		return shopGroup:getRefreshRemainTime()
	end

	return nil
end

function ShopSystem:isShopFragmentOpen()
	return false

	local unlockKey = ConfigReader:getDataByNameIdAndKey("Shop", "Shop_Fragment", "UnlockSystem")
	local unlock, tip = self._systemKeeper:isUnlock(unlockKey)

	if not unlock then
		return false
	end

	local customKey = CustomDataKey.kShopFragment
	local customData = self._customDataSystem:getValue(PrefixType.kGlobal, customKey)

	if customData then
		return true
	end

	local entries = self:getCanExchangeBagEntries()

	if #entries > 0 then
		self._customDataSystem:setValue(PrefixType.kGlobal, customKey, "1")

		return true
	end

	return false
end

function ShopSystem:requestGetShops(callBack)
	self._shopService:requestGetShops(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._shop:initSync(response.data)

			if callBack then
				callBack()
			end
		end
	end)
end

function ShopSystem:requestGetShop(shopId, callBack)
	local params = {
		shopId = tostring(shopId)
	}

	self._shopService:requestGetShop(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			local shopGroup = self:getShopGroupById(shopId)

			shopGroup:sync(response.data)

			if callBack then
				callBack()
			end

			self:dispatch(Event:new(EVT_SHOP_REFRESH_SUCC, {
				shopId = shopId
			}))
		end
	end)
end

function ShopSystem:requestBuy(params, callback)
	self._shopService:requestBuy(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_SHOP_BUY_REFRESH_SUCC, {
				shopId = params.shopId,
				positionId = params.positionId,
				data = response.data
			}))
		end
	end)
end

function ShopSystem:requestRefresh(shopId)
	local params = {
		shopId = tostring(shopId)
	}

	self._shopService:requestRefresh(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_SHOP_REFRESH_SUCC, {
				shopId = shopId
			}))
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Shop_Text15")
			}))
		end
	end)
end

function ShopSystem:requestAutoSell(callback)
	self._shopService:requestAutoSell({
		key = "value"
	}, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback()
			end

			self:dispatch(ShowTipEvent({
				tip = Strings:get("SHOP_SELL_SUCCESS")
			}))
		end
	end)
end

function ShopSystem:requestDebrisSell(params, callback)
	self._shopService:requestDebrisSell(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_SELL_DEBRIS_SUCC, {
				rewards = response.data
			}))
		end
	end)
end

local perTime = 0

function ShopSystem:requestBuyPackageShop(packageId, callback, isFree)
	if isFree ~= KShopBuyType.KFree and isFree ~= KShopBuyType.KCoin then
		self:dispatch(ShowTipEvent({
			tip = "儲值服務已關閉"
		}))

		return
	end

	local curTime = self._gameServerAgent:remoteTimestamp()

	if curTime - perTime < 0.5 then
		return
	end

	perTime = curTime
	local param = {
		itemId = packageId
	}

	self._shopService:requestBuyPackageShop(param, function (response)
		if response.resCode == GS_SUCCESS then
			if isFree == KShopBuyType.KFree or isFree == KShopBuyType.KCoin then
				if callback then
					callback()
				end

				self:dispatch(Event:new(EVT_BUY_PACKAGE_SUCC, {
					rewards = response.data.rewards
				}))

				if response.data.rewards then
					local view = self:getInjector():getInstance("getRewardView")

					self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
						maskOpacity = 0
					}, {
						needClick = true,
						rewards = response.data.rewards
					}))
				end

				return
			end

			local payOffSystem = self:getInjector():getInstance(PayOffSystem)

			payOffSystem:payOffToSdk(response.data)
		end
	end)
end

local perTime = 0

function ShopSystem:requestBuyPackageShopCount(packageId, count, callback, isFree)
	if isFree ~= KShopBuyType.KFree and isFree ~= KShopBuyType.KCoin then
		self:dispatch(ShowTipEvent({
			tip = "儲值服務已關閉"
		}))

		return
	end

	local curTime = self._gameServerAgent:remoteTimestamp()

	if curTime - perTime < 0.5 then
		return
	end

	perTime = curTime
	local param = {
		itemId = packageId,
		count = count
	}

	self._shopService:requestBuyPackageShopCount(param, function (response)
		if response.resCode == GS_SUCCESS then
			if isFree == KShopBuyType.KFree or isFree == KShopBuyType.KCoin then
				if callback then
					callback()
				end

				self:dispatch(Event:new(EVT_BUY_PACKAGE_SUCC, {
					rewards = response.data.rewards
				}))

				if response.data.rewards then
					local view = self:getInjector():getInstance("getRewardView")

					self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
						maskOpacity = 0
					}, {
						needClick = true,
						rewards = response.data.rewards
					}))
				end

				return
			end

			local payOffSystem = self:getInjector():getInstance(PayOffSystem)

			payOffSystem:payOffToSdk(response.data)
		end
	end)
end

function ShopSystem:requestGetPackageShop(callback)
	self._shopService:requestGetPackageShop(param, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback(response.data)
			end

			self:dispatch(Event:new(EVT_REFRESH_PACKAGE_SUCC))
		end
	end)
end

function ShopSystem:getTimeEnd(timeType)
	if timeType.type == "limit" then
		local start = timeType.start
		local _, _, y, mon, d, h, m, s = string.find(start, "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
		local table = {
			year = y,
			month = mon,
			day = d,
			hour = h,
			min = m,
			sec = s
		}
		local mills = TimeUtil:getTimeByDate(table)
		local ends = timeType["end"]
		local _, _, y, mon, d, h, m, s = string.find(ends, "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
		local table = {
			year = y,
			month = mon,
			day = d,
			hour = h,
			min = m,
			sec = s
		}
		local mille = TimeUtil:getTimeByDate(table)
		local gameServerAgent = DmGame:getInstance()._injector:getInstance("GameServerAgent")
		local curTime = gameServerAgent:remoteTimestamp()

		if curTime < mills or mille <= curTime then
			return false
		end
	end

	return true
end

function ShopSystem:getRecomendData()
	if not self._shopRecommendData then
		self._shopRecommendData = ConfigReader:getDataTable("ShopRecommend")
	end

	local buyPackItems = self._developSystem:getPlayer():getBuyPackItems()
	local listMap = {}

	for id, info in pairs(self._shopRecommendData) do
		local add = false

		if info.Hide == 1 then
			if info.PackageId == nil then
				add = true
			else
				for i = 1, #info.PackageId do
					local pid = info.PackageId[i]

					if pid == KMonthCardType.KMonthCard then
						if self._rechargeAndVipSystem:getCanBuyMC(pid) then
							add = true
						elseif info.Vanish == 0 then
							add = true
						end
					end

					if pid == KMonthCardType.KMonthCardForever then
						if self:getCanBuyMCF() then
							add = true
						elseif info.Vanish == 0 then
							add = true
						end
					end

					local package = self._packageList[pid]

					if package then
						if package:getCanBuy() then
							add = true
						elseif info.Vanish == 0 then
							add = true
						end
					end
				end
			end
		end

		if add and self:getTimeEnd(info.TimeType) then
			listMap[id] = info
		end
	end

	local list = {}

	for id, info in pairs(listMap) do
		local canShow = true
		local prepose = info.Prepose

		if prepose and #prepose > 0 then
			for i = 1, #prepose do
				local recommendId = prepose[i]

				if listMap[recommendId] then
					canShow = false
				end
			end
		end

		if canShow then
			list[#list + 1] = info
		end
	end

	table.sort(list, function (a, b)
		return a.Sort < b.Sort
	end)

	return list
end

function ShopSystem:getShopTalkShow()
	local content = ConfigReader:getDataByNameIdAndKey("ConfigValue", "ShopTalkShow", "content") or ""
	local index = math.random(1, #content)
	local str = content[index] or content[1]

	return Strings:get(str)
end

function ShopSystem:requestBuySurfaceShop(param)
	self._shopService:requestBuySurfaceShop(param, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_SURFACE_BUY_SUCC, {
				rewards = response.data.rewards
			}))
		end
	end)
end

function ShopSystem:requestGetSurfaceShop(callback)
	self._shopService:requestGetSurfaceShop(nil, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback(response.data)
			end

			self:dispatch(Event:new(EVT_REFRESH_SURFACE_SUCC))
		end
	end)
end

function ShopSystem:getForeverConfig()
	if not self._foreverConfig then
		self._foreverConfig = {
			MonthCardForever_Reset = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_Reset", "content"),
			MonthCardForever_GetReward = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_GetReward", "content"),
			MonthCardForever_WeekReward = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_WeekReward", "content"),
			MonthCardForever_StaminaLimit = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_StaminaLimit", "content"),
			MonthCard_1_Sort = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCard_1_Sort", "content"),
			MonthCardForever_Sort = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_Sort", "content"),
			MonthCard_1_Name = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCard_1_Name", "content"),
			MonthCardForever_Name = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_Name", "content"),
			MonthCard_1_Desc = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCard_1_Desc", "content"),
			MonthCardForever_Desc = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_Desc", "content"),
			MonthCardForever_Img = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_Img", "content"),
			MonthCardForever_WindowImg = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_WindowImg", "content"),
			MonthCardForever_Pay = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "MonthCardForever_Pay", "content"),
			Stamina_Max = ConfigReader:requireDataByNameIdAndKey("ConfigValue", "Stamina_Max", "content")
		}
	end

	return self._foreverConfig
end

function ShopSystem:getPackageListDirectPurchase(packageType)
	local data = self:getPackageList(packageType)

	return data
end

function ShopSystem:getPackageListMonthcard()
	local data = {}
	local monthCard = self:getPackageListDirectPurchaseMC()
	local monthCardF = self:getPackageListDirectPurchaseMCF()

	for key, value in pairs(monthCard) do
		table.insert(data, value)
	end

	table.insert(data, monthCardF)
	table.sort(data, function (a, b)
		return a._sort < b._sort
	end)

	return data
end

function ShopSystem:getPackageListMonthcardMap()
	local data = {}
	local monthCard = self:getPackageListDirectPurchaseMC()

	for k, v in pairs(monthCard) do
		data[v._id] = v
	end

	local monthCardF = self:getPackageListDirectPurchaseMCF()
	data[monthCardF._id] = monthCardF

	return data
end

function ShopSystem:getPackageListDirectPurchaseMC()
	return self._rechargeAndVipModel:getMonthCardMap()
end

function ShopSystem:getPackageListDirectPurchaseMCF()
	local config = self:getForeverConfig()
	local monthCardF = {
		_id = KMonthCardType.KMonthCardForever,
		_name = Strings:get(config.MonthCardForever_Name),
		_icon = config.MonthCardForever_Img,
		_buyIcon = config.MonthCardForever_WindowImg,
		_fCardWeekFlag = self._rechargeAndVipModel:getFCardWeekFlag(),
		_fCardBuyFlag = self._rechargeAndVipModel:getFCardBuyFlag(),
		_fCardStamina = self._rechargeAndVipModel:getFCardStamina(),
		_desc = Strings:get(config.MonthCardForever_Desc),
		_payId = config.MonthCardForever_Pay,
		_sort = config.MonthCardForever_Sort,
		_staminaLimit = config.MonthCardForever_StaminaLimit,
		_weekReward = config.MonthCardForever_WeekReward,
		_stamina_Max = config.Stamina_Max
	}

	return monthCardF
end

function ShopSystem:getRedPointForMCFWeekFlag()
	local buy = self._rechargeAndVipModel:getFCardBuyFlag()
	local get = self._rechargeAndVipModel:getFCardWeekFlag()

	if buy and get and get.value <= 0 then
		return true
	end

	return false
end

function ShopSystem:getRedPointForMCFStamina()
	local stamina = self._rechargeAndVipModel:getFCardStamina()

	if self:getForeverConfig().MonthCardForever_StaminaLimit <= stamina then
		return true
	end

	return false
end

function ShopSystem:getRedPointForMonthcard()
	return self:getRedPointForMCFWeekFlag() or self:getRedPointForMCFStamina()
end

function ShopSystem:getRedPointForDirectPackage()
	for key, packageType in ipairs(ShopDirectPackageType) do
		local status = self:getRedPointByPackageType(packageType)

		if status then
			return true
		end
	end

	return false
end

function ShopSystem:getRedPointForShopReset()
	for key, packageType in ipairs(kShopResetTypeSort) do
		local status = self:getRedPointByPackageType(packageType)

		if status then
			return true
		end
	end

	return false
end

function ShopSystem:getRedPointByPackageType(packageType)
	local package = self:getFreePackage(packageType)

	if #package > 0 then
		return true
	end

	return false
end

function ShopSystem:getRedPoint()
	if self:getRedPointForShopReset() or self:getRedPointForDirectPackage() or self:getRedPointForMonthcard() then
		return true
	end

	return false
end

function ShopSystem:getCanBuyMCF()
	if not self._rechargeAndVipModel:getFCardBuyFlag() then
		return true
	end

	return false
end

function ShopSystem:getPlatform()
	return device.platform
end

function ShopSystem:getVersionCanBuy(data, tips)
	local v = data:getVersion()

	if v then
		local p = self:getPlatform()
		local baseVersion = app.pkgConfig.packJobId

		if baseVersion and v[p] and tonumber(baseVersion) < tonumber(v[p]) then
			self:dispatch(ShowTipEvent({
				duration = 0.2,
				tip = tips
			}))

			return false
		end
	end

	return true
end

function ShopSystem:getMonthCardHeadFrame()
	local data = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Test_RealTime", "content")
	local curTime = self._gameServerAgent:remoteTimestamp()

	for i, v in pairs(data.normal) do
		local startDate = TimeUtil:parseDateTime({}, v.start)
		local endDate = TimeUtil:parseDateTime({}, v["end"])
		local startT = TimeUtil:getTimeByDateForTargetTime(startDate)
		local endT = TimeUtil:getTimeByDateForTargetTime(endDate)

		if startT <= curTime and curTime <= endT then
			local rewards = ConfigReader:getDataByNameIdAndKey("Reward", v.reward, "Content")

			for _, reward in pairs(rewards) do
				if reward.type == 14 then
					return reward
				end
			end
		end
	end
end
