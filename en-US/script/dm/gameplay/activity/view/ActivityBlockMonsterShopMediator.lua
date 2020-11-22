ActivityBlockMonsterShopMediator = class("ActivityBlockMonsterShopMediator", DmAreaViewMediator, _M)

ActivityBlockMonsterShopMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")
ActivityBlockMonsterShopMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ActivityBlockMonsterShopMediator:has("_bagSystem", {
	is = "rw"
}):injectWith("BagSystem")

local kImagePath = "wsj_bg_mengyan.png"
local lineGradiantDir = {
	x = 0,
	y = -1
}
local kLineGradiantVec = {
	{
		{
			ratio = 0,
			color = cc.c4b(52, 54, 67, 255)
		},
		{
			ratio = 1,
			color = cc.c4b(59, 78, 109, 255)
		}
	},
	{
		{
			ratio = 0,
			color = cc.c4b(59, 52, 67, 255)
		},
		{
			ratio = 1,
			color = cc.c4b(87, 59, 108, 255)
		}
	},
	{
		{
			ratio = 0,
			color = cc.c4b(68, 48, 41, 255)
		},
		{
			ratio = 1,
			color = cc.c4b(117, 73, 56, 255)
		}
	}
}
local kImageBg = {
	"wsj_bg_zhekou_1.png",
	"wsj_bg_zhekou_2.png",
	"wsj_bg_zhekou_3.png"
}
local kBtnHandlers = {
	["main.leftView.button_give"] = "onClickExchange",
	tipBtn = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickRule"
	}
}

function ActivityBlockMonsterShopMediator:initialize()
	super.initialize(self)
end

function ActivityBlockMonsterShopMediator:dispose()
	if self._timer then
		self._timer:stop()

		self._timer = nil
	end

	if self._bubbleTimer then
		self._bubbleTimer:stop()

		self._bubbleTimer = nil
	end

	super.dispose(self)
end

function ActivityBlockMonsterShopMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListeners()

	self._main = self:getView():getChildByName("main")
	self._leftView = self._main:getChildByName("leftView")
	self._scrollView = self._main:getChildByName("scrollView")
	self._refreshText = self._main:getChildByName("Text_refresh")
	self._cellClone = self._main:getChildByName("cellClone")
	self._limitView = self._main:getChildByName("limit_goods")
	self._timePanel = self._leftView:getChildByFullName("timePanel")
	self._rolePanel = self._leftView:getChildByFullName("talkPanel.rolePanel")
	self._clipNode = self._leftView:getChildByFullName("talkPanel.clipNode")
	self._bubbleText = self._leftView:getChildByFullName("talkPanel.clipNode.Text_talk")
	self._primeTextPosX = self._bubbleText:getPositionX()
	self._primeTextPosY = self._bubbleText:getPositionY()

	self._bubbleText:setLineSpacing(4)
	self._bubbleText:getVirtualRenderer():setMaxLineWidth(246)

	self._itemPanel = self._leftView:getChildByName("ItemPanel")
	self._moneyPanel = self._leftView:getChildByName("money_panel")
	self._moneyIcon = self._moneyPanel:getChildByName("money_icon")

	self._scrollView:setScrollBarEnabled(false)
	self._scrollView:setSwallowTouches(false)
	self._cellClone:setVisible(false)

	self._cellSize = self._cellClone:getContentSize()
	self._bubbleIndex = 2

	if getCurrentLanguage() ~= GameLanguageType.CN then
		local moneyPanel = self._leftView:getChildByName("button_give")

		moneyPanel:setPositionY(60)
	end
end

function ActivityBlockMonsterShopMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_MONSTERSHOP_REFRESH, self, self.refreshWithData)
	self:mapEventListener(self:getEventDispatcher(), EVT_RESET_DONE, self, self.doReset)
	self:mapEventListener(self:getEventDispatcher(), EVT_ACTIVITY_REFRESH, self, self.doReset)
end

