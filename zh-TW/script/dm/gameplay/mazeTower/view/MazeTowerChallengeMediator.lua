MazeTowerChallengeMediator = class("MazeTowerChallengeMediator", DmPopupViewMediator, _M)

MazeTowerChallengeMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
MazeTowerChallengeMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
MazeTowerChallengeMediator:has("_mazeTowerSystem", {
	is = "r"
}):injectWith("MazeTowerSystem")

local kBtnHandlers = {
	["main.rightPanel.challenge_btn"] = {
		ignoreClickAudio = true,
		func = "onClickChallenge"
	}
}
local kHeroRarityBgAnim = {
	[15.0] = "spzong_urequipeff",
	[13.0] = "srzong_yingxiongxuanze",
	[14.0] = "ssrzong_yingxiongxuanze"
}

function MazeTowerChallengeMediator:initialize()
	super.initialize(self)
end

function MazeTowerChallengeMediator:dispose()
	if self._timer then
		self._timer:stop()

		self._timer = nil
	end

	super.dispose(self)
end

function MazeTowerChallengeMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
end

function MazeTowerChallengeMediator:enterWithData(data)
	self._mazeTower = self._mazeTowerSystem:getMazeTower()
	self._data = data
	self._gridData = data.gridData
	local elementConfig = self._gridData:getElementConfig()
	self._enterBattle = false
	self._pointId = elementConfig.StateEffect
	self._pointConfig = ConfigReader:getRecordById("MazeBlockBattle", self._pointId)
	self._masterSystem = self._developSystem:getMasterSystem()
	self._heroSystem = self._developSystem:getHeroSystem()

	self:glueFieldAndUi()
	self:setupView()
	self:initAnim()
	self:mapEventListener(self:getEventDispatcher(), EVT_ARENA_CHANGE_TEAM_SUCC, self, self.changeTeamSuc)
	self:mapEventListener(self:getEventDispatcher(), EVT_RESET_DONE, self, self.refreshTimes)
end

function MazeTowerChallengeMediator:glueFieldAndUi()
	local view = self:getView()
	self._main = view:getChildByFullName("main")

	local function callFunc()
		self:onClickBack()
	end

	local touchView = self._main:getChildByName("touchPanel")

	mapButtonHandlerClick(nil, touchView, {
		clickAudio = "Se_Click_Close_2",
		func = callFunc
	})

	self._rightPanel = self._main:getChildByFullName("rightPanel")

	self._rightPanel:setLocalZOrder(101)

	self._combatPanel = self._rightPanel:getChildByFullName("Panel_combat")
	self._challengeBtn = self._rightPanel:getChildByFullName("challenge_btn")
	self._teamPanel = self._rightPanel:getChildByName("Panel_team")
	self._teamCombatPanel = self._rightPanel:getChildByName("team_combat")
	self._rolePanel = self._main:getChildByName("bg_renwu")
	self._enemyPanel = self._rightPanel:getChildByFullName("panel_enemy")
	self._enemyClone = self:getView():getChildByName("enemyClone")

	self._enemyClone:setVisible(false)

	local function callFunc(sender, eventType)
		self:onClickTeam()
	end

	mapButtonHandlerClick(nil, self._teamPanel, {
		func = callFunc
	})
end

function MazeTowerChallengeMediator:initAnim()
	local mc = cc.MovieClip:create("guankaxiangqing_zhuxianguanka_UIjiaohudongxiao")

	mc:addCallbackAtFrame(30, function ()
		mc:stop()
	end)
	mc:stop()
	mc:addTo(self._main)
	mc:setPosition(cc.p(568, 320))
	mc:setLocalZOrder(100)
	mc:addCallbackAtFrame(21, function ()
		local btnAnim = cc.MovieClip:create("xiangqingxunhuan_zhuxianguanka_UIjiaohudongxiao")

		btnAnim:setScale(0.8)
		btnAnim:addTo(mc)
		btnAnim:setPosition(cc.p(443.5, -83))
		btnAnim:setOpacity(0)
		btnAnim:runAction(cc.FadeIn:create(0.5))

		self._challengeAnim = btnAnim
		local act = cc.Sequence:create(cc.DelayTime:create(0.4375), cc.FadeIn:create(0.3125))

		self._challengeBtn:runAction(act:clone())
		self._challengeBtn:changeParent(self._challengeAnim)
		self._challengeBtn:center(self._challengeAnim:getContentSize())
	end)

	local starMc = mc:getChildByName("stardi")

	starMc:removeAllChildren()

	local teamMc = mc:getChildByFullName("team")

	self._teamPanel:changeParent(teamMc):center(teamMc:getContentSize())

	local teamCombatPanel = mc:getChildByFullName("teamCombat")

	self._teamCombatPanel:changeParent(teamCombatPanel):center(teamCombatPanel:getContentSize())

	local heroRole = mc:getChildByFullName("hero")

	self._rolePanel:changeParent(heroRole)
	self._challengeBtn:setOpacity(0)
	mc:gotoAndPlay(1)

	local originX, originY = self._enemyPanel:getPosition()

	self._enemyPanel:setPositionX(originX + 400)
	self._enemyPanel:runAction(cc.MoveTo:create(0.3, cc.p(originX, originY)))

	self._mainAnim = mc
