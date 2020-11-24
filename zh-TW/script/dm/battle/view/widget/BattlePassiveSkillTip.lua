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
		local heroImg = cell:getChildByName("Image_hero")
		local Image_line = cell:getChildByName("Image_line")

		if skillId then
			local icon = ConfigReader:getDataByNameIdAndKey("Skill", skillId, "Icon")
			local image = ccui.ImageView:create("asset/skillIcon/" .. icon .. ".png")

			image:addTo(panel_skill):center(panel_skill:getContentSize())

			local textHeight = 18

			if info.lock then
				image:setGray(true)

				local richText = ccui.RichText:createWithXML(Strings:get("BATTLE_SectSkill_Unactivated_Detail", {
					fontSize = 16,
					fontName = TTF_FONT_FZYH_M
				}), {})

				richText:setAnchorPoint(descLabel:getAnchorPoint())
				richText:setPosition(cc.p(descLabel:getPosition()))
				richText:addTo(descLabel:getParent())
				richText:renderContent(descLabel:getContentSize().width, 0, true)
				text_name:setString(Strings:get("BATTLE_SectSkill_Unactivated"))

				textHeight = richText:getContentSize().height
			else
				local descKey = ConfigReader:getDataByNameIdAndKey("Skill", skillId, "Desc_short")
				local name = ConfigReader:getDataByNameIdAndKey("Skill", skillId, "Name")
				local desc = ConfigReader:getEffectDesc("Skill", descKey, skillId, skillLv, {
					fontSize = 16,
					fontColor = "#DFDFDF",
					fontName = TTF_FONT_FZYH_M
				})
				local richText = ccui.RichText:createWithXML(desc, {})

				richText:setAnchorPoint(descLabel:getAnchorPoint())
				richText:setPosition(cc.p(descLabel:getPosition()))
				richText:addTo(descLabel:getParent())
				richText:renderContent(descLabel:getContentSize().width, 0, true)
				text_name:setString(Strings:get(name))

				textHeight = richText:getContentSize().height
			end

			if heroImg then
				if not info.master then
					heroImg:setVisible(true)
					heroImg:setContentSize(cc.size(heroImg:getChildByName("Text_1"):getContentSize().width + 10, heroImg:getContentSize().height))

					if text_name:getContentSize().width > 80 then
						heroImg:setPositionX(text_name:getPositionX() + text_name:getContentSize().width + 6)
					end
				else
					heroImg:setVisible(false)
				end
			end

			if not info.master then
				Image_line:setPositionY(15 - (textHeight > 32 and textHeight - 32 or 0))
			else
				Image_line:setPositionY(10 - (textHeight > 32 and textHeight - 32 or 0))
			end

			return image, textHeight
		end
	end

	local posY = 0
	local height = 0

	for index = 1, #passiveSkill do
		local skillInfo = passiveSkill[index]

		if skillInfo.master then
			local panelClone = self._panel_1:clone()

			panelClone:setVisible(true)
			baseShowNode:addChild(panelClone)
			panelClone:setPosition(cc.p(0, posY))

			if #passiveSkill == 1 then
				panelClone:getChildByName("Image_line"):setVisible(false)
			end

			local icon, textH = refreshSkillCell(panelClone, skillInfo)

			if icon then
				icon:setScale(0.33)
			end

			local h = math.max(78, textH + 50)
			posY = posY - h
			height = height + h
		else
			local panelClone = self._panel_2:clone()

			panelClone:setVisible(true)
			baseShowNode:addChild(panelClone)
			panelClone:setPosition(cc.p(0, posY))

			if #passiveSkill == index then
				panelClone:getChildByName("Image_line"):setVisible(false)
			end

			local icon, textH = refreshSkillCell(panelClone, skillInfo)

			if icon then
				icon:setScale(0.33)
			end

			print("textH", textH)

			local h = math.max(75, textH + 47)
			posY = posY - h
			height = height + h
		end
	end

	local image_bg1 = self._panelBase:getChildByName("Image_bg1")
	local image_bg = self._panelBase:getChildByName("Image_bg")

	image_bg1:setContentSize(cc.size(image_bg1:getContentSize().width, height + 3))
	image_bg:setContentSize(cc.size(image_bg:getContentSize().width, height + 20))
end

function BattlePassiveSkillTip:hide()
	self:getView():setVisible(false)
end

function BattlePassiveSkillTip:onClickHide()
	self._listener:hidePassiveSkillTip()
end
