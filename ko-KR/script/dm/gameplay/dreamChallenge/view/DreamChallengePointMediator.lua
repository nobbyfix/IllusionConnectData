DreamChallengePointMediator = class("DreamChallengePointMediator", DmAreaViewMediator, _M)

DreamChallengePointMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
DreamChallengePointMediator:has("_dreamSystem", {
	is = "r"
}):injectWith("DreamChallengeSystem")

local kBtnHandlers = {
	["main.detailBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickDetailBtn"
	},
	["main.resetBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickResetBtn"
	}
}
local kPointPos = {
	cc.p(12, 256),
	cc.p(456, 256),
	cc.p(12, 128),
	cc.p(456, 128),
	cc.p(12, 0),
	cc.p(456, 0)
}
local kPointPosSmall = {
	cc.p(2, 283),
	cc.p(300, 283),
	cc.p(598, 283),
	cc.p(2, 190),
	cc.p(300, 190),
	cc.p(598, 190),
	cc.p(2, 96),
	cc.p(300, 96),
	cc.p(598, 96),
	cc.p(2, 2),
	cc.p(300, 2),
	cc.p(598, 2)
}
local kPartyIcon = {
	BSNCT = "asset/heroRect/heroForm/sl_businiao.png",
	MNJH = "asset/heroRect/heroForm/sl_smzs.png",
	DWH = "asset/heroRect/heroForm/sl_dongwenhui.png",
	XD = "asset/heroRect/heroForm/sl_seed.png",
	WNSXJ = "asset/heroRect/heroForm/sl_weinasi.png",
	SSZS = "asset/heroRect/heroForm/sl_shimengzhishe.png"
}
local kJobIcon = {
	Aoe = "asset/heroRect/heroOccupation/zy_fashi.png",
	Attack = "asset/heroRect/heroOccupation/zy_gongxi.png",
	Support = "asset/heroRect/heroOccupation/zy_fuzhu.png",
	Curse = "asset/heroRect/heroOccupation/zy_zhoushu.png",
	Defense = "asset/heroRect/heroOccupation/zy_shouhu.png",
	Summon = "asset/heroRect/heroOccupation/zy_zhaohuan.png",
	Cure = "asset/heroRect/heroOccupation/zy_zhiyu.png"
}
local kOtherHeroIcon = "asset/heroRect/heroOccupation/zy_zhoushu.png"

function DreamChallengePointMediator:initialize()
	super.initialize(self)
end

function DreamChallengePointMediator:dispose()
	super.dispose(self)
end

function DreamChallengePointMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
end

function DreamChallengePointMediator:setupView(pNode, data)
	self._mapId = data.mapId
	self._pointId = data.pointId

	self:initWidget()
	self:refreshPointView()
	self:refreshBuffInfo()
	self:checkGuide()
end

function DreamChallengePointMediator:initWidget()
	self._main = self:getView():getChildByName("main")
	self._pointView = self._main:getChildByName("point")
	self._pointCellClone = self:getView():getChildByName("pointCellClone")
	self._pointCellCloneSmall = self:getView():getChildByName("pointCellCloneSmall")
	self._infoList = self._main:getChildByName("infoList")
	self._infoCellClone = self:getView():getChildByName("infoCellClone")
end

function DreamChallengePointMediator:refreshPointView()
	self._pointView:removeAllChildren()
	self._pointView:setScrollBarEnabled(false)
	self._pointView:setTouchEnabled(true)
	self._pointView:setBounceEnabled(true)

	local battles = self._dreamSystem:getBattleIds(self._mapId, self._pointId)
	local battleNum = #battles
	local battlesTmp = {}

	table.deepcopy(battles, battlesTmp)

	local targetCell = battleNum >= 12 and self._pointCellCloneSmall or self._pointCellClone
	local rowCellNum = battleNum >= 12 and 3 or 2
	local row = math.ceil(battleNum / rowCellNum)
	local offsetY = targetCell:getContentSize().height
	local offsetX = targetCell:getContentSize().width
	local innerSize = cc.size(908, row * offsetY)
	local startPosX = (908 - rowCellNum * offsetX) / 2
	local startPosY = innerSize.height - targetCell:getContentSize().height

	self._pointView:setInnerContainerSize(cc.size(908, row * offsetY))
	self._pointView:setContentSize(cc.size(908, 366))

	local i = 0

	local function showHero(battlesTmp)
		if #battlesTmp == 0 then
			return
		end

		local battleId = table.remove(battlesTmp, 1)
		i = i + 1
		local layout = targetCell:clone()

		self:setPoint(layout, battleId, i, battleNum >= 12)

		local r = math.mod(i, rowCellNum)

		if r == 0 then
			r = rowCellNum
		end

		local l = math.floor((i - 1) / rowCellNum)

		layout:addTo(self._pointView):setPosition(cc.p(startPosX + (r - 1) * offsetX, startPosY - l * offsetY))

		local scale = cc.ScaleTo:create(0.6, 1)
		local fadeIn = cc.FadeIn:create(0.2)
		local spawn = cc.Spawn:create(scale, fadeIn)

		layout:runAction(spawn)
		performWithDelay(self:getView(), function ()
			showHero(battlesTmp)
		end, i * 0.01)
	end

	showHero(battlesTmp)
