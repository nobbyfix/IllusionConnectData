RecruitHeroPreviewMediator = class("RecruitHeroPreviewMediator", DmPopupViewMediator, _M)

RecruitHeroPreviewMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kBtnHandlers = {}
local TabType = {
	kHero = 1,
	kDesc = 4,
	kEquip = 2,
	kUREquip = 5,
	kItem = 3
}
local kTabImage = {
	{
		ASSET_LANG_COMMON .. "common_bg_all.png",
		ASSET_LANG_COMMON .. "common_bg_all02.png",
		"all"
	},
	{
		ASSET_LANG_COMMON .. "common_bg_SSR.png",
		ASSET_LANG_COMMON .. "common_bg_SSR02.png",
		14
	},
	[4] = {
		ASSET_LANG_COMMON .. "common_bg_R.png",
		ASSET_LANG_COMMON .. "common_bg_R02.png",
		12,
		4
	},
	[3] = {
		ASSET_LANG_COMMON .. "common_bg_SR.png",
		ASSET_LANG_COMMON .. "common_bg_SR02.png",
		13
	}
}
local kURTabImage = {
	{
		ASSET_LANG_COMMON .. "common_bg_all.png",
		ASSET_LANG_COMMON .. "common_bg_all02.png"
	},
	{
		ASSET_LANG_COMMON .. "common_btn_MS.png",
		ASSET_LANG_COMMON .. "common_btn_MS02.png"
	},
	{
		ASSET_LANG_COMMON .. "common_bg_SSR.png",
		ASSET_LANG_COMMON .. "common_bg_SSR02.png"
	},
	{
		ASSET_LANG_COMMON .. "common_bg_SR.png",
		ASSET_LANG_COMMON .. "common_bg_SR02.png"
	}
}
local kSPTabImage = {
	{
		ASSET_LANG_COMMON .. "common_bg_all.png",
		ASSET_LANG_COMMON .. "common_bg_all02.png",
		"all"
	},
	{
		ASSET_LANG_COMMON .. "common_bg_SP.png",
		ASSET_LANG_COMMON .. "common_bg_SP02.png",
		15
	},
	[5] = {
		ASSET_LANG_COMMON .. "common_bg_R.png",
		ASSET_LANG_COMMON .. "common_bg_R02.png",
		12
	},
	[4] = {
		ASSET_LANG_COMMON .. "common_bg_SR.png",
		ASSET_LANG_COMMON .. "common_bg_SR02.png",
		13
	},
	[3] = {
		ASSET_LANG_COMMON .. "common_bg_SSR.png",
		ASSET_LANG_COMMON .. "common_bg_SSR02.png",
		14
	}
}

function RecruitHeroPreviewMediator:initialize()
	super.initialize(self)
end

function RecruitHeroPreviewMediator:dispose()
	super.dispose(self)
end

function RecruitHeroPreviewMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._heroSystem = self._developSystem:getHeroSystem()

	self:glueFieldAndUi()
end

function RecruitHeroPreviewMediator:enterWithData(data)
	self._data = data
	self._heroType = 1
	self._showType = {}
	self._recruitPool = data.recruitPool
	self._rewards = data.rewards
	self._showTabNum = 1
	self._previewData = self:buildPreviewData()

	self:setSelectView()
	self:setHeroesView()
	self:setEquipView()
	self:setItemsView()
	self:setDescView()
	self:setUREquipView()
	self:setupTabController()
end

function RecruitHeroPreviewMediator:glueFieldAndUi()
	local view = self:getView()
	self._main = view:getChildByFullName("main")
	self._tabpanel = self._main:getChildByName("tabpanel")
	self._listView = self._main:getChildByFullName("list_view")

	self._listView:setScrollBarEnabled(false)
	self._listView:setVisible(false)

	self._equipPanel = self._main:getChildByFullName("equipPanel")

	self._equipPanel:setVisible(false)

	self._heroPanel = self._main:getChildByName("heroPanel")

	self._heroPanel:setVisible(false)

	self._descPanel = self._main:getChildByName("descPanel")

	self._descPanel:setVisible(false)

	self._itemCell = self._main:getChildByName("itemCell")

	self._itemCell:setVisible(false)

	local bgNode = self._main:getChildByFullName("bgNode")
	local tempNode = bindWidget(self, bgNode, PopupNormalTabWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickClose, self)
		},
		title = Strings:get("Recruit_preview"),
		title1 = Strings:get("UITitle_EN_Zhaohuanyulan")
	})
