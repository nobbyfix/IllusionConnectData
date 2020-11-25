MasterLeaderSkillMediator = class("MasterLeaderSkillMediator", DmPopupViewMediator, _M)

MasterLeaderSkillMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
MasterLeaderSkillMediator:has("_towerSystem", {
	is = "r"
}):injectWith("TowerSystem")

local kHandlerBtn = {
	["main.BG.btn_close"] = {
		clickAudio = "Se_Click_Close_2",
		func = "onCloseBtnClick"
	},
	["main.BG"] = {
		clickAudio = "Se_Click_Close_2",
		func = "onCloseBtnClick"
	}
}

function MasterLeaderSkillMediator:initialize()
	super.initialize(self)
end

function MasterLeaderSkillMediator:dispose()
	super.dispose(self)
end

function MasterLeaderSkillMediator:onRegister()
	super.onRegister(self)

	self._masterSystem = self._developSystem:getMasterSystem()

	self:mapButtonHandlersClick(kHandlerBtn)
end

function MasterLeaderSkillMediator:enterWithData(data)
	self:initNode()
	self:initData(data)
	self:createSkillList()
	self:createMasterStandRole()
	self:setupClickEnvs()
end

function MasterLeaderSkillMediator:initNode()
	self._masterSystem:getMasterLeaderSkillNum()

	self._mainPanel = self:getView():getChildByFullName("main")
	self._skillList = self._mainPanel:getChildByFullName("infoList")
	self._cloneSkill = self:getView():getChildByFullName("cellClone")
	self._rolePanel = self._mainPanel:getChildByFullName("BG.role_panel")
end

function MasterLeaderSkillMediator:initData(data)
	self._towerMaster = data.towerMaster or false

	if self._towerMaster then
		self._master = data.master
	else
		self._masterId = data.masterId
		self._masterShowList = self._masterSystem:getShowMasterList()
		self._master = nil

		for _, v in ipairs(self._masterShowList) do
			if v:getId() == self._masterId then
				self._master = v
			end
		end
	end

	self._active = data.active

	if self._active == nil then
		self._active = {}
	end
end

function MasterLeaderSkillMediator:setupClickEnvs()
	if GameConfigs.closeGuide then
		return
	end
end

function MasterLeaderSkillMediator:createSkillList()
	local function scrollViewDidScroll(table)
		if table:isTouchMoved() then
			-- Nothing
		end
	end

	local function tableCellTouch(table, cell)
	end

	local function cellSizeForTable(table, idx)
		return self._cloneSkill:getContentSize().width, self._cloneSkill:getContentSize().height + 7
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()
		local isActive = self._active[idx + 1]

		if cell == nil then
			cell = cc.TableViewCell:new()
			local sprite = self._cloneSkill:clone()

			sprite:setPosition(0, 0)
			cell:addChild(sprite)
			sprite:setVisible(true)
			sprite:setTag(10000)

			local cell_Old = cell:getChildByTag(10000)

			self:refreshSkillCell(cell_Old, idx + 1, isActive)
			cell:setTag(idx + 1)
		else
			local cell_Old = cell:getChildByTag(10000)

			self:refreshSkillCell(cell_Old, idx + 1, isActive)
			cell:setTag(idx + 1)
		end

		return cell
	end

	local function numberOfCellsInTableView(table)
		return self._masterSystem:getMasterLeaderSkillNum()
	end

	local size, pos = self:getTableViewSize()
	local tableView = cc.TableView:create(size)

	tableView:setTag(1234)

	self._tableView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setPosition(pos)
	tableView:setAnchorPoint(0, 0)
	tableView:setDelegate()
	self._skillList:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:registerScriptHandler(tableCellTouch, cc.TABLECELL_TOUCHED)
	tableView:reloadData()
end

function MasterLeaderSkillMediator:getTableViewSize()
	return cc.size(700, 390), cc.p(0, 0)
end

