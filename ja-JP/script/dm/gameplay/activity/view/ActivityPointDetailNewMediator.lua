ActivityPointDetailNewMediator = class("ActivityPointDetailNewMediator", DmPopupViewMediator)

ActivityPointDetailNewMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")
ActivityPointDetailNewMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kBtnHandlers = {
	["main.rightPanel.challenge_btn"] = {
		ignoreClickAudio = true,
		func = "onClickChallenge"
	}
}

function ActivityPointDetailNewMediator:dispose()
	if self._schedule then
		self:getView():getScheduler():unscheduleScriptEntry(self._schedule)

		self._schedule = nil
	end

	super.dispose(self)
end

function ActivityPointDetailNewMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:glueFieldAndUi()

	self._bagSystem = self._developSystem:getBagSystem()
	self._masterSystem = self._developSystem:getMasterSystem()
	self._heroSystem = self._developSystem:getHeroSystem()

	self:mapEventListener(self:getEventDispatcher(), EVT_ARENA_CHANGE_TEAM_SUCC, self, self.changeTeamSuc)
end

function ActivityPointDetailNewMediator:glueFieldAndUi()
	local view = self:getView()
	self._main = view:getChildByFullName("main")

	local function callFunc()
		self:onClickBack()
	end

	local touchView = self._main:getChildByName("touchPanel")

	mapButtonHandlerClick(nil, touchView, {
		clickAudio = "Se_Click_Close_2",
		func = callFunc
	})

	self._rightPanel = self._main:getChildByFullName("rightPanel")

	self._rightPanel:setLocalZOrder(101)

	self._dropPanel = self._rightPanel:getChildByFullName("Panel_drop")
	self._challengeBtn = self._rightPanel:getChildByFullName("challenge_btn")
	self._teamPanel = self._rightPanel:getChildByName("Panel_team")
	self._spPowerPanel = self._main:getChildByFullName("rightPanel.spPowerPanel")
	self._fightInfoPanel = self._rightPanel:getChildByFullName("fightInfo")
	local dropListView = self._dropPanel:getChildByName("dropListView")

	dropListView:setScrollBarEnabled(false)

	self._descPanel = self._rightPanel:getChildByFullName("descTextPanel")
	self._titleLabel = self._rightPanel:getChildByFullName("title_text")
	self._rolePanel = self._main:getChildByName("bg_renwu")
	self._titleBg = self._rightPanel:getChildByFullName("Panel_2")
	self._diImg = self._rightPanel:getChildByFullName("Image_2")
	self._diImg = self._rightPanel:getChildByFullName("Image_2")
	self._line = self._main:getChildByFullName("Image_line")

	self._line:setLocalZOrder(1111)

	self._maskImg = self._main:getChildByFullName("Image_zhezhao")

	self._maskImg:setLocalZOrder(1000)

	self._bg = self._main:getChildByName("Image_bg")
	self._conditionPanel = self._rightPanel:getChildByFullName("Panel_condition")
	self._guideBtn = self._main:getChildByName("guildBtn")
	local text = self._guideBtn:getChildByName("text")

	text:getVirtualRenderer():setMaxLineWidth(50)
	text:setLineSpacing(-5)

	local function callFunc()
		self:onClickSpecialRule()
	end

	mapButtonHandlerClick(nil, self._guideBtn, {
		ignoreClickAudio = true,
		func = callFunc
	})
end

function ActivityPointDetailNewMediator:enterWithData(data)
	self._enterBattle = false
	self._activityId = data.activityId
	self._activity = self._activitySystem:getActivityById(self._activityId)

	if not self._activity then
		return
	end

	self._model = self._activity:getBlockMapActivity()
	self._parent = data.parent
	self._model = self._parent._model
	self._mapId = self._parent._mapId
	self._sortPointId = data.pointId
	self._sortPoint = self._model:getPointById(data.pointId)
	self._subPointList = self._sortPoint:getPointList()
	self._selectIndex = 1
	self._point = self._subPointList[self._selectIndex]
	self._isDailyFirstEnter = self._point:getIsDailyFirstEnter()

	self._point:setIsDailyFirstEnter(false)

	local function callFunc(sender, eventType)
		self:enterTeam()
	end

	mapButtonHandlerClick(nil, self._teamPanel, {
		func = callFunc
	})
	self:setupView()
	self:initAnim()
	self:setupSpPowerPanel()
	self:initTabButton()
