ActivityTaskStageStarMediator = class("ActivityTaskStageStarMediator", DmPopupViewMediator, _M)

ActivityTaskStageStarMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")
ActivityTaskStageStarMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ActivityTaskStageStarMediator:has("_stageSystem", {
	is = "r"
}):injectWith("StageSystem")
ActivityTaskStageStarMediator:has("_rechargeAndVipModel", {
	is = "r"
}):injectWith("RechargeAndVipModel")

local KGetType = {
	recharge = 102,
	normal = 101
}

function ActivityTaskStageStarMediator:initialize()
	super.initialize(self)
end

function ActivityTaskStageStarMediator:dispose()
	self:stopTimer()
	super.dispose(self)
end

function ActivityTaskStageStarMediator:onRegister()
	super.onRegister(self)
	self:mapEventListener(self:getEventDispatcher(), EVT_BUY_ACTIVITY_PAY_SUCC, self, self.paySuccCallBack)
end

function ActivityTaskStageStarMediator:enterWithData(data)
	self._activity = data.activity
	self._parentMediator = data.parentMediator

	self:setupView()
end

function ActivityTaskStageStarMediator:setupView()
	self._main = self:getView():getChildByName("main")
	self._listView = self._main:getChildByName("ListView")
	self._cloneCell = self:getView():getChildByName("cloneCell")

	self._cloneCell:setVisible(false)

	self._taskList = self._activity:getSortActivityList()
	self._activityConfig = self._activity:getActivityConfig()

	self._main:getChildByFullName("heroPanel.Image_33"):setVisible(not self._activityConfig.showHero)

	if self._activityConfig.showHero then
		local heroPanel = self._main:getChildByName("heroPanel")
		local roleModel = IconFactory:getRoleModelByKey("HeroBase", self._activityConfig.showHero)
		local heroSprite = IconFactory:createRoleIconSprite({
			iconType = 6,
			id = roleModel
		})

		heroSprite:setScale(1.1)
		heroSprite:addTo(heroPanel)
		heroSprite:setPosition(cc.p(275, 90))
	end

	if self._activityConfig and self._activityConfig.TaskBgUI then
		self._main:getChildByName("Image_18"):loadTexture("asset/scene/" .. self._activityConfig.TaskBgUI .. ".jpg")
	end

	local descPanel = self._main:getChildByName("desc")

	descPanel:setString("")
	descPanel:getVirtualRenderer():setLineSpacing(2)

	local contentText = ccui.RichText:createWithXML("desc", {})

	contentText:setTouchEnabled(true)
	contentText:setSwallowTouches(false)
	contentText:setWrapMode(1)
	contentText:setAnchorPoint(cc.p(0, 0.5))
	contentText:setPosition(cc.p(0, 0))
	contentText:setFontSize(16)
	contentText:addTo(descPanel)

	self._descPanel = contentText
	self._buyTtitlePanel = self._main:getChildByFullName("buyTtitlePanel")
	self._timesTipPanel = self._main:getChildByFullName("timesTipPanel")
	local txt_0 = self._main:getChildByFullName("buyTtitlePanel.txt_0")
	local txt_1 = self._main:getChildByFullName("buyTtitlePanel.txt_1")
	local lineGradiantVec2 = {
		{
			ratio = 0.3,
			color = cc.c4b(255, 238, 92, 255)
		},
		{
			ratio = 0.7,
			color = cc.c4b(255, 255, 255, 255)
		}
	}

	txt_0:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
		x = 0,
		y = -1
	}))
	txt_0:enableOutline(cc.c4b(120, 54, 85, 255), 2)

	local lineGradiantVec2 = {
		{
			ratio = 0.3,
			color = cc.c4b(255, 225, 103, 255)
		},
		{
			ratio = 0.7,
			color = cc.c4b(255, 252, 228, 255)
		}
	}

	txt_1:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
		x = 0,
		y = -1
	}))
	txt_1:enableShadow(cc.c4b(16, 103, 5, 255), cc.size(2, 0), 2)

	local actBtnBuy = self._main:getChildByFullName("timesTipPanel.actBtnBuy")

	local function callFuncGo(sender, eventType)
		self:goBuy()
	end

	mapButtonHandlerClick(nil, actBtnBuy, {
		func = callFuncGo
	})
	self:updateTopBuyView()
	self:createTableView()
