GalleryPartnerMediator = class("GalleryPartnerMediator", DmAreaViewMediator, _M)

GalleryPartnerMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
GalleryPartnerMediator:has("_gallerySystem", {
	is = "r"
}):injectWith("GallerySystem")

local kBtnHandlers = {
	["main.rewardBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickReward"
	}
}
local kNums = 4
local kImageDi = {
	"album_bg_tab_1_0.png",
	"album_bg_tab_2_0.png",
	"album_bg_tab_3_0.png",
	"album_bg_tab_4_0.png",
	"album_bg_tab_5_0.png",
	"album_bg_tab_6_0.png"
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
	"asset/ui/gallery/album_bg_archives_txd_r.png",
	"asset/ui/gallery/album_bg_archives_txd_r.png",
	"asset/ui/gallery/album_bg_archives_txd_sr.png",
	"asset/ui/gallery/album_bg_archives_txd_ssr.png",
	"asset/ui/gallery/album_bg_archives_txd_ssr.png"
}

function GalleryPartnerMediator:initialize()
	super.initialize(self)
end

function GalleryPartnerMediator:dispose()
	super.dispose(self)
end

function GalleryPartnerMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._heroSystem = self._developSystem:getHeroSystem()

	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.refreshBySync)
	self:mapEventListener(self:getEventDispatcher(), EVT_HEROCOMPOSE_SUCC, self, self.refreshBySync)
	self:mapEventListener(self:getEventDispatcher(), EVT_GALLERY_BOX_GET_SUCC, self, self.refreshRewardRedPoint)
end

function GalleryPartnerMediator:setupView(data)
	self:initData(data)
	self:initWidgetInfo()
	self:initView()
	self:refreshView(true)
end

function GalleryPartnerMediator:refreshBySync()
	self:refreshData()
	self:refreshView()
end

function GalleryPartnerMediator:initWidgetInfo()
	self._main = self:getView():getChildByFullName("main")
	self._bonusPanel = self:getView():getChildByFullName("bonusPanel")

	self._bonusPanel:setVisible(false)

	self._loveCount = self._main:getChildByFullName("loveCount")
	self._title = self._main:getChildByFullName("title")
	self._desc = self._main:getChildByFullName("desc")
	self._currencyNum = self._main:getChildByFullName("currencyNum")
	self._totalNum = self._main:getChildByFullName("totalNum")
	self._tableViewPanel = self._main:getChildByFullName("tableView")
	self._tabPanelDark = self._main:getChildByFullName("tabPanelDark")
	self._tabPanelLight = self._main:getChildByFullName("tabPanelLight")
	self._rewardBtn = self._main:getChildByFullName("rewardBtn")
	self._cellClone = self._main:getChildByFullName("cellClone")

	self._cellClone:setVisible(false)

	self._imageDi = self._main:getChildByFullName("bg.image")
	self._progressPanel = self._main:getChildByFullName("progressPanel")
	self._touchLayer = self:getView():getChildByFullName("touchLayer")

	self._touchLayer:setVisible(false)
	self._cellClone:getChildByFullName("loveIcon.text"):enableOutline(cc.c4b(60, 80, 20, 127), 2)
	self._loveCount:setTouchEnabled(true)
	self._loveCount:addTouchEventListener(function (sender, eventType)
		self:onClickBonus(sender, eventType, self._attrData)
	end)

	self._slider = self._progressPanel:getChildByFullName("slider")

	self._slider:addEventListener(function (sender, eventType)
		if eventType == ccui.SliderEventType.percentChanged then
			self:onSliderChanged()
		end
	end)
end

function GalleryPartnerMediator:initData(data)
	self._tabType = data and data.tabType and data.tabType or 1
	self._partyArray = self._gallerySystem:getPartyArray()
	self._curPartyData = self._partyArray[self._tabType]
	self._showHeros = self._curPartyData:getHeroIds()
	self._tabCache = {}
	self._attrData = self._gallerySystem:getLoveAddAttr()
end

