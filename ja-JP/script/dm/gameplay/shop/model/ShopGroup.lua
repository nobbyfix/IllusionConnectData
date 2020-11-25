require("dm.gameplay.shop.model.ShopGoods")

ShopGroup = class("ShopGroup", objectlua.Object)

ShopGroup:has("_refreshTimes", {
	is = "rw"
})
ShopGroup:has("_shopId", {
	is = "rw"
})
ShopGroup:has("_goodsList", {
	is = "rw"
})
ShopGroup:has("_goodsMap", {
	is = "rw"
})
ShopGroup:has("_updateTime", {
	is = "rw"
})
ShopGroup:has("_shopConfig", {
	is = "rw"
})

function ShopGroup:initialize()
	super.initialize(self)

	self._refreshTimes = -1
	self._shopId = ""
	self._goodsList = {}
	self._goodsMap = {}
	self._updateTime = nil
	self._remainTime = 0
end

function ShopGroup:sync(data)
	if data.shopId then
		self._shopId = data.shopId
		local shopConfig = ConfigReader:getRecordById("Shop", self._shopId)
		self._shopConfig = shopConfig

		self:createSortCahce()
		self:initCondition()
	end

	if data.refresh and data.refresh.value then
		self._refreshTimes = data.refresh.value
	end

	if data.recoverTime then
		self._updateTime = data.recoverTime + 2
	end

	if data.positions then
		self:syncShopGoods(data.positions)
	end
end

function ShopGroup:initCondition()
	self._conditionMap = {}
	local positions = self._shopConfig.Positions

	for i = 1, #positions do
		local p = positions[i]
		self._conditionMap[p.ShopId] = p.Condition
	end
end

function ShopGroup:createSortCahce()
	self._sortCahce = {}
	local positions = self._shopConfig.Positions

	for i = 1, #positions do
		self._sortCahce[positions[i]] = i
	end
end

function ShopGroup:delGoods(data)
	for goodId, state in pairs(data) do
		if state == 1 and self._goodsMap[goodId] then
			self._goodsMap[goodId] = nil
		end
	end

	self._goodsList = {}

	for goodId, data in pairs(self._goodsMap) do
		self._goodsList[#self._goodsList + 1] = data
	end

	self:sortGoodsList()
end

function ShopGroup:syncShopGoods(data)
	for id, v in pairs(data) do
		if not self._goodsMap[id] then
			local shopGood = ShopGoods:new(self._shopId)
			self._goodsMap[id] = shopGood
			self._goodsList[#self._goodsList + 1] = shopGood
		end

		self._goodsMap[id]:syncGoods(id, v)
		self._goodsMap[id]:setShopId(self._shopId)
		self._goodsMap[id]:setCondition(self._conditionMap[id])
	end

	self:sortGoodsList()
end

function ShopGroup:sortGoodsList()
	if self._shopId == ShopSpecialId.kShopSurface then
		table.sort(self._goodsList, function (a, b)
			if a:getStock() == b:getStock() then
				return a:getIndex() < b:getIndex()
			end

			return b:getStock() < a:getStock()
		end)
	else
		table.sort(self._goodsList, function (a, b)
			if a:getIndex() ~= b:getIndex() then
				return a:getIndex() < b:getIndex()
			end
		end)
	end
end

function ShopGroup:getShopGoodById(id)
	return self._goodsMap[id]
end

function ShopGroup:getShopGoodByIndex(index)
	return self._goodsList[index]
end

function ShopGroup:forceRefreshRemainTime()
	self._remainTime = self:getNextRefreshTime() - self:getCurSystemTime()
end

function ShopGroup:getRefreshRemainTime()
	return self._remainTime
end

function ShopGroup:getReShow()
	return self._shopConfig.RsShow
end

function ShopGroup:getRefreshCurrency()
	if self._shopConfig then
		return self._shopConfig.RefreshCurrency
	end

	return 0
end

function ShopGroup:getRefreshCost()
	if self._shopConfig then
		local prices = self._shopConfig.RefreshPrice

		if self._refreshTimes == -1 then
			return -1
		else
			local max = #prices

			if max < self._refreshTimes + 1 then
				return prices[max]
			end

			local cost = prices[self._refreshTimes + 1]

			return cost
		end
	else
		return -1
	end
end

function ShopGroup:getRefreshMaxTimes()
	return tonumber(self._shopConfig.RefreshMaxTimes)
end

function ShopGroup:getRemainRefreshTimes()
	return self:getRefreshMaxTimes() - self:getRefreshTimes()
end
