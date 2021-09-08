require("dm.gameplay.shop.view.component.ShopItem")

ShopMainMediator = class("ShopMainMediator", DmAreaViewMediator, _M)

ShopMainMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
ShopMainMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ShopMainMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
ShopMainMediator:has("_rechargeSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")
ShopMainMediator:has("_surfaceSystem", {
	is = "r"
}):injectWith("SurfaceSystem")

local kNums = 4
local kCellHeightTab = 50
local kCellHeight = 495
local kCellWidth = 934
local kbackgroundPath = "asset/scene/sd_bg.jpg"
local kShopView = {
	[ShopSpecialId.kShopMall] = "ShopRechargeView",
	[ShopSpecialId.kShopPackage] = "ShopPackageMainView",
	[ShopSpecialId.kShopMonthcard] = "ShopMonthCardView",
	[ShopSpecialId.kShopSurface] = "ShopSurfaceNewView",
	[ShopSpecialId.kShopReset] = "ShopPackageMainView",
	[ShopSpecialId.kShopRecommend] = "ShopRecommendView",
	[ShopSpecialId.kShopSurfacePackage] = "ShopPackageMainView",
	[ShopSpecialId.kShopTimeLimit] = "ShopPackageMainView",
	[ShopSpecialId.KShopTimelimitedmall] = "ShopPackageMainView"
}

function ShopMainMediator:initialize()
	super.initialize(self)
end

function ShopMainMediator:dispose()
	self:getView():stopAllActions()
	self:stopItemActions()

	if self._timer1 then
		self._timer1:stop()

		self._timer1 = nil
	end

	if self._timer2 then
		self._timer2:stop()

		self._timer2 = nil
	end

	super.dispose(self)
end

function ShopMainMediator:onRegister()
	super.onRegister(self)

	self._bagSystem = self._developSystem:getBagSystem()

	self:mapEventListeners()
end

function ShopMainMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_SHOP_REFRESH_SUCC, self, self.onRefreshShopSuccess)
	self:mapEventListener(self:getEventDispatcher(), EVT_SHOP_BUY_REFRESH_SUCC, self, self.onBuyShopItemSuccess)
	self:mapEventListener(self:getEventDispatcher(), EVT_REFRESHSHOPBYRSET_SUCC, self, self.refreshByRset)
	self:mapEventListener(self:getEventDispatcher(), EVT_REFRESHBYGOLDORDIMOND_SUCC, self, self.refreshViewByDimondSuccess)
	self:mapEventListener(self:getEventDispatcher(), EVT_REFRESH_PACKAGE_SUCC, self, self.showPackageShop)
	self:mapEventListener(self:getEventDispatcher(), EVT_SURFACE_BUY_SUCC, self, self.onBuyShopSurfaceSuccess)
	self:mapEventListener(self:getEventDispatcher(), PAY_INIT_SUCCESS, self, self.refreshShopData)
	self:mapEventListener(self:getEventDispatcher(), EVT_REFRESH_SURFACE_SUCC, self, self.showSurfaceShop)
	self:mapEventListener(self:getEventDispatcher(), EVT_FefreshForeverCard, self, self.refreshForeverView)
	self:mapEventListener(self:getEventDispatcher(), EVT_BUY_PACKAGE_SUCC, self, self.onBuyPackageSuccCallback)
end

function ShopMainMediator:onRemove()
	super.onRemove(self)
end

function ShopMainMediator:enterWithData(data)
	dump(data, "data >>>>>>>>>>")
	self:setupTopInfoWidget()
	self:initMember()
	self:initData(data)
	self:initLeftTabController()
	self:forceRefreshRemainTime()
	self:initRightTabController()

	if not kShopView[self._shopId] then
		self:refreshView()
	end

	self._timer1 = LuaScheduler:getInstance():schedule(handler(self, self.onTick), 1, false)

	self:createSchel()

	local payOffSystem = self:getInjector():getInstance(PayOffSystem)

	payOffSystem:createPayIncomplete()
end

function ShopMainMediator:initData(data)
	self._data = data
	self._shopId = data and data.shopId or ShopSpecialId.kShopNormal
	self._leftTabIndex = 1
	self._rightTabIndex = data and data.rightTabIndex or 1
	self._from = data and data.from or ""
	self._enterData = data

	self._shopSystem:setPlayInstance(true)

	self._showSell = true
	self._nodeCache = {}
	self._viewCache = {}

	self:createLeftShopConfig()
	self:createRightShopConfig()
	self:refreshData()
