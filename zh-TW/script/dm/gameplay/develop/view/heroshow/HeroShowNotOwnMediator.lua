HeroShowNotOwnMediator = class("HeroShowNotOwnMediator", DmPopupViewMediator, _M)

HeroShowNotOwnMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kBgAnimAndImage = {
	[GalleryPartyType.kBSNCT] = "asset/ui/gallery/party_icon_businiao.png",
	[GalleryPartyType.kXD] = "asset/ui/gallery/party_icon_xide.png",
	[GalleryPartyType.kMNJH] = "asset/ui/gallery/party_icon_monv.png",
	[GalleryPartyType.kDWH] = "asset/ui/gallery/party_icon_dongwenhui.png",
	[GalleryPartyType.kWNSXJ] = "asset/ui/gallery/party_icon_weinasi.png",
	[GalleryPartyType.kSSZS] = "asset/ui/gallery/party_icon_she.png"
}
local kBtnHandlers = {
	["main.backBtn"] = {
		clickAudio = "Se_Click_Close_2",
		func = "onClickClose"
	}
}
local kShowType = {
	kStarBoxHasHero = 3,
	kNotHasHero = 1,
	kHasHero = 2
}

function HeroShowNotOwnMediator:initialize()
	super.initialize(self)
end

function HeroShowNotOwnMediator:dispose()
	self._viewClose = true

	super.dispose(self)
end

function HeroShowNotOwnMediator:onRemove()
	super.onRemove(self)
end

function HeroShowNotOwnMediator:onRegister()
	super.onRegister(self)

	self._bagSystem = self._developSystem:getBagSystem()
	self._heroSystem = self._developSystem:getHeroSystem()

	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.refreshView)
end

function HeroShowNotOwnMediator:enterWithData(data)
	self._heroId = data.id
	self._showType = data.showType or kShowType.kNotHasHero
	self._hideLeftPanel = data.hideLeftPanel
	self._config = PrototypeFactory:getInstance():getHeroPrototype(self._heroId):getConfig()
	self._heroData = self._heroSystem:getHeroInfoById(self._heroId)

	if self._showType == kShowType.kStarBoxHasHero and self._heroData.showType ~= HeroShowType.kHas then
		self._showType = kShowType.kNotHasHero
	end

	self:initView()
end

