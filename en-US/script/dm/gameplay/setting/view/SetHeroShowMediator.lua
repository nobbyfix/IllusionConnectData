SetHeroShowMediator = class("SetHeroShowMediator", DmPopupViewMediator, _M)

SetHeroShowMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kHeroRarityBgAnim = {
	[15.0] = "spzong_urequipeff",
	[13.0] = "srzong_yingxiongxuanze",
	[14.0] = "ssrzong_yingxiongxuanze"
}
local kHeroWeakemAnim = "dikuang_yinghunxuanze"
local kHeroWeakemShangAnim = "shangkuang_yinghunxuanze"
local kBtnHandlers = {}

function SetHeroShowMediator:initialize()
	super.initialize(self)
end

function SetHeroShowMediator:dispose()
	self._selectImage:release()
	super.dispose(self)
end

function SetHeroShowMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._heroSystem = self._developSystem:getHeroSystem()
	local bgNode = self:getView():getChildByFullName("main.bg")

	bindWidget(self, bgNode, PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickClose, self)
		},
		title = Strings:get("heroshow"),
		bgSize = {
			width = 1100,
			height = 580
		}
	})
end

function SetHeroShowMediator:enterWithData(data)
	self._chooseHeroId = data.selectId
	self._index = data.index
	self._selectImage = self:createSelectImage()
	self._kLayerTag = 999
	self._main = self:getView():getChildByFullName("main")
	self._cellClone = self._main:getChildByFullName("cellClone")
	local list = self._heroSystem:getOwnHeroIds(true)
	local myHeros = self._developSystem:getPlayer():getShowHeroes()

	for i = #list, 1, -1 do
		if table.indexof(myHeros, list[i].id) and list[i].id ~= self._chooseHeroId then
			table.remove(list, i)
		end
	end

	self._ownHeroList = list

	self:setUpView()
	self:setHeroesView()
	self:tabClickByIndex(nil, , 1)
end

