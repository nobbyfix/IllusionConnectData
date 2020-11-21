EquipTipsMediator = class("EquipTipsMediator", DmPopupViewMediator, _M)

EquipTipsMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kDefaultDelayTime = 0.1
local kMoveSensitiveDist = cc.p(5, 5)
local HeroEquipExp = ConfigReader:getDataByNameIdAndKey("ConfigValue", "HeroEquipExp", "content")
local HeroEquipStar = ConfigReader:getDataByNameIdAndKey("ConfigValue", "HeroEquipStar", "content")

function EquipTipsMediator:initialize()
	super.initialize(self)
end

function EquipTipsMediator:dispose()
	self._viewClose = true

	super.dispose(self)
end

function EquipTipsMediator:onRemove()
	super.onRemove(self)
end

function EquipTipsMediator:onRegister()
	super.onRegister(self)

	self._equipSystem = self._developSystem:getEquipSystem()
	self._main = self:getView():getChildByName("main")

	self:mapEventListener(self:getEventDispatcher(), EVT_SHOW_ITEMTIP, self, self.onShowContent)
end

function EquipTipsMediator:userInject()
end

function EquipTipsMediator:enterWithData(data)
	assert(data.info ~= nil, "error:data.info=nil")
	assert(data.info.id ~= nil, "error:data.info.id=nil")
	self:setUi(data)

	local view = self:getView()
end

function EquipTipsMediator:onShowContent(event)
	local data = event:getData()

	assert(data.info ~= nil, "error:data.info=nil")
	assert(data.info.id ~= nil, "error:data.info.id=nil")
	assert(data.icon ~= nil, "error:data.icon=nil")
	self:setUi(data)
	self:adjustPos(data.icon, data.style and data.style.direction)
end

