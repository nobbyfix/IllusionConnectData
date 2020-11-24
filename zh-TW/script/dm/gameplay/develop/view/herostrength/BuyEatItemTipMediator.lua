require("dm.gameplay.base.URLContext")
require("dm.gameplay.base.UrlEntry")

BuyEatItemTipMediator = class("BuyEatItemTipMediator", SourceMediator, _M)

BuyEatItemTipMediator:has("_player", {
	is = "r"
}):injectWith("Player")
BuyEatItemTipMediator:has("_stageSystem", {
	is = "r"
}):injectWith("StageSystem")
BuyEatItemTipMediator:has("_spStageSystem", {
	is = "r"
}):injectWith("SpStageSystem")
BuyEatItemTipMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")

local kBtnHandlers = {}

function BuyEatItemTipMediator:enterWithData(data)
	self._itemData = data
	self._stageType = SpStageType.kExp
	self._stageData = kSpStageTeamAndPointType[self._stageType]
	self._unlock = self._systemKeeper:isUnlock(self._stageData.unlockType)
	local spStageIds = ConfigReader:getRecordById("ConfigValue", "StageSp_List").content
	self._stageId = spStageIds[self._stageType]
	self._rewards = self._spStageSystem:getRewardById(self._stageId)
	self._title = Strings:get("StageSp_Exp_Name")
	self._sourceList = {}
	local stageConfig = self._spStageSystem:getPointConfigByType(self._stageType)

	if stageConfig then
		local closeConfig = {}

		for i = 1, #stageConfig do
			local data = stageConfig[i]
			local pointId = data.Id
			local close = self._spStageSystem:isPointClose(self._stageId, pointId)

			if not close then
				self._sourceList[#self._sourceList + 1] = data
			else
				closeConfig[#closeConfig + 1] = data
			end
		end

		table.sort(self._sourceList, function (a, b)
			return b.Difficulty < a.Difficulty
		end)

		for i = 1, #closeConfig do
			local data = closeConfig[i]
			self._sourceList[#self._sourceList + 1] = data
		end
	end

	self:setUpView()
end

function BuyEatItemTipMediator:setUpView()
	self._noTips = self._main:getChildByName("Text_notips")

	self._noTips:setVisible(false)

	local descText = self._main:getChildByFullName("Text_desc")

	descText:setString("")
	self:createSourceList()
	self:refreshView()
end

function BuyEatItemTipMediator:refreshView()
	local needCountLabel = self._main:getChildByName("Text_needcount")

	needCountLabel:setString("")

	local ownCountLabel = self._main:getChildByName("Text_owncount")

	ownCountLabel:setString("")

	local hasNum = self._bagSystem:getItemCount(self._itemData.itemId)
	local itemPanel = self._main:getChildByFullName("itemPanel")

	itemPanel:removeAllChildren()

	local info = {
		id = self._itemData.itemId,
		amount = hasNum
	}
	local icon = IconFactory:createItemIcon(info, {
		showAmount = false,
		isWidget = true
	})

	icon:addTo(itemPanel):center(itemPanel:getContentSize())
	icon:setScale(0.8)

	local nameLabel = self._main:getChildByFullName("nameLabel")

	nameLabel:setString(RewardSystem:getName({
		id = self._itemData.itemId
	}))
	GameStyle:setQualityText(nameLabel, RewardSystem:getQuality({
		id = self._itemData.itemId
	}))

	if self._tabelView then
		self._tabelView:reloadData()
	end
end

function BuyEatItemTipMediator:createCell(cell, index)
	local data = self._sourceList[index]
	local pointId = data.Id
	local close = self._spStageSystem:isPointClose(self._stageId, pointId)
	local blockPanel = cell:getChildByName("block")

	if not blockPanel then
		blockPanel = self._blockPanel:clone()

		blockPanel:addTo(cell):posite(29, 35)
		blockPanel:setName("block")
	end

	blockPanel:setVisible(true)

	local titleText = cell:getChildByName("Text_name")

	titleText:setVisible(true)
	titleText:setString(self._title .. " " .. Strings:get(data.PointName))

	local goBtn = cell:getChildByName("btn_go")
	local notopenImg = cell:getChildByName("Image_notopen")

	notopenImg:setVisible(not self._unlock or close)
	goBtn:setVisible(self._unlock and not close)
	goBtn:addClickEventListener(function ()
		self:onClickGo(data)
	end)

	local targetImg = blockPanel:getChildByFullName("targetImg")

	targetImg:setVisible(false)

	if blockPanel:getChildByFullName("blockname") then
		cell:getChildByFullName("Text_desc"):removeFromParent()
		blockPanel:getChildByFullName("blockname"):removeFromParent()
		blockPanel:getChildByFullName("challengetimes"):removeFromParent()
		blockPanel:getChildByFullName("starPanel"):removeFromParent()
		blockPanel:getChildByFullName("btn_wipeone"):removeFromParent()
		blockPanel:getChildByFullName("btn_wipemulti"):removeFromParent()
	end

	for i = 1, 4 do
		local rewardData = self._rewards[i]
		local iconBg = blockPanel:getChildByName("icon" .. i)

		iconBg:removeAllChildren()

		if rewardData then
			local icon = IconFactory:createRewardIcon(rewardData, {
				isWidget = true
			})

			IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewardData, {
				needDelay = true
			})
			icon:setScaleNotCascade(0.52)
			icon:addTo(iconBg):center(iconBg:getContentSize())

			if self._itemData.itemId == tostring(rewardData.code) then
				local posX = iconBg:getPositionX() + iconBg:getContentSize().width / 2
				local posY = iconBg:getPositionY() + iconBg:getContentSize().height / 2

				targetImg:setPosition(cc.p(posX, posY))
				targetImg:setVisible(true)
			end
		end
	end
end

function BuyEatItemTipMediator:onClickGo(data)
	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
	self._spStageSystem:tryEnter({
		spType = self._stageType
	})

	local params = {
		stageType = self._stageType,
		stageId = self._stageId,
		pointId = data.Id,
		difficulty = data.Difficulty
	}
	local view = self:getInjector():getInstance("SpStageDftView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, params, nil))
end

function BuyEatItemTipMediator:setupClickEnvs()
	if GameConfigs.closeGuide then
		return
	end

	local sequence = cc.Sequence:create(cc.CallFunc:create(function ()
		local storyDirector = self:getInjector():getInstance(story.StoryDirector)

		if self._tabelView then
			for i = 1, #self._sourceList do
				local index = i
				local cell = self._tabelView:cellAtIndex(index - 1)

				if cell then
					local cell_Old = cell:getChildByTag(123)
					local goBtn = cell_Old:getChildByName("btn_go")

					storyDirector:setClickEnv("SourceView.goBtn" .. index, goBtn, function (sender, eventType)
						local sourceId = self._sourceList[index]
						local sourceConfig = ConfigReader:getRecordById("ItemResource", tostring(sourceId))

						self:onClickGo(sourceConfig)
					end)
				end
			end
		end

		storyDirector:notifyWaiting("enter_Source_View")
	end))

	self:getView():runAction(sequence)
end
