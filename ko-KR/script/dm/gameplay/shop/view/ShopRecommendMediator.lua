ShopRecommendMediator = class("ShopRecommendMediator", DmAreaViewMediator, _M)

ShopRecommendMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
ShopRecommendMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ShopRecommendMediator:has("_rechargeSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")

local kNums = 1
local kCellHeight = 490
local kCellHeightTab = 70
local kCellWidthTab = 920
local innerOffsetx = 10

function ShopRecommendMediator:initialize()
	super.initialize(self)
end

function ShopRecommendMediator:dispose()
	self:clearView()
	super.dispose(self)
end

function ShopRecommendMediator:onRegister()
	super.onRegister(self)
	self:mapEventListeners()
end

function ShopRecommendMediator:mapEventListeners()
end

function ShopRecommendMediator:onRemove()
	super.onRemove(self)
end

function ShopRecommendMediator:setupView()
	self:initMember()

	self._rightTabIndex = 1
end

function ShopRecommendMediator:clearView()
	self:getView():stopAllActions()

	if self._shopSpine then
		self._shopSpine:stopEffect()
	end
end

function ShopRecommendMediator:refreshData()
	self:createRightShopConfig()

	if self._rightTabIndex > #self._shopTabList then
		self._rightTabIndex = 1

		if not self._shopTabList[self._rightTabIndex] then
			self._data = nil

			self:getView():setVisible(false)

			return
		end
	end

	self:getView():setVisible(true)

	self._data = self._shopTabList[self._rightTabIndex].data
end

function ShopRecommendMediator:initMember()
	self._rightTabPanel = self:getView():getChildByName("rightTabPanel")
	self._touchPanel = self:getView():getChildByName("touchPanel")
	self._bgImage = self._touchPanel:getChildByName("Image_bg")

	self._touchPanel:addTouchEventListener(function (sender, eventType)
		self:onClickItem(sender, eventType)
	end)

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

	local _refundPanel = self._talkRole:getChildByName("refundPanel")

	_refundPanel:addClickEventListener(function (sender)
		self:onClickRefundBtn()
	end)
	self:adjustView()
end

function ShopRecommendMediator:adjustView()
	local director = cc.Director:getInstance()
	local winSize = director:getWinSize()
	local currentWidth = winSize.width - 188 - AdjustUtils.getAdjustX()
	self._scrollViewTab = self._rightTabPanel:getChildByName("scrollViewTab")

	self._scrollViewTab:setContentSize(cc.size(kCellWidthTab, kCellHeightTab))
	self._scrollViewTab:setScrollBarEnabled(false)

	self._tabClone = self._view:getChildByFullName("tabClone")

	self._tabClone:setVisible(false)

	self._cellWidthTab = self._tabClone:getContentSize().width
end

function ShopRecommendMediator:refreshView()
	if not self._data then
		return
	end

	self:getView():stopAllActions()
	self:initRightTabController()

	local path = "asset/ui/shop/" .. self._data.BackGroundImg .. ".jpg" or "sd_tj_ggt.png"

	self._bgImage:loadTexture(path)

	local pid = self._data.PackageId[1]

	if pid == KMonthCardType.KMonthCard then
		local frameData = self._shopSystem:getMonthCardHeadFrame()

		if frameData then
			if self._bgImage.frameData and frameData.code ~= self._bgImage.frameData.code and self._bgImage.frameIcon then
				self._bgImage.frameIcon:removeFromParent()

				self._bgImage.frameIcon = nil
			end

			if not self._bgImage.frameIcon then
				local icon = IconFactory:createRewardIcon(frameData, {
					isWidget = true,
					showAmount = false
				})

				icon:addTo(self._bgImage):posite(698, 385):setScale(0.83)
				IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), frameData, {
					needDelay = true
				})
				icon:setSwallowTouches(true)

				self._bgImage.frameData = frameData
				self._bgImage.frameIcon = icon
			end

			self._bgImage.frameIcon:setVisible(true)
		end
	elseif self._bgImage.frameIcon then
		self._bgImage.frameIcon:setVisible(false)
	end

	self:setTalkView()
