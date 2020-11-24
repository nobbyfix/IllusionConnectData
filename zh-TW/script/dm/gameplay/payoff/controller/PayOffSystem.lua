PAY_INIT_SUCCESS = "PAY_INIT_SUCCESS"
PayOffSystem = class("PayOffSystem", Facade, _M)

PayOffSystem:has("_payOffService", {
	is = "r"
}):injectWith("PayOffService")
PayOffSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
PayOffSystem:has("_rechargeAndVipSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")
PayOffSystem:has("_webPayList", {
	is = "rw"
})

KPayToSdkType = {
	KNormal = 0,
	KSubscribe = 1,
	KRecover = 3
}

function PayOffSystem:initialize()
	super.initialize(self)

	self._paySymbolAndPrice = {}
	self._payOrderIds = {}
	self._webPayList = {}
	self._webRewardShow = false
end

function PayOffSystem:userInject(injector)
	self:mapEventListener(self:getEventDispatcher(), EVT_PAY_OFF, self, self.onPayOffToSdk)
end

function PayOffSystem:dispose()
	super.dispose(self)
end

function PayOffSystem:payInit()
	local channelID = SDKHelper:getChannelID()

	if channelID == "dpstorm_ios" or channelID == "tw_mamba_ios" or channelID == "tw_mamba_android" then
		local function hasId(value, key)
			for _, __ in pairs(value) do
				if __ == key then
					return true
				end
			end

			return false
		end

		local payTable = ConfigReader:getDataTable("Pay") or {}
		local productList = {}
		local index = 0

		for k, v in pairs(payTable) do
			local productId = v.ProductId
			local sDKSource = v.SDKSource

			if hasId(sDKSource, channelID) then
				productList["s" .. index] = productId
				index = index + 1
			end
		end

		if index > 0 then
			SDKHelper:payInit(productList)
		end
	end
end

function PayOffSystem:listenPayOffDiff()
	self:getPayOffService():listenPayOffDiff(function (message, response)
		if response then
			if message == "success" then
				table.insert(self._payOrderIds, response.orderId)
				self:removeWaitingAnim()
				self:showPayReward(response)

				if SDKHelper and SDKHelper:isEnableSdk() and response.payId and response.orderId then
					local adjust, price = self:getPayAdjust(response.payId)

					SDKHelper:adjustRevenueTracking(AdjustEventList.ADJUST_PAY_EVENT, response.orderId, price, adjust)
				end
			elseif message == "webSuccess" then
				self:pushWebPay(response)
			else
				self:dispatch(ShowTipEvent({
					tip = Strings:get("SDKTips4")
				}))
			end
		else
			self:dispatch(ShowTipEvent({
				tip = Strings:get("SDKTips7")
			}))
		end
	end)
end

function PayOffSystem:onPayOffToSdk(event)
	if event and event:getData() then
		local errorCode = event:getData().errorCode
		local message = event:getData().message

		if errorCode == "paySuccess" then
			if message and message.order_id and table.indexof(self._payOrderIds, message.order_id) == nil then
				self:showWaitingAnim()
			end
		elseif errorCode == "payFailure" then
			-- Nothing
		elseif errorCode == "payInitSuccess" then
			if message and message.ids then
				self:setPaySymbolAndPrice(message.ids)
				self:dispatch(Event:new(PAY_INIT_SUCCESS))
			end
		elseif errorCode == "payIncFailure" then
			-- Nothing
		elseif errorCode == "payNoIncomplete" then
			-- Nothing
		elseif errorCode == "payIncComplete" then
			self:createPayIncomplete()
		end
	end
end

function PayOffSystem:showWaitingAnim()
	local scene = self:getInjector():getInstance("BaseSceneMediator", "activeScene")
	local topView = scene:getTopView()

	if not self._waitingLayout and topView then
		local adjustPos = topView:convertToNodeSpace(cc.p(display.cx, display.cy))
		local layout = ccui.Layout:create()

		layout:setContentSize(cc.size(1386, 640))
		layout:setAnchorPoint(cc.p(0.5, 0.5))
		layout:addTo(topView, 1000):setPosition(adjustPos)
		layout:setBackGroundColorType(1)
		layout:setBackGroundColor(cc.c3b(0, 0, 0))
		layout:setBackGroundColorOpacity(130)
		layout:setTouchEnabled(true)

		local waitingAnim = cc.MovieClip:create("mengjingbbb_mingzi")

		waitingAnim:addTo(layout):center(layout:getContentSize())

		self._waitingLayout = layout
	end

	performWithDelay(topView, function ()
		self:removeWaitingAnim()
	end, 5)
end

function PayOffSystem:removeWaitingAnim()
	if self._waitingLayout then
		self._waitingLayout:removeFromParent()

		self._waitingLayout = nil
	end
end

function PayOffSystem:createPayIncomplete()
	if device.platform == "ios" then
		local storyDirector = self:getInjector():getInstance(story.StoryDirector)
		local guideAgent = storyDirector:getGuideAgent()

		if not guideAgent:isGuiding() then
			SDKHelper:payIncomplete()
		end
	end
end

