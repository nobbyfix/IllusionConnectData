ActivityPointDetailMediator = class("ActivityPointDetailMediator", DmPopupViewMediator)

ActivityPointDetailMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")
ActivityPointDetailMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kBtnHandlers = {
	["main.rightPanel.challenge_btn"] = {
		ignoreClickAudio = true,
		func = "onClickChallenge"
	}
}

function ActivityPointDetailMediator:dispose()
	if self._schedule then
		self:getView():getScheduler():unscheduleScriptEntry(self._schedule)

		self._schedule = nil
	end

	super.dispose(self)
end

function ActivityPointDetailMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:glueFieldAndUi()

	self._bagSystem = self._developSystem:getBagSystem()
	self._masterSystem = self._developSystem:getMasterSystem()
	self._heroSystem = self._developSystem:getHeroSystem()

	self:mapEventListener(self:getEventDispatcher(), EVT_ARENA_CHANGE_TEAM_SUCC, self, self.changeTeamSuc)
end

function ActivityPointDetailMediator:glueFieldAndUi()
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

	self._combatPanel = self._rightPanel:getChildByFullName("Panel_combat")
	self._dropPanel = self._rightPanel:getChildByFullName("Panel_drop")
	self._challengeBtn = self._rightPanel:getChildByFullName("challenge_btn")
	self._teamPanel = self._rightPanel:getChildByName("Panel_team")
	self._teamCombatPanel = self._rightPanel:getChildByName("team_combat")
	self._spPowerPanel = self._main:getChildByFullName("rightPanel.spPowerPanel")
	self._fightInfoPanel = self._rightPanel:getChildByFullName("fightInfo")
	local dropListView = self._dropPanel:getChildByName("dropListView")

	dropListView:setScrollBarEnabled(false)

	self._descLabel = self._rightPanel:getChildByFullName("descTextPanel.desc_text")
	self._titleLabel = self._rightPanel:getChildByFullName("title_text")
	self._rolePanel = self._main:getChildByName("bg_renwu")
	self._bar = self._rightPanel:getChildByName("bar")
end

function ActivityPointDetailMediator:enterWithData(data)
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
	self._pointId = data.pointId
	self._point = self._model:getPointById(data.pointId)
	self._isDailyFirstEnter = self._point:getIsDailyFirstEnter()

	self._point:setIsDailyFirstEnter(false)

	local function callFunc(sender, eventType)
		self._activitySystem:enterTeam(self._activityId, self._model, self._pointId)
	end

	mapButtonHandlerClick(nil, self._teamPanel, {
		func = callFunc
	})

	if self._point:isBoss() then
		self:setupBossView()
		self:initBossAnim()
	else
		self:setupView()
		self:initAnim()
	end

	self:setupSpPowerPanel()
end

function ActivityPointDetailMediator:setupSpPowerPanel()
	local fightId = self._point:getConfig().ConfigLevelLimitID
	local combatInfoBtn = self._spPowerPanel:getChildByFullName("combatInfoBtn")

	if fightId and fightId ~= "" then
		self._teamCombatPanel:setVisible(false)
		self._combatPanel:setVisible(false)
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
	else
		self._teamCombatPanel:setVisible(true)
		self._combatPanel:setVisible(true)
		self._spPowerPanel:setVisible(false)
	end
end