function ActivityBlockMonsterShopMediator:setupTopInfoWidget()
	local width = 0
	local currencyInfo = self._activity:getResourcesBanner()
	local topInfoNode = self:getView():getChildByName("topinfo_node")
	local config = {
		style = 1,
		currencyInfo = currencyInfo,
		title = Strings:get("Activity_Monster_Shop_UI1"),
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		fontSize = getCurrentLanguage() ~= GameLanguageType.CN and 30 or nil
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function ActivityBlockMonsterShopMediator:enterWithData(data)
	self:initData(data)
	self:setupView()

	if not self._initView then
		self._initView = true

		self:getMoneyRates()
	end
end

function ActivityBlockMonsterShopMediator:doReset()
	if checkDependInstance(self) then
		self:getMoneyRates()
	end
end

function ActivityBlockMonsterShopMediator:getMoneyRates()
	local outself = self

	local function callbackFunc(response)
		local data = response.data.rewards

		if data and next(data) then
			local function callbackFunc2()
				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					rewards = data
				}))
				self:dispatch(Event:new(EVT_MONSTERSHOP_REFRESH, {
					activityId = outself._activityId
				}))

				outself._bubbleIndex = 1
			end

			local view = outself:getInjector():getInstance("ActivityBlockMonsterShopPopupView")

			if view then
				local viewData = {
					activityId = outself._activityShop:getActivityId(),
					title = Strings:get("Title_Monstershop_Text"),
					title1 = Strings:get("UITitle_EN_Lixi"),
					desc = Strings:get("Activity_Monster_Shop_Sell_UI3"),
					overflowString = Strings:get("Activity_Monster_Shop_Sell_UI2"),
					lineNum = #data,
					rewards = data,
					callback = callbackFunc2
				}

				outself:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
				}, viewData))
			end
		end
	end

	if self._activitySystem:checkComplexActivity(self._activityId) then
		if self._activity:getType() ~= ActivityType.KMonsterShop then
			self._activitySystem:monsterShopGetMoneyRates(self._activity:getActivityId(), self._activityShop:getActivityId(), callbackFunc)
		else
			self._activitySystem:monsterShopGetMoneyRates(self._activity:getActivityId(), nil, callbackFunc)
		end
	end
end

function ActivityBlockMonsterShopMediator:setupView()
	self:setupTopInfoWidget()
	self:initLeftView()
	self:initRightView()
	self:updateRemainTime()
end

function ActivityBlockMonsterShopMediator:refreshWithData(event)
	local data = event:getData()

	self:enterWithData(data)
end

function ActivityBlockMonsterShopMediator:initData(data)
	self._activityId = data.activityId
	self._activity = self._activitySystem:getActivityById(self._activityId)

	if not self._activity then
		return
	end

	self._activityShop = self._activity:getMonsterShopActivity()

	assert(self._activityShop, "MonsterShopActivity not find")

	self._activityConfig = self._activityShop:getActivityConfig()
end

