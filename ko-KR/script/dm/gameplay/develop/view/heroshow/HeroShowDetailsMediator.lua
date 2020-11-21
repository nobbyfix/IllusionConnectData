HeroShowDetailsMediator = class("HeroShowDetailsMediator", DmAreaViewMediator, _M)

HeroShowDetailsMediator:has("_mainPanel", {
	is = "rw"
})
HeroShowDetailsMediator:has("_heroData", {
	is = "rw"
})
HeroShowDetailsMediator:has("_heroPrototype", {
	is = "rw"
})
HeroShowDetailsMediator:has("_heroId", {
	is = "rw"
})
HeroShowDetailsMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
HeroShowDetailsMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")

local kBtnHandlers = {}
local kHeroRarityAnim = {
	[15] = {
		-20
	},
	[14] = {
		-20
	},
	[13] = {
		-10
	},
	[12] = {
		0
	},
	[11] = {
		0
	}
}

function HeroShowDetailsMediator:initialize()
	super.initialize(self)
end

function HeroShowDetailsMediator:dispose()
	super.dispose(self)
end

function HeroShowDetailsMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._bagSystem = self._developSystem:getBagSystem()
	self._heroSystem = self._developSystem:getHeroSystem()
	self._equipSystem = self._developSystem:getEquipSystem()

	self:setupTopInfoWidget()
end

function HeroShowDetailsMediator:enterWithData(data)
	self._heroId = data.heroId
	self._heroData = self._heroSystem:getHeroById(data.heroId)
	self._heroPrototype = PrototypeFactory:getInstance():getHeroPrototype(data.heroId)
	self._animType = 1
	self._isAnimStop = true

	self:initView()
	self:showAnimByType(self._animType)
end

function HeroShowDetailsMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")
	local config = {
		currencyInfo = {},
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onBackBtn, self)
		}
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function HeroShowDetailsMediator:initView()
	self._mainPanel = self:getView():getChildByFullName("mainpanel")
	self._tipArrow = self._mainPanel:getChildByFullName("tipArrow")

	self._tipArrow:removeAllChildren()

	local anim = cc.MovieClip:create("sjt_yinglingzhuangbei")

	anim:addTo(self._tipArrow)
	anim:setRotation(90)

	self._touchPanel = self:getView():getChildByFullName("touchPanel")

	self._mainPanel:setTouchEnabled(false)
	self._touchPanel:addTouchEventListener(function (sender, eventType)
		self:onTouchMainPanel(sender, eventType)
	end)

	self._roleNode = self._mainPanel:getChildByName("roleNode")
	local realImage = IconFactory:createRoleIconSprite({
		useAnim = true,
		iconType = "Bust4",
		id = self._heroData:getModel()
	})

	realImage:setAnchorPoint(0.5, 0.5)
	realImage:setPosition(cc.p(125, -155))
	self._roleNode:addChild(realImage)

	self._image3 = self._mainPanel:getChildByName("image3")
	self._image4 = self._mainPanel:getChildByName("image4")
	self._image5 = self._mainPanel:getChildByName("image5")
	self._image6 = self._mainPanel:getChildByName("image6")
	self._image7 = self._mainPanel:getChildByName("image7")
	local combat, attrData = self._heroData:getCombat()
	self._namePanel = self._mainPanel:getChildByFullName("namePanel")
	local name, _ = self._heroData:getName()
	local qualityLevel = self._heroData:getQualityLevel() == 0 and "" or "+" .. self._heroData:getQualityLevel()
	local nameText = self._namePanel:getChildByFullName("nameText")
	local nameBg = self._namePanel:getChildByFullName("nameBg")

	nameText:setString(name .. qualityLevel)
	GameStyle:setHeroNameByQuality(nameText, self._heroData:getQuality())
	self._namePanel:getChildByFullName("costBg.costnumlabel"):setString(self._heroData:getCost())
	nameBg:setScaleX((nameText:getContentSize().width + 30) / nameBg:getContentSize().width)

	self._combatPanel = self._mainPanel:getChildByFullName("combatPanel")
	local combatLabel = self._combatPanel:getChildByFullName("combatLabel")

	combatLabel:setString(combat)

	local lineGradiantVec2 = {
		{
			ratio = 0.5,
			color = cc.c4b(255, 255, 255, 255)
		},
		{
			ratio = 1,
			color = cc.c4b(120, 120, 120, 255)
		}
	}

	combatLabel:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
		x = 0,
		y = -1
	}))

	self._attibutePanel = self._mainPanel:getChildByFullName("descPanel")

	self._attibutePanel:getChildByFullName("des_1.text"):setString(self._heroData:getAttack())
	self._attibutePanel:getChildByFullName("des_2.text"):setString(self._heroData:getDefense())
	self._attibutePanel:getChildByFullName("des_3.text"):setString(self._heroData:getHp())
	self._attibutePanel:getChildByFullName("des_4.text"):setString(self._heroData:getSpeed())

	self._ralityPanel = self._mainPanel:getChildByFullName("ralityPanel")
	local rarityIcon = self._ralityPanel:getChildByFullName("rarityIcon")

	rarityIcon:removeAllChildren()

	local rarity = IconFactory:getHeroRarityAnim(self._heroData:getRarity())

	rarity:addTo(rarityIcon):offset(kHeroRarityAnim[self._heroData:getRarity()][1] + 50, 20)

	self._starPanel1 = self._ralityPanel:getChildByFullName("starPanel_1")

	self._starPanel1:removeAllChildren()

	local mc = cc.MovieClip:create("xx_yinghunxinxi")

	mc:addTo(self._starPanel1)
	mc:setName("StarAnim")
	mc:addCallbackAtFrame(15, function ()
		mc:stop()
	end)
	mc:setPosition(cc.p(86, 270))

	for i = 1, self._heroData:getMaxStar() do
		if i <= self._heroData:getStar() then
			local anim1 = nil

			if self._heroData:getAwakenStar() > 0 then
				anim1 = cc.MovieClip:create("juexingxingxing_yinghunshengxing")
			else
				anim1 = cc.MovieClip:create("yh_aa_yinghunshengxing")
			end

			anim1:addTo(mc:getChildByName("star_" .. i))
			anim1:addEndCallback(function ()
				anim1:gotoAndPlay(30)
			end)
			anim1:gotoAndPlay(1)
			anim1:setRotation(10)
			anim1:setScale(0.9)
		elseif i == self._heroData:getStar() + 1 and self._heroData:getLittleStar() then
			local anim1 = cc.MovieClip:create("shengdaobanxing_yinghunshengxing")

			anim1:addTo(mc:getChildByName("star_" .. i))
			anim1:addEndCallback(function ()
				anim1:gotoAndPlay(20)
			end)
			anim1:gotoAndPlay(1)
			anim1:setRotation(10)
			anim1:setScale(0.9)
			anim1:offset(-2, -12)
		else
			break
		end
	end

	self._starPanel2 = self._ralityPanel:getChildByFullName("starPanel_2")

	for i = 1, HeroStarCountMax do
		local node = self._starPanel2:getChildByFullName("starBg.star_" .. i)

		node:setVisible(i <= self._heroData:getMaxStar())

		local path = nil

		if i <= self._heroData:getStar() then
			path = "img_yinghun_img_star_full.png"
		elseif i == self._heroData:getStar() + 1 and self._heroData:getLittleStar() then
			path = "img_yinghun_img_star_half.png"
		else
			path = "img_yinghun_img_star_empty.png"
		end

		if self._heroData:getAwakenStar() > 0 then
			path = "jx_img_star.png"
		end

		local star = ccui.ImageView:create(path, 1)

		star:addTo(node)
		star:setScale(0.6)
	end

	self._starPanel2:getChildByFullName("combatBg.combat_number"):setString(combat)

	self._typePanel = self._mainPanel:getChildByFullName("typePanel")

	self._typePanel:getChildByFullName("heroType"):setString(self._heroData:getPosition())

	local occupationName, occupationImg = GameStyle:getHeroOccupation(self._heroData:getType())

	self._typePanel:getChildByFullName("typeImg"):loadTexture(occupationImg)

	self._skillPanel = self._mainPanel:getChildByFullName("skillPanel")

	self._skillPanel:setSwallowTouches(true)
	self._skillPanel:addClickEventListener(function ()
	end)
	self:initSkill()
	self:initEquip()
end

