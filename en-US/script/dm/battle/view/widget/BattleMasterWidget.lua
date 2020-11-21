local floor = math.floor
BattleMasterWidget = class("BattleMasterWidget", BattleWidget, _M)

function BattleMasterWidget:initialize(view)
	super.initialize(self, view)
	self:setupView(view)
end

function BattleMasterWidget:setupView(view)
	self._grayCover = view:getChildByFullName("gray_cover")
	self._skillNode = view:getChildByName("skill_node")
	self._skillWidgets = {}

	for i = 1, 3 do
		local node = self._skillNode:getChildByName("skill" .. i)
		local skillWidget = node:getChildByName("skill")
		self._skillWidgets[i] = skillWidget
		local anim = cc.MovieClip:create("qbbbbbbbb_jinenganniu")

		anim:addTo(node)
		skillWidget:changeParent(anim:getChildByName("icon"))
		anim:gotoAndStop(1)
		anim:addCallbackAtFrame(107, function (cid, mc)
			mc:gotoAndPlay(57)
		end)
		anim:addCallbackAtFrame(144, function (cid, mc)
			mc:gotoAndPlay(110)
		end)
		anim:addCallbackAtFrame(170, function (cid, mc)
			mc:gotoAndStop(1)
		end)
	end

	view:setVisible(false)
end

function BattleMasterWidget:setupSkills(skills)
	self:getView():setVisible(true)

	self._skills = skills or {}

	for i = 1, 3 do
		local node = self._skillNode:getChildByName("skill" .. i)

		node:setVisible(true)

		local skillWidget = self._skillWidgets[i]
		local skill = self._skills[i]
		local anim = skillWidget:getParent():getParent()

		anim:gotoAndStop(1)

		if skill and type(skill) == "table" then
			skillWidget:getChildByName("icon"):loadTexture("asset/skillIcon/" .. skill.icon .. ".png")

			skillWidget.skillType = skill.type
			skillWidget.skillId = skill.id
			skillWidget.level = skill.level

			skillWidget:addTouchEventListener(function (sender, eventType)
				self:onClickedSkill(sender, eventType)
			end)
			node:getChildByName("tagIcon"):setVisible(false)

			local masterSkillTag = ConfigReader:getDataByNameIdAndKey("Skill", skill.id, "MasterSkillTag")

			if masterSkillTag and masterSkillTag ~= "" then
				node:getChildByName("tagIcon"):setLocalZOrder(2)
				node:getChildByName("tagIcon"):setVisible(true)
				node:getChildByName("tagIcon"):loadTexture(masterSkillTag .. ".png", ccui.TextureResType.plistType)
			else
				node:getChildByName("tagIcon"):setVisible(false)
			end
		else
			node:setVisible(false)
			skillWidget:addTouchEventListener(function (sender, eventType)
				self._listener:getMainMediator():dispatch(ShowTipEvent({
					tip = "没有该技能或技能未解锁"
				}))
			end)
		end
	end
end

function BattleMasterWidget:setListener(listener)
	self._listener = listener
end

function BattleMasterWidget:setHp(value)
	self._hp = math.min(value, self._maxHp)
	self._hp = math.max(value, 0)

	if self._hp <= 0 then
		-- Nothing
	end
end

function BattleMasterWidget:setRp(value)
	self._mp = math.min(value, self._maxMp)
	self._mp = math.max(value, 0)

	if self._maxMp <= self._mp then
		if not self._executing then
			self:showSkillNode()
		end
	else
		self._executing = false

		self:hideSkillNode()
	end
end

function BattleMasterWidget:updateMasterInfo(data)
	self._maxHp = data.maxHp
	self._maxMp = data.maxMp

	self:setupSkills(data.skills)
	self:setRp(data.mp)
	self:setHp(data.hp)
end

function BattleMasterWidget:setTouchEnabled(enabled)
	self._touchEnabled = enabled
end

function BattleMasterWidget:isTouchEnabled()
	return self._touchEnabled
end