function ActivityBlockMonsterShopMediator:initLeftView()
	local modelId = self._activityConfig.MonsterModelId

	self._rolePanel:removeAllChildren()

	local rolePicId = ConfigReader:getDataByNameIdAndKey("RoleModel", modelId, "Bust15")

	if rolePicId ~= nil and rolePicId ~= "" then
		local portrait = IconFactory:createRoleIconSprite({
			iconType = "Bust15",
			id = modelId
		})

		portrait:addTo(self._rolePanel)
		portrait:offset(0, -10)
	else
		local tipSprite = ccui.Scale9Sprite:createWithSpriteFrameName(kImagePath)

		tipSprite:setScale9Enabled(false)
		tipSprite:setAnchorPoint(cc.p(0.5, 0.5))
		tipSprite:setPositionX(self._rolePanel:getContentSize().width * 0.5)
		tipSprite:setPositionY(self._rolePanel:getContentSize().height * 0.5)
		tipSprite:addTo(self._rolePanel)
	end

	self._bubbles = self._activityConfig.Bubble

	if not self._bubbleTimer then
		local endTime = self._activityShop:getEndTime() / 1000
		local remoteTimestamp = self._activitySystem:getCurrentTime()

		local function checkTimeFunc()
			remoteTimestamp = self._activitySystem:getCurrentTime()
			local remainTime = endTime - remoteTimestamp

			if remainTime <= 0 then
				self._bubbleTimer:stop()

				self._bubbleTimer = nil

				return
			end

			if self._bubbleIndex > #self._bubbles then
				self._bubbleIndex = 2
			end

			local rate = self._activityConfig.BankRate[self._activityShop._day] or 0.01
			rate = rate * 100

			self._bubbleText:stopAllActions()
			self._bubbleText:setPosition(cc.p(self._primeTextPosX, self._primeTextPosY))

			local str = self._bubbles[self._bubbleIndex]
			self._bubbleIndex = 1 + self._bubbleIndex

			self._bubbleText:setString(Strings:get(str, {
				Num = rate
			}))

			local textSizeHeight = self._bubbleText:getContentSize().height
			local clipNodeSizeHeight = self._clipNode:getContentSize().height

			if textSizeHeight > clipNodeSizeHeight - 5 then
				local offset = textSizeHeight - clipNodeSizeHeight + 10
				local temp1 = 2 * offset / 25
				local temp = 3.2 - temp1

				if temp <= 0 then
					temp1 = 2.5
					temp = 0.1
				end

				self._bubbleText:runAction(cc.Sequence:create(cc.DelayTime:create(1.8), cc.MoveTo:create(temp1, cc.p(self._primeTextPosX, self._primeTextPosY + offset)), cc.DelayTime:create(temp)))
			end
		end

		self._bubbleTimer = LuaScheduler:getInstance():schedule(checkTimeFunc, 5, false)

		checkTimeFunc()
	end

	self._moneyIcon:removeAllChildren()

	local itemId = self._activityConfig.Price
	local item = self._bagSystem:getEntryById(itemId)
	local itemConfig = self._bagSystem:getItemConfig(itemId)
	local moneyIcon = IconFactory:createResourcePic({
		id = itemId
	})

	moneyIcon:addTo(self._moneyIcon):center(self._moneyIcon:getContentSize())

	local moneyNum = item and item.count or 0
	local num = 0
	local temp = 0
	self._maxNum = itemConfig and itemConfig.MaxPile or 999999

	if self._maxNum < moneyNum then
		moneyNum = self._maxNum
	end

	self._moneyNum = moneyNum

	for i = 1, 6 do
		num = math.mod(moneyNum, 10)
		moneyNum = math.floor(moneyNum / 10)

		self._moneyPanel:getChildByName("Text_" .. i):setString(tostring(num))
	end

	self._itemPanel:removeAllChildren()

	local candys = self._activityConfig.Change

	for index = 1, #candys do
		local candy = candys[index]

		for id, _ in pairs(candy) do
			local iconNode = cc.Node:create()

			self._itemPanel:addChild(iconNode)

			local amount = self._bagSystem:getItemCount(id)
			local icon = IconFactory:createItemIcon({
				id = id,
				amount = amount
			}, {
				showAmount = true,
				isWidget = true
			})

			if amount == 0 then
				icon = IconFactory:createItemIcon({
					amount = 1,
					id = id
				}, {
					showAmount = false,
					isWidget = true
				})
			end

			icon:setScale(0.6)
			IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), {
				code = id,
				amount = amount,
				type = RewardType.kItem
			}, {
				swallowTouches = true,
				needDelay = true
			})
			icon:addTo(iconNode):center(iconNode:getContentSize()):offset(0, 15)

			local itemConfig = self._bagSystem:getItemConfig(id)
			local name = itemConfig and Strings:get(itemConfig.Name)
			local nameText = cc.Label:createWithTTF(name, TTF_FONT_FZYH_M, 16, cc.size(100, 60))

			nameText:setAlignment(1, 0)
			nameText:setAnchorPoint(cc.p(0.5, 1))
			nameText:enableOutline(cc.c4b(0, 0, 0, 127), 1)
			nameText:addTo(iconNode):center(iconNode:getContentSize()):offset(0, -50)
			nameText:setOverflow(cc.LabelOverflow.SHRINK)
			nameText:setDimensions(100, 50)
			iconNode:setPosition(cc.p(-60 + index * 105, 50))
		end
	end

	AdjustUtils.adjustLayoutUIByRootNode(self._leftView)
end