function ActivityPointDetailMediator:initAnim()
	local mc = cc.MovieClip:create("guankaxiangqing_zhuxianguanka_UIjiaohudongxiao")

	mc:addCallbackAtFrame(30, function ()
		mc:stop()
	end)
	mc:stop()
	mc:addTo(self._main)
	mc:setPosition(cc.p(568, 320))
	mc:setLocalZOrder(100)
	mc:addCallbackAtFrame(15, function ()
		local guidePanel = mc:getChildByName("guildNode")

		self:bindGuildPopView(guidePanel)
	end)
	mc:addCallbackAtFrame(17, function ()
		local dropListView = self._dropPanel:getChildByFullName("dropListView")
		local items = dropListView:getItems()

		for i = 1, #items do
			local node = items[i]

			node:runAction(cc.Sequence:create(cc.DelayTime:create(i * 0.06), cc.ScaleTo:create(0.1, 1)))
		end
	end)
	mc:addCallbackAtFrame(21, function ()
		local btnAnim = cc.MovieClip:create("xiangqingxunhuan_zhuxianguanka_UIjiaohudongxiao")

		btnAnim:setScale(0.8)
		btnAnim:addTo(mc)
		btnAnim:setPosition(cc.p(443.5, -83))
		btnAnim:setOpacity(0)
		btnAnim:runAction(cc.FadeIn:create(0.5))
	end)

	for i = 1, 3 do
		local starMc = mc:getChildByName("star" .. i)
		local star = self._conditionPanel:getChildByName("star" .. i)

		star:changeParent(starMc):center(starMc:getContentSize())

		local tipsMc = mc:getChildByName("tips" .. i)
		local tips = self._conditionPanel:getChildByName("tip" .. i)

		tips:changeParent(tipsMc)
		tips:setPosition(-83, 0)

		local diamondNode = self._conditionPanel:getChildByName("diamond" .. i)

		diamondNode:changeParent(tipsMc)
		diamondNode:setPosition(260, 0)
	end

	local teamMc = mc:getChildByFullName("team")

	self._teamPanel:changeParent(teamMc):center(teamMc:getContentSize())

	local descMc = mc:getChildByFullName("desc")
	local descTextPanel = self._rightPanel:getChildByFullName("descTextPanel")

	descTextPanel:changeParent(descMc)
	descTextPanel:setPosition(cc.p(-213, -53))

	local rewardMc = mc:getChildByFullName("rewardPanel")

	self._dropPanel:changeParent(rewardMc)
	self._dropPanel:setPosition(cc.p(30, -48))

	local titleMc = mc:getChildByFullName("title")

	self._titleLabel:changeParent(titleMc)
	self._titleLabel:setPosition(cc.p(-90, 4))

	local combatPanel = mc:getChildByFullName("reqCombat")

	self._combatPanel:changeParent(combatPanel):center(combatPanel:getContentSize())

	local teamCombatPanel = mc:getChildByFullName("teamCombat")

	self._teamCombatPanel:changeParent(teamCombatPanel):center(teamCombatPanel:getContentSize())
	self._spPowerPanel:changeParent(teamCombatPanel):center(teamCombatPanel:getContentSize())

	local heroRole = mc:getChildByFullName("hero")

	self._rolePanel:changeParent(heroRole)
	self._challengeBtn:setOpacity(0)

	local act = cc.Sequence:create(cc.DelayTime:create(0.4375), cc.FadeIn:create(0.3125))

	self._challengeBtn:runAction(act:clone())
	mc:gotoAndPlay(1)
end