end

function ActivityPointDetailNewMediator:initTabButton()
	local btnsName = {
		"btn_normal",
		"btn_elite"
	}
	local tabBtns = {}
	self._invalidButtons = {}

	for i, name in pairs(btnsName) do
		local subPoint = self._subPointList[i]
		local btn = self._main:getChildByName(name)

		btn:setLocalZOrder(2000)
		btn:setTag(i)

		tabBtns[#tabBtns + 1] = btn
		local lock = btn:getChildByName("Image_lock")

		if lock then
			lock:setVisible(not subPoint:isUnlock())

			if not subPoint:isUnlock() then
				self._invalidButtons[#self._invalidButtons + 1] = btn

				btn:setColor(cc.c4b(130, 130, 130, 200))
			end
		end

		local redPoint = btn:getChildByName("redPoint")

		if redPoint then
			local rid = self._developSystem:getPlayer():getRid()
			local value = cc.UserDefault:getInstance():getBoolForKey("activityStageRed" .. self._sortPoint:getId() .. rid, false)

			redPoint:setVisible(subPoint:isUnlock() and not subPoint:isPass() and not value)
		end
	end

	self._tabBtns = tabBtns
	self._tabController = TabController:new(tabBtns, function (name, tag)
		self:onClickTab(name, tag)
	end)

	self._tabController:setInvalidButtons(self._invalidButtons)
	self._tabController:selectTabByTag(self._selectIndex)
end

function ActivityPointDetailNewMediator:setupSpPowerPanel()
	local fightId = self._point:getConfig().ConfigLevelLimitID
	local combatInfoBtn = self._spPowerPanel:getChildByFullName("combatInfoBtn")

	if fightId and fightId ~= "" then
		self._spPowerPanel:setVisible(true)
		combatInfoBtn:addTouchEventListener(function (sender, eventType)
			if eventType == ccui.TouchEventType.began then
				self._fightInfoPanel:removeAllChildren()

				local level = DataReader:getDataByNameIdAndKey("ConfigLevelLimit", fightId, "StandardLv")
				local desc = Strings:get("SpPower_ShowDescTitle", {
					fontSize = 20,
					fontName = TTF_FONT_FZYH_M,
					level = level
				})
				local richText = ccui.RichText:createWithXML(desc, {})

				richText:setAnchorPoint(cc.p(0, 0))
				richText:setPosition(cc.p(10, 10))
				richText:addTo(self._fightInfoPanel)
				richText:renderContent(440, 0, true)

				local size = richText:getContentSize()

				self._fightInfoPanel:setContentSize(460, size.height + 20)
				self._fightInfoPanel:setVisible(true)
			elseif eventType == ccui.TouchEventType.moved then
				-- Nothing
			elseif eventType == ccui.TouchEventType.canceled then
				self._fightInfoPanel:setVisible(false)
			elseif eventType == ccui.TouchEventType.ended then
				self._fightInfoPanel:setVisible(false)
			end
		end)
	end
end

function ActivityPointDetailNewMediator:getOwnMasterId(pointid)
	local masterid = ConfigReader:getDataByNameIdAndKey("ActivityBlockPoint", pointid, "Master")

	if masterid ~= "" then
		return masterid
	end

	return nil
end

function ActivityPointDetailNewMediator:getOwnMasterRoleModel(masterid)
	local roleModel = ConfigReader:getDataByNameIdAndKey("EnemyMaster", masterid, "RoleModel")

	return roleModel
end

function ActivityPointDetailNewMediator:initAnim()
	local mc = cc.MovieClip:create("guankaxiangqing_zhuxianguanka_UIjiaohudongxiao")

	mc:addCallbackAtFrame(30, function ()
		mc:stop()
	end)
	mc:stop()
	mc:addTo(self._main)
	mc:setPosition(cc.p(568, 320))
	mc:setLocalZOrder(100)
	mc:addCallbackAtFrame(15, function ()
	end)
	mc:addCallbackAtFrame(17, function ()
		local dropListView = self._dropPanel:getChildByFullName("dropListView")
		local items = dropListView:getItems()

		for i = 1, #items do
			local node = items[i]

			node:setScale(0.1)
			node:runAction(cc.Sequence:create(cc.DelayTime:create(i * 0.06), cc.ScaleTo:create(0.1, 1)))
		end
	end)
	mc:addCallbackAtFrame(21, function ()
		local btnAnim = cc.MovieClip:create("xiangqingxunhuan_zhuxianguanka_UIjiaohudongxiao")

		btnAnim:setScale(0.75)
		btnAnim:addTo(mc)
		btnAnim:setPosition(cc.p(448.5, -103))
		btnAnim:setOpacity(0)
		btnAnim:runAction(cc.FadeIn:create(0.5))
	end)

	local bgMc = mc:getChildByName("bg")

	bgMc:removeAllChildren()
	self._bg:changeParent(bgMc):center(bgMc:getContentSize())

	local starMc = mc:getChildByName("stardi")

	starMc:removeAllChildren()
	self._conditionPanel:changeParent(starMc):center(starMc:getContentSize()):offset(7, 18)

	local teamMc = mc:getChildByFullName("team")

	self._teamPanel:changeParent(teamMc):center(teamMc:getContentSize())

	local descMc = mc:getChildByFullName("desc")

	self._descPanel:changeParent(descMc)
	self._descPanel:setPosition(cc.p(-205, 30))

	local rewardMc = mc:getChildByFullName("rewardPanel")

	rewardMc:setLocalZOrder(9999)
	self._dropPanel:changeParent(rewardMc)
	self._dropPanel:setPosition(cc.p(-7, -25))

	local titleMc = mc:getChildByFullName("title")

	self._diImg:changeParent(titleMc):posite(120, -320)
	self._titleBg:changeParent(titleMc):posite(-80, -24)
	self._titleLabel:changeParent(titleMc)
	self._titleLabel:setPosition(cc.p(-90, 0))

	local combatPanel = mc:getChildByFullName("teamCombat")

	self._spPowerPanel:changeParent(combatPanel):center(combatPanel:getContentSize()):offset(-20, 0)

	local heroRole = mc:getChildByFullName("hero")

	self._rolePanel:changeParent(heroRole)
	self._maskImg:changeParent(heroRole):posite(350, -345)
	self._challengeBtn:setOpacity(0)

	local act = cc.Sequence:create(cc.DelayTime:create(0.4375), cc.FadeIn:create(0.3125))

	self._challengeBtn:runAction(act:clone())
	mc:gotoAndPlay(1)
end

function ActivityPointDetailNewMediator:bindGuildPopView(parentNode)
	local descs = self._point:getGuideDesc()

	if not descs or #descs == 0 then
		return
	end

	self._guideBtn:changeParent(parentNode)
	self._guideBtn:setPosition(cc.p(13, 137))

	if not self._point:isPass() and self._isDailyFirstEnter and not self._enterBattle then
		self._enterBattle = true

		self:onClickSpecialRule()
		performWithDelay(self:getView(), function ()
			self._enterBattle = false
		end, 0.5)
	end
end

function ActivityPointDetailNewMediator:setupView()
	local point = self._point

	if point:getType() == StageType.kNormal then
		self._bg:loadTexture("asset/ui/activity/hd_bg_pt.png")
	elseif point:getType() == StageType.kElite then
		self._bg:loadTexture("asset/ui/activity/hd_bg_bh.png")
	end

	self._rolePanel:removeAllChildren()

	local pointHead = point:getConfig().PointHead
	local heroSprite = IconFactory:createRoleIconSprite({
		useAnim = true,
		iconType = 6,
		id = pointHead
	})

	heroSprite:addTo(self._rolePanel):setTag(951)
	heroSprite:setScale(0.92)
	heroSprite:setPosition(cc.p(88, 0))

	local descLabel = self._descPanel:getChildByName("desc_text")

	descLabel:setString(point:getDesc())
	descLabel:enableShadow(cc.c4b(0, 0, 0, 137.70000000000002), cc.size(2, -2), 3)
	descLabel:getVirtualRenderer():setLineHeight(24)
	descLabel:setLineSpacing(0)

	local pointIndex = self._point:getIndex()

	self._titleLabel:setString(pointIndex .. " " .. Strings:get(point:getName()))

	local rewardTitle = self._dropPanel:getChildByFullName("title_reward")
	local rewards = point:getShowFirstKillReward()
	local isFirst = false

	if point:isPass() or rewards == nil then
		rewards = point:getShowRewards()

		rewardTitle:setString(Strings:get("STAGE_NORMAL_DROP_TITLE"))
	else
		isFirst = true

		rewardTitle:setString(Strings:get("STAGE_FIRST_DROP_TITLE"))
	end

	local dropListView = self._dropPanel:getChildByFullName("dropListView")

	dropListView:removeAllChildren()
	self._dropPanel:setVisible(#rewards > 0)

	if rewards then
		local size = cc.size(69, 69)

		for index, reward in ipairs(rewards) do
			local icon = IconFactory:createRewardIcon(reward, {
				isWidget = true,
				showAmount = isFirst
			})

			IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), reward, {
				needDelay = true
			})

			local iconPanel = ccui.Layout:create()

			iconPanel:setAnchorPoint(cc.p(0.5, 0.5))
			iconPanel:setContentSize(size)
			icon:addTo(iconPanel):center(size)
			icon:setScaleNotCascade(0.5)
			dropListView:pushBackCustomItem(iconPanel)
		end
	end

	local conditionkeeper = self:getInjector():getInstance(Conditionkeeper)
	local conditions = self._point:getConfig().VictoryConditions
	local desc = conditionkeeper:getVictoryConditionsDesc(conditions, {
		assist = self._point:getAssist()
	})
	local listView = self._conditionPanel:getChildByName("ListView")

	listView:removeAllChildren()
	listView:setScrollBarEnabled(false)

	local textData = string.split(desc, "<font")

	if #textData <= 1 then
		desc = string.format("<font face='asset/font/CustomFont_FZYH_M.TTF' size='18' color='#D2D2D2'>%s</font>", desc)
	end

	self:addContent(Strings:get("BlockPoint_Condition_Name_3") .. desc, listView)

	local descs = self._point:getGuideDesc()

	self:addContent(Strings:get("BlockPoint_Condition_Name_4"), listView)

	for i = 2, #descs do
		self:addContent(Strings:get(descs[i]), listView)
	end

	self:refreshCostView()
	self:checkCostChange()
	self:changeTeamSuc()
end

function ActivityPointDetailNewMediator:addContent(content, listView)
	local descText = self._conditionPanel:getChildByName("desc_text")

	descText:setVisible(false)

	local textData = string.split(content, "<font")

	if #textData <= 1 then
		content = string.format("<font face='asset/font/CustomFont_FZYH_M.TTF' size='18' color='#D2D2D2'>%s</font>", content)
	end

	local layout = ccui.Layout:create()
	local context = ccui.RichText:createWithXML("", {})

	context:setString(content)
	context:setAnchorPoint(cc.p(0, 1))
	context:renderContent(405, 0, true)

	local length = context:getContentSize().height + 10

	context:addTo(layout):posite(0, length)
	layout:setContentSize(cc.size(listView:getContentSize().width, length))
	listView:pushBackCustomItem(layout)
end

function ActivityPointDetailNewMediator:refreshCostView()
	self._challengeBtn:removeChildByTag(1003)

	local costText = self._challengeBtn:getChildByFullName("cost_text")
	local cost, amount = self:getCostEnergy()
	local icon = IconFactory:createPic({
		id = cost
	})

	icon:addTo(self._challengeBtn):setTag(1003):setPosition(cc.p(80, 5)):setScale(0.8)
	costText:setString("X" .. amount)

	self._curPower = self._bagSystem:getPowerByCurrencyId(cost)

	if self._curPower < tonumber(amount) then
		costText:setTextColor(GameStyle:getColor(7))
	else
		costText:setTextColor(GameStyle:getColor(1))
	end
end

function ActivityPointDetailNewMediator:getCostEnergy()
	local cost, amount = nil
	local costEnergy = self._point:getCostEnergy()

	for k, v in pairs(costEnergy) do
		cost = k
		amount = v

		break
	end

	return cost, amount
end

local checkTime = 1

function ActivityPointDetailNewMediator:checkCostChange()
	local function checkTimeFunc()
		local cost, amount = self:getCostEnergy()
		local newPower = self._bagSystem:getPowerByCurrencyId(cost)

		if newPower ~= self._curPower then
			self:refreshCostView()
		end
	end

	if not self._schedule then
		self._schedule = self:getView():getScheduler():scheduleScriptFunc(checkTimeFunc, checkTime, false)
	end

	checkTimeFunc()
end

function ActivityPointDetailNewMediator:changeTeamSuc()
	self:refreshTeamView()
end

function ActivityPointDetailNewMediator:refreshTeamView()
	local team = self._model:getTeam()

	self._teamPanel:getChildByName("teamName"):setString(team:getName())

	local developSystem = self:getInjector():getInstance("DevelopSystem")
	local masterSystem = developSystem:getMasterSystem()
	local masterData = masterSystem:getMasterById(team:getMasterId())
	local roleModel = masterData:getModel()

	if self:getOwnMasterId(self._sortPointId) then
		roleModel = self:getOwnMasterRoleModel(self:getOwnMasterId(self._sortPointId))
	end

	local masterIcon = IconFactory:createRoleIconSprite({
		stencil = 6,
		iconType = "Bust5",
		id = roleModel,
		size = cc.size(446, 115)
	})
	local masterPanel = self._teamPanel:getChildByName("masterIcon")

	masterPanel:removeAllChildren()
	masterIcon:addTo(masterPanel):setPosition(220, 20)
end

function ActivityPointDetailNewMediator:onClickBack(sender, eventType)
	self:close()
end

function ActivityPointDetailNewMediator:onClickChallenge()
	local pass, tips = self:reachBattleCondition()

	if not pass then
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = tips or Strings:find("ACTIVITY_ENERGY_NOT_ENOUGH")
		}))

		return
	end

	if self._point:canWipeOnce() then
		self:showSweepBox()
	else
		self:onChallenge()
	end
