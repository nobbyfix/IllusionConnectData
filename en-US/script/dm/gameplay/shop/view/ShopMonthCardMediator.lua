ShopMonthCardMediator = class("ShopMonthCardMediator", DmAreaViewMediator, _M)

ShopMonthCardMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
ShopMonthCardMediator:has("_rechargeSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")
ShopMonthCardMediator:has("_rechargeAndVipModel", {
	is = "r"
}):injectWith("RechargeAndVipModel")
ShopMonthCardMediator:has("_rechargeAndVipSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")

local kBtnHandlers = {
	["main.panelBg.vipBtn"] = {
		clickAction = true,
		clickAudio = "Se_Click_Common_1",
		func = "onClickVipBtn"
	},
	["main.panelBg.mkBtn"] = {
		clickAction = true,
		clickAudio = "Se_Click_Common_1",
		func = "onClickMkBtn"
	},
	["main.panelBg.dyBtn"] = {
		clickAction = true,
		clickAudio = "Se_Click_Common_1",
		func = "onClickDyBtn"
	},
	["main.panelBg.vipBtn.buyEndTip.getBtn"] = {
		clickAction = true,
		clickAudio = "Se_Click_Common_1",
		func = "onClickVipBtn"
	}
}

function ShopMonthCardMediator:initialize()
	super.initialize(self)
end

function ShopMonthCardMediator:dispose()
	self:getView():stopAllActions()
	super.dispose(self)
end

function ShopMonthCardMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListeners()
end

function ShopMonthCardMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), PAY_INIT_SUCCESS, self, self.refreshShopData)
	self:mapEventListener(self:getEventDispatcher(), EVT_BUY_MONTHCARD_SUCC, self, self.refreshShopData)
	self:mapEventListener(self:getEventDispatcher(), EVT_FefreshForeverCard, self, self.refreshForeverView)
end

function ShopMonthCardMediator:onRemove()
	super.onRemove(self)
end

function ShopMonthCardMediator:setupView()
	self:initMember()
end

function ShopMonthCardMediator:clearView()
	self:getView():stopAllActions()
end

function ShopMonthCardMediator:initMember()
	self._vipBtn = self:getView():getChildByFullName("main.panelBg.vipBtn")
	self._mkBtn = self:getView():getChildByFullName("main.panelBg.mkBtn")
	self._dyBtn = self:getView():getChildByFullName("main.panelBg.dyBtn")

	self:adjustView()
end

function ShopMonthCardMediator:adjustView()
end

function ShopMonthCardMediator:refreshData(data)
	self._shopId = data.shopId or nil
	self._parentMediator = data.parentMediator or nil
	self._enterData = data.enterData or nil

	self:setData()
end

function ShopMonthCardMediator:setData()
	self._data = self._shopSystem:getPackageListMonthcardMap()
end

function ShopMonthCardMediator:refreshView()
	self:getView():stopAllActions()
	self:setMonthCardView()
	self:setMonthCardViewF()
	self:setMonthCardSubscribeView()
	self:urlEnter()
end

function ShopMonthCardMediator:urlEnter()
	if self._enterData and self._enterData.packageId then
		if self._enterData.packageId == KMonthCardType.KMonthCardForever then
			self:onClickVipBtn()
		elseif self._enterData.packageId == KMonthCardType.KMonthCard then
			self:onClickMkBtn()
		elseif self._enterData.packageId == KMonthCardType.KMonthCardSubscribe then
			self:onClickDyBtn()
		end

		self._enterData = nil
	end
end

