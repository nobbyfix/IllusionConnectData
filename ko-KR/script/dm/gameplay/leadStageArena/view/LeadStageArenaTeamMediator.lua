require("dm.gameplay.stage.view.CommonTeamMediator")

LeadStageArenaTeamMediator = class("LeadStageArenaTeamMediator", CommonTeamMediator, _M)

LeadStageArenaTeamMediator:has("_stageSystem", {
	is = "r"
}):injectWith("StageSystem")
LeadStageArenaTeamMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
LeadStageArenaTeamMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
LeadStageArenaTeamMediator:has("_leadStageArenaSystem", {
	is = "r"
}):injectWith("LeadStageArenaSystem")

local costType = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Player_Init_Cost_Type", "content")
local kBtnHandlers = {
	["main.info_bg.costBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickCost"
	},
	["main.left.button"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickCardsTurnLeft"
	},
	["main.right.button"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickCardsTurnRight"
	}
}
local kHeroRarityBgAnim = {
	[15.0] = "ssrzong_yingxiongxuanze",
	[13.0] = "srzong_yingxiongxuanze",
	[14.0] = "ssrzong_yingxiongxuanze"
}

function LeadStageArenaTeamMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._fightBtn = self:bindWidget("main.btnPanel.fightBtn", TwoLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_2",
			func = bind1(self.onClickFight, self)
		}
	})
	self._oneKeyWidget = self:bindWidget("main.info_bg.button_one_key_embattle", ThreeLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_2",
			func = bind1(self.onClickOneKeyEmbattle, self)
		}
	})
	self._oneKeyWidget = self:bindWidget("main.info_bg.button_one_key_break", ThreeLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Common_2",
			func = bind1(self.onClickOneKeyBreak, self)
		}
	})
	self._heroSystem = self._developSystem:getHeroSystem()
	self._masterSystem = self._developSystem:getMasterSystem()

	self:mapEventListener(self:getEventDispatcher(), EVT_TEAM_CHANGE_MASTER, self, self.changeMasterId)
	self:mapEventListener(self:getEventDispatcher(), EVT_TEAM_REFRESH_PETS, self, self.refreshViewBySort)
	self:mapEventListener(self:getEventDispatcher(), EVT_ARENA_CHANGE_TEAM_SUCC, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_STAGE_CHANGENAME_SUCC, self, self.refreshTeamName)

	local touchPanel = self:getView():getChildByFullName("main.bg.touchPanel")

	touchPanel:addClickEventListener(function ()
		self._forbidMasters = {}
		local ownTeamInfo = self._leadStageArenaSystem:getOwnTeams()

		for i, teamInfo in ipairs(ownTeamInfo) do
			if i ~= self._teamIndex then
				table.insert(self._forbidMasters, teamInfo.masterId)
			end
		end

		self:onClickChangeMaster()
	end)

	self._masterBtn = touchPanel
	self._skillDescPanel = self:getView():getChildByFullName("skillDescPanel")

	self._skillDescPanel:setSwallowTouches(false)
	self._skillDescPanel:addClickEventListener(function ()
		if self._skillDescPanel:isVisible() then
			self._skillDescPanel:setVisible(false)
		end
	end)

	self._masterSkillPanel = self:getView():getChildByFullName("main.bg.masterSkillPanel")

	self._masterSkillPanel:setVisible(true)
	self:getView():getChildByFullName("main.bg.masterSkillBg"):setVisible(true)
	self._masterSkillPanel:addClickEventListener(function ()
		self:onClickMasterSkill()
	end)
end

function LeadStageArenaTeamMediator:enterWithData(data)
	data = data or {}
	self._data = data
	self._stageType = data and data.stageType and data.stageType or ""
	self._stageId = data and data.stageId and data.stageId or ""
	self._spData = data and data.data and data.data or {}
	self._cardsExcept = self._spData.cardsExcept and self._spData.cardsExcept or {}
	self._teamIndex = data.teamIndex and data.teamIndex or 1
	self._leadStageArena = self._leadStageArenaSystem:getLeadStageArena()
	self._masterList = self._masterSystem:getShowMasterList()
	self._canChange = true
	local num = 0

	for i = 1, #self._masterList do
		if not self._masterList[i]:getIsLock() then
			num = num + 1
		end
	end

	self._showChangeMaster = num > 1
	self._isDrag = false
	self._costTotal = 0
	self._costMaxNum = self._stageSystem:getCostInit() + self._developSystem:getBuildingCostEffValue()
	self._maxTeamPetNum = self._leadStageArena:getPositionNum()
	self._teamUnlockConfig = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Stage_Team_Unlock", "content")

	self._stageSystem:setSortExtand(0)

	if data.spStageType and costType[data.spStageType] ~= "-1" then
		self._spStageType = data.spStageType
		self._costMaxNum = tonumber(costType[data.spStageType])
	end

	self._ignoreReloadData = true

	self:initData()
	self:setupTopInfoWidget()
	self:initWidgetInfo()
	self:createCardsGroupName()
	self:setupView()
	self:checkCardsTurnBtn()

	local delayTime = 0.001

	performWithDelay(self:getView(), function ()
		local offsetX = self._teamView:getContentOffset().x + self._petSize.width

		if offsetX > 0 then
			offsetX = 0
		end

		self._teamView:reloadData()
		self._teamView:setContentOffset(cc.p(offsetX, 0))
		self:runStartAction()
	end, delayTime)
	self._costBtn:setVisible(self:showCostBtn())