function HeroShowDetailsMediator:initSkill()
	local skillIds = self._heroData:getShowSkillIds()
	local num = math.min(4, #skillIds)
	local skills = {}

	for i = 1, num do
		local skillId = skillIds[i]
		local skill = self._heroData:getSkillById(skillId)

		table.insert(skills, skill)
	end

	for i = 1, 6 do
		local panel = self._skillPanel:getChildByFullName("skill_" .. i)

		if i >= 5 then
			panel:setVisible(false)
		else
			panel:getChildByName("node"):removeAllChildren()
			panel:getChildByName("node"):setScale(0.7)

			local skill = skills[i]
			local skillId = skill:getSkillId()
			local isLock = not skill:getEnable()
			local newSkillNode = IconFactory:createHeroSkillIcon({
				id = skillId,
				isLock = isLock
			}, {
				hideLevel = true,
				isWidget = true
			})

			panel:getChildByName("node"):addChild(newSkillNode)
			newSkillNode:setPosition(cc.p(45, 45))
			panel:getChildByName("level"):setString("")
			panel:getChildByName("name"):setString(skill:getName())

			local iconNode = panel:getChildByName("node")

			iconNode:setTouchEnabled(true)
			iconNode:addClickEventListener(function ()
				self:onClickSkill(skill)
			end)
		end
	end
end

function HeroShowDetailsMediator:onClickSkill(skill)
	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)

	if not self._skillWidget then
		self._skillWidget = self:autoManageObject(self:getInjector():injectInto(SkillDescWidget:new(SkillDescWidget:createWidgetNode(), {
			skill = skill,
			mediator = self
		})))

		self._skillWidget:getView():addTo(self:getView()):posite(819, 117)
	end

	self._skillWidget:refreshInfo(skill, self._heroData)
	self._skillWidget:show()
end

function HeroShowDetailsMediator:initEquip()
	self._equiplPanel = self._mainPanel:getChildByName("equiplPanel")
	local hasEquip = false
	local i = 0

	for index = 1, #EquipPositionToType do
		local panel = self._equiplPanel:getChildByName("node_" .. index)
		local equipType = EquipPositionToType[index]
		local equipId = self._heroData:getEquipIdByType(equipType)

		panel:removeAllChildren()

		local equipIcon = nil

		if equipId then
			i = i + 1
			hasEquip = true
			local equipData = self._equipSystem:getEquipById(equipId)
			local rarity = equipData:getRarity()
			local level = equipData:getLevel()
			local star = equipData:getStar()
			local param = {
				id = equipData:getEquipId(),
				level = level,
				star = star,
				rarity = rarity
			}
			equipIcon = IconFactory:createEquipIcon(param, {
				hideLevel = true
			})

			equipIcon:setScale(0.6)
			panel:addClickEventListener(function (sender, eventType)
				AudioEngine:getInstance():playEffect("Se_Click_Common_1")

				local param = {
					equipId = equipId
				}

				self._equipSystem:tryEnter(param)
			end)
		else
			equipIcon = IconFactory:createEquipEmpty(equipType)
		end

		equipIcon:addTo(panel):center(panel:getContentSize())
	end

	self._equiplPanel:getChildByName("descText"):setString(self._heroData:getDesc())
end

function HeroShowDetailsMediator:createEquipRelationPanel(data, parent)
	local equipData = data.equip
	local panel = parent:getChildByFullName("node.bg")

	panel:removeAllChildren()

	local info = {
		clipType = 1,
		star = equipData.star,
		id = equipData.id
	}
	local icon = IconFactory:createEquipPic(info)
	icon = IconFactory:addStencilForIcon(icon, info.clipType, cc.size(100, 100))

	icon:setScale(0.64)
	icon:addTo(panel):center(panel:getContentSize())
end

function HeroShowDetailsMediator:createBasicPanel(data, parent)
	local unlockNum = data.unlockNum

	for i = 1, 7 do
		local panel = parent:getChildByName("icon_" .. i)

		panel:getChildByName("image"):setVisible(i <= unlockNum)
	end
end

