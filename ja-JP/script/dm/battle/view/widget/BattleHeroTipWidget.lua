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
BattleHeroTipWidget = class("BattleHeroTipWidget", BattleWidget, _M)

function BattleHeroTipWidget:initialize(view)
	super.initialize(self, view)
	self:_setupUI()
end

function BattleHeroTipWidget:_setupUI()
	local view = self:getView()
	local descLabel = view:getChildByFullName("skillNode.skillDesc")

	descLabel:setVisible(false)

	local richText = ccui.RichText:createWithXML("", {})

	richText:setAnchorPoint(descLabel:getAnchorPoint())
	richText:setPosition(cc.p(descLabel:getPosition()))
	richText:addTo(descLabel:getParent())

	self._skillDesc = richText
	self._skillDescWidth = descLabel:getContentSize().width
	self._skillName = view:getChildByFullName("skillNode.skillName")
	self._skillIcon = view:getChildByFullName("skillNode.skillIcon")
	self._skillNode = view:getChildByFullName("skillNode")
	self._energy_bg = view:getChildByFullName("energy_bg")
	self._energy_lab = view:getChildByFullName("energy_lab")
	self._rangePic = view:getChildByFullName("skillNode.skillRangeIcon")
	self._genrePic = view:getChildByFullName("genreIcon")
	self._tagNode = view:getChildByFullName("tag_node")
	self._heroName = view:getChildByFullName("heroName")
	self._heroLevel = view:getChildByFullName("heroLevel")
	self._atk = view:getChildByFullName("atk.value")
	self._def = view:getChildByFullName("def.value")
	self._hp = view:getChildByFullName("hp.value")

	view:getChildByFullName("atk.label"):setOpacity(153)
	view:getChildByFullName("def.label"):setOpacity(153)
	view:getChildByFullName("hp.label"):setOpacity(153)
	self._skillDesc:setOpacity(153)

	self._specialClone = view:getChildByFullName("specialClone")

	self._specialClone:setVisible(false)
end

function BattleHeroTipWidget:setupHeroInfo(cardInfo)
	local heroInfo = cardInfo.hero
	local modelId = heroInfo.model

	if self._modelId == modelId then
		return false
	end

	local range = ConfigReader:getDataByNameIdAndKey("RoleModel", modelId, "SkillRange")
	range = range and rangeMap[range]

	self:setSkillInfo(heroInfo.skillId, heroInfo.skillLevel, range)

	local genre = heroInfo.genre

	if genre and genre ~= "" then
		local _, genrePic, imageType = GameStyle:getBatleHeroOccupation(genre)

		self._genrePic:loadTexture(genrePic, imageType or ccui.TextureResType.localType)
		self._genrePic:setVisible(true)
	else
		self._genrePic:setVisible(false)
	end

	self._atk:setString(tostring(math.floor(heroInfo.atk)))
	self._def:setString(tostring(math.floor(heroInfo.def)))
	self._hp:setString(tostring(math.floor(heroInfo.maxHp)))

	local modelCfg = ConfigReader:getRecordById("RoleModel", modelId)

	self._heroName:setString(Strings:get(modelCfg.Name))
	self._heroLevel:setString(tostring(heroInfo.level))

	local cost = cardInfo.cost

	self._energy_lab:setString(cost)
	self._energy_lab:setPositionX(self._heroName:getPositionX() + self._heroName:getContentSize().width + 30)
	self._energy_bg:setPositionX(self._heroName:getPositionX() + self._heroName:getContentSize().width + 35)

	local tagPicArray = ConfigReader:getDataByNameIdAndKey("RoleModel", modelId, "TagPic")

	if tagPicArray == nil or #tagPicArray <= 0 then
		self._tagNode:setVisible(false)
		self._tagNode:removeAllChildren()

		return
	else
		self._tagNode:setVisible(true)
		self._tagNode:removeAllChildren()
	end

	local tagDesc1 = ConfigReader:getDataByNameIdAndKey("RoleModel", modelId, "TagDesc")
	local tagDesc = table.deepcopy(tagDesc1 or {}, {})

	for i = 1, #tagDesc do
		local data = table.remove(tagDesc, #tagDesc)

		if data then
			local cell = self._specialClone:clone()

			cell:setVisible(true)

			local label = cell:getChildByName("desc")

			label:setString(Strings:get(data.code))
			label:setTextColor(GameStyle:stringToColor(data.color))

			local bg = cell:getChildByName("Image_7")

			bg:setContentSize(cc.size(label:getContentSize().width * 2.6 + 36, 63))
			cell:addTo(self._tagNode):posite(18 + (i - 1) * 110, 0)
		end
	end

	return true
end

function BattleHeroTipWidget:hideSkillInfo()
	self._skillNode:setVisible(false)
end

function BattleHeroTipWidget:showSkillInfo()
	self._skillNode:setVisible(true)
end

function BattleHeroTipWidget:setSkillInfo(skillId, level, range)
	local config = skillId and ConfigReader:getRecordById("Skill", skillId)

	if config == nil then
		self:hideSkillInfo()

		return
	end

	local descKey = config.Desc_short

	if descKey == nil or descKey == "" then
		self:hideSkillInfo()

		return
	end

	if range then
		self._rangePic:loadTexture(range, ccui.TextureResType.plistType)
		self._rangePic:setVisible(true)
	else
		self._rangePic:setVisible(false)
	end

	self._skillName:setString(Strings:get(config.Name))
	self._skillIcon:setPositionX(self._skillName:getPositionX() + self._skillName:getContentSize().width + 20)
	self._skillIcon:loadTexture("asset/skillIcon/" .. config.Icon .. ".png", ccui.TextureResType.localType)
	self._rangePic:setPositionX(self._skillIcon:getPositionX() + 50)
	self:showSkillInfo()

	local desc = ConfigReader:getEffectDesc("Skill", descKey, skillId, level)
	local tmpl = TextTemplate:new(desc)
	desc = tmpl:stringify({
		fontSize = 18,
		fontName = TTF_FONT_FZYH_R
	})

	self._skillDesc:setString(desc)
	self._skillDesc:ignoreContentAdaptWithSize(true)
	self._skillDesc:rebuildElements()
	self._skillDesc:formatText()
	self._skillDesc:renderContent(self._skillDescWidth, 0)
	self:getView():setVisible(true)
end

function BattleHeroTipWidget:hide()
	self:getView():setVisible(false)
end