end

function DreamChallengePointMediator:setPoint(layout, battleId, index, small)
	local name = layout:getChildByFullName("name")

	name:setString(self._dreamSystem:getBattleName(battleId))

	local num = layout:getChildByFullName("num")

	num:setString(tostring(index))

	local isUnLock = self._dreamSystem:checkBattleLock(self._mapId, self._pointId, battleId)
	local isPass = self._dreamSystem:checkBattlePass(self._mapId, self._pointId, battleId)
	local isReward = self._dreamSystem:checkBattleRewarded(self._mapId, self._pointId, battleId)
	local isRewardLock = self._dreamSystem:checkBattleRewardLock(self._mapId, self._pointId, battleId)
	local frontBg = layout:getChildByFullName("frontBg")
	local img = self._dreamSystem:getBattleBackground(self._mapId, self._pointId, battleId)

	frontBg:loadTexture(img, ccui.TextureResType.plistType)

	local mask = layout:getChildByFullName("mask")
	local mask2 = layout:getChildByFullName("mask2")

	mask:setVisible(false)
	mask2:setVisible(false)

	if isPass then
		if isReward then
			mask:setVisible(false)
			mask2:setVisible(true)
		else
			mask:setVisible(true)
			mask2:setVisible(false)
		end
	end

	local pass = layout:getChildByFullName("pass")

	pass:setVisible(isPass)

	local rewardPanel = layout:getChildByFullName("reward")
	local rewardId = self._dreamSystem:getBattleReward(self._mapId, self._pointId, battleId)
	local reward = ConfigReader:getDataByNameIdAndKey("Reward", rewardId, "Content")[1]
	local icon = IconFactory:createRewardIcon(reward, {
		showAmount = true,
		isWidget = true,
		notShowQulity = false
	})

	if small then
		icon:addTo(rewardPanel):center(rewardPanel:getContentSize()):setScale(0.45):offset(0, 0)
	else
		icon:addTo(rewardPanel):center(rewardPanel:getContentSize()):setScale(0.6):offset(1, 0)
	end

	local guang = layout:getChildByFullName("guang")

	guang:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.ScaleTo:create(0.5, 0.95), cc.ScaleTo:create(0.5, 1))))
	guang:setVisible(isRewardLock and not isReward)

	local lock = layout:getChildByFullName("lock")

	lock:setVisible(not isUnLock)

	local gou = layout:getChildByFullName("gou")

	gou:setVisible(isReward)

	if not isRewardLock or isReward then
		icon:setSwallowTouches(false)
		IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), reward, {
			needDelay = true
		})
	else
		rewardPanel:setSwallowTouches(false)
		rewardPanel:addTouchEventListener(function (sender, eventType)
			if eventType == ccui.TouchEventType.ended then
				self._dreamSystem:requestReceiveBox(self._mapId, self._pointId, battleId, function (response)
					if response.resCode == 0 then
						self:refreshPointView()
						self:refreshBuffInfo()

						local view = self:getInjector():getInstance("getRewardView")

						self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
							maskOpacity = 0
						}, {
							rewards = response.data.rewards
						}))
					end
				end)
			end
		end)
	end

	layout:setSwallowTouches(false)
	layout:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			if isUnLock then
				if not isPass then
					self._dreamSystem:enterBattleTeam(self._mapId, self._pointId, battleId)
				end
			else
				self:dispatch(ShowTipEvent({
					tip = Strings:get("DreamChallenge_Point_Locked_TIPS")
				}))
			end
		end
	end)
