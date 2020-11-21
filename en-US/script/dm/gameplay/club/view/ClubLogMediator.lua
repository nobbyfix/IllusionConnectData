ClubLogMediator = class("ClubLogMediator", DmAreaViewMediator, _M)

ClubLogMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ClubLogMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
ClubLogMediator:has("_clubSystem", {
	is = "r"
}):injectWith("ClubSystem")

local kBtnHandlers = {}

function ClubLogMediator:initialize()
	super.initialize(self)
end

function ClubLogMediator:dispose()
	self._viewClose = true

	self:disposeView()
	super.dispose(self)
end

function ClubLogMediator:disposeView()
	self._viewCache = nil
end

function ClubLogMediator:userInject()
end

function ClubLogMediator:onRegister()
	super.onRegister(self)
end

function ClubLogMediator:enterWithData(data)
	self:initNodes()
	self:createData()
end

function ClubLogMediator:initNodes()
	self._mainPanel = self:getView():getChildByFullName("main")
	self._notHasLabel = self._mainPanel:getChildByFullName("nothaslabel")
end

function ClubLogMediator:createData()
	self._player = self._developSystem:getPlayer()
end

function ClubLogMediator:refreshView()
	self._clubSystem:requestLogList(1, 20, true, function ()
		if self._viewClose then
			return
		end

		self:setupView()
	end)
end

function ClubLogMediator:setupView()
	self:refreshData()
	self._notHasLabel:setVisible(false)

	if self._logRecordListOj:getRecordCount() ~= 0 then
		if self._tableView then
			self._tableView:removeFromParent(true)

			self._tableView = nil
		end

		self:createTableView()
	end
end

function ClubLogMediator:refreshData(data)
	self._clubInfoOj = self._clubSystem:getClubInfoOj()
	self._logRecordListOj = self._clubSystem:getLogRecordListOj()
	self._logList = self._logRecordListOj:getList()
	self._titleCahce = {}

	for i = 1, #self._logList do
		local data = self._logList[i]
		local dateStr = data:getDateStr()

		if not self._titleCahce[dateStr] then
			self._titleCahce[dateStr] = i
		end
	end

	self._posCahce = {}
end

local minHeight = 32
local titleHeight = 66

function ClubLogMediator:createTableView()
	local width = 880
	local height = 30

	local function scrollViewDidScroll(table)
		if table:isTouchMoved() then
			self:touchForTableview()
		end
	end

	local function scrollViewDidZoom(view)
	end

	local function tableCellTouch(table, cell)
	end

	local function cellSizeForTable(table, idx)
		local descLabel = self:getRichText(idx)

		if not descLabel then
			return 0, 0
		end

		local height = math.max(minHeight, descLabel:getContentSize().height - 2)
		local data = self._logList[idx + 1]
		local dateStr = data:getDateStr()
		local hasTitle = false

		if self._titleCahce[dateStr] and self._titleCahce[dateStr] == idx + 1 then
			hasTitle = true
		end

		height = height + (hasTitle and titleHeight or 0)

		if not self._posCahce[idx + 1] then
			self._posCahce[idx + 1] = height
		end

		return width, height
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()
		cell = cell or cc.TableViewCell:new()

		cell:removeAllChildren()

		local descLabel = self:getRichText(idx)

		if not descLabel then
			return cell
		end

		local height = math.max(minHeight, descLabel:getContentSize().height)
		local realHeight = height
		local data = self._logList[idx + 1]
		local dateStr = data:getDateStr()
		local hasTitle = false

		if self._titleCahce[dateStr] and self._titleCahce[dateStr] == idx + 1 then
			hasTitle = true
		end

		height = height + (hasTitle and titleHeight or 0)

		if not self._posCahce[idx + 1] then
			self._posCahce[idx + 1] = height
		end

		local mainLayout = ccui.Layout:create()

		mainLayout:setContentSize(cc.size(width, height + 2))
		mainLayout:setPosition(cc.p(0, 0))
		mainLayout:setAnchorPoint(cc.p(0, 0))
		cell:addChild(mainLayout, 11, 123)

		local node = cc.Node:create()

		node:addTo(mainLayout):posite(0, 0)

		local middleHeight = mainLayout:getContentSize().height / 2
		local timeLabel = cc.Label:createWithTTF("", TTF_FONT_FZYH_R, 18)

		timeLabel:setTextColor(cc.c3b(35, 35, 35))
		timeLabel:setString(data:getTimeStr())
		timeLabel:setAnchorPoint(0, 1)
		timeLabel:posite(22, realHeight - 2)
		descLabel:posite(80, realHeight + 3)
		timeLabel:addTo(node)
		descLabel:addTo(node)
		node:setPositionY(10)

		if hasTitle then
			local image = ccui.ImageView:create("st_bg_date.png", ccui.TextureResType.plistType)

			image:setAnchorPoint(0.5, 0.5)
			image:addTo(mainLayout):posite(80, mainLayout:getContentSize().height - 46)

			local dateLabel = cc.Label:createWithTTF("", TTF_FONT_FZYH_M, 22)

			dateLabel:setString(data:getDateStr())
			dateLabel:setAnchorPoint(0.5, 0.5)
			dateLabel:addTo(mainLayout):posite(66, mainLayout:getContentSize().height - 46)

			local lineGradiantVec2 = {
				{
					ratio = 0.7,
					color = cc.c4b(255, 255, 255, 255)
				},
				{
					ratio = 0.9,
					color = cc.c4b(129, 118, 113, 255)
				}
			}

			dateLabel:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
				x = 0,
				y = -1
			}))
			dateLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)
		else
			timeLabel:posite(22, realHeight - 5)
			descLabel:setPositionY(realHeight)
		end

		return cell
	end

	local function numberOfCellsInTableView(table)
		return self._logRecordListOj:getRecordCount()
	end

	local tableView = cc.TableView:create(cc.size(890, 482))

	tableView:setTag(1234)
	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setPosition(215, 78)
	tableView:setDelegate()
	self._mainPanel:addChild(tableView, 10)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:registerScriptHandler(tableCellTouch, cc.TABLECELL_TOUCHED)

	self._tableView = tableView

	tableView:reloadData()
