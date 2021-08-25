ShopItem = class("ShopItem", objectlua.Object, _M)
local ItemTag = {
	Hot = {
		bg = "common_bg_xb_2.png",
		text = Strings:get("shop_UI20"),
		outline = cc.c4b(139, 27, 27, 255)
	},
	Recommend = {
		bg = "common_bg_xb_2.png",
		text = Strings:get("shop_UI25"),
		outline = cc.c4b(139, 27, 27, 255)
	},
	New = {
		bg = "common_bg_xb_1.png",
		text = Strings:get("shop_UI26"),
		outline = cc.c4b(58, 86, 8, 255)
	},
	Limit = {
		bg = "common_bg_xb_1.png",
		text = Strings:get("shop_UI27"),
		outline = cc.c4b(58, 86, 8, 255)
	}
}
local kMarkImgAndStr = {
	SoldOutMark = Strings:get("shop_UI16"),
	RecoverMark = Strings:get("shop_UI17"),
	OwnMark = Strings:get("shop_UI21")
}
local kSurfaceQualityBg = {
	{
		"shop_pz_bai_1.png"
	},
	{
		"shop_pz_lv_1.png",
		"shop_pz_lv_2.png"
	},
	{
		"shop_pz_lan_1.png",
		"shop_pz_lan_2.png"
	},
	{
		"shop_pz_zi_1.png",
		"shop_pz_zi_2.png"
	},
	{
		"shop_pz_cheng_1.png",
		"shop_pz_cheng_2.png"
	}
}

function ShopItem:initialize(shopId)
	super.initialize(self)
	self:initMemeber(shopId)
end

function ShopItem:initMemeber()
	self._data = nil
	self._rootView = nil
	self._iconLayout = nil
end

function ShopItem:setView(view, ui)
	self._rootView = view
	self._view = self._rootView:getChildByFullName("cell")
	self._mediator = ui
	self._iconLayout = self._view:getChildByFullName("icon_layout")
	self._goods_num = self._view:getChildByFullName("goods_num")
	self._nameText = self._view:getChildByFullName("goods_name")
	self._moneyLayout = self._view:getChildByFullName("money_layout")
	self._moneyIcon = self._moneyLayout:getChildByFullName("money_icon")
	self._moneyText = self._moneyLayout:getChildByFullName("money")
	self._totalMoney = self._moneyLayout:getChildByFullName("totalMoney")

	self._totalMoney:setVisible(false)

	self._lineImage = self._moneyLayout:getChildByFullName("lineImage")

	self._lineImage:setVisible(false)

	self._touchPanel = self._view:getChildByFullName("touch_panel")

	self._touchPanel:setLocalZOrder(10)
	self._touchPanel:setTouchEnabled(true)
	self._touchPanel:setSwallowTouches(false)

	self._infoPanel = self._view:getChildByFullName("info_panel")
	self._times = self._view:getChildByFullName("info_panel.times")
	self._times1 = self._view:getChildByFullName("info_panel.times1")
	self._duihuanText = self._view:getChildByFullName("info_panel.duihuan_text")
	self._conditionView = self._rootView:getChildByFullName("lockPanel")
end

function ShopItem:setTouchHandler(callback)
	self._touchPanel:addClickEventListener(function ()
		callback()
	end)
end

function ShopItem:getView()
	return self._rootView
end

function ShopItem:setInfo(data)
	self._data = data
	self._shopId = self._data:getShopId()
	self._touchPanel._data = self._data

	self:cleanMarkImage()
	self._iconLayout:removeAllChildren()
	self._moneyIcon:removeAllChildren()

	local price = self._data:getPrice()

	if price == 0 then
		price = Strings:get("Recruit_Free") or price
	end

	self._moneyText:setString(price)

	local goldIcon = IconFactory:createResourcePic({
		id = self._data:getCostType()
	})

	goldIcon:addTo(self._moneyIcon):center(self._moneyIcon:getContentSize()):offset(16, 0)

	local name = self._data:getName()

	self._nameText:setString(name)

	if self._shopId == ShopSpecialId.kShopPackage then
		self:refreshPackageInfo()
	else
		self:refreshInfo()
	end

	local timeTag = self._data:getTimeTag()

	if timeTag then
		self:setLimitDateImg()
	end

	local tagData = ItemTag[self._data:getTag()]

	self:setRecommendImg(tagData)

	local costOff = self._data:getCostOff()

	if costOff ~= 1 then
		self:setDiscountImg(costOff)

		local totalPrice = self._data:getPrice()

		if costOff * 10 ~= 0 then
			local originalPrice = self._data:getOriginalPrice()

			if originalPrice then
				totalPrice = originalPrice
			else
				totalPrice = math.ceil(totalPrice / costOff)
			end
		end

		self._totalMoney:setString(totalPrice)
		self._totalMoney:setVisible(true)
		self._lineImage:setVisible(true)
	else
		self._totalMoney:setString("")
		self._totalMoney:setVisible(false)
		self._lineImage:setVisible(false)
	end

	local width = self._totalMoney:getContentSize().width

	if self._totalMoney:isVisible() then
		self._lineImage:setContentSize(cc.size(width + 16, 1))
	end

	self._touchPanel:setTouchEnabled(true)
	self._touchPanel:setSwallowTouches(false)

	local isOpen, lockTip, unLockLevel = self._data:getCondition()

	self._conditionView:setVisible(not isOpen)

	if not isOpen then
		self._view:setColor(cc.c3b(127, 127, 127))

		local txt = self._conditionView:getChildByFullName("locktext")

		txt:setString(lockTip)
		self._conditionView:getChildByFullName("lockImg"):setPositionX(100 - txt:getContentSize().width / 2 - 9)
	end
