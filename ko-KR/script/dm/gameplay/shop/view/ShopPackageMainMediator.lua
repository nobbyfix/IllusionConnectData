ShopPackageMainMediator = class("ShopPackageMainMediator", DmAreaViewMediator, _M)

ShopPackageMainMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
ShopPackageMainMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ShopPackageMainMediator:has("_rechargeSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")
ShopPackageMainMediator:has("_rechargeAndVipModel", {
	is = "r"
}):injectWith("RechargeAndVipModel")
ShopPackageMainMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
ShopPackageMainMediator:has("_rechargeAndVipSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")

local kNums = 3
local kCellHeight = 518
local kCellWidth = 707
local kCellHeightTab = 60
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

function ShopPackageMainMediator:initialize()
	super.initialize(self)
end

function ShopPackageMainMediator:dispose()
	self:clearView()
	super.dispose(self)
end

function ShopPackageMainMediator:onRegister()
	super.onRegister(self)
	self:mapEventListeners()
end

function ShopPackageMainMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_BUY_PACKAGE_SUCC, self, self.onBuyPackageSuccCallback)
	self:mapEventListener(self:getEventDispatcher(), PAY_INIT_SUCCESS, self, self.refreshShopData)
end

function ShopPackageMainMediator:onRemove()
	super.onRemove(self)
end

function ShopPackageMainMediator:setupView()
	self._timer = {}

	self:initMember()
end

function ShopPackageMainMediator:refreshData(data)
	self._shopId = data.shopId or nil
	self._rightTabIndex = data.rightTabIndex or 1

	if self._shopId == ShopSpecialId.kShopReset then
		self._shopId = self._shopTabList[self._rightTabIndex].shopId

		self:setTabStatus()
	end

	self._parentMediator = data.parentMediator or nil
	self._enterData = data.enterData or nil

	self:setData()
end

function ShopPackageMainMediator:setData()
	self._curShopItems = self._shopSystem:getPackageList(self._shopId)
end

function ShopPackageMainMediator:initMember()
	self._scrollBg = self:getView():getChildByFullName("scrollBg")
	self._scrollBarBg = self:getView():getChildByFullName("scrollBarBg")
	self._cellClone = self:getView():getChildByFullName("cellClone")

	self._cellClone:setVisible(false)
	self._cellClone:getChildByFullName("cell.rewardPanel"):setTouchEnabled(false)

	self._scrollView = self:getView():getChildByName("scrollView")

	self._scrollView:setScrollBarEnabled(true)
	self._scrollView:setScrollBarAutoHideTime(9999)
	self._scrollView:setScrollBarColor(cc.c3b(243, 220, 142))
	self._scrollView:setScrollBarAutoHideEnabled(true)
	self._scrollView:setScrollBarWidth(5)
	self._scrollView:setScrollBarOpacity(255)
	self._scrollView:setScrollBarPositionFromCorner(cc.p(10, 15))

	self._cellWidth = self._cellClone:getContentSize().width
	self._cellHeight = self._cellClone:getContentSize().height
	self._cellHeight = self._cellHeight + 7
	self._talkRole = self:getView():getChildByName("talkPanel")

	self._talkRole:addClickEventListener(function (sender)
		self:onClickTalkRole(sender)
	end)
	self._talkRole:getChildByName("Image_19"):setVisible(false)

	self._rolePanel = self._talkRole:getChildByName("rolePanel")

	self._rolePanel:setTouchEnabled(false)

	self._shopSpine = ShopSpine:new()

	self._shopSpine:addSpine(self._rolePanel)

	self._talkText = self._talkRole:getChildByName("Text_talk")

	self._talkText:setString("")

	self._tabBg = self:getView():getChildByFullName("tabBg")

	self._tabBg:setVisible(false)

	self._tabClone = self:getView():getChildByFullName("tabClone")

	self._tabClone:setVisible(false)

	self._cellWidthTab = self._tabClone:getContentSize().width
	self._scrollViewTab = self:getView():getChildByFullName("tabBg.scrollViewTab")

	self._scrollViewTab:setScrollBarEnabled(false)

	self._refreshPanel = self:getView():getChildByFullName("refreshPanel")

	self._refreshPanel:setVisible(false)

	self._refreshTime = self._refreshPanel:getChildByFullName("refresh_time_text")

	self:createRightShopConfig()
	self:initRightTabController()

	local _refundPanel = self:getView():getChildByFullName("talkPanel.refundPanel")

	_refundPanel:addClickEventListener(function (sender)
		self:onClickRefundBtn()
	end)
	self:adjustView()
