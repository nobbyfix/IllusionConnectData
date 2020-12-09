ShopBuyMonthCardFMediator = class("ShopBuyMonthCardFMediator", DmPopupViewMediator, _M)

ShopBuyMonthCardFMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ShopBuyMonthCardFMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
ShopBuyMonthCardFMediator:has("_rechargeAndVipSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")

local kBtnHandlers = {
	["main.btnBuy"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickedBuyBtn"
	}
}

function ShopBuyMonthCardFMediator:initialize()
	super.initialize(self)
end

function ShopBuyMonthCardFMediator:dispose()
	super.dispose(self)
end

function ShopBuyMonthCardFMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_FefreshForeverCard, self, self.refreshForeverView)
end

function ShopBuyMonthCardFMediator:enterWithData(data)
	self._data = data.item
	self._callBack = data.callback or nil

	self:initMember()
	self:refreshData()
	self:refreshView()
	self._rechargeAndVipSystem:requestFefreshForeverCard()
end

function ShopBuyMonthCardFMediator:refreshForeverView()
	self:refreshData()
	self:refreshView()
end

function ShopBuyMonthCardFMediator:initMember()
	self._view = self:getView()
	local mainPanel = self._view:getChildByFullName("main")
	self._iconLayout = mainPanel:getChildByFullName("iconPanel")
	self._noBuyPanel = mainPanel:getChildByFullName("noBuyPanel")
	self._moneySymbol = mainPanel:getChildByFullName("noBuyPanel.moneySymbol")
	self._moneyNum = mainPanel:getChildByFullName("noBuyPanel.moneyNum")
	self._per = mainPanel:getChildByFullName("noBuyPanel.per")
	self._getText = mainPanel:getChildByFullName("getText")
	self._btnBuy = mainPanel:getChildByFullName("btnBuy")
	self._getRewardPanel = mainPanel:getChildByFullName("getRewardPanel")
	self._physicalPanel = self._getRewardPanel:getChildByFullName("physicalPanel")

	self._physicalPanel:addClickEventListener(function ()
		self:onClickPhysicalPanel()
	end)

	self._rewardPanel = self._getRewardPanel:getChildByFullName("rewardPanel")
	self._listView = self._view:getChildByFullName("main.listView")
end

function ShopBuyMonthCardFMediator:refreshData()
	self._data = self._shopSystem:getPackageListDirectPurchaseMCF()
end

function ShopBuyMonthCardFMediator:refreshView()
	self:refreshIcon()
	self:refreshBuyStatus()
	self:setRedPointForMonthCardF()
	self._listView:removeAllChildren()
	self._listView:setScrollBarEnabled(false)

	local desc = self._view:getChildByFullName("main.desc")

	desc:setVisible(false)

	local s = desc:getContentSize()
	local node = desc:clone()

	node:setPosition(cc.p(0, 0))
	node:setVisible(true)
	node:setString(Strings:get("MonthCardForever_Desc"))
	node:getVirtualRenderer():setDimensions(self._listView:getContentSize().width, 0)
	node:getVirtualRenderer():setLineSpacing(5)
	self._listView:pushBackCustomItem(node)
end

function ShopBuyMonthCardFMediator:refreshIcon()
	self._iconLayout:removeAllChildren()

	local pic = self._data._buyIcon

	if pic == nil or pic == "" then
		pic = self._data._icon
	end

	local icon = ccui.ImageView:create("asset/ui/shop/" .. pic .. ".png")

	if icon then
		self._iconLayout:addChild(icon)
		icon:setAnchorPoint(cc.p(0.5, 0.5))

		local pos = cc.p(self._iconLayout:getContentSize().width / 2, self._iconLayout:getContentSize().height / 2)

		icon:setPosition(pos)
	end
end