function HeroShowDetailsMediator:refreshDescPanel(level, config, parent)
	parent:getChildByName("text"):setString("")
	parent:getChildByName("text"):removeAllChildren()

	local function createShortCondDesc(level, config, developSystem, parent, width, offsetY)
		local maxLevel = config.EffectLevel

		if maxLevel < level then
			level = maxLevel or level
		end

		local color = Relation:getFontColorByLevel(level, 1)

		if level == 0 then
			level = 1
		end

		config.highlightColor = level == 0 and "#AAF014" or "#AAF014"
		local descLabel = ccui.RichText:createWithXML(Relation:getShortEffectDesc(level, config, {
			fontColor = color,
			developSystem = developSystem
		}, 1), {})

		descLabel:addTo(parent, 1):offset(0, offsetY)
		descLabel:renderContent(width, 0)
		descLabel:setAnchorPoint(cc.p(0, 1))

		return descLabel
	end

	local width = 210
	local offsetY = 45

	if config.Type == RelationType.kGlobal then
		width = 430
		offsetY = 35
	elseif config.Type == RelationType.kHero then
		width = 330
		offsetY = 35
	end

	createShortCondDesc(level, config, self._developSystem, parent:getChildByName("text"), width, offsetY)
end

function HeroShowDetailsMediator:showAnimByType(animType)
	self._isAnimStop = false

	local function callBack()
		self._isAnimStop = true
	end

	if animType == 1 then
		self:playAnim1(callBack)
	elseif animType == 2 then
		self:playAnim2(callBack)
	elseif animType == 3 then
		self:playAnim3(callBack)
	end

	self._tipArrow:setVisible(animType ~= 2)
end

function HeroShowDetailsMediator:playAnim1(callBack)
	self._roleNode:setScale(1)
	self._roleNode:setPosition(cc.p(1573, 300))

	local moveto = cc.MoveTo:create(0.12, cc.p(700, 300))
	local moveto1 = cc.MoveTo:create(0.08, cc.p(750, 300))
	local seq = cc.Sequence:create(moveto, moveto1)

	self._roleNode:runAction(seq)
	self._starPanel1:setVisible(false)
	self._namePanel:getChildByName("costBg"):setVisible(false)
	self._namePanel:getChildByName("nameText"):setVisible(false)
	self._combatPanel:setPosition(cc.p(333, 522))
	self._combatPanel:setOpacity(0)
	self._attibutePanel:setPosition(cc.p(231, 412))
	self._attibutePanel:setOpacity(0)
	self._typePanel:setPosition(cc.p(340, 303))
	self._typePanel:setOpacity(0)
	self._starPanel1:setPosition(cc.p(0, 0))
	self._image3:setPosition(cc.p(840, -532))

	local delaytime = cc.DelayTime:create(0.2)
	moveto = cc.MoveTo:create(0.2, cc.p(387, 240))
	local callfunc = cc.CallFunc:create(function ()
		self._namePanel:getChildByName("costBg"):setVisible(true)
		self._namePanel:getChildByName("nameText"):setVisible(true)
		self._combatPanel:fadeIn({
			time = 0.1
		})

		local delaytime1 = cc.DelayTime:create(0.1)
		local fadeIn = cc.FadeIn:create(0.1)
		seq = cc.Sequence:create(delaytime1, fadeIn)

		self._attibutePanel:runAction(seq)

		delaytime1 = cc.DelayTime:create(0.2)
		fadeIn = cc.FadeIn:create(0.1)
		seq = cc.Sequence:create(delaytime1, fadeIn)

		self._typePanel:runAction(seq)
	end)
	seq = cc.Sequence:create(delaytime, moveto, callfunc)

	self._image3:runAction(seq)
	self._namePanel:setPosition(cc.p(-12, 895))

	moveto = cc.MoveTo:create(0.4, cc.p(130, 666))
	seq = cc.Sequence:create(delaytime, moveto)

	self._namePanel:runAction(seq)
	self._image6:setPosition(cc.p(-378, 1068))

	moveto = cc.MoveTo:create(0.2, cc.p(85, 287))
	seq = cc.Sequence:create(delaytime, moveto)

	self._image6:runAction(seq)
	self._image7:setPosition(cc.p(756, -579))

	moveto = cc.MoveTo:create(0.4, cc.p(233, 257))
	seq = cc.Sequence:create(delaytime, moveto)

	self._image7:runAction(seq)

	delaytime = cc.DelayTime:create(0.6)

	self._ralityPanel:getChildByFullName("rarityIcon"):setScale(0)

	local scale1 = cc.ScaleTo:create(0.2, 1.3)
	local scale2 = cc.ScaleTo:create(0.1, 1)
	seq = cc.Sequence:create(delaytime, scale1, scale2)

	self._ralityPanel:getChildByFullName("rarityIcon"):runAction(seq)
	self._starPanel2:setOpacity(0)

	local fadeIn = cc.FadeIn:create(0.1)
	seq = cc.Sequence:create(delaytime, fadeIn)

	self._starPanel2:runAction(seq)

	callfunc = cc.CallFunc:create(function ()
		self._starPanel1:setVisible(true)
		self._starPanel1:getChildByName("StarAnim"):gotoAndPlay(0)
	end)
	seq = cc.Sequence:create(delaytime, callfunc)

	self._starPanel1:runAction(seq)

	delaytime = cc.DelayTime:create(0.5)

	self._skillPanel:setOpacity(0)
	self._skillPanel:setPosition(cc.p(158, 17))

	fadeIn = cc.FadeIn:create(0.1)
	seq = cc.Sequence:create(delaytime, fadeIn)

	self._skillPanel:runAction(seq)

	for i = 1, 6 do
		local panel = self._skillPanel:getChildByFullName("skill_" .. i)

		panel:setScale(0)

		local time = 0.5 + (i - 1) * 0.08
		delaytime = cc.DelayTime:create(time)
		scale1 = cc.ScaleTo:create(0.1, 1.1)
		scale2 = cc.ScaleTo:create(0.05, 1)
		seq = cc.Sequence:create(delaytime, scale1, scale2)

		panel:runAction(seq)
	end

	callfunc = cc.CallFunc:create(callBack)
	delaytime = cc.DelayTime:create(1.1)
	seq = cc.Sequence:create(delaytime, callfunc)

	self._mainPanel:runAction(seq)