end

function ShopItem:cleanMarkImage()
	local image = self._view:getChildByFullName("DiscountMark")

	if image then
		image:removeFromParent()

		return
	end

	image = self._view:getChildByFullName("RecommendMark")

	if image then
		image:removeFromParent()

		return
	end

	image = self._view:getChildByFullName("ImageMark")

	if image then
		image:removeFromParent()

		return
	end

	image = self._view:getChildByFullName("LimitDateMark")

	if image then
		image:removeFromParent()

		return
	end

	image = self._view:getChildByFullName("RechargeBonusMark")

	if image then
		image:removeFromParent()

		return
	end
end

function ShopItem:refreshSurfaceIcon()
	local config = self._data:getItemConfig()
	local heroImg = IconFactory:createRoleIconSprite({
		stencil = 1,
		iconType = "Bust1",
		id = config.Model,
		size = cc.size(246, 206)
	})

	heroImg:addTo(self._iconLayout):center(self._iconLayout:getContentSize())
	GameStyle:setQualityText(self._nameText, self._data:getQuality(), true)

	local qualityData = kSurfaceQualityBg[self._data:getQuality()]
	local bg1 = self._view:getChildByFullName("qualityBg1")
	local bg2 = self._view:getChildByFullName("qualityBg2")

	bg1:loadTexture(qualityData[1], 1)

	if qualityData[2] then
		bg2:setVisible(true)
		bg2:loadTexture(qualityData[2], 1)
	else
		bg2:setVisible(false)
	end
end

function ShopItem:refreshEquipIcon()
	local info = self._data:getEquipInfo()
	local icon = IconFactory:createRewardEquipIcon(info, {
		hideLevel = true
	})

	self._iconLayout:addChild(icon)
	icon:setAnchorPoint(cc.p(0.5, 0.5))
	icon:setPosition(cc.p(self._iconLayout:getContentSize().width / 2, self._iconLayout:getContentSize().height / 2))
	GameStyle:setRarityText(self._nameText, info.rarity)
end

function ShopItem:refreshIcon()
	local rewardInfo = self._data:getRewardInfo()

	if rewardInfo and rewardInfo.type == RewardType.kEquip then
		local info = self._data:getEquipInfo()
		local icon = IconFactory:createRewardEquipIcon(info, {
			hideLevel = true,
			showAmount = false
		})

		self._iconLayout:addChild(icon)
		icon:setAnchorPoint(cc.p(0.5, 0.5))
		icon:setPosition(cc.p(self._iconLayout:getContentSize().width / 2, self._iconLayout:getContentSize().height / 2))
		icon:setScale(0.8)
		self._goods_num:setString(rewardInfo.amount)
		GameStyle:setRarityText(self._nameText, info.rarity)
	else
		local number = self._data:getAmount()
		local info = {
			id = self._data:getItemId(),
			amount = number
		}
		local icon = IconFactory:createIcon(info, {
			hideLevel = true,
			showAmount = false
		})

		self._iconLayout:addChild(icon)
		icon:setAnchorPoint(cc.p(0.5, 0.5))
		icon:setPosition(cc.p(self._iconLayout:getContentSize().width / 2, self._iconLayout:getContentSize().height / 2))
		icon:setScale(0.8)
		self._goods_num:setString(number)
		GameStyle:setQualityText(self._nameText, self._data:getQuality(), true)
	end

	IconFactory:bindTouchHander(self._iconLayout, IconTouchHandler:new(self._mediator), rewardInfo, {
		needDelay = true
	})
end

