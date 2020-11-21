ActivityLoginLoverMediator = class("ActivityLoginLoverMediator", DmPopupViewMediator, _M)

ActivityLoginLoverMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")

local lightColor = cc.c3b(180, 180, 180)
local darkColor = cc.c3b(50, 41, 41)

function ActivityLoginLoverMediator:initialize()
	super.initialize(self)
end

function ActivityLoginLoverMediator:dispose()
	super.dispose(self)
end

function ActivityLoginLoverMediator:onRegister()
	super.onRegister(self)
end

function ActivityLoginLoverMediator:enterWithData(data)
	self._actModel = data.activity
	self._cloneCell = self:getView():getChildByFullName("cloneCell")
	self._main = self:getView():getChildByName("main")

	self:setupView()
end

function ActivityLoginLoverMediator:setupView()
	self._loginDayList = self._actModel._taskList

	table.sort(self._loginDayList, function (a, b)
		local aNum = a._config.OrderNum
		local bNum = b._config.OrderNum

		return aNum < bNum
	end)

	self._activityConfig = self._actModel:getActivityConfig()

	self:getLastRewardDay()
	self:createTableView()

	if self._selectTag > 3 then
		local space = self._cloneCell:getContentSize().width

		self._tableView:setContentOffset(cc.p(-space * (self._selectTag - 3), 0))
	end
end

function ActivityLoginLoverMediator:getLastRewardDay()
	self._selectTag = 0

	for i = 1, #self._loginDayList do
		local taskInfo = self._loginDayList[i]
		local status = taskInfo:getStatus()

		if status == ActivityTaskStatus.kFinishNotGet then
			self._selectTag = i

			break
		end
	end
end

function ActivityLoginLoverMediator:createTableView()
	local tableView = cc.TableView:create(cc.size(770, 330))

	local function scrollViewDidScroll(view)
	end

	local function scrollViewDidZoom(view)
	end

	local function tableCellTouch(table, cell)
		self:touchCell(cell:getIdx() + 1)
	end

	local function cellSizeForTable(table, idx)
		local size = self._cloneCell:getContentSize()

		return size.width, size.height
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
		end

		self:updateCell(cell, idx + 1)

		return cell
	end

	local function numberOfCellsInTableView(table)
		return #self._loginDayList
	end

	tableView:setAnchorPoint(0, 0)
	tableView:setPosition(cc.p(218, 85))
	tableView:addTo(self._main)
	tableView:setDelegate()
	tableView:setBounceable(false)
	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:registerScriptHandler(tableCellTouch, cc.TABLECELL_TOUCHED)
	tableView:reloadData()

	self._tableView = tableView
end

function ActivityLoginLoverMediator:updateCell(cell, index)
	local taskInfo = self._loginDayList[index]
	local status = taskInfo:getStatus()
	local reward = taskInfo:getReward()
	local cloneCell = cell:getChildByName("main")

	if not cloneCell then
		cloneCell = self._cloneCell:clone()

		cloneCell:addTo(cell):setName("main")
		cloneCell:setPosition(cc.p(0, 8))
		cloneCell:getChildByName("num1"):ignoreContentAdaptWithSize(true)
	end

	local spDay = self._activityConfig.specailDay
	local title = cloneCell:getChildByName("titleBg")

	title:getChildByName("num"):setString(index)

	local num1Image = cloneCell:getChildByName("num1")

	num1Image:loadTexture("hd_14r_d" .. index .. ".png", 1)

	local select = cloneCell:getChildByName("bgSelect")
	local unselect = cloneCell:getChildByName("bgUnselect")
	local finishAndGetView = cloneCell:getChildByName("finishAndGet")

	title:loadTexture("hd_14r_btn_hdi.png", ccui.TextureResType.plistType)
	title:getChildByName("text1"):setTextColor(lightColor)
	title:getChildByName("text2"):setTextColor(lightColor)
	title:getChildByName("num"):setTextColor(cc.c3b(255, 255, 255))

	if status == ActivityTaskStatus.kGet then
		finishAndGetView:setVisible(true)
		unselect:setVisible(false)
		select:setVisible(false)
	else
		finishAndGetView:setVisible(false)

		if table.indexof(spDay, index) then
			select:loadTexture("hd_14r_btn_wxz_j.png", ccui.TextureResType.plistType)
			unselect:loadTexture("hd_14r_btn_xz_j.png", ccui.TextureResType.plistType)
		else
			select:loadTexture("hd_14r_btn_wxz.png", ccui.TextureResType.plistType)
			unselect:loadTexture("hd_14r_btn_xz.png", ccui.TextureResType.plistType)
		end

		if index == self._selectTag then
			select:setVisible(false)
			unselect:setVisible(true)
			title:loadTexture("hd_14r_btn_ldi.png", ccui.TextureResType.plistType)
			title:getChildByName("text1"):setTextColor(darkColor)
			title:getChildByName("text2"):setTextColor(darkColor)
			title:getChildByName("num"):setTextColor(darkColor)
		else
			select:setVisible(true)
			unselect:setVisible(false)
		end
	end

	local iconNode = cloneCell:getChildByName("rewardIcon")

	iconNode:removeAllChildren()

	local rewardData = reward.Content[1]
	local icon = IconFactory:createRewardIcon(rewardData, {
		isWidget = true
	})

	icon:setScaleNotCascade(0.6)
	icon:setSwallowTouches(false)
	icon:addTo(iconNode):center(iconNode:getContentSize())

	if status == ActivityTaskStatus.kGet then
		icon:setColor(cc.c3b(120, 120, 120))

		local iamge = ccui.ImageView:create("hd_14r_btn_go.png", ccui.TextureResType.plistType)

		iamge:addTo(iconNode):center(iconNode:getContentSize())
	end

	IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewardData, {
		needDelay = true
	})

	local rewardName = RewardSystem:getName(rewardData)
	local rewardNameStr = cloneCell:getChildByName("name")

	rewardNameStr:setString(rewardName)

	if status == ActivityTaskStatus.kGet then
		rewardNameStr:setTextColor(cc.c3b(164, 160, 160))
		rewardNameStr:enableOutline(cc.c3b(0, 0, 0), 2)
	else
		rewardNameStr:setTextColor(cc.c3b(255, 255, 255))
		rewardNameStr:enableOutline(cc.c3b(83, 72, 54), 2)
	end
end

function ActivityLoginLoverMediator:touchCell(index)
	local taskInfo = self._loginDayList[index]
	local status = taskInfo:getStatus()

	if status == ActivityTaskStatus.kUnfinish then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Extra_Login_Lock", {
				num = index
			})
		}))
	elseif status == ActivityTaskStatus.kFinishNotGet then
		if self._selectTag == index then
			self:requsetGetReward(self._actModel:getId(), taskInfo:getId())
		else
			self._selectTag = index

			self._tableView:reloadData()
		end
	elseif status == ActivityTaskStatus.kGet then
		-- Nothing
	end
end

function ActivityLoginLoverMediator:requsetGetReward(activityId, taskId)
	local data = {
		doActivityType = 101,
		taskId = taskId
	}

	self._activitySystem:requestDoActivity(activityId, data, function (response)
		if checkDependInstance(self) then
			self:getLastRewardDay()
			self._tableView:reloadData()

			local rewards = response.data.reward

			if rewards then
				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					rewards = rewards
				}))
			end
		end
	end)
end
