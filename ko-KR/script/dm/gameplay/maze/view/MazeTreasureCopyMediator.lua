MazeTreasureCopyMediator = class("MazeTreasureCopyMediator", DmPopupViewMediator, _M)

MazeTreasureCopyMediator:has("_mazeSystem", {
	is = "rw"
}):injectWith("MazeSystem")

local kBtnHandlers = {}
local kcellTag = 123
local kColumnNum = 3
local kHInterval = 258
local kVInterval = 10
local kFirstCellPos = cc.p(0, 0)

function MazeTreasureCopyMediator:initialize()
	super.initialize(self)
end

function MazeTreasureCopyMediator:dispose()
	super.dispose(self)
end

function MazeTreasureCopyMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListeners()
end

function MazeTreasureCopyMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_MAZE_TREASURE_COPY, self, self.updateViews)
end

function MazeTreasureCopyMediator:dispose()
	super.dispose(self)
end

function MazeTreasureCopyMediator:enterWithData(data)
	self._index = data._index

	self:initData()
	self:initViews()
end

function MazeTreasureCopyMediator:initData()
	self._curUseTreasure = nil
end

function MazeTreasureCopyMediator:initViews()
	self._main = self:getView()
	local skills = self._mazeSystem:getMasterSkill()
	self._cellclone = self._main:getChildByFullName("cellclone")
	self._cellbg = self._main:getChildByFullName("cellbg")
	self._checkCopyPanel = self._main:getChildByFullName("checkCopyPanel")

	self._checkCopyPanel:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			self._checkCopyPanel:setVisible(false)
		end
	end)
	self._checkCopyPanel:setVisible(false)

	local masterid = self._mazeSystem:getSelectMasterId()
	masterid = ConfigReader:getDataByNameIdAndKey("RoleModel", masterid, "Model")

	self:initTreasureList()
	self:refreshTableView()
end

function MazeTreasureCopyMediator:updateViews(response)
	self:initTreasureList()

	local points = response._data.d.player.pansLab.points

	for k, v in pairs(points) do
		self._tableView:reloadData()
		self:dispatch(Event:new(EVT_MAZE_UPDATE_OPTION, nil))

		local view = self:getInjector():getInstance("MazeTreasureGetView")
		local newdata = MazeTreasure:new()

		for kk, vv in pairs(points) do
			for kkk, vvv in pairs(vv.treasures) do
				newdata:syncData(vvv)
			end
		end

		local getinfo = {
			_desc = newdata:getDesc(),
			_name = newdata:getName(),
			_icon = newdata:getIconPath()
		}

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
			da = v.treasures,
			info = getinfo
		}))
		self:close()
	end
end

function MazeTreasureCopyMediator:initTreasureList()
	local count = 1
	local treasure = self._mazeSystem:getMasterTreasure()
	self._treasureList = {}

	for k, v in pairs(treasure) do
		self._treasureList[count] = v
		count = count + 1
	end

	if GameConfigs.mazeDebugMode then
		dump(self._treasureList, "宝物数据")
	end
end

function MazeTreasureCopyMediator:refreshTableView()
	if self._tableView then
		self._tableView:removeFromParent(true)
	end

	local clonePanel = self._cellclone
	local size = clonePanel:getContentSize()

	local function numberOfCellsInTableView(table)
		local cellnum = math.ceil(#self._treasureList / kColumnNum)

		return cellnum
	end

	local function cellTouched(table, cell)
	end

	local function cellSizeForTable(table, idx)
		return size.width + 30, size.height
	end

	local function tableCellAtIndex(table, idx)
		local cellbar = table:dequeueCell()

		if cellbar == nil then
			cellbar = cc.TableViewCell:new()

			for k = 1, kColumnNum do
				local treasureCell = clonePanel:clone()

				treasureCell:setSwallowTouches(false)

				local posX = kFirstCellPos.x + kHInterval * (k - 1)

				treasureCell:setPosition(cc.p(posX, kFirstCellPos.y))
				cellbar:addChild(treasureCell, 0, k)
			end
		end

		for i = 1, kColumnNum do
			local treasureCell = cellbar:getChildByTag(i)
			local curIndex = idx * kColumnNum + i

			if self._treasureList[curIndex] then
				treasureCell:setVisible(true)
				treasureCell:addTouchEventListener(function (sender, eventType)
					self:onCellClicked(sender, eventType, curIndex)
				end)
				self:setCellInfo(treasureCell, curIndex)
			else
				treasureCell:setVisible(false)
			end
		end

		return cellbar
	end

	local cellbgsize = self._cellbg:getContentSize()
	local tableView = cc.TableView:create(cellbgsize)

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setPosition(0, 0)
	tableView:setDelegate()
	self._cellbg:addChild(tableView, 10)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:registerScriptHandler(cellTouched, cc.TABLECELL_TOUCHED)

	self._tableView = tableView

	self._tableView:setBounceable(false)
	tableView:reloadData()
end

function MazeTreasureCopyMediator:setCellInfo(cell, idx)
	local oldcell = cell:getChildByTag(kcellTag)

	if oldcell then
		oldcell:removeFromParent(false)
	end

	cell:setTouchEnabled(true)
	cell:addTouchEventListener(function (sender, eventType)
		self:onCellClicked(sender, eventType, idx)
	end)

	local data = self._treasureList[idx]

	cell:getChildByFullName("name"):setString(data:getName())
	cell:getChildByFullName("icon"):loadTexture(data:getIconPath())

	local desc = data:getDesc()
	local width = desc
	local descNode = cell:getChildByFullName("desc")
	local oldtext = descNode:getChildByTag(666)

	descNode:setContentSize(212, 36)

	if oldtext then
		oldtext:removeFromParent(false)
	end

	if string.find(desc, "+") then
		local descs = string.split(desc, "+")
		local text = ccui.Text:create("+" .. descs[2], TTF_FONT_FZY3JW, 16)

		text:setColor(cc.c3b(170, 240, 20))
		text:setAnchorPoint(cc.p(0, 0))
		text:enableOutline(cc.c4b(35, 15, 5, 76.5), 2)
		descNode:setString(descs[1])

		local startPos = cc.p(descNode:getAutoRenderSize())
		local areasize = descNode:getTextAreaSize()

		descNode:setContentSize(descNode:getStringLength() * 18, math.ceil(descNode:getStringLength() / 13) * 19)
		text:setTag(666)
		text:setPosition(descNode:getStringLength() * 17, -2)
		descNode:addChild(text)
	else
		descNode:setString(data:getDesc())
	end

	cell:getChildByFullName("use"):setVisible(data:getIsUse())
end

function MazeTreasureCopyMediator:onCellClicked(sender, eventType, index)
	if eventType == ccui.TouchEventType.ended then
		local treasure = self._treasureList[index]

		print("要复制的宝物id--->", treasure:getId())
		self._checkCopyPanel:setVisible(true)

		local data = self._treasureList[index]

		self._checkCopyPanel:getChildByFullName("Image_1"):loadTexture(data:getIconPath())

		local checkbtn = self._checkCopyPanel:getChildByFullName("Button_1")

		checkbtn:addTouchEventListener(function (sender, eventType)
			if eventType == ccui.TouchEventType.ended then
				local data = {
					itemId = treasure:getId()
				}
				local cjson = require("cjson.safe")
				local paramsData = cjson.encode(data)

				self._mazeSystem:setOptionEventName(EVT_MAZE_TREASURE_COPY)
				self._mazeSystem:requestMazestStartOption(self._index, paramsData)
			end
		end)
	end
end