end

function ShopMainMediator:refreshForeverView()
	if self._tabBtnWidget then
		self._tabBtnWidget:refreshAllRedPoint()
	end
end

function ShopMainMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")
	local currencyInfoWidget = self._systemKeeper:getResourceBannerIds("Shop_Mystery")
	local currencyInfo = {}

	for i = #currencyInfoWidget, 1, -1 do
		currencyInfo[#currencyInfoWidget - i + 1] = currencyInfoWidget[i]
	end

	local config = {
		style = 1,
		hasAnim = true,
		currencyInfo = currencyInfo,
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onBackClicked, self)
		},
		title = Strings:get("Shop_Text1")
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function ShopMainMediator:refreshTopInfo(shopId)
	local unlockKey = ""

	if self._shopTabMap[shopId] then
		unlockKey = self._shopTabMap[shopId].unlockKey
	elseif self._leftMap[shopId] then
		unlockKey = self._leftMap[shopId].unlockKey
	end

	local currencyInfoWidget = self._systemKeeper:getResourceBannerIds(unlockKey)
	local currencyInfo = {}

	for i = #currencyInfoWidget, 1, -1 do
		currencyInfo[#currencyInfoWidget - i + 1] = currencyInfoWidget[i]
	end

	local config = {
		style = 1,
		stopAnim = true,
		currencyInfo = currencyInfo,
		title = Strings:get("Shop_Text1")
	}

	self._topInfoWidget:updateView(config)
end

function ShopMainMediator:refreshData()
	if self:getShopNormalId() == ShopSpecialId.kShopNormal then
		local shopId = self:transShopNormalToShopId()
		local shopGroup = self._shopSystem:getShopGroupById(shopId)
		self._curShopItems = shopGroup:getGoodsList()
		self._shopId = shopId
	end
end

function ShopMainMediator:transShopNormalToShopId()
	local shopId = self._shopId

	if self._shopId == ShopSpecialId.kShopNormal then
		shopId = self._shopTabList[self._rightTabIndex].shopId
	end

	return shopId
end

function ShopMainMediator:getShopNormalId()
	if self._shopTabMap[self._shopId] then
		return ShopSpecialId.kShopNormal
	end

	return self._shopId
end

function ShopMainMediator:createLeftShopConfig()
	self._leftArr, self._leftMap = self._shopSystem:getLeftShowTabs()

	if not self._leftMap[self._shopId] then
		self._fresh = true

		for key, value in pairs(self._leftMap) do
			if value.index == 1 then
				self._shopId = key

				break
			end
		end
	end

	self._leftTabIndex = self._leftMap[self._shopId].index
end

function ShopMainMediator:createRightShopConfig()
	local shopTabIds = ConfigReader:getRecordById("ConfigValue", "Shop_ShowSequence").content
	self._shopTabList = {}
	self._shopTabMap = {}

	for i = 1, #shopTabIds do
		local shopId = shopTabIds[i]
		local shopGroup = self._shopSystem:getShopGroupById(shopId)

		if shopGroup then
			local config = ConfigReader:getRecordById("Shop", shopId)
			local unlock, tips = self._systemKeeper:isUnlock(config.UnlockSystem)
			local canShow = self._systemKeeper:canShow(config.UnlockSystem)

			if canShow and unlock then
				local index = #self._shopTabList + 1
				self._shopTabList[index] = {
					shopId = shopId,
					name = {
						Strings:get(config.Name),
						Strings:get(config.ENName)
					}
				}
				self._shopTabMap[shopId] = {
					unlockKey = config.UnlockSystem
				}
				local shopGroup = self._shopSystem:getShopGroupById(shopId)
				local time = shopGroup:getUpdateTime()
				self._nodeCache[shopId] = {}

				if time then
					self._nodeCache[shopId].remainTime = time
				end

				if shopId == self._shopId then
					self._rightTabIndex = index
					self._leftTabIndex = self._leftMap[ShopSpecialId.kShopNormal].index
				end
			end
		end
	end
end

function ShopMainMediator:initMember()
	self._view = self:getView()
	self._mainPanel = self._view:getChildByFullName("main")
	self._backgroundBG = self._mainPanel:getChildByFullName("backgroundBG")
	self._leftTabPanel = self._view:getChildByName("leftTabPanel")
	self._rightTabPanel = self._view:getChildByName("rightTabPanel")
	self._scrollBarBg = self._mainPanel:getChildByFullName("scrollBarBg")
	self._tabClone = self._view:getChildByFullName("tabClone")

	self._tabClone:setVisible(false)

	self._cellCloneNormal = self._view:getChildByFullName("cellCloneNormal")

	self._cellCloneNormal:setVisible(false)

	self._refreshPanel = self._view:getChildByName("refreshPanel")

	self._refreshPanel:getChildByFullName("refresh_btn"):addClickEventListener(function ()
		self:onClickRefresh()
	end)

	self._refreshBtn = self._refreshPanel:getChildByFullName("refresh_btn")
	self._refreshDesc = self._refreshPanel:getChildByFullName("refresh_desc")
	self._refreshTime = self._refreshPanel:getChildByFullName("refresh_time_text")

	self._refreshTime:setAdditionalKerning(2)

	self._refresh_btn = self._refreshPanel:getChildByFullName("refresh_btn")

	self:adjustView()
end

function ShopMainMediator:adjustView()
	local director = cc.Director:getInstance()
	local winSize = director:getWinSize()
	local currentHeight1 = winSize.height - 124
	local currentHeight2 = winSize.height - 65
	local currentWidthNormal = winSize.width - 188 - AdjustUtils.getAdjustX()
	local currentWidthNormalTab = winSize.width - 200 - AdjustUtils.getAdjustX()
	self._scrollViewTab = self._rightTabPanel:getChildByName("scrollViewTab")

	self._scrollViewTab:setScrollBarEnabled(false)

	self._scrollView = self._mainPanel:getChildByFullName("scrollView")

	self._scrollView:setScrollBarEnabled(true)
	self._scrollView:setScrollBarAutoHideTime(9999)
	self._scrollView:setScrollBarColor(cc.c3b(255, 255, 255))
	self._scrollView:setScrollBarAutoHideEnabled(true)
	self._scrollView:setScrollBarWidth(5)
	self._scrollView:setScrollBarOpacity(255)
	self._scrollView:setScrollBarPositionFromCorner(cc.p(21, 20))

	self._cellWidthTab = self._tabClone:getContentSize().width
	self._cellWidthNormal = self._cellCloneNormal:getContentSize().width
	self._cellHeightNormal = self._cellCloneNormal:getContentSize().height
	self._cellHeightNormal = self._cellHeightNormal + 8
end

function ShopMainMediator:refreshView()
	self:setScrollView(true)

	local length = math.ceil(#self._curShopItems / kNums)

	if self:getShopNormalId() == ShopSpecialId.kShopNormal then
		local allHeight = math.max(kCellHeight, self._cellHeightNormal * length - 8)

		self._scrollView:setInnerContainerSize(cc.size(kCellWidth, allHeight))
		self._scrollView:setInnerContainerPosition(cc.p(0, -(allHeight - kCellHeight)))

		for i = 1, length do
			local layout = ccui.Layout:create()

			layout:setContentSize(cc.size(kCellWidth, self._cellHeightNormal))
			layout:addTo(self._scrollView)
			layout:setTag(i)
			layout:setAnchorPoint(cc.p(0, 1))

			local h = allHeight - self._cellHeightNormal * (i - 1) + 8

			layout:setPosition(cc.p(0, h))
			layout:setTouchEnabled(false)
			self:createCell(layout, i)
		end
	end

	self:runListAnim()
end

function ShopMainMediator:resumeBackground()
	self._backgroundBG:loadTexture(kbackgroundPath)
end

function ShopMainMediator:changeBackground(path)
	self._backgroundBG:loadTexture(path)
end

function ShopMainMediator:createCell(cell, index)
	for i = 1, kNums do
		local itemIndex = kNums * (index - 1) + i
		local itemData = self._curShopItems[itemIndex]

		if itemData then
			local item = ShopItem:new()
			local clonePanel = self._cellCloneNormal:clone()

			clonePanel:setVisible(true)
			item:setView(clonePanel, self)
			cell:addChild(item:getView())
			item:getView():setTag(i)

			local x = (i - 1) * (self._cellWidthNormal + 13)
			local y = 0

			item:getView():setPosition(x, y)
			item:getView():setTag(i)

			cell["item" .. i] = item

			item:setInfo(itemData)

			local function callback()
				self:onClickItem(itemData)
			end

			item:setTouchHandler(callback)

			cell["ShopItem" .. i] = item
		end
	end
end

function ShopMainMediator:refreshShopData()
	if not kShopView[self._shopId] then
		self:refreshData()

		local offsety = self._scrollView:getInnerContainerPosition().y

		self:refreshView()
		self._scrollView:setInnerContainerPosition(cc.p(0, offsety))
	end
end

function ShopMainMediator:refreshByRset(event)
	self:forceRefreshRemainTime()
	self._shopSystem:requestGetShop(self._shopId)
	self:refreshShopData()
end

function ShopMainMediator:refreshViewByDimondSuccess(event)
	self:refreshShopData()
end

function ShopMainMediator:onBuyShopItemSuccess(event)
	local shopId = self:transShopNormalToShopId()
	local cache = self._nodeCache[shopId]

	if cache then
		self:refreshShopByTag(shopId)

		cache.isSendRefresh = nil

		AudioEngine:getInstance():playEffect("Se_Alert_Buy", false)

		local data = event:getData().data

		if data and data.rewards and #data.rewards > 0 then
			local view = self:getInjector():getInstance("getRewardView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				maskOpacity = 0
			}, {
				rewards = data.rewards
			}))
		end
	end

	self:refreshShopData()
