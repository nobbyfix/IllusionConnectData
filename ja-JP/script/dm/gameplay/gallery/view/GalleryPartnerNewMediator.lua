GalleryPartnerNewMediator = class("GalleryPartnerNewMediator", DmAreaViewMediator, _M)

GalleryPartnerNewMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
GalleryPartnerNewMediator:has("_gallerySystem", {
	is = "r"
}):injectWith("GallerySystem")

local kBtnHandlers = {
	["main.rewardBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickReward"
	}
}
local TargetOccupation = {
	"Attack",
	"Defense",
	"Cure",
	"Aoe",
	"Summon",
	"Support",
	"Curse"
}
local SortExtendFunc = {
	{
		func = function (sortExtendType, hero)
			return hero.rareity == 17 - sortExtendType
		end
	},
	{
		func = function (sortExtendType, hero)
			return hero.type == TargetOccupation[sortExtendType - 5]
		end
	}
}
local kNums = 4
local KTabMax = 8
local kImageParty = {
	XD = {
		"gallery_img_sl_xd.png",
		"gallery_btn_normal_02_2.png",
		"gallery_btn_normal_02_1.png"
	},
	MNJH = {
		"gallery_img_sl_mnjh.png",
		"gallery_btn_normal_05_2.png",
		"gallery_btn_normal_05_1.png"
	},
	BSNCT = {
		"gallery_img_sl_bsn.png",
		"gallery_btn_normal_03_2.png",
		"gallery_btn_normal_03_1.png"
	},
	DWH = {
		"gallery_img_sl_dwh_w.png",
		"gallery_btn_normal_04_2w.png",
		"gallery_btn_normal_04_1w.png"
	},
	WNSXJ = {
		"gallery_img_sl_wnsxj.png",
		"gallery_btn_normal_01_2.png",
		"gallery_btn_normal_01_1.png"
	},
	SSZS = {
		"gallery_img_sl_smzs.png",
		"gallery_btn_normal_06_2.png",
		"gallery_btn_normal_06_1.png"
	},
	UNKNOWN = {
		"gallery_img_sl_unknown.png",
		"gallery_btn_normal_07_2.png",
		"gallery_btn_normal_07_1.png"
	},
	AllHero = {
		"",
		"gallery_btn_normal_08_2.png",
		"gallery_btn_normal_08_1.png"
	}
}
local kRarityBg = {
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"gallery_img_hblb_r.png",
	"gallery_img_hblb_r.png",
	"gallery_img_hblb_sr.png",
	"gallery_img_hblb_ssr.png",
	"gallery_img_hblb_ur.png"
}
local KselectTab = {
	KOccupation = 1,
	Krareity = 2
}

function GalleryPartnerNewMediator:initialize()
	super.initialize(self)
end

function GalleryPartnerNewMediator:dispose()
	super.dispose(self)
end

function GalleryPartnerNewMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._heroSystem = self._developSystem:getHeroSystem()

	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.refreshBySync)
	self:mapEventListener(self:getEventDispatcher(), EVT_HEROCOMPOSE_SUCC, self, self.refreshBySync)
	self:mapEventListener(self:getEventDispatcher(), EVT_GALLERY_BOX_GET_SUCC, self, self.refreshRewardRedPoint)
end

function GalleryPartnerNewMediator:enterWithData(data)
	self._main = self:getView():getChildByFullName("main")

	self:setupTopInfoWidget()
	self:setupView(data)
	self:runStartAnim()
end

function GalleryPartnerNewMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")
	local config = {
		style = 1,
		currencyInfo = {},
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		}
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function GalleryPartnerNewMediator:onClickBack(sender, eventType)
	self:dismiss()
end

function GalleryPartnerNewMediator:setupView(data)
	self:initData(data)
	self:initWidgetInfo()
	self:initBottomView()
	self:initView()
	self:refreshView(true, true)
end

function GalleryPartnerNewMediator:refreshBySync()
	self:refreshData()
	self:refreshView()
end

