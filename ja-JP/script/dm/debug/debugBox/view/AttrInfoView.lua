AttrInfoView = class("AttrInfoView", DebugViewTemplate, _M)

function AttrInfoView:initialize()
	self._opType = 100
	self._viewConfig = {
		{
			default = "100026",
			name = "id",
			title = "ID",
			type = "Input"
		},
		{
			default = "ALL",
			name = "evnType",
			title = "环境类型",
			type = "Input"
		}
	}
end

function AttrInfoView:onClick(data)
	self:initData(data)
	self:createPanelLayer()
	self:createAttr()
	dump(data, "AttrInfoView____")
end

function AttrInfoView:initData(data)
	self._roleId = data.id
	self._evnType = data.evnType
	self._attrType = data.attrType
	self._player = Player:getInstance()
	self._heroFacade = self:getInjector():getInstance(HeroFacade)
	self._masterCultivateFacade = self:getInjector():getInstance(MasterCultivateFacade)
	self._parent = cc.Director:getInstance():getRunningScene()
	self._singleRole = nil
	self._isHero = false
	self._nameStr = ""

	if ConfigReader:getRecordById("HeroBase", data.id) then
		self._singleRole = self._heroFacade:getHeroById(data.id)
		self._isHero = true
	elseif ConfigReader:getRecordById("MasterBase", data.id) then
		self._singleRole = self._masterCultivateFacade:getMasterById(data.id)
	end
end

function AttrInfoView:createPanelLayer()
	local winSize = cc.Director:getInstance():getWinSize()
	self._mainPanel = ccui.Layout:create()

	self._mainPanel:setContentSize(cc.size(winSize.width, winSize.height))
	self._mainPanel:setTouchEnabled(true)
	self._parent:addChild(self._mainPanel, 999999)
	UIHelper:showLayoutForTest(self._mainPanel, cc.c4b(0, 0, 0, 255))

	self._listView = self:getInjector():getInstance("SkillShowTipView"):getChildByFullName("main.listview"):clone()

	self._listView:removeAllItems()
	self._mainPanel:addChild(self._listView)
	self._listView:setAnchorPoint(cc.p(0, 0))
	self._listView:setPosition(cc.p(120, 20))
	self._listView:setContentSize(cc.size(winSize.width - 200, winSize.height - 200))

	local closeBtn = ccui.Button:create(DebugBoxTool:getResPath("pic_dm_debug_ok_normal.png"), DebugBoxTool:getResPath("pic_dm_debug_ok_press.png"), "")

	closeBtn:setName("closeBtn")
	closeBtn:setScale(2)
	self._mainPanel:addChild(closeBtn, 0)
	closeBtn:setPosition(winSize.width - 100, winSize.height - 100)
	closeBtn:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			self._mainPanel:removeFromParent(true)
		end
	end)
end

function AttrInfoView:addSingleAttr(str, color, fontSize, closeLine)
	if not closeLine then
		str = str .. "\n-------------------------------------------------------------"
	end

	local newPanel = self:createDescPanel(str, color, fontSize)

	self._listView:pushBackCustomItem(newPanel)
end

function AttrInfoView:createDescPanel(title, colorNum, fontSize)
	local winSize = cc.Director:getInstance():getWinSize()
	local otherHeight = otherHeight or 4
	fontSize = fontSize or 22
	local layout = ccui.Layout:create()
	local label = MediatorHandleHelper:createLabel(fontSize)

	if colorNum then
		label:setTextColor(colorNum)
	end

	local posX = 12
	local shiftWidth = 6

	label:setAnchorPoint(cc.p(0.5, 0.5))
	label:setDimensions(winSize.width - 200, 0)
	label:setString(tostring(title))

	local height = label:getContentSize().height

	layout:setContentSize(cc.size(winSize.width - 200, height))
	UIHelper:centerAddNode(layout, label)
	UIHelper:quickShiftNode(label, cc.p(-4, 0))

	return layout
end

