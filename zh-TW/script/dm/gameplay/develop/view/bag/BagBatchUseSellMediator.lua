BagBatchUseSellMediator = class("BagBatchUseSellMediator", DmPopupViewMediator, _M)
local kBtnHandlers = {
	["window.minusbtn"] = {
		ignoreClickAudio = true,
		eventType = 4,
		func = "onChangeClicked"
	},
	["window.addbtn"] = {
		ignoreClickAudio = true,
		eventType = 4,
		func = "onChangeClicked"
	},
	["window.maxbtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickMax"
	}
}
local waitingClose = false

function BagBatchUseSellMediator:initialize()
	super.initialize(self)
end

function BagBatchUseSellMediator:dispose()
	self:closeChangeScheduler()
	super.dispose(self)
end

function BagBatchUseSellMediator:userInject()
	self._developSystem = self:getInjector():getInstance(DevelopSystem)
	self._bagSystem = self._developSystem:getBagSystem()
end

function BagBatchUseSellMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_SELL_ITEM_SUCC, self, self.onSellSucc)

	self._sellBtn = self:bindWidget("window.sellbtn", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onClickSell, self)
		}
	})
	self._useBtn = self:bindWidget("window.usebtn", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onClickUse, self)
		}
	})
end

function BagBatchUseSellMediator:enterWithData(data)
	assert(data ~= nil, "error:data=nil")
	assert(data.selectType ~= nil, "error:data.selectType=nil")
	assert(data.entryId ~= nil, "error:data.entryId=nil")

	self._data = data
	self._selectType = data.selectType
	self._entryId = data.entryId
	self._entry = self._bagSystem:getEntryById(self._entryId)
	self._isAdd = true
	waitingClose = false

	self:setupUseBaseNum()
	self:setupView(data)

	self._curCount = self._maxCount

	self._slider:setPercent(self._curCount / self._maxCount * 100)
	self:updateView()
end

function BagBatchUseSellMediator:setupUseBaseNum()
	self._useBaseNum = 1
	local item = self._entry.item

	if item:getType() == ItemPages.kConsumable and item:getSubType() == ItemTypes.K_HEROSTONE_F then
		local config = ConfigReader:getRecordById("ConfigValue", "HeroStone_FragmentCost").content
		self._useBaseNum = config[self._entryId] or 1
	end
end

function BagBatchUseSellMediator:setupView(data)
	local mainPanel = self:getView():getChildByFullName("window")
	local bgNode = mainPanel:getChildByFullName("tipnode")

	bindWidget(self, bgNode, PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onBackClicked, self)
		},
		title = data.title or "",
		title1 = data.title1 or "",
		bgSize = {
			width = 837,
			height = 474
		}
	})

	local iconBg = mainPanel:getChildByFullName("iconpanel")
	local item = self._entry.item
	local icon = IconFactory:createIcon({
		id = item:getConfigId()
	})

	icon:addTo(iconBg):center(iconBg:getContentSize())
	icon:setScale(0.8)

	local nameLabel = mainPanel:getChildByFullName("namelabel")

	nameLabel:setString(item:getName())
	GameStyle:setQualityText(nameLabel, item:getQuality())

	local sellPanel = mainPanel:getChildByFullName("sellpanel")
	local useDesc = mainPanel:getChildByFullName("itemDesc")

	sellPanel:setVisible(self._selectType == SelectItemType.kForSell)
	useDesc:setVisible(self._selectType == SelectItemType.kForUse)
	self._sellBtn:setVisible(sellPanel:isVisible())
	self._useBtn:setVisible(self._selectType == SelectItemType.kForUse)

	self._countlabel = mainPanel:getChildByFullName("countlabel")
	local countDescLabel = mainPanel:getChildByFullName("costlabel")
	self._minCount = 1

	if self._selectType == SelectItemType.kForUse then
		_, self._batchMaxCnt = self._bagSystem:getItemBatchUseCount()

		countDescLabel:setString(Strings:get("bag_UI12"))
		useDesc:setString(item:getDesc() or "")

		self._maxCount = math.min(self._batchMaxCnt, math.floor(self._entry.count / self._useBaseNum))

		if self._maxCount <= 0 then
			self._countlabel:setColor(cc.c3b(255, 0, 0))
			self._useBtn:getButton():setEnabled(false)
			self._useBtn:getButton():setGray(true)
		end
	elseif self._selectType == SelectItemType.kForSell then
		self._maxCount = self._entry.count

		countDescLabel:setString(Strings:get("bag_UI11"))
	end

	self._sellCountLabel = sellPanel:getChildByFullName("costnumlabel")
	self._minusBtn = mainPanel:getChildByFullName("minusbtn")
	self._addBtn = mainPanel:getChildByFullName("addbtn")
	self._maxBtn = mainPanel:getChildByFullName("maxbtn")
	self._slider = mainPanel:getChildByFullName("slider")

	self._slider:setScale9Enabled(true)
	self._slider:setCapInsets(cc.rect(43, 2, 32, 2))
	self._slider:setCapInsetsBarRenderer(cc.rect(1, 1, 1, 1))
	self._slider:addEventListener(function (sender, eventType)
		if eventType == ccui.SliderEventType.percentChanged then
			if self._curCount == 0 then
				self._slider:setPercent(0)
			else
				local percent = self._slider:getPercent()

				if percent == 0 then
					self._curCount = 1
				else
					local count = math.ceil(percent / 100 * self._maxCount)
					self._curCount = math.min(count, self._maxCount)
				end

				self:updateView()
				self:closeChangeScheduler()
			end
		end
	end)