function GalleryPartnerNewMediator:initWidgetInfo()
	self._bonusPanel = self._main:getChildByFullName("bonusPanel")

	self._bonusPanel:setVisible(false)

	self._loveCount = self._main:getChildByFullName("loveCount")
	self._title = self._main:getChildByFullName("title")
	self._desc = self._main:getChildByFullName("desc")

	self._desc:getVirtualRenderer():setLineHeight(24)

	self._currencyNum = self._main:getChildByFullName("currencyNum")
	self._totalNum = self._main:getChildByFullName("totalNum")
	self._tableViewPanel = self._main:getChildByFullName("tableView")
	self._tabPanelDark = self._main:getChildByFullName("tabPanelDark")
	self._tabPanelLight = self._main:getChildByFullName("tabPanelLight")
	self._rewardBtn = self._main:getChildByFullName("rewardBtn")
	self._cellClone = self._main:getChildByFullName("cellClone")

	self._cellClone:setVisible(false)

	self._partyNode = self._main:getChildByFullName("partyNode")
	self._progressPanel = self._main:getChildByFullName("progressPanel")
	self._touchLayer = self:getView():getChildByFullName("touchLayer")

	self._touchLayer:setVisible(false)

	self._btnClone_1 = self:getView():getChildByFullName("btnClone_1")

	self._btnClone_1:setVisible(false)

	self._btnClone_2 = self:getView():getChildByFullName("btnClone_2")

	self._btnClone_2:setVisible(false)

	self._bottomPanel = self._main:getChildByFullName("bottomPanel")
	self._buttonNode = self._main:getChildByFullName("bottomPanel.buttonNode")

	self._cellClone:getChildByFullName("loveIcon.text"):enableOutline(cc.c4b(60, 80, 20, 127), 2)
	self._loveCount:getChildByFullName("touchPanel"):setTouchEnabled(true)
	self._loveCount:getChildByFullName("touchPanel"):addTouchEventListener(function (sender, eventType)
		self:onClickBonus(sender, eventType, self._attrData)
	end)
	self._bottomPanel:getChildByFullName("infoBtn"):setTouchEnabled(true)
	self._bottomPanel:getChildByFullName("infoBtn"):addTouchEventListener(function (sender, eventType)
		self:onClickInfoBtn(sender, eventType, self._attrData)
	end)

	self._panelSelect = self._main:getChildByFullName("Panel_select")

	self._panelSelect:setVisible(true)
	self._panelSelect:getChildByFullName("Panel_4"):setVisible(false)
	self._panelSelect:getChildByFullName("Image_9"):addClickEventListener(function ()
		self:clickSelectMenu(true)
	end)
	self._panelSelect:getChildByFullName("Panel_4.Panel_touch"):addClickEventListener(function ()
		self:clickSelectMenu(false)
	end)

	local director = cc.Director:getInstance()
	local winSize = director:getWinSize()
	self._posY_table = self._tableViewPanel:getPositionY()
end

function GalleryPartnerNewMediator:initData(data)
	self._albumType = 1
	self._tabType = data and data.tabType and data.tabType or 1
	self._albumArray = self._gallerySystem:getPartyArray()
	self._partyArray = self._albumArray[self._albumType]
	self._curPartyData = self._partyArray[self._tabType]

	self:showMenu()
	self:doLogicForShowHeros()

	self._tabCache = {}
	self._bottomTabCache = {}
	self._attrData = self._gallerySystem:getLoveAddAttr()
	self._tabSelect = {
		[self._albumType] = self._tabType
	}
	self._selectTab = false
end