end

function ActivityTaskStageStarMediator:updateTopBuyView()
	local buyDays = self._activityConfig.buyDays
	local payId = self._activityConfig.payId
	local buy = self._activity:getPayStatus()
	local desc = Strings:get("ACT_StageStar_Desc2", {
		fontName = TTF_FONT_FZYH_M
	})

	if buy then
		self._buyTtitlePanel:setPositionX(466.1)
		self._buyTtitlePanel:setVisible(true)
		self._timesTipPanel:setVisible(false)

		desc = Strings:get("ACT_StageStar_Desc2", {
			fontName = TTF_FONT_FZYH_M
		})
	else
		local deadline = self._activity:getDeadline()

		if deadline then
			self._buyTtitlePanel:setVisible(false)
			self._timesTipPanel:setVisible(false)
		else
			self._buyTtitlePanel:setPositionX(366.1)
			self._buyTtitlePanel:setVisible(true)
			self._timesTipPanel:setVisible(true)

			local payOffSystem = DmGame:getInstance()._injector:getInstance(PayOffSystem)
			local symbol, price = payOffSystem:getPaySymbolAndPrice(payId)
			local symbolS = self._timesTipPanel:getChildByFullName("symbol")
			local moneyS = self._timesTipPanel:getChildByFullName("money")

			symbolS:setString(symbol)
			moneyS:setString(price)

			local sysw = symbolS:getContentSize().width
			local mw = moneyS:getContentSize().width

			symbolS:setPositionX(323 + (sysw - mw) / 2)
			moneyS:setPositionX(323 + (sysw - mw) / 2)

			desc = Strings:get("ACT_StageStar_Desc1", {
				fontName = TTF_FONT_FZYH_M
			})

			self:setTimer()
		end
	end

	self._descPanel:setString(desc)
end

