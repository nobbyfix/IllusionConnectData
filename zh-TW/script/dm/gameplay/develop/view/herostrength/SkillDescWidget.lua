SkillDescWidget = class("SkillDescWidget", BaseWidget, _M)
local listWidth = 291

function SkillDescWidget.class:createWidgetNode()
	local resFile = "asset/ui/SkillDescWidget.csb"

	return cc.CSLoader:createNode(resFile)
end

function SkillDescWidget:initialize(view, data)
	super.initialize(self, view)

	self._skill = data.skill
	self._mediator = data.mediator

	self:initSubviews(view)
end

function SkillDescWidget:dispose()
	super.dispose(self)
end

function SkillDescWidget:initSubviews(view)
	self._view = view
	self._skillTipPanel = self._view:getChildByName("skillTipPanel")
	local skillTouchPanel = self._skillTipPanel:getChildByFullName("skillTouchPanel")

	skillTouchPanel:setSwallowTouches(false)
	skillTouchPanel:addClickEventListener(function ()
		self:hide()
	end)
end

function SkillDescWidget:refreshInfo(skill, role, isMaster)
	self._role = role
	self._isMaster = isMaster
	local infoNode = self._skillTipPanel:getChildByFullName("infoNode")
	local iconPanel = infoNode:getChildByFullName("iconPanel")

	iconPanel:removeAllChildren()

	if self._isMaster then
		local skillIcon = IconFactory:createMasterSkillIcon({
			levelHide = true,
			id = skill:getId(),
			skillType = skill:getSkillType()
		})

		skillIcon:addTo(iconPanel):posite(10, 16)
		skillIcon:setScale(0.5)
	else
		local newSkillNode = IconFactory:createHeroSkillIcon({
			id = skill:getSkillId(),
			isLock = not skill:getEnable()
		}, {
			hideLevel = true
		})

		newSkillNode:addTo(iconPanel):center(iconPanel:getContentSize())
		newSkillNode:setScale(0.7)
	end

	local skillType = skill:getType()
	local skillAnimPanel = infoNode:getChildByFullName("skillAnim")

	skillAnimPanel:removeChildByName("SkillAnim")

	local skillPanel1 = skillAnimPanel:getChildByFullName("skillTypeIcon")

	skillPanel1:setVisible(true)

	local skillPanel2 = skillAnimPanel:getChildByFullName("skillTypeBg")

	skillPanel2:setVisible(true)

	local icon1, icon2 = nil

	if self._isMaster then
		skillType = skill:getSkillType()
		icon1, icon2 = self._mediator._masterSystem:getSkillTypeIcon(skillType)
	else
		icon1, icon2 = self._mediator._heroSystem:getSkillTypeIcon(skillType)
	end

	local skillTypeIcon = skillPanel1:getChildByFullName("icon")

	skillTypeIcon:loadTexture(icon1)

	local skillTypeBg = skillPanel2:getChildByFullName("bg")

	skillTypeBg:loadTexture(icon2)
	skillTypeBg:setCapInsets(cc.rect(4, 15, 6, 16))

	local typeNameLabel = skillPanel2:getChildByFullName("skillType")

	if self._isMaster then
		typeNameLabel:setString(self._mediator._masterSystem:getSkillTypeName(skillType))
	else
		typeNameLabel:setString(self._mediator._heroSystem:getSkillTypeName(skillType))
	end

	typeNameLabel:setTextColor(GameStyle:getSkillTypeColor(skillType))

	local width = typeNameLabel:getContentSize().width + 30

	skillTypeBg:setContentSize(cc.size(width, 38))
	skillAnimPanel:setContentSize(cc.size(width + 25, 46))

	if skillType == SkillType.kUltra or skillType == SkillType.kSuper then
		skillPanel1:setVisible(false)
		skillPanel2:setVisible(false)

		local node1 = skillPanel1:clone()

		node1:setVisible(true)

		local node2 = skillPanel2:clone()

		node2:setVisible(true)

		local anim = cc.MovieClip:create("dh_biaoshiguangxiao")

		anim:setName("SkillAnim")
		anim:addTo(skillAnimPanel)

		local panel = anim:getChildByFullName("skill")

		panel:addChild(node1)
		panel:addChild(node2)
		node2:setPosition(cc.p(-36, -19))
		node1:setPosition(cc.p(-36, 0))
		anim:setPosition(cc.p(60, 23))

		local skillClone1 = node1:clone()
		local skillClone2 = node2:clone()
		local panel1 = anim:getChildByFullName("skill1")

		panel1:addChild(skillClone2)
		panel1:addChild(skillClone1)
	end

	local name = infoNode:getChildByFullName("name")

	name:setString(skill:getName())

	local bg = self._skillTipPanel:getChildByName("Image_bg")
	local desc = self._skillTipPanel:getChildByName("desc")

	desc:setString("")
	desc:removeAllChildren()

	local descStr = {}
	local height = 0
	local skillDesc = self._isMaster and skill:getMasterSkillDescKey() or skill:getDesc()

	if skillDesc and skillDesc ~= "" then
		local style = {
			fontSize = 20,
			fontName = TTF_FONT_FZYH_R
		}

		if not self._isMaster then
			style = {
				fontSize = 20,
				SkillRate = self._role:getSkillRateShow(),
				fontName = TTF_FONT_FZYH_R
			}
		end

		local newPanel = self:createSkillDescPanel(skillDesc, skill, style)

		newPanel:setAnchorPoint(cc.p(0, 0))
		newPanel:addTo(desc)
		table.insert(descStr, {
			newPanel = newPanel,
			height = newPanel:getContentSize().height
		})

		height = height + newPanel:getContentSize().height
	end

	local skillProto = PrototypeFactory:getInstance():getSkillPrototype(skill:getSkillProId())

	if skillProto then
		local style = {
			fontSize = 20,
			fontName = TTF_FONT_FZYH_R
		}
		local attrDescs = skillProto:getAttrDescs(skill:getLevel(), style) or {}

		for i = 1, #attrDescs do
			local newPanel = self:createEffectDescPanel(attrDescs[i])

			newPanel:setAnchorPoint(cc.p(0, 0))
			newPanel:addTo(desc)
			table.insert(descStr, {
				newPanel = newPanel,
				height = newPanel:getContentSize().height
			})

			height = height + newPanel:getContentSize().height
		end
	end

	for i = #descStr, 1, -1 do
		local newPanel = descStr[i].newPanel

		if i == #descStr then
			newPanel:setPositionY(0)
		else
			local posY = descStr[i + 1].height

			newPanel:setPositionY(posY)
		end
	end

	height = height + 110

	bg:setContentSize(cc.size(332, height))
	infoNode:setPositionY(height - 90)
