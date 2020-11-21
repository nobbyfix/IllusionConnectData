CurrencyBuyPopMediator = class("CurrencyBuyPopMediator", DmPopupViewMediator, _M)

CurrencyBuyPopMediator:has("_currencySystem", {
	is = "r"
}):injectWith("CurrencySystem")
CurrencyBuyPopMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kBtnHandlers = {
	["main.actBtn"] = {
		ignoreClickAudio = true,
		func = "onExchangeEnergyBtn"
	}
}

function CurrencyBuyPopMediator:initialize()
	super.initialize(self)
end

function CurrencyBuyPopMediator:dispose()
	super.dispose(self)
end

function CurrencyBuyPopMediator:onRegister()
	super.onRegister(self)

	self._bagSystem = self._developSystem:getBagSystem()

	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_BUY_ENERGRY_SUCC, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_SELL_ITEM_SUCC, self, self.updateConsumablePanel)
end

function CurrencyBuyPopMediator:onRemove()
	super.onRemove(self)
end

function CurrencyBuyPopMediator:enterWithData(data)
	self:initView()
	self:refreshView()
end

function CurrencyBuyPopMediator:initView()
	self._buyTimesLabel = self:getView():getChildByFullName("main.cur")
	self._pricePanel = self:getView():getChildByFullName("main.actBtn.price")
	self._consumableItemPanel = self:getView():getChildByName("itemPanel")
	self._bonusAnim = self:getView():getChildByName("bonusAnim")
	self._countPanel = self:getView():getChildByFullName("main.count")
	local tips = self:getView():getChildByFullName("main.tips")
	local lineGradiantVec2 = {
		{
			ratio = 0.6,
			color = cc.c4b(47, 23, 14, 255)
		},
		{
			ratio = 0.4,
			color = cc.c4b(134, 50, 20, 255)
		}
	}

	tips:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
		x = 0,
		y = -1
	}))

	lineGradiantVec2 = {
		{
			ratio = 0.5,
			color = cc.c4b(255, 255, 255, 255)
		},
		{
			ratio = 0.5,
			color = cc.c4b(255, 221, 131, 255)
		}
	}

	self._countPanel:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
		x = 0,
		y = -1
	}))
end

function CurrencyBuyPopMediator:refreshView()
	local vipLevel = 0
	local vipCfg = ConfigReader:getRecordById("Vip", tostring(vipLevel))
	local aBuyTimes = 0
	local aTotTimes = 0
	self._curPrice = 0
	aBuyTimes = self._bagSystem:getBuyTimesByType(TimeRecordType.kBuyStamina)
	aTotTimes = vipCfg.BuyPowerNum
	local cost = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Stamina_Price", "content")
	self._curPrice = cost[aBuyTimes + 1] or cost[#cost]

	self._pricePanel:setString(self._curPrice)

	local aCurItemCount = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Stamina_BuyNum", "content")

	self._countPanel:setString(aCurItemCount)
	self:updateConsumablePanel()
	self._buyTimesLabel:setString(aBuyTimes .. "/" .. aTotTimes)
end

function CurrencyBuyPopMediator:onExchangeEnergyBtn(sender, eventType)
	if self._developSystem:getDiamonds() < self._curPrice then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = Strings:get("RECHARGE_DIAMONDS_NOTENOUGH")
		}))

		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
	self._currencySystem:requestBuyEngry(function ()
		if DisposableObject:isDisposed(self) then
			return
		end

		self:runBuyPowerAnim()
	end)
end

function CurrencyBuyPopMediator:runBuyPowerAnim()
	self._soundId = AudioEngine:getInstance():playEffect("Se_Effect_Exchange_Energy", false)
	local anim = self._bonusAnim:getChildByName("PowerAnim")

	if not anim then
		anim = cc.MovieClip:create("tili_duihuantili")

		anim:setPosition(cc.p(0, 0))
		self._bonusAnim:addChild(anim)
		anim:setName("GoldAnim")
		anim:addEndCallback(function ()
			anim:stop()
			anim:setVisible(false)
		end)
	end

	anim:gotoAndPlay(0)
	anim:setVisible(true)
end

function CurrencyBuyPopMediator:updateConsumablePanel()
	local powerEntryIds = self._bagSystem:getPowerEntryIds()

	if #powerEntryIds > 0 then
		local entry = self._bagSystem:getEntryById(powerEntryIds[#powerEntryIds])
		local item = entry.item
		local iconNode = self._consumableItemPanel:getChildByFullName("Node_icon")

		iconNode:removeAllChildren()

		local icon = IconFactory:createIcon({
			id = item:getId(),
			amount = entry.count
		})
		local scale = 0.6

		icon:setScale(scale)

		if icon.getAmountLabel then
			local label = icon:getAmountLabel()

			label:setScale(1 / scale)
			label:enableOutline(cc.c4b(0, 0, 0, 255), 2)
		end

		icon:addTo(iconNode)
		icon:center(iconNode:getContentSize())

		local nameLabel = self._consumableItemPanel:getChildByFullName("Text_name")

		nameLabel:setString(item:getName())

		local button = self._consumableItemPanel:getChildByFullName("entry.button")

		self._consumableItemPanel:getChildByFullName("entry.name"):setString(Strings:get("bag_UI13"))

		local function callFunc()
			self._bagSystem:tryUseActionPointItem(item:getId(), 1)
		end

		mapButtonHandlerClick(nil, button, {
			func = callFunc
		})
		self._consumableItemPanel:setVisible(true)

		return
	end

	self._consumableItemPanel:setVisible(false)
end
