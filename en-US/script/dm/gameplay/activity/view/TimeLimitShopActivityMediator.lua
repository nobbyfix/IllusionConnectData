TimeLimitShopActivityMediator = class("TimeLimitShopActivityMediator", DmPopupViewMediator, _M)

TimeLimitShopActivityMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")
TimeLimitShopActivityMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
TimeLimitShopActivityMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
TimeLimitShopActivityMediator:has("_bagSystem", {
	is = "r"
}):injectWith("BagSystem")

local btnHandlers = {
	["main.btn_close"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickClose"
	}
}

function TimeLimitShopActivityMediator:initialize()
	super.initialize(self)
end

function TimeLimitShopActivityMediator:dispose()
	super.dispose(self)

	if self._timeLimitShopTimer then
		self._timeLimitShopTimer:stop()

		self._timeLimitShopTimer = nil
	end
end

function TimeLimitShopActivityMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(btnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_BUY_PACKAGE_SUCC, self, self.setUpPackageState)
end

function TimeLimitShopActivityMediator:onRemove()
	super.onRemove(self)
end

function TimeLimitShopActivityMediator:enterWithData(data)
	self._activity = data.activity
	self._activityConfig = self._activity:getConfig().ActivityConfig

	self:setupView()
end

function TimeLimitShopActivityMediator:setupView()
	self._view = self:getView()
	self._main = self._view:getChildByName("main")
	self._deadline = self._main:getChildByFullName("deadline")
	self._packageUI = {
		self._main:getChildByFullName("package_1"),
		self._main:getChildByFullName("package_2"),
		self._main:getChildByFullName("package_3")
	}

	self:enableTimeLimitShopTimer()
	self:setUpPackageState()
	self:setupAnim()
end

function TimeLimitShopActivityMediator:setupAnim()
	local action = cc.CSLoader:createTimeline("asset/ui/TimeShopActivity.csb")

	self._main:runAction(action)
	action:clearFrameEventCallFunc()
	action:gotoFrameAndPlay(0, 30, false)
end

function TimeLimitShopActivityMediator:setUpPackageState()
	local timePurchaseIds = self._activityConfig.TimePurchaseId

	table.sort(timePurchaseIds, function (a, b)
		local aShop = self._shopSystem:getPackageById(a)
		local bShop = self._shopSystem:getPackageById(b)

		return aShop:getSort() < bShop:getSort()
	end)

	for i = 1, #timePurchaseIds do
		local packageId = timePurchaseIds[i]
		local itemUI = self._packageUI[i]
		local packageShop = self._shopSystem:getPackageById(packageId)

		if itemUI then
			itemUI:setName(packageId)
			self:setPackageItemInfo(itemUI, packageShop)
			itemUI:addTouchEventListener(function (sender, eventType)
				if eventType == ccui.TouchEventType.ended then
					self:onBuyItem(packageId)
				end
			end)
		end
	end
end