end

function DreamChallengePointMediator:refreshBuffInfo()
	self._infoList:setScrollBarEnabled(false)
	self._infoList:removeAllChildren()

	local tiredNum = self._dreamSystem:getPointFatigue(self._mapId, self._pointId)
	local node1 = self._infoCellClone:clone()
	local tiredIcon = node1:getChildByFullName("icon")

	tiredIcon:loadTexture("icon_pilao1.png", ccui.TextureResType.plistType)
	tiredIcon:setContentSize(cc.size(53, 53))

	local tiredTitle = node1:getChildByFullName("title")
	local tiredText = node1:getChildByFullName("text")

	tiredTitle:setString(Strings:get("DreamChallenge_Point_Tired_Title"))
	tiredText:setString(Strings:get("DreamChallenge_Point_Tired_Text", {
		num = tiredNum
	}))
	self._infoList:pushBackCustomItem(node1)

	local teamData = self._dreamSystem:getPointScreen(self._mapId, self._pointId)
	local teamCond = nil
	local teamTitleStr = ""

	if teamData.Up then
		teamTitleStr = Strings:get("DreamChallenge_Point_Reward_Title_1")
		teamCond = teamData.Up
	else
		teamTitleStr = Strings:get("DreamChallenge_Point_Reward_Title_2")
		teamCond = teamData.Down
	end

	for i = 1, #teamCond do
		local node2 = self._infoCellClone:clone()
		local data = teamCond[i]
		local title = node2:getChildByFullName("title")
		local text = node2:getChildByFullName("text")
		local icon = node2:getChildByFullName("icon")
		local line = node2:getChildByFullName("line2")

		if data.type == "job" then
			text:setString(Strings:get("TypeName_" .. data.value))
			icon:loadTexture(kJobIcon[data.value], ccui.TextureResType.localType)
			icon:setContentSize(cc.size(61, 61))
		elseif data.type == "Party" then
			text:setString(Strings:get("HeroPartyName_" .. data.value))
			icon:loadTexture(kPartyIcon[data.value], ccui.TextureResType.localType)
			icon:setContentSize(cc.size(63, 63))
		elseif data.type == "Tag" then
			text:setString(Strings:get("DC_Map_OtherHero_IconName"))
			icon:loadTexture(kOtherHeroIcon, ccui.TextureResType.localType)
			icon:setContentSize(cc.size(63, 63))
		end

		title:setString(teamTitleStr)
		title:setVisible(i == 1)
		line:setVisible(i == 1)
		self._infoList:pushBackCustomItem(node2)
	end

	local heros, skill = self._dreamSystem:getRecomandHero(self._mapId, self._pointId)
	local addIndex = 0

	for i = 1, #heros do
		addIndex = addIndex + 1
		local node3 = self._infoCellClone:clone()
		local attackText = node3:getChildByFullName("text")
		local icon = node3:getChildByFullName("icon")
		local title = node3:getChildByFullName("title")
		local line = node3:getChildByFullName("line2")

		attackText:setString("")

		local effectConfig = ConfigReader:getRecordById("Skill", skill)

		if effectConfig then
			attackText:setString(Strings:get(effectConfig.Desc_short))
			attackText:setColor(cc.c3b(255, 159, 48))
		end

		icon:removeAllChildren()
		icon:loadTexture("asset/commonRaw/common_bd_ssr01.png", ccui.TextureResType.localType)
		icon:setContentSize(cc.size(93, 93))

		local config = ConfigReader:getRecordById("HeroBase", heros[i])
		local heroImg = IconFactory:createRoleIconSprite({
			id = config.RoleModel
		})

		heroImg:addTo(icon):center(icon:getContentSize())
		heroImg:setName("iconHero")
		heroImg:setScale(0.25)
		title:setString(Strings:get("DreamChallenge_Point_Reward_Title_0"))
		title:setVisible(addIndex == 1)
		line:setVisible(addIndex == 1)
		self._infoList:pushBackCustomItem(node3)
	end

	local partys, skill = self._dreamSystem:getRecomandParty(self._mapId, self._pointId)

	for i = 1, #partys do
		addIndex = addIndex + 1
		local node4 = self._infoCellClone:clone()
		local attackText = node4:getChildByFullName("text")
		local icon = node4:getChildByFullName("icon")
		local title = node4:getChildByFullName("title")
		local line = node4:getChildByFullName("line2")

		attackText:setString("")

		local effectConfig = ConfigReader:getRecordById("Skill", skill)

		if effectConfig then
			attackText:setString(Strings:get(effectConfig.Desc_short))
			attackText:setColor(cc.c3b(255, 159, 48))
		end

		icon:removeAllChildren()
		icon:loadTexture(kPartyIcon[partys[i]], ccui.TextureResType.localType)
		icon:setContentSize(cc.size(63, 63))
		title:setString(Strings:get("DreamChallenge_Point_Reward_Title_0"))
		title:setVisible(addIndex == 1)
		line:setVisible(addIndex == 1)
		self._infoList:pushBackCustomItem(node4)
	end

	local jobs, skill = self._dreamSystem:getRecomandJob(self._mapId, self._pointId)

	for i = 1, #jobs do
		addIndex = addIndex + 1
		local node5 = self._infoCellClone:clone()
		local attackText = node5:getChildByFullName("text")
		local icon = node5:getChildByFullName("icon")
		local title = node5:getChildByFullName("title")
		local line = node5:getChildByFullName("line2")

		attackText:setString("")

		local effectConfig = ConfigReader:getRecordById("Skill", skill)

		if effectConfig then
			attackText:setString(Strings:get(effectConfig.Desc_short))
			attackText:setColor(cc.c3b(255, 159, 48))
		end

		icon:removeAllChildren()
		icon:loadTexture(kJobIcon[jobs[i]], ccui.TextureResType.localType)
		icon:setContentSize(cc.size(61, 61))
		title:setString(Strings:get("DreamChallenge_Point_Reward_Title_0"))
		title:setVisible(addIndex == 1)
		line:setVisible(addIndex == 1)
		self._infoList:pushBackCustomItem(node5)
	end

	local buffs = self._dreamSystem:getBuffs(self._mapId, self._pointId)
	local index = 1

	for k, v in pairs(buffs) do
		local buffInfo = v
		local node = self._infoCellClone:clone()
		local attackText = node:getChildByFullName("text")
		local icon = node:getChildByFullName("icon")
		local title = node:getChildByFullName("title")
		local line = node:getChildByFullName("line")
		local skillConfig = ConfigReader:getRecordById("Skill", buffInfo.skillId)

		title:setVisible(index == 1)
		title:setString("BUFF")

		if skillConfig then
			attackText:setString(Strings:get(skillConfig.Desc_short))
			attackText:setColor(cc.c3b(255, 159, 48))
		end

		icon:loadTexture("asset/skillIcon/" .. skillConfig.Icon .. ".png", ccui.TextureResType.localType)
		icon:setContentSize(cc.size(63, 63))

		index = index + 1

		self._infoList:pushBackCustomItem(node)
	end
