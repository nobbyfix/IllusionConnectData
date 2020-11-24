require("dm.gameplay.shop.model.ShopGroup")

Shop = class("Shop", objectlua.Object)

Shop:has("_shopList", {
	is = "rw"
})

function Shop:initialize()
	super.initialize(self)
	self:initMember()
end

function Shop:initMember()
	self._shopList = {}
end

function Shop:initSync(data)
	self:initMember()
	self:sync(data)
end

function Shop:sync(data)
	for id, v in pairs(data) do
		if not self._shopList[id] then
			self._shopList[id] = ShopGroup:new()
		end

		self._shopList[id]:sync(v)
	end
end

function Shop:syncSpecialShop(data)
	if data.shopId then
		if not self._shopList[data.shopId] then
			self._shopList[data.shopId] = ShopGroup:new()
		end

		self._shopList[data.shopId]:sync(data)
	end
end

function Shop:getShopGroupById(id)
	return self._shopList[tostring(id)]
end