end

function MazeTowerChallengeMediator:setupView()
	self._rolePanel:removeAllChildren()

	local pointHead = self._pointConfig.PointHead
	local heroSprite = IconFactory:createRoleIconSpriteNew({
		useAnim = true,
		frameId = "bustframe9",
		id = pointHead
	})

	heroSprite:addTo(self._rolePanel):setTag(951)
	heroSprite:setScale(0.92)
	heroSprite:setPosition(cc.p(88, 0))

	local recommendCombat = self._mazeTowerSystem:getRecommendCombat(self._pointId)
	local combatText = self._combatPanel:getChildByFullName("combat_text")

	combatText:setString(recommendCombat)
	self:refreshTimes()
	self:changeTeamSuc()
	self:refreshEnemyHero()
end

function MazeTowerChallengeMediator:refreshTimes()
	local remainTimes = self._rightPanel:getChildByName("Text_remainTimes")

	remainTimes:setString(Strings:get("Maze_Num_Surplus", {
		num = self._mazeTower:getFightTime()
	}))
end

function MazeTowerChallengeMediator:refreshTeamView()
	self._teamType = StageTeamType.MAZE_TOWER
	local team = self._developSystem:getSpTeamByType(self._teamType)
	local curCombat = team:getCombat()
	local teamCombatText = self._teamCombatPanel:getChildByName("combat_text")

	teamCombatText:setString(curCombat)
	self._teamPanel:getChildByName("teamName"):setString(team:getName())

	local masterSystem = self._developSystem:getMasterSystem()
	local masterData = masterSystem:getMasterById(team:getMasterId())
	local roleModel = masterData:getModel()
	local masterIcon = IconFactory:createRoleIconSpriteNew({
		frameId = "bustframe4_4",
		id = roleModel
	})
	local masterPanel = self._teamPanel:getChildByName("masterIcon")

	masterPanel:removeAllChildren()
	masterIcon:addTo(masterPanel):center(masterPanel:getContentSize())
end

function MazeTowerChallengeMediator:getEnemyHeros(pointid)
	local enemyCard = self._pointConfig.EnemyCard
	local enemyFirstHeros = ConfigReader:getDataByNameIdAndKey("EnemyCard", enemyCard, "FirstFormation")
	local enemyFixHeros = ConfigReader:getDataByNameIdAndKey("EnemyCard", enemyCard, "CardCollection")
	local count = 1
	self._enemyTeamPets = {}

	for i = 1, #enemyFixHeros do
		self._enemyTeamPets[i] = enemyFixHeros[i]
		count = count + 1
	end

	for k, v in pairs(enemyFirstHeros) do
		self._enemyTeamPets[count] = v[2]
		count = count + 1
	end
end

