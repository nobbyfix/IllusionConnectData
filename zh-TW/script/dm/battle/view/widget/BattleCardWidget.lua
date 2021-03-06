BattleCardWidget = class("BattleCardWidget", BattleWidget, _M)

BattleCardWidget:has("_index", {
	is = "rw"
})
BattleCardWidget:has("_cardId", {
	is = "r"
})
BattleCardWidget:has("_cost", {
	is = "rw"
})
BattleCardWidget:has("_cardInfo", {
	is = "rw"
})
BattleCardWidget:has("_isEntering", {
	is = "rb"
})

function BattleCardWidget:initialize(view)
	super.initialize(self, view)
	self:initSubviews(view)
end

function BattleCardWidget:dispose()
	super.dispose(self)
end

function BattleCardWidget:initSubviews(view)
	local cardNode = view:getChildByFullName("card_node")
	self._cardNode = cardNode
	self._animPlaySta = true
	self._costBg = cardNode:getChildByFullName("energy_bg")
	self._lblCost = cardNode:getChildByFullName("energy_lab")
	self._iconImageNode = cardNode:getChildByFullName("icon_rect.icon_region")
	self._viewSize = self._iconImageNode:getContentSize()
	local barImgPath = "asset/common/pic_mengban_sms.png"
	local barImage = cc.Sprite:create(barImgPath)
	local cardMaskNode = cc.ProgressTimer:create(barImage)

	cardMaskNode:setType(0)
	cardMaskNode:setScaleX(-0.95)
	cardMaskNode:setScaleY(0.85)
	cardMaskNode:setAnchorPoint(cc.p(0.5, 0.5))
	cardMaskNode:setMidpoint(cc.p(0.5, 0.5))
	cardMaskNode:offset(0, 5)
	cardMaskNode:setVisible(false)
	cardNode:addChild(cardMaskNode, 100)

	self._cardMaskNode = cardMaskNode
	self._energyIsEnough = true

	self:addCardAnim()
end

function BattleCardWidget:hitTest(globalPoint)
	local localPoint = self._iconImageNode:convertToNodeSpace(globalPoint)
	local size = self._viewSize
	local cardRect = cc.rect(0, 0, size.width, size.height)

	return cc.rectContainsPoint(cardRect, localPoint)
end

function BattleCardWidget:setCost(cost)
	if self._cost ~= cost then
		self._cost = cost

		if self._lblCost then
			self._lblCost:setString(tostring(cost))
		end
	end
end

function BattleCardWidget:setCostColor(color)
	if self._lblCost then
		self._lblCost:setColor(color)
	end
end

function BattleCardWidget:adjustCost(detail)
	local cost = detail.cost
	local raw = detail.rawCost
	local costImg1 = self._lblCost:clone()

	self:setCost(cost)

	if raw then
		if raw < cost then
			self:setCostColor(cc.c3b(210, 70, 70))
		elseif cost < raw then
			self:setCostColor(cc.c3b(205, 250, 100))
		else
			self:setCostColor(cc.c3b(255, 255, 255))
		end
	else
		self:setCostColor(cc.c3b(255, 255, 255))
	end

	self._lblCost:setVisible(false)
	self._costBg:setVisible(false)

	local cardNode = self._lblCost:getParent()

	cardNode:removeChildByName("feiyongbianhua")
	costImg1:setVisible(true)
	costImg1:posite(0, -5)

	local sjImg1 = self._costBg:clone()

	sjImg1:setVisible(true)
	sjImg1:posite(0, -2)

	local sjImg2 = sjImg1:clone()
	local costImg2 = self._lblCost:clone()

	costImg2:setVisible(true)
	costImg2:posite(0, -5)

	local anim = cc.MovieClip:create("dh_feiyongbianhua")

	anim:addTo(cardNode):offset(-2, -32)
	costImg1:addTo(anim:getChildByFullName("nl1"))
	costImg2:addTo(anim:getChildByFullName("nl2"))
	sjImg1:addTo(anim:getChildByFullName("sj1"))
	sjImg2:addTo(anim:getChildByFullName("sj2"))
	anim:setName("feiyongbianhua")
	anim:addEndCallback(function (cid, mc)
		mc:stop()
	end)
	anim:play()
end

function BattleCardWidget:playAddBuffAnim()
	if self._animBuffEffect then
		self._animBuffEffect:gotoAndPlay(1)
	end
end

function BattleCardWidget:isAvailable()
	if self._status == "in-use" then
		return false
	end

	return true
end

function BattleCardWidget:setStatus(status)
	self._status = status
end

function BattleCardWidget:reloadIconImage(imagePath)
	if self._iconImageNode then
		self._iconImageNode:loadTexture(imagePath)
	end
end