function ShopMonthCardMediator:setMonthCardView()
	local data = self._data[KMonthCardType.KMonthCard]
	local buyTip = self._mkBtn:getChildByFullName("buyTip")
	local buyEndTip = self._mkBtn:getChildByFullName("buyEndTip")

	buyTip:setVisible(false)
	buyEndTip:setVisible(false)

	local payOffSystem = DmGame:getInstance()._injector:getInstance(PayOffSystem)
	local sym, price = payOffSystem:getPaySymbolAndPrice(data._payId)

	if data._endTimes == -1 then
		buyTip:setVisible(true)

		local symbol = buyTip:getChildByFullName("symbol")
		local money = buyTip:getChildByFullName("money")
		local per = buyTip:getChildByFullName("per")

		symbol:setString(sym)
		money:setString(price)
		money:setPositionX(symbol:getPositionX() + symbol:getContentSize().width)
		per:setPositionX(money:getPositionX() + money:getContentSize().width)
	else
		buyEndTip:setVisible(true)

		local sy = buyEndTip:getChildByFullName("sy")
		local times = buyEndTip:getChildByFullName("times")
		local per = buyEndTip:getChildByFullName("per")
		local buytxt = buyEndTip:getChildByFullName("buytxt")
		local endTimes = data._endTimes
		local lastTimes = data._lastRewardTimes
		local remainDays = self._rechargeAndVipSystem:getRemainDays(data._id)

		times:setString(tostring(remainDays))
		per:setPositionX(times:getPositionX() + times:getContentSize().width)

		if remainDays < data._dangerTime then
			times:setColor(cc.c3b(255, 73, 73))
		else
			times:setColor(cc.c3b(91, 230, 255))
		end

		local canContinueBuy = self._rechargeAndVipSystem:getCanContinueBuy(data._id)

		if canContinueBuy then
			buytxt:setString(Strings:get("MonthCard_Button_Renew"))
		else
			buytxt:setString(Strings:get("MonthCard_1_Button2_Received"))
		end
	end
end

function ShopMonthCardMediator:setMonthCardViewF(panel, data)
	local data = self._data[KMonthCardType.KMonthCardForever]
	local buyTip = self._vipBtn:getChildByFullName("buyTip")
	local buyEndTip = self._vipBtn:getChildByFullName("buyEndTip")

	buyTip:setVisible(false)
	buyEndTip:setVisible(false)

	local payOffSystem = DmGame:getInstance()._injector:getInstance(PayOffSystem)
	local sym, price = payOffSystem:getPaySymbolAndPrice(data._payId)

	if data._fCardBuyFlag then
		buyEndTip:setVisible(true)

		local sy = buyEndTip:getChildByFullName("sy")
		local times = buyEndTip:getChildByFullName("times")
		local per = buyEndTip:getChildByFullName("per")
		local buytxt = buyEndTip:getChildByFullName("buytxt")

		if data._fCardWeekFlag and data._fCardWeekFlag.value > 0 then
			if data._staminaLimit <= data._fCardStamina then
				buytxt:setString(Strings:get("MonthCardForever_Button_PowerMax"))
			else
				buytxt:setString(Strings:get("MonthCardForever_Button_NextWeek"))
			end
		else
			buytxt:setString(Strings:get("MonthCardForever_Button_Receive"))
		end
	else
		buyTip:setVisible(true)

		local symbol = buyTip:getChildByFullName("symbol")
		local money = buyTip:getChildByFullName("money")

		symbol:setString(sym)
		money:setString(price)
		money:setPositionX(symbol:getPositionX() + symbol:getContentSize().width)
	end

	self:setRedPointForMonthCardF()
end

function ShopMonthCardMediator:setRedPointForMonthCardF()
	local redPoint = self._vipBtn:getChildByName("redPoint" .. KMonthCardType.KMonthCardForever)

	if not redPoint then
		redPoint = RedPoint:createDefaultNode()

		redPoint:addTo(self._vipBtn):posite(190, 484)
		redPoint:setLocalZOrder(99900)
		redPoint:setName("redPoint" .. KMonthCardType.KMonthCardForever)
	end

	redPoint:setVisible(self._shopSystem:getRedPointForMCFStamina() or self._shopSystem:getRedPointForMCFWeekFlag())
end