function ActivityPointDetailMediator:initBossAnim()
	local mc = cc.MovieClip:create("guankaxiangqing_zhuxianguanka_UIjiaohudongxiao")

	mc:addCallbackAtFrame(30, function ()
		mc:stop()
	end)
	mc:stop()
	mc:addTo(self._main)
	mc:setPosition(cc.p(568, 320))
	mc:setLocalZOrder(100)
	mc:addCallbackAtFrame(15, function ()
		local guidePanel = mc:getChildByName("guildNode")

		self:bindGuildPopView(guidePanel)
	end)
	mc:addCallbackAtFrame(17, function ()
		local dropListView = self._dropPanel:getChildByFullName("dropListView")
		local items = dropListView:getItems()

		for i = 1, #items do
			local node = items[i]

			node:runAction(cc.Sequence:create(cc.DelayTime:create(i * 0.06), cc.ScaleTo:create(0.1, 1)))
		end
	end)
	mc:addCallbackAtFrame(21, function ()
		local btnAnim = cc.MovieClip:create("xiangqingxunhuan_zhuxianguanka_UIjiaohudongxiao")

		btnAnim:setScale(0.8)
		btnAnim:addTo(mc)
		btnAnim:setPosition(cc.p(443.5, -83))
		btnAnim:setOpacity(0)
		btnAnim:runAction(cc.FadeIn:create(0.5))
	end)

	for i = 1, 3 do
		local starMc = mc:getChildByName("star" .. i)

		starMc:setVisible(false)

		local tipsMc = mc:getChildByName("tips" .. i)

		tipsMc:setVisible(false)
	end

	local hpRate = self._point:getHpRate()
	local text = ccui.Text:create(Strings:get("Activity_Point_Hp_Rate", {
		num = math.ceil(hpRate * 100)
	}), TTF_FONT_FZYH_M, 20)

	text:enableOutline(cc.c3b(0, 0, 0), 1)
	text:addTo(self._rightPanel):setPosition(cc.p(90, 265))
	text:setOpacity(0)
	text:runAction(cc.Spawn:create(cc.FadeIn:create(0.2), cc.MoveTo:create(0.3, cc.p(60, 265))))
	self._bar:setVisible(true)
	self._bar:setPosition(cc.p(183, 230))
	self._bar:getChildByName("loadingBar"):setPercent(hpRate * 100)
	self._bar:setOpacity(0)
	self._bar:runAction(cc.Sequence:create(cc.DelayTime:create(0.2), cc.FadeIn:create(0.2)))

	local btnImage = ccui.ImageView:create("asset/common/common_btn_xq.png")

	btnImage:setTouchEnabled(true)

	local function tipCallFunc()
		local rule = ConfigReader:getDataByNameIdAndKey("Activity", self._model:getId(), "ActivityConfig")

		self._activitySystem:showActivityRules(rule.RuleDesc)
	end

	mapButtonHandlerClick(nil, btnImage, {
		func = tipCallFunc
	})
	btnImage:setScale(0.6)
	btnImage:addTo(self._rightPanel):setPosition(330, 260)
	btnImage:setOpacity(0)
	btnImage:runAction(cc.Sequence:create(cc.DelayTime:create(0.2), cc.FadeIn:create(0.2)))

	local teamMc = mc:getChildByFullName("team")

	self._teamPanel:changeParent(teamMc):center(teamMc:getContentSize())

	local descMc = mc:getChildByFullName("desc")
	local descTextPanel = self._rightPanel:getChildByFullName("descTextPanel")

	descTextPanel:changeParent(descMc)
	descTextPanel:setPosition(cc.p(-213, -53))

	local rewardMc = mc:getChildByFullName("rewardPanel")

	self._dropPanel:changeParent(rewardMc)
	self._dropPanel:setPosition(cc.p(30, -48))

	local titleMc = mc:getChildByFullName("title")

	self._titleLabel:changeParent(titleMc)
	self._titleLabel:setPosition(cc.p(-90, 4))

	local combatPanel = mc:getChildByFullName("reqCombat")

	self._combatPanel:changeParent(combatPanel):center(combatPanel:getContentSize())

	local teamCombatPanel = mc:getChildByFullName("teamCombat")

	self._teamCombatPanel:changeParent(teamCombatPanel):center(teamCombatPanel:getContentSize())
	self._spPowerPanel:changeParent(teamCombatPanel):center(teamCombatPanel:getContentSize())

	local heroRole = mc:getChildByFullName("hero")

	self._rolePanel:changeParent(heroRole)
	self._challengeBtn:setOpacity(0)

	local act = cc.Sequence:create(cc.DelayTime:create(0.4375), cc.FadeIn:create(0.3125))

	self._challengeBtn:runAction(act:clone())
	mc:gotoAndPlay(1)
end

function ActivityPointDetailMediator:bindGuildPopView(parentNode)
	local descs = self._point:getGuideDesc()

	if not descs or #descs == 0 then
		return
	end

	local icon = self:getView():getChildByName("guildBtn")
	local text = icon:getChildByName("text")

	text:getVirtualRenderer():setMaxLineWidth(50)
	text:setLineSpacing(-5)
	icon:changeParent(parentNode)
	icon:setPosition(cc.p(45, 4))

	local function callFunc()
		local view = self:getInjector():getInstance("StagePracticeSpecialRuleView")
		local event = ViewEvent:new(EVT_SHOW_POPUP, view, {
			remainLastView = true,
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			ruleList = descs
		})

		self:dispatch(event)
	end

	mapButtonHandlerClick(nil, icon, {
		ignoreClickAudio = true,
		func = callFunc
	})

	if not self._point:isPass() and self._isDailyFirstEnter and not self._enterBattle then
		self._enterBattle = true

		callFunc()
		performWithDelay(self:getView(), function ()
			self._enterBattle = false
		end, 0.5)
	end