end

function ShopPackageMainMediator:adjustView()
end

function ShopPackageMainMediator:clearView(refresh)
	self:stopTimers()
	self:stopResetTimer()
	self:getView():stopAllActions()
	self:stopItemActions()
	self._scrollView:removeAllChildren()

	if not refresh and self._shopSpine then
		self._shopSpine:stopEffect()
	end
end

function ShopPackageMainMediator:refreshView()
	self:clearView(true)
	self:setResetTimer()
	self:setTalkView()
	self:setMenuView()
	self:setRefreshView()
	self:setScrollPosition()

	local length = math.ceil(#self._curShopItems / kNums)
	local viewHeight = self._scrollView:getContentSize().height
	local allHeight = math.max(viewHeight, self._cellHeight * length)

	self._scrollView:setInnerContainerSize(cc.size(kCellWidth, allHeight))
	self._scrollView:setInnerContainerPosition(cc.p(0, -(allHeight - kCellHeight)))

	self._cells = {}

	for i = 1, length do
		local layout = ccui.Layout:create()

		layout:setContentSize(cc.size(kCellWidth, self._cellHeight))
		layout:addTo(self._scrollView)
		layout:setTag(i)
		layout:setAnchorPoint(cc.p(0, 1))

		local h = kCellHeight - self._cellHeight * i

		layout:setPosition(cc.p(0, allHeight - self._cellHeight * (i - 1)))
		layout:setTouchEnabled(false)
		self:createCell(layout, i)
	end

	if not self:urlEnter() then
		self:runListAnim()
	end
end

function ShopPackageMainMediator:urlEnter()
	if self._enterData and self._enterData.packageId and not self._instanceEnter then
		self._instanceEnter = true

		local function enter(data)
			local offsetY = self._scrollView:getInnerContainerPosition().y
			local offsetX = self._scrollView:getInnerContainerPosition().x
			local cell = self._cells["cell" .. self._enterData.packageId]
			local x = cell:getPositionX()

			if x < offsetX or self._scrollView:getContentSize().width < x then
				self._scrollView:setInnerContainerPosition(cc.p(-self._cellWidth * (i - 1), offsetY))
			end

			self:onClickItem(data)

			self._enterData = nil
		end

		if table.indexof(kShopResetTypeSort, self._shopId) then
			for i = 1, 3 do
				local data = self._shopSystem:getPackageList(kShopResetTypeSort[i])

				for j = 1, #data do
					if data[j]:getId() == self._enterData.packageId then
						self:onClickTabBtns(_, i)
						enter(data[j])

						return true
					end
				end
			end
		else
			local data = self._curShopItems

			for i = 1, #data do
				if data[i]._id == self._enterData.packageId then
					enter(data[i])

					return true
				end
			end
		end
	end

	return false
end

function ShopPackageMainMediator:createCell(cell, index)
	for i = 1, kNums do
		local itemIndex = kNums * (index - 1) + i
		local itemData = self._curShopItems[itemIndex]

		if itemData then
			local clonePanel = self._cellClone:clone()

			clonePanel:setVisible(true)
			cell:addChild(clonePanel)
			clonePanel:setPosition((i - 1) * (self._cellWidth + 12), 0)
			clonePanel:setTag(i)
			self:setInfo(clonePanel, itemData, itemIndex)

			self._cells["cell" .. itemData._id] = cell
		end
	end
end

function ShopPackageMainMediator:cleanMarkImage(panel)
	local image = panel:getChildByFullName("DiscountMark")

	if image then
		image:removeFromParent()

		return
	end

	image = panel:getChildByFullName("RecommendMark")

	if image then
		image:removeFromParent()

		return
	end

	image = panel:getChildByFullName("LimitDateMark")

	if image then
		image:removeFromParent()

		return
	end

	image = panel:getChildByFullName("RechargeBonusMark")

	if image then
		image:removeFromParent()

		return
	end
end

function ShopPackageMainMediator:setInfo(panel, data, index)
	panel = panel:getChildByFullName("cell")
	local iconLayout = panel:getChildByFullName("icon_layout")
	local nameText = panel:getChildByFullName("goods_name")
	local money_icon = panel:getChildByFullName("money_layout.money_icon")

	money_icon:removeAllChildren()

	local moneyText = panel:getChildByFullName("money_layout.money")
	local isFree = data:getIsFree()
	local touchPanel = panel:getChildByFullName("touch_panel")

	touchPanel:addClickEventListener(function ()
		self:onClickItem(data)
	end)
	self:cleanMarkImage(panel)
	nameText:setString(data:getName())
	GameStyle:setQualityText(nameText, data:getQuality(), true)

	if isFree == 1 then
		moneyText:setString(Strings:get("Recruit_Free"))
	elseif isFree == 2 then
		local goldIcon = IconFactory:createResourcePic({
			id = data:getGameCoin().type
		})

		goldIcon:addTo(money_icon):center(money_icon:getContentSize()):offset(0, 0)
		moneyText:setString(tostring(data:getGameCoin().amount))
	else
		local symbol, price = data:getPaySymbolAndPrice(data:getPayId())

		moneyText:setString(symbol .. price)
	end

	moneyText:setFontSize(24)
	iconLayout:removeAllChildren()
	iconLayout:setAnchorPoint(cc.p(0.5, 0.5))

	local iconPath = data:getIcon()
	local icon = ccui.ImageView:create(iconPath, 1)

	iconLayout:addChild(icon)
	icon:setAnchorPoint(cc.p(0.5, 0.5))

	local pos = cc.p(iconLayout:getContentSize().width / 2, iconLayout:getContentSize().height / 2 - 5)

	icon:setPosition(pos)
	icon:setScale(0.7)
	self:refreshPackageTime(panel, data)
	self:setLimitDateImg(panel, data)
	self:setRecommendImg(panel, ItemTag[data:getTag()])
	self:setDiscountImg(panel, data)

	local rewardPanel = panel:getChildByFullName("rewardPanel")

	rewardPanel:removeAllChildren()

	local rewardId = data:getItem()
	local rewards = RewardSystem:getRewardsById(rewardId)
	local offset = #rewards == 1 and 75 or #rewards == 2 and 45 or 17

	for i = 1, 3 do
		local reward = rewards[i]

		if reward then
			local rewardIcon = IconFactory:createRewardIcon(reward, {
				showAmount = true,
				isWidget = true
			})

			rewardPanel:addChild(rewardIcon)
			rewardIcon:setScaleNotCascade(0.4)
			rewardIcon:setPosition((i - 1) * 53 + offset, 8)
			rewardIcon:setAnchorPoint(0, 0)
			IconFactory:bindClickHander(rewardIcon, IconTouchHandler:new(self._parentMediator), reward, {
				touchDisappear = true,
				swallowTouches = true
			})
		end
	end

	self:addRedPoint(panel, data)
end

function ShopPackageMainMediator:addRedPoint(panel, data)
	local package = self._shopSystem:getFreePackage()

	for i = 1, #package do
		local packageId = package[i]:getId()

		if data:getId() == packageId then
			local redPoint = panel:getChildByName("redPoint" .. packageId)

			if not redPoint then
				redPoint = RedPoint:createDefaultNode()

				redPoint:addTo(panel):posite(200, 240)
				redPoint:setLocalZOrder(99901)
				redPoint:setName("redPoint" .. packageId)
			end
		end
	end
end

function ShopPackageMainMediator:setDiscountImg(panel, data)
	local costOffTagPanel = panel:getChildByName("costOffTagPanel")
	local costOff = data:getCostOff()

	if costOff and costOff > 0 then
		costOffTagPanel:setVisible(true)

		local n = costOffTagPanel:getChildByName("number")
		local n1 = costOffTagPanel:getChildByName("number1")

		n:setString(tostring(costOff * 100))
		n1:setString("%")
		n1:setPositionX(n:getPositionX() + n:getContentSize().width)
	else
		costOffTagPanel:setVisible(false)
	end
end

function ShopPackageMainMediator:setRecommendImg(panel, tagData)
	local label = panel:getChildByFullName("RecommendMark")

	if not tagData then
		if label then
			label:removeFromParent()
		end

		return
	end

	local str = tagData.text
	local outline = tagData.outline
	local bg = tagData.bg

	if not label then
		label = cc.Label:createWithTTF("", TTF_FONT_FZYH_M, 28)

		label:addTo(panel)
		label:setName("TipMark")
	end

	label:setString(str)
	label:setPosition(cc.p(180, 205))
	label:setColor(cc.c4b(255, 211, 94, 255))
	label:enableOutline(cc.c4b(67, 35, 14, 255), 1)
	label:enableShadow(cc.c4b(0, 0, 0, 117.30000000000001), cc.size(2, 0), 2)
end

function ShopPackageMainMediator:setLimitDateImg(panel, data)
	self:setTimer(panel, data)
end

function ShopPackageMainMediator:refreshPackageTime(panel, data)
	local infoPanel = panel:getChildByFullName("info_panel")
	local iconLayout = panel:getChildByFullName("icon_layout")
	local _times = panel:getChildByFullName("info_panel.times")
	local _times1 = panel:getChildByFullName("info_panel.times1")

	_times:setVisible(false)
	_times1:setVisible(false)

	local _duihuanText = panel:getChildByFullName("info_panel.duihuan_text")
	local _mageMark = panel:getParent():getChildByFullName("ImageMark")

	_mageMark:setVisible(false)

	local curTime = DmGame:getInstance()._injector:getInstance("GameServerAgent"):remoteTimestamp()
	local start = data:getStartMills()
	local end_ = data:getEndMills()
	local times1 = data:getLeftCount()
	local times2 = data:getStorage()

	if times1 == -1 then
		infoPanel:setVisible(false)

		return
	end

	infoPanel:setVisible(true)

	if curTime < start or end_ < curTime or times1 <= 0 then
		_mageMark:setVisible(true)
		panel:setColor(cc.c3b(127, 127, 127))
		_duihuanText:setVisible(false)
		infoPanel:setVisible(false)

		return
	end

	_duihuanText:setVisible(true)
	infoPanel:setVisible(true)
	_duihuanText:setString(Strings:get("Shop_BuyNumLimit") .. "(" .. times1 .. "/" .. times2 .. ")")
end

function ShopPackageMainMediator:refreshShopData()
	if self:isCurShop() then
		self:setData()
		self:refreshView()
		self:setTabStatus()
	end
end

function ShopPackageMainMediator:isCurShop()
	local shopId = self._shopId

	if table.indexof(kShopResetTypeSort, shopId) then
		shopId = ShopSpecialId.kShopReset
	end

	if shopId and self._parentMediator and shopId == self._parentMediator:getCurShopId() then
		return true
	end

	return false
end

function ShopPackageMainMediator:setScrollPosition()
	local offset = 23

	if table.indexof(kShopResetTypeSort, self._shopId) then
		self._scrollBg:setPositionY(5)
		self._scrollBarBg:setPositionY(15)
		self._scrollView:setPositionY(5)
		self._talkRole:setPositionY(-offset)
	else
		self._scrollBg:setPositionY(5 + offset)
		self._scrollBarBg:setPositionY(15 + offset)
		self._scrollView:setPositionY(5 + offset)
		self._talkRole:setPositionY(0)
	end
end

function ShopPackageMainMediator:onClickItem(data)
	if data:getLeftCount() == 0 then
		return
	end

	dump(data, "RRRRRRRRR")

	local view = self:getInjector():getInstance("ShopBuyPackageView")

	if view then
		AudioEngine:getInstance():playEffect("Se_Click_Select_1", false)
		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			shopId = ShopSpecialId.kShopPackage,
			item = data
		}))
	end