function GalleryPartnerNewMediator:initView()
	local width = self._tableViewPanel:getContentSize().width

	local function scrollViewDidScroll(view)
		if DisposableObject:isDisposed(self) then
			return
		end

		self._isReturn = false
	end

	local function cellSizeForTable(table, idx)
		return width, 197
	end

	local function numberOfCellsInTableView(table)
		return math.ceil(#self._selectShowHeros / kNums)
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
		end

		self:createTeamCell(cell, idx + 1)

		return cell
	end

	local tableView = cc.TableView:create(self._tableViewPanel:getContentSize())
	self._heroView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setDelegate()
	self._tableViewPanel:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:setMaxBounceOffset(20)

	self._selectCells = {}
	local imgKind = self._panelSelect:getChildByFullName("Panel_4.Image_kind")

	imgKind:removeAllChildren()

	local kColoum = 5
	local data = self._occupationInfo
	local kRow = math.ceil(#data / kColoum)

	for i = 1, kRow do
		for j = 1, kColoum do
			local info = data[j + (i - 1) * kColoum]

			if info then
				local cell = self._btnClone_1:clone()
				cell.index = info.index

				cell:getChildByFullName("Image_light"):setVisible(info.selectState)
				cell:getChildByFullName("Image_dark"):setVisible(not info.selectState)
				cell:getChildByFullName("name"):setString(info.name)
				cell:setVisible(true)
				cell:addTo(imgKind):posite(-30 + j * 84, 140 - (i - 1) * 52)
				cell:getChildByFullName("touchPanel"):addClickEventListener(function ()
					self:clickState(cell.index)
				end)
				table.insert(self._selectCells, cell)
			end
		end
	end
end

function GalleryPartnerNewMediator:createTeamCell(cell, index)
	cell:removeAllChildren()

	local list = self._selectShowHeros

	for i = 1, kNums do
		local id = list[kNums * (index - 1) + i]

		if id then
			local panel = self._cellClone:clone()

			panel:setVisible(true)
			panel:setTag(i)
			panel:setAnchorPoint(cc.p(0.5, 0.5))

			local rarity = panel:getChildByFullName("rarity")
			local linkImage = panel:getChildByFullName("linkImage")

			if self._heroSystem:isLinkStageHero(id) then
				linkImage:setVisible(true)
			else
				linkImage:setVisible(false)
			end

			local hero = self._heroSystem:getHeroById(id)

			rarity:setVisible(not not hero)

			local roleModel = IconFactory:getRoleModelByKey("HeroBase", id)

			if hero then
				roleModel = hero:getModel()
				local heroRewards = self._gallerySystem:getHeroRewards()
				local canGet = not heroRewards[id]

				if canGet then
					local redPoint = ccui.ImageView:create(IconFactory.redPointPath1, 1)

					redPoint:addTo(panel):posite(137, 184):setScale(0.8)
				end

				local rarityBg = panel:getChildByFullName("rarityBg")

				rarityBg:loadTexture(kRarityBg[hero:getRarity()], 1)

				rarity = rarity:getChildByFullName("rarity")
				local rarityNum = hero:getRarity()

				rarity:loadTexture(GameStyle:getHeroRarityImage(rarityNum), 1)
				rarity:ignoreContentAdaptWithSize(true)
			end

			local heroPanel = panel:getChildByFullName("heroPanel")

			heroPanel:setSwallowTouches(false)
			heroPanel:addTouchEventListener(function (sender, eventType)
				self:onClickHeroIcon(sender, eventType, id)
			end)

			local heroIcon = IconFactory:createRoleIconSpriteNew({
				frameId = "bustframe7_4",
				id = roleModel
			})

			heroIcon:addTo(heroPanel)
			heroIcon:setAnchorPoint(cc.p(0.5, 0.5))
			heroIcon:setPosition(cc.p(65.5, 87.5))

			if not self._heroSystem:hasHero(id) then
				panel:setGray(true)
				panel:getChildByFullName("lockIcon"):setVisible(true)
				panel:getChildByFullName("loveIcon"):setVisible(false)
			else
				panel:getChildByFullName("lockIcon"):setVisible(false)
				panel:getChildByFullName("loveIcon"):setVisible(true)

				local hero = self._heroSystem:getHeroById(id)
				local loveNum = hero:getLoveLevel()

				panel:getChildByFullName("loveIcon.text"):setString(loveNum)
			end

			panel:addTo(cell)

			local panelWidth = panel:getContentSize().width
			local posX = panelWidth / 2 + (panelWidth - 12) * (i - 1)

			panel:setPosition(cc.p(posX - 10, 95))

			panel.id = id
			cell.panelList = cell.panelList or {}
			cell.panelList[i] = panel
		end
	end
end

function GalleryPartnerNewMediator:initBottomView()
	self._buttonNode:removeAllChildren()

	self._bottomTabCache = {}
	local cellInterval = 90
	local cellWidth = 70
	local start_x = cellWidth / 2 - 10 + math.floor(#self._partyArray / 2) * -cellInterval + 20 + #self._partyArray % 2 * -55
	local start_y = 0
	local cloneBaseNode = self._btnClone_1

	if self._albumType == 1 then
		cloneBaseNode = self._btnClone_2
		cellInterval = 74
		cellWidth = 40
		start_x = cellWidth / 2 - 22.5 + math.floor(#self._partyArray / 2) * -cellInterval + 45 + #self._partyArray % 2 * -65
		start_y = 0
	elseif self._albumType == 2 then
		cellInterval = 88
		cellWidth = 68
		start_x = -20 + cellWidth / 2 - 10 + math.floor(#self._partyArray / 2) * -cellInterval + 20 + #self._partyArray % 2 * -54
	end

	local cloneBaseNode1 = self:getView():getChildByFullName("btnClone_2_0")

	for i = 1, #self._partyArray do
		local data = self._partyArray[i]
		local btn = i == KTabMax and cloneBaseNode1:clone() or cloneBaseNode:clone()

		btn:setVisible(true)
		btn:addTo(self._buttonNode):posite(0, start_y - (i - 1) * cellInterval)

		local redPoint = btn:getChildByFullName("redPoint")
		local touchPanel = btn:getChildByFullName("touchPanel")

		touchPanel:addClickEventListener(function ()
			self:onClickBottomTab(i)
		end)

		local darkImg = btn:getChildByFullName("Image_dark")
		local lightImg = btn:getChildByFullName("Image_light")

		lightImg:loadTexture(kImageParty[data:getPartyId()][2], ccui.TextureResType.plistType)
		darkImg:loadTexture(kImageParty[data:getPartyId()][3], ccui.TextureResType.plistType)

		if not self._bottomTabCache[i] then
			self._bottomTabCache[i] = {
				lightImg,
				darkImg,
				redPoint
			}
		end
	end
end

function GalleryPartnerNewMediator:refreshData(changeAlbumType)
	if changeAlbumType then
		self._albumArray = self._gallerySystem:getPartyArray()
		self._partyArray = self._albumArray[self._albumType]
	end

	self._curPartyData = self._partyArray[self._tabType] or self._partyArray[kNums - 1]

	self:doLogicForShowHeros()

	self._attrData = self._gallerySystem:getLoveAddAttr()
end

function GalleryPartnerNewMediator:refreshView(hideReload, changeAlbumType)
	self:refreshBottomView()
	self:refreshBottomTabStatus()
	self:refreshRewardRedPoint()

	if not hideReload then
		self._heroView:stopScroll()
		self._heroView:reloadData()
	end

	self._title:setString(self._curPartyData:getTitle())
	self._desc:setString(self._curPartyData:getDesc())

	local curNum, totalNum = self._gallerySystem:getCurNums(self._showHeros)

	self._currencyNum:setString(curNum)
	self._totalNum:setString("/" .. totalNum)
	self._partyNode:removeAllChildren()

	if kImageParty[self._curPartyData:getPartyId()] and kImageParty[self._curPartyData:getPartyId()][1] ~= "" then
		local img = kImageParty[self._curPartyData:getPartyId()][1]
		local img_party = ccui.ImageView:create(kImageParty[self._curPartyData:getPartyId()][1], ccui.TextureResType.plistType)

		img_party:setAnchorPoint(cc.p(0.5, 0.5))
		img_party:addTo(self._partyNode)
	end

	local label = self._loveCount:getChildByName("loveNum")
	local loveLevel = self._gallerySystem:getTotalLoveLevel()

	label:setString(loveLevel)
end

function GalleryPartnerNewMediator:refreshBottomView()
	self._redPointTab = {}

	for i = 1, #self._partyArray do
		local data = self._partyArray[i]
		local redPoint = self._bottomTabCache[i][3]

		if i == KTabMax then
			local r = table.indexof(self._redPointTab, true)

			redPoint:setVisible(r ~= nil)
		else
			local canGain = self._gallerySystem:checkcanReceive(data:getPartyId())
			canGain = canGain or self._gallerySystem:checkCanGetHeroReward(data:getPartyId())

			table.insert(self._redPointTab, canGain)
			redPoint:setVisible(canGain)
		end
	end
end

function GalleryPartnerNewMediator:refreshBottomTabStatus()
	for i = 1, #self._bottomTabCache do
		self._bottomTabCache[i][1]:setVisible(self._tabType == i)

		if self._bottomTabCache[i][2] then
			self._bottomTabCache[i][2]:setVisible(self._tabType ~= i)
		end
	end

	local colectText = self._bottomPanel:getChildByFullName("colectText")
	local currentScoreText = self._bottomPanel:getChildByFullName("currentScoreText")
	local targetScoreText = self._bottomPanel:getChildByFullName("targetScoreText")
	local loadingNode = self._bottomPanel:getChildByFullName("loadingNode")
	local loadingBar = loadingNode:getChildByName("loading")
	local allCountHero = 0
	local currentCountHero = 0

	for i = 1, #self._showHeros do
		local id = self._showHeros[i]

		if self._heroSystem:isLinkStageHero(id) == false then
			allCountHero = allCountHero + 1

			if self._heroSystem:hasHero(id) then
				currentCountHero = currentCountHero + 1
			end
		end
	end

	if allCountHero ~= 0 then
		loadingNode:setVisible(true)
		colectText:setVisible(true)
		currentScoreText:setVisible(true)
		targetScoreText:setVisible(true)

		local rate = currentCountHero / allCountHero

		colectText:setString(Strings:get("NewAlbum_UI01", {
			percent = string.format("%.1f", rate * 100)
		}) .. "%")
		currentScoreText:setString("" .. currentCountHero)
		targetScoreText:setString("/" .. allCountHero)
		loadingBar:setPercent(rate * 100)
	else
		loadingNode:setVisible(false)
		colectText:setVisible(false)
		currentScoreText:setVisible(false)
		targetScoreText:setVisible(false)
	end
end

function GalleryPartnerNewMediator:refreshRewardRedPoint()
	local canReceive, hasReward = self._gallerySystem:canRevieveReward(self._curPartyData:getPartyId())

	self._rewardBtn:getChildByFullName("redMark"):setVisible(canReceive)
	self._rewardBtn:setVisible(hasReward)
end

function GalleryPartnerNewMediator:clickSelectMenu(vis)
	local panel = self._panelSelect:getChildByFullName("Panel_4")

	panel:setVisible(vis)
end

function GalleryPartnerNewMediator:resetSelectMenu()
	for i, v in ipairs(self._occupationInfo) do
		v.selectState = false
	end

	for i, cell in ipairs(self._selectCells) do
		cell.selectState = self._occupationInfo[i].selectState

		cell:getChildByFullName("Image_light"):setVisible(cell.selectState)
		cell:getChildByFullName("Image_dark"):setVisible(not cell.selectState)
	end
end

function GalleryPartnerNewMediator:showMenu()
	if not self._occupationInfo then
		self._occupationInfo = {}
		local index = 1
		local info = {
			name = Strings:get("bag_UI1"),
			selectState = false,
			index = index,
			config = nil
		}
		self._occupationInfo[index] = info
		index = index + 1

		for i, v in ipairs(self._albumArray[3]) do
			local info = {
				name = v:getPartyId(),
				selectState = false,
				index = index,
				config = v
			}
			self._occupationInfo[index] = info
			index = index + 1
		end

		for i, v in ipairs(self._albumArray[2]) do
			local info = {
				name = Strings:get(GameStyle:getHeroOccupation(v:getPartyId())),
				selectState = false,
				index = index,
				config = v
			}
			self._occupationInfo[index] = info
			index = index + 1
		end
	end
end

function GalleryPartnerNewMediator:clickState(index)
	local data = self._occupationInfo
	data[index].selectState = not data[index].selectState

	if index == 1 and data[index].selectState then
		for i = 2, #self._occupationInfo do
			self._occupationInfo[i].selectState = false
		end
	elseif index ~= 1 and data[index].selectState then
		self._occupationInfo[1].selectState = false
	end

	for i, cell in ipairs(self._selectCells) do
		cell.selectState = self._occupationInfo[i].selectState

		cell:getChildByFullName("Image_light"):setVisible(cell.selectState)
		cell:getChildByFullName("Image_dark"):setVisible(not cell.selectState)
	end

	self:doLogicForShowHeros()
	self._heroView:stopScroll()
	self._heroView:reloadData()
end

function GalleryPartnerNewMediator:onClickHeroIcon(sender, eventType, id)
	if eventType == ccui.TouchEventType.began then
		local parent = sender:getParent()
		self._isReturn = true
		local scale1 = cc.ScaleTo:create(0.1, 0.9)

		parent:runAction(scale1)
	elseif eventType == ccui.TouchEventType.ended then
		local parent = sender:getParent()

		if self._isReturn then
			AudioEngine:getInstance():playEffect("Se_Click_Select_1", false)
			self._touchLayer:setVisible(true)

			local scale3 = cc.ScaleTo:create(0.12, 1)
			local callfunc = cc.CallFunc:create(function ()
				local view = self:getInjector():getInstance("GalleryPartnerInfoNewView")

				self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
					id = id,
					ids = self._showHeros
				}))

				self._isReturn = true

				self._touchLayer:setVisible(false)
			end)
			local seq = cc.Sequence:create(scale3, callfunc)

			parent:runAction(seq)
		else
			parent:stopAllActions()
			parent:setScale(1)
		end
	elseif eventType == ccui.TouchEventType.canceled then
		local parent = sender:getParent()

		parent:stopAllActions()
		parent:setScale(1)
	end
end

function GalleryPartnerNewMediator:onClickReward()
	local view = self:getInjector():getInstance("GalleryPartnerRewardView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		rewardIds = self._curPartyData:getRewardIds(),
		partyType = self._curPartyData:getPartyId(),
		tabType = self._tabType
	}, nil))