function SetHeroShowMediator:setUpView()
	self._selectPanel = self._main:getChildByName("selectPanel")
	local buttons = {}

	for i = 1, 3 do
		local button = self._selectPanel:getChildByName("btn" .. i)
		buttons[#buttons + 1] = button
	end

	local data = {
		buttons = buttons,
		buttonClick = self.tabClickByIndex,
		delegate = self
	}
	self._tabGroup = EasyTab:new(data)
end

function SetHeroShowMediator:tabClickByIndex(button, eventType, index)
	if self._sortType == index then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Tab_2", false)

	self._sortType = index

	for i = 1, 3 do
		local iamge = self._selectPanel:getChildByFullName("btn" .. i .. ".image")
		local text = self._selectPanel:getChildByFullName("btn" .. i .. ".Text_13")
		local pic = self._sortType == i and "gg_btn_s_xz.png" or "gg_btn_s_wxz.png"

		text:setTextColor(self._sortType == i and cc.c3b(88, 88, 88) or cc.c3b(255, 246, 255))
		iamge:loadTexture(pic, ccui.TextureResType.plistType)
	end

	self._heroSystem:sortHeroes(self._ownHeroList, self._sortType, {
		self._chooseHeroId
	}, false)
	self._heroView:reloadData()
end

function SetHeroShowMediator:createSelectImage()
	local selectImage = ccui.ImageView:create("asset/common/yh_bd_selected.png")

	selectImage:addTo(self:getView())
	selectImage:setName("SelectImage")
	selectImage:setVisible(false)
	selectImage:retain()
	selectImage:removeFromParent(false)

	return selectImage
end

function SetHeroShowMediator:changeSelectImage(selectImage)
	self._selectImage:setVisible(true)
	self._selectImage:removeFromParent(false)
	self._selectImage:addTo(selectImage):center(selectImage:getContentSize())
end

function SetHeroShowMediator:resetSelectImg()
	self._selectImage:setVisible(false)
	self._selectImage:removeFromParent(false)
	self._selectImage:addTo(self:getView())
end

function SetHeroShowMediator:setHeroesView()
	self._cellWidth = 997
	self._cellHeight = 200
	local heroList = self._main:getChildByName("list_view")

	local function scrollViewDidScroll(view)
		self._isReturn = false
	end

	local function cellSizeForTable(table, idx)
		return self._cellWidth, self._cellHeight + 30
	end

	local function numberOfCellsInTableView(table)
		return math.ceil(#self._ownHeroList / 5)
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
			local layoutPanel = ccui.Layout:create()

			layoutPanel:setTouchEnabled(false)
			layoutPanel:setAnchorPoint(cc.p(0.5, 0))
			layoutPanel:addTo(cell)
			layoutPanel:setTag(self._kLayerTag)
			layoutPanel:setContentSize(cc.size(self._cellWidth, self._cellHeight))
			layoutPanel:setPosition(cc.p(self._cellWidth / 2, 0))
		end

		self:createHeroCell(cell, idx + 1)

		return cell
	end

	local tableView = cc.TableView:create(heroList:getContentSize())
	self._heroView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setDelegate()
	tableView:setBounceable(false)
	heroList:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:reloadData()
end

function SetHeroShowMediator:createHeroCell(cell, index)
	local layoutPanel = cell:getChildByTag(self._kLayerTag)

	layoutPanel:removeAllChildren()

	for i = 1, 5 do
		local heroData = self._ownHeroList[5 * (index - 1) + i]

		if heroData then
			local heroIcon = layoutPanel:getChildByTag(i)

			if not heroIcon then
				heroIcon = self._cellClone:clone()

				heroIcon:addTo(layoutPanel)
				heroIcon:setTag(i)
				heroIcon:setAnchorPoint(cc.p(0, 0))
				heroIcon:setPosition(cc.p(20 + 195 * (i - 1), 0))
			end

			heroIcon.id = heroData.id
			local actionNode = heroIcon:getChildByName("actionNode")
			local heroPanel = actionNode:getChildByName("hero")

			heroPanel:removeAllChildren()

			local heroImg = IconFactory:createRoleIconSpriteNew({
				id = heroData.roleModel
			})

			heroPanel:addChild(heroImg)
			heroImg:setScale(0.68)
			heroImg:setPosition(heroPanel:getContentSize().width / 2, heroPanel:getContentSize().height / 2)

			local cost = actionNode:getChildByFullName("cost")
			local namePanel = actionNode:getChildByName("namePanel")
			local name = namePanel:getChildByName("name")
			local qualityLevel = namePanel:getChildByName("qualityLevel")
			local nameBg = actionNode:getChildByFullName("nameBg")

			qualityLevel:setString(heroData.qualityLevel == 0 and "" or " +" .. heroData.qualityLevel)

			local occupationBg = actionNode:getChildByName("occupationBg")

			if not occupationBg then
				occupationBg = cc.Sprite:create("asset/common/yh_bd_zyd.png")

				occupationBg:addTo(actionNode):posite(38, 61)
				occupationBg:setName("occupationBg")

				local baseNode = cc.GroupedNode:create()

				baseNode:addTo(occupationBg)
				baseNode:setName("baseNode")

				local occupation = ccui.ImageView:create()

				occupation:addTo(baseNode):posite(23.7, 32)
				occupation:setScale(0.64)
				occupation:setName("occupation")
			end

			local occupation = occupationBg:getChildByFullName("baseNode.occupation")

			actionNode:removeChildByName("rarityBg")

			local name_Bg = "common_bd_xydd.png"

			if heroData.rareity == 15 then
				name_Bg = "common_bd_xydd_sp.png"
			end

			local rarityBg = cc.Sprite:create("asset/common/" .. name_Bg)

			rarityBg:addTo(actionNode):posite(32, 167)
			rarityBg:setName("rarityBg")

			local baseNode = cc.GroupedNode:create()

			baseNode:addTo(rarityBg)
			baseNode:setName("baseNode")

			local rarityAnim = IconFactory:getHeroRarityAnim(heroData.rareity)

			rarityAnim:addTo(baseNode):posite(36, 40)

			if heroData.rareity == 15 then
				rarityAnim:setPosition(cc.p(38, 55))
			end

			local levelImage = actionNode:getChildByName("levelImage")
			local level = actionNode:getChildByFullName("level")
			local starBg = actionNode:getChildByFullName("starBg")

			if not starBg then
				starBg = cc.Sprite:create("asset/common/common_icon_stard.png")

				starBg:addTo(actionNode):posite(91.6, 35.5)
				starBg:setName("starBg")

				self._starBgWidth = starBg:getContentSize().width
			end

			local selectImage = actionNode:getChildByName("selectImage")
			local weak = actionNode:getChildByName("weak")
			local weakTop = actionNode:getChildByName("weakTop")
			local bg1 = actionNode:getChildByName("bg")
			local bg2 = actionNode:getChildByName("bg1")
			local occupationName, occupationImg = GameStyle:getHeroOccupation(heroData.type)

			occupation:loadTexture(occupationImg)
			cost:setString(heroData.cost)
			bg2:loadTexture(GameStyle:getHeroRarityBg(heroData.rareity)[2])
			weak:removeAllChildren()
			weakTop:removeAllChildren()
			bg1:removeAllChildren()
			bg2:removeAllChildren()

			if kHeroRarityBgAnim[heroData.rareity] and heroData.showType ~= HeroShowType.kNotOwn then
				local anim = cc.MovieClip:create(kHeroRarityBgAnim[heroData.rareity])

				anim:addTo(bg1):center(bg1:getContentSize())

				if heroData.rareity <= 14 then
					anim:offset(-1, -30)
				else
					anim:offset(-3, 0)
				end

				if heroData.rareity >= 14 then
					local anim = cc.MovieClip:create("ssrlizichai_yingxiongxuanze")

					anim:addTo(bg2):center(bg2:getContentSize()):offset(5, -20)
				end
			else
				local sprite = ccui.ImageView:create(GameStyle:getHeroRarityBg(heroData.rareity)[1])

				sprite:addTo(bg1):center(bg1:getContentSize())
			end

			if heroData.awakenLevel > 0 then
				local anim = cc.MovieClip:create(kHeroWeakemAnim)

				anim:addTo(weak):center(weak:getContentSize())
				anim:setScale(2)
				anim:offset(-5, 18)

				anim = cc.MovieClip:create(kHeroWeakemShangAnim)

				anim:addTo(weakTop):center(weakTop:getContentSize())
				anim:setScale(2)
				anim:offset(-5, 18)
			end

			name:setString(heroData.name)
			GameStyle:setHeroNameByQuality(name, heroData.quality)
			GameStyle:setHeroNameByQuality(qualityLevel, heroData.quality)
			name:disableEffect(1)
			qualityLevel:disableEffect(1)
			starBg:removeAllChildren()

			local offsetX = (HeroStarCountMax - heroData.maxStar) * self._starBgWidth / 14

			for i = 1, heroData.maxStar do
				local path, zOrder = nil

				if i <= heroData.star then
					path = "img_yinghun_img_star_full.png"
					zOrder = 105
				elseif i == heroData.star + 1 and heroData.littleStar then
					path = "img_yinghun_img_star_half.png"
					zOrder = 100
				else
					path = "img_yinghun_img_star_empty.png"
					zOrder = 99
				end

				if heroData.awakenLevel > 0 then
					path = "jx_img_star.png"
					zOrder = 100
				end

				local star = cc.Sprite:createWithSpriteFrameName(path)

				star:addTo(starBg)
				star:setPosition(cc.p(offsetX + i / 7 * self._starBgWidth, 22))
				star:setScale(0.4)
			end

			level:setVisible(true)
			levelImage:setVisible(true)
			level:setString(Strings:get("Strenghten_Text78", {
				level = heroData.level
			}))

			local levelImageWidth = levelImage:getContentSize().width
			local levelWidth = level:getContentSize().width

			levelImage:setScaleX((levelWidth + 20) / levelImageWidth)
			name:setPositionX(0)
			qualityLevel:setPositionX(name:getContentSize().width)
			namePanel:setContentSize(cc.size(name:getContentSize().width + qualityLevel:getContentSize().width, 30))

			local nameWidth = name:getContentSize().width + qualityLevel:getContentSize().width
			local w = math.max(104, nameWidth + 25)

			nameBg:setContentSize(cc.size(w, nameBg:getContentSize().height))
			nameBg:setPositionX(namePanel:getPositionX())
			heroIcon:setVisible(true)

			heroIcon.id = heroData.id

			if heroData.id == self._chooseHeroId then
				self:changeSelectImage(selectImage)

				heroIcon.select = true
			end

			heroIcon:setScale(1)
			heroIcon:setSwallowTouches(false)
			heroIcon:addTouchEventListener(function (sender, eventType)
				self:onClickHeroIcon(sender, eventType, heroData)
			end)
		end
	end
end

function SetHeroShowMediator:onClickHeroIcon(sender, eventType, heroData)
	if eventType == ccui.TouchEventType.began then
		self._isReturn = true
	elseif eventType == ccui.TouchEventType.ended and self._isReturn then
		AudioEngine:getInstance():playEffect("Se_Click_Select_1", false)

		if self._chooseHeroId == sender.id then
			sender.select = not sender.select

			if sender.select then
				local selectImage = sender:getChildByFullName("actionNode.selectImage")

				self:changeSelectImage(selectImage)
			else
				self._chooseHeroId = nil

				self:resetSelectImg()
			end
		else
			local selectImage = sender:getChildByFullName("actionNode.selectImage")

			self:changeSelectImage(selectImage)

			self._chooseHeroId = sender.id
			sender.select = true
		end
	end
end

function SetHeroShowMediator:onClickClose(sender, eventType)
	self:close({
		selectId = self._chooseHeroId,
		index = self._index
	})
end

function SetHeroShowMediator:onTouchMaskLayer()
	self:close({
		selectId = self._chooseHeroId,
		index = self._index
	})
end