end

function HeroShowDetailsMediator:playAnim2(callBack)
	local moveto = cc.MoveTo:create(0.6, cc.p(-378, 1068))

	self._image6:runAction(moveto)

	moveto = cc.MoveTo:create(0.6, cc.p(-225, 1008))

	self._image7:runAction(moveto)
	self._combatPanel:setPosition(cc.p(333, 522))

	moveto = cc.MoveTo:create(0.6, cc.p(30, 980))

	self._combatPanel:runAction(moveto)
	self._attibutePanel:setPosition(cc.p(231, 412))

	moveto = cc.MoveTo:create(0.6, cc.p(45, 867))

	self._attibutePanel:runAction(moveto)
	self._typePanel:setPosition(cc.p(340, 303))

	moveto = cc.MoveTo:create(0.6, cc.p(50, 767))

	self._typePanel:runAction(moveto)
	self._starPanel1:setPosition(cc.p(0, 0))

	moveto = cc.MoveTo:create(0.6, cc.p(-410, 680))

	self._starPanel1:runAction(moveto)
	self._image3:fadeOut({
		time = 0.7
	})
	self._skillPanel:setPosition(cc.p(158, 17))

	moveto = cc.MoveTo:create(0.6, cc.p(-335, 737))

	self._skillPanel:runAction(moveto)
	self._roleNode:setPosition(cc.p(750, 300))

	moveto = cc.MoveTo:create(0.4, cc.p(179, 300))
	local scaleto = cc.ScaleTo:create(0.4, 1.2)
	local spawn = cc.Spawn:create(moveto, scaleto)

	self._roleNode:runAction(spawn)
	self._image4:setPosition(cc.p(1927, -680))

	moveto = cc.MoveTo:create(0.6, cc.p(1257, -112))

	self._image4:runAction(moveto)
	self._starPanel2:setPosition(cc.p(132, -240))

	moveto = cc.MoveTo:create(0.6, cc.p(132, 11))

	self._starPanel2:runAction(moveto)
	self._equiplPanel:setPosition(cc.p(541, -479))

	local moveto1 = cc.MoveTo:create(0.4, cc.p(541, 48))

	self._equiplPanel:runAction(moveto1)

	local callfunc = cc.CallFunc:create(callBack)
	local delaytime = cc.DelayTime:create(0.8)
	local seq = cc.Sequence:create(delaytime, callfunc)

	self._mainPanel:runAction(seq)
end

