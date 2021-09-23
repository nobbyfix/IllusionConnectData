ActivitySagaSupportRankRewardMediator = class("ActivitySagaSupportRankRewardMediator", DmPopupViewMediator, _M)

ActivitySagaSupportRankRewardMediator:has("_rankSystem", {
	is = "rw"
}):injectWith("RankSystem")
ActivitySagaSupportRankRewardMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")

local kBtnHandlers = {}
local kCellHeight = 48

function ActivitySagaSupportRankRewardMediator:initialize()
	super.initialize(self)
end

function ActivitySagaSupportRankRewardMediator:dispose()
	super.dispose(self)
end

function ActivitySagaSupportRankRewardMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._main = self:getView():getChildByName("main")

	self:bindWidget("main.baseNode.bgNode", PopupNormalWidget, {
		ignoreTitleNodeBg = true,
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickBack, self)
		},
		title = Strings:get("Activity_Saga_SupportList_6"),
		title1 = Strings:get("Activity_Saga_SupportList_6_en"),
		bgSize = {
			width = 1147,
			height = 617
		},
		targetImg = {
			Res = "asset/scene/hd_bg_zhld_yyb_1.jpg",
			Type = ccui.TextureResType.localType,
			Size = {
				width = 1086,
				height = 590
			}
		}
	})

	self.baseNode = self._main:getChildByFullName("baseNode")
	self.Image_roleL = self.baseNode:getChildByFullName("Image_roleL")
	self.Image_roleR = self.baseNode:getChildByFullName("Image_roleR")
	self.listview1 = self._main:getChildByFullName("listview1")
	self.listview2 = self._main:getChildByFullName("listview2")

	self.listview1:setVisible(false)
	self.listview2:setVisible(false)

	self.notHaveInfo1 = self._main:getChildByFullName("notHaveInfo1")
	self.notHaveInfo2 = self._main:getChildByFullName("notHaveInfo2")

	self.notHaveInfo1:setString(Strings:get("Activity_Saga_SupportList_7"))
	self.notHaveInfo2:setString(Strings:get("Activity_Saga_SupportList_7"))
	self.notHaveInfo1:setVisible(false)
	self.notHaveInfo2:setVisible(false)

	self._cloneCell = self:getView():getChildByFullName("playerInfoModel")

	self._cloneCell:setVisible(false)
end

function ActivitySagaSupportRankRewardMediator:enterWithData(data)
	self._periodId = data.periodId
	self._activityId = data.activityId or ActivityId.kActivityBlockZuoHe
	self._activity = self._activitySystem:getActivityById(self._activityId)
	self._curPeriod = self._activity:getSupportCurPeriodData(self._periodId)
	self.viewNum = 1
	local heros = self._curPeriod.data.heros
	self.subIds = {}

	for heroId, idx in pairs(heros) do
		self["heroIdForNet" .. idx] = heroId
		local imgNode = self.baseNode:getChildByFullName("Image_role" .. idx)
		local hd = self._activity:getHeroDataById(heroId)

		dump(hd)

		local modelId = hd.ModelId
		local img, jsonPath = IconFactory:createRoleIconSpriteNew({
			useAnim = true,
			frameId = "bustframe9",
			id = modelId
		})

		img:addTo(imgNode):posite(50, 0)
		img:setScale(0.7)

		local RankIcon = ConfigReader:requireRecordById("RoleModel", modelId).RankIcon
		local nameImgNode = self.baseNode:getChildByFullName("listNameImg_" .. idx)

		nameImgNode:loadTexture(hd.RankIcon .. ".png", ccui.TextureResType.plistType)

		self.subIds[idx] = self._curPeriod.data.periodId .. "_" .. hd.Id
	end

	self:getSubsboard(self.subIds)
end

function ActivitySagaSupportRankRewardMediator:getIdx(RankIdx)
	for k, v in pairs(self.subIds) do
		if v == RankIdx then
			return k
		end
	end
end