end

function DreamChallengePointMediator:checkGuide()
end

function DreamChallengePointMediator:onClickDetailBtn()
	local view = self:getInjector():getInstance("DreamChallengeBuffDetailView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
		mapId = self._mapId,
		pointId = self._pointId
	}))
end

function DreamChallengePointMediator:onClickResetBtn()
	local outSelf = self
	local delegate = {}

	function delegate:willClose(popupMediator, data)
		if data.response == "ok" then
			outSelf._dreamSystem:requestResetPoint(outSelf._mapId, outSelf._pointId, function (response)
				if response.resCode == 0 then
					outSelf:refreshPointView()
				end
			end)
		elseif data.response == "cancel" then
			-- Nothing
		elseif data.response == "close" then
			-- Nothing
		end
	end

	local pointName = self._dreamSystem:getPointName(self._pointId)
	local str = Strings:get("DreamChallenge_Reset_Point", {
		pointName = pointName
	})
	local data = {
		title = Strings:get("DreamChallenge_Reset_Title"),
		title1 = Strings:get("DreamChallenge_Reset_Title_En"),
		content = Strings:get("DreamChallenge_Reset_Point", {
			pointName = pointName
		}),
		sureBtn = {},
		cancelBtn = {}
	}
	local view = self:getInjector():getInstance("AlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end