function AttrInfoView:createAttr()
	local attrFactor = self._singleRole:getAttrFactor()
	local combat, attrData = self._singleRole:getCombat(self._evnType)

	dump(attrData, "attrData_____")

	local str1 = self._isHero and "英雄" or "主角"
	str1 = str1 .. ":" .. self._singleRole:getName() .. "         ID = " .. tostring(self._roleId) .. "          场景环境 = " .. tostring(self._evnType)

	self:addSingleAttr(str1, cc.c3b(210, 0, 0), 30)

	local str1 = "\n\n一. 总战斗力= " .. tostring(combat) .. "\n"

	self:addSingleAttr(str1, cc.c3b(210, 0, 0))

	local str1 = "战斗力公式\n"

	if ConfigReader:getRecordById("HeroBase", self._roleId) then
		str1 = str1 .. FormulaUtil.heroCombatDesc
	else
		str1 = str1 .. FormulaUtil.masterCombatDesc
	end

	str1 = str1 .. [[


二. 每种属性总值
每种属性有参数组成  说明：

  1. 基础属性{攻防血} result= (a * (1 + b) + c) * (1 + d) + f 
 [参数说明 a : 属性基础值 b : 百分比加成 c : 额外值加成 d : 环境百分比加成 f : 环境额外值加成] 
]]
	str1 = str1 .. [[

  2. 概率属性result= a + b
 [参数说明 a 值加成 b 额外值加成]

]]

	self:addSingleAttr(str1)

	local str1 = "一.基础属性\n"

	self:addSingleAttr(str1, cc.c3b(210, 0, 0))

	local str1 = self:getStrByAttrType("HP", attrData.hp, "生命：")
	local str1 = self:getStrByAttrType("ATK", attrData.attack, "攻击：")
	local str1 = self:getStrByAttrType("DEF", attrData.defense, "防御：")
	local str1 = "二.概率属性\n"
	local str1 = self:getStrByAttrType("CRITRATE", attrData.critRate, "暴击率：")
	local str1 = self:getStrByAttrType("UNCRITRATE", attrData.uncritRate, "抗暴率：")
	local str1 = self:getStrByAttrType("CRITSTRG", attrData.critStrg, "暴击强度：")
	local str1 = self:getStrByAttrType("BLOCKRATE", attrData.blockRate, "格挡率：")
	local str1 = self:getStrByAttrType("UNBLOCKRATE", attrData.unblockRate, "破击率：")
	local str1 = self:getStrByAttrType("BLOCKSTRG", attrData.blockStrg, "格挡强度：")
	local str1 = self:getStrByAttrType("HURTRATE", attrData.hurtRate, "伤害率：")
	local str1 = self:getStrByAttrType("UNHURTRATE", attrData.unhurtRate, "免伤率：")
	local str1 = self:getStrByAttrType("ABSORPTION", attrData.absorption, "吸血率：")
	local str1 = self:getStrByAttrType("REFLECTION", attrData.reflection, "反弹率：")

	dump(str1, "str1____")
	dump(vector, "vector_____")
end

local factors = {
	"a",
	"b",
	"c",
	"d",
	"e",
	"f"
}

function AttrInfoView:getStrByAttrType(attrType, attrNum, attrName)
	local attrFactor = self._singleRole:getAttrFactor()
	local vector = attrFactor:getVector(attrType)
	attrName = attrName or ""
	local data = {}
	local serverAttr = self._singleRole._attrs.details[attrType]

	for i = 1, #serverAttr do
		local element = factors[i]
		data[element] = serverAttr[i]
	end

	data = "服务器计算 --" .. cjsonSafeEncode(data)
	data = string.gsub(data, ":", " = ")
	data = string.gsub(data, ",", " , ")

	self:addSingleAttr(data, cc.c3b(210, 0, 0), nil, true)

	local str = "前端计算 --" .. attrName .. "    "

	self:addSingleAttr(str, cc.c3b(210, 0, 0), nil, true)

	local vectorStr = tostring(attrType) .. " = " .. cjsonSafeEncode(vector)
	vectorStr = string.gsub(vectorStr, ":", " = ")
	vectorStr = string.gsub(vectorStr, ",", " , ")
	local str = vectorStr .. "  最终值 = " .. tostring(attrNum) .. "\n"

	self:addSingleAttr(str, nil, , true)

	local data = {}
	local singleEffectManger = self._singleRole:getEffectManager()
	local effectList = singleEffectManger:getEffectList()

	self:createElementStr(effectList, data, attrType)
	dump(elementStr, "dataelementMap_____")

	local rangeEffectManger = self._player:getEffectManager()
	local effectList = rangeEffectManger:getEffectList()

	self:createElementStr(effectList, data, attrType)
	dump(data, "data_____1")

	local elementStr = cjsonSafeEncode(data)

	if not next(data) then
		elementStr = "\n该属性未有属性加成"
	end

	elementStr = string.gsub(elementStr, ":", " = ")
	elementStr = string.gsub(elementStr, ",", " ,\n ")
	elementStr = string.gsub(elementStr, "%!", "\n        ")

	self:addSingleAttr(elementStr, cc.c3b(255, 252, 0), nil)

	return elementStr .. "\n"
end

function AttrInfoView:createElementStr(effectList, data, attrType)
	for effect, _ in pairs(effectList) do
		local effectFromName = effect._effectFromName
		effectFromName = "!" .. effectFromName
		local effects = {
			effect
		}

		if effect._getSubeffects then
			effects = effect:_getSubeffects()
		end

		for _, e in pairs(effects) do
			local config = e:getConfig()
			local elementType = config.elementType
			local evnOk = config.effectEvn == GameEnvType.kAll or self._evnType and self._evnType == config.effectEvn
			local target = config.target
			local targetOk = target == "SELF" or target == RangeTargetType.ALL or self._isHero and target == RangeTargetType.HERO or not self._isHero and target == RangeTargetType.MASTER

			if config.attrType == attrType and evnOk and targetOk then
				if not data[elementType] then
					data[elementType] = {}
				end

				local elementMap = data[elementType]

				if not elementMap[effectFromName] then
					elementMap[effectFromName] = 0
				end

				elementMap[effectFromName] = elementMap[effectFromName] + config.attrNum
			end
		end
	end
end