function GalleryPartnerMediator:initView()
	for i = 1, #self._partyArray do
		local tabBtn = self._tabPanelLight:getChildByFullName("btn_" .. i)

		tabBtn:addClickEventListener(function ()
			self:onClickTab(i)
		end)

		local darkImg = self._tabPanelDark:getChildByFullName("tab_" .. i)
		local lightImg = self._tabPanelLight:getChildByFullName("tab_" .. i)

		if not self._tabCache[i] then
			self._tabCache[i] = {
				darkImg,
				lightImg
			}
		end
	end

	self:refreshTabStatus()

	local width = self._tableViewPanel:getContentSize().width

	local function scrollViewDidScroll(view)
		if DisposableObject:isDisposed(self) then
			return
		end

		self._isReturn = false
		local offY = view:getContentOffset().y
		local maxOffset = view:minContainerOffset().y
		local percent = math.abs(offY / maxOffset)

		self._slider:setPercent((1 - percent) * 100)
	end

	local function cellSizeForTable(table, idx)
		return width, 197
	end

	local function numberOfCellsInTableView(table)
		return math.ceil(#self._showHeros / kNums)
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
end

function GalleryPartnerMediator:createTeamCell(cell, index)
	cell:removeAllChildren()

	local list = self._showHeros

	for i = 1, kNums do
		local id = list[kNums * (index - 1) + i]

		if id then
			local panel = self._cellClone:clone()

			panel:setVisible(true)
			panel:setTag(i)
			panel:setAnchorPoint(cc.p(0.5, 0.5))

			local rarity = panel:getChildByFullName("rarity")
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

				rarityBg:loadTexture(kRarityBg[hero:getRarity()])

				rarity = rarity:getChildByFullName("rarity")
				local rarityNum = hero:getRarity()

				rarity:loadTexture(GameStyle:getHeroRarityImage(rarityNum), 1)
				rarity:ignoreContentAdaptWithSize(true)
			end

			local heroPanel = panel:getChildByFullName("heroPanel")

			heroPanel:setScale(1)
			heroPanel:setSwallowTouches(false)
			heroPanel:addTouchEventListener(function (sender, eventType)
				self:onClickHeroIcon(sender, eventType, id)
			end)

			local heroIcon = IconFactory:createRoleIconSprite({
				stencil = 1,
				iconType = "Bust7",
				id = roleModel,
				size = cc.size(245, 336)
			})

			heroIcon:setScale(0.5)
			heroIcon:addTo(heroPanel)
			heroIcon:setAnchorPoint(cc.p(0.5, 0.5))
			heroIcon:setPosition(cc.p(heroPanel:getContentSize().width / 2 + 5, heroPanel:getContentSize().height / 2))

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
			local posX = panelWidth / 2 + (panelWidth - 23) * (i - 1)

			panel:setPosition(cc.p(posX, 95))

			panel.id = id
			cell.panelList = cell.panelList or {}
			cell.panelList[i] = panel
		end
	end
end

function GalleryPartnerMediator:refreshData()
	self._curPartyData = self._partyArray[self._tabType]
	self._showHeros = self._curPartyData:getHeroIds()
	self._attrData = self._gallerySystem:getLoveAddAttr()
end

function GalleryPartnerMediator:refreshView(hideReload)
	self:refreshTabStatus()
	self:refreshRewardRedPoint()

	if not hideReload then
		self._heroView:stopScroll()
		self._heroView:reloadData()
	end

	self._title:setString(self._curPartyData:getTitle())
	self._desc:setString(self._curPartyData:getDesc())

	local curNum, totalNum = self._gallerySystem:getCurNums(self._curPartyData:getHeroIds())

	self._currencyNum:setString(curNum)
	self._totalNum:setString("/" .. totalNum)
	self._imageDi:loadTexture("asset/ui/gallery/" .. kImageDi[self._tabType])

	local label = self._loveCount:getChildByName("loveNum")
	local loveLevel = self._gallerySystem:getTotalLoveLevel()

	label:setString(loveLevel)
end

function GalleryPartnerMediator:refreshTabStatus()
	for i = 1, #self._tabCache do
		self._tabCache[i][1]:setVisible(self._tabType ~= i)
		self._tabCache[i][2]:setVisible(self._tabType == i)
	end
end

function GalleryPartnerMediator:refreshRewardRedPoint()
	local canReceive = self._gallerySystem:canRevieveReward(self._curPartyData:getPartyId())

	self._rewardBtn:getChildByFullName("redMark"):setVisible(canReceive)

	for i = 1, #self._tabCache do
		local btn = self._tabCache[i][2]
		local partyId = self._partyArray[i]:getPartyId()

		if not self._tabPanelLight:getChildByName("RedPoint_" .. i) then
			local redPoint = ccui.ImageView:create(IconFactory.redPointPath, 1)

			redPoint:setName("RedPoint_" .. i)
			redPoint:addTo(self._tabPanelLight):posite(btn:getPositionX() + 40, btn:getPositionY() + 40)
		end

		canReceive = self._gallerySystem:checkcanReceive(partyId)
		canReceive = canReceive or self._gallerySystem:checkCanGetHeroReward(partyId)

		self._tabPanelLight:getChildByName("RedPoint_" .. i):setVisible(canReceive)
	end
end

function GalleryPartnerMediator:onClickHeroIcon(sender, eventType, id)
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
				local view = self:getInjector():getInstance("GalleryPartnerInfoView")

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

function GalleryPartnerMediator:onClickReward()
	local view = self:getInjector():getInstance("GalleryPartnerRewardView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		rewardIds = self._curPartyData:getRewardIds(),
		partyType = self._curPartyData:getPartyId(),
		tabType = self._tabType
	}, nil))
end

function GalleryPartnerMediator:onClickTab(index)
	AudioEngine:getInstance():playEffect("Se_Click_Tab_Carera", false)

	self._tabType = index

	self:refreshData()
	self:refreshView()
end

function GalleryPartnerMediator:onClickBonus(sender, eventType, data)
	if eventType == ccui.TouchEventType.began then
		AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
		self._bonusPanel:setVisible(true)
		self:refreshInnerAttrPanel(data)
	elseif eventType == ccui.TouchEventType.canceled or eventType == ccui.TouchEventType.ended then
		self._bonusPanel:setVisible(false)
	end
end

function GalleryPartnerMediator:refreshInnerAttrPanel(data)
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
end

function GalleryPartnerMediator:onSliderChanged()
	local percent = self._slider:getPercent()
	local minOffset = self._heroView:minContainerOffset().y

	self._heroView:setContentOffset(cc.p(0, minOffset * (1 - percent * 0.01)), false)
end

function GalleryPartnerMediator:runStartAnim()
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
	self._tableViewPanel:setPosition(cc.p(681, 30))

	local delay = cc.DelayTime:create(0.4)
	local moveto = cc.MoveTo:create(0.3, cc.p(681, 0))
	local fadeIn = cc.FadeIn:create(0.2)
	local callback = cc.CallFunc:create(function ()
		self._heroView:reloadData()
		self._loveCount:fadeIn({
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

function GalleryPartnerMediator:setupClickEnvs()
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

			storyDirector:setClickEnv("GalleryPartnerMediator.firstPanel", firstPanel, function (sender, eventType)
				self:onClickHeroIcon(sender, ccui.TouchEventType.began, firstPanelId)
				self:onClickHeroIcon(sender, ccui.TouchEventType.ended, firstPanelId)
			end)
		end
	end

	storyDirector:notifyWaiting("enter_GalleryPartnerMediator")
end