function HeroShowNotOwnMediator:initView()
	self._main = self:getView():getChildByName("main")
	self._skillTipPanel = self._main:getChildByName("skillTipPanel")

	self._skillTipPanel:setVisible(false)

	local rightPanel = self._main:getChildByFullName("rightPanel")
	local heroIcon = self._main:getChildByName("heroIcon")
	local img = IconFactory:createRoleIconSprite({
		stencil = 1,
		iconType = "Bust5",
		id = self._heroData.roleModel,
		size = cc.size(340, 450)
	})

	img:addTo(heroIcon):center(heroIcon:getContentSize())

	if self._showType == kShowType.kNotHasHero then
		img:setSaturation(-100)
		img:setOpacity(204)
	end

	local partyImg = heroIcon:getChildByName("partyImg")

	if kBgAnimAndImage[self._config.Party] then
		partyImg:setVisible(true)
		partyImg:loadTexture(kBgAnimAndImage[self._config.Party])
	else
		partyImg:setVisible(false)
	end

	self._leftPanel = self._main:getChildByName("leftPanel")
	self._icon = self._leftPanel:getChildByName("icon")
	self._addPanel = self._leftPanel:getChildByName("addImg")
	self._starPanel = self._leftPanel:getChildByName("starPanel")

	self._icon:removeAllChildren()
	self._starPanel:removeAllChildren()
	self._addPanel:getChildByFullName("touchPanel"):addTouchEventListener(function (sender, eventType)
		self:onClickHero(sender, eventType)
	end)

	local progress = self._leftPanel:getChildByFullName("progress")

	GameStyle:setCommonOutlineEffect(progress, 109.64999999999999, 2)

	local name = rightPanel:getChildByName("name")
	local nameBg = rightPanel:getChildByName("nameBg")

	name:setString(Strings:get(self._heroData.name))
	nameBg:setScaleX((name:getContentSize().width + 35) / nameBg:getContentSize().width)

	local scrollView = rightPanel:getChildByName("scrollView")

	scrollView:setScrollBarEnabled(false)

	local desc = rightPanel:getChildByName("desc")

	desc:getVirtualRenderer():setDimensions(236, 0)
	desc:setString(Strings:get(self._config.Desc))
	desc:setLineSpacing(-3)

	local size = desc:getContentSize()
	local line = math.floor(size.height / 24)
	local innerHeight = math.max(136, size.height - line * 3)

	scrollView:setInnerContainerSize(cc.size(236, innerHeight))

	local descClone = desc:clone()

	descClone:setLineSpacing(-3)
	descClone:addTo(scrollView):posite(0, innerHeight)
	desc:setVisible(false)

	local cvnameBg = rightPanel:getChildByName("cvnameBg")
	local cvname = rightPanel:getChildByName("cvname")
	local cvnameStr = Strings:get("Recruit_UI13") .. Strings:get(self._config.CVName)
	local length = utf8.len(cvnameStr)

	if length > 10 then
		cvname:setFontSize(18)
		cvname:getVirtualRenderer():setDimensions(185, 0)
		cvname:setString(cvnameStr)
		cvnameBg:setScaleX((cvname:getContentSize().width + 20) / cvnameBg:getContentSize().width)
		cvnameBg:setScaleY((cvname:getContentSize().height + 35) / cvnameBg:getContentSize().height)
	else
		cvname:setFontSize(22)
		cvname:setString(cvnameStr)
		cvnameBg:setScaleX((cvname:getContentSize().width + 30) / cvnameBg:getContentSize().width)
		cvnameBg:setScaleY((cvname:getContentSize().height + 25) / cvnameBg:getContentSize().height)
	end

	local cost = rightPanel:getChildByFullName("costPanel.label")

	cost:setString(self._heroData.cost)

	local label1 = rightPanel:getChildByFullName("nichePanel.label_1")
	local label2 = rightPanel:getChildByFullName("nichePanel.label_2")
	local positions = string.split(Strings:get(self._config.Position), " ")

	label1:setString(positions[1] or "")
	label2:setString(positions[2] or "")

	local occupationName, occupationImg = GameStyle:getHeroOccupation(self._config.Type)
	local occupationLabel = rightPanel:getChildByFullName("occupationPanel.label")

	occupationLabel:setString(occupationName)

	local occupationIcon = rightPanel:getChildByFullName("occupationPanel.icon")

	occupationIcon:loadTexture(occupationImg)
	occupationIcon:ignoreContentAdaptWithSize(true)

	local heroPrototype = PrototypeFactory:getInstance():getHeroPrototype(self._heroId)
	local skillIds = heroPrototype:getShowSkillIds()
	local skillPanel = rightPanel:getChildByName("skillPanel")

	for i = 1, #skillIds do
		local panel = skillPanel:getChildByName("node_" .. i)

		if panel then
			panel:removeAllChildren()

			local skillId = skillIds[i]
			local newSkillNode = IconFactory:createHeroSkillIcon({
				isLock = false,
				id = skillId
			}, {
				hideLevel = true,
				isWidget = true
			})

			newSkillNode:addTo(panel):center(panel:getContentSize())
			newSkillNode:setScale(0.7)
			panel:addClickEventListener(function ()
				self:onClickSkill(skillId)
			end)
		end
	end

	local skillTouchPanel = self._skillTipPanel:getChildByName("skillTouchPanel")

	skillTouchPanel:addClickEventListener(function ()
		if self._skillTipPanel:isVisible() then
			self._skillTipPanel:setVisible(false)
		end
	end)
	self:refreshView()
end

function HeroShowNotOwnMediator:refreshView()
	self._heroData = self._heroSystem:getHeroInfoById(self._heroId)
	local heroPrototype = PrototypeFactory:getInstance():getHeroPrototype(self._heroId)
	local progress = self._leftPanel:getChildByFullName("progress")

	if self._showType == kShowType.kNotHasHero then
		self._leftPanel:setVisible(true)
		self._addPanel:setVisible(true)
		self._starPanel:setVisible(false)
		self._icon:removeAllChildren()

		local hasNum = self._heroSystem:getHeroDebrisCount(self._heroId)
		local needNum = heroPrototype:getStarNumByCompose()

		progress:setString(hasNum .. "/" .. needNum)

		local icon = IconFactory:createIcon({
			id = self._heroData.fragId
		}, {
			showAmount = false
		})

		icon:setScale(0.5)
		icon:addTo(self._icon):posite(0, 7)
	elseif self._showType == kShowType.kHasHero then
		self._leftPanel:setVisible(false)
	elseif self._showType == kShowType.kStarBoxHasHero then
		local hero = self._heroSystem:getHeroById(self._heroId)

		self._leftPanel:setVisible(true)
		self._leftPanel:getChildByFullName("image1"):setVisible(not hero:isMaxStar())
		self._leftPanel:getChildByFullName("image2"):setVisible(not hero:isMaxStar())
		progress:setVisible(not hero:isMaxStar())
		self._addPanel:setVisible(not hero:isMaxStar())
		self._icon:removeAllChildren()
		self._starPanel:setVisible(true)
		self._starPanel:removeAllChildren()

		local offsetX = 15

		for i = 1, self._heroData.maxStar do
			local path, zOrder = nil

			if i <= self._heroData.star then
				path = "img_yinghun_img_star_full.png"
				zOrder = 105
			elseif i == self._heroData.star + 1 and self._heroData.littleStar then
				path = "img_yinghun_img_star_half.png"
				zOrder = 100
			else
				path = "img_yinghun_img_star_empty.png"
				zOrder = 99
			end

			if hero:getAwakenStar() > 0 then
				path = "jx_img_star.png"
				zOrder = 100
			end

			local star = cc.Sprite:createWithSpriteFrameName(path)

			star:addTo(self._starPanel)
			star:setGlobalZOrder(zOrder)
			star:setPosition(cc.p(offsetX + 30 * (i - 1), 3))
			star:setScale(0.5)
		end

		if not hero:isMaxStar() then
			local nextIsMiniStar = hero:getNextIsMiniStar()

			if self._heroData.littleStar and not nextIsMiniStar then
				self._addPanel:setVisible(false)

				local hasNum = 0
				local needNum = hero:getStarStive()

				progress:setString(hasNum .. "/" .. needNum)

				local icon = ccui.ImageView:create("occupation_all.png", 1)

				icon:addTo(self._icon):posite(0, 0)
			else
				local hasNum = self._heroSystem:getHeroDebrisCount(self._heroId)
				local needNum = heroPrototype:getStarCostFragByStar(hero:getNextStarId())
				local icon = IconFactory:createIcon({
					id = self._heroData.fragId
				}, {
					showAmount = false
				})

				icon:setScale(0.5)
				icon:addTo(self._icon):posite(0, 7)
				progress:setString(hasNum .. "/" .. needNum)
			end
		end
	end