function ShopItem:refreshTimes()
	local times1 = self._data:getStock()
	local times2 = self._data:getStorage()
	local resetMode = self._data:getResetMode()
	local hasResetMode = not not table.keyof(ResetMode, resetMode)

	self._times:setVisible(hasResetMode)
	self._times1:setVisible(hasResetMode)
	self._duihuanText:setVisible(hasResetMode)
	self._infoPanel:setVisible(hasResetMode)

	if hasResetMode then
		local str = Strings:get("SHOP_CELL_TEXT")

		if resetMode == ResetMode.kWeek or resetMode == ResetMode.kWeek1 then
			str = Strings:get("Shop_WeeklyExchange", {
				num1 = times1,
				num2 = times2
			})
		elseif resetMode == ResetMode.kMonth or resetMode == ResetMode.kMonth1 then
			str = Strings:get("Shop_MonthlyExchange", {
				num1 = times1,
				num2 = times2
			})
		end

		self._duihuanText:setString(str)
		self._times:setString("")
		self._times1:setString("")
	end

	if times1 == 0 then
		if self._shopId ~= ShopSpecialId.kShopSurface then
			self:setMarkImg(kMarkImgAndStr.SoldOutMark)
		else
			self:setMarkImg(kMarkImgAndStr.OwnMark)
		end

		self._iconLayout:setColor(cc.c3b(127, 127, 127))
	end
end

function ShopItem:refreshTimePanel()
	local gameServerAgent = self._mediator:getInjector():getInstance("GameServerAgent")
	local noCDTime = self._data:getCDTime()

	if not noCDTime then
		return gameServerAgent:remoteTimestamp()
	end

	local updateTime = self._data:getUpdateTime()
	local lastTime = updateTime - gameServerAgent:remoteTimestamp()
	local times1 = self._data:getStock()
	local times2 = self._data:getStorage()
	local hasTime = lastTime > 0 and times1 < times2

	if hasTime then
		local str = "/" .. times2
		local timeStr = TimeUtil:formatTime("(${HH}:${MM}:${SS})", lastTime)

		self._times1:setString(times1)
		self._times:setString(str)
		self._times1:setTextColor(cc.c3b(240, 60, 60))
		self._duihuanText:setString(timeStr)
		self._times1:setPositionX(self._times:getPositionX() - self._times:getContentSize().width)
		self._duihuanText:setPositionX(self._times1:getPositionX() - self._times1:getContentSize().width - 2)
		self:setMarkImg(kMarkImgAndStr.RecoverMark)
		self._iconLayout:setColor(cc.c3b(127, 127, 127))
	end

	return lastTime
end

function ShopItem:refreshInfo()
	if self._shopId == ShopSpecialId.kShopSurface then
		self:refreshSurfaceIcon()
	else
		self:refreshIcon()
	end

	self:refreshTimes()
end

function ShopItem:refreshPackageInfo()
	local iconPath = self._data:getIcon()
	local icon = ccui.ImageView:create(iconPath, 1)

	self._iconLayout:addChild(icon)
	icon:setAnchorPoint(cc.p(0.5, 0.5))

	local pos = cc.p(self._iconLayout:getContentSize().width / 2, self._iconLayout:getContentSize().height / 2 - 5)

	icon:setPosition(pos)
	icon:setScale(0.7)
	GameStyle:setQualityText(self._nameText, self._data:getQuality(), true)
	self:refreshPackageTime()
end

function ShopItem:refreshPackageTime()
	local gameServerAgent = self._mediator:getInjector():getInstance("GameServerAgent")
	local curTime = gameServerAgent:remoteTimestamp()
	local start = self._data:getStartMills()
	local end_ = self._data:getEndMills()
	local times1 = self._data:getLeftCount()
	local times2 = self._data:getStorage()

	if times1 == -1 then
		self._infoPanel:setVisible(false)

		return
	end

	if curTime < start or end_ < curTime or times1 <= 0 then
		if self._shopId ~= ShopSpecialId.kShopSurface then
			self:setMarkImg(kMarkImgAndStr.SoldOutMark)
		else
			self:setMarkImg(kMarkImgAndStr.OwnMark)
		end

		self._iconLayout:setColor(cc.c3b(127, 127, 127))
		self._times:setVisible(false)
		self._times1:setVisible(false)
		self._duihuanText:setVisible(false)
		self._infoPanel:setVisible(false)

		return
	end

	self._times:setVisible(true)
	self._times1:setVisible(true)
	self._duihuanText:setVisible(true)
	self._infoPanel:setVisible(true)
	self._duihuanText:setString(Strings:get("shop_UI29"))
	self._times1:setTextColor(times1 == 0 and cc.c3b(240, 60, 60) or cc.c3b(255, 255, 255))
	self._times:setString("/" .. times2)
	self._times1:setString(times1)
	self._times1:setPositionX(self._times:getPositionX() - self._times:getContentSize().width)
	self._duihuanText:setPositionX(self._times1:getPositionX() - self._times1:getContentSize().width - 2)
