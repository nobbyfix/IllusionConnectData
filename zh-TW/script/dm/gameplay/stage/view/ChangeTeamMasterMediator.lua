ChangeTeamMasterMediator = class("ChangeTeamMasterMediator", DmPopupViewMediator, _M)

function ChangeTeamMasterMediator:initialize()
	super.initialize(self)
end

function ChangeTeamMasterMediator:dispose()
	self._viewClose = true

	super.dispose(self)
end

function ChangeTeamMasterMediator:onRemove()
	super.onRemove(self)
end

function ChangeTeamMasterMediator:onRegister()
	super.onRegister(self)

	self._main = self:getView():getChildByName("main")
	self._listPanel = self._main:getChildByName("masterList")
	self._masterClone = self._main:getChildByName("heroPanel")

	self._masterClone:setVisible(false)
	self._masterClone:setTouchEnabled(false)

	local bgNode = self._main:getChildByFullName("bgNode")
	local tempNode = bindWidget(self, bgNode, PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onTouchMaskLayer, self)
		},
		title = Strings:get("Stage_Team_MasterSwitch"),
		title1 = Strings:get("UITitle_EN_Zhujueqiehuan"),
		bgSize = {
			width = 837,
			height = 504
		}
	})
end

function ChangeTeamMasterMediator:enterWithData(data)
	self._curMasterId = data.masterId
	self._masterList = data.masterList

	self:initView()
end

function ChangeTeamMasterMediator:initView()
	local cellWidth = self._masterClone:getContentSize().width
	local cellHeight = self._masterClone:getContentSize().height

	local function cellSizeForTable(table, idx)
		if idx == 0 then
			return cellWidth - 10, cellHeight
		elseif idx + 1 == #self._masterList then
			return cellWidth + 10, cellHeight
		end

		return cellWidth - 20, cellHeight
	end

	local function numberOfCellsInTableView(table)
		return #self._masterList
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
		end

		self:createMaster(cell, idx + 1)

		return cell
	end

	local tableView = cc.TableView:create(self._listPanel:getContentSize())

	tableView:setTag(1234)

	self._masterView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setDelegate()
	self._listPanel:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:setMaxBounceOffset(20)
	tableView:reloadData()
end

function ChangeTeamMasterMediator:createMaster(cell, index)
	cell:removeAllChildren()

	local data = self._masterList[index]
	local layer = self._masterClone:clone()
	local recommendPanel = layer:getChildByName("recommendPanel")

	recommendPanel:setLocalZOrder(10)
	recommendPanel:setVisible(false)
	layer:setVisible(true)
	layer:addTo(cell)
	layer:setPosition(cc.p(0, 0))

	if index == 1 then
		layer:setPosition(cc.p(10, 0))
	end

	layer:getChildByName("selected"):setVisible(self._curMasterId == data:getId())

	local info = {
		stencil = 1,
		iconType = "Bust1",
		id = data:getModel(),
		size = cc.size(155, 319)
	}
	local rolePic = IconFactory:createRoleIconSprite(info)

	if rolePic then
		rolePic:addTo(layer)
		rolePic:setPosition(layer:getChildByName("bg"):getPosition())
		layer:getChildByName("touchLayer"):setTouchEnabled(not data:getIsLock())
		layer:getChildByName("touchLayer"):setSwallowTouches(false)
		layer:getChildByName("touchLayer"):addClickEventListener(function ()
			self:onTouchChooseView(data)
		end)

		local color = data:getIsLock() and cc.c3b(195, 195, 195) or cc.c3b(255, 255, 255)

		layer:setColor(color)
	end
end

function ChangeTeamMasterMediator:onTouchChooseView(data)
	if data:getIsLock() then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Stage_Team_UI18")
		}))

		return
	end

	self._curMasterId = data:getId()

	AudioEngine:getInstance():playEffect("Se_Click_Tab_1", false)
	self:dispatch(ShowTipEvent({
		tip = Strings:get("Stage_Team_UI19")
	}))

	local offsetX = self._masterView:getContentOffset().x

	self._masterView:reloadData()
	self._masterView:setContentOffset(cc.p(offsetX, 0))
end

function ChangeTeamMasterMediator:onTouchMaskLayer()
	self:dispatch(Event:new(EVT_TEAM_CHANGE_MASTER, {
		masterId = self._curMasterId
	}))
	AudioEngine:getInstance():playEffect("Se_Click_Close_2", false)
	self:dispatch(ShowTipEvent({
		tip = Strings:get("Stage_Team_UI20")
	}))
	self:close()
end
