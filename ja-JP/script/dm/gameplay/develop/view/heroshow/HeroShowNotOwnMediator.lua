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
local kShowType = {
	kStarBoxHasHero = 3,
	kNotHasHero = 1,
	kHasHero = 2
}
local kHeroRarityAnim = {
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
	"r_yingxiongxuanze",
	"r_yingxiongxuanze",
	"sr_yingxiongxuanze",
	"ssr_yingxiongxuanze",
	"ssr_yingxiongxuanze"
}
local kBtnHandlers = {
	["main.backBtn"] = {
		clickAudio = "Se_Click_Close_2",
		func = "onBackClicked"
	}
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
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.refreshView)

	self._heroSystem = self._developSystem:getHeroSystem()
	self._bagSystem = self._developSystem:getBagSystem()
end

function HeroShowNotOwnMediator:enterWithData(data)
	self._heroId = data.id
	self._modelId = data.modelId
	self._showType = data.showType or kShowType.kNotHasHero
	self._hideLeftPanel = data.hideLeftPanel
	self._attrAdds = data.attrAdds or {}
	self._config = PrototypeFactory:getInstance():getHeroPrototype(self._heroId):getConfig()
	self._heroData = self._heroSystem:getHeroInfoById(self._heroId)

	if self._showType == kShowType.kStarBoxHasHero and self._heroData.showType ~= HeroShowType.kHas then
		self._showType = kShowType.kNotHasHero
	end

	self:initView()
end