end

function GalleryPartnerNewMediator:onClickTab(index)
	AudioEngine:getInstance():playEffect("Se_Click_Tab_Carera", false)

	self._tabSelect[self._albumType] = self._tabType
	self._albumType = index

	if self._tabSelect[self._albumType] then
		self._tabType = self._tabSelect[self._albumType]
	else
		self._tabType = 1
	end

	self:refreshData(true)
	self:refreshView(nil, true)
end

function GalleryPartnerNewMediator:onClickBottomTab(index)
	if self._tabType == index then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Tab_Carera", false)

	self._tabType = index

	self:resetSelectMenu()
	self:refreshData()
	self:refreshView()
end

function GalleryPartnerNewMediator:onClickBonus(sender, eventType, data)
	if eventType == ccui.TouchEventType.began then
		AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)

		local targetPos = sender:getParent():convertToWorldSpace(cc.p(sender:getPosition()))

		self._bonusPanel:setPositionX(self._bonusPanel:getParent():convertToNodeSpace(targetPos).x)
		self._bonusPanel:setVisible(true)

		local height = self:refreshInnerAttrPanel(data)

		self._bonusPanel:setPositionY(self._bonusPanel:getParent():convertToNodeSpace(targetPos).y + 30 + height)
	elseif eventType == ccui.TouchEventType.canceled or eventType == ccui.TouchEventType.ended then
		self._bonusPanel:setVisible(false)
	end