end

function ShopMainMediator:onBuyShopSurfaceSuccess(event)
	local shopId = self:transShopNormalToShopId()
	local cache = self._nodeCache[shopId]

	if cache then
		self:refreshShopByTag(shopId)

		cache.isSendRefresh = nil
	end

	self:refreshShopData()
end

function ShopMainMediator:onRefreshShopSuccess(event)
	self:forceRefreshRemainTime()

	local shopId = self:transShopNormalToShopId()
	local cache = self._nodeCache[shopId]

	if cache then
		self:refreshShopByTag(shopId)

		cache.isSendRefresh = nil
	end

	self:refreshShopData()
end

function ShopMainMediator:createSchel()
	local function checkTimeFunc()
		local needRefresh = false

		if self._stopRefresh or not self._scrollView then
			return
		end

		local allCells = self._scrollView:getChildren()

		for _, ecell in pairs(allCells) do
			if ecell then
				for i = 1, kNums do
					local cell = ecell["ShopItem" .. i]

					if cell then
						local lastTime = cell:refreshTimePanel()

						if lastTime <= 0 and lastTime > -1 then
							needRefresh = true

							break
						end
					end
				end
			end
		end

		if needRefresh then
			self._stopRefresh = true

			self._shopSystem:requestGetShop(self._shopId, function ()
				self._stopRefresh = false
			end)
		end
	end

	self._timer2 = LuaScheduler:getInstance():schedule(checkTimeFunc, 1, false)

	checkTimeFunc()