end

function ActivityPointDetailMediator:setupView()
	self._bar:setVisible(false)

	local point = self._point
	self._conditionPanel = self._rightPanel:getChildByFullName("3starTip")

	self._conditionPanel:setLocalZOrder(948)

	local starState = point:getStarState() or {}
	local descs = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Block_StarConditionDesc", "content")
	local starDiamondCount = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BlockStarDiamond", "content").num
	local starCondition = point:getStarCondition()

	for i = 1, 3 do
		local tip = self._conditionPanel:getChildByName("tip" .. i)

		tip:setString(Strings:get(descs[starCondition[i].type], {
			value = starCondition[i].value
		}))

		local tipStar = self._conditionPanel:getChildByName("star" .. i)
		local diamondNode = self._conditionPanel:getChildByName("diamond" .. i)

		if starState[i] then
			tipStar:loadTexture("asset/common/yinghun_xingxing.png", ccui.TextureResType.localType)
			tip:setTextColor(cc.c3b(255, 255, 255))
			diamondNode:setColor(cc.c3b(125, 125, 125))
			diamondNode:getChildByName("diamondNum"):setVisible(false)
			diamondNode:getChildByName("onFinish"):setVisible(true)
		else
			tipStar:loadTexture("asset/common/yinghun_xingxing2.png", ccui.TextureResType.localType)
			tip:setTextColor(cc.c3b(160, 160, 160))
			tipStar:setScale(0.3)
			diamondNode:setColor(cc.c3b(255, 255, 255))
			diamondNode:getChildByName("onFinish"):setVisible(false)

			local diamondNum = diamondNode:getChildByName("diamondNum")

			diamondNum:setVisible(true)
			diamondNum:setString("+" .. starDiamondCount)
		end
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
	self._descLabel:setString(point:getDesc())
	self._descLabel:enableShadow(cc.c4b(0, 0, 0, 137.70000000000002), cc.size(2, -2), 3)
	self._descLabel:getVirtualRenderer():setLineHeight(24)
	self._descLabel:setLineSpacing(0)

	local pointIndex = self._point:getIndex()

	self._titleLabel:setString(pointIndex .. " " .. Strings:get(point:getName()))

	local rewardTitle = self._dropPanel:getChildByFullName("node_1.title_reward")
	local rewards = point:getShowFirstKillReward()
	local isFirst = false

	if point:isPass() or rewards == nil then
		rewards = point:getShowRewards()

		rewardTitle:setString(Strings:get("STAGE_NORMAL_DROP_TITLE"))
	else
		isFirst = true

		rewardTitle:setString(Strings:get("STAGE_FIRST_DROP_TITLE"))
	end

	local ui = self._model:getUI()
	local dropListView = self._dropPanel:getChildByFullName("dropListView")

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
			iconPanel:setScale(0.01)
			dropListView:pushBackCustomItem(iconPanel)

			if ui == "ACTIVITYBLOCKMAPHoliday" then
				local markImg = ccui.ImageView:create("asset/common/shaungdan_img_xianshidiaoluojiaobiao.png")

				markImg:addTo(icon, 10000):posite(45, 95):setScale(1.2)

				local strId = isFirst and "STAGE_FIRST_DROP_TITLE" or "STAGE_NORMAL_DROP_TITLE"
				local text = ccui.Text:create(Strings:get(strId), TTF_FONT_FZYH_M, 18)

				text:setTextVerticalAlignment(cc.TEXT_ALIGNMENT_CENTER)
				text:getVirtualRenderer():setOverflow(cc.LabelOverflow.SHRINK)
				text:getVirtualRenderer():setDimensions(80, 30)
				text:addTo(markImg):center(markImg:getContentSize()):offset(-3, 3)
			end
		end
	end

	if ui == "ACTIVITYBLOCKMAPHoliday" then
		rewardTitle:setVisible(false)
		dropListView:offset(-80, 0)

		local extraActId = self._activity:getActivityConfig().ActivityExtra
		local extraAct = self._activitySystem:getActivityById(extraActId)

		if extraAct then
			local rewardId = extraAct:getActivityConfig().ShowReward
			local rewards = ConfigReader:getDataByNameIdAndKey("Reward", rewardId, "Content")

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
					iconPanel:setScale(0.01)
					dropListView:pushBackCustomItem(iconPanel)

					local markImg = ccui.ImageView:create("asset/common/shaungdan_img_xianshidiaoluojiaobiao.png")

					markImg:addTo(icon, 10000):posite(45, 95):setScale(1.2)

					local text = ccui.Text:create(Strings:get("Newyear_Item_LimitedTimeDrop"), TTF_FONT_FZYH_M, 18)

					text:setTextVerticalAlignment(cc.TEXT_ALIGNMENT_CENTER)
					text:getVirtualRenderer():setOverflow(cc.LabelOverflow.SHRINK)
					text:getVirtualRenderer():setDimensions(80, 30)
					text:addTo(markImg):center(markImg:getContentSize()):offset(-3, 3)
				end
			end
		end
	end

	self:refreshCostView()
	self:checkCostChange()
	self._combatPanel:setLocalZOrder(947)

	local combatText = self._combatPanel:getChildByFullName("combat_text")

	combatText:setString(point:getRecommendCombat())
	self:changeTeamSuc()