end

function GalleryPartnerNewMediator:refreshInnerAttrPanel(data)
	local list = data

	if #list == 0 then
		self._bonusPanel:setVisible(false)

		return
	end

	local textLabel = self._bonusPanel:getChildByName("text")

	textLabel:setVisible(false)

	local width = 0
	local height = 23
	local posY = 175

	self._bonusPanel:getChildByName("panel"):removeAllChildren()

	for i = 1, #list do
		local text = textLabel:clone()

		text:setVisible(true)
		text:addTo(self._bonusPanel:getChildByName("panel"))
		text:setTag(12138)
		text:setString(list[i])
		text:setPositionY(posY - (i - 1) * 30)

		width = math.max(width, text:getContentSize().width)
		height = height + 30
	end

	self._bonusPanel:getChildByName("imageBg"):setContentSize(cc.size(width + 40, height))

	return height
end

function GalleryPartnerNewMediator:runStartAnim()
	self._main:stopAllActions()
	self._tableViewPanel:stopAllActions()
	self._main:setPosition(cc.p(1380, -404))
	self._main:setRotation(-15)

	local rotate = cc.RotateTo:create(0.3, 0)
	local moveto1 = cc.MoveTo:create(0.2, cc.p(500, 320))
	local moveto2 = cc.MoveTo:create(0.1, cc.p(568, 320))
	local seq = cc.Sequence:create(moveto1, moveto2)
	local spawn = cc.Spawn:create(rotate, seq)

	self._main:runAction(spawn)
	self._tableViewPanel:setOpacity(0)
	self._loveCount:setOpacity(0)
	self._panelSelect:setOpacity(0)
	self._tableViewPanel:setPosition(cc.p(550, self._posY_table + 30))

	local delay = cc.DelayTime:create(0.4)
	local moveto = cc.MoveTo:create(0.3, cc.p(550, self._posY_table))
	local fadeIn = cc.FadeIn:create(0.2)
	local callback = cc.CallFunc:create(function ()
		self._heroView:reloadData()
		self._loveCount:fadeIn({
			time = 0.2
		})
		self._panelSelect:fadeIn({
			time = 0.2
		})
	end)
	spawn = cc.Spawn:create(moveto, fadeIn, callback)
	local endCallFunc = cc.CallFunc:create(function ()
		self:setupClickEnvs()
	end)
	seq = cc.Sequence:create(delay, spawn, endCallFunc)

	self._tableViewPanel:runAction(seq)