function BattleMasterWidget:getCurMasterSkillType()
	return self._curMasterSkillType or nil
end

function BattleMasterWidget:onClickedSkill(sender, eventType)
	if eventType == ccui.TouchEventType.began then
		if self._listener then
			local parentView = sender:getParent()
			local pos = parentView:convertToWorldSpace(cc.p(sender:getPosition()))

			self._listener:showSkillTip(sender.skillId, sender.level, cc.p(pos.x + 100 + 0 * AdjustUtils.getSafeX(), pos.y + 50))
		end
	elseif eventType == ccui.TouchEventType.canceled then
		if self._listener then
			self._listener:hideSkillTip()
		end
	elseif eventType == ccui.TouchEventType.ended and self._listener then
		self._listener:hideSkillTip()
	end

	if not self._touchEnabled then
		return
	end

	if self._executing then
		return
	end

	if sender.skillEnabled and eventType == ccui.TouchEventType.ended then
		self:executeSkill(sender)
	end
end

function BattleMasterWidget:executeSkill(sender)
	local skillType = sender.skillType

	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)

	self._curMasterSkillType = skillType

	self:setSkillTouchEnabled(false)
	self._listener:applyMasterSkill(self, skillType)
end

function BattleMasterWidget:willExecute()
	self._executing = true

	for i, skill in ipairs(self._skills) do
		if skill and type(skill) == "table" then
			local skillWidget = self._skillWidgets[i]
			skillWidget.skillEnabled = false

			if skillWidget.skillType == self._curMasterSkillType then
				local anim = skillWidget:getParent():getParent()

				anim:gotoAndPlay(108)
			else
				local anim = skillWidget:getParent():getParent()

				anim:gotoAndStop(1)
			end
		end
	end
end

function BattleMasterWidget:cancelExecute(rp)
	self._executing = false

	self:setRp(rp)
end

function BattleMasterWidget:getSkillNode(index)
	local skill = self._skills[index]

	if skill and type(skill) == "table" then
		local skillWidget = self._skillWidgets[index]

		return skillWidget
	end
end

function BattleMasterWidget:showSkillNode()
	self._grayCover:setVisible(false)

	local willSound = true
	local canSound = false

	for i, skill in ipairs(self._skills) do
		if skill and type(skill) == "table" then
			canSound = true
			local skillWidget = self._skillWidgets[i]

			if skillWidget.skillEnabled then
				willSound = false
			end

			skillWidget.skillEnabled = true
			local anim = skillWidget:getParent():getParent()
			local frameIndex = anim:getCurrentFrame()

			if frameIndex > 107 or frameIndex < 14 then
				anim:gotoAndPlay(14)
			end
		end
	end

	if willSound and canSound then
		AudioEngine:getInstance():playEffect("Se_Alert_Char_Ready", false)
	end
end

function BattleMasterWidget:hideSkillNode()
	self._grayCover:setVisible(true)

	for i, skill in ipairs(self._skills) do
		if skill and type(skill) == "table" then
			local skillWidget = self._skillWidgets[i]
			skillWidget.skillEnabled = false
			local anim = skillWidget:getParent():getParent()
			local frameIndex = anim:getCurrentFrame()

			if frameIndex <= 144 then
				anim:gotoAndStop(1)
			end
		end
	end
end

function BattleMasterWidget:setSkillTouchEnabled(isTrue)
	local skillNode = self:getView():getChildByName("skill_node")

	for i, skill in ipairs(self._skills) do
		if skill and type(skill) == "table" then
			local skillWidget = self._skillWidgets[i]

			skillWidget:setTouchEnabled(isTrue)
		end
	end
end

function BattleMasterWidget:onDoSkill(data)
	if data.type == self:getCurMasterSkillType() then
		for i = 1, 3 do
			local skillWidget = self._skillWidgets[i]

			if skillWidget.skillType == self._curMasterSkillType then
				local anim = skillWidget:getParent():getParent()

				anim:gotoAndPlay(145)
			end
		end
	end
end