function ActivitySagaSupportRankRewardMediator:getSubsboard(subIds)
	self.tableViewData1 = {}
	self.tableViewData2 = {}

	local function callback(response)
		for RankIdx, v in pairs(response.data) do
			local idx = self:getIdx(RankIdx)

			if idx and v.pr then
				local myRank = self._main:getChildByFullName("myRank" .. idx)

				if v.pr.rank > 0 then
					myRank:setString(v.pr.rank)
				else
					myRank:setString("")
				end

				local myName = self._main:getChildByFullName("myName" .. idx)

				myName:setString(v.pr.nickname)

				local myScore = self._main:getChildByFullName("myScore" .. idx)

				myScore:setString(v.pr.value)
			end

			if idx and v.lb then
				self["notHaveInfo" .. idx]:setVisible(#v.lb == 0)

				self["tableViewData" .. idx] = v.lb

				self:createTableView(idx)
			end
		end
	end

	self._rankSystem:cleanUpRankListByType(RankType.kSupport)

	local sendData = {
		rankStart = 1,
		type = RankType.kSupport,
		subIds = subIds,
		rankEnd = self:getRankSystem():getRequestRankCountPerTime()
	}

	self._rankSystem:requestSupportRankRewardData(sendData, callback)
end

function ActivitySagaSupportRankRewardMediator:createTableView(dataIdx)
	local modolListview = self["listview" .. dataIdx]
	local tableView = cc.TableView:create(modolListview:getContentSize())
	local size = self._cloneCell:getContentSize()
	self["tableView" .. dataIdx] = tableView

	local function scrollViewDidScroll(table)
		if table:isTouchMoved() then
			self:touchForTableView(self["tableView" .. dataIdx], dataIdx)
		end
	end

	local function numberOfCells(view)
		return #self["tableViewData" .. dataIdx]
	end

	local function cellTouched(table, cell)
	end

	local function cellSize(table, idx)
		return size.width, size.height + 3
	end

	local function cellAtIndex(table, idx)
		local index = idx + 1
		local cell = table:dequeueCell()

		if not cell then
			cell = cc.TableViewCell:new()
			local cloneCell = self._cloneCell:clone()

			cloneCell:setVisible(true)
			cloneCell:addTo(cell):setName("cloneCell")
			cloneCell:setPosition(cc.p(0, 0))
		end

		self:updataCell(cell, index, self["tableViewData" .. dataIdx])

		return cell
	end

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setDelegate()
	tableView:setAnchorPoint(cc.p(0.5, 0.5))
	tableView:setPosition(cc.p(modolListview:getPosition()))
	tableView:registerScriptHandler(numberOfCells, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellTouched, cc.TABLECELL_TOUCHED)
	tableView:registerScriptHandler(cellSize, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(cellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
	tableView:addTo(modolListview:getParent())
	tableView:reloadData()
	tableView:setBounceable(true)
end

function ActivitySagaSupportRankRewardMediator:touchForTableView(curTableView, idx)
	if self["_isAskingRank" .. idx] then
		return
	end

	local kMinRefreshHeight = 1
	local viewHeight = curTableView:getViewSize().height
	local contentHeight = curTableView:getContentSize().height
	local sureRequest = false
	local offsetY = curTableView:getContentOffset().y

	if kMinRefreshHeight < offsetY and viewHeight < contentHeight and #self["tableViewData" .. idx] < self._rankSystem:getMaxRank() then
		sureRequest = true
	end

	if sureRequest then
		self["_isAskingRank" .. idx] = true
		self["_requestNextCount" .. idx] = #self["tableViewData" .. idx]

		self:doRequestNextRank(idx)

		return
	end
end

function ActivitySagaSupportRankRewardMediator:doRequestBeforeRank(idx, endPos)
	local function onRequestRankDataSucc(response)
		local data = response.data[self.subIds[idx]]

		if #data.lb == 0 then
			self["_requestNextCount" .. idx] = nil
			self["_isAskingRank" .. idx] = false

			return
		end

		for k, v in pairs(data.lb) do
			self["tableViewData" .. idx][v.rank] = v
		end

		self:refreshView(idx, data, true)
	end

	local rankStart = endPos - self:getRankSystem():getRequestRankCountPerTime()
	rankStart = math.max(rankStart, 1)
	local rankEnd = endPos
	local subIds = {
		self._curPeriod.data.periodId .. "_" .. self["heroIdForNet" .. idx]
	}
	local sendData = {
		type = RankType.kSupport,
		subIds = subIds,
		rankStart = rankStart,
		rankEnd = rankEnd
	}

	self._rankSystem:requestSupportRankRewardData(sendData, onRequestRankDataSucc)
end

function ActivitySagaSupportRankRewardMediator:doRequestNextRank(idx)
	local currentTab = self._curTabType
	local dataEnough = self:getRankSystem():isServerDataEnough(RankType.kSupport)

	if dataEnough == true then
		local function onRequestRankDataSucc(response)
			local data = response.data[self.subIds[idx]]

			if #data.lb == 0 then
				self["_requestNextCount" .. idx] = nil
				self["_isAskingRank" .. idx] = false

				return
			end

			for k, v in pairs(data.lb) do
				self["tableViewData" .. idx][v.rank] = v
			end

			self:refreshView(idx, data)
		end

		local rankStart = #self["tableViewData" .. idx] + 1
		rankStart = math.max(rankStart, 1)
		local rankEnd = rankStart + self._rankSystem:getRequestRankCountPerTime()
		local subIds = {
			self._curPeriod.data.periodId .. "_" .. self["heroIdForNet" .. idx]
		}
		local sendData = {
			type = RankType.kSupport,
			subIds = subIds,
			rankStart = rankStart,
			rankEnd = rankEnd
		}

		self._rankSystem:requestSupportRankRewardData(sendData, onRequestRankDataSucc)
	end
end

function ActivitySagaSupportRankRewardMediator:refreshView(idx, v, isBefore)
	if v.pr then
		local myRank = self._main:getChildByFullName("myRank" .. idx)

		if v.pr.rank > 0 then
			myRank:setString(v.pr.rank)
		else
			myRank:setString("")
		end

		local myName = self._main:getChildByFullName("myName" .. idx)

		myName:setString(v.pr.nickname)

		local myScore = self._main:getChildByFullName("myScore" .. idx)

		myScore:setString(v.pr.value)
	end

	self["tableView" .. idx]:reloadData()

	if self["_requestNextCount" .. idx] and not isBefore then
		local diffCount = #self["tableViewData" .. idx] - self["_requestNextCount" .. idx]
		local offsetY = diffCount == 0 and 0 or -diffCount * kCellHeight + kCellHeight * 1.2

		self["tableView" .. idx]:setContentOffset(cc.p(0, offsetY))

		self["_requestNextCount" .. idx] = nil
		self["_isAskingRank" .. idx] = false
	end

	if isBefore then
		self["_isAskingRank" .. idx] = false
	end
end

function ActivitySagaSupportRankRewardMediator:refreshData(idx, v)
end

function ActivitySagaSupportRankRewardMediator:updataCell(cell, index, data)
	local cloneCell = cell:getChildByFullName("cloneCell")
	local data = data[index]
	local p_rank_img = cloneCell:getChildByFullName("p_rank_img")
	local p_rank_lbl = cloneCell:getChildByFullName("p_rank_lbl")

	if data.rank < 4 then
		p_rank_img:loadTexture(RankTopImage[data.rank], ccui.TextureResType.plistType)
		p_rank_lbl:setVisible(false)
		p_rank_img:setVisible(true)
	else
		p_rank_lbl:setVisible(true)
		p_rank_img:setVisible(false)
		p_rank_lbl:setString(data.rank)
	end

	local p_name = cloneCell:getChildByFullName("p_name")

	p_name:setString(data.nickname)

	local p_score = cloneCell:getChildByFullName("p_score")

	p_score:setString(data.value)

	local p_Info = cloneCell:getChildByFullName("p_Info")

	p_Info:removeAllChildren()

	local headIcon, oldIcon = IconFactory:createPlayerIcon({
		clipType = 4,
		frameStyle = 1,
		id = data.headImage,
		headFrameId = data.headFrame
	})

	headIcon:addTo(p_Info):center(p_Info:getContentSize())
	oldIcon:setScale(0.4)
	headIcon:setScale(0.45)
end

function ActivitySagaSupportRankRewardMediator:resumeWithData()
end

function ActivitySagaSupportRankRewardMediator:initData()
end

function ActivitySagaSupportRankRewardMediator:initView()
	self:initContent()
end

function ActivitySagaSupportRankRewardMediator:initContent()
	self._listView:removeAllChildren(true)

	for i = 1, #self._data do
		local panel = self._contentPanel:clone()

		panel:setVisible(true)
		self._listView:pushBackCustomItem(panel)
		self:updataCell(panel, self._data[i], i)
	end
end

function ActivitySagaSupportRankRewardMediator:onClickBack()
	self:close()
end