function BattleCardWidget:updateCardInfo(info)
	self._cardInfo = info
	self._cardId = info.id

	self:adjustCost(info)
end

function BattleCardWidget:freshEnergyStatus(energy, remain)
	if self._isEntering then
		self._prevEnergy = energy
		self._prevRemain = remain

		self._cardMaskNode:setVisible(false)
		self:getView():setGray(false)

		return
	end

	self._prevEnergy = nil
	self._prevRemain = nil
	local cost = self:getCost()
	local energyWasEnough = self._energyIsEnough
	self._energyIsEnough = cost <= energy

	if self._energyIsEnough then
		if self:getType() == "skill" then
			self._cardMaskNode:setVisible(false)

			local view = self:getView()

			view:setGray(false)
			view:stopAllActions()
			view:setScale(1)
		elseif self:getType() == "hero" and not energyWasEnough then
			self._cardMaskNode:setVisible(false)

			local view = self:getView()

			view:setGray(false)
			view:stopAllActions()
			view:setScale(1)
			view:runAction(cc.Sequence:create(cc.ScaleTo:create(0.08, 1.05), cc.DelayTime:create(0.1), cc.ScaleTo:create(0.08, 1)))
		end
	else
		local view = self:getView()

		view:setGray(true)

		if self:getType() == "hero" then
			self._cardMaskNode:setVisible(true)
			self._cardMaskNode:setPercentage(100 - 100 * (energy + remain or 0) / cost)
		elseif self:getType() == "skill" then
			self._cardMaskNode:setVisible(false)
		end
	end

	self:freshEnergyAnim(energy, remain)
	self:refreshCardAnim()
end

function BattleCardWidget:freshEnergyAnim(energy, remain)
	remain = remain or 0
	energy = energy or 0

	if energy <= 20 then
		if self._cardNode:getChildByFullName("huanraoAnim") then
			self._cardNode:removeChildByName("huanraoAnim")
		end
	else
		local anim = self._cardNode:getChildByFullName("huanraoAnim")

		if not anim then
			anim = cc.MovieClip:create("huanrao_shoupaitishi", "BattleMCGroup")

			anim:addTo(self._cardNode):setName("huanraoAnim")
			anim:setPosition(cc.p(0, -35))
			anim:addEndCallback(function (fid, mc)
				mc:stop()
				mc:gotoAndPlay(1)
			end)
		end

		if energy >= 30 then
			anim:gotoAndPlay(1)
		else
			local framePlay = anim:getCurrentFrame()
			local frameNow = remain * 30

			if frameNow - framePlay > 1 or framePlay - frameNow > 1 then
				anim:gotoAndPlay(frameNow)
			end
		end
	end
end

function BattleCardWidget:refreshCardAnim()
	if self:isEnergyEnough() then
		self:showCardAnim()
	else
		self:hideCardAnim()
	end
end

function BattleCardWidget:isEnergyEnough()
	return self._energyIsEnough
end

function BattleCardWidget:enterActiveState()
	local view = self:getView()

	view:stopAllActions()

	if view:getParent() then
		view:getParent():stopAllActions()
		view:getParent():runAction(cc.MoveBy:create(0.06, cc.p(0, 20)))
	end
end

function BattleCardWidget:restoreNormalState(originCardPosition)
	local view = self:getView()

	if view:getParent() then
		view:getParent():stopAllActions()
		view:getParent():posite(0, 0)
	end

	view:setScale(1)
	view:setLocalZOrder(1)

	if originCardPosition ~= nil then
		view:setPosition(originCardPosition)
	end
end

function BattleCardWidget:startEnterAnimation(action, endCallback)
	self._isEntering = true
	local view = self:getView()

	view:stopAllActions()

	local endCallbackAction = cc.CallFunc:create(function ()
		self._isEntering = false

		if self._prevEnergy then
			self:freshEnergyStatus(self._prevEnergy, self._prevRemain)
		end

		if endCallback then
			endCallback(self)
		end
	end)

	view:runAction(cc.Sequence:create(action, endCallbackAction))
end

function BattleCardWidget:visitCard()
end