function MazeTowerChallengeMediator:refreshEnemyHero()
	self:getEnemyHeros()

	for i, v in pairs(self._enemyTeamPets) do
		local node = self._enemyClone:clone()

		node:setVisible(true)

		local config = ConfigReader:getRecordById("EnemyHero", self._enemyTeamPets[i])
		local heroImg = IconFactory:createRoleIconSpriteNew({
			id = config.RoleModel
		})

		heroImg:setScale(0.68)

		local heroPanel = node:getChildByName("hero")

		heroPanel:removeAllChildren()
		heroImg:addTo(heroPanel):center(heroPanel:getContentSize())

		local rarity = config.Rarity
		local bg1 = node:getChildByName("bg1")
		local bg2 = node:getChildByName("bg2")

		bg1:loadTexture(GameStyle:getHeroRarityBg(rarity)[1])
		bg2:loadTexture(GameStyle:getHeroRarityBg(rarity)[2])
		bg1:removeAllChildren()
		bg2:removeAllChildren()

		if kHeroRarityBgAnim[rarity] then
			local anim = cc.MovieClip:create(kHeroRarityBgAnim[rarity])

			anim:addTo(bg1):center(bg1:getContentSize())
			anim:setPosition(cc.p(bg1:getContentSize().width / 2 - 1, bg1:getContentSize().height / 2 - 30))

			if rarity == 15 then
				anim:setPosition(cc.p(bg1:getContentSize().width / 2 - 3, bg1:getContentSize().height / 2))
			end

			if rarity >= 14 then
				local anim = cc.MovieClip:create("ssrlizichai_yingxiongxuanze")

				anim:addTo(bg2):center(bg2:getContentSize()):offset(5, -20)
			end
		else
			local sprite = ccui.ImageView:create(GameStyle:getHeroRarityBg(rarity)[1])

			sprite:addTo(bg1):center(bg1:getContentSize())
		end

		local rarityNode = node:getChildByFullName("rarityBg.rarity")

		rarityNode:removeAllChildren()

		local rarityAnim = IconFactory:getHeroRarityAnim(rarity)

		rarityAnim:addTo(rarityNode):posite(25, 15)

		local cost = node:getChildByFullName("costBg.cost")

		cost:setString(config.EnergyCost)

		local occupationName, occupationImg = GameStyle:getHeroOccupation(config.Type)
		local occupation = node:getChildByName("occupation")

		occupation:loadTexture(occupationImg)

		local levelImage = node:getChildByName("levelImage")

		levelImage:setVisible(false)

		local level = node:getChildByName("level")

		level:setVisible(false)
		level:setString(Strings:get("Strenghten_Text78", {
			level = config.Level
		}))

		local levelImageWidth = levelImage:getContentSize().width
		local levelWidth = level:getContentSize().width

		levelImage:setScaleX((levelWidth + 20) / levelImageWidth)
		node:setScale(0.43)

		local line = 1
		local index = i

		if i > 5 then
			index = i - 5
			line = 2
		end

		node:addTo(self._enemyPanel):posite(47 + (index - 1) * 91, 140 - (line - 1) * 95)
	end
end

function MazeTowerChallengeMediator:onClickBack(sender, eventType)
	self:close()
end

function MazeTowerChallengeMediator:onClickChallenge()
	if not self._challengeAnim then
		return
	end

	if self._enterBattle then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Battle", false)

	self._enterBattle = true

	performWithDelay(self:getView(), function ()
		self._enterBattle = false
	end, 0.5)

	local pos = {
		{
			self._gridData:getX(),
			self._gridData:getY()
		}
	}

	self._mazeTowerSystem:requestMove({
		pos = pos
	}, function (response)
		if DisposableObject:isDisposed(self) then
			return
		end

		self:close()
		self._mazeTowerSystem:enterBattle(response.data, cc.p(self._gridData:getX(), self._gridData:getY()))
	end)
end

function MazeTowerChallengeMediator:onClickTeam()
	local function battleCallback()
		self:onClickChallenge()
	end

	local view = self:getInjector():getInstance("StageTeamView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		hideFightBtn = true,
		isSpecialStage = true,
		stageType = self._teamType,
		stageId = self._pointId
	}))
end

function MazeTowerChallengeMediator:changeTeamSuc()
	self:refreshTeamView()
end

function MazeTowerChallengeMediator:onTouchMaskLayer()
end

function MazeTowerChallengeMediator:clickSpecialRule(ruleId)
	local view = self:getInjector():getInstance("ActivityPointDetailRuleView")
	local event = ViewEvent:new(EVT_SHOW_POPUP, view, {}, {
		ruleId = ruleId
	})

	self:dispatch(event)
end

function MazeTowerChallengeMediator:onClickBuff()
	local view = self:getInjector():getInstance("WorldBossBuffView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		activityId = self._activityId,
		buffData = self._buffList[self._buffIndex],
		nextBuffData = self._buffList[self._buffIndex + 1]
	}))
end