end

function LeadStageArenaTeamMediator:resumeWithData()
	super.resumeWithData(self)
	self._costBtn:setVisible(self:showCostBtn())

	self._costMaxNum = self._stageSystem:getCostInit() + self._developSystem:getBuildingCostEffValue()

	if self._spStageType and costType[self._spStageType] ~= "-1" then
		self._costMaxNum = tonumber(costType[self._spStageType])
	end

	self._costTotalLabel2:setString("/" .. self._costMaxNum)
end

function LeadStageArenaTeamMediator:initData()
	self._teamList = self._leadStageArenaSystem:getOwnTeams()
	self._curTeam = self._teamList[self._teamIndex]
	local modelTmp = {
		_heroes = self:removeExceptHeros(),
		_masterId = self._curTeam.masterId
	}
	self._curMasterId = modelTmp._masterId

	if self._curMasterId == "" or self._curMasterId == 0 then
		self._curMasterId = self._developSystem:getStageTeamById(1):getMasterId()
	end

	self._oldMasterId = self._curMasterId
	local teamPetIndex = 1
	self._teamPets = {}
	self._tempTeams = {}
	self._recommondJob = {}

	for _, v in pairs(modelTmp._heroes) do
		self._teamPets[teamPetIndex] = v
		self._tempTeams[teamPetIndex] = v
		teamPetIndex = teamPetIndex + 1
	end

	self._nowName = Strings:get("StageArena_PartyUI0" .. self._teamIndex + 1)
	self._petList = self._leadStageArenaSystem:getNotOnTeamPet(self._teamPets, self._teamIndex)
	self._petListAll = {}

	table.copy(self._petList, {})

	self._recommondList = {}

	for _, v in pairs(self._teamPets) do
		if self:checkIsRecommend(v) then
			self._recommondList[#self._recommondList + 1] = v
		end
	end

	for _, v in pairs(self._petList) do
		if self:checkIsRecommend(v) then
			self._recommondList[#self._recommondList + 1] = v
		end
	end
end

function LeadStageArenaTeamMediator:updateData()
	self._petList = self._leadStageArenaSystem:getNotOnTeamPet(self._teamPets, self._teamIndex)
	self._petListAll = {}

	table.copy(self._petList, {})
end

function LeadStageArenaTeamMediator:removeExceptHeros()
	local heros = {}

	for i, v in pairs(self._curTeam.heroes) do
		heros[#heros + 1] = v
	end

	local showHeros = {}

	for i = 1, #heros do
		local isExcept = self._stageSystem:isHeroExcept(self._cardsExcept, heros[i])

		if not isExcept then
			showHeros[#showHeros + 1] = heros[i]
		end
	end

	return showHeros
end

function LeadStageArenaTeamMediator:showOneKeyHeros()
	local orderPets = self._heroSystem:getTeamPrepared(self._teamPets, self._petList)
	self._orderPets = {}
	self._leavePets = {}
	local canRecommendNum = 0
	local tbRecommandIds = {}
	local notRecommendNum = self._maxTeamPetNum - canRecommendNum
	notRecommendNum = notRecommendNum > 0 and notRecommendNum or 0

	for i = 1, #orderPets do
		if notRecommendNum > 0 then
			self._orderPets[#self._orderPets + 1] = orderPets[i]
			notRecommendNum = notRecommendNum - 1
		else
			self._leavePets[#self._leavePets + 1] = orderPets[i]
		end
	end

	local sortType = self._stageSystem:getCardSortType()

	self._heroSystem:sortHeroes(self._orderPets, sortType, tbRecommandIds, false, nil)
end

function LeadStageArenaTeamMediator:setupView()
	self:initLockIcons()
	self:refreshPetNode()
	self:refreshMasterInfo()
	self:initView()
	self:refreshListView()
	self:createSortView()
end

function LeadStageArenaTeamMediator:initLockIcons(preMaxTeamPetNum)
	preMaxTeamPetNum = preMaxTeamPetNum or self._maxTeamPetNum
	local maxShowNum = 10

	for i = preMaxTeamPetNum + 1, maxShowNum do
		local iconBg = self._teamBg:getChildByName("pet_" .. i)

		iconBg:removeAllChildren()

		local emptyIcon = GameStyle:createEmptyIcon(true)

		emptyIcon:addTo(iconBg):center(iconBg:getContentSize())

		local tipLabel = emptyIcon:getChildByName("TipText")

		tipLabel:setString(Strings:get("StageArena_PartyUI09"))
	end
end

function LeadStageArenaTeamMediator:initWidgetInfo()
	self._main = self:getView():getChildByFullName("main")
	self._qipao = self:getView():getChildByFullName("qipao")

	self._qipao:setVisible(false)
	self._qipao:setLocalZOrder(100)

	self._touchPanel = self:getView():getChildByFullName("touchPanel")

	self._touchPanel:setVisible(false)

	self._bg = self:getView():getChildByFullName("main.bg")
	self._teamTurnLeft = self._main:getChildByName("left")
	self._teamTurnRight = self._main:getChildByName("right")
	self._myPetPanel = self._main:getChildByFullName("my_pet_bg")
	self._heroPanel = self._myPetPanel:getChildByFullName("heroPanel")
	self._sortType = self._myPetPanel:getChildByFullName("sortPanel.sortBtn.text")
	self._masterImage = self._bg:getChildByName("role")
	self._teamBg = self._bg:getChildByName("team_bg")
	self._labelCombat = self._main:getChildByFullName("info_bg.combatLabel")
	self._costAverageLabel = self._main:getChildByFullName("info_bg.averageLabel")
	self._costTotalLabel1 = self._main:getChildByFullName("info_bg.cost1")
	self._costTotalLabel2 = self._main:getChildByFullName("info_bg.cost2")
	self._movingPet = self._main:getChildByFullName("moving_pet")
	self._spPanel = self._main:getChildByName("spStagePanel")

	self._spPanel:setVisible(false)

	self._btnPanel = self._main:getChildByName("btnPanel")
	self._teamBreakBtn = self._main:getChildByFullName("info_bg.button_one_key_break")
	self._teamOneKeyBtn = self._main:getChildByFullName("info_bg.button_one_key_embattle")
	self._costTouch = self._main:getChildByFullName("info_bg.costTouch")

	self._costTouch:addClickEventListener(function ()
		self:createCostTip()
	end)

	self._costBtn = self._main:getChildByFullName("info_bg.costBtn")
	self._combatInfoBtn = self._main:getChildByFullName("info_bg.infoBtn")
	self._fightInfoTip = self._main:getChildByFullName("fightInfo")
	self._myPetClone = self:getView():getChildByName("myPetClone")

	self._myPetClone:setVisible(false)

	self._petSize = self._myPetClone:getChildByFullName("myPetClone"):getContentSize()
	self._teamPetClone = self:getView():getChildByName("teamPetClone")

	self._teamPetClone:setVisible(false)
	self._teamPetClone:setScale(0.64)

	self._spBuffInfo = self._main:getChildByName("spBuffInfo")
	self._buffText = self._spBuffInfo:getChildByName("buffInfo")

	self:setLabelEffect()
	self:ignoreSafeArea()

	local config = self._leadStageArena:getConfig()
	local value = config and config.SeasonRule.config or {
		0,
		0
	}
	local contentText = ccui.RichText:createWithXML(Strings:get("StageArena_SpRule_Team", {
		fontSize = 18,
		fontName = TTF_FONT_FZYH_R,
		num1 = value[1] * 100,
		num2 = value[2] * 100,
		num3 = value[2] * 3 * 100
	}), {})

	self._buffText:setString("")
	contentText:addTo(self._buffText)
end

function LeadStageArenaTeamMediator:ignoreSafeArea()
	AdjustUtils.ignorSafeAreaRectForNode(self._heroPanel, AdjustUtils.kAdjustType.Left)
	AdjustUtils.ignorSafeAreaRectForNode(self._myPetPanel:getChildByName("sortPanel"), AdjustUtils.kAdjustType.Left)
	AdjustUtils.ignorSafeAreaRectForNode(self._main:getChildByFullName("btnPanel"), AdjustUtils.kAdjustType.Right)

	local director = cc.Director:getInstance()
	local winSize = director:getWinSize()

	self._heroPanel:setContentSize(cc.size(winSize.width, 220))
end

function LeadStageArenaTeamMediator:createTeamCell(cell, index)
	local node = cell:getChildByTag(12138)
	node = node:getChildByFullName("myPetClone")

	node:setVisible(false)

	cell.id = nil

	if index == 1 then
		return
	end

	node:setVisible(true)

	local id = self._petListAll[index - 1]
	node.id = id
	cell.id = id
	local isExcept = self._stageSystem:isHeroExcept(self._cardsExcept, id)

	node:setTouchEnabled(not isExcept)
	node:setSwallowTouches(false)
	node:addTouchEventListener(function (sender, eventType)
		self:onClickCell(sender, eventType, index)
	end)

	local heroInfo = self:getHeroInfoById(id)

	self:initHero(node, heroInfo)

	local detailBtn = node:getChildByFullName("detailBtn")

	detailBtn:addClickEventListener(function ()
		local attrAdds = {}

		self:onClickHeroDetail(id, attrAdds)
	end)
end

function LeadStageArenaTeamMediator:setLabelEffect()
	local lineGradiantVec2 = {
		{
			ratio = 0.5,
			color = cc.c4b(255, 255, 255, 255)
		},
		{
			ratio = 1,
			color = cc.c4b(129, 118, 113, 255)
		}
	}

	self._labelCombat:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
		x = 0,
		y = -1
	}))
end

function LeadStageArenaTeamMediator:createCardsGroupName()
	self._editBox = self._main:getChildByFullName("nameBg.TextField")

	self._editBox:setVisible(false)

	self._teamName = self._main:getChildByFullName("nameBg.teamName")

	self._teamName:setString(self._nowName)
end

function LeadStageArenaTeamMediator:onClickCell(sender, eventType, index)
	local isMovePetSucc = false

	if eventType == ccui.TouchEventType.began then
		self._isReturn = true
		self._isOnTeam = false
	elseif eventType == ccui.TouchEventType.moved then
		local beganPos = sender:getTouchBeganPosition()
		local movedPos = sender:getTouchMovePosition()

		if self._isReturn and not self._isDrag then
			self._isDrag = self:checkCellTouchType(beganPos, movedPos)

			if self._isDrag and not self._isOnTeam then
				self:createMovingPet(sender, 2)
				self:changeMovingPetPos(beganPos)
				sender:setVisible(false)
				sender:setSwallowTouches(true)
			end
		elseif self._isDrag and not self._isOnTeam then
			self:changeMovingPetPos(movedPos)
		end
	elseif eventType == ccui.TouchEventType.ended or eventType == ccui.TouchEventType.canceled then
		sender:setVisible(true)
		sender:setSwallowTouches(false)

		if self._guildCallback and not self._isDrag then
			self._isOnTeam = true
		end

		if not self._isOnTeam then
			if not self._isDrag then
				local selectCanceled = self:isSelectCanceledByClick(sender.id)

				if self._isReturn and not selectCanceled then
					self:insertTeamPet(sender)
				end
			elseif self:checkIsInTeamArea() then
				self:changeOwnPet(sender)

				isMovePetSucc = true
			end
		end

		self._isDrag = false

		self:cleanMovingPet()
	end

	return isMovePetSucc
end

function LeadStageArenaTeamMediator:changeOwnPet(cell)
	local id = cell.id
	local targetIndex = nil

	for i = 1, self._maxTeamPetNum do
		local iconBg = self._teamBg:getChildByName("pet_" .. i)

		if self:checkCollision(iconBg) then
			targetIndex = i

			break
		end
	end

	if not targetIndex then
		return
	end

	if self._guildCallback and targetIndex ~= 2 then
		return
	end

	local iconBg = self._teamBg:getChildByName("pet_" .. targetIndex)
	local targetId = iconBg.id
	local selectCanceled = self:isSelectCanceledByDray(id, iconBg.id)

	if selectCanceled then
		return
	end

	self:playInsertEffect(id)
	AudioEngine:getInstance():playEffect("Se_Click_Pickup", false)

	if targetId then
		self._teamPets[targetIndex] = id
		local index = table.indexof(self._petList, id)

		if index then
			self._petList[index] = targetId
		end

		self:refreshPetNode()
		self:refreshListView()
	else
		local animId = nil
		local index = table.indexof(self._petListAll, id)

		if index and self._petListAll[index + 1] then
			animId = self._petListAll[index + 1]
		end

		local cellIndex = table.indexof(self._petList, id)

		if cellIndex then
			table.remove(self._petList, cellIndex)
		end

		self._teamPets[#self._teamPets + 1] = id

		self:refreshPetNode()
		self:runInsertTeamAction(id)
		self:refreshListView()
		self:runInsertAction(animId)
	end

	if self._guildCallback then
		self._guildCallback()
	end
end

function LeadStageArenaTeamMediator:insertTeamPet(cell, isDrag)
	local id = cell.id
	local animId = nil
	local index = table.indexof(self._petListAll, id)

	if index and self._petListAll[index + 1] then
		animId = self._petListAll[index + 1]
	end

	for k, v in pairs(self._petList) do
		if v == id then
			table.remove(self._petList, k)
		end
	end

	self._teamPets[#self._teamPets + 1] = id

	self:refreshPetNode()
	self:playInsertEffect(id)
	AudioEngine:getInstance():playEffect("Se_Click_Pickup", false)

	if isDrag then
		self:runInsertTeamAction(id)
		self:refreshListView()
		self:runInsertAction(animId)

		return
	end

	self:runInsertTeamAction(cell.id)
	self:runInsertPetAction(cell, function ()
		self:refreshListView()
		self:runInsertAction(animId)
	end)
end

function LeadStageArenaTeamMediator:createMovingPet(cell, type)
	local petNode = nil
	local heroInfo = self:getHeroInfoById(cell.id)

	if type == 1 then
		petNode = self._teamPetClone:clone()

		petNode:setVisible(true)
		self:initTeamHero(petNode, heroInfo)

		if cell:getChildByName("EmptyIcon") then
			cell:getChildByName("EmptyIcon"):setVisible(true)
		end
	elseif type == 2 then
		petNode = self._myPetClone:getChildByFullName("myPetClone"):clone()

		petNode:setVisible(true)
		self:initHero(petNode, heroInfo)
	end

	if petNode then
		self._movingPet:removeAllChildren()
		petNode:setAnchorPoint(cc.p(0.5, 0.5))
		petNode:addTo(self._movingPet):center(self._movingPet:getContentSize())
	end
end

function LeadStageArenaTeamMediator:sortOnTeamPets()
	self._heroSystem:sortOnTeamPets(self._teamPets)
end

function LeadStageArenaTeamMediator:checkIsRecommend(id)
	return false
end

function LeadStageArenaTeamMediator:onClickOnTeamPet(sender, eventType)
	if eventType == ccui.TouchEventType.began then
		self._isOnOwn = false
	elseif eventType == ccui.TouchEventType.moved then
		local beganPos = sender:getTouchBeganPosition()
		local movedPos = sender:getTouchMovePosition()

		if not self._isDrag then
			self._isDrag = self:checkTouchType(beganPos, movedPos)

			if self._isDrag and not self._isOnOwn then
				self:createMovingPet(sender, 1)
				self:changeMovingPetPos(beganPos)

				if self._petNodeList[sender:getTag()] then
					self._petNodeList[sender:getTag()]:setVisible(false)
				end
			end
		elseif self._isDrag and not self._isOnOwn then
			self:changeMovingPetPos(movedPos)
		end
	elseif eventType == ccui.TouchEventType.ended or eventType == ccui.TouchEventType.canceled then
		if self._petNodeList[sender:getTag()] then
			self._petNodeList[sender:getTag()]:setVisible(true)
		end

		self:removeTeamPet(sender:getTag())

		self._isDrag = false

		self:cleanMovingPet()
	end
end

function LeadStageArenaTeamMediator:removeTeamPet(index)
	AudioEngine:getInstance():playEffect("Se_Click_Putdown", false)

	local id = self._teamPets[index]
	local cellId = self:checkIsInOwnArea()

	if cellId then
		local idIndex = table.indexof(self._petList, cellId)
		local selectCanceled = self:isSelectCanceledByDray(cellId, id)

		if idIndex and not selectCanceled then
			table.remove(self._petList, idIndex)

			self._teamPets[index] = cellId
		else
			table.remove(self._teamPets, index)
		end
	else
		table.remove(self._teamPets, index)
	end

	self._petList[#self._petList + 1] = id

	if self._qipao:isVisible() and self._qipao.id == id then
		self._qipao:setVisible(false)

		if self._specialSound then
			AudioEngine:getInstance():stopEffect(self._specialSound)
		end
	end

	self:refreshListView()
	self:refreshPetNode()
	self:runRemoveAction(id)
	self:runRemovePetAction(id)
end

function LeadStageArenaTeamMediator:refreshViewBySort()
	self:updateData()
	self:refreshMasterInfo()
	self:refreshListView()
	self:refreshPetNode()
end

function LeadStageArenaTeamMediator:refreshView()
	self:initData()
	self:refreshMasterInfo()
	self:refreshListView()
	self:refreshPetNode()
	self._costBtn:setVisible(self:showCostBtn())
end

function LeadStageArenaTeamMediator:refreshListView(ignoreAdjustOffset)
	self._petListAll = self._stageSystem:getSortExtendIds(self._petList)
	local sortType = self._stageSystem:getCardSortType()
	local tbRecommandIds = {}

	self._heroSystem:sortHeroes(self._petListAll, sortType, tbRecommandIds, nil, , self._stageType)

	if table.nums(self._cardsExcept) > 0 then
		local heros1 = {}
		local heros2 = {}

		for i = 1, #self._petListAll do
			local isExcept = self._stageSystem:isHeroExcept(self._cardsExcept, self._petListAll[i])

			if isExcept then
				heros2[#heros2 + 1] = self._petListAll[i]
			else
				heros1[#heros1 + 1] = self._petListAll[i]
			end
		end

		self._petListAll = {}

		table.copy(heros1, self._petListAll)

		for i = 1, #heros2 do
			self._petListAll[#self._petListAll + 1] = heros2[i]
		end
	end

	if not self._ignoreReloadData then
		local offsetX = self._teamView:getContentOffset().x + self._petSize.width

		if offsetX > 0 then
			offsetX = 0
		end

		self._teamView:reloadData()

		if not ignoreAdjustOffset then
			self._teamView:setContentOffset(cc.p(offsetX, 0))
		end
	end

	self._ignoreReloadData = false
end

function LeadStageArenaTeamMediator:initHero(node, info)
	local heroId = info.id

	super.initHero(self, node, info)

	local except = node:getChildByName("except")

	except:setVisible(false)

	if node:getChildByName("fatigueBg") then
		node:getChildByName("fatigueBg"):setVisible(false)
	end

	if self._stageSystem:isHeroExcept(self._cardsExcept, heroId) then
		node:getChildByName("except"):setVisible(true)
	end

	local skillPanel = node:getChildByName("skillPanel")
	local recomandNode = node:getChildByName("recommond")

	if recomandNode then
		local text = recomandNode:getChildByFullName("text")

		text:setColor(cc.c3b(255, 255, 255))
		recomandNode:setVisible(self:checkIsRecommend(heroId))
	end

	local skill = self._heroSystem:checkHasKeySkill(heroId)

	skillPanel:setVisible(not not skill)

	if skill then
		skillPanel:setVisible(true)
		skillPanel:setSwallowTouches(true)
		skillPanel:addClickEventListener(function ()
			self:onClickHeroSkill(skill, skillPanel)
		end)

		if not skillPanel:getChildByName("KeyMark") then
			local skillType = skill:getType()
			local icon1, icon2 = self._heroSystem:getSkillTypeIcon(skillType)
			local image = ccui.ImageView:create(icon1)

			image:addTo(skillPanel):center(skillPanel:getContentSize())
			image:setName("KeyMark")
			image:setScale(0.85)
			image:offset(0, -5)
		end
	end
end

function LeadStageArenaTeamMediator:refreshPetNode()
	self:refreshCombatAndCost()
	self:refreshButtons()
	self:sortOnTeamPets()
	self:checkMasterSkillActive()

	self._petNodeList = {}

	for i = 1, self._maxTeamPetNum do
		local iconBg = self._teamBg:getChildByName("pet_" .. i)

		iconBg:removeAllChildren()
		iconBg:setTag(i)
		iconBg:addTouchEventListener(function (sender, eventType)
			self:onClickOnTeamPet(sender, eventType)
		end)

		local emptyIcon = GameStyle:createEmptyIcon()

		emptyIcon:addTo(iconBg):center(iconBg:getContentSize())
		emptyIcon:setName("EmptyIcon")

		iconBg.id = nil
		local id = self._teamPets[i]

		if id then
			local heroInfo = self:getHeroInfoById(id)
			self._petNodeList[i] = self._teamPetClone:clone()

			self._petNodeList[i]:setVisible(true)

			self._petNodeList[i].id = id

			self:initTeamHero(self._petNodeList[i], heroInfo)
			self._petNodeList[i]:addTo(iconBg):center(iconBg:getContentSize())
			self._petNodeList[i]:offset(0, -9)
			iconBg:setTouchEnabled(true)

			iconBg.id = self._teamPets[i]

			if self._qipao:isVisible() and self._qipao.id == id then
				local targetPos = self._petNodeList[i]:getParent():convertToWorldSpace(cc.p(self._petNodeList[i]:getPosition()))
				targetPos = self._qipao:getParent():convertToNodeSpace(targetPos)

				self._qipao:setPosition(cc.p(targetPos.x - 50, targetPos.y + 60))
			end
		else
			iconBg:setTouchEnabled(false)
		end
	end
end

function LeadStageArenaTeamMediator:initTeamHero(node, info)
	local heroId = info.id

	super.initTeamHero(self, node, info)

	info.id = info.roleModel
	local heroImg = IconFactory:createRoleIconSprite(info)

	heroImg:setScale(0.68)

	local heroPanel = node:getChildByName("hero")

	heroPanel:removeAllChildren()
	heroPanel:addChild(heroImg)
	heroImg:setPosition(heroPanel:getContentSize().width / 2, heroPanel:getContentSize().height / 2)

	local bg1 = node:getChildByName("bg1")
	local bg2 = node:getChildByName("bg2")

	bg1:loadTexture(GameStyle:getHeroRarityBg(info.rareity)[1])
	bg2:loadTexture(GameStyle:getHeroRarityBg(info.rareity)[2])
	bg1:removeAllChildren()
	bg2:removeAllChildren()

	if kHeroRarityBgAnim[info.rareity] then
		local anim = cc.MovieClip:create(kHeroRarityBgAnim[info.rareity])

		anim:addTo(bg1):center(bg1:getContentSize())
		anim:offset(-1, -29)

		if info.rareity >= 14 then
			local anim = cc.MovieClip:create("ssrlizichai_yingxiongxuanze")

			anim:addTo(bg2):center(bg2:getContentSize()):offset(5, -20)
		end
	else
		local sprite = ccui.ImageView:create(GameStyle:getHeroRarityBg(info.rareity)[1])

		sprite:addTo(bg1):center(bg1:getContentSize())
	end

	local rarity = node:getChildByFullName("rarityBg.rarity")
	local rarityAnim = IconFactory:getHeroRarityAnim(info.rareity)

	rarityAnim:addTo(rarity):posite(25, 15)

	local exceptBg = node:getChildByName("except_bg")
	local textNumEffect = node:getChildByName("textNumEffect")

	textNumEffect:setVisible(false)
	exceptBg:setVisible(false)

	local cost = node:getChildByFullName("costBg.cost")

	cost:setString(info.cost)

	local occupationName, occupationImg = GameStyle:getHeroOccupation(info.type)
	local occupation = node:getChildByName("occupation")

	occupation:loadTexture(occupationImg)

	local levelImage = node:getChildByFullName("levelImage")
	local levelLabel = node:getChildByFullName("level")

	levelLabel:setString(Strings:get("Strenghten_Text78", {
		level = info.level
	}))

	local levelImageWidth = levelImage:getContentSize().width
	local levelWidth = levelLabel:getContentSize().width

	levelImage:setScaleX((levelWidth + 40) / levelImageWidth)

	local skillPanel = node:getChildByName("skillPanel")
	local skill, condition = self._heroSystem:checkHasKeySkill(heroId)
	local dicengEff, shangcengEff = nil

	skillPanel:setVisible(not not skill)

	if skill then
		skillPanel:setVisible(true)
		skillPanel:setSwallowTouches(true)
		skillPanel:addClickEventListener(function ()
			self:onClickHeroSkill(skill, skillPanel, true)
		end)

		if not skillPanel:getChildByName("KeyMark") then
			local skillType = skill:getType()
			local icon1, icon2 = self._heroSystem:getSkillTypeIcon(skillType)
			local image = ccui.ImageView:create(icon1)
			dicengEff = cc.MovieClip:create("diceng_jinengjihuo")

			dicengEff:setAnchorPoint(0.5, 0.5)
			dicengEff:setScale(0.38)
			dicengEff:setVisible(false)

			shangcengEff = cc.MovieClip:create("shangceng_jinengjihuo")

			shangcengEff:setAnchorPoint(0.5, 0.5)
			shangcengEff:setScale(0.38)
			shangcengEff:setVisible(false)
			dicengEff:addTo(skillPanel):center(skillPanel:getContentSize()):offset(-1.5, -2)
			image:addTo(skillPanel):center(skillPanel:getContentSize())
			shangcengEff:addTo(skillPanel):center(skillPanel:getContentSize()):offset(-1.5, -2)
			image:setName("KeyMark")
			image:setScale(0.85)
			image:offset(0, -5)
		end

		local isActive = self._stageSystem:checkIsKeySkillActive(condition, self._teamPets, {
			masterId = self._curMasterId
		})

		if dicengEff then
			dicengEff:setVisible(isActive)
		end

		if shangcengEff then
			shangcengEff:setVisible(isActive)
		end

		skillPanel:setGray(not isActive)
	end

	local recomandNode = node:getChildByName("recommond")

	if recomandNode then
		local text = recomandNode:getChildByFullName("text")

		text:setColor(cc.c3b(255, 255, 255))
		recomandNode:setVisible(self:checkIsRecommend(heroId))
		recomandNode:setContentSize(text:getContentSize())
		text:setPosition(cc.p(recomandNode:getContentSize().width / 2, recomandNode:getContentSize().height / 2 + 3))
	end
end

function LeadStageArenaTeamMediator:refreshCombatAndCost()
	local effectScene = ConfigReader:getDataByNameIdAndKey("ConfigValue", "LeadStage_Effective", "content")
	local effectRate = ConfigReader:getDataByNameIdAndKey("ConfigValue", "LeadStage_Effective_Rate", "content")
	local isDouble = table.indexof(effectScene, "RTPK") > 0
	local leadConfig = self._masterSystem:getMasterCurLeadStageConfig(self._curMasterId)
	local addPercent = leadConfig and leadConfig.LeadFightHero * (isDouble and effectRate or 1) or 0
	local totalCombat = 0
	local totalCost = 0
	local averageCost = 0

	for k, v in pairs(self._teamPets) do
		local heroInfo = self._heroSystem:getHeroById(v)
		totalCost = totalCost + heroInfo:getCost()
		totalCombat = totalCombat + heroInfo:getSceneCombatByType(SceneCombatsType.kAll)
	end

	if leadConfig then
		totalCombat = math.ceil((addPercent + 1) * totalCombat) or totalCombat
	end

	local masterData = self._masterSystem:getMasterById(self._curMasterId)

	if masterData then
		totalCombat = totalCombat + masterData:getCombat() or totalCombat
	end

	self._costTotal = totalCost
	averageCost = #self._teamPets == 0 and 0 or math.floor(totalCost * 10 / #self._teamPets + 0.5) / 10

	self._labelCombat:setString(totalCombat)
	self._costAverageLabel:setString(averageCost)
	self._costTotalLabel1:setString(self._costTotal)

	local color = self._costTotal <= self._costMaxNum and cc.c3b(255, 255, 255) or cc.c3b(255, 65, 51)

	self._costTotalLabel1:setTextColor(color)
	self._costTotalLabel2:setString("/" .. self._costMaxNum)
	self._costTotalLabel2:setPositionX(self._costTotalLabel1:getPositionX() + self._costTotalLabel1:getContentSize().width)

	local fightId = self._leadStageArenaSystem:getConfigLevelLimit()

	self._combatInfoBtn:setVisible(false)

	if fightId and fightId ~= "" then
		self._combatInfoBtn:setVisible(true)
		self._labelCombat:setString(Strings:get("SpPower_ShowName"))
		self._combatInfoBtn:loadTextureNormal("asset/common/common_btn_xq.png")
		self._combatInfoBtn:loadTexturePressed("asset/common/common_btn_xq.png")
	end

	if self._combatInfoBtn:isVisible() then
		self._combatInfoBtn:addTouchEventListener(function (sender, eventType)
			if eventType == ccui.TouchEventType.began then
				self._fightInfoTip:removeAllChildren()

				local level = DataReader:getDataByNameIdAndKey("ConfigLevelLimit", fightId, "StandardLv")
				local desc = Strings:get("StageArena_FairCombatDesc", {
					fontSize = 20,
					fontName = TTF_FONT_FZYH_M,
					level = level
				})
				local richText = ccui.RichText:createWithXML(desc, {})

				richText:setAnchorPoint(cc.p(0, 0))
				richText:setPosition(cc.p(10, 10))
				richText:addTo(self._fightInfoTip)
				richText:renderContent(440, 0, true)

				local size = richText:getContentSize()

				self._fightInfoTip:setContentSize(460, size.height + 20)
				self._fightInfoTip:setVisible(true)
			elseif eventType == ccui.TouchEventType.moved then
				-- Nothing
			elseif eventType == ccui.TouchEventType.canceled then
				self._fightInfoTip:setVisible(false)
			elseif eventType == ccui.TouchEventType.ended then
				self._fightInfoTip:setVisible(false)
			end
		end)
	else
		slot12 = self._combatInfoBtn

		slot12:setVisible(leadConfig ~= nil and addPercent > 0)
		self._combatInfoBtn:addTouchEventListener(function (sender, eventType)
			self:onClickInfo(eventType, nil, isDouble)
		end)
	end
end

function LeadStageArenaTeamMediator:changeMasterId(event)
	self._oldMasterId = self._curMasterId
	self._curMasterId = event:getData().masterId

	self:refreshMasterInfo()
	self:checkMasterSkillActive()
	self:refreshPetNode()
end

function LeadStageArenaTeamMediator:refreshMasterInfo()
	local masterData = self._masterSystem:getMasterById(self._curMasterId)

	self._masterBtn:setVisible(self._showChangeMaster)
	self._masterImage:setVisible(true)
	self._masterImage:removeAllChildren()
	self._masterImage:addChild(masterData:getHalfImage())
	self:refreshCombatAndCost()
	self:refreshButtons()
end

function LeadStageArenaTeamMediator:refreshButtons()
	self._teamBreakBtn:setVisible(self:checkButtonVisible())
	self._teamOneKeyBtn:setVisible(not self:checkButtonVisible())
end

function LeadStageArenaTeamMediator:checkButtonVisible()
	if #self._teamPets < self._maxTeamPetNum then
		for i = 1, #self._petList do
			local isExcept = self._stageSystem:isHeroExcept(self._cardsExcept, self._petList[i])

			if not isExcept then
				return false
			end
		end
	end

	return true
end

function LeadStageArenaTeamMediator:checkToExit(func, isIgnore, translateId)
	if #self._teamPets < 1 then
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = Strings:find("ARENA_TEMA_EMPTY")
		}))

		return false
	end

	self:sendChangeTeam(func)

	return true
end

function LeadStageArenaTeamMediator:getSendData()
	local sendData = {}
	local heros = {}

	for k, v in pairs(self._teamPets) do
		heros[k] = {
			id = v
		}
	end

	local params = {
		masterId = self._curMasterId,
		heros = heros
	}
	sendData[self._curTeam.teamId] = params

	return sendData
end

function LeadStageArenaTeamMediator:hasChangeTeam()
	if self._oldMasterId ~= self._curMasterId then
		return true
	end

	if #self._tempTeams ~= #self._teamPets then
		return true
	end

	local tempTab = {}

	for k, v in pairs(self._tempTeams) do
		tempTab[v] = k
	end

	for k, v in pairs(self._teamPets) do
		if not tempTab[v] then
			return true
		end
	end

	return false
end

function LeadStageArenaTeamMediator:onClickCardsTurnLeft()
	if not self._canChange then
		return
	end

	self._canChange = false

	performWithDelay(self:getView(), function ()
		self._canChange = true
	end, 0.3)

	local function func()
		local currentType = self._teamIndex
		currentType = currentType - 1

		if currentType == 0 then
			currentType = 1
		end

		local teamId = currentType

		self:checkTeamIsEmpty(teamId, currentType)
	end

	if self:checkToExit(func, true, "Stage_Team_UI12") then
		-- Nothing
	end
end

function LeadStageArenaTeamMediator:onClickCardsTurnRight()
	if not self._canChange then
		return
	end

	self._canChange = false

	performWithDelay(self:getView(), function ()
		self._canChange = true
	end, 0.3)

	local function func()
		local currentType = self._teamIndex
		currentType = currentType + 1

		if currentType == #self._teamList + 1 then
			currentType = #self._teamList
		end

		local teamId = currentType

		self:checkTeamIsEmpty(teamId, currentType)
	end

	if self:checkToExit(func, true, "Stage_Team_UI12") then
		-- Nothing
	end
end

function LeadStageArenaTeamMediator:checkTeamIsEmpty(teamId, currentType)
	self._teamIndex = currentType

	self._stageSystem:setSortExtand(0)
	self:checkCardsTurnBtn()
	self:refreshView()
	self:createCardsGroupName()
	self:setLeadStageInfo()
end

function LeadStageArenaTeamMediator:checkCardsTurnBtn()
	self._teamTurnRight:setVisible(self._teamIndex ~= #self._teamList)
	self._teamTurnLeft:setVisible(self._teamIndex ~= 1)
end

function LeadStageArenaTeamMediator:sendChangeTeam(callBack)
	local hasChange = self:hasChangeTeam()
	local params = self:getSendData()

	self._leadStageArenaSystem:requestLineUp(params, function ()
		if DisposableObject:isDisposed(self) then
			return
		end

		if hasChange then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Team_StorageSuccessTips")
			}))
		end

		if callBack then
			callBack()
		end
	end, false)
end

function LeadStageArenaTeamMediator:onClickOneKeyBreak()
	self._teamView:stopScroll()

	local ids = self._heroSystem:getTeamPrepared(self._teamPets, self._petList, self._recommondList)
	self._teamPets = {}
	self._petList = {}

	table.copy(ids, self._petList)
	self:refreshListView(true)
	self:refreshPetNode()
end

function LeadStageArenaTeamMediator:onClickFight(sender, eventType)
end

function LeadStageArenaTeamMediator:onClickSpDesc(sender, eventType)
	if eventType == ccui.TouchEventType.began then
		self._spPanel:getChildByName("spDescDi"):setVisible(true)
	elseif eventType == ccui.TouchEventType.ended or eventType == ccui.TouchEventType.canceled then
		self._spPanel:getChildByName("spDescDi"):setVisible(false)
	end
end

function LeadStageArenaTeamMediator:onClickBack()
	local function func()
		self:dismissWithOptions({
			transition = ViewTransitionFactory:create(ViewTransitionType.kCommonAreaView)
		})
	end

	if self:checkToExit(nil, false, "Stage_Team_UI10") then
		func()
	end
end