end

function ActivityPointDetailNewMediator:onChallenge()
	if self:isNpc() then
		self:enterTeam()

		return
	end

	if self._enterBattle then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Battle", false)

	self._enterBattle = true

	performWithDelay(self:getView(), function ()
		self._enterBattle = false
	end, 0.5)

	local team = self._model:getTeam()

	AudioTimerSystem:playStartBattleVoice(team)
	self._activitySystem:setBattleTeamInfo(team)

	local activityId = self._parent._activity:getId()
	local subActivityId = self._model:getId()
	local type = litTypeMap[self._point:getType()]
	local pointId = self._point:getId()

	self._point:recordOldStar()
	self._point:recordHpRate()

	self._parent._data.stageType = self._parent._stageType
	self._parent._data.enterBattlePointId = self._sortPointId

	self._activitySystem:requestDoChildActivity(activityId, subActivityId, {
		doActivityType = 102,
		type = self._mapId,
		mapId = self._sortPointId,
		pointId = pointId
	}, function (rsdata)
		self:close()

		if rsdata.resCode == GS_SUCCESS then
			self._activitySystem:enterActstageBattle(rsdata.data, activityId, subActivityId)
		end
	end, true)
end

function ActivityPointDetailNewMediator:reachBattleCondition()
	local containPower = 0
	local itemId, cost, tips = nil
	local costEnergy = self._point:getCostEnergy()

	for k, v in pairs(costEnergy) do
		itemId = k
		cost = tonumber(v)

		break
	end

	local config = PowerConfigMap[itemId]

	if not config and DEBUG ~= 0 then
		config = PowerConfigMap.TEST
	end

	if config then
		local func = config.func

		if func ~= "getItemCount" then
			containPower = self._bagSystem[func](self._bagSystem, itemId)
		else
			containPower = self._bagSystem:getItemCount(itemId)
		end

		tips = Strings:get(config.tips)
	end

	if containPower < cost then
		return false, tips
	end

	return true