function BattleCardWidget:addCardAnim()
	local view = self:getView()
	local animEffect = cc.MovieClip:create("guang_shoupaitishi", "BattleMCGroup")

	animEffect:addTo(view, 1)
	animEffect:setPosition(cc.p(1, -24))
	animEffect:addEndCallback(function (fid, mc)
		mc:stop()
		mc:gotoAndPlay(1)
	end)
	animEffect:gotoAndStop(1)

	self._cardEffectAnim = animEffect
	local animCard = cc.MovieClip:create("kapaipai_shoupaitishi", "BattleMCGroup")

	animCard:addTo(view, 1):center(view:getContentSize())
	animCard:addEndCallback(function (fid, mc)
		mc:stop()
		mc:gotoAndPlay(1)
	end)
	animCard:gotoAndStop(1)

	self._cardAnim = animCard
	local animBuffEffect = cc.MovieClip:create("xunhuan_shoupaitishi", "BattleMCGroup")

	animBuffEffect:addTo(view, 1)
	animBuffEffect:setPosition(cc.p(0, -24))
	animBuffEffect:addEndCallback(function (fid, mc)
		mc:stop()
		mc:gotoAndPlay(18)
	end)
	animBuffEffect:gotoAndStop(1)

	self._animBuffEffect = animBuffEffect
	local node = animCard:getChildByFullName("node")

	animBuffEffect:changeParent(node)

	local cardNode = animBuffEffect:getChildByFullName("card")

	self._cardNode:changeParent(cardNode)
	self._cardNode:setPosition(cc.p(3, 35))
	self:hideCardAnim()
end

function BattleCardWidget:showCardAnim()
	if self._animPlaySta then
		return
	end

	self._animPlaySta = true

	self._cardEffectAnim:gotoAndPlay(1)
	self._cardAnim:gotoAndPlay(1)
	self._cardEffectAnim:setVisible(true)
	self._animBuffEffect:setPosition(cc.p(0, -24))
end

function BattleCardWidget:hideCardAnim()
	if not self._animPlaySta then
		return
	end

	self._animPlaySta = false

	self._cardEffectAnim:gotoAndStop(1)
	self._cardAnim:gotoAndStop(1)
	self._cardEffectAnim:setVisible(false)
	self._animBuffEffect:setPosition(cc.p(0, -34))
end

HeroCardWidget = class("HeroCardWidget", BattleCardWidget, _M)

HeroCardWidget:has("_targetPreview", {
	is = "r"
})
HeroCardWidget:has("_skillId", {
	is = "r"
})
HeroCardWidget:has("_skillLevel", {
	is = "r"
})
HeroCardWidget:has("_heroId", {
	is = "r"
})
HeroCardWidget:has("_modelId", {
	is = "r"
})
HeroCardWidget:has("_heroInfo", {
	is = "r"
})

function HeroCardWidget.class:createWidgetNode()
	local resFile = "asset/ui/HeroCardBattleWidget.csb"

	return cc.CSLoader:createNode(resFile)
end

function HeroCardWidget:initSubviews(view)
	super.initSubviews(self, view)

	self._bgImageNode = self._cardNode:getChildByFullName("card_bg")
	self._frameImageNode = self._cardNode:getChildByFullName("card_frame")
	self._genrePic = self._cardNode:getChildByFullName("genre")
	self._rangePic = self._cardNode:getChildByFullName("range")

	self._rangePic:setVisible(false)

	self._tagNode = self._cardNode:getChildByFullName("tag_node")
	self._icon_hero = self._cardNode:getChildByFullName("icon_hero")
	self._damageAddLabel = self._cardNode:getChildByFullName("add_label")

	self._icon_hero:setVisible(true)
end

function HeroCardWidget:getType()
	return "hero"
end

function HeroCardWidget:setQuality(quality)
	if self._quality == quality then
		return
	end

	self._quality = quality
	local qualityIndex = math.floor(quality / 10)
end

function HeroCardWidget:setRarity(rarity)
end

local rangeMap = {
	Single_Cure = "zhiye_wz01_green.png",
	Col_Cure = "zhiye_wz03_green.png",
	X_Attack = "zhiye_wz05_red.png",
	Single_Attack = "zhiye_wz01_red.png",
	Card = "zhiye_wzkp_green.png",
	Random4_Attack = "zhiye_wz04w_red.png",
	Row_Attack = "zhiye_wz03s_red.png",
	AllUnit_Word = "zhiye_qt.png",
	Row_Cure = "zhiye_wz03s_green.png",
	SingleUnit_Word = "zhiye_dt.png",
	Single_Atk_Double_Cure = "zhiye_wz03_rg.png",
	Random3_Attack = "zhiye_wz03w_red.png",
	CrossUnit_Word = "zhiye_sz.png",
	ColUnit_Word = "zhiye_zl.png",
	Summon = "zhiye_wzzh_green.png",
	RowUnit_Word = "zhiye_zp.png",
	RandomUnit_Word = "zhiye_fw.png",
	Cross_Attack = "zhiye_wz05z_red.png",
	Col_Attack = "zhiye_wz03_red.png",
	Random1_Attack = "zhiye_wz00w_red.png",
	All_Cure = "zhiye_wz09_green.png",
	Cross_Cure = "zhiye_wz05z_green.png",
	X_Cure = "zhiye_wz05_green.png",
	All_Attack = "zhiye_wz09_red.png"
}

