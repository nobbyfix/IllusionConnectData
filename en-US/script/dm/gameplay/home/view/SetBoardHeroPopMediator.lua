SetBoardHeroPopMediator = class("SetBoardHeroPopMediator", DmPopupViewMediator, _M)

SetBoardHeroPopMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
SetBoardHeroPopMediator:has("_customDataSystem", {
	is = "r"
}):injectWith("CustomDataSystem")

local kBtnHandlers = {
	["main.checkBox"] = {
		ignoreClickAudio = true,
		func = "onClickCheckBox"
	},
	["main.randomBox.Panel_5"] = {
		ignoreClickAudio = true,
		func = "onClickRandom"
	}
}

function SetBoardHeroPopMediator:initialize()
	super.initialize(self)
end

function SetBoardHeroPopMediator:onRegister()
	super.onRegister(self)

	self._heroSystem = self._developSystem:getHeroSystem()
	self._settingModel = self:getInjector():getInstance(SettingSystem):getSettingModel()

	self:mapButtonHandlersClick(kBtnHandlers)
	self:initWidget()
end

function SetBoardHeroPopMediator:dispose()
	super.dispose(self)
end

function SetBoardHeroPopMediator:enterWithData(data)
	self._doubleClickTag = false
	self._doubleClickRandom = false
	self._setBoardHeroId = data.heroId
	self._chooseIndex = 1
	self._herosList = self._heroSystem:getOwnHeroIds()

	self:sortHeroList()

	self._cloneCell = self:getView():getChildByName("cellClone")

	self:createTableView()
end

function SetBoardHeroPopMediator:initWidget()
	self._main = self:getView():getChildByName("main")
	self._checkBox = self._main:getChildByName("checkBox")
	self._randomBox = self._main:getChildByName("randomBox")
	local isDynamic = self._settingModel:getRoleDynamic()

	self:onCheckBoxChange(isDynamic)

	if CommonUtils.GetSwitch("fn_board_random") == true then
		local isRandom = self._settingModel:getRoleAndBgRandom()

		self:onRandomBoxChange(isRandom)
	else
		self._randomBox:setVisible(false)
	end
end

function SetBoardHeroPopMediator:sortHeroList()
	for _, v in ipairs(self._herosList) do
		if self._setBoardHeroId == v.id then
			v.sortTag = 999
		else
			v.sortTag = 1
		end
	end

	table.sort(self._herosList, function (a, b)
		return b.sortTag < a.sortTag or a.sortTag == b.sortTag and b.loveLevel < a.loveLevel or a.sortTag == b.sortTag and a.loveLevel == b.loveLevel and a.rareity == b.rareity and b.id < a.id
	end)
end