end

function SkillDescWidget:createSkillDescPanel(title, skill, style)
	local layout = ccui.Layout:create()
	local strWidth = listWidth
	local desc = ConfigReader:getEffectDesc("Skill", title, skill:getSkillProId(), skill:getLevel(), style)
	local label = ccui.RichText:createWithXML(desc, {})

	label:setVerticalSpace(1)
	label:renderContent(strWidth, 0)
	label:setAnchorPoint(cc.p(0, 1))

	local height = label:getContentSize().height

	layout:setContentSize(cc.size(strWidth, height))
	label:addTo(layout)
	label:setPosition(cc.p(0, height))

	return layout
end

function SkillDescWidget:createEffectDescPanel(desc)
	local strWidth = listWidth
	local layout = ccui.Layout:create()
	local label = ccui.RichText:createWithXML(desc, {})

	label:setVerticalSpace(1)
	label:renderContent(strWidth, 0)
	label:setAnchorPoint(cc.p(0, 1))

	local height = label:getContentSize().height

	layout:setContentSize(cc.size(strWidth, height))
	label:addTo(layout)
	label:setPosition(cc.p(0, height))

	return layout
end

function SkillDescWidget:getWidth()
	return self._bg:getContentSize().width
end

function SkillDescWidget:getHeight()
	return self._bg:getContentSize().height
end

function SkillDescWidget:show()
	self._view:setVisible(true)
end

function SkillDescWidget:hide()
	self._view:setVisible(false)
end
