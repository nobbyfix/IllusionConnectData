RecruitBuyCardMediator = class("RecruitBuyCardMediator", DmPopupViewMediator, _M)

RecruitBuyCardMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
RecruitBuyCardMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
RecruitBuyCardMediator:has("_recruitSystem", {
	is = "r"
}):injectWith("RecruitSystem")

local kBtnHandlers = {
	buyBtn = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickBuy"
	},
	closeBtn = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickCloseTip"
	}
}
local DrawCard_SinglePrice = ConfigReader:getDataByNameIdAndKey("ConfigValue", "DrawCard_SinglePrice", "content")
local DrawCard_TenTimesPrice = ConfigReader:getDataByNameIdAndKey("ConfigValue", "DrawCard_TenTimesPrice", "content")

function RecruitBuyCardMediator:initialize()
	super.initialize(self)
end

function RecruitBuyCardMediator:dispose()
	super.dispose(self)
end

function RecruitBuyCardMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._bagSystem = self._developSystem:getBagSystem()

	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.updateData)
end

function RecruitBuyCardMediator:enterWithData(data)
	self:initData(data)
	bindWidget(self, self:getView():getChildByName("bgNode"), PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickClose, self)
		},
		title = Strings:get("Recruit_UI16"),
		title1 = Strings:get("UITitle_EN_Zhaohuanzhizhengbuzu"),
		fontSize = getCurrentLanguage() ~= GameLanguageType.CN and 35 or 50
	})

	self._ensureBtn = self:bindWidget("sureBtn", OneLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onClickEnsure, self)
		}
	})
	self._buyBtn = self:getView():getChildByName("buyBtn")
	self._closeBtn = self:getView():getChildByName("closeBtn")
	self._tipLabel = self:getView():getChildByName("tipLabel")
	self._buyPanel = self:getView():getChildByName("buyPanel")

	self._ensureBtn:setVisible(false)
	self._tipLabel:setVisible(false)
	GameStyle:setCommonOutlineEffect(self._tipLabel)
	self._buyBtn:setVisible(false)
	self._buyPanel:setVisible(false)
	self:initView()
end

function RecruitBuyCardMediator:initData(data)
	self._param = data.param
	self._costId = data.itemId
	local needCount = data.costCount
	local hasCount = self._bagSystem:getItemCount(self._costId)
	self._num = needCount - hasCount
	local price = self._param.times == 1 and DrawCard_SinglePrice or DrawCard_TenTimesPrice
	self._cost = self._num * price
	local hasDiamondCount = self._bagSystem:getItemCount(CurrencyIdKind.kDiamond)
	self._canBuy = self._cost <= hasDiamondCount
end

function RecruitBuyCardMediator:updateData()
	local hasDiamondCount = self._bagSystem:getItemCount(CurrencyIdKind.kDiamond)
	self._canBuy = self._cost <= hasDiamondCount
end

function RecruitBuyCardMediator:initView()
	self._buyBtn:setVisible(true)
	self._buyPanel:setVisible(true)
	self._buyPanel:getChildByName("tipLabel"):setString(Strings:get("Recruit_UI18", {
		cost = self._cost,
		num = self._num
	}))
	GameStyle:setCommonOutlineEffect(self._buyPanel:getChildByName("tipLabel"))
	self._buyBtn:getChildByName("text"):setString(self._cost)

	local icon = IconFactory:createIcon({
		id = self._costId,
		amount = self._num
	}, {
		showAmount = true
	})

	icon:addTo(self._buyPanel)
	icon:setPosition(cc.p(40, 40))
	icon:setScale(0.8)
end

function RecruitBuyCardMediator:onClickEnsure()
	self:close({
		callback = function ()
			self._shopSystem:tryEnter({
				shopId = "Shop_Normal"
			})
		end
	})
end

function RecruitBuyCardMediator:onClickBuy()
	if not self._canBuy then
		local data = {
			title = Strings:get("SHOP_REFRESH_DESC_TEXT1"),
			content = Strings:get("Recruit_UI21"),
			sureBtn = {},
			cancelBtn = {}
		}
		local outSelf = self
		local delegate = {
			willClose = function (self, popupMediator, data)
				if data.response == "ok" then
					outSelf._shopSystem:tryEnter({
						shopId = "Shop_Mall"
					})
				end
			end
		}
		local view = self:getInjector():getInstance("AlertView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))

		return
	end

	self:close({
		callback = function ()
			self._recruitSystem:requestRecruit(self._param)
		end
	})
end

function RecruitBuyCardMediator:onClickCloseTip()
	self.playerRid = self:getInjector():getInstance("DevelopSystem"):getPlayer():getRid()
	local image = self._closeBtn:getChildByName("image")

	if image:isVisible() then
		image:setVisible(false)
		cc.UserDefault:getInstance():setIntegerForKey(self.playerRid .. RecruitAutoBuyCard, 0)
	else
		image:setVisible(true)

		local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
		local lastLoginTime = gameServerAgent:remoteTimestamp()

		cc.UserDefault:getInstance():setIntegerForKey(self.playerRid .. RecruitAutoBuyCard, lastLoginTime)
	end
end

function RecruitBuyCardMediator:onClickClose()
	self:close()
end