end

function GalleryPartnerNewMediator:setupClickEnvs()
	if GameConfigs.closeGuide then
		return
	end

	local storyDirector = self:getInjector():getInstance(story.StoryDirector)
	local cellOne = self._heroView:cellAtIndex(0)

	if cellOne then
		local panelList = cellOne.panelList

		if panelList and panelList[1] then
			local firstPanel = panelList[1]
			local firstPanelId = panelList[1].id

			storyDirector:setClickEnv("GalleryPartnerNewMediator.firstPanel", firstPanel, function (sender, eventType)
				self:onClickHeroIcon(sender, ccui.TouchEventType.began, firstPanelId)
				self:onClickHeroIcon(sender, ccui.TouchEventType.ended, firstPanelId)
			end)
		end
	end

	storyDirector:notifyWaiting("enter_GalleryPartnerNewMediator")
end

function GalleryPartnerNewMediator:onClickInfoBtn(sender, eventType)
	if eventType == ccui.TouchEventType.began then
		AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)

		local targetPos = sender:getParent():convertToWorldSpace(cc.p(sender:getPosition()))

		self._bonusPanel:setPositionX(self._bonusPanel:getParent():convertToNodeSpace(targetPos).x)
		self._bonusPanel:setVisible(true)

		local height = self:refreshInnerAttrPanel({
			Strings:get("NewAlbum_UI04")
		})

		self._bonusPanel:setPositionY(self._bonusPanel:getParent():convertToNodeSpace(targetPos).y + 30 + height)
	elseif eventType == ccui.TouchEventType.canceled or eventType == ccui.TouchEventType.ended then
		self._bonusPanel:setVisible(false)
	end