end

function ShopPackageMainMediator:onBuyPackageSuccCallback(event)
	if self:isCurShop() then
		self._buySuccessedInstance = true

		self:refreshShopData()
	end
end

function ShopPackageMainMediator:stopItemActions()
	local allCells = self._scrollView:getChildren()

	for i = 1, #allCells do
		local child = allCells[i]

		if child then
			for j = 1, kNums do
				local node = child:getChildByTag(j)

				if node and node:getChildByFullName("cell") then
					node = node:getChildByFullName("cell")

					node:stopAllActions()
				end
			end
		end
	end
end

function ShopPackageMainMediator:runListAnim()
	local v = 4

	self._scrollView:setTouchEnabled(false)

	local allCells = self._scrollView:getChildren()

	for i = 1, v do
		local child = allCells[i]

		if child then
			for j = 1, kNums do
				local node = child:getChildByTag(j)

				if node then
					node:setOpacity(0)
				end
			end
		end
	end

	local length = math.min(v, #allCells)
	local delayTime = v / 30
	local delayTime1 = kNums / 30

	for i = 1, v do
		local child = allCells[i]

		if child then
			for j = 1, kNums do
				local node = child:getChildByTag(j)

				if node then
					local starPosX = node:getPositionX()
					local starPosY = node:getPositionY()

					node:setPositionX(starPosX + 100)

					local time = (i - 1) * delayTime + (j - 1) * delayTime1
					local delayAction = cc.DelayTime:create(time)
					local callfunc = cc.CallFunc:create(function ()
						local action1 = cc.MoveTo:create(0.1, cc.p(starPosX, starPosY))

						node:stopAllActions()
						node:runAction(action1)
					end)
					local callfunc1 = cc.CallFunc:create(function ()
						node:setOpacity(255)

						if length == i then
							self._scrollView:setTouchEnabled(true)
						end
					end)
					local seq = cc.Sequence:create(delayAction, callfunc, callfunc1)

					self:getView():runAction(seq)
				end
			end
		end
	end
end

function ShopPackageMainMediator:stopTimer(view, id)
	if self._timer[id] then
		self._timer[id]:stop()

		self._timer[id] = nil
	end

	if view then
		view:setVisible(false)
	end
end

function ShopPackageMainMediator:stopTimers()
	if self._timer then
		for key, value in pairs(self._timer) do
			value:stop()
		end

		self._timer = {}
	end
end

function ShopPackageMainMediator:setTimer(panel, data)
	local limitePanel = panel:getChildByName("limitePanel")

	self:stopTimer(limitePanel, data:getId())

	local tag = data:getTimeTag()

	if not tag then
		return
	end

	limitePanel:setVisible(true)

	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local remoteTimestamp = gameServerAgent:remoteTimestamp()
	local endMills = data:getEndMillsByCondition()

	if remoteTimestamp < endMills and not self._timer[data:getId()] then
		local function checkTimeFunc()
			remoteTimestamp = gameServerAgent:remoteTimestamp()
			local endMills = data:getEndMillsByCondition()
			local remainTime = endMills - remoteTimestamp

			if math.floor(remainTime) <= 0 then
				self:stopTimer(nil, data:getId())

				return
			end

			local str = ""
			local fmtStr = "${d}:${H}:${M}:${S}"
			local timeStr = TimeUtil:formatTime(fmtStr, remainTime)
			local parts = string.split(timeStr, ":", nil, true)
			local timeTab = {
				day = tonumber(parts[1]),
				hour = tonumber(parts[2]),
				min = tonumber(parts[3]),
				sec = tonumber(parts[4])
			}

			if timeTab.day > 0 then
				str = timeTab.day .. Strings:get("TimeUtil_Day")
			elseif timeTab.hour > 0 then
				str = timeTab.hour .. Strings:get("TimeUtil_Hour")
			elseif timeTab.min > 0 then
				str = timeTab.min .. Strings:get("TimeUtil_Min")
			else
				str = "1" .. Strings:get("TimeUtil_Min")
			end

			limitePanel:getChildByName("times"):setString(str)
			limitePanel:setVisible(true)
		end

		checkTimeFunc()

		self._timer[data:getId()] = LuaScheduler:getInstance():schedule(checkTimeFunc, 1, false)
	end
end

function ShopPackageMainMediator:setTalkView()
	self._showTalk = false

	self:onClickTalkRole()
end

function ShopPackageMainMediator:onClickTalkRole(sender)
	self._showTalk = not self._showTalk
	local talkBg = self._talkRole:getChildByName("Image_20")

	talkBg:setVisible(self._showTalk)
	self._talkText:setVisible(self._showTalk)
	self._talkText:setString(self._shopSystem:getShopTalkShow())
	self:playAnimation(sender)
end

function ShopPackageMainMediator:playAnimation(sender)
	local function callback(voice)
	end

	if self._buySuccessedInstance then
		self._buySuccessedInstance = false

		self._shopSpine:playAnimation(nil, , KShopVoice.buyEnd, callback)

		return
	end

	if sender then
		if self._shopSpine:getActionStatus() then
			self._shopSpine:playAnimation(KShopAction.click, false, KShopVoice.click, callback)
		end
	elseif self._shopSystem:getPlayInstance() then
		self._shopSpine:playAnimation(KShopAction.begin, false, KShopVoice.begin, callback)
		self._shopSystem:setPlayInstance(false)
	else
		self._shopSpine:playAnimation(KShopAction.beginEnd, true)
	end
end

function ShopPackageMainMediator:setMenuView()
	if table.indexof(kShopResetTypeSort, self._shopId) then
		self._tabBg:setVisible(true)
	else
		self._tabBg:setVisible(false)
	end
end

function ShopPackageMainMediator:createRightShopConfig()
	self._shopTabList = {
		{
			shopId = kShopResetTypeSort[1],
			name = {
				Strings:get("Shop_Tab_Day"),
				""
			}
		},
		{
			shopId = kShopResetTypeSort[2],
			name = {
				Strings:get("Shop_Tab_Week"),
				""
			}
		},
		{
			shopId = kShopResetTypeSort[3],
			name = {
				Strings:get("Shop_Tab_Month"),
				""
			}
		}
	}
end

function ShopPackageMainMediator:initRightTabController()
	self._tabBtns = {}

	self._scrollViewTab:removeAllChildren()

	local length = #self._shopTabList
	local viewWidth = self._scrollViewTab:getContentSize().width
	local allWidth = math.max(viewWidth, self._cellWidthTab * length)

	self._scrollViewTab:setInnerContainerSize(cc.size(allWidth, kCellHeightTab))
	self._scrollViewTab:setInnerContainerPosition(cc.p(0, 2))

	for i = 1, length do
		local nameStr = self._shopTabList[i].name[1]
		local nameStr1 = self._shopTabList[i].name[2]
		local btn = self._tabClone:clone()

		btn:setVisible(true)
		btn:setTag(i)
		btn:getChildByFullName("dark_1.text"):setString(nameStr)
		btn:getChildByFullName("light_1.text"):setString(nameStr)

		if btn:getChildByFullName("dark_1.text1") then
			btn:getChildByFullName("dark_1.text1"):setString(nameStr1)
			btn:getChildByFullName("light_1.text1"):setString(nameStr1)
		end

		btn:addTo(self._scrollViewTab)
		btn:setPosition(cc.p(self._cellWidthTab * (i - 1), 0))

		btn.data = self._shopTabList[i]
		self._tabBtns[#self._tabBtns + 1] = btn

		btn:addClickEventListener(function ()
			self:onClickTabBtns(_, i)
		end)

		local redPoint = RedPoint:createDefaultNode()

		redPoint:addTo(btn):posite(149, 35)
		redPoint:setLocalZOrder(99900)
		redPoint:setName("redPoint" .. btn.data.shopId)
	end
end

function ShopPackageMainMediator:onClickTabBtns(name, tag)
	if self._rightTabIndex == tag then
		return
	end

	self._rightTabIndex = tag
	self._shopId = self._shopTabList[self._rightTabIndex].shopId

	self:setData()
	self:refreshView()
	self:setTabStatus()
end

function ShopPackageMainMediator:setTabStatus()
	for i = 1, #self._tabBtns do
		local btn = self._tabBtns[i]

		btn:getChildByFullName("dark_1"):setVisible(i ~= self._rightTabIndex)
		btn:getChildByFullName("light_1"):setVisible(i == self._rightTabIndex)
		btn:getChildByFullName("redPoint" .. btn.data.shopId):setVisible(false)
		self:setRedPointBar(btn)
	end
end

function ShopPackageMainMediator:setRedPointBar(btn)
	local package = self._shopSystem:getFreePackage()

	for i = 1, #package do
		local packageType = package[i]:getShopSort()

		if btn.data.shopId == packageType then
			btn:getChildByFullName("redPoint" .. btn.data.shopId):setVisible(true)
		end
	end
end

function ShopPackageMainMediator:setRefreshView()
	if table.indexof(kShopResetTypeSort, self._shopId) then
		self._refreshPanel:setVisible(true)
	else
		self._refreshPanel:setVisible(false)
	end
end

function ShopPackageMainMediator:stopResetTimer()
	if self._resetTimer then
		self._resetTimer:stop()

		self._resetTimer = nil
	end

	self._refreshPanel:setVisible(false)
end

function ShopPackageMainMediator:setResetTimer()
	self:stopResetTimer()

	if #self._curShopItems == 0 or not self._shopId then
		return
	end

	self._refreshPanel:setVisible(true)

	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local remoteTimestamp = gameServerAgent:remoteTimestamp()
	local endMills = self._shopSystem:getResetShopEndMills(self._shopId)

	if remoteTimestamp < endMills and not self._resetTimer then
		local function checkTimeFunc()
			remoteTimestamp = gameServerAgent:remoteTimestamp()
			endMills = self._shopSystem:getResetShopEndMills(self._shopId)
			local remainTime = endMills - remoteTimestamp

			if math.floor(remainTime) <= 0 then
				performWithDelay(self:getView(), function ()
					self:stopResetTimer()
					self._shopSystem:requestGetPackageShop()
				end, 0.5)

				return
			end

			local str = ""
			local fmtStr = "${d}:${H}:${M}:${S}"
			local timeStr = TimeUtil:formatTime(fmtStr, remainTime)
			local parts = string.split(timeStr, ":", nil, true)
			local timeTab = {
				day = tonumber(parts[1]),
				hour = tonumber(parts[2]),
				min = tonumber(parts[3]),
				sec = tonumber(parts[4])
			}

			if timeTab.day > 0 then
				str = timeTab.day .. Strings:get("TimeUtil_Day")
			elseif timeTab.hour > 0 then
				str = timeTab.hour .. Strings:get("TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min")
			else
				str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
			end

			if not DisposableObject:isDisposed(self) and self._refreshTime and self._refreshPanel then
				self._refreshTime:setString(str)
				self._refreshPanel:setVisible(true)
			end
		end

		checkTimeFunc()

		self._resetTimer = LuaScheduler:getInstance():schedule(checkTimeFunc, 1, false)
	end
end

function ShopPackageMainMediator:onClickRefundBtn()
	local view = self:getInjector():getInstance("RefundDetailView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data))
end