end

function ShopMainMediator:initLeftTabController(disOnClickTab)
	self._leftTabPanel:removeAllChildren()

	self._tabBtnWidget = nil
	local config = {
		onClickTab = function (name, tag)
			self:onClickTab(name, tag)
		end
	}
	local btnDatas = {}

	for i = 1, #self._leftArr do
		btnDatas[#btnDatas + 1] = {
			fontSize = 20,
			textOffsety = 7,
			btnOffsetX = 47,
			redPointPosx = 132,
			unEnableOutline = true,
			redPointPosy = 36,
			textOffsetx = -7,
			tabText = self._leftArr[i].name[1],
			tabTextTranslate = self._leftArr[i].name[2],
			tabImage = {
				"sd_btn_z_2.png",
				"sd_btn_z_1.png"
			},
			fontName = CUSTOM_TTF_FONT_1,
			fontColor = cc.c4b(255, 255, 255, 255),
			fontColorSel = cc.c4b(62, 62, 62, 255),
			redPointFunc = function ()
				if self._leftArr[i].shopId == ShopSpecialId.kShopReset then
					return self._shopSystem:getRedPointForShopReset()
				end

				if self._leftArr[i].shopId == ShopSpecialId.kShopPackage then
					return self._shopSystem:getRedPointByPackageType(ShopSpecialId.kShopPackage)
				end

				if self._leftArr[i].shopId == ShopSpecialId.kShopSurfacePackage then
					return self._shopSystem:getRedPointByPackageType(ShopSpecialId.kShopSurfacePackage)
				end

				if self._leftArr[i].shopId == ShopSpecialId.kShopTimeLimit then
					return self._shopSystem:getRedPointByPackageType(ShopSpecialId.kShopTimeLimit)
				end

				if self._leftArr[i].shopId == ShopSpecialId.kShopMonthcard then
					return self._shopSystem:getRedPointForMonthcard()
				end

				return false
			end
		}
	end

	config.btnDatas = btnDatas
	local injector = self:getInjector()
	local widget = TabBtnWidget:createWidgetNode1()
	self._tabBtnWidget = self:autoManageObject(injector:injectInto(TabBtnWidget:new(widget)))

	self._tabBtnWidget:initTabBtn(config, {
		hideBtnAnim = true,
		ignoreSound = true,
		ignoreRedSelectState = true,
		noCenterBtn = true,
		disMovieClip = true
	})
	self._tabBtnWidget:selectTabByTag(self._leftTabIndex, disOnClickTab)

	local view = self._tabBtnWidget:getMainView()

	view:addTo(self._leftTabPanel):posite(0, 0)
	view:setLocalZOrder(1100)