end

function ShopItem:setMarkImg(type)
	local image = self._view:getChildByFullName("ImageMark")

	if not type then
		if image then
			image:removeFromParent()
		end

		return
	end

	if not image then
		image = cc.Node:create()

		image:addTo(self._view)
		image:setName("ImageMark")

		local label = cc.Label:createWithTTF("", TTF_FONT_FZYH_M, 22)

		label:addTo(image):offset(100, 120)
		label:setName("TipMark")
		label:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 2)
	end

	image:setPosition(cc.p(0, 0))
	image:getChildByFullName("TipMark"):setString(type)
end

function ShopItem:setRecommendImg(tagData)
	local image = self._view:getChildByFullName("RecommendMark")

	if not tagData then
		if image then
			image:removeFromParent()
		end

		return
	end

	if not image then
		image = ccui.ImageView:create()

		image:addTo(self._view)
		image:setName("RecommendMark")

		local label = cc.Label:createWithTTF("", TTF_FONT_FZYH_M, 18)

		label:addTo(image)
		label:setPosition(cc.p(22, 24))
		label:setName("TipMark")
	end

	local position = self._shopId == ShopSpecialId.kShopSurface and cc.p(248, 120) or cc.p(123, 128)

	image:setPosition(position)

	local str = tagData.text
	local outline = tagData.outline
	local bg = tagData.bg

	image:loadTexture("asset/common/" .. bg)

	local label = image:getChildByFullName("TipMark")

	label:setString(str)
	label:enableOutline(outline, 2)
	image:setVisible(self._data:getStock() ~= 0)
end

function ShopItem:setDiscountImg(costOff)
	local image = self._view:getChildByFullName("DiscountMark")

	if not costOff then
		if image then
			image:removeFromParent()
		end

		return
	end

	if not image then
		image = ccui.ImageView:create()

		image:addTo(self._view)
		image:setName("DiscountMark")

		local label = cc.Label:createWithTTF("", TTF_FONT_FZYH_M, 16)

		label:addTo(image)
		label:setPosition(cc.p(26, 19))
		label:setName("TipMark")
	end

	local position = self._shopId == ShopSpecialId.kShopSurface and cc.p(26, 219) or cc.p(25, 127)

	image:setPosition(position)

	local label = image:getChildByFullName("TipMark")

	if costOff > 0.2 then
		image:loadTexture("asset/common/common_bg_xb_4.png")
		label:enableOutline(cc.c4b(139, 27, 27, 255), 2)
	else
		image:loadTexture("asset/common/common_bg_xb_3.png")
		label:enableOutline(cc.c4b(58, 86, 8, 255), 2)
	end

	label:setString(costOff * 100 .. "%" .. Strings:get("SHOP_COST_OFF_TEXT10"))
end

function ShopItem:setLimitDateImg(time)
	local image = self._view:getChildByFullName("LimitDateMark")

	if not time then
		if image then
			image:removeFromParent()
		end

		return
	end

	if not image then
		image = ccui.ImageView:create("asset/common/common_bg_xb_5.png")

		image:addTo(self._view)
		image:setName("LimitDateMark")

		local label = cc.Label:createWithTTF("", TTF_FONT_FZYH_M, 18)

		label:addTo(image)
		label:setPosition(cc.p(55, 30))
		label:setName("TipMark")
	end

	local position = self._shopId == ShopSpecialId.kShopSurface and cc.p(216, 200) or cc.p(223, 123)

	image:setPosition(position)
	image:getChildByFullName("TipMark"):setString(time)
end

function ShopItem:setPayMoney(state)
	self._moneyIcon:setVisible(state)

	local isFree = self._data:getIsFree()
	local symbol, price = self._data:getPaySymbolAndPrice(self._data:getPayId())
	local s = isFree == 1 and Strings:get("Recruit_Free") or symbol .. price

	self._moneyText:setString(s)

	local name = self._data:getName()
	local costOff = self._data:getCostOff()

	if costOff ~= 1 then
		self:setDiscountImg(costOff)

		local totalPrice = price

		if costOff * 10 ~= 0 then
			totalPrice = math.ceil(totalPrice / costOff)
		end

		self._totalMoney:setString(totalPrice)
		self._totalMoney:setVisible(true)
		self._lineImage:setVisible(true)
	else
		self._totalMoney:setString("")
		self._totalMoney:setVisible(false)
		self._lineImage:setVisible(false)
	end

	local width = self._totalMoney:getContentSize().width

	if self._totalMoney:isVisible() then
		self._lineImage:setContentSize(cc.size(width + 16, 16))
	end
end