end

function ClubLogMediator:touchForTableview()
	if self._isAskingRequest then
		return
	end

	local kMinRefreshHeight = 35
	local sureRequest = false
	local offsetY = self._tableView:getContentOffset().y

	if kMinRefreshHeight < offsetY then
		local factor2 = self._logRecordListOj:getRecordCount() < self._logRecordListOj:getMaxCount()

		if factor2 then
			sureRequest = true
		end
	end

	if sureRequest then
		self._isAskingRequest = true
		self._requestNextCount = self._logRecordListOj:getRecordCount()

		self:doRequestNextRank()
	end
end

function ClubLogMediator:getRichText(idx)
	local data = self._logList[idx + 1]

	if not data then
		return
	end

	local config = setmetatable({
		fontName = TTF_FONT_FZYH_M
	}, {
		__index = data:getCustomData()
	})

	if config.Job then
		config.Job = self._clubSystem:getPositionNameStr(config.Job)
	end

	if config.factor1 then
		local clubConfig = ConfigReader:getRecordById("ClubTechnologyPoint", config.factor1)
		config.factor1 = Strings:get(clubConfig.Name)
	end

	if config.factor2 then
		local clubConfig = ConfigReader:getRecordById("ClubDonation", config.factor2)
		config.factor2 = Strings:get(clubConfig.Name)
	end

	local richTextStr = Strings:get(data:getLogConfigId(), config)
	local descLabel = ccui.RichText:createWithXML(richTextStr, {})

	descLabel:ignoreContentAdaptWithSize(true)
	descLabel:rebuildElements()
	descLabel:formatText()
	descLabel:setAnchorPoint(cc.p(0, 1))
	descLabel:renderContent()

	local size = descLabel:getContentSize()

	if size.width > 700 then
		descLabel:renderContent(700, 0)
	end

	return descLabel
end

function ClubLogMediator:doRequestNextRank()
	local dataEnough = self._logRecordListOj:getDataEnough()

	if dataEnough == true then
		local function onRequestRankDataSucc()
			self:refreshData()
			self._tableView:removeFromParent(true)
			self:createTableView()

			if self._requestNextCount then
				local diffCount = self._logRecordListOj:getRecordCount() - self._requestNextCount
				local kCellHeight = 8
				local offsetY = -diffCount * kCellHeight + kCellHeight * 1

				self._tableView:setContentOffset(cc.p(0, offsetY))

				self._requestNextCount = nil
			end

			self._isAskingRequest = false
		end

		local rankStart = self._logRecordListOj:getRecordCount() + 1
		local rankEnd = rankStart + self._logRecordListOj:getRequestRankCountPerTime() - 1

		self._clubSystem:requestLogList(rankStart, rankEnd, false, onRequestRankDataSucc)
	else
		self._isAskingRequest = false
	end
end

function ClubAuditMediator:getTableViewPosY()
	return self._tableView:getContentOffset().y
end

function ClubLogMediator:onClickBack(sender, eventType)
	self:dismiss()
	cc.Director:getInstance():getOpenGLView():setIMEKeyboardState(false)
end