end

function GalleryPartnerNewMediator:doLogicForShowHeros()
	self._showHeros = {}
	local showHeroIds = self._curPartyData:getHeroIds()

	for i = 1, #showHeroIds do
		self._showHeros[#self._showHeros + 1] = showHeroIds[i]
	end

	self._selectShowHeros = {}
	local sub1 = {}

	for i = 2, 5 do
		if self._occupationInfo[i].selectState then
			table.insert(sub1, self._occupationInfo[i].index)
		end
	end

	local sub2 = {}

	for i = 6, 12 do
		if self._occupationInfo[i].selectState then
			table.insert(sub2, self._occupationInfo[i].index)
		end
	end

	if self._occupationInfo[1].selectState then
		self._selectShowHeros = self._showHeros
	else
		local retList = {}

		if next(sub1) then
			for i, hero in pairs(self._showHeros) do
				for i, sort in ipairs(sub1) do
					local h = self._heroSystem:getHeroInfoById(hero)

					if SortExtendFunc[1].func(sort, h) then
						table.insert(retList, hero)

						break
					end
				end
			end

			self._selectShowHeros = retList
		else
			self._selectShowHeros = self._showHeros
		end

		if next(sub2) then
			local retList2 = {}

			for i, hero in pairs(self._selectShowHeros) do
				for i, sort in ipairs(sub2) do
					local h = self._heroSystem:getHeroInfoById(hero)

					if SortExtendFunc[2].func(sort, h) then
						table.insert(retList2, hero)

						break
					end
				end
			end

			self._selectShowHeros = retList2
		end
	end
end