function ActivityTaskStageStarMediator:createTableView()
	local size = self._cloneCell:getContentSize()
	local tableView = cc.TableView:create(cc.size(size.width, 350))

	local function numberOfCells(view)
		return #self._taskList
	end

	local function cellTouched(table, cell)
	end

	local function cellSize(table, idx)
		return size.width, size.height + 5
	end

	local function cellAtIndex(table, idx)
		local index = idx + 1
		local cell = table:dequeueCell()

		if not cell then
			cell = cc.TableViewCell:new()
			local cloneCell = nil
			cloneCell = self._cloneCell:clone()

			cloneCell:setVisible(true)
			cloneCell:addTo(cell):setName("main")
			cloneCell:setPosition(cc.p(0, 4))

			local actBtn = cloneCell:getChildByName("actBtn")

			actBtn:setSwallowTouches(false)
			actBtn:getChildByName("Text_str"):setAdditionalKerning(4)
			cloneCell:getChildByName("title"):setAdditionalKerning(2)
		end

		self:updataCell(cell, index)

		return cell
	end

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setDelegate()
	tableView:setAnchorPoint(cc.p(0.5, 0.5))
	tableView:setPosition(cc.p(10, 11))
	tableView:registerScriptHandler(numberOfCells, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellTouched, cc.TABLECELL_TOUCHED)
	tableView:registerScriptHandler(cellSize, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(cellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:addTo(self._listView)
	tableView:reloadData()
	tableView:setBounceable(false)

	self._tableView = tableView
end

function ActivityTaskStageStarMediator:updataCell(cell, index)
	local mainView = cell:getChildByName("main")
	local data = self._taskList[index]
	local taskValueList = data:getTaskValueList()

	mainView:getChildByName("progressText"):setString("(" .. taskValueList[1].currentValue .. "/" .. taskValueList[1].targetValue .. ")")
	mainView:getChildByName("level"):setString(taskValueList[1].targetValue)

	local name = data:getConfig().Name
	local nameText = mainView:getChildByName("title")

	nameText:setString(Strings:get(name))

	local rewardPanel = mainView:getChildByName("reward")

	rewardPanel:removeAllChildren()

	local rewards = data:getReward()

	if rewards and rewards.Content then
		for i, rewardData in pairs(rewards.Content) do
			local icon = IconFactory:createRewardIcon(rewardData, {
				isWidget = true
			})

			icon:setAnchorPoint(cc.p(0, 0))
			icon:setScaleNotCascade(0.5)
			icon:addTo(rewardPanel):posite(-4.5 + (i - 1) * 66, 0)
			IconFactory:bindTouchHander(icon, IconTouchHandler:new(self._parentMediator), rewardData, {
				needDelay = true
			})
		end
	end

	local buy = self._activity:getPayStatus()
	local deadline = self._activity:getDeadline()

	if buy then
		deadline = false
	end

	local cardRewardPanel = mainView:getChildByName("Panel_CardReward")

	cardRewardPanel:setVisible(not deadline)

	local cardRewardPanel = mainView:getChildByName("Panel_CardReward")
	local extraRewardIconPanel = cardRewardPanel:getChildByName("icon")

	extraRewardIconPanel:removeAllChildren()

	local rewards = data:getExtraReward()

	if rewards and rewards.Content then
		for i, rewardData in pairs(rewards.Content) do
			local icon = IconFactory:createRewardIcon(rewardData, {
				isWidget = true
			})

			icon:setAnchorPoint(cc.p(0, 0))
			icon:setScaleNotCascade(0.5)
			icon:addTo(extraRewardIconPanel):posite(0 + (i - 1) * 66, 0)
			IconFactory:bindTouchHander(icon, IconTouchHandler:new(self._parentMediator), rewardData, {
				needDelay = true
			})
		end
	end

	local status = data:getStatus()
	local actBtn = mainView:getChildByName("actBtn")

	actBtn:setVisible(false)

	local actBtnGold = mainView:getChildByName("actBtnGold")

	actBtnGold:setVisible(false)

	local recieveImg = mainView:getChildByName("recieve")

	recieveImg:setVisible(false)

	local noRecieveStr = mainView:getChildByName("noRecieveStr")

	noRecieveStr:setVisible(false)
	mainView:getChildByName("progressText"):setVisible(false)

	if status == ActivityTaskStatus.kUnfinish then
		noRecieveStr:setVisible(true)
		mainView:getChildByName("progressText"):setVisible(true)
	elseif status == ActivityTaskStatus.kFinishNotGet then
		actBtn:setVisible(true)

		local function callFuncGo(sender, eventType)
			local beganPos = sender:getTouchBeganPosition()
			local endPos = sender:getTouchEndPosition()

			if math.abs(beganPos.x - endPos.x) < 30 and math.abs(beganPos.y - endPos.y) < 30 then
				self:onClickGet(data, cell:getIdx(), KGetType.normal)
			end
		end

		mapButtonHandlerClick(nil, actBtn, {
			func = callFuncGo
		})
	else
		local children = rewardPanel:getChildren()

		for i = 1, #children do
			local node = children[i]

			node:setColor(cc.c3b(120, 120, 120))

			local img = ccui.ImageView:create("hd_14r_btn_go.png", 1)

			img:setScale(0.5)
			img:addTo(rewardPanel)
			img:setPosition(cc.p(-42 + i * 66, 28))
		end

		if deadline then
			actBtn:setVisible(false)
			recieveImg:setVisible(true)
		else
			local get = self._activity:getRechargeStatus(data:getId())

			if get then
				recieveImg:setVisible(true)

				local children = extraRewardIconPanel:getChildren()

				for i = 1, #children do
					local node = children[i]

					node:setColor(cc.c3b(120, 120, 120))

					local img = ccui.ImageView:create("hd_14r_btn_go.png", 1)

					img:setScale(0.5)
					img:addTo(extraRewardIconPanel)
					img:setPosition(cc.p(28 + (i - 1) * 56, 29))
				end
			else
				actBtnGold:setVisible(true)

				local function callFuncGo(sender, eventType)
					local beganPos = sender:getTouchBeganPosition()
					local endPos = sender:getTouchEndPosition()

					if math.abs(beganPos.x - endPos.x) < 30 and math.abs(beganPos.y - endPos.y) < 30 then
						self:onClickGet(data, cell:getIdx(), KGetType.recharge)
					end
				end

				mapButtonHandlerClick(nil, actBtnGold, {
					func = callFuncGo
				})
			end
		end
	end
end

function ActivityTaskStageStarMediator:onClickGo(data)
	local url = data:getDestUrl()
	local param = {}

	self:getEventDispatcher():dispatchEvent(Event:new(EVT_OPENURL, {
		url = url,
		extParams = param
	}))
end

function ActivityTaskStageStarMediator:resumeView()
	self._tableView:reloadData()
end

function ActivityTaskStageStarMediator:onClickGet(data, index, activityType)
	local status = data:getStatus()

	if status == ActivityTaskStatus.kUnfinish then
		self:getEventDispatcher():dispatchEvent(ShowTipEvent({
			tip = Strings:get("Task_Text1")
		}))

		return
	end

	local doActivityType = KGetType.normal

	if activityType == KGetType.recharge then
		local buy = self._activity:getPayStatus()

		if buy then
			doActivityType = KGetType.recharge
		else
			self:getMonthCard(data)

			return
		end
	end

	local params = {
		doActivityType = doActivityType,
		taskId = data:getId()
	}

	self._activitySystem:requestDoActivity(self._activity:getId(), params, function (response)
		local rewards = response.data.reward

		if rewards then
			local view = self:getInjector():getInstance("getRewardView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				maskOpacity = 0
			}, {
				rewards = rewards
			}))
		end

		self._tableView:updateCellAtIndex(index)
	end)