end

function BagBatchUseSellMediator:updateView()
	self._countlabel:setString(self._curCount * self._useBaseNum .. "/" .. self._entry.count)
	self._slider:setPercent(self._curCount / self._maxCount * 100)

	if self._selectType == SelectItemType.kForSell then
		local item = self._entry.item
		local sellPrice = self._curCount * item:getSellNumber()

		self._sellCountLabel:setString(tostring(sellPrice))
	end

	self._maxBtn:setEnabled(self._curCount < self._maxCount)
	self._minusBtn:setEnabled(self._curCount > 1)
	self._minusBtn:setGray(self._curCount <= 1)
	self._addBtn:setGray(self._curCount == self._maxCount)
end

function BagBatchUseSellMediator:onClickMax(sender, eventType)
	self._curCount = self._maxCount

	self._slider:setPercent(100)
	self:updateView()
end

function BagBatchUseSellMediator:onClickSell(sender, eventType)
	if self._minCount <= self._curCount and self._curCount <= self._maxCount then
		waitingClose = true

		self._bagSystem:requestSellItem(self._entryId, self._curCount)
	end
end

function BagBatchUseSellMediator:onSellSucc(event)
	if self._selectType == SelectItemType.kForSell then
		waitingClose = false

		self:closeChangeScheduler()
		self:close()
		AudioEngine:getInstance():playEffect("Se_Alert_Sell", false)
	end
end

function BagBatchUseSellMediator:onClickUse(sender, eventType)
	local item = self._entry.item

	if item:getSubType() == ComsumableKind.kActionPoint then
		local maxEnergy = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Stamina_Max", "content")
		local curEnergy = self._developSystem:getEnergy()
		local rewards = item:getReward()
		local rewardCount = rewards[1].amount

		if maxEnergy < curEnergy + rewardCount * self._curCount then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Tips_1160002")
			}))

			return
		end
	end

	if item:getSubType() == ItemTypes.K_HEROSTONE_F then
		waitingClose = true

		self._bagSystem:requestHeroStoneCompose(item:getId(), self._curCount, function (data)
			waitingClose = false

			self._bagSystem:showNewHero(data, 1)
			self:closeChangeScheduler()
			self:close()
		end)

		return
	end

	if self._minCount <= self._curCount and self._curCount <= self._maxCount then
		local canUse = self._bagSystem:tryUseActionPointItem(self._entryId, self._curCount)

		if canUse then
			self:closeChangeScheduler()
			self:close()
		end
	end
end

function BagBatchUseSellMediator:onBackClicked(sender, eventType)
	self:closeChangeScheduler()
	self:close()
end

function BagBatchUseSellMediator:onChangeClicked(sender, eventType)
	if waitingClose then
		return
	end

	if eventType == ccui.TouchEventType.began then
		self._isAdd = sender == self._addBtn

		self:createChangeScheduler()
		AudioEngine:getInstance():playEffect("Se_Click_Common_2", false)
	elseif eventType == ccui.TouchEventType.canceled or eventType == ccui.TouchEventType.ended then
		self:updateView()
		self:closeChangeScheduler()
	end
end

function BagBatchUseSellMediator:update()
	local addNum = self._isAdd and 1 or -1
	self._curCount = self._curCount + addNum
	self._curCount = math.ceil(self._curCount)

	if self._curCount <= 1 then
		self._curCount = 1
	end

	if self._maxCount <= self._curCount then
		self._curCount = self._maxCount
	end

	self:updateView()
end

function BagBatchUseSellMediator:createChangeScheduler()
	self:closeChangeScheduler()

	if self._changeScheduler == nil then
		self._changeScheduler = LuaScheduler:getInstance():schedule(function ()
			self:update()
		end, 0.2, true)
	end
end

function BagBatchUseSellMediator:closeChangeScheduler()
	if self._changeScheduler then
		LuaScheduler:getInstance():unschedule(self._changeScheduler)

		self._changeScheduler = nil
	end
end