function ActivityBlockMonsterShopMediator:initRightView()
	self._curShopItems = self._activityShop:getSortExchangeList()

	self._scrollView:removeAllChildren()

	local length = #self._curShopItems

	self._scrollView:setInnerContainerSize(cc.size(self._cellSize.width * (length - 1), self._cellSize.height))
	self._scrollView:setInnerContainerPosition(cc.p(0, 0))

	for i = 1, length do
		local layout = ccui.Layout:create()

		layout:setContentSize(cc.size(self._cellSize.width, self._cellSize.height))
		layout:addTo(self._scrollView)
		layout:setTag(i)
		layout:setAnchorPoint(cc.p(0.5, 0.5))
		layout:setPosition(cc.p(self._cellSize.width * (i - 0.5), self._cellSize.height * 0.5))
		layout:setTouchEnabled(false)

		if #self._curShopItems == i then
			self._limitView:setVisible(true)
			self._limitView:setLocalZOrder(9999)

			local infoData = self._curShopItems[#self._curShopItems]
			local bg = self._limitView:getChildByFullName("bg")
			local costText = self._limitView:getChildByFullName("info_panel.costoff")
			local dayText = self._limitView:getChildByFullName("info_panel.day")
			local infoBg = self._limitView:getChildByFullName("info_panel.Image_bg")
			local time = self._limitView:getChildByFullName("info_panel.time")
			local maskPanel = self._limitView:getChildByFullName("Mask")

			maskPanel:setSwallowTouches(false)

			local config = infoData.config
			local costList = config.Cost
			local rateList = config.Rate
			local discountCur = self._activityShop:getCostRateById(infoData.id)
			local unlock = false

			if infoData.amount and next(infoData.amount) then
				unlock = true
			end

			dayText:setString(config.Day)
			bg:loadTexture(kImageBg[3], 1)
			bg:ignoreContentAdaptWithSize(true)

			if unlock then
				if discountCur == 1 then
					dayText:enablePattern(cc.LinearGradientPattern:create(kLineGradiantVec[3], lineGradiantDir))
					costText:setString(Strings:get("Activity_Monster_Shop_Surprise_Cost"))
					infoBg:setVisible(true)
					time:setVisible(true)
				elseif discountCur == 2 then
					dayText:enablePattern(cc.LinearGradientPattern:create(kLineGradiantVec[1], lineGradiantDir))
					costText:setString(Strings:get("Activity_Monster_Shop_Normal_Cost"))
					infoBg:setVisible(false)
					time:setVisible(false)
				end

				maskPanel:setVisible(false)
			else
				dayText:enablePattern(cc.LinearGradientPattern:create(kLineGradiantVec[3], lineGradiantDir))
				costText:setString(Strings:get("Activity_Monster_Shop_Surprise_Cost"))
				time:setVisible(false)
				infoBg:setVisible(false)
				maskPanel:setVisible(true)
			end

			local itemData = costList[1]

			if itemData and #costList == 1 then
				local panel = self._limitView:getChildByFullName("cell_1")
				local iconLayout = panel:getChildByFullName("icon_layout")
				local nameText = panel:getChildByFullName("goods_name")
				local infoPanel = panel:getChildByFullName("info_panel")
				local infoText = infoPanel:getChildByFullName("duihuan_text")
				local oldPrice = panel:getChildByFullName("old_price")
				local costPanel = panel:getChildByFullName("cost")
				local costText = panel:getChildByFullName("cost.cost_text")
				local moneyLayout = panel:getChildByFullName("money_layout")
				local moneyIcon = moneyLayout:getChildByFullName("money_icon")
				local moneyText = moneyLayout:getChildByFullName("money")
				local touchPanel = panel:getChildByFullName("touch_panel")
				local imageMark = panel:getChildByFullName("ImageMark")
				local maskPanel1 = panel:getChildByFullName("Mask")
				local limitText = panel:getChildByFullName("text_limit")

				maskPanel1:setVisible(false)
				maskPanel1:setSwallowTouches(false)
				limitText:enablePattern(cc.LinearGradientPattern:create(kLineGradiantVec[3], lineGradiantDir))
				nameText:getVirtualRenderer():setOverflow(cc.LabelOverflow.SHRINK)

				local targetItem = RewardSystem:getRewardsById(itemData.Reward)
				local iconInfo = RewardSystem:parseInfo(targetItem[1])

				nameText:setString(RewardSystem:getName(targetItem[1]))

				local icon = IconFactory:createIcon(iconInfo, {
					hideLevel = true,
					showAmount = true,
					isWidget = false
				})

				icon:addTo(iconLayout, -1):center(iconLayout:getContentSize()):setScale(1.2)
				IconFactory:bindTouchHander(iconLayout, IconTouchHandler:new(self), targetItem[1], {
					needDelay = true
				})

				if rateList[discountCur].rate < 1 then
					local localLanguage = getCurrentLanguage()

					if localLanguage == GameLanguageType.CN then
						costText:setString(Strings:get("Activity_Monster_Shop_UI7", {
							num = rateList[discountCur].rate * 10
						}))
					else
						costText:setString(Strings:get("Activity_Monster_Shop_UI7", {
							num = (1 - rateList[discountCur].rate) * 100
						}))
					end

					oldPrice:setString(Strings:get("Activity_Monster_Shop_UI6", {
						num = costList[1].price
					}))
					oldPrice:enableStrikethrough()
				else
					oldPrice:enableStrikethrough()
				end

				local rateCur = rateList[discountCur] and rateList[discountCur].rate or 1
				local cost = rateCur * costList[1].price
				local costId = costList[1].Item
				local costIcon = IconFactory:createPic({
					id = costId
				}, {
					showWidth = 60
				})

				moneyIcon:removeAllChildren()
				costIcon:addTo(moneyIcon):center(moneyIcon:getContentSize())
				moneyText:setString(tostring(cost))

				local leftCount = itemData.Times

				if infoData.amount and next(infoData.amount) then
					leftCount = infoData.amount[1]
				end

				if leftCount > 0 then
					infoText:setString(Strings:get("Activity_Shop_BuyNumLimit", {
						num1 = leftCount,
						num2 = itemData.Times
					}))
					imageMark:setVisible(false)
				elseif leftCount == -1 then
					infoText:setVisible(false)
					imageMark:setVisible(false)
				elseif leftCount == 0 then
					infoText:setString(Strings:get("Activity_Shop_BuyNumLimit", {
						num1 = leftCount,
						num2 = itemData.Times
					}))
					imageMark:setVisible(true)
					maskPanel1:setVisible(true)
				end

				if unlock then
					local data = {
						index = 0,
						id = infoData.id,
						targetInfo = targetItem[1],
						amount = leftCount,
						costId = costId,
						price = cost
					}

					touchPanel:addTouchEventListener(function (sender, eventType)
						self:onClickItem(sender, eventType, data)
					end)
				else
					imageMark:setVisible(false)
				end

				touchPanel:setSwallowTouches(false)
			end
		else
			self:createCell(layout, i)
		end
	end

	AdjustUtils.adjustLayoutByType(self._limitView, 8)

	local pos1 = self._leftView:getContentSize().width * 0.5 + self._leftView:getPositionX()
	local pos2 = self._limitView:getPositionX()
	local width = math.min(self._cellSize.width * (length - 1), pos2 - pos1)

	self._scrollView:setContentSize(width, self._cellSize.height)
	self._scrollView:setPositionX(pos1)
	self._refreshText:setPositionX(pos1 + 5)

	local remoteTimestamp = self._activitySystem:getCurrentTime()
	local startTime = self._activityShop:getStartTime() / 1000

	if not self._lastPostion then
		local day = self._activityShop._day
		local num = self._activityShop:getFirstUnlockIndex(day)
		local posX = math.min(self._cellSize.width * (num - 1), self._cellSize.width * (length - 1) - width)

		self._scrollView:setInnerContainerPosition(cc.p(-posX, 0))
	else
		self._scrollView:setInnerContainerPosition(self._lastPostion)

		self._lastPostion = nil
	end

	local tempData = self._curShopItems[#self._curShopItems]
	local tempDay = tempData.config.Rate[1].day

	self._refreshText:setString(Strings:get("Activity_Monster_Shop_Refresh", {
		num = tempDay[2]
	}))
end

function ActivityBlockMonsterShopMediator:createCell(cell, index)
	local clonePanel = self._cellClone:clone()

	clonePanel:setVisible(true)
	cell:addChild(clonePanel)
	clonePanel:setAnchorPoint(cc.p(0.5, 0.5))
	clonePanel:setPosition(self._cellSize.width * 0.5, self._cellSize.height * 0.5)
	clonePanel:setName("clonePanel")

	local bg = clonePanel:getChildByFullName("bg")
	local costText = clonePanel:getChildByFullName("info_panel.costoff")
	local dayText = clonePanel:getChildByFullName("info_panel.day")
	local infoBg = clonePanel:getChildByFullName("info_panel.Image_bg")
	local time = clonePanel:getChildByFullName("info_panel.time")
	local maskPanel = clonePanel:getChildByFullName("Mask")

	maskPanel:setSwallowTouches(false)

	local infoData = self._curShopItems[index]
	local config = infoData.config
	local costList = config.Cost
	local rateList = config.Rate
	local discountCur = self._activityShop:getCostRateById(infoData.id)
	local unlock = false

	if infoData.amount and next(infoData.amount) then
		unlock = true
	end

	dayText:setString(config.Day)

	if unlock then
		if discountCur == 1 then
			dayText:enablePattern(cc.LinearGradientPattern:create(kLineGradiantVec[2], lineGradiantDir))
			costText:setString(Strings:get("Activity_Monster_Shop_Surprise_Cost"))
			bg:loadTexture(kImageBg[2], 1)
			bg:ignoreContentAdaptWithSize(true)
			infoBg:setVisible(true)
			time:setVisible(true)
		elseif discountCur == 2 then
			dayText:enablePattern(cc.LinearGradientPattern:create(kLineGradiantVec[1], lineGradiantDir))
			costText:setString(Strings:get("Activity_Monster_Shop_Normal_Cost"))
			bg:loadTexture(kImageBg[1], 1)
			bg:ignoreContentAdaptWithSize(true)
			infoBg:setVisible(false)
			time:setVisible(false)
		end

		maskPanel:setVisible(false)
	else
		dayText:enablePattern(cc.LinearGradientPattern:create(kLineGradiantVec[2], lineGradiantDir))
		costText:setString(Strings:get("Activity_Monster_Shop_Surprise_Cost"))
		bg:loadTexture(kImageBg[2], 1)
		bg:ignoreContentAdaptWithSize(true)
		time:setVisible(false)
		infoBg:setVisible(false)
		maskPanel:setVisible(true)
	end

	for i = 1, 2 do
		local itemData = costList[i]

		if itemData then
			local panel = clonePanel:getChildByFullName("cell_" .. i)
			local iconLayout = panel:getChildByFullName("icon_layout")
			local nameText = panel:getChildByFullName("goods_name")
			local infoPanel = panel:getChildByFullName("info_panel")
			local infoText = infoPanel:getChildByFullName("duihuan_text")
			local oldPrice = panel:getChildByFullName("old_price")
			local costPanel = panel:getChildByFullName("cost")
			local costText = panel:getChildByFullName("cost.cost_text")
			local moneyLayout = panel:getChildByFullName("money_layout")
			local moneyIcon = moneyLayout:getChildByFullName("money_icon")
			local moneyText = moneyLayout:getChildByFullName("money")
			local touchPanel = panel:getChildByFullName("touch_panel")
			local maskPanel1 = panel:getChildByFullName("Mask")
			local imageMark = panel:getChildByFullName("ImageMark")

			maskPanel1:setVisible(false)
			maskPanel1:setSwallowTouches(false)
			nameText:getVirtualRenderer():setOverflow(cc.LabelOverflow.SHRINK)

			local targetItem = RewardSystem:getRewardsById(itemData.Reward)
			local iconInfo = RewardSystem:parseInfo(targetItem[1])

			nameText:setString(RewardSystem:getName(targetItem[1]))

			local icon = IconFactory:createIcon(iconInfo, {
				hideLevel = true,
				showAmount = true,
				isWidget = false
			})

			icon:addTo(iconLayout, -1):center(iconLayout:getContentSize()):setScale(0.7)
			IconFactory:bindTouchHander(iconLayout, IconTouchHandler:new(self), targetItem[1], {
				needDelay = true
			})

			if rateList[discountCur].rate < 1 then
				local localLanguage = getCurrentLanguage()

				if localLanguage == GameLanguageType.CN then
					costText:setString(Strings:get("Activity_Monster_Shop_UI7", {
						num = rateList[discountCur].rate * 10
					}))
				else
					costText:setString(Strings:get("Activity_Monster_Shop_UI7", {
						num = (1 - rateList[discountCur].rate) * 100
					}))
				end

				oldPrice:setString(Strings:get("Activity_Monster_Shop_UI6", {
					num = costList[i].price
				}))
				oldPrice:enableStrikethrough()
			else
				oldPrice:setVisible(false)
			end

			local rateCur = rateList[discountCur] and rateList[discountCur].rate or 1
			local cost = rateCur * costList[i].price
			local costId = costList[i].Item
			local costIcon = IconFactory:createPic({
				id = costId
			}, {
				showWidth = 60
			})

			moneyIcon:removeAllChildren()
			costIcon:addTo(moneyIcon):center(moneyIcon:getContentSize())
			moneyText:setString(tostring(cost))

			local leftCount = itemData.Times

			if infoData.amount and next(infoData.amount) then
				leftCount = infoData.amount[i]
			end

			if leftCount > 0 then
				infoText:setString(Strings:get("Activity_Shop_BuyNumLimit", {
					num1 = leftCount,
					num2 = itemData.Times
				}))
				imageMark:setVisible(false)
			elseif leftCount == -1 then
				infoText:setVisible(false)
				imageMark:setVisible(false)
			elseif leftCount == 0 then
				infoText:setString(Strings:get("Activity_Shop_BuyNumLimit", {
					num1 = leftCount,
					num2 = itemData.Times
				}))
				imageMark:setVisible(true)
				maskPanel1:setVisible(true)
			end

			if unlock then
				local data = {
					id = infoData.id,
					targetInfo = targetItem[1],
					amount = leftCount,
					costId = costId,
					price = cost,
					index = i - 1
				}

				touchPanel:addTouchEventListener(function (sender, eventType)
					self:onClickItem(sender, eventType, data)
				end)
			else
				imageMark:setVisible(false)
			end

			touchPanel:setSwallowTouches(false)
		end
	end
end

function ActivityBlockMonsterShopMediator:updateRemainTime()
	if not self._timer then
		local remoteTimestamp = self._activitySystem:getCurrentTime()
		local endTime = self._activityShop:getEndTime() / 1000

		local function checkTimeFunc()
			remoteTimestamp = self._activitySystem:getCurrentTime()
			local remainTime = endTime - remoteTimestamp

			if remainTime <= 0 then
				self._timer:stop()

				self._timer = nil

				return
			end

			self:refreshRemainTime(remainTime)
			self:refreshOffcostRemainTime(remoteTimestamp, self._activityShop:getStartTime() / 1000, endTime)
		end

		self._timer = LuaScheduler:getInstance():schedule(checkTimeFunc, 1, false)

		checkTimeFunc()
	end
end

function ActivityBlockMonsterShopMediator:refreshRemainTime(remainTime)
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
		str = timeTab.day .. Strings:get("TimeUtil_Day") .. timeTab.hour .. Strings:get("TimeUtil_Hour")
	elseif timeTab.hour > 0 then
		str = timeTab.hour .. Strings:get("TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min")
	else
		str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
	end

	local timeBefore = self._timePanel:getChildByName("Text_before")
	local textEn = self._timePanel:getChildByName("Text_en")

	textEn:setVisible(false)

	local timeText = self._timePanel:getChildByName("Text_time")
	local timeAfter = self._timePanel:getChildByName("Text_after")

	timeText:setPositionX(timeBefore:getPositionX() + timeBefore:getContentSize().width)
	timeText:setString(str)
	timeAfter:setPositionX(timeText:getPositionX() + timeText:getContentSize().width)

	if getCurrentLanguage() ~= GameLanguageType.CN then
		timeText:setVisible(false)
		timeAfter:setVisible(false)
		timeBefore:setVisible(false)
		textEn:setVisible(true)
		textEn:setString(Strings:get("Activity_Monster_Shop_UI3", {
			time = str
		}))
	end
end

function ActivityBlockMonsterShopMediator:refreshOffcostRemainTime(remoteTime, startTime, endTime)
	for i = 1, #self._curShopItems do
		local infoData = self._curShopItems[i]
		local config = infoData.config
		local unlockDay = config.Day - 1
		local costoffDays = config.Rate[1].day[2] or 0

		print("refreshOffcostRemainTime_startTime" .. startTime)

		local unLockSec = unlockDay > 0 and unlockDay * 86400 or 0
		local trueStartTime_Cell = startTime + unLockSec
		local trueEndTime_Cell = trueStartTime_Cell + costoffDays * 86400
		local trueRemainTime_Cell = trueEndTime_Cell - remoteTime
		local activityRemoteTime = endTime - remoteTime
		local str = ""

		if startTime < remoteTime and activityRemoteTime > 0 and trueRemainTime_Cell > 0 and costoffDays > 0 then
			if activityRemoteTime < trueRemainTime_Cell then
				trueRemainTime_Cell = activityRemoteTime
			end

			local fmtStr = "${d}:${H}:${M}:${S}"
			local timeStr = TimeUtil:formatTime(fmtStr, trueRemainTime_Cell)
			local parts = string.split(timeStr, ":", nil, true)
			local timeTab = {
				day = tonumber(parts[1]),
				hour = tonumber(parts[2]),
				min = tonumber(parts[3]),
				sec = tonumber(parts[4])
			}

			if timeTab.day > 0 then
				str = timeTab.day .. Strings:get("TimeUtil_Day") .. timeTab.hour .. Strings:get("TimeUtil_Hour")
			elseif timeTab.hour > 0 then
				str = timeTab.hour .. Strings:get("TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min")
			elseif timeTab.min > 0 then
				str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
			else
				str = timeTab.sec .. Strings:get("TimeUtil_Sec")
			end
		end

		local panel = self._scrollView:getChildByTag(i)

		if panel then
			local infoBg = panel:getChildByFullName("clonePanel.info_panel.Image_bg")
			local time = panel:getChildByFullName("clonePanel.info_panel.time")

			if time then
				if str and str ~= "" then
					time:setString(str)
					infoBg:setContentSize(cc.size(27 + time:getContentSize().width, 20))
				else
					infoBg:setVisible(false)
					time:setVisible(false)
				end
			end
		end

		if i == #self._curShopItems then
			panel = self._limitView
			local infoBg = panel:getChildByFullName("info_panel.Image_bg")
			local time = panel:getChildByFullName("info_panel.time")

			if time then
				if str and str ~= "" then
					time:setString(str)
					infoBg:setContentSize(cc.size(27 + time:getContentSize().width, 20))
				else
					infoBg:setVisible(false)
					time:setVisible(false)
				end
			end
		end
	end
end

function ActivityBlockMonsterShopMediator:onClickExchange(sender, eventType)
	if self._activitySystem:isActivityOver(self._activityShop) then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Activity_Block_Wsj_endtip")
		}))

		return
	end

	if self._maxNum <= self._moneyNum then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Activity_Monster_Shop_Tip1")
		}))

		return
	end

	local moneyId, moneyNum, overflow = self:candySellResult()

	if moneyNum > 0 then
		local view = self:getInjector():getInstance("ActivityBlockMonsterShopPopupView")

		if view then
			local data = {
				lineNum = 3,
				activityId = self._activityShop:getActivityId(),
				desc = Strings:get("Activity_Monster_Shop_Sell_UI1"),
				overflowString = Strings:get("Activity_Monster_Shop_Sell_UI2"),
				func = bind1(self.candyExchange, self),
				filter = bind1(self.candyListFilter, self),
				moneyFunc = bind1(self.candySellResult, self)
			}

			AudioEngine:getInstance():playEffect("Se_Click_Select_1", false)
			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, data))
		end
	else
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Activity_Monster_Shop_Tip2")
		}))
	end