function TimeLimitShopActivityMediator:setPackageItemInfo(cell, data)
	local panel = cell:getChildByFullName("cell")
	local iconLayout = panel:getChildByFullName("icon_layout")
	local nameText = panel:getChildByFullName("goods_name")
	local money_icon = panel:getChildByFullName("money_layout.money_icon")

	money_icon:removeAllChildren()

	local moneyText = panel:getChildByFullName("money_layout.money")
	local discountPanel = panel:getChildByFullName("costOffTagPanel")
	local discountText = panel:getChildByFullName("costOffTagPanel.number")
	local leaveTimesText = panel:getChildByFullName("info_panel.duihuan_text")
	local priceText = panel:getChildByFullName("money_layout.price")

	priceText:removeAllChildren()

	local mask = cell:getChildByFullName("mask")
	local bg_buy = panel:getChildByName("bg_buy")
	local bg = panel:getChildByName("bg")
	local xian = panel:getChildByFullName("money_layout.xian")
	local isFree = data:getIsFree()

	nameText:setString(data:getName())

	if isFree == 1 then
		moneyText:setString(Strings:get("Recruit_Free"))
		moneyText:setPositionX(65)
		discountPanel:setVisible(false)
		priceText:setVisible(false)
		xian:setVisible(false)
	elseif isFree == 2 then
		local goldIcon = IconFactory:createResourcePic({
			id = data:getGameCoin().type
		})

		goldIcon:addTo(money_icon):center(money_icon:getContentSize()):offset(0, 0)
		moneyText:setString(tostring(data:getGameCoin().amount))
		moneyText:setPositionX(85)
		discountPanel:setVisible(true)
		discountText:setString(tostring(data:getCostOff() * 100) .. "%")
		priceText:setVisible(true)
		priceText:setString(tostring(data:getPrice()))
		xian:setVisible(true)

		local goldIcon2 = IconFactory:createResourcePic({
			id = data:getGameCoin().type
		})

		goldIcon2:addTo(priceText):center(priceText:getContentSize()):offset(-25, 0)
		goldIcon2:setScale(0.7)

		if data:getPrice() == 0 then
			priceText:setVisible(false)
			xian:setVisible(false)
			discountPanel:setVisible(false)
		end
	else
		local symbol, price = data:getPaySymbolAndPrice(data:getPayId())

		moneyText:setString(symbol .. price)
		moneyText:setPositionX(60)
		discountText:setString(tostring(data:getCostOff() * 100) .. "%")
		discountPanel:setVisible(true)
		priceText:setVisible(true)
		priceText:setString("USD" .. tostring(data:getPrice()))
		xian:setVisible(true)

		if data:getPrice() == 0 then
			priceText:setVisible(false)
			xian:setVisible(false)
			discountPanel:setVisible(false)
		end
	end

	local rewardId = data:getItem()
	local rewards = RewardSystem:getRewardsById(rewardId)

	iconLayout:removeAllChildren()
	iconLayout:setAnchorPoint(cc.p(0.5, 0.5))

	local icon = IconFactory:createRewardIcon(rewards[1], {
		showAmount = true,
		isWidget = true
	})

	IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewards[1], {
		touchDisappear = true,
		swallowTouches = true
	})
	iconLayout:addChild(icon)
	icon:setAnchorPoint(cc.p(0.5, 0.5))

	local pos = cc.p(iconLayout:getContentSize().width / 2, iconLayout:getContentSize().height / 2)

	icon:setPosition(pos)
	icon:setScale(0.9)

	local rewardPanel = panel:getChildByFullName("rewardPanel")

	rewardPanel:removeAllChildren()

	local rewardId = data:getItem()
	local rewards = RewardSystem:getRewardsById(rewardId)
	local rewardCount = #rewards - 1
	local offset = rewardCount == 1 and 70 or rewardCount == 2 and 40 or rewardCount == 3 and 0 or 0
	local scale = 0.55
	local cellWidth = 70

	for i = 1, 4 do
		local reward = rewards[i + 1]

		if reward then
			local rewardIcon = IconFactory:createRewardIcon(reward, {
				showAmount = true,
				isWidget = true
			})

			rewardPanel:addChild(rewardIcon)
			rewardIcon:setScaleNotCascade(scale)
			rewardIcon:setPosition((i - 1) * cellWidth + offset, 8)
			rewardIcon:setAnchorPoint(0, 0)
			IconFactory:bindTouchHander(rewardIcon, IconTouchHandler:new(self), reward, {
				touchDisappear = true,
				swallowTouches = true
			})
		end
	end

	local times1 = data:getLeftCount()
	local times2 = data:getStorage()

	if data:getTimeTypeType() == "limit" then
		leaveTimesText:setVisible(true)
		leaveTimesText:setString(Strings:get("LimitPack_TotalLimit", {
			cur = times1,
			total = times2
		}))
	elseif data:getTimeTypeType() == "day" then
		leaveTimesText:setVisible(true)
		leaveTimesText:setString(Strings:get("LimitPack_TodayLimit", {
			cur = times1,
			total = times2
		}))
	elseif data:getTimeTypeType() == "unlimit" then
		leaveTimesText:setVisible(false)
	end

	if times1 <= 0 and data:getTimeTypeType() ~= "unlimit" then
		bg:setVisible(false)
		bg_buy:setVisible(true)
		mask:setVisible(true)
		moneyText:enableShadow(cc.c4b(49, 49, 49, 255), cc.size(0, -3), 3)
	else
		bg:setVisible(true)
		bg_buy:setVisible(false)
		mask:setVisible(false)
	end