function HeroCardWidget:setHeroModel(heroInfo)
	local modelId = heroInfo.model

	if self._modelId == modelId then
		return
	end

	self._modelId = modelId
	local iconImagePath = IconFactory:getRoleIconPath(modelId)

	self:reloadIconImage(iconImagePath)

	local genre = heroInfo.genre
	local range = ConfigReader:getDataByNameIdAndKey("RoleModel", modelId, "SkillRange")
	range = range and rangeMap[range]

	if genre and genre ~= "" then
		local _, genrePic, imageType = GameStyle:getBatleHeroOccupation(genre)

		self._genrePic:loadTexture(genrePic, imageType or ccui.TextureResType.localType)
		self._genrePic:setVisible(true)
	else
		self._genrePic:setVisible(false)
	end

	if range then
		self._rangePic:loadTexture(range, ccui.TextureResType.plistType)
		self._rangePic:setVisible(true)
	else
		self._rangePic:setVisible(false)
	end

	if heroInfo.addHurtRate and self._damageAddLabel then
		self._damageAddLabel:setVisible(true)
		self._damageAddLabel:setString(heroInfo.addHurtRate)
	end

	local tagPicArray = ConfigReader:getDataByNameIdAndKey("RoleModel", modelId, "TagPic")

	if tagPicArray == nil or #tagPicArray <= 0 then
		self._tagNode:setVisible(false)
		self._tagNode:removeAllChildren()

		return
	else
		self._tagNode:setVisible(true)
		self._tagNode:removeAllChildren()
	end

	for i = 1, #tagPicArray do
		local picName = tagPicArray[i] .. ".png"
		local pic = ccui.ImageView:create(picName, ccui.TextureResType.plistType)

		pic:setScale(0.39)
		pic:addTo(self._tagNode):posite(0, (i - 1) * 22)
	end
end

function HeroCardWidget:setPreviewMod()
end

function HeroCardWidget:setNormalMod()
end

function HeroCardWidget:updateCardInfo(info)
	super.updateCardInfo(self, info)

	local heroInfo = info.hero
	self._heroInfo = heroInfo
	self._heroId = heroInfo.id
	local range = nil

	if info.unique then
		local config = ConfigReader:getRecordById("Skill", info.unique)
		self._targetPreview = config.TargetPreview
		self._skillId = info.unique
		self._skillLevel = info.uniqueLevel
		range = config.SkillRange
	end

	heroInfo.skillId = self._skillId
	heroInfo.skillLevel = self._skillLevel
	heroInfo.range = range

	self:setHeroModel(heroInfo)
end

function HeroCardWidget:setDamageAdd(str)
	if self._damageAddLabel then
		self._damageAddLabel:setString(str or "")
	end
end

SkillCardWidget = class("SkillCardWidget", BattleCardWidget, _M)

SkillCardWidget:has("_skillId", {
	is = "r"
})
SkillCardWidget:has("_skillLevel", {
	is = "r"
})

function SkillCardWidget.class:createWidgetNode()
	local resFile = "asset/ui/SkillCardBattleWidget.csb"

	return cc.CSLoader:createNode(resFile)
end

function SkillCardWidget:initSubviews(view)
	super.initSubviews(self, view)

	self._genrePic = self._cardNode:getChildByFullName("genre")
	self._skillImage1 = self._cardNode:getChildByFullName("Image")
	self._bgImageNode = self._cardNode:getChildByFullName("card_bg")
	self._rangePic = self._cardNode:getChildByFullName("range")

	self._rangePic:setVisible(false)
end

function SkillCardWidget:getType()
	return "skill"
end

function SkillCardWidget:setPreviewMod()
end

function SkillCardWidget:setNormalMod()
end

function SkillCardWidget:updateCardInfo(info)
	super.updateCardInfo(self, info)

	self._skillLevel = info.skill.level
	self._skillId = info.skill.id
	local config = ConfigReader:getRecordById("TacticsCard", info.id)

	if config then
		local path = "asset/tacticsCard/"
		local iconImagePath = path .. config.SkillPic .. ".png"

		self:reloadIconImage(iconImagePath)
		self._genrePic:loadTexture("TacticsCard_Type_" .. config.Type .. ".png", ccui.TextureResType.plistType)
		self._bgImageNode:loadTexture("TacticsCard_Bg_" .. config.Type .. ".png", ccui.TextureResType.plistType)
		self._skillImage1:loadTexture("TacticsCard_Icon_" .. config.Type .. ".png", ccui.TextureResType.plistType)
		self:setCost(config.SkillCost)

		local tagPic = config.TagPic

		if tagPic then
			self._rangePic:loadTexture(tagPic .. ".png", ccui.TextureResType.plistType)
			self._rangePic:setVisible(true)
		else
			self._rangePic:setVisible(false)
		end
	end
end
