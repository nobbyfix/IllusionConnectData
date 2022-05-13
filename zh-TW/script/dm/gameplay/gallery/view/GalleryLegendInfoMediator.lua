GalleryLegendInfoMediator = class("GalleryLegendInfoMediator", DmAreaViewMediator, _M)

GalleryLegendInfoMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
GalleryLegendInfoMediator:has("_gallerySystem", {
	is = "r"
}):injectWith("GallerySystem")

local kStateImage = {
	kGot = "legend_img_light.png",
	kNotGot = "legend_img_lightoff.png"
}
local kBtnHandlers = {
	descBtn = {
		ignoreClickAudio = true,
		eventType = 4,
		func = "onClickShowTips"
	},
	PanelTouch_tip = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickHideTips"
	}
}

function GalleryLegendInfoMediator:initialize()
	super.initialize(self)
end

function GalleryLegendInfoMediator:dispose()
	super.dispose(self)
end

function GalleryLegendInfoMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._heroSystem = self._developSystem:getHeroSystem()

	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.refreshBySync)
end

function GalleryLegendInfoMediator:enterWithData(data)
	self:setupTopInfoWidget()
	self:initData(data)
	self:initWidgetInfo()
	self:initTipsView()
	self:initBaseView()
	self:initHeroView()
	self:initInfoView()
	self:initCellHeight()
	self:initTableView()
end

function GalleryLegendInfoMediator:initTipsView()
	self._tipsPanel = self:getView():getChildByName("tipsPanel")

	self._tipsPanel:setVisible(false)

	self._tipsTouchPanel = self:getView():getChildByName("PanelTouch_tip")

	self._tipsTouchPanel:setVisible(false)

	local tips = ConfigReader:getDataByNameIdAndKey("ConfigValue", "HerosLegendRule", "content")
	local panelSize = self._tipsPanel:getContentSize()
	local space = 18

	for i = 1, #tips do
		local str = Strings:get(tips[i])
		local text = ccui.Text:create(str, TTF_FONT_FZYH_M, 18)

		text:setLineSpacing(space)
		text:getVirtualRenderer():setMaxLineWidth(380)
		text:addTo(self._tipsPanel):setTag(i)
		text:setAnchorPoint(cc.p(0, 1))

		local prewText = self._tipsPanel:getChildByTag(i - 1)

		if prewText then
			local topPosY = prewText:getPositionY() - prewText:getContentSize().height

			text:setPosition(cc.p(10, topPosY - space))
		else
			text:setPosition(cc.p(10, panelSize.height - 15))
		end
	end
end

function GalleryLegendInfoMediator:initWidgetInfo()
	self._bg = self:getView():getChildByFullName("bg")
	self._main = self:getView():getChildByFullName("main")
	self._title = self._main:getChildByFullName("text")
	self._roleNode = self._main:getChildByFullName("roleNode")
	self._infoPanel = self._main:getChildByFullName("infoPanel")
	self._tableViewPanel = self._infoPanel:getChildByFullName("panel")
	self._heroPanel = self._infoPanel:getChildByFullName("heroPanel")
	self._cellClone = self._infoPanel:getChildByFullName("cellClone")

	self._cellClone:setVisible(false)

	local lineGradiantVec2 = {
		{
			ratio = 0.5,
			color = cc.c4b(255, 255, 255, 255)
		},
		{
			ratio = 1,
			color = cc.c4b(110, 110, 110, 255)
		}
	}

	self._infoPanel:getChildByFullName("text"):enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
		x = 0,
		y = -1
	}))
end

function GalleryLegendInfoMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local currencyInfoWidget = systemKeeper:getResourceBannerIds("HerosLegend")
	local currencyInfo = {}

	for i = #currencyInfoWidget, 1, -1 do
		currencyInfo[#currencyInfoWidget - i + 1] = currencyInfoWidget[i]
	end

	local config = {
		style = 1,
		currencyInfo = currencyInfo,
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		title = Strings:get("Gallery_Legend_UI1")
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function GalleryLegendInfoMediator:initData(data)
	self._legendId = data.id
	self._legendData = self._gallerySystem:getLegendById(self._legendId)
	self._bgPath = self._legendData:getInsideBG()
	self._showHeroes = self._legendData:getHeroes()
	self._showHeroesList = {}

	for heroId, v in pairs(self._showHeroes) do
		local value = v.inside
		self._showHeroesList[value.sort] = heroId
	end

	self._showList = self._legendData:getTasks()
	self._cellLabels = {}
end

function GalleryLegendInfoMediator:initBaseView()
	self._title:setString(self._legendData:getName())
	self._bg:loadTexture(self._bgPath)
end

function GalleryLegendInfoMediator:initHeroView()
	self._roleNode:removeAllChildren()

	self._spines = {}

	for heroId, v in pairs(self._showHeroes) do
		local value = v.inside
		local hero = self._heroSystem:getHeroById(heroId)
		local model = IconFactory:getRoleModelByKey("HeroBase", heroId)
		local has = false

		if hero then
			has = true
		end

		local portrait, _, spineani = IconFactory:createRoleIconSpriteNew({
			iconType = "Portrait",
			id = model
		})

		portrait:addTo(self._roleNode)

		if not has then
			portrait:setBrightness(-80)
			portrait:setSaturation(-80)
		end

		portrait:setPosition(cc.p(value.x, value.y))
		portrait:setScale(value.scale)
		portrait:setLocalZOrder(value.zOrder)
	end
end

function GalleryLegendInfoMediator:initInfoView()
	self._heroPanel:removeAllChildren()

	local width = 0

	for i = 1, #self._showHeroesList do
		local heroId = self._showHeroesList[i]
		local hero = self._heroSystem:getHeroById(heroId)
		local widget = ccui.Widget:create()

		widget:setAnchorPoint(cc.p(0.5, 0))
		widget:setContentSize(cc.size(90, 130))
		widget:addTo(self._heroPanel)

		local posX = 40 + 119 * (i - 1)

		widget:setPosition(cc.p(posX, 0))
		widget:setTouchEnabled(true)
		widget:addClickEventListener(function ()
			self:onClickHeroIcon(heroId)
		end)

		if hero then
			local heroInfo = {
				id = heroId,
				roleModel = IconFactory:getRoleModelByKey("HeroBase", heroId),
				star = hero:getStar(),
				name = hero:getName(),
				quality = hero:getQuality(),
				qualityLevel = hero:getQualityLevel(),
				rarity = hero:getRarity(),
				littleStar = hero:getLittleStar()
			}
			local icon = IconFactory:createHeroLargeIcon(heroInfo, {
				hideOcc = true,
				hideLevel = true,
				hideRarity = true,
				hideCost = true
			})

			icon:addTo(widget):center(widget:getContentSize()):setScale(0.55)
		else
			local heroInfo = {
				rarity = 12,
				id = heroId
			}
			local icon = IconFactory:createHeroLargeIcon(heroInfo, {
				hideAll = true
			})

			icon:addTo(widget):center(widget:getContentSize()):setScale(0.55)
			icon:setBrightness(-80)
			icon:setSaturation(-80)
		end

		width = posX
	end

	self._heroPanel:setContentSize(cc.size(width + 40, 134))
end

function GalleryLegendInfoMediator:initCellHeight()
	for index = 1, #self._showList do
		local addHeight = 0
		local data = self._showList[index]
		self._cellLabels[index] = {}
		local attr = self._cellClone:getChildByFullName("attr")

		if data:getDesc() ~= "" then
			local label = attr:clone()

			label:getVirtualRenderer():setDimensions(316, 0)
			label:setString(data:getDesc())
			label:addTo(self:getView())
			label:setVisible(false)

			addHeight = addHeight + label:getContentSize().height
			self._cellLabels[index].label = label
		end

		addHeight = addHeight - attr:getContentSize().height

		if addHeight < 0 then
			addHeight = 0
		end

		self._cellLabels[index].addHeight = addHeight
	end
end

function GalleryLegendInfoMediator:initTableView()
	local width = self._cellClone:getContentSize().width
	local height = self._cellClone:getContentSize().height

	local function cellSizeForTable(table, idx)
		local index = idx + 1
		local addHeight = self._cellLabels[index].addHeight

		return width, height + addHeight
	end

	local function numberOfCellsInTableView(table)
		return #self._showList
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
			local panel = self._cellClone:clone()

			panel:addTo(cell):posite(0, 0)
			panel:setName("CellClone")
			panel:setVisible(true)
		end

		self:createTeamCell(cell, idx + 1)

		return cell
	end

	local tableView = cc.TableView:create(self._tableViewPanel:getContentSize())
	self._tableView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setDelegate()
	tableView:setBounceable(false)
	self._tableViewPanel:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:reloadData()
end

function GalleryLegendInfoMediator:createTeamCell(cell, index)
	local addHeight = self._cellLabels[index].addHeight
	local data = self._showList[index]
	local panel = cell:getChildByFullName("CellClone")

	panel:setPositionY(addHeight)

	local state = panel:getChildByFullName("state")
	local stateImg = data:getState() and kStateImage.kGot or kStateImage.kNotGot

	state:loadTexture(stateImg, 1)

	local desc = panel:getChildByFullName("desc")

	desc:setString("")
	desc:removeAllChildren()

	local str = data:getTitle()
	local contentText = ccui.RichText:createWithXML(str, {})

	contentText:setAnchorPoint(cc.p(0, 0.5))
	contentText:addTo(desc):posite(0, 0)
	ajustRichTextCustomWidth(contentText, 250)

	local attr = panel:getChildByFullName("attr")

	attr:setString("")
	attr:removeAllChildren()

	local opacity = data:getState() and 255 or 102

	attr:setOpacity(opacity)

	local posY = attr:getContentSize().height
	local descLabel = self._cellLabels[index].label

	if descLabel then
		local label = descLabel:clone()

		label:setVisible(true)
		label:addTo(attr):posite(0, posY)
	end

	local progress = panel:getChildByFullName("progress")

	progress:setString("（" .. data:getCurrentNum() .. "/" .. data:getTargetNum() .. "）")
end

function GalleryLegendInfoMediator:onClickHeroIcon(id)
	local view = self:getInjector():getInstance("HeroShowNotOwnView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		showType = 3,
		id = id
	}))
end

function GalleryLegendInfoMediator:updateData()
	self._legendData = self._gallerySystem:getLegendById(self._legendId)
	self._showList = self._legendData:getTasks()
end

function GalleryLegendInfoMediator:updateView()
	self:initHeroView()
	self:initInfoView()
	self._tableView:stopScroll()
	self._tableView:reloadData()
end

function GalleryLegendInfoMediator:refreshBySync()
	self:updateData()
	self:updateView()
end

function GalleryLegendInfoMediator:onClickShowTips(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		self._tipsPanel:setVisible(true)
		self._tipsTouchPanel:setVisible(true)
	end
end

function GalleryLegendInfoMediator:onClickHideTips(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		self._tipsPanel:setVisible(false)
		self._tipsTouchPanel:setVisible(false)
	end
end

function GalleryLegendInfoMediator:onClickBack()
	self:dismiss()
end