end

function RecruitHeroPreviewMediator:setupTabController()
	local config = {
		onClickTab = function (name, tag)
			self:onClickTab(name, tag)
		end
	}
	local data = {}

	for i = 1, self._showTabNum do
		local str = self._showType[i][2]
		local str1 = self._showType[i][3]
		data[#data + 1] = {
			tabText = str,
			tabTextTranslate = str1
		}
	end

	config.btnDatas = data
	local injector = self:getInjector()
	local widget = TabBtnWidget:createWidgetNode()
	self._tabBtnWidget = self:autoManageObject(injector:injectInto(TabBtnWidget:new(widget)))

	self._tabBtnWidget:adjustScrollViewSize(0, 496)
	self._tabBtnWidget:initTabBtn(config, {
		ignoreSound = true,
		noCenterBtn = true,
		ignoreRedSelectState = true
	})
	self._tabBtnWidget:selectTabByTag(1)

	local view = self._tabBtnWidget:getMainView()

	view:addTo(self._tabpanel):posite(0, 4)
	view:setLocalZOrder(1100)
end

function RecruitHeroPreviewMediator:buildPreviewData()
	local showRewards = self._recruitPool:getShowRewards()

	if showRewards == nil then
		return
	end

	local heroRewardId, equipRewardId, itemRewardId = nil

	if showRewards.Draw_HeroBtnName then
		self._showType[#self._showType + 1] = {
			TabType.kHero,
			Strings:get("Strengthen_Title"),
			Strings:get("UITitle_EN_Huoban")
		}
		self._tabType = TabType.kHero
		self._showTabNum = self._showTabNum + 1
		heroRewardId = showRewards.Draw_HeroBtnName
	end

	if showRewards.Draw_EquipBtnName then
		self._showType[#self._showType + 1] = {
			TabType.kEquip,
			Strings:get("Draw_EquipBtnName"),
			Strings:get("UITitle_EN_Zhuangbei")
		}
		self._tabType = TabType.kEquip
		self._showTabNum = self._showTabNum + 1
		equipRewardId = showRewards.Draw_EquipBtnName
	end

	if showRewards.Draw_ItemBtnName then
		self._showType[#self._showType + 1] = {
			TabType.kItem,
			Strings:get("Draw_ItemBtnName"),
			Strings:get("Draw_ItemBtnName")
		}
		self._showTabNum = self._showTabNum + 1
		itemRewardId = showRewards.Draw_ItemBtnName
	end

	if showRewards.Draw_UR_EquipBtnName then
		self._tabType = TabType.kUREquip
		self._showType[#self._showType + 1] = {
			TabType.kUREquip,
			Strings:get("Draw_UR_EquipBtnName"),
			Strings:get("UITitle_EN_Zhuangbei")
		}
		self._showTabNum = self._showTabNum + 1
	end

	local heroRewardConfig = {}
	local equipRewardConfig = {}
	local itemRewardConfig = {}
	local urEquipRewardConfig = {}

	if self._recruitPool:getType() == RecruitPoolType.kDiamond or self._recruitPool:getType() == RecruitPoolType.kActivity then
		heroRewardConfig = self._rewards
	elseif self._recruitPool:getType() == RecruitPoolType.kEquip then
		equipRewardConfig = self._rewards
	elseif self._recruitPool:getType() == RecruitPoolType.kGold then
		itemRewardConfig = self._rewards
	elseif self._recruitPool:getType() == RecruitPoolType.kActivityUREquip then
		urEquipRewardConfig = self._rewards
	end

	local herosRewards = {}
	local equipRewards = {}
	local itemRewards = {}
	local urEquipRewards = {}
	local tempHerosRewards = {}

	if equipRewardConfig then
		for i = 1, #equipRewardConfig do
			local reward = equipRewardConfig[i]
			equipRewards[#equipRewards + 1] = reward
		end
	end

	if heroRewardConfig then
		local heroInfo = self._recruitPool:getRoleDetail()
		local heroUpList = {}

		if heroInfo then
			for i = 1, #heroInfo do
				local heroId = heroInfo[i].hero

				if heroId then
					heroUpList[#heroUpList + 1] = heroId
					tempHerosRewards[#tempHerosRewards + 1] = {
						amount = 1,
						up = 1,
						code = heroId,
						type = RewardType.kHero
					}
				end
			end
		end

		for i = 1, #heroRewardConfig do
			local reward = heroRewardConfig[i]

			if reward.type == 3 then
				local config = ConfigReader:getRecordById("HeroBase", reward.code)

				if config then
					if table.find(heroUpList, reward.code) then
						reward.up = 1
					else
						reward.up = 0
					end

					reward.index = i
					tempHerosRewards[#tempHerosRewards + 1] = reward
				end
			elseif reward.type == 2 then
				itemRewards[#itemRewards + 1] = reward
			end
		end
	end

	local function inList(list, data)
		for i, v in pairs(list) do
			if v.code == data.code then
				return true
			end
		end
	end

	local index = 1

	for i, v in pairs(tempHerosRewards) do
		if not inList(herosRewards, v) then
			v.index = index
			herosRewards[#herosRewards + 1] = v
			index = index + 1
		end
	end

	if itemRewardConfig then
		for i = 1, #itemRewardConfig do
			local reward = itemRewardConfig[i]
			itemRewards[#itemRewards + 1] = reward
		end
	end

	if urEquipRewardConfig then
		for i = 1, #urEquipRewardConfig do
			local reward = urEquipRewardConfig[i]
			urEquipRewards[#urEquipRewards + 1] = reward
		end
	end

	local function item_compare(a, b)
		local aConfig = ConfigReader:getRecordById("ItemConfig", tostring(a.code))
		local bConfig = ConfigReader:getRecordById("ItemConfig", tostring(a.code))
		local aQuality = aConfig.Quality
		local bQuality = bConfig.Quality

		if aQuality == bQuality then
			return a.code < b.code
		else
			return bQuality < aQuality
		end
	end

	table.sort(itemRewards, item_compare)

	local function hero_compare(a, b)
		local heroPrototype = self._heroSystem:getHeroProById(a.code)
		local rareityA = heroPrototype:getConfig().Rareity
		local heroPrototype = self._heroSystem:getHeroProById(b.code)
		local rareityB = heroPrototype:getConfig().Rareity

		if a.up == b.up then
			if rareityA == rareityB then
				return a.index < b.index
			else
				return rareityB < rareityA
			end
		else
			return b.up < a.up
		end
	end

	table.sort(herosRewards, hero_compare)

	local previewData = {
		[TabType.kHero] = herosRewards,
		[TabType.kEquip] = equipRewards,
		[TabType.kItem] = itemRewards,
		[TabType.kDesc] = self._recruitPool:getRareDesc(),
		[TabType.kUREquip] = urEquipRewards
	}
	self._showType[#self._showType + 1] = {
		TabType.kDesc,
		Strings:get("Recruit_UI4"),
		Strings:get("UITitle_EN_Shuoming")
	}

	return previewData
end

function RecruitHeroPreviewMediator:setSelectView()
	self._selectPanel = self._main:getChildByName("selectPanel")
	local buttons = {}

	for i = 1, 5 do
		local button = self._selectPanel:getChildByName("btn" .. i)

		if self._tabType == TabType.kUREquip then
			if i < 5 then
				buttons[#buttons + 1] = button
				local image = button:getChildByFullName("image")
				local pic = self._heroType == i and kURTabImage[i][2] or kURTabImage[i][1]

				image:loadTexture(pic)
			else
				button:setVisible(false)
			end
		else
			local tabConfig = kTabImage
			local num = 4

			if self._data.showSpHero then
				tabConfig = kSPTabImage
				num = 5
			end

			self._tabConfig = tabConfig

			if i <= num then
				buttons[#buttons + 1] = button
				local image = button:getChildByFullName("image")
				local pic = self._heroType == i and tabConfig[i][2] or tabConfig[i][1]

				image:loadTexture(pic)
			else
				button:setVisible(false)
			end
		end
	end

	local data = {
		buttons = buttons,
		buttonClick = self.tabClickByIndex,
		delegate = self
	}
	self._tabGroup = EasyTab:new(data)

	self._tabGroup:setCurrentSelectButtonByIndex(self._heroType)
	self._selectPanel:setVisible(false)
end

function RecruitHeroPreviewMediator:setHeroesView()
	self._showHeros = {
		{},
		{},
		{},
		{},
		{}
	}
	self._showHeros[1] = self._previewData[TabType.kHero]

	local function setShowHero(data, rareity)
		for k, v in pairs(self._tabConfig) do
			if v[3] == rareity then
				self._showHeros[k][#self._showHeros[k] + 1] = data
			end
		end
	end

	for i = 1, #self._previewData[TabType.kHero] do
		local data = self._previewData[TabType.kHero][i]
		local heroId = data.code
		local heroPrototype = self._heroSystem:getHeroProById(heroId)
		local rareity = heroPrototype:getConfig().Rareity

		setShowHero(data, rareity)
	end

	local function cellSizeForTable(table, idx)
		return 800, 173
	end

	local function numberOfCellsInTableView(table)
		return math.ceil(#self._showHeros[self._heroType] / 5)
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
		end

		self:createHeroCell(cell, idx + 1)

		return cell
	end

	local heroList = self._heroPanel:getChildByName("heroList")
	local tableView = cc.TableView:create(heroList:getContentSize())
	self._heroView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setDelegate()
	tableView:setBounceable(false)
	heroList:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:reloadData()
end

function RecruitHeroPreviewMediator:createHeroCell(cell, index)
	cell:removeAllChildren()

	for i = 1, 5 do
		local reward = self._showHeros[self._heroType][5 * (index - 1) + i]

		if reward then
			local heroId = reward.code
			local config = ConfigReader:getRecordById("HeroBase", heroId)

			if config then
				local heroInfo = {
					id = heroId,
					rarity = config.Rarity,
					name = Strings:get(config.Name)
				}
				local heroIcon = IconFactory:createHeroLargeIcon(heroInfo, {
					hideLevel = true,
					hideStar = true,
					rarityAnim = true
				})

				heroIcon:setScale(0.8)
				heroIcon:addTo(cell)
				heroIcon:setAnchorPoint(cc.p(0, 0.5))

				local posX = 90 + 156 * (i - 1)

				heroIcon:setPosition(cc.p(posX, 86))
				heroIcon:setLocalZOrder(0)

				if reward.up > 0 then
					local bgImg = ccui.ImageView:create()

					bgImg:setScale(0.95)
					bgImg:setAnchorPoint(cc.p(0.5, 0.5))
					bgImg:setPosition(cc.p(posX, 92))
					bgImg:addTo(cell)
					bgImg:setLocalZOrder(-1)
					bgImg:loadTexture("ck_bg_bjv_2.png", 1)

					local textBg = ccui.ImageView:create()

					textBg:setScale(1)
					textBg:setAnchorPoint(cc.p(0.5, 0.5))
					textBg:setPosition(cc.p(posX, 160))
					textBg:addTo(cell)
					textBg:setLocalZOrder(1)
					textBg:loadTexture("ck_bg_bjv_1.png", 1)

					local string = Strings:get("Recruit_UI_UP", {
						fontName = TTF_FONT_FZYH_M
					})
					local richText = ccui.RichText:createWithXML(string, {})

					richText:setAnchorPoint(cc.p(0.5, 0.5))
					richText:addTo(cell):posite(posX, 160)
					richText:setLocalZOrder(20)
				end
			end
		end
	end
end

function RecruitHeroPreviewMediator:updateHeroesView()
	self._heroPanel:setVisible(true)

	if not self._heroView then
		self:setHeroesView()
	else
		self._heroView:stopScroll()
		self._heroView:reloadData()
	end
end

function RecruitHeroPreviewMediator:updateEquipView()
	self._equipPanel:setVisible(true)

	if not self._equipView then
		self:setEquipView()
	else
		self._equipView:stopScroll()
		self._equipView:reloadData()
	end
end

function RecruitHeroPreviewMediator:updateUREquipView()
	self._equipPanel:setVisible(true)

	if not self._equipView then
		self:setUREquipView()
	else
		self._equipView:stopScroll()
		self._equipView:reloadData()
	end
end

function RecruitHeroPreviewMediator:tabClickByIndex(button, eventType, index)
	AudioEngine:getInstance():playEffect("Se_Click_Tab_2", false)

	self._heroType = index

	if self._tabType == TabType.kUREquip then
		for i = 1, 4 do
			local iamge = self._selectPanel:getChildByFullName("btn" .. i .. ".image")
			local pic = self._heroType == i and kURTabImage[i][2] or kURTabImage[i][1]

			iamge:loadTexture(pic)
		end
	else
		local num = table.nums(self._tabConfig)

		for i = 1, num do
			local iamge = self._selectPanel:getChildByFullName("btn" .. i .. ".image")
			local pic = self._heroType == i and self._tabConfig[i][2] or self._tabConfig[i][1]

			iamge:loadTexture(pic)
		end
	end

	if self._tabType == TabType.kHero then
		self:updateHeroesView()
	elseif self._tabType == TabType.kEquip then
		self:updateEquipView()
	elseif self._tabType == TabType.kUREquip then
		self:updateEquipView()
	end
end

function RecruitHeroPreviewMediator:setItemsView()
	self._listView:removeAllItems()
	self._listView:jumpToBottom()

	local listViewSize = self._listView:getContentSize()
	local data = self._previewData[TabType.kItem]
	local num = math.ceil(#data / 7)

	for i = 1, num do
		local layer = ccui.Layout:create()

		layer:setContentSize(cc.size(listViewSize.width, self._itemCell:getContentSize().height))
		layer:removeAllChildren()
		self._listView:pushBackCustomItem(layer)

		for index = 1, 7 do
			local rewardData = data[5 * (i - 1) + index]

			if rewardData then
				local panel = self._itemCell:clone()

				panel:setVisible(true)

				local nameLabel = panel:getChildByName("name")

				nameLabel:setString(RewardSystem:getName(rewardData))

				local icon = IconFactory:createRewardIcon(rewardData, {
					isWidget = true,
					showAmount = false
				})

				IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewardData, {
					needDelay = true
				})
				icon:setAnchorPoint(cc.p(0.5, 0.5))
				panel:addChild(icon)
				icon:setPosition(cc.p(nameLabel:getPositionX(), 77))
				layer:addChild(panel)
				panel:setPosition(cc.p((index - 1) * self._itemCell:getContentSize().width, 0))
			end
		end
	end
end

function RecruitHeroPreviewMediator:isRichText(string)
	local str = "<font"
	local count = string:find(str)

	if count ~= nil then
		return true
	else
		return false
	end
end

function RecruitHeroPreviewMediator:setDescView()
	local id = self._recruitPool:getId()
	local cardType = self._recruitPool:getType()
	local descList = self._recruitPool:getDescList()
	local listView = self._descPanel:getChildByName("ListView_desc")

	listView:setScrollBarEnabled(false)

	if not listView.descLayout then
		local layout = ccui.Layout:create()

		listView:pushBackCustomItem(layout)

		local text1 = self._descPanel:getChildByName("text1")

		text1:setString("")

		local richText = ccui.RichText:createWithXML("", {})

		richText:setAnchorPoint(cc.p(0, 0))
		richText:addTo(layout):posite(0, 0):setName("text")
		richText:renderContent(740, 0)

		listView.descLayout = layout
		local richText = ccui.RichText:createWithXML("", {})

		richText:setAnchorPoint(cc.p(0, 0))
		richText:addTo(layout):posite(0, 0):setName("special_text")

		listView.descLayout = layout
	end

	local function convertRichText(string)
		if not self:isRichText(string) then
			local rtStr = "<outline color='#000000' size = '1'><font face='${fontName}'  size='18' color='#C3C3C3'>${text}</font></outline>"
			local templateStr = TextTemplate:new(rtStr)
			string = templateStr:stringify({
				fontName = TTF_FONT_FZYH_R,
				text = string
			})
		end

		return string
	end

	local heroes = self._data.heroes or {}
	local params = {}

	for i, v in pairs(heroes) do
		local nameId = ConfigReader:getDataByNameIdAndKey("HeroBase", v, "Name")
		local name = Strings:get(nameId)
		params["DrawHeroName" .. i] = name
	end

	params.fontName = TTF_FONT_FZYH_R
	local text1 = listView.descLayout:getChildByName("text")

	self._descPanel:getChildByName("text2"):setString("")

	if cardType == RecruitPoolType.kEquip or cardType == RecruitPoolType.kActivityEquip then
		text1:setString(convertRichText(Strings:get("Recruit_UI22") .. "\n" .. Strings:get("Recruit_UI23")))
	elseif cardType == RecruitPoolType.kActivityUREquip then
		text1:setString(convertRichText(Strings:get(self._recruitPool:getRareTitle())))
	elseif descList and #descList then
		local string = Strings:get(descList[1], params)
		string = convertRichText(string)

		for i = 2, #descList do
			local str = Strings:get(descList[i], params)
			string = string .. "<br/>" .. convertRichText(str)
		end

		text1:setString(string)
	else
		text1:setString(convertRichText(Strings:get("Recruit_UI14") .. "\n" .. Strings:get("Recruit_UI15")))
	end

	text1:renderContent(750, 0)

	local specialText = listView.descLayout:getChildByName("special_text")
	local specialList = self._recruitPool:getSpecialDescList()

	if specialList and #specialList > 0 then
		local string = convertRichText(Strings:get(specialList[1], params))

		for i = 2, #specialList do
			string = string .. "<br/>" .. convertRichText(Strings:get(specialList[i], params))
		end

		specialText:setString(string)
		specialText:renderContent(750, 0)
	end

	local specialSize = specialText:getContentSize()

	listView.descLayout:setContentSize(cc.size(760, text1:getContentSize().height + specialSize.height))
	text1:setPositionY(specialSize.height)

	local descData = self._previewData[TabType.kDesc]
	local data = {}

	for i = 1, #descData do
		local showData = descData[i]
		local proportion = next(showData)

		if proportion then
			data[#data + 1] = {
				proportion = proportion,
				type = showData[proportion][1],
				desc = showData[proportion][2]
			}
		end
	end

	if #data >= 4 then
		listView:setPositionY(100)
		listView:setContentSize(cc.size(760, 135))
	else
		listView:setPositionY(136)
		listView:setContentSize(cc.size(760, 160))
	end

	for i = 1, 4 do
		local panel = self._descPanel:getChildByName("panel_" .. i)

		panel:setVisible(false)
		GameStyle:setCommonOutlineEffect(panel:getChildByName("proportion"), 127)

		local showData = data[i]

		if showData then
			panel:setVisible(true)
			panel:getChildByName("desc"):setString("")
			panel:getChildByName("image"):setVisible(true)
			panel:getChildByName("proportion"):setString(showData.proportion .. "%")

			if showData.type == "pic" then
				local image = panel:getChildByName("image")

				image:loadTexture(ASSET_LANG_COMMON .. showData.desc .. ".png")
				image:ignoreContentAdaptWithSize(true)
				image:setScale(0.7)
				image:setPositionX(35)

				if showData.desc == "common_img_sr" then
					image:setPositionX(28)
				elseif showData.desc == "common_img_sr" then
					image:setPositionX(39)
				end
			elseif showData.type == "str" then
				panel:getChildByName("image"):setVisible(false)
				panel:getChildByName("desc"):removeAllChildren()

				local defaults = {}
				local descLabel = ccui.RichText:createWithXML(Strings:get(showData.desc, {
					fontName = TTF_FONT_FZYH_R
				}), defaults)

				panel:getChildByName("desc"):addChild(descLabel)
				descLabel:setAnchorPoint(cc.p(0, 1))
				descLabel:setPosition(cc.p(0, 11))
			end
		end
	end
end

function RecruitHeroPreviewMediator:setEquipView()
	local descText = self._equipPanel:getChildByName("Text_desc")

	descText:setVisible(false)

	if self._tabType == TabType.kUREquip then
		return
	end

	self._showEquips = {
		{},
		{},
		{},
		{}
	}
	self._showEquips[1] = self._previewData[TabType.kEquip]

	for i = 1, #self._previewData[TabType.kEquip] do
		local data = self._previewData[TabType.kEquip][i]
		local config = ConfigReader:getRecordById("HeroEquipBase", data.code)
		local rareity = tonumber(config.Rareity)

		if rareity == 12 then
			self._showEquips[4][#self._showEquips[4] + 1] = data
		elseif rareity == 13 then
			self._showEquips[3][#self._showEquips[3] + 1] = data
		elseif rareity == 14 then
			self._showEquips[2][#self._showEquips[2] + 1] = data
		end
	end

	local function cellSizeForTable(table, idx)
		return 726, 135
	end

	local function numberOfCellsInTableView(table)
		return math.ceil(#self._showEquips[self._heroType] / 6)
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
		end

		self:createEquipCell(cell, idx + 1, self._showEquips)

		return cell
	end

	local equipList = self._equipPanel:getChildByName("equipList")
	local tableView = cc.TableView:create(equipList:getContentSize())
	self._equipView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setDelegate()
	tableView:setBounceable(false)
	equipList:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:reloadData()
end

function RecruitHeroPreviewMediator:createEquipCell(cell, index, showList)
	cell:removeAllChildren()

	for i = 1, 6 do
		local rewardData = showList[self._heroType][6 * (index - 1) + i]

		if rewardData then
			local panel = self._itemCell:clone()

			panel:setVisible(true)

			local nameLabel = panel:getChildByName("name")

			nameLabel:setString(RewardSystem:getName(rewardData))
			nameLabel:setTextColor(cc.c3b(255, 255, 255))
			nameLabel:setLocalZOrder(10)

			if rewardData.type == 2 then
				GameStyle:setQualityText(nameLabel, RewardSystem:getQuality(rewardData))
			else
				local config = ConfigReader:getRecordById("HeroEquipBase", rewardData.code)

				GameStyle:setRarityText(nameLabel, config.Rareity)
			end

			local icon = IconFactory:createRewardIcon(rewardData, {
				isWidget = true,
				showAmount = false
			})

			IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewardData, {
				needDelay = true
			})
			icon:setAnchorPoint(cc.p(0.5, 0.5))
			panel:addChild(icon)
			icon:setScale(0.8)
			icon:setPosition(cc.p(nameLabel:getPositionX(), 80))
			cell:addChild(panel)
			panel:setPosition(cc.p((i - 1) * self._itemCell:getContentSize().width, 0))
		end
	end
end

function RecruitHeroPreviewMediator:setUREquipView()
	if self._tabType == TabType.kEquip then
		return
	end

	local descText = self._equipPanel:getChildByName("Text_desc")

	descText:setVisible(true)

	self._showUREquips = {
		{},
		{},
		{},
		{},
		{}
	}
	self._showUREquips[1] = self._previewData[TabType.kUREquip]

	for i = 1, #self._previewData[TabType.kUREquip] do
		local data = self._previewData[TabType.kUREquip][i]

		if data.type == 2 then
			self._showUREquips[2][#self._showUREquips[2] + 1] = data
		else
			local config = ConfigReader:getRecordById("HeroEquipBase", data.code)
			local rareity = tonumber(config.Rareity)

			if rareity == 12 then
				self._showUREquips[5][#self._showUREquips[5] + 1] = data
			elseif rareity == 13 then
				self._showUREquips[4][#self._showUREquips[4] + 1] = data
			elseif rareity == 14 then
				self._showUREquips[3][#self._showUREquips[3] + 1] = data
			end
		end
	end

	local function cellSizeForTable(table, idx)
		return 726, 135
	end

	local function numberOfCellsInTableView(table)
		return math.ceil(#self._showUREquips[self._heroType] / 6)
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
		end

		self:createEquipCell(cell, idx + 1, self._showUREquips)

		return cell
	end

	local equipList = self._equipPanel:getChildByName("equipList")

	equipList:setContentSize(cc.size(equipList:getContentSize().width, equipList:getContentSize().height - 15))

	local tableView = cc.TableView:create(equipList:getContentSize())
	self._equipView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setDelegate()
	tableView:setBounceable(false)
	equipList:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:reloadData()
end

function RecruitHeroPreviewMediator:onClickTab(name, tag)
	if not self._ignoreSound then
		AudioEngine:getInstance():playEffect("Se_Click_Tab_1", false)
	else
		self._ignoreSound = false
	end

	self._tabType = self._showType[tag][1]

	self._listView:setVisible(false)
	self._equipPanel:setVisible(false)
	self._heroPanel:setVisible(false)
	self._descPanel:setVisible(false)
	self._selectPanel:setVisible(self._tabType == TabType.kHero or self._tabType == TabType.kEquip or self._tabType == TabType.kUREquip)

	if self._heroView then
		self._heroView:removeFromParent()

		self._heroView = nil
	end

	if self._equipView then
		self._equipView:removeFromParent()

		self._equipView = nil
	end

	if self._tabType == TabType.kHero then
		self:updateHeroesView()
	elseif self._tabType == TabType.kItem then
		self._listView:setVisible(true)
	elseif self._tabType == TabType.kEquip then
		self:updateEquipView()
	elseif self._tabType == TabType.kDesc then
		self._descPanel:setVisible(true)
	elseif self._tabType == TabType.kUREquip then
		self:updateUREquipView()
	end
end

function RecruitHeroPreviewMediator:onClickClose(sender, eventType)
	self:close()
end