function HeroShowNotOwnMediator:initView()
	self._main = self:getView():getChildByName("main")

	self._main:getChildByName("maskLayer"):addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			self:close()
		end
	end)

	local rightPanel = self._main:getChildByFullName("rightPanel")
	local heroIcon = self._main:getChildByFullName("heroView.heroIcon")
	local img = IconFactory:createRoleIconSprite({
		stencil = 1,
		iconType = "Bust5",
		id = self._modelId or self._heroData.roleModel,
		size = cc.size(340, 450)
	})

	img:addTo(heroIcon):center(heroIcon:getContentSize())

	local heroRarity = self._main:getChildByFullName("heroView.rarity")

	heroRarity:removeAllChildren()

	local rarityAnim = cc.MovieClip:create(kHeroRarityAnim[self._heroData.rareity])

	rarityAnim:addTo(heroRarity):center(heroRarity:getContentSize())
	rarityAnim:offset(0, 2)

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

	self._leftPanel = self._main:getChildByFullName("heroView.leftPanel")
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

	local occupation = rightPanel:getChildByName("type")
	local occupationName, occupationImg = GameStyle:getHeroOccupation(self._heroData.type)

	occupation:loadTexture(occupationImg)

	local cost = rightPanel:getChildByFullName("costBg.cost")

	cost:setString(tostring(self._heroData.cost))

	local name = rightPanel:getChildByName("name")
	local nameBg = rightPanel:getChildByName("nameBg")

	name:setString(Strings:get(self._heroData.name))
	nameBg:setScaleX((name:getContentSize().width + 75) / nameBg:getContentSize().width)

	local costBg = rightPanel:getChildByFullName("costBg")

	costBg:setPositionX(name:getContentSize().width + 50)

	local atkText = rightPanel:getChildByFullName("attr_atk.text")

	atkText:setString(tostring(self._heroData.atk))

	local hpText = rightPanel:getChildByFullName("attr_hp.text")

	hpText:setString(tostring(self._heroData.hp))

	local defText = rightPanel:getChildByFullName("attr_def.text")

	defText:setString(tostring(self._heroData.def))

	local speedText = rightPanel:getChildByFullName("attr_speed.text")

	speedText:setString(tostring(self._heroData.speed))

	local combatText = rightPanel:getChildByFullName("combatNode.combat")
	local label = combatText:getChildByFullName("CombatLabel")

	if not label then
		local fntFile = "asset/font/heroLevel_font.fnt"
		label = ccui.TextBMFont:create("", fntFile)

		label:addTo(combatText)
		label:setName("CombatLabel")
	end

	label:setString(tostring(self._heroData.combat))

	local label1 = rightPanel:getChildByFullName("nichePanel.label_1")
	local label2 = rightPanel:getChildByFullName("nichePanel.label_2")
	local positions = string.split(Strings:get(self._config.Position), " ")

	label1:setString(positions[1] or "")
	label2:setString(positions[2] or "")

	local heroPrototype = PrototypeFactory:getInstance():getHeroPrototype(self._heroId)
	local skillIds = heroPrototype:getShowSkillIds()
	local skillPanel = rightPanel:getChildByName("skillPanel")
	local skillList = skillPanel:getChildByName("skillList")
	local skillCell = self:getView():getChildByName("skillCellClone")

	skillList:removeAllChildren()
	skillList:setScrollBarEnabled(false)

	for i = 1, #skillIds do
		local cell = skillCell:clone()
		local panel = cell:getChildByName("icon")

		panel:removeAllChildren()

		local skillId = skillIds[i]
		local config = ConfigReader:getRecordById("Skill", skillId)
		local newSkillNode = IconFactory:createHeroSkillIcon({
			isLock = false,
			id = skillId
		}, {
			hideLevel = true,
			isWidget = true
		})

		newSkillNode:addTo(panel):center(panel:getContentSize())
		newSkillNode:setScale(0.7)

		local skillAnimPanel = cell:getChildByName("skillAnim")

		skillAnimPanel:setVisible(true)

		local skillPanel1 = skillAnimPanel:getChildByFullName("skillTypeIcon")

		skillPanel1:setVisible(true)

		local skillPanel2 = skillAnimPanel:getChildByFullName("skillTypeBg")

		skillPanel2:setVisible(true)

		local skillType = config.Type
		local icon1, icon2 = self._heroSystem:getSkillTypeIcon(skillType)
		local skillTypeIcon = skillPanel1:getChildByFullName("icon")

		skillTypeIcon:loadTexture(icon1)

		local skillTypeBg = skillPanel2:getChildByFullName("bg")

		skillTypeBg:loadTexture(icon2)
		skillTypeBg:setCapInsets(cc.rect(4, 15, 6, 16))

		local typeNameLabel = skillPanel2:getChildByFullName("skillType")

		if self._isMaster then
			typeNameLabel:setString(self._masterSystem:getSkillTypeName(skillType))
		else
			typeNameLabel:setString(self._heroSystem:getSkillTypeName(skillType))
		end

		typeNameLabel:setTextColor(GameStyle:getSkillTypeColor(skillType))

		local width = typeNameLabel:getContentSize().width + 30

		skillTypeBg:setContentSize(cc.size(width, 38))

		local nameText = cell:getChildByName("name")
		local descText = cell:getChildByName("desc")

		nameText:setString(Strings:get(config.Name))
		nameText:setTextAreaSize(cc.size(215, 25))
		nameText:getVirtualRenderer():setOverflow(cc.LabelOverflow.SHRINK)
		nameText:setTextVerticalAlignment(cc.TEXT_ALIGNMENT_CENTER)

		local str = ""
		local attrNum = tostring(self._config.SkillRate * 100) .. "%"
		local style = {
			fontSize = 14,
			SkillRate = attrNum,
			fontName = TTF_FONT_FZYH_R
		}

		if config.Desc and config.Desc ~= "" then
			local descStr = ConfigReader:getEffectDesc("Skill", config.Desc, skillId, 1, style)
			str = descStr
		end

		descText:removeAllChildren()
		descText:setString("")

		local label = ccui.RichText:createWithXML(str, {})

		label:renderContent(217, 0)
		label:setAnchorPoint(cc.p(0, 1))
		label:addTo(descText)
		label:setPosition(cc.p(0, 0))

		local height = math.max(label:getContentSize().height + 30, 87)

		cell:setContentSize(cc.size(305, math.max(87, height)))
		cell:getChildByName("bg"):setContentSize(cc.size(305, math.max(87, height)))
		cell:getChildByName("bg"):setPositionY(height)
		cell:getChildByName("name"):setPositionY(height - 2)
		cell:getChildByName("desc"):setPositionY(height - 25)
		cell:getChildByName("icon"):setPositionY(height - 80)
		skillAnimPanel:setPositionY(height - 60)
		skillList:pushBackCustomItem(cell)
	end

	local heroView = self._main:getChildByName("heroView")
	local rightPanel = self._main:getChildByName("rightPanel")
	local effectPanel = self._main:getChildByName("effectPanel")
	local effectNum = #self._attrAdds

	if effectNum <= 0 then
		effectPanel:setVisible(false)
		heroView:setPositionX(396)
		rightPanel:setPositionX(743)
	else
		effectPanel:setVisible(true)
		heroView:setPositionX(256)
		rightPanel:setPositionX(603)

		local effectCell = self:getView():getChildByName("effectCellClone")
		local effectList = effectPanel:getChildByName("effectList")

		effectList:removeAllChildren()
		effectList:setScrollBarEnabled(false)

		for i = 1, effectNum do
			local cell = effectCell:clone()

			cell:getChildByName("name"):setString(self._attrAdds[i].title)

			local descLabel = cell:getChildByName("desc")

			descLabel:setString(self._attrAdds[i].desc)

			if self._attrAdds[i].richTextType then
				local richText = ccui.RichText:createWithXML(desc, {})

				richText:setAnchorPoint(descLabel:getAnchorPoint())
				richText:setPosition(cc.p(descLabel:getPosition()))
				richText:addTo(descLabel:getParent())
				richText:renderContent(descLabel:getContentSize().width, 0, true)
				richText:setString(self._attrAdds[i].desc)
				descLabel:setVisible(false)
			end

			local awakenBuff = cell:getChildByFullName("icon.awakenBuff")
			local starBuff = cell:getChildByFullName("icon.starBuff")
			local head = cell:getChildByFullName("icon.Head")
			local skill = cell:getChildByFullName("icon.skill")

			if self._attrAdds[i].type == StageAttrAddType.HERO then
				head:setVisible(true)

				local info = {
					id = self._heroData.roleModel
				}
				local heroImg = IconFactory:createRoleIconSprite(info)

				heroImg:addTo(head):center(head:getContentSize()):setScale(0.27):offset(-1, 0)
			elseif self._attrAdds[i].type == StageAttrAddType.HERO_TYPE then
				head:setVisible(true)

				local pic = ccui.ImageView:create(occupationImg)

				pic:addTo(head):center(head:getContentSize()):setScale(0.8):offset(-2, -4)
			elseif self._attrAdds[i].type == StageAttrAddType.HERO_BUFF then
				head:setVisible(true)
				head:loadTexture(self._attrAdds[i].icon)
				head:setScale(0.8)
			elseif self._attrAdds[i].type == StageAttrAddType.HERO_FULL_STAR then
				starBuff:setVisible(true)
			elseif self._attrAdds[i].type == StageAttrAddType.HERO_AWAKE then
				awakenBuff:setVisible(true)
			end

			effectList:pushBackCustomItem(cell)
		end

		local listHeight = math.min(effectNum * 87, 306)

		effectPanel:setContentSize(cc.size(330, listHeight + 92))
		effectPanel:setPositionY(listHeight + 200)
		effectPanel:getChildByName("bg"):setContentSize(cc.size(330, listHeight + 92))
		effectPanel:getChildByName("bg"):setPositionY(listHeight + 90)
		effectPanel:getChildByName("title"):setPositionY(listHeight + 52)
		effectPanel:getChildByName("effectList"):setContentSize(cc.size(330, listHeight + 10))
		effectPanel:getChildByName("effectList"):setPositionY(listHeight + 30)
	end

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

function HeroShowNotOwnMediator:onBackClicked()
	self:close()
end
