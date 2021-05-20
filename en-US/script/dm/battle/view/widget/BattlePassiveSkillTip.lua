BattlePassiveSkillTip = class("BattlePassiveSkillTip", BattleWidget, _M)

function BattlePassiveSkillTip:initialize(view)
	super.initialize(self, view)
	self:_setupView()
end

function BattlePassiveSkillTip:_setupView()
	local touch = self:getView():getChildByName("touch")

	touch:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
			self:onClickHide()
		end
	end)

	self._panelBase = self:getView():getChildByName("Panel_base")
	self._node_left = self:getView():getChildByName("Node_left")
	self._node_right = self:getView():getChildByName("Node_right")
	self._panel_1 = self:getView():getChildByName("Panel_1")

	self._panel_1:setVisible(false)

	self._panel_2 = self:getView():getChildByName("Panel_2")

	self._panel_2:setVisible(false)
	self:hide()
end

function BattlePassiveSkillTip:setListener(listener)
	self._listener = listener
end

function BattlePassiveSkillTip:show(passiveSkill, isLeft)
	self:getView():setVisible(true)
	self._node_right:removeAllChildren()
	self._node_left:removeAllChildren()

	local baseShowNode = self._node_right

	if isLeft then
		baseShowNode = self._node_left
	end

	self._panelBase:setPosition(baseShowNode:getPosition())

	local function refreshSkillCell(cell, info)
		local skillId = info.id
		local skillLv = info.lv
		local descLabel = cell:getChildByName("Text_des")

		descLabel:setVisible(false)

		local text_name = cell:getChildByName("Text_name")
		local panel_skill = cell:getChildByName("Panel_skill")

		if skillId then
			local lineCount = 0
			local icon = ConfigReader:getDataByNameIdAndKey("Skill", skillId, "Icon")
			local image = ccui.ImageView:create("asset/skillIcon/" .. icon .. ".png")

			image:addTo(panel_skill):center(panel_skill:getContentSize())

			if info.lock then
				image:setGray(true)

				local fontSize = 16
				local height = 200
				local descText = nil

				repeat
					local showText = Strings:get("BATTLE_SectSkill_Unactivated_Detail", {
						fontName = TTF_FONT_FZYH_M,
						fontSize = fontSize
					})
					descText = ccui.RichText:createWithXML(showText, {})

					descText:renderContent(descLabel:getContentSize().width, 0, true)

					height = descText:getContentSize().height
					fontSize = fontSize - 1
				until height <= 55 or fontSize < 2

				descText:setAnchorPoint(descLabel:getAnchorPoint())
				descText:setPosition(cc.p(descLabel:getPosition()))
				descText:addTo(descLabel:getParent())
				text_name:setString(Strings:get("BATTLE_SectSkill_Unactivated"))

				lineCount = descText:getLineCount()
			else
				local descKey = ConfigReader:getDataByNameIdAndKey("Skill", skillId, "Desc_short")
				local name = ConfigReader:getDataByNameIdAndKey("Skill", skillId, "Name")
				local fontSize = 16
				local height = 200
				local descText = nil

				repeat
					local desc = ConfigReader:getEffectDesc("Skill", descKey, skillId, skillLv, {
						fontColor = "#DFDFDF",
						fontName = TTF_FONT_FZYH_M,
						fontSize = fontSize
					})
					descText = ccui.RichText:createWithXML(desc, {})

					descText:renderContent(descLabel:getContentSize().width, 0, true)

					height = descText:getContentSize().height
					fontSize = fontSize - 1
				until height <= 55 or fontSize < 2

				descText:setAnchorPoint(descLabel:getAnchorPoint())
				descText:setPosition(cc.p(descLabel:getPosition()))
				descText:addTo(descLabel:getParent())
				text_name:setString(Strings:get(name))

				lineCount = descText:getLineCount()
			end

			if info.master then
				local tagImg = cell:getChildByName("Image_master")
				local Text_1 = tagImg:getChildByName("Text_1")

				tagImg:setContentSize(cc.size(Text_1:getContentSize().width + 13, 23))
				Text_1:setPositionX(3)
				tagImg:setVisible(true)
				tagImg:setPositionX(text_name:getPositionX() + text_name:getContentSize().width + 4)
			else
				local tempTagImg = cell:getChildByName("Image_temp")
				local Text_1 = tempTagImg:getChildByName("Text_1")

				tempTagImg:setContentSize(cc.size(Text_1:getContentSize().width + 13, 23))
				Text_1:setPositionX(3)

				local heroTagImg = cell:getChildByName("Image_hero")
				local Text_2 = heroTagImg:getChildByName("Text_1")

				heroTagImg:setContentSize(cc.size(Text_2:getContentSize().width + 13, 23))
				Text_2:setPositionX(3)
				tempTagImg:setPositionX(text_name:getPositionX() + text_name:getContentSize().width + 4)
				heroTagImg:setPositionX(text_name:getPositionX() + text_name:getContentSize().width + 4)

				if info.temp then
					tempTagImg:setVisible(true)
					heroTagImg:setVisible(false)
				end
			end

			return image, lineCount
		end
	end

	local listview = self:createListView(baseShowNode)
	local height = 0

	for index = 1, #passiveSkill do
		local skillInfo = passiveSkill[index]

		if skillInfo.master then
			local panelClone = self._panel_1:clone()

			panelClone:setVisible(true)

			if #passiveSkill == 1 then
				panelClone:getChildByName("Image_line"):setVisible(false)
			end

			local icon = refreshSkillCell(panelClone, skillInfo)

			if icon then
				icon:setScale(0.33)
			end

			height = height + panelClone:getContentSize().height

			listview:pushBackCustomItem(panelClone)
		else
			local panelClone = self._panel_2:clone()

			panelClone:setVisible(true)

			if #passiveSkill == index then
				panelClone:getChildByName("Image_line"):setVisible(false)
			end

			local icon = refreshSkillCell(panelClone, skillInfo)

			if icon then
				icon:setScale(0.33)
			end

			height = height + panelClone:getContentSize().height

			listview:pushBackCustomItem(panelClone)
		end
	end

	local viewHeight = #passiveSkill > 3 and 300 or height
	local image_bg1 = self._panelBase:getChildByName("Image_bg1")
	local image_bg = self._panelBase:getChildByName("Image_bg")

	image_bg1:setContentSize(cc.size(image_bg1:getContentSize().width, viewHeight + 3))
	image_bg:setContentSize(cc.size(image_bg:getContentSize().width, viewHeight + 18))
	listview:setContentSize(cc.size(image_bg:getContentSize().width - 10, viewHeight))
	listview:setPosition(cc.p(-3, -viewHeight))
end

function BattlePassiveSkillTip:hide()
	self:getView():setVisible(false)
end

function BattlePassiveSkillTip:onClickHide()
	self._listener:hidePassiveSkillTip()
end

function BattlePassiveSkillTip:createListView(parent)
	local listview = ccui.ListView:create()

	parent:addChild(listview)
	listview:setAnchorPoint(cc.p(0, 0))
	listview:setScrollBarEnabled(false)
	listview:setItemsMargin(0)
	listview:setDirection(ccui.ListViewDirection.vertical)

	return listview
end