end

function ActivityTaskStageStarMediator:getMonthCard(taskData)
	AudioEngine:getInstance():playEffect("Se_Click_Common_2", false)

	local function func()
		self:goBuy(taskData)
	end

	local outSelf = self
	local delegate = {
		willClose = function (self, popupMediator, data)
			if data.response == "ok" then
				func()
			elseif data.response == "cancel" then
				-- Nothing
			elseif data.response == "close" then
				-- Nothing
			end
		end
	}
	local data = {
		title = Strings:get("ACT_StageStar_Buytitle"),
		title1 = Strings:get("UITitle_EN_Zhimengtequan"),
		content = Strings:get("ACT_StageStar_Buytext"),
		sureBtn = {},
		cancelBtn = {}
	}
	local view = self:getInjector():getInstance("AlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end

function ActivityTaskStageStarMediator:stopTimer()
	if self._timer then
		self._timer:stop()

		self._timer = nil
	end
end

function ActivityTaskStageStarMediator:setTimer()
	self:stopTimer()

	if not self._activity then
		return
	end

	local times = self._timesTipPanel:getChildByFullName("times")
	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local remoteTimestamp = gameServerAgent:remoteTimestamp()
	local startTime = self._activity:getStartTime() / 1000
	local buyDays = self._activityConfig.buyDays
	local endMills = startTime + tonumber(buyDays) * 24 * 60 * 60

	if remoteTimestamp < endMills and not self._timer then
		local function checkTimeFunc()
			remoteTimestamp = gameServerAgent:remoteTimestamp()
			local endMills = startTime + tonumber(buyDays) * 24 * 60 * 60

			if endMills <= remoteTimestamp then
				self:stopTimer()
				self:updateTopBuyView()
				self._tableView:reloadData()

				return
			end

			local str = ""
			local fmtStr = "${d}:${H}:${M}:${S}"
			local remainTime = endMills - remoteTimestamp
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

			times:setString(str)
		end

		checkTimeFunc()

		self._timer = LuaScheduler:getInstance():schedule(checkTimeFunc, 1, false)
	end
end

function ActivityTaskStageStarMediator:goBuy()
	local data = {
		doActivityType = 103
	}

	self._activitySystem:requestDoActivity(self._activity:getId(), data, function (response)
		local rewards = response.data.reward

		if rewards then
			local view = self:getInjector():getInstance("getRewardView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				maskOpacity = 0
			}, {
				rewards = rewards
			}))
		end

		local payOffSystem = self:getInjector():getInstance(PayOffSystem)

		payOffSystem:payOffToSdk(response.data)
	end)
end

function ActivityTaskStageStarMediator:paySuccCallBack()
	self:updateTopBuyView()
end