end

function ActivityPointDetailMediator:setupBossView()
	local point = self._point
	self._conditionPanel = self._rightPanel:getChildByFullName("3starTip")

	self._conditionPanel:setVisible(false)
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
	self._descLabel:setString(point:getDesc())
	self._descLabel:enableShadow(cc.c4b(0, 0, 0, 137.70000000000002), cc.size(2, -2), 3)
	self._descLabel:getVirtualRenderer():setLineHeight(24)
	self._descLabel:setLineSpacing(0)

	local pointIndex = self._point:getIndex()

	self._titleLabel:setString(pointIndex .. " " .. Strings:get(point:getName()))

	local rewardTitle = self._dropPanel:getChildByFullName("node_1.title_reward")
	local rewards = point:getShowFirstKillReward()
	local isFirst = false

	if point:isPass() or rewards == nil then
		rewards = point:getShowRewards()

		rewardTitle:setString(Strings:get("STAGE_NORMAL_DROP_TITLE"))
	else
		isFirst = true

		rewardTitle:setString(Strings:get("STAGE_FIRST_DROP_TITLE"))
	end

	local ui = self._model:getUI()
	local dropListView = self._dropPanel:getChildByFullName("dropListView")

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
			iconPanel:setScale(0.01)
			dropListView:pushBackCustomItem(iconPanel)

			if ui == "ACTIVITYBLOCKMAPHoliday" then
				local markImg = ccui.ImageView:create("asset/common/shaungdan_img_xianshidiaoluojiaobiao.png")

				markImg:addTo(icon, 10000):posite(45, 95):setScale(1.2)

				local text = ccui.Text:create(Strings:get("STAGE_FIRST_DROP_TITLE"), TTF_FONT_FZYH_M, 18)

				text:setTextVerticalAlignment(cc.TEXT_ALIGNMENT_CENTER)
				text:getVirtualRenderer():setOverflow(cc.LabelOverflow.SHRINK)
				text:getVirtualRenderer():setDimensions(80, 30)
				text:addTo(markImg):center(markImg:getContentSize()):offset(-3, 3)
			end
		end
	end

	if ui == "ACTIVITYBLOCKMAPHoliday" then
		rewardTitle:setVisible(false)
		dropListView:offset(-80, 0)

		local extraActId = self._activity:getActivityConfig().ActivityExtra
		local extraAct = self._activitySystem:getActivityById(extraActId)

		if extraAct then
			local rewardId = extraAct:getActivityConfig().ShowReward
			local rewards = ConfigReader:getDataByNameIdAndKey("Reward", rewardId, "Content")

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
					iconPanel:setScale(0.01)
					dropListView:pushBackCustomItem(iconPanel)

					local markImg = ccui.ImageView:create("asset/common/shaungdan_img_xianshidiaoluojiaobiao.png")

					markImg:addTo(icon, 10000):posite(45, 95):setScale(1.2)

					local text = ccui.Text:create(Strings:get("Newyear_Item_LimitedTimeDrop"), TTF_FONT_FZYH_M, 18)

					text:setTextVerticalAlignment(cc.TEXT_ALIGNMENT_CENTER)
					text:getVirtualRenderer():setOverflow(cc.LabelOverflow.SHRINK)
					text:getVirtualRenderer():setDimensions(80, 30)
					text:addTo(markImg):center(markImg:getContentSize()):offset(-3, 3)
				end
			end
		end
	end

	self:refreshCostView()
	self:checkCostChange()
	self._combatPanel:setLocalZOrder(947)

	local combatText = self._combatPanel:getChildByFullName("combat_text")

	combatText:setString(point:getRecommendCombat())
	self:changeTeamSuc()
