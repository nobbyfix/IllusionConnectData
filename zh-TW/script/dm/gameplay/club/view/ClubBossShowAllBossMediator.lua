ClubBossShowAllBossMediator = class("ClubBossShowAllBossMediator", DmAreaViewMediator)

ClubBossShowAllBossMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ClubBossShowAllBossMediator:has("_clubSystem", {
	is = "r"
}):injectWith("ClubSystem")

local kBtnHandlers = {
	["main.allGetBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickAllGet"
	},
	["main.battleBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickBattleBtn"
	}
}

function ClubBossShowAllBossMediator:initialize()
	super.initialize(self)
end

function ClubBossShowAllBossMediator:dispose()
	super.dispose(self)
end

function ClubBossShowAllBossMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListeners()

	local view = self:getView()
	self._doEnterAction = true
end

function ClubBossShowAllBossMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUBBOSS_REFRESH, self, self.onDoRefrsh)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUB_FORCEDLEVEL, self, self.onForcedLevel)
end

function ClubBossShowAllBossMediator:enterWithData(data)
	if data and data.viewType then
		self._viewType = data.viewType
	end

	self:initData()
	self:initNodes()
	self:setupTopInfoWidget()
	self:createTableView()
	self:setOffSetToCurrentLevel()
	self:doBtnLogic()
	self:runStartAction()
end

function ClubBossShowAllBossMediator:onDoRefrsh(event)
	local data = event:getData()

	if data and data.viewType ~= self._viewType then
		return
	end

	self:refreshData()
	self:refreshView()
end

function ClubBossShowAllBossMediator:onForcedLevel(event)
	local data = event:getData()

	if data and data.viewType ~= self._viewType then
		return
	end

	self:dismiss()
end

function ClubBossShowAllBossMediator:doBtnLogic()
	if self._clubBossInfo:checkHasRewardCanGet() == true then
		self._allGetBtn:setTouchEnabled(true)
		self._allGetBtn:setVisible(true)
	end

	if self._clubBossInfo:checkHasRewardCanGet() == false then
		self._allGetBtn:setTouchEnabled(false)
		self._allGetBtn:setVisible(false)
	end
end

function ClubBossShowAllBossMediator:refreshData()
	self._clubBossInfo = self._developSystem:getPlayer():getClub():getClubBossInfo(self._viewType)
	self._currentBossPoints = self._clubBossInfo:getBossPointsByPonitId(self._clubBossInfo:getNowPoint())
	self._allData = {}
	self._allData = self._clubBossInfo:getShowAllBossList()
end

function ClubBossShowAllBossMediator:refreshView()
	if self._tableView == nil then
		self:createTableView()
	end

	local offsetX = self._tableView:getContentOffset().x

	self._tableView:reloadData()
	self._tableView:setContentOffset(cc.p(offsetX, 0))
	self:doBtnLogic()
end

function ClubBossShowAllBossMediator:initData()
	self._clubBossInfo = self._developSystem:getPlayer():getClub():getClubBossInfo(self._viewType)
	self._currentBossPoints = self._clubBossInfo:getBossPointsByPonitId(self._clubBossInfo:getNowPoint())
	self._allData = {}
	self._allData = self._clubBossInfo:getShowAllBossList()
end

function ClubBossShowAllBossMediator:initNodes()
	self._mainPanel = self:getView():getChildByFullName("main")
	self._mainBg = self._mainPanel:getChildByFullName("ImageBg")
	self._tablePanel = self._mainPanel:getChildByFullName("tablePanel")
	self._cellPanel = self._mainPanel:getChildByFullName("cellPanel")

	self._cellPanel:setVisible(false)

	self._buffNode = self._mainPanel:getChildByFullName("buffNode")

	self._buffNode:setVisible(false)

	self._desNode = self._mainPanel:getChildByFullName("desNode")

	self._desNode:setVisible(false)

	self._allGetBtn = self._mainPanel:getChildByFullName("allGetBtn")
	self._battleBtn = self._mainPanel:getChildByFullName("battleBtn")

	self._battleBtn:setVisible(false)
	self._battleBtn:setTouchEnabled(false)
end

function ClubBossShowAllBossMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByName("topinfo_node")
	local config = {
		style = 1,
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		title = Strings:get("clubBoss_24")
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function ClubBossShowAllBossMediator:setOffSetToCurrentLevel()
	local width = self._cellPanel:getContentSize().width
	local currentPointNum = self._clubBossInfo:getNowPointNum()

	if currentPointNum > 3 then
		self._tableView:setContentOffset(cc.p(-width * (currentPointNum - 3), 0))
	end

	self._battleBtn:setVisible(false)
	self._battleBtn:setTouchEnabled(false)
end

function ClubBossShowAllBossMediator:createTableView()
	local function cellSizeForTable(table, idx)
		return 200, 520
	end

	local function scrollViewDidScroll(table)
		if table:isTouchMoved() then
			self:refreshBackBtn()
		end
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
			local layout = ccui.Layout:create()

			layout:addTo(cell):posite(0, 0)
			layout:setAnchorPoint(cc.p(0, 0))
			layout:setTag(123)
		end

		local cell_Old = cell:getChildByTag(123)

		self:createCell(cell_Old, self._allData[idx + 1])
		cell:setTag(idx)

		return cell
	end

	local function numberOfCellsInTableView(table)
		return #self._allData
	end

	local tableView = cc.TableView:create(self._tablePanel:getContentSize())
	self._tableView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
	tableView:setDelegate()
	tableView:setPosition(0, 0)
	tableView:setAnchorPoint(0, 0)
	tableView:setMaxBounceOffset(36)
	self._tablePanel:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
	tableView:setTouchEnabled(false)
	tableView:reloadData()
	tableView:setDeaccelRate(0)
	tableView:setBounceable(false)
end

function ClubBossShowAllBossMediator:createCell(cell, data)
	cell:removeAllChildren()

	local panel = self._cellPanel:clone()

	panel:setVisible(true)
	panel:addTo(cell):posite(0, 0)
	panel:setTag(1234)

	local titlePanel = panel:getChildByFullName("titlePanel")

	titlePanel:setVisible(false)

	local heroPanel = panel:getChildByFullName("heroPanel")

	heroPanel:setTouchEnabled(true)
	heroPanel:setSwallowTouches(false)
	heroPanel:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			local beganPos = sender:getTouchBeganPosition()
			local movedPos = sender:getTouchEndPosition()
			local xOffset = math.abs(beganPos.x - movedPos.x)

			if xOffset <= 30 then
				AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
				self:onClickHeroPanel(sender, data)
			end
		end
	end)

	local ClubBoss_HeroModel = ConfigReader:getDataByNameIdAndKey("ConfigValue", "ClubBoss_HeroModel", "content")
	local tableConfig = data:getTableConfig()

	if tableConfig ~= nil and tableConfig.ShowKillReward ~= nil then
		local rewardStatus = self._clubBossInfo:checkHasGetHurtAward(data:getPointNum(), nil)
		local rewards = ConfigReader:getRecordById("Reward", tableConfig.ShowKillReward).Content
		local rewardData = rewards[1]
		local IsRewardBox = self:checkIsRewardBox(rewardData)

		if IsRewardBox == true then
			local iconNode = panel:getChildByFullName("iconNode")

			iconNode:setVisible(false)

			local boxPanel = panel:getChildByFullName("boxNode.boxPanel")

			boxPanel:setRotation(45)
			boxPanel:setTouchEnabled(true)
			boxPanel:setSwallowTouches(false)
			boxPanel:addTouchEventListener(function (sender, eventType)
				if eventType == ccui.TouchEventType.ended then
					AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
					self:onClickRewardPanel(sender, IsRewardBox, rewardStatus, data:getPointId())
				end
			end)

			local cannotGetNode = panel:getChildByFullName("boxNode.cannotGetNode")
			local canGetNode = panel:getChildByFullName("boxNode.canGetNode")
			local hasGetNode = panel:getChildByFullName("boxNode.hasGetNode")

			cannotGetNode:setVisible(false)
			canGetNode:setVisible(false)
			hasGetNode:setVisible(false)

			if rewardStatus == ClubBossHurtRewardStatus.kCanNotGet then
				local cannotGetNode = panel:getChildByFullName("boxNode.cannotGetNode")

				cannotGetNode:setVisible(true)

				local animNode_zac = cannotGetNode:getChildByName("animNode_zac")
				local mc = cc.MovieClip:create("zac_baoxiang")

				mc:addTo(animNode_zac)
				mc:gotoAndStop(1)
				mc:setScale(0.7)
			end

			if rewardStatus == ClubBossHurtRewardStatus.kCanGet then
				local canGetNode = panel:getChildByFullName("boxNode.canGetNode")

				canGetNode:setVisible(true)

				local animNode_zac = canGetNode:getChildByName("animNode_zaa")
				local mc = cc.MovieClip:create("zaa_baoxiang")

				mc:addTo(animNode_zac)
				mc:setScale(0.7)
				mc:gotoAndStop(1)
			end

			if rewardStatus == ClubBossHurtRewardStatus.kHadGet or rewardStatus == ClubBossHurtRewardStatus.kCannotGetButTip then
				local hasGetNode = panel:getChildByFullName("boxNode.hasGetNode")

				hasGetNode:setVisible(true)

				local darkPanel = panel:getChildByFullName("boxNode.hasGetNode.darkPanel")

				darkPanel:setRotation(45)
			end
		else
			local boxPanel = panel:getChildByFullName("boxNode")

			boxPanel:setVisible(false)

			local iconPanel = panel:getChildByFullName("iconNode.iconPanel")

			iconPanel:setTouchEnabled(true)
			iconPanel:setSwallowTouches(false)
			iconPanel:addTouchEventListener(function (sender, eventType)
				if eventType == ccui.TouchEventType.ended then
					AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
					self:onClickRewardPanel(sender, IsRewardBox, rewardStatus, data:getPointId())
				end
			end)

			local itmeNode = panel:getChildByFullName("iconNode.itemNode")
			local icon = IconFactory:createRewardIcon(rewardData, {
				isWidget = true
			})

			icon:addTo(itmeNode)
			icon:setPosition(cc.p(35, 35))
			icon:setScale(0.5)
			IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewardData, {
				needDelay = true
			})

			local darkPanel = panel:getChildByFullName("iconNode.darkPanel")

			darkPanel:setVisible(false)

			local darkImage = panel:getChildByFullName("iconNode.darkImage")

			darkImage:setVisible(false)

			local redPoint = panel:getChildByFullName("iconNode.redPoint")

			redPoint:setVisible(false)

			if rewardStatus == ClubBossHurtRewardStatus.kHadGet then
				darkPanel:setVisible(true)
				darkImage:setVisible(true)
			end

			if rewardStatus == ClubBossHurtRewardStatus.kCannotGetButTip then
				darkPanel:setVisible(true)
			end

			if rewardStatus == ClubBossHurtRewardStatus.kCanGet then
				redPoint:setVisible(true)
			end
		end
	end

	local pointNum = data:getPointNum()
	local pointType = data:getPointType()
	local modelId = ""
	local nameStr = ""
	local anim = nil
	local animNode = panel:getChildByFullName("modelNode.animNode")

	if data:getPassTime() ~= nil and data:getPassTime() > 0 then
		if data:getWinShowId() ~= nil then
			local anim = cc.MovieClip:create("juesezhantai_shetuanzhanlipin")

			anim:addTo(animNode, 1)
			anim:setTag(12345)

			local bossNode = anim:getChildByName("bossNode")
			local animNode = panel:getChildByFullName("modelNode.animNode")
			local roleModel = ConfigReader:getRecordById("HeroBase", data:getWinShowId()).RoleModel
			local heroImg, jsonPath = RoleFactory:createHeroAnimation(roleModel)

			bossNode:addChild(heroImg)
			heroImg:setPositionY(-65)
			heroImg:setScale(checknumber(ClubBoss_HeroModel))

			if self._doEnterAction then
				anim:gotoAndStop(1)
			else
				anim:gotoAndPlay(20)
			end

			anim:addCallbackAtFrame(100, function ()
				anim:stop()
			end)
		end

		if data:getWinName() ~= nil then
			nameStr = data:getWinName() .. Strings:get("clubBoss_29")
		end
	else
		local currentBlockConfig = data:getBlockConfig()

		if currentBlockConfig ~= nil then
			if pointNum == self._clubBossInfo:getNowPointNum() then
				local anim = cc.MovieClip:create("boss_shetuanzhanlipin")

				anim:addTo(animNode, 1)
				anim:setTag(12345)

				local titleNode = anim:getChildByName("titleNode")
				local titlePanelClone = titlePanel:clone()

				titlePanelClone:setVisible(true)
				titlePanelClone:addTo(titleNode)
				anim:addCallbackAtFrame(6, function ()
					local bossNode = anim:getChildByName("bossNode")

					if currentBlockConfig.PointHead ~= nil then
						local layout = ccui.Layout:create()

						layout:setContentSize(cc.size(1, 1))
						layout:setPosition(cc.p(0, 0))
						bossNode:addChild(layout)

						local modelSprite, jsonPath = RoleFactory:createHeroAnimation(currentBlockConfig.PointHead)

						modelSprite:setScale(data:getZoom())
						modelSprite:setPositionY(-80)
						layout:addChild(modelSprite)
						layout:setFlippedX(true)
					end
				end)

				if self._doEnterAction then
					anim:gotoAndStop(1)
				else
					anim:gotoAndPlay(1)
				end

				anim:addCallbackAtFrame(100, function ()
					anim:stop()
				end)
			else
				local anim = cc.MovieClip:create("juesedandu_shetuanzhanlipin")

				anim:addTo(animNode, 1)
				anim:setTag(12345)

				if self._doEnterAction then
					anim:gotoAndStop(1)
				else
					anim:gotoAndPlay(1)
				end

				local bossNode = anim:getChildByName("bossNode")

				if currentBlockConfig.PointHead ~= nil then
					local layout = ccui.Layout:create()

					layout:setContentSize(cc.size(1, 1))
					layout:setPosition(cc.p(0, 0))
					bossNode:addChild(layout)

					local modelSprite, jsonPath = RoleFactory:createHeroAnimation(currentBlockConfig.PointHead)

					modelSprite:setScale(data:getZoom())
					modelSprite:setPositionY(-65)
					layout:addChild(modelSprite)
					layout:setFlippedX(true)
				end

				anim:addCallbackAtFrame(100, function ()
					anim:stop()
				end)
			end

			if currentBlockConfig.EnemyMaster ~= nil then
				local EnemyMasterConfig = ConfigReader:getRecordById("EnemyMaster", currentBlockConfig.EnemyMaster)

				if EnemyMasterConfig.Name then
					nameStr = data:getPointName() .. "  " .. Strings:get(EnemyMasterConfig.Name)
				end
			end
		end
	end

	if nameStr ~= "" then
		local nameText = panel:getChildByFullName("modelNode.nameBg.nameText")

		nameText:setString(nameStr)
	end

	local lightNode = panel:getChildByFullName("loadingNode.lightNode")
	local animPanel = lightNode:getChildByTag(1):getChildByName("animPanel")

	if pointNum == self._clubBossInfo:getNowPointNum() then
		local anim = cc.MovieClip:create("dangqianwupin_shetuanzhanlipin")

		anim:setPositionY(-80)
		anim:addTo(animNode, 1)
	end

	if pointNum < self._clubBossInfo:getNowPointNum() then
		local darkNode = panel:getChildByFullName("loadingNode.darkNode")

		darkNode:setVisible(false)
	end

	if pointNum == self._clubBossInfo:getNowPointNum() then
		local lightNode = panel:getChildByFullName("loadingNode.lightNode")

		lightNode:getChildByTag(2):setVisible(false)

		local darkNode = panel:getChildByFullName("loadingNode.darkNode")

		darkNode:getChildByTag(1):setVisible(false)
	end

	if self._clubBossInfo:getNowPointNum() < pointNum then
		local lightNode = panel:getChildByFullName("loadingNode.lightNode")

		lightNode:setVisible(false)

		local darkNode = panel:getChildByFullName("loadingNode.darkNode")

		darkNode:setVisible(true)
	end