end

function ActivityPointDetailNewMediator:getMaxSwipCount()
	local containPower = 0
	local itemId, cost = nil
	local costEnergy = self._point:getCostEnergy()

	for k, v in pairs(costEnergy) do
		itemId = k
		cost = tonumber(v)

		break
	end

	local config = PowerConfigMap[itemId]

	if not config and DEBUG ~= 0 then
		config = PowerConfigMap.TEST
	end

	if config then
		local func = config.func

		if func ~= "getItemCount" then
			containPower = self._bagSystem[func](self._bagSystem, itemId)
		else
			containPower = self._bagSystem:getItemCount(itemId)
		end
	end

	return math.modf(containPower / cost)
end

function ActivityPointDetailNewMediator:showSweepBox()
	local outSelf = self
	local delegate = {}

	function delegate:willClose(popupMediator, data)
		if not data then
			return
		end

		if data.returnValue == 1 then
			outSelf:onChallenge()
		elseif data.returnValue == 2 then
			outSelf:onClickWipeTimes()
		elseif data.returnValue == 3 then
			outSelf:onClickWipeOnce()
		end
	end

	local data = {}

	if self._point:getType() == StageType.kElite then
		data.stageType = StageType.kElite
		data.challengeTimes = self._point:getChallengeTimes()
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, self:getInjector():getInstance("SweepBoxPopView"), {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end

function ActivityPointDetailNewMediator:onClickWipeOnce()
	self:onRequsetSwip(1)
end

function ActivityPointDetailNewMediator:onClickWipeTimes()
	local realTimes = math.min(self:getMaxSwipCount(), 10)

	self:onRequsetSwip(realTimes)
end

function ActivityPointDetailNewMediator:onRequsetSwip(times)
	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)

	local param = {
		type = self._mapId,
		doActivityType = 107,
		mapId = self._sortPointId,
		pointId = self._point:getId(),
		times = tostring(times)
	}

	self._activitySystem:requestDoChildActivity(self._parent._activity:getId(), self._model:getId(), param, function (data)
		data.param = {
			activityId = self._parent._activity:getId(),
			mapId = self._sortPointId,
			pointId = self._point:getId(),
			wipeTimes = times,
			type = self._mapId
		}
		data.itemId = self._point:getMainItemId()

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, self:getInjector():getInstance("ActivityPointSweepView"), {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data))
	end)