end

function ShopRecommendMediator:refreshShopData()
	local offsetx = self._scrollViewTab:getInnerContainerPosition().x

	self:refreshData()
	self:refreshView()

	if offsetx == 0 then
		offsetx = innerOffsetx or offsetx
	end

	self._scrollViewTab:setInnerContainerPosition(cc.p(offsetx, 0))
end

function ShopRecommendMediator:createRightShopConfig()
	self._shopTabList = {}
	self._shopTabListData = self._shopSystem:getRecomendData()

	for index = 1, #self._shopTabListData do
		self._shopTabList[index] = {
			data = self._shopTabListData[index],
			name = {
				Strings:get(self._shopTabListData[index].TabName),
				""
			}
		}
	end
end

function ShopRecommendMediator:initRightTabController()
	self._tabBtns = {}

	self._scrollViewTab:removeAllChildren()

	local length = #self._shopTabList
	local viewWidth = self._scrollViewTab:getContentSize().width
	local allWidth = math.max(viewWidth, self._cellWidthTab * length)

	self._scrollViewTab:setInnerContainerSize(cc.size(allWidth, kCellHeightTab))
	self._scrollViewTab:setInnerContainerPosition(cc.p(innerOffsetx, 0))

	for i = 1, length do
		local info = self._shopTabList[i]
		local nameStr = info.name[1]
		local nameStr1 = info.name[2]
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

		btn.data = info.data
		self._tabBtns[#self._tabBtns + 1] = btn

		btn:addClickEventListener(function ()
			self:onClickTabBtns(_, i)
		end)
	end

	self:setTabStatus()
end

function ShopRecommendMediator:onClickTabBtns(name, tag)
	if self._rightTabIndex == tag then
		return
	end

	self._rightTabIndex = tag
	self._showTalk = true

	self:setTabStatus()
	self:refreshShopData()
end

function ShopRecommendMediator:setTabStatus()
	for i = 1, #self._tabBtns do
		local btn = self._tabBtns[i]
		local data = self._tabBtns[i].data

		btn:getChildByFullName("dark_1"):setVisible(i ~= self._rightTabIndex)
		btn:getChildByFullName("light_1"):setVisible(i == self._rightTabIndex)

		local player = self._developSystem:getPlayer()
		local idStr = string.split(player:getRid(), "_")
		local userId = data.Id .. idStr[1]
		local value = cc.UserDefault:getInstance():getStringForKey(userId)

		btn:getChildByFullName("Image_new"):setVisible(value == "")

		if value == "" and i == self._rightTabIndex then
			cc.UserDefault:getInstance():setStringForKey(userId, userId)
		end

		local timeVisible = data.TimeType.type == "limit" and true or false

		btn:getChildByFullName("Image_xianshi"):setVisible(timeVisible and value ~= "")
	end
end

function ShopRecommendMediator:onClickItem(sender, eventType)
	if eventType == ccui.TouchEventType.began then
		self._isReturn = true
	elseif eventType == ccui.TouchEventType.ended and self._isReturn and self._data.Link then
		local context = self:getInjector():instantiate(URLContext)
		local entry, params = UrlEntryManage.resolveUrlWithUserData(self._data.Link)

		if not entry then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Function_Not_Open")
			}))
		else
			entry:response(context, params)
		end
	end
end

function ShopRecommendMediator:setTalkView()
	self._showTalk = false

	self:onClickTalkRole()
end

function ShopRecommendMediator:onClickTalkRole(sender)
	self._showTalk = not self._showTalk
	local talkBg = self._talkRole:getChildByName("Image_20")

	talkBg:setVisible(self._showTalk)
	self._talkText:setVisible(self._showTalk)
	self._talkText:setString(self._shopSystem:getShopTalkShow())
	self:playAnimation(sender)
end

function ShopRecommendMediator:playAnimation(sender)
	local function callback(voice)
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

function ShopRecommendMediator:onClickRefundBtn()
	local view = self:getInjector():getInstance("RefundDetailView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data))
end