end

function ClubBossShowAllBossMediator:checkIsRewardBox(rewardData)
	local result = false

	if rewardData ~= nil and rewardData.code ~= nil then
		local config = ConfigReader:getRecordById("ItemConfig", rewardData.code)

		if config and config.Id and config.Type == "BOX_RANDOM" then
			result = true
		end
	end

	return result
end

function ClubBossShowAllBossMediator:onClickRewardPanel(sender, IsRewardBox, rewardStatus, pointId)
	if rewardStatus == ClubBossHurtRewardStatus.kCannotGetButTip then
		self:dispatch(ShowTipEvent({
			duration = 0.35,
			tip = Strings:get("clubBoss_41")
		}))

		return
	end

	if rewardStatus == ClubBossHurtRewardStatus.kCanGet then
		self._clubSystem:requestGainClubBossPointReward(pointId, false, self._viewType)
	end

	if IsRewardBox == true and rewardStatus == ClubBossHurtRewardStatus.kHadGet then
		self._clubSystem:requestClubBossBlockPointRewardByPonitID(pointId, self._viewType)
	end

	if rewardStatus == ClubBossHurtRewardStatus.kCanNotGet then
		if pointId == self._clubBossInfo:getNowPoint() then
			self:dispatch(ShowTipEvent({
				duration = 0.35,
				tip = Strings:get("clubBoss_44")
			}))
		else
			self:dispatch(ShowTipEvent({
				duration = 0.35,
				tip = Strings:get("clubBoss_45")
			}))
		end

		return
	end