end

function ActivityBlockMonsterShopMediator:candyExchange()
	if self._activity:getType() ~= ActivityType.KMonsterShop then
		self._activitySystem:monsterShopCandyExchange(self._activity:getActivityId(), self._activityShop:getActivityId(), function ()
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Activity_Monster_Shop_Tip3")
			}))
		end)
	else
		self._activitySystem:monsterShopCandyExchange(self._activity:getActivityId(), nil, function ()
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Activity_Monster_Shop_Tip3")
			}))
		end)
	end
end

function ActivityBlockMonsterShopMediator:candyListFilter()
	local list = self._activityConfig.Change

	local function filterFunc(entry)
		if entry and entry.item then
			for i = 1, #list do
				for k, v in pairs(list[i]) do
					if entry.item:getId() == k then
						return true
					end
				end
			end

			return false
		end
	end

	local bagItems = self._bagSystem:getAllEntryIds(filterFunc)

	return bagItems
end

function ActivityBlockMonsterShopMediator:candySellResult()
	local moneyId = self._activityConfig.Price
	local moneyNum = 0
	local overflow = 1
	local list = self._activityConfig.Change

	local function filterFunc(entry)
		if entry and entry.item then
			for i = 1, #list do
				for k, v in pairs(list[i]) do
					if entry.item:getId() == k then
						return true
					end
				end
			end

			return false
		end
	end

	local bagItems = self._bagSystem:getAllEntryIds(filterFunc)

	for index = 1, #bagItems do
		local id = bagItems[index]
		local data = self._bagSystem:getEntryById(id)
		local price = 0

		if data and data.item then
			for i = 1, #list do
				for k, v in pairs(list[i]) do
					if data.item:getId() == k then
						price = tonumber(v)
					end
				end
			end

			moneyNum = moneyNum + data.count * price
		end
	end

	if self._maxNum < moneyNum + self._moneyNum then
		moneyNum = self._maxNum - self._moneyNum
		overflow = 1
	end

	return moneyId, moneyNum, overflow
end

function ActivityBlockMonsterShopMediator:onClickRule()
	local rules = self._activityShop:getActivityConfig().RuleDesc

	self._activitySystem:showActivityRules(rules)
end

function ActivityBlockMonsterShopMediator:onClickItem(sender, eventType, data)
	if data.amount == 0 then
		return
	end

	if self._activitySystem:isActivityOver(self._activityShop) then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Activity_Block_Wsj_endtip")
		}))

		return
	end

	if eventType == ccui.TouchEventType.ended then
		local view = self:getInjector():getInstance("ActivityBlockMonsterShopBuyItemView")

		if view then
			self._lastPostion = self._scrollView:getInnerContainerPosition()

			AudioEngine:getInstance():playEffect("Se_Click_Select_1", false)
			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, {
				shopType = 1,
				itemData = data,
				activityId = self._activity:getActivityId(),
				subActivityId = self._activityShop:getActivityId()
			}))
		end
	end
end

function ActivityBlockMonsterShopMediator:onClickBack(sender, eventType)
	self:dismiss()
end