end

function ActivityPointDetailMediator:refreshCostView()
	self._challengeBtn:removeChildByTag(1003)

	local costText = self._challengeBtn:getChildByFullName("cost_text")
	local cost, amount = self:getCostEnergy()
	local icon = IconFactory:createPic({
		id = cost
	})

	icon:addTo(self._challengeBtn):setTag(1003):setPosition(cc.p(66.13, -14.18))
	costText:setString("X" .. amount)

	self._curPower = self._bagSystem:getPowerByCurrencyId(cost)

	if self._curPower < tonumber(amount) then
		costText:setTextColor(GameStyle:getColor(7))
	else
		costText:setTextColor(GameStyle:getColor(1))
	end
end

function ActivityPointDetailMediator:getCostEnergy()
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

function ActivityPointDetailMediator:checkCostChange()
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

function ActivityPointDetailMediator:changeTeamSuc()
	self:refreshTeamView()
end

function ActivityPointDetailMediator:refreshTeamView()
	local team = self._model:getTeam()
	local curCombat = team:getCombat()
	local teamCombatText = self._teamCombatPanel:getChildByName("combat_text")

	teamCombatText:setString(curCombat)

	if self._point:getRecommendCombat() <= curCombat then
		teamCombatText:setTextColor(cc.c3b(170, 235, 29))
	else
		teamCombatText:setTextColor(cc.c3b(255, 85, 85))
	end

	self._teamPanel:getChildByName("teamName"):setString(team:getName())

	local roleModel = IconFactory:getRoleModelByKey("MasterBase", team:getMasterId())
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

function ActivityPointDetailMediator:onClickBack(sender, eventType)
	self:close()
end

function ActivityPointDetailMediator:onClickChallenge()
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

function ActivityPointDetailMediator:onChallenge()
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
	local type = litTypeMap[self._parent._stageType]
	local pointId = self._point:getId()

	self._point:recordOldStar()
	self._point:recordHpRate()

	self._parent._data.stageType = self._parent._stageType
	self._parent._data.enterBattlePointId = pointId

	self._activitySystem:requestDoChildActivity(activityId, subActivityId, {
		doActivityType = 102,
		type = type,
		mapId = self._mapId,
		pointId = pointId
	}, function (rsdata)
		self:close()

		if rsdata.resCode == GS_SUCCESS then
			self._activitySystem:enterActstageBattle(rsdata.data, activityId, subActivityId)
		end
	end, true)
end

function ActivityPointDetailMediator:reachBattleCondition()
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

function ActivityPointDetailMediator:getMaxSwipCount()
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

function ActivityPointDetailMediator:showSweepBox()
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

function ActivityPointDetailMediator:onClickWipeOnce()
	self:onRequsetSwip(1)
end

function ActivityPointDetailMediator:onClickWipeTimes()
	local realTimes = math.min(self:getMaxSwipCount(), 10)

	self:onRequsetSwip(realTimes)
end

function ActivityPointDetailMediator:onRequsetSwip(times)
	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)

	local param = {
		type = litTypeMap[self._parent._stageType],
		doActivityType = 107,
		mapId = self._mapId,
		pointId = self._pointId,
		times = tostring(times)
	}

	self._activitySystem:requestDoChildActivity(self._parent._activity:getId(), self._model:getId(), param, function (data)
		data.param = {
			activityId = self._parent._activity:getId(),
			mapId = self._mapId,
			pointId = self._pointId,
			wipeTimes = times
		}

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, self:getInjector():getInstance("ActivityPointSweepView"), {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data))
	end)
end