function ShopMonthCardMediator:setMonthCardSubscribeView(panel, data)
	local data = self._data[KMonthCardType.KMonthCardSubscribe]

	if not data then
		self._dyBtn:setVisible(false)

		return
	end

	self._dyBtn:setVisible(true)

	local buyTip = self._dyBtn:getChildByFullName("buyTip")
	local buyEndTip = self._dyBtn:getChildByFullName("buyEndTip")

	buyTip:setVisible(false)
	buyEndTip:setVisible(false)

	local payOffSystem = DmGame:getInstance()._injector:getInstance(PayOffSystem)
	local sym, price = payOffSystem:getPaySymbolAndPrice(data._payId)
	local subscribeIsPurchased = self._rechargeAndVipModel:getIsPurchased()
	local subscribeEndTime = self._rechargeAndVipModel:getEndTime()
	local subscribeType = self._rechargeAndVipModel:getType()
	local device = self._shopSystem:getPlatform()

	if device == "ios" then
		if subscribeIsPurchased then
			local remainDays = self._rechargeAndVipSystem:getRemainDaysForSubscribe()

			buyEndTip:setVisible(true)

			local sy = buyEndTip:getChildByFullName("sy")
			local times = buyEndTip:getChildByFullName("times")
			local per = buyEndTip:getChildByFullName("per")
			local buytxt = buyEndTip:getChildByFullName("buytxt")

			times:setString(tostring(remainDays))
			per:setPositionX(times:getPositionX() + times:getContentSize().width)

			if remainDays < data._dangerTime then
				times:setColor(cc.c3b(255, 73, 73))
			else
				times:setColor(cc.c3b(91, 230, 255))
			end
		elseif data._endTimes == -1 then
			buyTip:setVisible(true)

			local symbol = buyTip:getChildByFullName("symbol")
			local money = buyTip:getChildByFullName("money")

			symbol:setString(sym)
			money:setString(price)
			money:setPositionX(symbol:getPositionX() + symbol:getContentSize().width)
		else
			local endTimes = data._endTimes
			local lastTimes = data._lastRewardTimes
			local remainDays = self._rechargeAndVipSystem:getRemainDays(data._id)

			buyEndTip:setVisible(true)

			local times = buyEndTip:getChildByFullName("times")
			local per = buyEndTip:getChildByFullName("per")

			times:setString(tostring(remainDays))
			per:setPositionX(times:getPositionX() + times:getContentSize().width)

			if remainDays < data._dangerTime then
				times:setColor(cc.c3b(255, 73, 73))
			else
				times:setColor(cc.c3b(91, 230, 255))
			end
		end
	elseif data._endTimes == -1 then
		if not subscribeIsPurchased then
			buyTip:setVisible(true)

			local symbol = buyTip:getChildByFullName("symbol")
			local money = buyTip:getChildByFullName("money")

			symbol:setString(sym)
			money:setString(price)
			money:setPositionX(symbol:getPositionX() + symbol:getContentSize().width)
		else
			local remainDays = self._rechargeAndVipSystem:getRemainDaysForSubscribe()

			buyEndTip:setVisible(true)

			local times = buyEndTip:getChildByFullName("times")
			local per = buyEndTip:getChildByFullName("per")

			times:setString(tostring(remainDays))
			per:setPositionX(times:getPositionX() + times:getContentSize().width)

			if remainDays < data._dangerTime then
				times:setColor(cc.c3b(255, 73, 73))
			else
				times:setColor(cc.c3b(91, 230, 255))
			end
		end
	else
		local endTimes = data._endTimes
		local lastTimes = data._lastRewardTimes
		local remainDays = self._rechargeAndVipSystem:getRemainDays(data._id)

		buyEndTip:setVisible(true)

		local times = buyEndTip:getChildByFullName("times")
		local per = buyEndTip:getChildByFullName("per")

		times:setString(tostring(remainDays))
		per:setPositionX(times:getPositionX() + times:getContentSize().width)

		if remainDays < data._dangerTime then
			times:setColor(cc.c3b(255, 73, 73))
		else
			times:setColor(cc.c3b(91, 230, 255))
		end

		local canContinueBuy = self._rechargeAndVipSystem:getCanContinueBuy(data._id)

		if not canContinueBuy then
			local bg = self._dyBtn:getChildByFullName("bg")

			bg:loadTexture("asset/ui/shop/sd_yk_img_ios.png")
			buyEndTip:setVisible(false)
		end
	end
end

function ShopMonthCardMediator:refreshShopData()
	self:setData()
	self:refreshView()
end

function ShopMonthCardMediator:refreshForeverView()
	self:refreshShopData()
end

function ShopMonthCardMediator:onClickVipBtn()
	local data = self._data[KMonthCardType.KMonthCardForever]
	local view = self:getInjector():getInstance("ShopBuyMonthCardFView")

	self:openBuyView(data, view)
end

function ShopMonthCardMediator:onClickMkBtn()
	local data = self._data[KMonthCardType.KMonthCard]
	local view = self:getInjector():getInstance("ShopBuyMonthCardView")

	self:openBuyView(data, view)
end

function ShopMonthCardMediator:onClickDyBtn()
	local data = self._data[KMonthCardType.KMonthCardSubscribe]
	local view = self:getInjector():getInstance("ShopBuyMonthCardView")

	self:openBuyView(data, view)
end

function ShopMonthCardMediator:openBuyView(data, view)
	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		shopId = ShopSpecialId.kShopPackage,
		item = data
	}))
end