function SetBoardHeroPopMediator:createTableView()
	local container = self._main:getChildByName("container")
	local tableView = cc.TableView:create(container:getContentSize())

	local function scrollViewDidScroll(view)
	end

	local function scrollViewDidZoom(view)
	end

	local function tableCellTouch(table, cell)
	end

	local function cellSizeForTable(table, idx)
		return 477, 176
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
		return math.ceil(#self._herosList / 3)
	end

	tableView:setPosition(0, 0)
	tableView:setAnchorPoint(0, 0)
	tableView:setDelegate()
	tableView:setBounceable(false)
	container:addChild(tableView)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:registerScriptHandler(tableCellTouch, cc.TABLECELL_TOUCHED)
	tableView:reloadData()

	self._tableView = tableView
end

function SetBoardHeroPopMediator:updateCell(cell, index)
	cell:removeAllChildren()

	local layout = ccui.Layout:create()

	layout:setTouchEnabled(false)
	layout:setContentSize(cc.size(477, 186))
	layout:setAnchorPoint(0, 0)
	layout:addTo(cell):setName("main")

	local begin = 3 * index - 2
	local tail = 3 * index

	for i = begin, tail do
		if self._herosList[i] then
			local posTag = i - begin + 1
			local _heroCell = self._cloneCell:clone()
			local heroImg = IconFactory:createRoleIconSprite({
				stencil = 1,
				iconType = "Bust7",
				id = self._herosList[i].roleModel,
				size = cc.size(245, 336)
			})

			heroImg:setScale(0.44642857142857145)

			local heroPanel = _heroCell:getChildByName("hero")

			heroPanel:addChild(heroImg)
			heroImg:setAnchorPoint(cc.p(0.5, 0.5))
			heroImg:setPosition(heroPanel:getContentSize().width / 2, heroPanel:getContentSize().height / 2)
			_heroCell:addTo(layout)
			_heroCell:setSwallowTouches(false)
			_heroCell:setPosition(cc.p(5 + (posTag - 1) * 135, 0))
			_heroCell:setTag(i)

			local function callFunc(sender)
				local beganPos = sender:getTouchBeganPosition()
				local endPos = sender:getTouchEndPosition()

				if math.abs(beganPos.x - endPos.x) < 30 and math.abs(beganPos.y - endPos.y) < 30 then
					if self._chooseIndex == i then
						return
					end

					self._setBoardHeroId = self._herosList[i].id
					local cellIndex = math.ceil(self._chooseIndex / 3)
					local cell = self._tableView:cellAtIndex(cellIndex - 1)

					if cell then
						local heroIcon = cell:getChildByName("main"):getChildByTag(self._chooseIndex)

						heroIcon:getChildByName("selectImage"):setVisible(false)
					end

					self._chooseIndex = i

					sender:getChildByName("selectImage"):setVisible(true)
					self:dispatch(Event:new(EVT_AFKGIFT_SET_SHOWHERO, {
						heroId = self._setBoardHeroId
					}))
				end
			end

			mapButtonHandlerClick(nil, _heroCell, {
				ignoreClickAudio = true,
				func = callFunc
			})

			if self._herosList[i].id == self._setBoardHeroId then
				_heroCell:getChildByName("selectImage"):setVisible(true)
			end
		end
	end
end

function SetBoardHeroPopMediator:onClickCheckBox()
	if self._doubleClickTag then
		self:dispatch(ShowTipEvent({
			duration = 0.35,
			tip = Strings:get("HeroDynamic_Setting_Tips")
		}))
	else
		local isDynamic = self._settingModel:getRoleDynamic()

		self._settingModel:setRoleDynamic(not isDynamic)
		self:onCheckBoxChange(not isDynamic)
		self:dispatch(Event:new(EVT_AFKGIFT_SET_SHOWHERO, {
			heroId = self._setBoardHeroId
		}))

		self._doubleClickTag = true

		performWithDelay(self:getView(), function ()
			self._doubleClickTag = false
		end, 1)
	end
end

function SetBoardHeroPopMediator:onClickRandom()
	if self._doubleClickRandom then
		self:dispatch(ShowTipEvent({
			duration = 0.35,
			tip = Strings:get("MainScene_BoardHero_Random_2")
		}))
	else
		local isRandom = self._settingModel:getRoleAndBgRandom()

		self._settingModel:setRoleAndBgRandom(not isRandom)
		self:onRandomBoxChange(not isRandom)
		self:dispatch(Event:new(EVT_AFKGIFT_SET_SHOWHERO, {
			heroId = self._setBoardHeroId
		}))

		self._doubleClickRandom = true

		performWithDelay(self:getView(), function ()
			self._doubleClickRandom = false
		end, 1)
	end
end

function SetBoardHeroPopMediator:onCheckBoxChange(isDynamic)
	local slider = self._checkBox:getChildByName("slide")
	local text1 = self._checkBox:getChildByName("test1")
	local text2 = self._checkBox:getChildByName("test2")

	if isDynamic then
		slider:setPositionX(58.7)
		text2:setTextColor(cc.c3b(202, 245, 53))
		text1:setTextColor(cc.c3b(193, 193, 193))
	else
		slider:setPositionX(18.41)
		text1:setTextColor(cc.c3b(202, 245, 53))
		text2:setTextColor(cc.c3b(193, 193, 193))
	end
end

function SetBoardHeroPopMediator:onRandomBoxChange(isRandom)
	local darkImage = self._randomBox:getChildByName("Image_Dark")
	local lightImage = self._randomBox:getChildByName("Image_Light")

	darkImage:setVisible(not isRandom)
	lightImage:setVisible(isRandom)
end
