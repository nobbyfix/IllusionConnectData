EliteTaskActivityMediator = class("EliteTaskActivityMediator", DmPopupViewMediator, _M)

EliteTaskActivityMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")

function EliteTaskActivityMediator:initialize()
	super.initialize(self)
end

function EliteTaskActivityMediator:dispose()
	super.dispose(self)
end

function EliteTaskActivityMediator:onRegister()
	super.onRegister(self)
end

function EliteTaskActivityMediator:enterWithData(data)
	self._activity = data.activity
	self._parentMediator = data.parentMediator

	self:setupView()
end

function EliteTaskActivityMediator:setupView()
	self._main = self:getView():getChildByName("main")
	self._listView = self._main:getChildByName("ListView")
	self._descPanel = self._main:getChildByName("desc")
	self._cloneCell = self:getView():getChildByName("cloneCell")
	self._taskList = self._activity:getSortActivityList()
	local timeStr = self._activity:getLocalTimeFactor()
	local startTime = ""
	local endTime = ""

	if timeStr.start then
		if type(timeStr.start) == "table" then
			startTime = timeStr.start[1]
		else
			startTime = timeStr.start
		end
	end

	if timeStr["end"] then
		endTime = timeStr["end"]
	end

	self._descPanel:setString(Strings:get(self._activity:getDesc(), {
		starttime = startTime,
		endtime = endTime
	}))
	self._descPanel:getVirtualRenderer():setLineSpacing(2)

	local activityConfig = self._activity:getActivityConfig()
	local heroPanel = self._main:getChildByName("heroPanel")

	heroPanel:getChildByFullName("Image_33"):setVisible(not activityConfig.ModelId)

	if activityConfig.ModelId then
		local roleModel = activityConfig.ModelId
		local heroSprite = IconFactory:createRoleIconSprite({
			useAnim = true,
			iconType = "Bust4",
			id = roleModel
		})

		heroSprite:setScale(0.85)
		heroSprite:addTo(heroPanel)
		heroSprite:setPosition(cc.p(283, 256))

		if activityConfig.ModelPos then
			heroSprite:posite(activityConfig.ModelPos[1], activityConfig.ModelPos[2])
		end

		if activityConfig.ModelScale then
			heroSprite:setScale(activityConfig.ModelScale)
		end
	end

	heroPanel:setTouchEnabled(true)
	heroPanel:addClickEventListener(function ()
	end)

	local activityConfig = self._activity:getActivityConfig()

	if activityConfig and activityConfig.TaskTopUI then
		local Image_9 = self._main:getChildByName("Image_9")

		Image_9:ignoreContentAdaptWithSize(true)
		Image_9:loadTexture(activityConfig.TaskTopUI .. ".png", ccui.TextureResType.plistType)
	end

	if activityConfig and activityConfig.TaskBgUI then
		self._main:getChildByName("Image_18"):loadTexture("asset/scene/" .. activityConfig.TaskBgUI .. ".jpg")
	end

	self:createTableView()
end

function EliteTaskActivityMediator:createTableView()
	local size = self._cloneCell:getContentSize()
	local tableView = cc.TableView:create(cc.size(size.width, 394))

	local function numberOfCells(view)
		return #self._taskList
	end

	local function cellTouched(table, cell)
	end

	local function cellSize(table, idx)
		return size.width, size.height + 7
	end

	local function cellAtIndex(table, idx)
		local index = idx + 1
		local cell = cc.TableViewCell:new()
		local cloneCell = self._cloneCell:clone()

		cloneCell:addTo(cell):setName("main")
		cloneCell:setPosition(cc.p(0, 4))

		local actBtn = cloneCell:getChildByName("actBtn")

		actBtn:setSwallowTouches(false)
		actBtn:getChildByName("Text_str"):setAdditionalKerning(4)
		cloneCell:getChildByName("title"):setAdditionalKerning(2)
		self:updataCell(cell, index)

		return cell
	end

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setDelegate()
	tableView:setAnchorPoint(cc.p(0.5, 0.5))
	tableView:setPosition(cc.p(8, 12))
	tableView:registerScriptHandler(numberOfCells, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellTouched, cc.TABLECELL_TOUCHED)
	tableView:registerScriptHandler(cellSize, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(cellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:addTo(self._listView)
	tableView:reloadData()
	tableView:setBounceable(false)

	self._tableView = tableView
end

function EliteTaskActivityMediator:updataCell(cell, index)
	local mainView = cell:getChildByName("main")
	local data = self._taskList[index]
	local desc = data._config.Desc
	local conditionText = mainView:getChildByName("content")

	conditionText:setString(Strings:get(desc))

	local name = data._config.Name
	local nameText = mainView:getChildByName("title")

	nameText:setString(Strings:get(name))

	local taskValueList = data:getTaskValueList()

	mainView:getChildByName("cur"):setString(taskValueList[1].currentValue)
	mainView:getChildByName("target"):setString("/" .. taskValueList[1].targetValue)

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

	local status = data:getStatus()
	local actBtn = mainView:getChildByName("actBtn")

	actBtn:setVisible(true)

	local recieveImg = mainView:getChildByName("recieve")

	recieveImg:setVisible(false)

	if status == ActivityTaskStatus.kUnfinish then
		local text = actBtn:getChildByName("Text_str")

		text:setString(Strings:get("SOURCE_DESC2"))

		if data:getDestUrl() ~= nil and data:getDestUrl() ~= "" then
			local function callFuncGo(sender, eventType)
				local beganPos = sender:getTouchBeganPosition()
				local endPos = sender:getTouchEndPosition()

				if math.abs(beganPos.x - endPos.x) < 30 and math.abs(beganPos.y - endPos.y) < 30 then
					self:onClickGo(data)
				end
			end

			mapButtonHandlerClick(nil, actBtn, {
				func = callFuncGo
			})
		end

		actBtn:loadTexture("hd_btn_qw.png", ccui.TextureResType.plistType)
	elseif status == ActivityTaskStatus.kFinishNotGet then
		local text = actBtn:getChildByName("Text_str")

		text:setString(Strings:get("Task_UI11"))

		local function callFuncGo(sender, eventType)
			local beganPos = sender:getTouchBeganPosition()
			local endPos = sender:getTouchEndPosition()

			if math.abs(beganPos.x - endPos.x) < 30 and math.abs(beganPos.y - endPos.y) < 30 then
				self:onClickGet(data, cell:getIdx())
			end
		end

		actBtn:loadTexture("hd_btn_lq.png", ccui.TextureResType.plistType)
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

		actBtn:setVisible(false)
		recieveImg:setVisible(true)
	end
end

function EliteTaskActivityMediator:onClickGo(data)
	local url = data:getDestUrl()
	local param = {}

	self:getEventDispatcher():dispatchEvent(Event:new(EVT_OPENURL, {
		url = url,
		extParams = param
	}))
end

function EliteTaskActivityMediator:resumeView()
	self._tableView:reloadData()
end

function EliteTaskActivityMediator:onClickGet(data, index)
	local status = data:getStatus()

	if status == ActivityTaskStatus.kUnfinish then
		self:getEventDispatcher():dispatchEvent(ShowTipEvent({
			tip = Strings:get("Task_Text1")
		}))

		return
	end

	local data = {
		doActivityType = 101,
		taskId = data:getId()
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

		self._tableView:updateCellAtIndex(index)
	end)
end