end

function ShopMainMediator:initRightTabController()
	self._tabBtns = {}
	self._cacheViewsName = {}
	self._ignoreSound = true

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

		self._tabBtns[#self._tabBtns + 1] = btn

		btn:addClickEventListener(function ()
			self:onClickTabBtns(_, i)
		end)
	end

	self:setTabStatus()
end

function ShopMainMediator:setTabStatus()
	for i = 1, #self._tabBtns do
		self._tabBtns[i]:getChildByFullName("dark_1"):setVisible(i ~= self._rightTabIndex)
		self._tabBtns[i]:getChildByFullName("light_1"):setVisible(i == self._rightTabIndex)
	end
end

function ShopMainMediator:checkIsNormalShop()
	local normalShops = ConfigReader:getRecordById("ConfigValue", "Shop_ShowSequence").content
	local shop = self:getShopNormalId()

	if shop == ShopSpecialId.kShopNormal or table.indexof(normalShops, shop) then
		return true
	end

	return false
end

function ShopMainMediator:onClickTabBtns(name, tag)
	if self:checkIsNormalShop() then
		self._rightTabIndex = tag
		local shopId = self._shopTabList[self._rightTabIndex].shopId
		self._shopId = shopId

		if not kShopView[self._shopId] then
			local shopGroup = self._shopSystem:getShopGroupById(shopId)
			self._curShopItems = shopGroup:getGoodsList()

			self:setLayout()

			if not self._ignoreSound then
				AudioEngine:getInstance():playEffect("Se_Click_Tab_4", false)
			else
				self._ignoreSound = false
			end

			self:refreshView()
		end

		self:setTabStatus()
	end

	if self._ignoreSound then
		self._ignoreSound = false
	end
end

function ShopMainMediator:onClickTab(name, tag)
	self._leftTabIndex = tag
	local shopId = ""
	shopId = self._leftArr[self._leftTabIndex].shopId
	self._shopId = shopId

	self._rightTabPanel:setVisible(self:getShopNormalId() == ShopSpecialId.kShopNormal)
	self._refreshPanel:setVisible(self:getShopNormalId() == ShopSpecialId.kShopNormal)
	self:refreshData()
	self:checkIsShowShopSellView()
	self:resumeBackground()
	self:resetView()

	if kShopView[self._shopId] then
		self:setScrollView(false)

		local shopId = self:transShopNormalToShopId()

		self:refreshTopInfo(shopId)
	else
		self:setLayout()
		self:refreshView()
	end
end

function ShopMainMediator:setScrollView(status)
	self:getView():stopAllActions()
	self:stopItemActions()
	self._scrollView:removeAllChildren()
	self._scrollView:setVisible(status)
	self._scrollBarBg:setVisible(status)
end

function ShopMainMediator:resetView()
	if self._shopId == ShopSpecialId.kShopSurface then
		if self._enterData then
			self:showSurfaceShop()
		else
			self._shopSystem:requestGetSurfaceShop()
		end
	elseif self._shopId == ShopSpecialId.KShopTimelimitedmall then
		if self._enterData then
			self:showPackageShop()
		else
			self._shopSystem:requestGetPackageShop()
		end
	else
		if not self._viewCache[self._shopId] and kShopView[self._shopId] then
			local view = self:getInjector():getInstance(kShopView[self._shopId])

			if view then
				view:addTo(self._mainPanel)
				AdjustUtils.adjustLayoutUIByRootNode(view)
				view:setPosition(0, 0)

				local mediator = self:getMediatorMap():retrieveMediator(view)

				if mediator then
					view.mediator = mediator

					mediator:setupView(self)
				end

				self._viewCache[self._shopId] = view
			end
		end

		for shopId, view in pairs(self._viewCache) do
			if self._shopId == shopId then
				view:setVisible(true)
				view.mediator:refreshData({
					shopId = self._shopId,
					enterData = self._enterData,
					parentMediator = self
				})
				view.mediator:refreshView()

				self._enterData = nil
			end
		end
	end

	for shopId, view in pairs(self._viewCache) do
		if shopId ~= self._shopId then
			view.mediator:clearView()
			view:setVisible(false)
		end
	end
end

function ShopMainMediator:getCurShopId()
	return self._shopId
end

function ShopMainMediator:showSurfaceShop()
	local shopId = ShopSpecialId.kShopSurface

	if shopId ~= self._shopId then
		return
	end

	if not self._viewCache[shopId] and kShopView[shopId] then
		local view = self:getInjector():getInstance(kShopView[shopId])

		if view then
			view:addTo(self._mainPanel)
			AdjustUtils.adjustLayoutUIByRootNode(view)
			view:setPosition(0, 0)

			local mediator = self:getMediatorMap():retrieveMediator(view)

			if mediator then
				view.mediator = mediator
			end

			self._viewCache[shopId] = view
		end
	end

	self._viewCache[shopId]:setVisible(true)
	self._viewCache[shopId].mediator:refreshData()
	self._viewCache[shopId].mediator:setupView(self)

	self._enterData = nil
end

function ShopMainMediator:showPackageShop()
	local shopId = self._shopId

	if not self._viewCache[shopId] and kShopView[shopId] then
		local view = self:getInjector():getInstance(kShopView[shopId])

		if view then
			view:addTo(self._mainPanel)
			AdjustUtils.adjustLayoutUIByRootNode(view)
			view:setPosition(0, 0)

			local mediator = self:getMediatorMap():retrieveMediator(view)

			if mediator then
				view.mediator = mediator

				mediator:setupView(self)
			end

			self._viewCache[shopId] = view
		end
	end

	self._viewCache[shopId]:setVisible(true)
	self._viewCache[shopId].mediator:refreshData({
		shopId = self._shopId,
		enterData = self._enterData,
		parentMediator = self,
		rightTabIndex = self._data.rightTabIndex,
		subId = self._data.subid,
		packageId = self._data.packageId
	})
	self._viewCache[shopId].mediator:refreshView()

	self._enterData = nil
end

function ShopMainMediator:checkIsShowShopSellView()
	if not self._showSell or not self:checkIsNormalShop() then
		return
	end

	if self._shopSystem:isShowShopSellView() then
		self:showShopSellView()

		self._showSell = false
	end
end

function ShopMainMediator:setLayout()
	local shopId = self:transShopNormalToShopId()

	self:refreshTopInfo(shopId)
	self:refreshShopByTag(shopId)
	self:refreshTime(shopId)
end

function ShopMainMediator:forceRefreshRemainTime()
	local systemTime = self._shopSystem:getCurSystemTime()

	for shopId, cache in pairs(self._nodeCache) do
		local shopGroup = self._shopSystem:getShopGroupById(shopId)
		local nextTime = shopGroup:getUpdateTime()

		if nextTime and nextTime - systemTime > 0 then
			self._nodeCache[shopId].remainTime = nextTime
		end
	end
end

function ShopMainMediator:refreshShopByTag(shopId)
	local shopGroup = self._shopSystem:getShopGroupById(shopId)
	local times = shopGroup:getRemainRefreshTimes()

	self._refreshPanel:getChildByFullName("refresh_btn"):setGray(times == 0)
end

function ShopMainMediator:refreshTime(shopId)
	shopId = shopId or self:transShopNormalToShopId()
	local cache = self._nodeCache[shopId]

	if not cache then
		return
	end

	local shopGroup = self._shopSystem:getShopGroupById(shopId)
	local hasResetTime = self._shopSystem:hasResetTime(shopId)
	local maxTimes = shopGroup:getRefreshMaxTimes()

	if cache.remainTime and hasResetTime and maxTimes ~= 0 then
		self._refreshPanel:setVisible(true)

		if cache.remainTime >= 0 then
			local remoteTimestamp = self:getInjector():getInstance("GameServerAgent"):remoteTimestamp()
			local remainTime = cache.remainTime - remoteTimestamp
			local str = TimeUtil:formatTime("${d}:${HH}:${MM}:${SS}", remainTime)
			local strArr = string.split(str, ":")

			if tonumber(strArr[1]) > 0 then
				self._refreshTime:setString(strArr[1] .. Strings:get("TimeUtil_Day"))
			else
				self._refreshTime:setString(strArr[2] .. ":" .. strArr[3] .. ":" .. strArr[4])
			end
		else
			self._refreshPanel:setVisible(false)
		end
	else
		self._refreshPanel:setVisible(false)
	end
end

function ShopMainMediator:reduceTime()
	for shopId, cache in pairs(self._nodeCache) do
		if self._nodeCache[shopId].remainTime then
			local remoteTimestamp = self:getInjector():getInstance("GameServerAgent"):remoteTimestamp()
			local remainTime = self._nodeCache[shopId].remainTime - remoteTimestamp
			local hasResetTime = self._shopSystem:hasResetTime(shopId)

			if remainTime <= 0 and not self._nodeCache[shopId].isSendRefresh and hasResetTime then
				self._nodeCache[shopId].remainTime = 0

				self._shopSystem:requestGetShop(shopId)

				self._nodeCache[shopId].isSendRefresh = true
			end
		end
	end
end

function ShopMainMediator:onClickItem(data)
	local isOpen, lockTip, unLockLevel = data:getCondition()

	if not isOpen then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = lockTip
		}))

		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Select_1", false)

	local stock = data:getStock()

	if stock == 0 then
		return
	end

	self:showShopBuyViewNormal(data)