end

function HeroShowNotOwnMediator:updateSkillDesc(skillId)
	local config = ConfigReader:getRecordById("Skill", skillId)
	local infoNode = self._skillTipPanel:getChildByFullName("infoNode")
	local iconPanel = infoNode:getChildByFullName("iconPanel")

	iconPanel:removeAllChildren()

	local newSkillNode = IconFactory:createHeroSkillIcon({
		isLock = false,
		id = skillId
	}, {
		hideLevel = true,
		isWidget = true
	})

	newSkillNode:addTo(iconPanel):center(iconPanel:getContentSize())
	newSkillNode:setScale(0.85)

	local typeIcon = infoNode:getChildByFullName("icon")

	typeIcon:setVisible(false)

	local name = infoNode:getChildByFullName("name")

	name:setString(Strings:get(config.Name))

	local bg = self._skillTipPanel:getChildByName("Image_bg")
	local desc = self._skillTipPanel:getChildByName("desc")
	local str = ""
	local attrNum = self._config.SkillRate

	if AttributeCategory:getAttNameAttend("SKILLRATE") ~= "" then
		attrNum = attrNum * 100 .. "%"
	end

	local style = {
		SkillRate = attrNum,
		fontName = TTF_FONT_FZYH_M
	}

	if config.Desc and config.Desc ~= "" then
		local descStr = ConfigReader:getEffectDesc("Skill", config.Desc, skillId, 1, style)
		str = descStr
	end

	local skillProto = PrototypeFactory:getInstance():getSkillPrototype(skillId)

	if skillProto then
		local attrDescs = skillProto:getAttrDescs(1) or {}

		if attrDescs[1] then
			str = str .. attrDescs[1]
		end
	end

	desc:removeAllChildren()
	desc:setString("")

	local label = ccui.RichText:createWithXML(str, {})

	label:renderContent(290, 0)
	label:setAnchorPoint(cc.p(0, 0))
	label:addTo(desc)
	label:setPosition(cc.p(0, 0))

	local height = label:getContentSize().height + 114

	bg:setContentSize(cc.size(307, height))
	infoNode:setPositionY(height - 94)
end

function HeroShowNotOwnMediator:onClickHero(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		if self._heroData.showType == HeroShowType.kCanComp then
			local function callBack(data)
				local view = self:getInjector():getInstance("newHeroView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
					ignoreNewRed = true,
					heroId = data.id
				}))
				self:close()
			end

			self._bagSystem:requestHeroCompose(self._config.ItemId, callBack)
		elseif self._heroData.showType == HeroShowType.kNotOwn then
			local needCount = self._heroSystem:getHeroComposeFragCount(self._heroId)
			local hasCount = self._heroSystem:getHeroDebrisCount(self._heroId)
			local param = {
				itemId = self._config.ItemId,
				hasNum = hasCount,
				needNum = needCount
			}
			local view = self:getInjector():getInstance("sourceView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, param))
		elseif self._heroData.showType == HeroShowType.kHas then
			local hasCount = self._heroSystem:getHeroDebrisCount(self._heroId)
			local heroPrototype = PrototypeFactory:getInstance():getHeroPrototype(self._heroId)
			local hero = self._heroSystem:getHeroById(self._heroId)
			local needCount = heroPrototype:getStarCostFragByStar(hero:getNextStarId())
			local param = {
				itemId = self._heroData.fragId,
				hasNum = hasCount,
				needNum = needCount
			}
			local view = self:getInjector():getInstance("sourceView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, param))
		end
	end
end

function HeroShowNotOwnMediator:onClickSkill(skillId)
	self._skillTipPanel:setVisible(true)
	self:updateSkillDesc(skillId)
end

function HeroShowNotOwnMediator:onClickClose()
	self:close()
end