function HeroShowDetailsMediator:playAnim3(callBack)
	self._image6:setPosition(cc.p(-378, 1068))

	local moveto = cc.MoveTo:create(0.4, cc.p(85, 287))

	self._image6:runAction(moveto)
	self._image7:setPosition(cc.p(-225, 1008))

	moveto = cc.MoveTo:create(0.4, cc.p(233, 257))

	self._image7:runAction(moveto)
	self._combatPanel:setPosition(cc.p(30, 980))

	moveto = cc.MoveTo:create(0.4, cc.p(333, 522))

	self._combatPanel:runAction(moveto)
	self._attibutePanel:setPosition(cc.p(45, 867))

	moveto = cc.MoveTo:create(0.4, cc.p(231, 412))

	self._attibutePanel:runAction(moveto)
	self._typePanel:setPosition(cc.p(50, 767))

	moveto = cc.MoveTo:create(0.4, cc.p(340, 303))

	self._typePanel:runAction(moveto)
	self._starPanel1:setPosition(cc.p(-410, 680))

	moveto = cc.MoveTo:create(0.4, cc.p(0, 0))

	self._starPanel1:runAction(moveto)
	self._image3:fadeIn({
		time = 0.4
	})
	self._skillPanel:setPosition(cc.p(-335, 737))

	moveto = cc.MoveTo:create(0.4, cc.p(158, 17))

	self._skillPanel:runAction(moveto)
	self._roleNode:setPosition(cc.p(179, 300))

	moveto = cc.MoveTo:create(0.4, cc.p(750, 300))
	local scaleto = cc.ScaleTo:create(0.4, 1)
	local spawn = cc.Spawn:create(moveto, scaleto)

	self._roleNode:runAction(spawn)
	self._image4:setPosition(cc.p(1257, -112))

	moveto = cc.MoveTo:create(0.7, cc.p(1927, -680))

	self._image4:runAction(moveto)
	self._starPanel2:setPosition(cc.p(132, 11))

	moveto = cc.MoveTo:create(0.4, cc.p(132, -240))

	self._starPanel2:runAction(moveto)
	self._equiplPanel:setPosition(cc.p(541, 48))

	local moveto1 = cc.MoveTo:create(0.6, cc.p(541, -479))

	self._equiplPanel:runAction(moveto1)

	local callfunc = cc.CallFunc:create(callBack)
	local delaytime = cc.DelayTime:create(0.8)
	local seq = cc.Sequence:create(delaytime, callfunc)

	self._mainPanel:runAction(seq)
end

local dragType = {
	kDragUp = 1,
	kDragNo = 0,
	kDragDown = 2
}

function HeroShowDetailsMediator:onTouchMainPanel(sender, eventType)
	if eventType == ccui.TouchEventType.began then
		self._isChangeAnim = false
		self._dragType = dragType.kDragNo
	elseif eventType == ccui.TouchEventType.moved then
		local beganPos = sender:getTouchBeganPosition()
		local movedPos = sender:getTouchMovePosition()
		self._dragType = self:checkTouchType(beganPos, movedPos)
	elseif eventType == ccui.TouchEventType.ended then
		if not self._isAnimStop then
			return
		end

		if self._dragType == dragType.kDragNo then
			self._isChangeAnim = false
		elseif self._dragType == dragType.kDragDown and (self._animType == 1 or self._animType == 3) then
			self._isChangeAnim = false
		elseif self._dragType == dragType.kDragUp and self._animType == 2 then
			self._isChangeAnim = false
		elseif self._dragType == dragType.kDragDown then
			self._isChangeAnim = true

			if self._animType == 2 then
				self._animType = 3
			end
		elseif self._dragType == dragType.kDragUp then
			self._isChangeAnim = true

			if self._animType == 1 then
				self._animType = 2
			elseif self._animType == 3 then
				self._animType = 2
			end
		end

		if self._isChangeAnim then
			AudioEngine:getInstance():playEffect("Se_Click_Rotate", false)
			self:showAnimByType(self._animType)
		end
	end
end

function HeroShowDetailsMediator:checkTouchType(pos1, pos2)
	local xOffset = math.abs(pos1.x - pos2.x)
	local yOffset = math.abs(pos1.y - pos2.y)

	if xOffset > 10 or yOffset > 10 then
		local dragDeg = math.deg(math.atan(yOffset / xOffset))

		if dragDeg > 30 then
			if pos1.y - pos2.y > 0 then
				return dragType.kDragDown
			elseif pos1.y - pos2.y < 0 then
				return dragType.kDragUp
			end
		end
	end

	return dragType.kDragNo
end

function HeroShowDetailsMediator:onBackBtn(sender, eventType)
	self._mainPanel:stopAllActions()
	self:dismiss()
end