function PayOffSystem:payOffToSdk(payInfo, type)
	local payData = {
		uid = SDKHelper:readCacheValue("uid"),
		productId = payInfo.productId,
		payMoney = checkint(payInfo.payMoney),
		gameMoney = checkint(payInfo.gameMoney),
		payTime = checkint(payInfo.payTime),
		tradeNo = payInfo.tradeNo,
		roleId = payInfo.roleId,
		roleName = payInfo.roleName,
		roleLevel = tostring(payInfo.roleLevel),
		serverId = payInfo.serverId,
		serverName = payInfo.serverName,
		extensionInfo = "",
		appId = payInfo.appId,
		merchantId = payInfo.merchantId,
		notifyUrl = payInfo.notifyUrl,
		sign = payInfo.sign,
		productName = self:getPayName(payInfo.productId),
		productDesc = self:getPayName(payInfo.productId),
		isSubscription = type or 0
	}

	SDKHelper:pay(payData)
end

function PayOffSystem:setPaySymbolAndPrice(idList)
	if idList then
		self._paySymbolAndPrice = idList
	end
end

function PayOffSystem:getPayName(productId)
	local name = ""
	local info = self:getPayInfoByProductId(productId)

	if info then
		name = Strings:get(info.Name)
	end

	return name
end

function PayOffSystem:getPayInfoByProductId(productId)
	local infos = ConfigReader:getDataTable("Pay")

	for i, v in pairs(infos) do
		if v.ProductId == productId then
			return v
		end
	end

	return nil
end

function PayOffSystem:getPaySymbolAndPrice(payId)
	local config = payId and ConfigReader:getRecordById("Pay", payId)
	local symbol = ""
	local price = 0

	if config then
		local productId = config.ProductId

		if self._paySymbolAndPrice[productId] then
			symbol = self._paySymbolAndPrice[productId].symbol or ""
			price = self._paySymbolAndPrice[productId].price or 0
		else
			symbol = config.Symbol or ""
			price = config.Price or 0
		end
	end

	price = checkint(price)

	return symbol, price
end

function PayOffSystem:getPayAdjust(payId)
	local config = payId and ConfigReader:getRecordById("Pay", payId)

	if config and config.ADSymbol then
		return config.ADSymbol, config.Price
	end

	return "", ""
end

function PayOffSystem:showPayReward(response, callback)
	local player = response.d.player

	if player.mallInfo then
		if player.mallInfo.monthCards then
			self:dispatch(Event:new(EVT_BUY_MONTHCARD_SUCC, {
				index = 1,
				reward = response.data.rewards
			}))

			local view = self:getInjector():getInstance("MCBuySuccessView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
				needClick = true,
				reward = response.data.rewards,
				callback = callback
			}))
		elseif player.mallInfo.fCardBuyFlag then
			local view = self:getInjector():getInstance("getRewardView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				maskOpacity = 0
			}, {
				needClick = true,
				rewards = response.data.reward,
				callback = callback
			}))
			self:dispatch(Event:new(EVT_FefreshForeverCard))
		else
			self:dispatch(Event:new(EVT_DIAMOND_RECHARGE_SUCC))
			self:dispatch(Event:new(EVT_REFRESHBYGOLDORDIMOND_SUCC))

			if response.data.addDiamond then
				local rewards = {
					{
						type = 2,
						code = "IR_Diamond",
						amount = response.data.addDiamond
					}
				}
				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					needClick = true,
					rewards = rewards,
					callback = callback
				}))
			end
		end
	end

	if player.privilegeInfo then
		self:dispatch(Event:new(EVT_BUY_MONTHCARD_SUCC, {
			index = 1,
			reward = response.data.rewards
		}))

		local view = self:getInjector():getInstance("MCBuySuccessView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
			needClick = true,
			reward = response.data.rewards,
			callback = callback
		}))
	end

	if player.packShopItems then
		self:dispatch(Event:new(EVT_BUY_PACKAGE_SUCC, {
			rewards = response.data.rewards
		}))

		if response.data.rewards then
			local view = self:getInjector():getInstance("getRewardView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				maskOpacity = 0
			}, {
				needClick = true,
				rewards = response.data.rewards,
				callback = callback
			}))
		end
	end

	if response.data and response.data.activityId then
		local passSystem = self:getInjector():getInstance(PassSystem)

		if response.data.activityId == passSystem:getCurrentActivityID() then
			local view = self:getInjector():getInstance("getRewardView")

			if response.data.rewards and #response.data.rewards > 0 then
				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					needClick = true,
					rewards = response.data.rewards,
					callback = callback
				}))
			end

			self:dispatch(Event:new(EVT_PASSPORT_REFRESH))
		end
	end
end

function PayOffSystem:pushWebPay(data)
	table.insert(self._webPayList, data)
end

function PayOffSystem:popWebPay()
	if #self._webPayList <= 0 then
		self:clearWebPay()

		return
	end

	return table.remove(self._webPayList)
end

function PayOffSystem:clearWebPay()
	self._webPayList = {}
	self._webRewardShow = false
end

function PayOffSystem:showWebReward()
	if not self._webRewardShow then
		self._webRewardShow = true

		self:showWebPayListReward()
	end
end

function PayOffSystem:showWebPayListReward()
	if #self._webPayList > 0 then
		self:showPayReward(self:popWebPay(), function ()
			self:showWebPayListReward()
		end)
	end
end