end

function ActivityPointDetailNewMediator:isNpc()
	local enemy = self._point:getAssistEnemy()
	local showNpcTeam = self._activity:getActivityConfig().ShowNpcTeam

	if #enemy > 0 and showNpcTeam == "1" then
		return true
	end

	return false
end

function ActivityPointDetailNewMediator:enterTeam()
	self._activitySystem:enterTeam(self._activityId, self._model, {
		type = self._mapId,
		mapId = self._sortPointId,
		pointId = self._point:getId(),
		parent = self
	})
end

function ActivityPointDetailNewMediator:onClickTab(name, tag)
	local point = self._subPointList[tag]

	if not point:isUnlock() then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Activity_Stage_Type_Switch_Tips")
		}))

		return
	end

	if tag == 2 then
		cc.UserDefault:getInstance():setBoolForKey("activityStageRed" .. self._sortPoint:getId() .. self._developSystem:getPlayer():getRid(), true)
		self._tabBtns[tag]:getChildByName("redPoint"):setVisible(false)
	end

	self._selectIndex = tag
	self._point = self._subPointList[self._selectIndex]

	self:setupView()
end

function ActivityPointDetailNewMediator:onClickSpecialRule()
	local descs = self._point:getGuideDesc()

	if not descs or #descs == 0 then
		return
	end

	local view = self:getInjector():getInstance("StagePracticeSpecialRuleView")
	local event = ViewEvent:new(EVT_SHOW_POPUP, view, {
		remainLastView = true,
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		ruleList = descs
	})

	self:dispatch(event)
end