function MasterLeaderSkillMediator:refreshSkillCell(cell, index, isActive)
	local infoPanel = cell:getChildByName("info_panel")
	local name = cell:getChildByName("skill_name")
	local iconNode = cell:getChildByName("icon_node")
	local skillTagBg = cell:getChildByName("state_di")
	local skillTagText = cell:getChildByName("state")
	local skills = {}

	if self._towerMaster then
		skills = self._master:getSkillList()
	else
		skills = self._masterSystem:getMasterLeaderSkillList(self._masterId)
	end

	local skill = skills[index]

	if not skill then
		return
	end

	local starHeight = -7

	name:setString(skill:getName())
	infoPanel:removeAllChildren()

	local isShowEff = isActive
	local isShowGray = isActive or isActive == nil

	infoPanel:setLayoutType(ccui.LayoutType.VERTICAL)

	local height = self:createSkillDescPanel(infoPanel, skill, isShowGray, starHeight)

	self:createEffectDescPanel(infoPanel, skill, isShowGray, height)

	if isShowGray then
		name:setColor(cc.c3b(255, 165, 0))
		skillTagText:setColor(cc.c3b(255, 255, 255))
		skillTagBg:setVisible(false)
		skillTagText:setVisible(false)
	else
		name:setColor(cc.c3b(195, 195, 195))
		skillTagText:setColor(cc.c3b(195, 195, 195))
		skillTagBg:setVisible(true)
		skillTagText:setVisible(true)
	end

	local dicengEff = cc.MovieClip:create("diceng_jinengjihuo")

	dicengEff:setAnchorPoint(0.5, 0.5)
	dicengEff:setPosition(cc.p(47.5, 50))
	dicengEff:setScale(0.98)
	dicengEff:setVisible(isShowEff)

	local shangcengEff = cc.MovieClip:create("shangceng_jinengjihuo")

	shangcengEff:setAnchorPoint(0.5, 0.5)
	shangcengEff:setPosition(cc.p(47.5, 50))
	shangcengEff:setScale(0.97)
	shangcengEff:setVisible(isShowEff)

	local info = {
		levelHide = true,
		id = skill:getId(),
		skillType = skill:getSkillType()
	}
	local newSkillNode = IconFactory:createMasterSkillIcon(info)

	newSkillNode:setAnchorPoint(0.5, 0.5)
	newSkillNode:setScale(0.65)
	newSkillNode:setPosition(cc.p(17, 20))
	newSkillNode:setGray(not isShowGray)
	iconNode:removeAllChildren()
	iconNode:addChild(dicengEff)
	iconNode:addChild(newSkillNode)
	iconNode:addChild(shangcengEff)
	iconNode:setTouchEnabled(false)
end

local listWidth = 520
local SKILL_EFF_TAG = 1001
local SKILL_DESC_TAG = 1000

function MasterLeaderSkillMediator:createSkillDescPanel(layout, skill, isActive, heightAdd)
	local style = {
		fontName = TTF_FONT_FZYH_M
	}
	local desc = ConfigReader:getEffectDesc("Skill", skill:getMasterSkillDescKey(), skill:getId(), skill:getLevel(), style)
	local label = layout:getChildByTag(SKILL_DESC_TAG)

	if label == nil then
		label = ccui.RichText:createWithXML(desc, {})

		label:addTo(layout)
	else
		label:setString(desc)
	end

	local language = getCurrentLanguage()

	if language ~= GameLanguageType.CN then
		label:setVerticalSpace(1)
	else
		label:setVerticalSpace(8)
	end

	label:renderContent(listWidth, 0)

	local height = label:getContentSize().height

	layout:setContentSize(cc.size(listWidth, height))
	label:setTag(SKILL_DESC_TAG)

	if isActive then
		label:setColor(cc.c3b(255, 255, 255))
	else
		label:setColor(cc.c3b(195, 195, 195))
	end

	return height
end

function MasterLeaderSkillMediator:createEffectDescPanel(layout, skill, isActive, heightAdd)
	local skillProto = PrototypeFactory:getInstance():getSkillPrototype(skill:getId())
	local attrDescs = skillProto:getAttrDescs(skill:getLevel(), style) or {}
	local desc = table.concat(attrDescs, ", ", 1, #attrDescs)
	local label = layout:getChildByTag(SKILL_EFF_TAG)

	if label == nil then
		label = ccui.RichText:createWithXML(desc, {})

		label:addTo(layout)
	else
		label:setString(desc)
	end

	local language = getCurrentLanguage()

	if language ~= GameLanguageType.CN then
		label:setVerticalSpace(1)
	else
		label:setVerticalSpace(8)
	end

	label:renderContent(listWidth, 0)

	local height = label:getContentSize().height + heightAdd

	layout:setContentSize(cc.size(listWidth, height))

	if isActive then
		label:setColor(cc.c3b(255, 255, 255))
	else
		label:setColor(cc.c3b(195, 195, 195))
	end

	return height
end

function MasterLeaderSkillMediator:createMasterStandRole()
	local info = {
		stencil = 1,
		iconType = "Bust1",
		id = self._master:getModel(),
		size = cc.size(202, 424)
	}

	self._rolePanel:removeAllChildren()

	local rolePic = IconFactory:createRoleIconSprite(info)

	if rolePic then
		rolePic:addTo(self._rolePanel)
		rolePic:setPosition(103, 217)
	end
end

function MasterLeaderSkillMediator:onCloseBtnClick()
	self:close()
end