function ShopBuyMonthCardFMediator:refreshBuyStatus()
	self._btnBuy:setVisible(false)
	self._getRewardPanel:setVisible(false)
	self._getText:setVisible(false)
	self._noBuyPanel:setVisible(false)

	if self._data._fCardBuyFlag then
		self._getText:setVisible(true)

		if self._data._fCardWeekFlag and self._data._fCardWeekFlag.value > 0 then
			self._rewardPanel:getChildByFullName("icon"):setColor(cc.c3b(125, 125, 125))
			self._rewardPanel:getChildByFullName("getEndBg"):setVisible(true)
		else
			self._rewardPanel:getChildByFullName("getEndBg"):setVisible(false)
		end

		self:createRewardIcon()
		mapButtonHandlerClick(self, self._getRewardPanel, "onClickRewardPanel", nil, true)
		self._getRewardPanel:setVisible(true)

		local r = self._data._fCardStamina / self._data._staminaLimit
		local ratia = tonumber(string.format("%.2f", tostring(r)))

		self._physicalPanel:getChildByFullName("LoadingBar"):setPercent(ratia * 100)
		self._physicalPanel:getChildByFullName("cur"):setString(self._data._fCardStamina .. "/" .. self._data._staminaLimit)
	else
		local payOffSystem = DmGame:getInstance()._injector:getInstance(PayOffSystem)
		local symbol, price = payOffSystem:getPaySymbolAndPrice(self._data._payId)

		self._moneySymbol:setString(symbol)
		self._moneyNum:setString(price)
		self._moneyNum:setPositionX(94 + self._moneySymbol:getContentSize().width + 2)
		self._per:setPositionX(94 + self._moneySymbol:getContentSize().width + self._moneyNum:getContentSize().width + 8)
		self._btnBuy:setVisible(true)
		self._noBuyPanel:setVisible(true)
	end
end

function ShopBuyMonthCardFMediator:createRewardIcon()
	local rewards = RewardSystem:getRewardsById(tostring(self._data._weekReward))
	local rewardData = rewards[1]
	local iconBg = self._rewardPanel:getChildByFullName("icon")

	iconBg:removeAllChildren()

	if rewardData then
		local icon = IconFactory:createRewardIcon(rewardData, {
			showAmount = true,
			isWidget = true
		})

		IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewardData, {
			needDelay = true
		})
		icon:setScaleNotCascade(0.5)
		icon:addTo(iconBg):center(iconBg:getContentSize())
	end
end

function ShopBuyMonthCardFMediator:onClickedBuyBtn()
	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
	self._rechargeAndVipSystem:requestBuyForeverCard()
	self:close()
end

function ShopBuyMonthCardFMediator:onClickRewardPanel()
	if self._data._fCardWeekFlag and self._data._fCardWeekFlag.value > 0 then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)

		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
	self._rechargeAndVipSystem:requestFCardWeekReward()
	self:close()
end

function ShopBuyMonthCardFMediator:onClickPhysicalPanel()
	local function callback()
		if self._data._fCardStamina <= 0 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Error_12417")
			}))

			return
		end

		local developSystem = self:getInjector():getInstance("DevelopSystem")
		self._bagSystem = developSystem:getBagSystem()
		local curPower, lastRecoverTime = self._bagSystem:getPower()

		if self._data._stamina_Max <= self._data._fCardStamina + curPower then
			self:getPower()

			return
		end

		self._rechargeAndVipSystem:requestFCardStaminaReward(nil, self._data._fCardStamina)
		self:close()
	end

	self._rechargeAndVipSystem:requestFefreshForeverCard(callback)
end

function ShopBuyMonthCardFMediator:getPower(taskData)
	AudioEngine:getInstance():playEffect("Se_Click_Common_2", false)

	local function func()
		self._rechargeAndVipSystem:requestFCardStaminaReward(nil, self._data._fCardStamina)
		self:close()
	end

	local outSelf = self
	local delegate = {
		willClose = function (self, popupMediator, data)
			if data.response == "ok" then
				func()
			elseif data.response == "cancel" then
				-- Nothing
			elseif data.response == "close" then
				-- Nothing
			end
		end
	}
	local data = {
		title = Strings:get("MonthCardForever_Overflow_Title"),
		title1 = Strings:get("UITitle_EN_Tiliyichu"),
		content = Strings:get("MonthCardForever_Overflow_Desc"),
		sureBtn = {},
		cancelBtn = {}
	}
	local view = self:getInjector():getInstance("AlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end

function ShopBuyMonthCardFMediator:setRedPointForMonthCardF()
	local redPoint = self._rewardPanel:getChildByName("redPoint" .. "rewardPanel")

	if not redPoint then
		redPoint = RedPoint:createDefaultNode()

		redPoint:addTo(self._rewardPanel):posite(72, 60)
		redPoint:setLocalZOrder(99900)
		redPoint:setName("redPoint" .. "rewardPanel")
	end

	redPoint:setVisible(self._shopSystem:getRedPointForMCFWeekFlag())

	local redPoint = self._rewardPanel:getChildByName("redPoint" .. "physicalPanel")

	if not redPoint then
		redPoint = RedPoint:createDefaultNode()

		redPoint:addTo(self._physicalPanel):posite(70, 90)
		redPoint:setLocalZOrder(99900)
		redPoint:setName("redPoint" .. "physicalPanel")
	end

	redPoint:setVisible(self._shopSystem:getRedPointForMCFStamina())
end