end

function ClubBossShowAllBossMediator:onClickHeroPanel(sender, data)
	if data:getPassTime() ~= nil and data:getPassTime() > 0 then
		local winId = data:getWinIde()

		self._clubSystem:showMemberPlayerInfoView(winId)

		return
	end

	if data:getPointId() == self._clubBossInfo:getNowPoint() then
		self:dispatch(ShowTipEvent({
			duration = 0.35,
			tip = Strings:get("clubBoss_44")
		}))
	else
		self:dispatch(ShowTipEvent({
			duration = 0.35,
			tip = Strings:get("clubBoss_45")
		}))
	end
end

function ClubBossShowAllBossMediator:onClickAllGet(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		self._clubSystem:requestGainClubBossPointReward("", true, self._viewType)
	end
end

function ClubBossShowAllBossMediator:onClickBattleBtn(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		if self._doEnterAction then
			return
		end

		self._tableView:stopScroll()
		self:setOffSetToCurrentLevel()
	end
end

function ClubBossShowAllBossMediator:onClickBack(sender, eventType)
	self:dispatch(Event:new(EVT_CLUBBOSS_BACKMAINVIEW, {
		viewType = self._viewType
	}))
	self:dismiss()
end

function ClubBossShowAllBossMediator:refreshBackBtn()
	local width = self._cellPanel:getContentSize().width
	local currentPointNum = self._clubBossInfo:getNowPointNum()
	local currentPointWidth = currentPointNum * width
	local offsetX = self._tableView:getContentOffset().x
	local tableViewWidth = self._tablePanel:getContentSize().width

	if offsetX + currentPointWidth > 0 and offsetX + currentPointWidth < tableViewWidth + width then
		self._battleBtn:setVisible(false)
		self._battleBtn:setTouchEnabled(false)
	else
		self._battleBtn:setVisible(true)
		self._battleBtn:setTouchEnabled(true)
	end
end

function ClubBossShowAllBossMediator:runStartAction()
	self._tableView:stopScroll()
	self:runListAnim()
end

function ClubBossShowAllBossMediator:runListAnim()
	local showNum = 7

	self._tableView:setTouchEnabled(false)

	local allCells = self._tableView:getContainer():getChildren()
	local length = math.min(showNum, #allCells)
	local delayTime = 0.06666666666666667
	local delayTime1 = 0.06666666666666667
	local allTime = showNum * delayTime

	for i = 1, showNum do
		local oneCell = allCells[i]

		if oneCell and oneCell:getChildByTag(123) then
			local child = oneCell:getChildByTag(123)
			local panel = child:getChildByTag(1234)
			local animNode = panel:getChildByFullName("modelNode.animNode")
			local anim = animNode:getChildByTag(12345)
			local time = (i - 1) * delayTime
			local delayAction = cc.DelayTime:create(time)
			local callfunc = cc.CallFunc:create(function ()
				anim:gotoAndPlay(1)
			end)
			local seq = cc.Sequence:create(delayAction, callfunc)

			oneCell:runAction(seq)
		end
	end

	local allDelayAction = cc.DelayTime:create(allTime)
	local callfunc1 = cc.CallFunc:create(function ()
		self._tableView:setTouchEnabled(true)

		self._doEnterAction = false
	end)
	local seqAll = cc.Sequence:create(allDelayAction, callfunc1)

	self:getView():runAction(seqAll)
end