end

function TimeLimitShopActivityMediator:onClickClose()
	self:close()
end

function TimeLimitShopActivityMediator:enableTimeLimitShopTimer()
	if self._timeLimitShopTimer then
		self._timeLimitShopTimer:stop()

		self._timeLimitShopTimer = nil
	end

	local function updata()
		local leaveTime = self._activity:getEndTime() / 1000 - self._gameServerAgent:remoteTimestamp()

		if leaveTime <= 0 then
			if self._timeLimitShopTimer then
				self._timeLimitShopTimer:stop()

				self._timeLimitShopTimer = nil
			end

			self:close()
		end

		local str = ""
		local fmtStr = "${d}:${H}:${M}:${S}"
		local timeStr = TimeUtil:formatTime(fmtStr, leaveTime)
		local parts = string.split(timeStr, ":", nil, true)
		local timeTab = {
			day = tonumber(parts[1]),
			hour = tonumber(parts[2]),
			min = tonumber(parts[3]),
			s = tonumber(parts[4])
		}

		if timeTab.day > 0 then
			str = timeTab.day .. Strings:get("TimeUtil_Day") .. timeTab.hour .. Strings:get("TimeUtil_Hour")
		elseif timeTab.hour > 0 then
			str = timeTab.hour .. Strings:get("TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min")
		elseif timeTab.min > 0 then
			str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.s .. Strings:get("TimeUtil_Sec")
		else
			str = timeTab.s .. Strings:get("TimeUtil_Sec")
		end

		self._deadline:setString(Strings:get("LimitPack_Countdown", {
			time = str
		}))
	end

	self._timeLimitShopTimer = LuaScheduler:getInstance():schedule(updata, 1, false)

	updata()
end

function TimeLimitShopActivityMediator:onBuyItem(packageId)
	local data = {
		doActivityType = 101,
		packageId = packageId
	}
	local packageShop = self._shopSystem:getPackageById(packageId)
	local isFree = packageShop:getIsFree()

	if isFree == KShopBuyType.KCoin then
		local gameCoin = packageShop:getGameCoin()
		local amount = gameCoin.amount
		local costType = gameCoin.type
		local curCoin = self._bagSystem:getItemCount(costType)

		if curCoin < amount then
			local outSelf = self
			local delegate = {
				willClose = function (self, popupMediator, data)
					if not outSelf._activitySystem:checkTimeLimitShopShow() then
						outSelf:dispatch(ShowTipEvent({
							tip = Strings:get("Recharge_ERROR_Tip2")
						}))
						outSelf:close()
					end

					if data.response == "ok" then
						outSelf._shopSystem:tryEnter({
							shopId = "Shop_Mall"
						})
					elseif data.response == "cancel" then
						-- Nothing
					elseif data.response == "close" then
						-- Nothing
					end
				end
			}
			local data = {
				title1 = "Tips",
				title = Strings:get("Tip_Remind"),
				content = Strings:get("LimitPack_DiamondTip"),
				sureBtn = {},
				cancelBtn = {}
			}
			local view = self:getInjector():getInstance("AlertView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, data, delegate))

			return
		end
	end

	self._activitySystem:requestDoActivity(self._activity:getId(), data, function (response)
		if response.resCode == GS_SUCCESS then
			if isFree == KShopBuyType.KFree or isFree == KShopBuyType.KCoin then
				if DisposableObject:isDisposed(self) or DisposableObject:isDisposed(self:getView()) then
					return
				end

				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					rewards = response.data.rewards
				}))
				self:setUpPackageState()

				return
			end

			local payOffSystem = self:getInjector():getInstance(PayOffSystem)

			payOffSystem:payOffToSdk(response.data)
		end
	end)
end