end

function ShopMainMediator:onBackClicked()
	self:dismissWithOptions({
		transition = ViewTransitionFactory:create(ViewTransitionType.kCommonAreaView)
	})
end

function ShopMainMediator:onCurrencyClicked(sender, eventType)
	local shopId = self:transShopNormalToShopId()

	if self._nodeCache[shopId] and self._nodeCache[shopId].currencyTips then
		if eventType == ccui.TouchEventType.began then
			AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
			self._nodeCache[shopId].currencyTips:setVisible(true)
		elseif eventType == ccui.TouchEventType.ended or eventType == ccui.TouchEventType.canceled then
			self._nodeCache[shopId].currencyTips:setVisible(false)
		end
	end
end

function ShopMainMediator:onTick(dt)
	self:reduceTime()
	self:refreshTime()
end

function ShopMainMediator:onClickRefresh()
	local shopId = self:transShopNormalToShopId()
	local shopGroup = self._shopSystem:getShopGroupById(shopId)
	local times = shopGroup:getRemainRefreshTimes()

	if times < 1 then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = Strings:get("SHOP_Text_14")
		}))

		return true
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_2", false)
	self:showShopRefreshView(shopGroup)
end

function ShopMainMediator:showShopSellView()
	local view = self:getInjector():getInstance("ShopSellView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {}))
end

function ShopMainMediator:showShopBuyView(data)
	local view = self:getInjector():getInstance("ShopBuyView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		itemData = data
	}))
end

function ShopMainMediator:showShopBuyViewNormal(data)
	local view = self:getInjector():getInstance("ShopBuyNormalView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		itemData = data
	}))
end

function ShopMainMediator:showShopRefreshView(data)
	local view = self:getInjector():getInstance("ShopRefreshView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data))
end

function ShopMainMediator:onBuyPackageSuccCallback(event)
	self._fresh = nil

	self:createLeftShopConfig()
	self:initLeftTabController(not self._fresh)
end

function ShopMainMediator:stopItemActions()
	if DisposableObject:isDisposed(self) then
		return
	end

	local v = 6
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

function ShopMainMediator:runListAnim()
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