function EquipTipsMediator:setUi(data)
	local iconBg = self._main:getChildByName("icon")

	if data.info and data.info.clipIndex then
		data.info.clipIndex = 1
	end

	local id = data.info.id
	local rarity = ConfigReader:getDataByNameIdAndKey("HeroEquipBase", id, "Rareity")
	local level = ConfigReader:getDataByNameIdAndKey("HeroEquipExp", HeroEquipExp[tostring(rarity)], "ShowLevel")
	local star = ConfigReader:getDataByNameIdAndKey("HeroEquipStar", HeroEquipStar[tostring(rarity)], "StarLevel")
	local info = {
		id = id,
		level = level,
		rarity = rarity,
		star = star,
		rewardType = RewardType.kEquip
	}
	local icon = IconFactory:createIcon(info, {
		hideLevel = true
	})

	icon:addTo(iconBg):center(iconBg:getContentSize()):offset(-2, 0)
	icon:setScale(0.7)

	local nameText = self._main:getChildByName("Text_name")

	nameText:setString(RewardSystem:getName(data.info))

	local config = ConfigReader:getRecordById("HeroEquipBase", id)

	assert(config, "装备id：%s配置错误", id)
	GameStyle:setRarityText(nameText, config.Rareity)

	local equipOccu = config.Profession
	local occupationDesc = config.ProfessionDesc
	local limitDesc = self._main:getChildByFullName("text")
	local limitNode = self._main:getChildByFullName("limit")

	limitNode:removeAllChildren()

	if occupationDesc ~= "" then
		limitDesc:ignoreContentAdaptWithSize(false)
		limitDesc:setContentSize(cc.size(243, 43))
		limitDesc:setString(Strings:get("Equip_UI24") .. " " .. Strings:get(occupationDesc))
	else
		limitDesc:setString(Strings:get("Equip_UI24"))

		for i = 1, #equipOccu do
			local occupationName, occupationIcon = GameStyle:getHeroOccupation(equipOccu[i])
			local image = ccui.ImageView:create(occupationIcon)

			image:setAnchorPoint(cc.p(0, 0.5))
			image:setPosition(cc.p(35 * (i - 1), 0))
			image:addTo(limitNode)
			image:setScale(0.5)
		end
	end

	local nodeAttr = self._main:getChildByName("nodeAttr")
	local attrBg = nodeAttr:getChildByName("attrBg")
	local attrList = {}
	local params = {
		level = level,
		rarity = rarity,
		star = star,
		config = config
	}
	local attrMap = HeroEquipAttr:getBaseAttrNum(nil, params)

	for i, v in pairs(attrMap) do
		if AttributeCategory:getAttNameAttend(v.attrType) == "" then
			v.attrNum = math.round(v.attrNum)
		end

		attrList[#attrList + 1] = v
	end

	table.sort(attrList, function (a, b)
		return a.index < b.index
	end)

	local height = #attrList > 2 and 80 or 50

	attrBg:setContentSize(cc.size(331, height))

	for i = 1, 2 do
		local attrPanel = nodeAttr:getChildByFullName("desc_" .. i)

		attrPanel:setVisible(false)

		if attrList[i] then
			attrPanel:setVisible(true)

			local attrType = attrList[i].attrType
			local attrNum = attrList[i].attrNum
			local attrImage = attrPanel:getChildByFullName("image")

			attrImage:loadTexture(AttrTypeImage[attrType], 1)

			local attrText = attrPanel:getChildByFullName("text")

			attrText:setString(attrNum)

			if AttributeCategory:getAttNameAttend(attrType) ~= "" then
				attrText:setString(attrNum * 100 .. "%")
			end

			local name = attrPanel:getChildByFullName("name")

			name:setString(AttributeCategory:getAttName(attrType))
		end
	end

	local nodeSkill = self._main:getChildByName("nodeSkill")
	local posY = nodeAttr:getPositionY() - height - 15

	nodeSkill:setPositionY(posY)

	local bgWidth = posY + 35

	if config.Skill == "" then
		nodeSkill:setVisible(false)
	else
		nodeSkill:setVisible(true)

		local skillName = nodeSkill:getChildByName("name")
		local skillLevel = nodeSkill:getChildByName("level")
		local skillDesc = nodeSkill:getChildByName("skillDesc")

		skillLevel:setColor(cc.c3b(147, 147, 147))

		local skillPro = PrototypeFactory:getInstance():getSkillPrototype(config.Skill)
		local skillConfig = skillPro:getConfig()

		skillName:setString(Strings:get(skillConfig.Name))

		local HeroEquipSkillLevel = ConfigReader:getDataByNameIdAndKey("ConfigValue", "HeroEquipSkillLevel", "content")
		local unlockLevel = HeroEquipSkillLevel[1]
		local tip = Strings:get("Equip_UI47") .. Strings:get("Strenghten_Text78", {
			level = unlockLevel
		}) .. Strings:get("Equip_UI48")

		skillLevel:setString(tip)
		skillLevel:setPositionX(skillName:getPositionX() + skillName:getContentSize().width + 5)

		local title = skillConfig.Desc
		local skillId = config.Skill
		local style = {
			fontSize = 18,
			fontColor = "#7B7474",
			fontName = TTF_FONT_FZYH_M
		}
		local desc = ConfigReader:getEffectDesc("Skill", title, skillId, 1, style)
		local getSkillDesc = skillPro:getAttrDescs(1, style)[1]

		if getSkillDesc then
			local add = "<font face='asset/font/CustomFont_FZYH_M.TTF' size='18' color='#7B7474'>，</font>"
			desc = getSkillDesc .. add .. desc
		end

		local width = skillDesc:getContentSize().width
		local height = skillDesc:getContentSize().height
		local label = ccui.RichText:createWithXML(desc, {})

		label:renderContent(width, 0)
		label:setAnchorPoint(cc.p(0, 1))
		label:setPosition(cc.p(0, height))
		label:addTo(skillDesc)

		bgWidth = bgWidth + 45 + label:getContentSize().height
	end

	local detailBg = self._main:getChildByName("Image_bg")

	detailBg:setContentSize(cc.size(372, bgWidth))

	local posY = 318 - bgWidth

	self:_expandDescHeight(posY)
end

function EquipTipsMediator:adjustPos(icon, direction)
	local view = self:getView()

	view:setAnchorPoint(cc.p(0.5, 0.5))
	view:setIgnoreAnchorPointForPosition(false)

	local kUpMargin = 5
	local kDownMargin = 5
	local kLeftMargin = 5
	local kRightMargin = 5
	local contentSize = self._main:getContentSize()
	local viewSize = view:getContentSize()
	local iconBoundingBox = icon:getBoundingBox()
	local worldPos = icon:getParent():convertToWorldSpace(cc.p(iconBoundingBox.x, iconBoundingBox.y))
	local scene = cc.Director:getInstance():getRunningScene()
	local winSize = scene:getContentSize()
	direction = direction or (worldPos.y + iconBoundingBox.height + contentSize.height + kUpMargin > winSize.height - 30 or ItemTipsDirection.kUp) and (worldPos.x + iconBoundingBox.width * 0.5 >= winSize.width * 0.5 or ItemTipsDirection.kRight) and ItemTipsDirection.kLeft
	local iconBox = {
		x = worldPos.x,
		y = worldPos.y,
		width = icon:getContentSize().width * icon:getScale(),
		height = icon:getContentSize().height * icon:getScale()
	}
	local x, y = nil
	local contentPosY = self._main:getPositionY()
	local deltaY = self._deltaY or 0

	if direction == ItemTipsDirection.kUp then
		x = iconBox.x + iconBox.width * 0.5
		y = iconBox.y + iconBox.height + kUpMargin + contentPosY - self._deltaY
	elseif direction == ItemTipsDirection.kDown then
		x = iconBox.x + iconBox.width * 0.5
		y = iconBox.y - contentSize.height * 0.5 - kDownMargin
	elseif direction == ItemTipsDirection.kLeft then
		x = iconBox.x - contentSize.width * 0.5 - kLeftMargin
		y = iconBox.y + iconBox.height - viewSize.height * 0.5
	elseif direction == ItemTipsDirection.kRight then
		x = iconBox.x + iconBox.width + contentSize.width * 0.5 + kRightMargin
		y = iconBox.y + iconBox.height - viewSize.height * 0.5
	end

	local nodePos = view:getParent():convertToWorldSpace(cc.p(0, 0))
	local kLeftMinMargin = 0
	local kRightMinMargin = 0
	local kUpMinMargin = 0
	local kDownMinMargin = 0

	if kLeftMinMargin >= x - contentSize.width * 0.5 then
		x = kLeftMinMargin + contentSize.width * 0.5
	elseif x + contentSize.width * 0.5 >= winSize.width - kRightMinMargin then
		x = winSize.width - kRightMinMargin - contentSize.width * 0.5
	end

	if kDownMinMargin > y - contentSize.height * 0.5 then
		y = kDownMinMargin + contentSize.height * 0.5
	elseif y + contentSize.height * 0.5 > winSize.height - kUpMinMargin then
		y = winSize.height - kUpMinMargin - contentSize.height * 0.5
	end

	view:setPosition(cc.p(x - nodePos.x, y - nodePos.y))
end

function EquipTipsMediator:_expandDescHeight(expandHeight)
	if expandHeight and expandHeight ~= 0 then
		local currentPosY = self._main:getPositionY()
		self._deltaY = expandHeight * 0.5

		self._main:setPositionY(currentPosY - self._deltaY)

		local detailBg = self._main:getChildByName("Image_bg")
		local bgSize = detailBg:getContentSize()

		self._main:setContentSize(cc.size(bgSize.width, bgSize.height))
	end
end

function EquipTipsMediator:checkNeedDelay(data)
	if data.style and data.style.needDelay then
		self:getView():setVisible(false)

		local icon = data.icon
		local initPos = icon:getParent():convertToWorldSpace(cc.p(icon:getPosition()))
		local delayAct = cc.DelayTime:create(data.delayTime or kDefaultDelayTime)
		local judgeShowAct = cc.CallFunc:create(function ()
			local endPos = icon:getParent():convertToWorldSpace(cc.p(icon:getPosition()))

			if math.abs(endPos.x - initPos.x) < kMoveSensitiveDist.x and math.abs(endPos.y - initPos.y) < kMoveSensitiveDist.y then
				self:getView():setVisible(true)
			end
		end)
		local seqAct = cc.Sequence:create(delayAct, judgeShowAct)

		self:getView():runAction(seqAct)
	end
end
