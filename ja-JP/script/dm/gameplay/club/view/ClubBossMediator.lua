ClubBossMediator = class("ClubBossMediator", DmAreaViewMediator)

ClubBossMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ClubBossMediator:has("_clubSystem", {
	is = "r"
}):injectWith("ClubSystem")
ClubBossMediator:has("_heroSystem", {
	is = "r"
}):injectWith("HeroSystem")
ClubBossMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
ClubBossMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")

local heroRarityTextArrRGB = {
	nil,
	"cdfa64",
	"a5dcf5",
	"c8aff5",
	"fac87d",
	"fac87d"
}
local kBtnHandlers = {
	["main.bottomAttackNode.challenge_btn"] = {
		ignoreClickAudio = false,
		func = "onClickChallenge"
	},
	["main.heroNode.bossPanel.bossInfoNode.heroPanel"] = {
		ignoreClickAudio = false,
		func = "onClickHeroPanel"
	},
	["main.bottomAttackNode.infoBtn"] = {
		ignoreClickAudio = false,
		func = "onClickInfoBtn"
	},
	["main.bottomAttackNode.rankPanel"] = {
		ignoreClickAudio = false,
		func = "onClickRankPanel"
	},
	["main.bottomAttackNode.recordPanel"] = {
		ignoreClickAudio = false,
		func = "onClickRecordPanel"
	},
	["main.rewardNode.boxNode.boxPanel"] = {
		ignoreClickAudio = false,
		func = "onClickBox"
	},
	["main.rewardNode.butonNode.btnPanel"] = {
		ignoreClickAudio = false,
		func = "onClickShowReward"
	}
}

function ClubBossMediator:initialize()
	super.initialize(self)
end

function ClubBossMediator:dispose()
	self:stopTimer()
	self:dispatch(Event:new(EVT_CLUBOSSREDPOINT_REFRESH))
	super.dispose(self)
end

function ClubBossMediator:onRegister()
	self._heroSystem = self._developSystem:getHeroSystem()

	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListeners()

	local view = self:getView()
	self._showChallengeNode = false
	self._showInfoNode = false
	self._doingKillAnim = false
	self._goToBack = false
	self._delayDoKillAnim = false
end

function ClubBossMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUBBOSS_REFRESH, self, self.onDoRefrsh)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUBBOSS_REFRESH_HURTANDHP, self, self.refreshHurtAndHp)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUBBOSS_REFRESH_BATTLECOUNT, self, self.refreshBattleCount)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUBBOSS_KILLED, self, self.doBossKilledLogic)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUBBOSS_BACKMAINVIEW, self, self.onBackToThisView)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUBBOSS_REFRESH_HURTREWARD, self, self.onDoRefrshHurtReward)
	self:mapEventListener(self:getEventDispatcher(), EVT_RESET_DONE, self, self.doReset)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUB_FORCEDLEVEL, self, self.onForcedLevel)
end

function ClubBossMediator:enterWithData(data)
	if data and data.viewType then
		self._viewType = data.viewType
	end

	self._goToBack = false
	self._doingKillAnim = false
	self._enterDoKillAnim = false
	self._delayDoKillAnim = false

	self:initData()
	self:initNodes()
	self:setupTopInfoWidget()
	self:doSomeNotChangeUI()
	self:doSomeChangeUI()
	self:runStartAction()
	self:checkSomethingAfterBattleWhenChangeSecen()

	if self._viewType == ClubHallType.kActivityBoss and self._clubSystem:getClubBossKilled(self._viewType) and data and data.goToActivityBoss == true then
		self._enterDoKillAnim = true
	end

	if self._viewType == ClubHallType.kBoss then
		if self._clubSystem:getClubBossKilled(self._viewType) and data and data.goToBoss == true then
			self._enterDoKillAnim = true
		end

		self._clubSystem:resetClubBossTabRed()
	end
end

function ClubBossMediator:setViewType(viewType)
	self._viewType = viewType
end

function ClubBossMediator:onDoRefrsh(event)
	local data = event:getData()

	if data and data.viewType ~= self._viewType then
		return
	end

	self:refreshData()
	self:refreshView()
end

function ClubBossMediator:onDoRefrshHurtReward(event)
	local data = event:getData()

	if data and data.viewType ~= self._viewType then
		return
	end

	self:refreshData()

	if self._clubBossInfo:getHurt() < self._clubBossInfo:getHurtTarget() then
		self._rewardBoxImage1:setVisible(true)
		self._rewardBoxImage2:setVisible(false)
		self._rewardBoxImage3:setVisible(false)
	end

	if self._clubBossInfo:getHurtTarget() <= self._clubBossInfo:getHurt() then
		self._rewardBoxImage1:setVisible(false)
		self._rewardBoxImage2:setVisible(false)
		self._rewardBoxImage3:setVisible(false)

		if self._clubBossInfo:getHasGetHurtAward() == false then
			self._rewardBoxImage2:setVisible(true)
		end

		if self._clubBossInfo:getHasGetHurtAward() == true then
			self._rewardBoxImage3:setVisible(true)
		end
	end
end

function ClubBossMediator:onBackToThisView(event)
	local data = event:getData()

	if data and data.viewType ~= self._viewType then
		return
	end

	if self._delayDoKillAnim then
		self._delayDoKillAnim = false

		self:doBossKilledAnim()
	end
end

function ClubBossMediator:checkSomethingAfterBattleWhenChangeSecen()
	local reward = self._clubSystem:getKillReward()

	if reward then
		self._clubSystem:clearKillReward()

		local view = self:getInjector():getInstance("getRewardView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			maskOpacity = 0
		}, {
			needClick = false,
			rewards = reward
		}))
	end
end

function ClubBossMediator:afterBattle(event)
	local reward = self._clubSystem:getKillReward()

	if reward then
		self._clubSystem:clearKillReward()

		local view = self:getInjector():getInstance("getRewardView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			maskOpacity = 0
		}, {
			needClick = false,
			rewards = reward
		}))
	end
end

function ClubBossMediator:refreshHurtAndHp(event)
	local data = event:getData()

	if data and data.viewType ~= self._viewType then
		return
	end

	self:refreshData()

	if self._clubBossInfo ~= nil then
		self._rewardCurrentExp:setString(tostring(self._clubBossInfo:getHurt()))
		self._rewardMaxExp:setString("/" .. tostring(self._clubBossInfo:getHurtTarget()))
		self._rewardLoadingBar:setPercent(self._clubBossInfo:getHurt() / self._clubBossInfo:getHurtTarget() * 100)
		self._heroLoadingBar:setPercent(100 - self._clubBossInfo:getHpRate() * 100)

		local maxHp = math.floor(self._currentBossPoints:getBossHp() + 0.5)
		local curHp = math.floor(maxHp * self._clubBossInfo:getHpRate() + 0.5)

		self._heroLoadingText:setString(tostring(curHp) .. "/" .. tostring(maxHp))

		if self._clubBossInfo:getHurt() < self._clubBossInfo:getHurtTarget() then
			self._rewardBoxImage1:setVisible(true)
			self._rewardBoxImage2:setVisible(false)
			self._rewardBoxImage3:setVisible(false)
		end

		if self._clubBossInfo:getHurtTarget() <= self._clubBossInfo:getHurt() then
			self._rewardBoxImage1:setVisible(false)
			self._rewardBoxImage2:setVisible(false)
			self._rewardBoxImage3:setVisible(false)

			if self._clubBossInfo:getHasGetHurtAward() == false then
				self._rewardBoxImage2:setVisible(true)
			end

			if self._clubBossInfo:getHasGetHurtAward() == true then
				self._rewardBoxImage3:setVisible(true)
			end
		end
	end
end

function ClubBossMediator:refreshData()
	self._clubBossInfo = self._developSystem:getPlayer():getClub():getClubBossInfo(self._viewType)
	self._currentBossPoints = self._clubBossInfo:getBossPointsByPonitId(self._clubBossInfo:getNowPoint())
end

function ClubBossMediator:refreshView()
	self:refreshRedPoint()
	self:setTimer()
	self:setScore()
	self:doSomeChangeUI()
end

function ClubBossMediator:refreshViewWithAnim(useAnim)
	self._goToBack = false
	self._doingKillAnim = false

	self:setTimer()
	self:doSomeNotChangeUI()
	self:doSomeChangeUI()
	self:runStartAction()
	self:refreshRedPoint()
end

function ClubBossMediator:refreshRedPoint()
	local redPoint = self._mainPanel:getChildByFullName("rewardNode.butonNode.redPoint")

	redPoint:setVisible(self._clubBossInfo:checkHasRewardCanGet())
end

function ClubBossMediator:initData()
	self._clubBossInfo = self._developSystem:getPlayer():getClub():getClubBossInfo(self._viewType)
	self._currentBossPoints = self._clubBossInfo:getBossPointsByPonitId(self._clubBossInfo:getNowPoint())
end

function ClubBossMediator:initNodes()
	self._mainPanel = self:getView():getChildByFullName("main")
	self._mainBg = self._mainPanel:getChildByFullName("ImageBg")
	self._timeNode = self._mainPanel:getChildByFullName("timeNode")

	self._timeNode:setVisible(false)

	self._integralNode = self._mainPanel:getChildByFullName("integralNode")

	self._integralNode:setVisible(false)

	self._integralButton = self._integralNode:getChildByFullName("infoButton")
	self._bossPanel = self._mainPanel:getChildByFullName("heroNode.bossPanel")
	self._battleAnimNode = self._bossPanel:getChildByFullName("battleAnimNode")

	self._battleAnimNode:setVisible(false)

	self._talkNode = self._bossPanel:getChildByFullName("talkNode")
	self._talkText = self._talkNode:getChildByFullName("Text_talk")
	self._heroNode = self._bossPanel:getChildByFullName("bossInfoNode.heroNode")
	self._heroInfoNode = self._bossPanel:getChildByFullName("bossInfoNode.infoNode")
	self._heroLoadingBar = self._heroInfoNode:getChildByFullName("barNode.loadingBar")
	self._heroLoadingText = self._heroInfoNode:getChildByFullName("barNode.loadingText")
	self._heroNameText = self._heroInfoNode:getChildByFullName("nameNode.nameText")
	self._heroSkillNode = self._heroInfoNode:getChildByFullName("skillNode")
	self._skillClonePanel = self._heroInfoNode:getChildByFullName("skillClonePanel")

	self._skillClonePanel:setVisible(false)

	self._skillTipPanel = self._heroInfoNode:getChildByName("skillTipPanel")

	self._skillTipPanel:setVisible(false)

	self._bottomAttackNode = self._mainPanel:getChildByFullName("bottomAttackNode")
	self._btnBasePanel = self._mainPanel:getChildByFullName("bottomAttackNode.btnPanel")

	self._btnBasePanel:setVisible(false)

	local textPanel1 = self._mainPanel:getChildByFullName("bottomAttackNode.textPanel1")

	textPanel1:setVisible(false)

	local textPanel2 = self._mainPanel:getChildByFullName("bottomAttackNode.textPanel2")

	textPanel2:setVisible(false)

	local textPanel3 = self._mainPanel:getChildByFullName("bottomAttackNode.textPanel3")

	textPanel3:setVisible(false)

	local textPanel4 = self._mainPanel:getChildByFullName("bottomAttackNode.textPanel4")

	textPanel4:setVisible(false)

	local attackPanel3 = self._mainPanel:getChildByFullName("bottomAttackNode.attackPanel3")

	attackPanel3:setVisible(false)

	local attackPanel4 = self._mainPanel:getChildByFullName("bottomAttackNode.attackPanel4")

	attackPanel4:setVisible(false)

	local desPanel = self._mainPanel:getChildByFullName("bottomAttackNode.desPanel")

	desPanel:setVisible(false)

	local haveHeroPanel = self._mainPanel:getChildByFullName("bottomAttackNode.haveHeroPanel")

	haveHeroPanel:setVisible(false)

	local battleText = self._mainPanel:getChildByFullName("bottomAttackNode.battleText")

	battleText:setVisible(false)

	local rankPanel = self._mainPanel:getChildByFullName("bottomAttackNode.rankPanel")

	if self._viewType == ClubHallType.kActivityBoss then
		rankPanel:setVisible(false)
	end

	local recordPanel = self._mainPanel:getChildByFullName("bottomAttackNode.recordPanel")

	if self._viewType == ClubHallType.kActivityBoss then
		recordPanel:setVisible(false)
	end

	self._rewardLoadingBar = self._mainPanel:getChildByFullName("rewardNode.barNode.loadingBar")
	self._rewardCurrentExp = self._mainPanel:getChildByFullName("rewardNode.barNode.currentExp")
	self._rewardMaxExp = self._mainPanel:getChildByFullName("rewardNode.barNode.maxExp")
	self._rewardBoxImage1 = self._mainPanel:getChildByFullName("rewardNode.boxNode.boxImage1")
	self._rewardBoxImage2 = self._mainPanel:getChildByFullName("rewardNode.boxNode.boxImage2")
	self._rewardBoxImage3 = self._mainPanel:getChildByFullName("rewardNode.boxNode.boxImage3")
	self._rewardPanel = self._mainPanel:getChildByFullName("rewardNode.rewardPanel")
	self._allPassImage = self._mainPanel:getChildByFullName("rewardNode.allPassImage")

	self._allPassImage:setVisible(false)

	self._newsPanel = self._mainPanel:getChildByFullName("newsNode.newsPanel")
	self._baseNewsPanel = self._mainPanel:getChildByFullName("newsNode.baseNewsPanel")
	self._newsCellPanel = self._mainPanel:getChildByFullName("newsNode.newsCellPanel")

	self._newsCellPanel:setVisible(false)
end

function ClubBossMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")

	topInfoNode:setLocalZOrder(999)

	local currencyInfoWidget = self._systemKeeper:getResourceBannerIds("Club_System")
	local currencyInfo = {}

	for i = #currencyInfoWidget, 1, -1 do
		currencyInfo[#currencyInfoWidget - i + 1] = currencyInfoWidget[i]
	end

	local title = Strings:get("ClubNew_UI_28")

	if self._viewType == ClubHallType.kActivityBoss then
		title = Strings:get("ClubNew_UI_29")
	end

	local config = {
		style = 1,
		hasAnim = true,
		currencyInfo = currencyInfo,
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		title = title
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function ClubBossMediator:doSomeNotChangeUI()
	self:setStarAndEndTime()
	self:addBottomAnimation()

	if self._clubBossInfo ~= nil then
		self._newsPanel:removeAllChildren()
		self._baseNewsPanel:setVisible(true)
		self._baseNewsPanel:setOpacity(255)

		local oldText = self._baseNewsPanel:getChildByTag(12345)

		if oldText then
			return
		end

		local contentText = ccui.RichText:createWithXML(Strings:get("clubBoss_30"), {})

		contentText:addTo(self._baseNewsPanel)
		contentText:setTag(12345)
		contentText:setPosition(cc.p(160, 60))

		local Text_39 = self._baseNewsPanel:getChildByFullName("Text_39")

		Text_39:setString(Strings:get("clubBoss_31"))

		local anim = cc.MovieClip:create("zdxunhuan_shetuantaofa")

		anim:addTo(self._battleAnimNode, 1)
		anim:gotoAndPlay(1)

		local battleNode = anim:getChildByName("battleNode")
		local battleText = self._mainPanel:getChildByFullName("bottomAttackNode.battleText")
		local battleCloneText = battleText:clone()

		battleCloneText:setVisible(true)
		battleCloneText:addTo(battleNode):posite(-5, 8)
	end
end

function ClubBossMediator:addBottomAnimation()
	local oldAnim = self._bottomAttackNode:getChildByTag(12345)

	if oldAnim then
		oldAnim:removeFromParent(true)

		self._bottomAnim = nil
		self._challengeAnimNode = nil
		self._challengeCanNotBg = nil
		self._challengeRemainText = nil
	end

	local anim = cc.MovieClip:create("changkuang_shetuantaofa")

	anim:addTo(self._bottomAttackNode, 1)
	anim:setPosition(cc.p(662, 93))

	self._bottomAnim = anim

	anim:setTag(12345)
	anim:gotoAndStop(1)

	local currentSeasonConfig = self._clubBossInfo:getCurrentSeasonConfig()
	local heroNode1 = anim:getChildByName("heroNode1")
	local bgImage = ccui.ImageView:create("asset/commonRaw/common_bd_ssr01.png", ccui.TextureResType.localType)

	bgImage:setScale(0.4)
	bgImage:setPositionY(5)
	bgImage:addTo(heroNode1)

	local oneHero = currentSeasonConfig.ExcellentHero[1].Hero[1]

	if oneHero ~= nil then
		local config = ConfigReader:getRecordById("HeroBase", oneHero)
		local heroImg = IconFactory:createRoleIconSprite({
			id = config.RoleModel
		})

		bgImage:addChild(heroImg)
		heroImg:setPosition(cc.p(116.5, 116.5))
		heroImg:setScale(0.625)

		local data = {
			text1 = "clubBoss_51",
			rightOff_x = 40,
			downOff_y = 60,
			type = RewardType.kRewardLink
		}

		IconFactory:bindTouchHander(heroImg, SomeWordTouchHandler:new(self), data, {
			needDelay = true
		})

		if self._heroSystem:hasHero(oneHero) then
			local haveHeroPanel = self._mainPanel:getChildByFullName("bottomAttackNode.haveHeroPanel")
			local haveHero = haveHeroPanel:clone()

			haveHero:setVisible(true)
			bgImage:addChild(haveHero)
			haveHero:setScale(2.5)
			haveHero:setPosition(cc.p(116.5, 205))
		end
	end

	anim:addCallbackAtFrame(2, function ()
		local desTextNode = anim:getChildByName("desTextNode")
		local desPanelNode = self._mainPanel:getChildByFullName("bottomAttackNode.desPanel")
		local desPanel = desPanelNode:clone()

		desPanel:setVisible(true)

		local Text_63 = desPanel:getChildByName("Text_63")
		local Text_64 = desPanel:getChildByName("Text_64")

		self:setOutline(Text_63)
		self:setOutline(Text_64)

		if self._viewType == ClubHallType.kActivityBoss then
			Text_63:setString(Strings:get("Club_ActivityBoss_15"))
		end

		desPanel:addTo(desTextNode)
		desPanel:setPosition(cc.p(0, 0))
	end)
	anim:addCallbackAtFrame(3, function ()
		local heroNode2 = anim:getChildByName("heroNode2")
		local bgImage = ccui.ImageView:create("asset/commonRaw/common_bd_ssr01.png", ccui.TextureResType.localType)

		bgImage:setScale(0.4)
		bgImage:setPositionY(5)
		bgImage:addTo(heroNode2)

		local oneHero = currentSeasonConfig.ExcellentHero[1].Hero[2]

		if oneHero ~= nil then
			local config = ConfigReader:getRecordById("HeroBase", oneHero)
			local heroImg = IconFactory:createRoleIconSprite({
				id = config.RoleModel
			})

			bgImage:addChild(heroImg)
			heroImg:setPosition(cc.p(116.5, 116.5))
			heroImg:setScale(0.625)

			local data = {
				downOff_y = 60,
				text1 = "clubBoss_51",
				type = RewardType.kRewardLink
			}

			IconFactory:bindTouchHander(heroImg, SomeWordTouchHandler:new(self), data, {
				needDelay = true
			})

			if self._heroSystem:hasHero(oneHero) then
				local haveHeroPanel = self._mainPanel:getChildByFullName("bottomAttackNode.haveHeroPanel")
				local haveHero = haveHeroPanel:clone()

				haveHero:setVisible(true)
				bgImage:addChild(haveHero)
				haveHero:setScale(2.5)
				haveHero:setPosition(cc.p(116.5, 205))
			end
		end

		local textPanel1 = self._mainPanel:getChildByFullName("bottomAttackNode.textPanel1")
		local textPanel = textPanel1:clone()

		textPanel:setVisible(true)

		local text1 = anim:getChildByName("text1")

		textPanel:addTo(text1)
		textPanel:setPosition(cc.p(0, 0))

		local effectText = textPanel:getChildByName("attackText")

		self:setOutline(effectText)

		if currentSeasonConfig.ExcellentHero[1].Effect ~= nil then
			local effectConfig = ConfigReader:getRecordById("SkillAttrEffect", currentSeasonConfig.ExcellentHero[1].Effect)

			if effectConfig then
				effectText:setString(Strings:get(effectConfig.EffectDesc))
			end
		end
	end)
	anim:addCallbackAtFrame(4, function ()
		local heroNode3 = anim:getChildByName("heroNode3")
		local bgImage = ccui.ImageView:create("asset/commonRaw/common_bd_ssr01.png", ccui.TextureResType.localType)

		bgImage:setScale(0.4)
		bgImage:setPositionY(5)
		bgImage:addTo(heroNode3)

		local oneHero = currentSeasonConfig.ExcellentHero[2].Hero[1]

		if oneHero ~= nil then
			local config = ConfigReader:getRecordById("HeroBase", oneHero)
			local heroImg = IconFactory:createRoleIconSprite({
				id = config.RoleModel
			})

			bgImage:addChild(heroImg)
			heroImg:setPosition(cc.p(116.5, 116.5))
			heroImg:setScale(0.625)

			local data = {
				downOff_y = 60,
				text1 = "clubBoss_51",
				type = RewardType.kRewardLink
			}

			IconFactory:bindTouchHander(heroImg, SomeWordTouchHandler:new(self), data, {
				needDelay = true
			})

			if self._heroSystem:hasHero(oneHero) then
				local haveHeroPanel = self._mainPanel:getChildByFullName("bottomAttackNode.haveHeroPanel")
				local haveHero = haveHeroPanel:clone()

				haveHero:setVisible(true)
				bgImage:addChild(haveHero)
				haveHero:setScale(2.5)
				haveHero:setPosition(cc.p(116.5, 205))
			end
		end
	end)
	anim:addCallbackAtFrame(5, function ()
		local infoNode = anim:getChildByName("infoNode")
		local infoImage = ccui.ImageView:create("asset/common/common_btn_xq.png", ccui.TextureResType.localType)

		infoImage:setScale(0.45)
		infoImage:setPosition(cc.p(-10, 3))
		infoImage:addTo(infoNode)

		self._showInfoNode = true
	end)
	anim:addCallbackAtFrame(6, function ()
		local heroNode4 = anim:getChildByName("heroNode4")
		local bgImage = ccui.ImageView:create("asset/commonRaw/common_bd_ssr01.png", ccui.TextureResType.localType)

		bgImage:setScale(0.4)
		bgImage:setPosition(cc.p(0.6, 5))
		bgImage:addTo(heroNode4)

		local oneHero = currentSeasonConfig.ExcellentHero[2].Hero[2]

		if oneHero ~= nil then
			local config = ConfigReader:getRecordById("HeroBase", oneHero)
			local heroImg = IconFactory:createRoleIconSprite({
				id = config.RoleModel
			})

			bgImage:addChild(heroImg)
			heroImg:setPosition(cc.p(116.5, 116.5))
			heroImg:setScale(0.625)

			local data = {
				downOff_y = 60,
				text1 = "clubBoss_51",
				type = RewardType.kRewardLink
			}

			IconFactory:bindTouchHander(heroImg, SomeWordTouchHandler:new(self), data, {
				needDelay = true
			})

			if self._heroSystem:hasHero(oneHero) then
				local haveHeroPanel = self._mainPanel:getChildByFullName("bottomAttackNode.haveHeroPanel")
				local haveHero = haveHeroPanel:clone()

				haveHero:setVisible(true)
				bgImage:addChild(haveHero)
				haveHero:setScale(2.5)
				haveHero:setPosition(cc.p(116.5, 205))
			end
		end

		local textPanel2 = self._mainPanel:getChildByFullName("bottomAttackNode.textPanel2")
		local textPanel = textPanel2:clone()

		textPanel:setVisible(true)

		local text2 = anim:getChildByName("text2")

		textPanel:addTo(text2)
		textPanel:setPosition(cc.p(0, 0))

		local effectText = textPanel:getChildByName("attackText")

		self:setOutline(effectText)

		if currentSeasonConfig.ExcellentHero[1].Effect ~= nil then
			local effectConfig = ConfigReader:getRecordById("SkillAttrEffect", currentSeasonConfig.ExcellentHero[2].Effect)

			if effectConfig then
				effectText:setString(Strings:get(effectConfig.EffectDesc))
			end
		end
	end)
	anim:addCallbackAtFrame(8, function ()
		local heroNode5 = anim:getChildByName("heroNode5")
		local bgImage = ccui.ImageView:create("asset/commonRaw/common_bd_ssr01.png", ccui.TextureResType.localType)

		bgImage:setScale(0.4)
		bgImage:setPositionY(5)
		bgImage:addTo(heroNode5)

		local oneHero = currentSeasonConfig.ExcellentHero[2].Hero[3]

		if oneHero ~= nil then
			local config = ConfigReader:getRecordById("HeroBase", oneHero)
			local heroImg = IconFactory:createRoleIconSprite({
				id = config.RoleModel
			})

			bgImage:addChild(heroImg)
			heroImg:setPosition(cc.p(116.5, 116.5))
			heroImg:setScale(0.625)

			local data = {
				downOff_y = 60,
				text1 = "clubBoss_51",
				type = RewardType.kRewardLink
			}

			IconFactory:bindTouchHander(heroImg, SomeWordTouchHandler:new(self), data, {
				needDelay = true
			})

			if self._heroSystem:hasHero(oneHero) then
				local haveHeroPanel = self._mainPanel:getChildByFullName("bottomAttackNode.haveHeroPanel")
				local haveHero = haveHeroPanel:clone()

				haveHero:setVisible(true)
				bgImage:addChild(haveHero)
				haveHero:setScale(2.5)
				haveHero:setPosition(cc.p(116.5, 205))
			end
		end
	end)
	anim:addCallbackAtFrame(9, function ()
		local attackIPanel3 = self._mainPanel:getChildByFullName("bottomAttackNode.attackPanel4")
		local attackPane = attackIPanel3:clone()

		attackPane:setVisible(true)

		local heroNode6 = anim:getChildByName("heroNode6")

		attackPane:addTo(heroNode6)
		attackPane:setPosition(cc.p(0, 0))

		local data = {
			downOff_y = 0,
			text1 = "clubBoss_52",
			type = RewardType.kRewardLink
		}
		local Image = attackPane:getChildByName("Image")

		IconFactory:bindTouchHander(Image, SomeWordTouchHandler:new(self), data, {
			needDelay = true
		})
	end)
	anim:addCallbackAtFrame(11, function ()
		local textPanel3 = self._mainPanel:getChildByFullName("bottomAttackNode.textPanel4")
		local textPanel = textPanel3:clone()

		textPanel:setVisible(true)

		local text3 = anim:getChildByName("text3")

		textPanel:addTo(text3)
		textPanel:setPosition(cc.p(0, 0))

		local effectText = textPanel:getChildByName("attackText")

		self:setOutline(effectText)

		if currentSeasonConfig.AwakenAttrEffect ~= nil then
			local effectConfig = ConfigReader:getRecordById("SkillAttrEffect", currentSeasonConfig.AwakenAttrEffect)

			if effectConfig then
				effectText:setString(Strings:get(effectConfig.EffectDesc))
			end
		end
	end)
	anim:addCallbackAtFrame(13, function ()
		local attackIPanel4 = self._mainPanel:getChildByFullName("bottomAttackNode.attackPanel3")
		local attackPane = attackIPanel4:clone()

		attackPane:setVisible(true)

		local heroNode7 = anim:getChildByName("heroNode7")

		attackPane:addTo(heroNode7)
		attackPane:setPosition(cc.p(0, 0))

		local data = {
			downOff_y = 0,
			text1 = "clubBoss_52",
			type = RewardType.kRewardLink
		}
		local Image = attackPane:getChildByName("Image")

		IconFactory:bindTouchHander(Image, SomeWordTouchHandler:new(self), data, {
			needDelay = true
		})
	end)
	anim:addCallbackAtFrame(15, function ()
		local textPanel4 = self._mainPanel:getChildByFullName("bottomAttackNode.textPanel3")
		local textPanel = textPanel4:clone()

		textPanel:setVisible(true)

		local text4 = anim:getChildByName("text4")

		textPanel:addTo(text4)
		textPanel:setPosition(cc.p(0, 0))

		local effectText = textPanel:getChildByName("attackText")

		self:setOutline(effectText)

		if currentSeasonConfig.StarsAttrEffect ~= nil then
			local effectConfig = ConfigReader:getRecordById("SkillAttrEffect", currentSeasonConfig.StarsAttrEffect)

			if effectConfig then
				effectText:setString(Strings:get(effectConfig.EffectDesc))
			end
		end
	end)
	anim:addCallbackAtFrame(18, function ()
		local challengeNode = anim:getChildByName("challengeNode")
		self._btnPanel = self._btnBasePanel:clone()
		self._challengeAnimNode = self._btnPanel:getChildByName("animNode")
		self._challengeCanNotBg = self._btnPanel:getChildByName("canNotBg")
		local tiaoImage = self._challengeCanNotBg:getChildByName("tiaoImage")
		local zhanImage = self._challengeCanNotBg:getChildByName("zhanImage")

		tiaoImage:setGray(true)
		zhanImage:setGray(true)

		self._challengeRemainText = self._btnPanel:getChildByName("RemainText")

		self:setOutline(self._challengeRemainText)

		local btnAnim = cc.MovieClip:create("xiangqingxunhuan_zhuxianguanka_UIjiaohudongxiao")

		btnAnim:setScale(0.8)
		btnAnim:addTo(self._challengeAnimNode)
		btnAnim:setOpacity(0)
		btnAnim:runAction(cc.FadeIn:create(0.5))
		self._btnPanel:setVisible(true)
		self._btnPanel:addTo(challengeNode)
		self._btnPanel:setPosition(cc.p(0, -10))
		self._challengeRemainText:setString(Strings:get("Club_Boss_11", {
			nums = self._clubBossInfo:getBossFightTimes()
		}))

		if self._clubBossInfo:getBossFightTimes() <= 0 then
			self._challengeCanNotBg:setVisible(true)
			self._challengeAnimNode:setVisible(false)
		else
			self._challengeCanNotBg:setVisible(false)
			self._challengeAnimNode:setVisible(true)
		end

		self._showChallengeNode = true
	end)
	anim:addCallbackAtFrame(180, function ()
		anim:stop()
	end)
end

function ClubBossMediator:doSomeChangeUI(isEnter)
	if self._clubBossInfo ~= nil then
		if self._clubBossInfo:getPassAll() then
			self._allPassImage:setVisible(true)
			self._rewardPanel:setVisible(false)
			self._heroSkillNode:setVisible(false)

			local barNode = self._heroInfoNode:getChildByFullName("barNode")

			barNode:setVisible(false)

			local nameNode = self._heroInfoNode:getChildByFullName("nameNode")

			nameNode:setVisible(false)
		end

		self._rewardCurrentExp:setString(tostring(self._clubBossInfo:getHurt()))
		self._rewardMaxExp:setString("/" .. tostring(self._clubBossInfo:getHurtTarget()))
		self._rewardLoadingBar:setPercent(self._clubBossInfo:getHurt() / self._clubBossInfo:getHurtTarget() * 100)

		local rate = 100 - self._clubBossInfo:getHpRate() * 100

		if rate > 98 then
			rate = 98
		end

		self._heroLoadingBar:setPercent(rate)

		local maxHp = math.floor(self._currentBossPoints:getBossHp() + 0.5)
		local curHp = math.floor(maxHp * self._clubBossInfo:getHpRate() + 0.5)

		self._heroLoadingText:setString(tostring(curHp) .. "/" .. tostring(maxHp))

		if self._clubBossInfo:getHurt() < self._clubBossInfo:getHurtTarget() then
			self._rewardBoxImage1:setVisible(true)
			self._rewardBoxImage2:setVisible(false)
			self._rewardBoxImage3:setVisible(false)
		end

		if self._clubBossInfo:getHurtTarget() <= self._clubBossInfo:getHurt() then
			self._rewardBoxImage1:setVisible(false)
			self._rewardBoxImage2:setVisible(false)
			self._rewardBoxImage3:setVisible(false)

			if self._clubBossInfo:getHasGetHurtAward() == false then
				self._rewardBoxImage2:setVisible(true)

				if self._clubSystem:checkBossDelayHurtRewardMark(self._viewType) == false then
					self._rewardBoxImage2:getChildByFullName("redPoint"):setVisible(false)
				end
			end

			if self._clubBossInfo:getHasGetHurtAward() == true then
				self._rewardBoxImage3:setVisible(true)
			end
		end

		if self._showChallengeNode and self._challengeRemainText then
			self._challengeRemainText:setString(Strings:get("Club_Boss_11", {
				nums = self._clubBossInfo:getBossFightTimes()
			}))

			if self._clubBossInfo:getBossFightTimes() <= 0 then
				self._challengeCanNotBg:setVisible(true)
				self._challengeAnimNode:setVisible(false)
			else
				self._challengeCanNotBg:setVisible(false)
				self._challengeAnimNode:setVisible(true)
			end
		end
	end

	self._heroNode:removeAllChildren()

	if self._currentBossPoints ~= nil then
		local currentBlockConfig = self._currentBossPoints:getBlockConfig()

		if currentBlockConfig ~= nil then
			if currentBlockConfig.PointHead ~= nil then
				local anim = cc.MovieClip:create("rend_shetuantaofa")

				anim:addTo(self._heroNode, 1)
				anim:setPositionY(-100)

				self._heroAnim = anim
				local heroBaseNode1 = anim:getChildByName("heroBaseNode1")
				local modelSprite = IconFactory:createRoleIconSprite({
					useAnim = true,
					iconType = "Bust4",
					id = currentBlockConfig.PointHead
				})

				modelSprite:setScale(0.7)
				modelSprite:setPosition(cc.p(30, 30))
				heroBaseNode1:addChild(modelSprite)
				anim:gotoAndStop(45)
				anim:addCallbackAtFrame(52, function ()
					local heroMiddleNode1 = anim:getChildByName("heroMiddleNode1")
					local modelSprite1 = IconFactory:createRoleIconSprite({
						useAnim = true,
						iconType = "Bust4",
						id = currentBlockConfig.PointHead
					})

					modelSprite1:setScale(0.7)
					modelSprite1:setPosition(cc.p(30, 30))
					heroMiddleNode1:addChild(modelSprite1)

					local heroMiddleNode2 = anim:getChildByName("heroMiddleNode2")
					local modelSprite2 = IconFactory:createRoleIconSprite({
						useAnim = true,
						iconType = "Bust4",
						id = currentBlockConfig.PointHead
					})

					modelSprite2:setScale(0.7)
					modelSprite2:setPosition(cc.p(30, 30))
					heroMiddleNode2:addChild(modelSprite2)
				end)
				anim:addCallbackAtFrame(69, function ()
					local pointHead = nil

					if self._currentBossPoints:getNextPoint() == nil or self._currentBossPoints:getNextPoint() == "" then
						pointHead = self._currentBossPoints:getBlockConfig().PointHead
					else
						local nextPoint = self._clubBossInfo:getBossPointsByPonitId(self._currentBossPoints:getNextPoint())
						pointHead = nextPoint:getBlockConfig().PointHead
					end

					if pointHead then
						local heroBaseNode2 = anim:getChildByName("heroBaseNode2")
						local modelSprite1 = IconFactory:createRoleIconSprite({
							useAnim = true,
							iconType = "Bust4",
							id = pointHead
						})

						modelSprite1:setScale(0.7)
						modelSprite1:setPosition(cc.p(30, 30))
						heroBaseNode2:addChild(modelSprite1)
					end
				end)
				anim:addCallbackAtFrame(92, function ()
					self:afterKillAnim()
					anim:stop()
				end)
				anim:addCallbackAtFrame(95, function ()
					anim:stop()
				end)
			end

			if currentBlockConfig.EnemyMaster ~= nil then
				local EnemyMasterConfig = ConfigReader:getRecordById("EnemyMaster", currentBlockConfig.EnemyMaster)
				local allSkillVector = {}

				if EnemyMasterConfig.MasterSkill1 ~= nil and EnemyMasterConfig.MasterSkill1 ~= "" then
					allSkillVector[1] = EnemyMasterConfig.MasterSkill1
				end

				if EnemyMasterConfig.MasterSkill2 ~= nil and EnemyMasterConfig.MasterSkill2 ~= "" then
					allSkillVector[2] = EnemyMasterConfig.MasterSkill2
				end

				if EnemyMasterConfig.MasterSkill3 ~= nil and EnemyMasterConfig.MasterSkill3 ~= "" then
					allSkillVector[3] = EnemyMasterConfig.MasterSkill3
				end

				self._heroSkillNode:removeAllChildren()

				local anim = cc.MovieClip:create("jn_shetuantaofa")

				anim:addTo(self._heroSkillNode, 1)

				if isEnter then
					anim:gotoAndStop(1)
				else
					anim:gotoAndPlay(1)
				end

				anim:setPosition(cc.p(0, 0))

				self._SkillAnim = anim
				local skillNode1 = anim:getChildByName("skillNode1")
				local skillId = allSkillVector[1]
				local newSkillNode = IconFactory:createHeroSkillIcon({
					isLock = false,
					id = skillId
				}, {
					hideLevel = true,
					isWidget = true
				})

				newSkillNode:addTo(skillNode1)
				newSkillNode:setScale(0.5)

				local maskLayer = self._skillClonePanel:clone()

				maskLayer:setPosition(cc.p(0, 0))
				skillNode1:addChild(maskLayer)
				maskLayer:setTouchEnabled(true)
				maskLayer:setVisible(true)
				maskLayer:addClickEventListener(function ()
					self:onClickSkill(skillId)
				end)
				anim:addCallbackAtFrame(3, function ()
					local skillNode2 = anim:getChildByName("skillNode2")

					if #allSkillVector >= 2 then
						local skillId = allSkillVector[2]
						local newSkillNode = IconFactory:createHeroSkillIcon({
							isLock = false,
							id = skillId
						}, {
							hideLevel = true,
							isWidget = true
						})

						newSkillNode:addTo(skillNode2)
						newSkillNode:setScale(0.5)

						local maskLayer = self._skillClonePanel:clone()

						maskLayer:setPosition(cc.p(0, 0))
						skillNode2:addChild(maskLayer)
						maskLayer:setTouchEnabled(true)
						maskLayer:setVisible(true)
						maskLayer:addClickEventListener(function ()
							self:onClickSkill(skillId)
						end)
					end
				end)
				anim:addCallbackAtFrame(5, function ()
					local skillNode3 = anim:getChildByName("skillNode3")

					if #allSkillVector >= 3 then
						local skillId = allSkillVector[3]
						local newSkillNode = IconFactory:createHeroSkillIcon({
							isLock = false,
							id = skillId
						}, {
							hideLevel = true,
							isWidget = true
						})

						newSkillNode:addTo(skillNode3)
						newSkillNode:setScale(0.5)

						local maskLayer = self._skillClonePanel:clone()

						maskLayer:setPosition(cc.p(0, 0))
						skillNode3:addChild(maskLayer)
						maskLayer:setTouchEnabled(true)
						maskLayer:setVisible(true)
						maskLayer:addClickEventListener(function ()
							self:onClickSkill(skillId)
						end)
					end
				end)
				anim:addCallbackAtFrame(180, function ()
					anim:stop()
				end)
			end
		end

		local tableConfig = self._currentBossPoints:getTableConfig()

		if tableConfig ~= nil then
			if tableConfig.ShowReward ~= nil then
				self._rewardPanel:removeAllChildren()

				local rewards = ConfigReader:getRecordById("Reward", tableConfig.ShowReward).Content

				if #rewards > 4 then
					self:createRewardTableView(rewards)
				else
					self:createRewardNoScroll(rewards)
				end
			end

			local currentBlockConfig = self._currentBossPoints:getBlockConfig()
			local pointName = ""

			if tableConfig.Name ~= nil then
				pointName = self._currentBossPoints:getPointName()
				pointName = pointName .. "   "
			end

			if currentBlockConfig.Name ~= nil then
				pointName = pointName .. Strings:get(currentBlockConfig.Name)
			end

			self._heroNameText:setString(pointName)
		end
	end

	local skillTouchPanel = self._skillTipPanel:getChildByName("skillTouchPanel")

	skillTouchPanel:addClickEventListener(function ()
		if self._skillTipPanel:isVisible() then
			self._skillTipPanel:setVisible(false)
		end
	end)
end

function ClubBossMediator:createRewardNoScroll(rewards)
	local size = self._rewardPanel:getContentSize()
	local isSingular = #rewards % 2 == 1 and true or false

	self._rewardPanel:removeAllChildren()

	local pos_x = isSingular and size.width / 2 or size.width / 2 - 40

	for i = 1, #rewards do
		local node = cc.Node:create()

		if i > 1 then
			if (i - 1) % 2 == 1 then
				pos_x = pos_x + (i - 1) / 2 * 150
			else
				pos_x = pos_x - (i - 1) / 2 * 150
			end
		end

		node:addTo(self._rewardPanel):posite(pos_x, 0)

		local reward = rewards[i]
		local rewardIcon = IconFactory:createRewardIcon(reward, {
			isWidget = true
		})

		IconFactory:bindTouchHander(rewardIcon, IconTouchHandler:new(self), reward, {
			needDelay = true
		})
		node:addChild(rewardIcon)
		rewardIcon:setPosition(cc.p(0, 34))
		rewardIcon:setScaleNotCascade(0.6)
	end
end

function ClubBossMediator:createRewardTableView(rewards)
	local function cellSizeForTable(table, idx)
		return 150, 100
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
			local layout = ccui.Layout:create()

			layout:addTo(cell):posite(0, 0)
			layout:setAnchorPoint(cc.p(0, 0))
			layout:setTag(123)
		end

		local cell_Old = cell:getChildByTag(123)

		self:createCell(cell_Old, rewards[idx + 1])
		cell:setTag(idx)

		return cell
	end

	local function numberOfCellsInTableView(table)
		return #rewards
	end

	local tableView = cc.TableView:create(self._rewardPanel:getContentSize())
	self._tableView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setDelegate()
	tableView:setPosition(0, 0)
	tableView:setAnchorPoint(0, 0)
	tableView:setMaxBounceOffset(36)
	self._rewardPanel:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:reloadData()
	tableView:setBounceable(false)
end

function ClubBossMediator:createCell(cell, data)
	cell:removeAllChildren()

	local rewardIcon = IconFactory:createRewardIcon(data, {
		isWidget = true
	})

	IconFactory:bindTouchHander(rewardIcon, IconTouchHandler:new(self), data, {
		needDelay = true
	})
	cell:addChild(rewardIcon)
	rewardIcon:setPosition(cc.p(38, 34))
	rewardIcon:setScaleNotCascade(0.6)
end

function ClubBossMediator:setupView()
end

function ClubBossMediator:setOutline(text)
	text:enableOutline(cc.c4b(0, 0, 0, 127), 1)
end

function ClubBossMediator:onClickInfoBtn(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		if self._doingKillAnim or self._enterDoKillAnim then
			return
		end

		if self._showInfoNode == false then
			return
		end

		local RuleDesc = ConfigReader:getDataByNameIdAndKey("ConfigValue", "ClubBoss_RuleTranslate", "content")

		if self._viewType == ClubHallType.kActivityBoss then
			local summerActivity = self._clubSystem:getClubBossSummerActivity()

			if summerActivity then
				RuleDesc = summerActivity:getActivityConfig().RuleDesc
			end
		end

		local resetInfo = ConfigReader:getDataByNameIdAndKey("Reset", "ClubBlock_Reset", "ResetSystem")
		local week = TimeUtil:getLocalWeekByRemote(resetInfo.resetDate[1])
		startTime = TimeUtil:localDate("%H:%M:%S", TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = string.split(resetInfo.resetTime[1], ":")[1],
			min = string.split(resetInfo.resetTime[1], ":")[2],
			sec = string.split(resetInfo.resetTime[1], ":")[3]
		}))
		local view = self:getInjector():getInstance("ArenaRuleView")
		local weekStr = Strings:get("Time_Title1_Rule_" .. week)
		local event = ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			useParam = true,
			rule = RuleDesc,
			param1 = weekStr .. startTime
		}, nil)

		self:dispatch(event)
	end
end

function ClubBossMediator:onClickChallenge(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		if self._doingKillAnim or self._enterDoKillAnim then
			return
		end

		if self._showChallengeNode == false then
			return
		end

		if self._clubBossInfo:getBossFightTimes() <= 0 then
			local tips = Strings:get("clubBoss_36")

			if self._viewType == ClubHallType.kActivityBoss then
				tips = Strings:get("Club_ActivityBoss_16")
			end

			if self._viewType == ClubHallType.kBoss and self:checkJoinToday() == true then
				tips = Strings:get("clubBoss_61")
			end

			self:dispatch(ShowTipEvent({
				duration = 0.35,
				tip = tips
			}))

			return
		end

		if self._clubBossInfo:getPassAll() then
			self:dispatch(ShowTipEvent({
				duration = 0.35,
				tip = Strings:get("clubBoss_48")
			}))

			return
		end

		self._clubSystem:onClickEditTeam(self._viewType)
	end
end

function ClubBossMediator:onClickBox(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		if self._doingKillAnim or self._enterDoKillAnim then
			return
		end

		local data = {
			viewType = self._viewType
		}
		local view = self:getInjector():getInstance("ClubBossGainRewardView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data))
	end
end

function ClubBossMediator:onClickRankPanel(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		if self._doingKillAnim or self._enterDoKillAnim then
			return
		end

		self._clubSystem:showRankView()
	end
end

function ClubBossMediator:onClickRecordPanel(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		if self._doingKillAnim or self._enterDoKillAnim then
			return
		end

		self._clubSystem:showClubBossRecordView(self._viewType)
	end
end

function ClubBossMediator:onClickHeroPanel(sender, eventType)
	if eventType == ccui.TouchEventType.ended then
		if self._doingKillAnim or self._enterDoKillAnim then
			return
		end

		self:showTalkWord(false)
	end
end

function ClubBossMediator:onClickShowReward(sender, eventType)
	if self._doingKillAnim or self._enterDoKillAnim then
		return
	end

	if eventType == ccui.TouchEventType.ended then
		local data = {
			viewType = self._viewType
		}
		local view = self:getInjector():getInstance("ClubBossShowAllBossView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))
	end
end

function ClubBossMediator:onClickIntegralButton()
	if self._doingKillAnim or self._enterDoKillAnim then
		return
	end

	local view = self:getInjector():getInstance("ClubBossActivityScoreView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, nil))
end

function ClubBossMediator:onClickSkill(skillId)
	if self._doingKillAnim or self._enterDoKillAnim then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
	self._skillTipPanel:setVisible(true)
	self:updateSkillDesc(skillId)
end

function ClubBossMediator:onClickBack(sender, eventType)
	self:dismiss()
end

function ClubBossMediator:onForcedLevel(event)
	self:dismiss()
end

function ClubBossMediator:goToBack()
	self._goToBack = true

	self:stopTimer()
	self:getView():stopAllActions()
	self._mainPanel:stopAllActions()

	self._enterDoKillAnim = false

	self._clubSystem:clearClubBossKilled(self._viewType)
end

function ClubBossMediator:updateSkillDesc(skillId)
	local config = ConfigReader:getRecordById("Skill", skillId)
	local infoNode = self._skillTipPanel:getChildByFullName("infoNode")
	local iconPanel = infoNode:getChildByFullName("iconPanel")

	iconPanel:removeAllChildren()

	local newSkillNode = IconFactory:createHeroSkillIcon({
		isLock = false,
		id = skillId
	}, {
		hideLevel = true,
		isWidget = true
	})

	newSkillNode:addTo(iconPanel):center(iconPanel:getContentSize())
	newSkillNode:setScale(0.85)

	local typeIcon = infoNode:getChildByFullName("icon")

	typeIcon:setVisible(false)

	local name = infoNode:getChildByFullName("name")

	name:setString(Strings:get(config.Name))

	local bg = self._skillTipPanel:getChildByName("Image_bg")
	local desc = self._skillTipPanel:getChildByName("desc")
	local str = ""
	local style = {
		fontName = TTF_FONT_FZYH_M
	}

	if config.Desc and config.Desc ~= "" then
		local descStr = ConfigReader:getEffectDesc("Skill", config.Desc, skillId, 1, style)
		str = descStr
	end

	local skillProto = PrototypeFactory:getInstance():getSkillPrototype(skillId)

	if skillProto then
		local attrDescs = skillProto:getAttrDescs(1) or {}

		if attrDescs[1] then
			str = str .. attrDescs[1]
		end
	end

	desc:removeAllChildren()
	desc:setString("")

	local label = ccui.RichText:createWithXML(str, {})

	label:renderContent(290, 0)
	label:setAnchorPoint(cc.p(0, 0))
	label:addTo(desc)
	label:setPosition(cc.p(0, 0))

	local height = label:getContentSize().height + 114

	bg:setContentSize(cc.size(307, height))
	infoNode:setPositionY(height - 94)
end

function ClubBossMediator:refreshTVShow()
	local scene = self:getInjector():getInstance("BaseSceneMediator", "activeScene")
	local topViewName = scene:getTopViewName()

	if topViewName ~= "ClubView" or self._goToBack then
		return
	end

	local showType, tvinfo = self._clubBossInfo:getShowTVInfo()

	if tvinfo then
		if showType == ClubBossTVType.kNormal then
			local data = {
				time = tvinfo:getTime()
			}

			self._clubSystem:requestClubBossSetTipReadTime(tvinfo:getTime(), self._viewType)
		end

		local oldPanel = self._newsPanel:getChildByTag(123)

		if oldPanel == nil and self._baseNewsPanel:isVisible() == true then
			oldPanel = self._baseNewsPanel
		end

		if oldPanel then
			oldPanel:setTouchEnabled(false)

			local fadeOutAct = cc.FadeOut:create(0.5)

			local function endFunc()
				oldPanel:stopAllActions()

				if oldPanel ~= self._baseNewsPanel then
					oldPanel:removeFromParent(true)
				end
			end

			local callFuncAct1 = cc.CallFunc:create(endFunc)
			local action = cc.Sequence:create(fadeOutAct, callFuncAct1)

			oldPanel:runAction(action)
		end

		local cellPanel = self:createTvCell(showType, tvinfo)

		cellPanel:setTouchEnabled(false)
		cellPanel:setOpacity(0)
		cellPanel:addTo(self._newsPanel):posite(160, 40)

		local delayTimeAct = cc.DelayTime:create(0.5)
		local fadeInAct = cc.FadeIn:create(0.5)

		local function endFunc2()
			cellPanel:setTag(123)
			cellPanel:setTouchEnabled(true)
		end

		local callFuncAct2 = cc.CallFunc:create(endFunc2)
		local action2 = cc.Sequence:create(delayTimeAct, fadeInAct, callFuncAct2)

		cellPanel:runAction(action2)
	end
end

function ClubBossMediator:createTvCell(showType, tvinfo)
	local panel = self._newsCellPanel:clone()

	panel:setVisible(true)

	local headPanel = panel:getChildByName("headPanel")
	local animNode = panel:getChildByName("animNode")

	if showType == ClubBossTVType.kLuxury then
		local anim = cc.MovieClip:create("tesuxianshi_shetuantaofa")

		anim:addTo(animNode)
		anim:setPosition(cc.p(0, 2))
	end

	if tvinfo:getHead() ~= "" and tvinfo:getHeadFrame() ~= "" then
		local headIcon = IconFactory:createPlayerIcon({
			frameStyle = 2,
			clipType = 1,
			headFrameScale = 0.4,
			id = tvinfo:getHead(),
			size = cc.size(82, 82),
			headFrameId = tvinfo:getHeadFrame()
		})

		headIcon:setPosition(cc.p(17, 17))
		headIcon:setScale(0.4)
		headIcon:addTo(headPanel)
		headPanel:setScale(1.5)
		headPanel:setTouchEnabled(true)
		headPanel:addClickEventListener(function ()
			self:onClickPlayerHead(tvinfo)
		end)
	end

	local desc = nil

	if tvinfo:getType() == 1 then
		desc = Strings:get("clubBoss_32", {
			name = tvinfo:getName(),
			num = tvinfo:getGate(),
			hurt = tvinfo:getHurt()
		})
	end

	if tvinfo:getType() == 2 then
		desc = Strings:get("clubBoss_37", {
			name = tvinfo:getName(),
			num = tvinfo:getGate()
		})
	end

	if tvinfo:getType() == 3 then
		local p_str = ""
		local color = ""

		if tvinfo:getHeroId() ~= nil and tvinfo:getHeroId() ~= "" then
			local heroConfig = ConfigReader:getDataByNameIdAndKey("HeroBase", tvinfo:getHeroId())

			if heroConfig then
				local rarity = heroConfig.Rareity
				p_str = GameStyle:getHeroRarityText(rarity) .. Strings:get(heroConfig.Name)
				color = heroRarityTextArrRGB[rarity]
			else
				p_str = "这东西不是英雄"
				color = heroRarityTextArrRGB[12]
			end
		end

		if tvinfo:getItem() ~= nil and tvinfo:getItem().type ~= nil then
			local rarity = 10

			if tvinfo:getItem().type == RewardType.kEquip or tvinfo:getItem().type == RewardType.kEquipExplore then
				rarity = self:getEquipInfo(tvinfo:getItem()).rarity - 9
			else
				rarity = self:getQuality(tvinfo:getItem().code)
			end

			color = heroRarityTextArrRGB[rarity]
			p_str = RewardSystem:getName(tvinfo:getItem())
		end

		desc = Strings:get("clubBoss_38", {
			name = tvinfo:getName(),
			num = tvinfo:getGate(),
			color = color,
			item = p_str
		})
	end

	local label = ccui.RichText:createWithXML(desc, {})

	label:setVerticalSpace(1)
	label:setWrapMode(1)
	label:renderContent(205, 0)
	label:setAnchorPoint(cc.p(0, 0.5))
	label:setPosition(cc.p(95, 40))
	label:addTo(panel)

	return panel
end

function ClubBossMediator:getEquipInfo(data)
	local HeroEquipExp = ConfigReader:getDataByNameIdAndKey("ConfigValue", "HeroEquipExp", "content")
	local HeroEquipStar = ConfigReader:getDataByNameIdAndKey("ConfigValue", "HeroEquipStar", "content")

	if data.type == RewardType.kEquip or data.type == RewardType.kEquipExplore then
		local config = ConfigReader:getRecordById("HeroEquipBase", data.code)

		if not config.Rareity then
			return nil
		end

		local rarity = config.Rareity
		local star = ConfigReader:getDataByNameIdAndKey("HeroEquipStar", HeroEquipStar[tostring(rarity)], "StarLevel")
		local level = ConfigReader:getDataByNameIdAndKey("HeroEquipExp", HeroEquipExp[tostring(rarity)], "ShowLevel")

		return {
			id = data.code,
			rarity = rarity,
			star = star,
			level = level
		}
	end

	return nil
end

function ClubBossMediator:getQuality(code)
	local quality = 2
	local config = ConfigReader:getRecordById("ItemConfig", code)
	config = config or ConfigReader:getRecordById("Surface", code)
	config = config or ConfigReader:getRecordById("HeroEquipBase", code)
	config = config or ConfigReader:getRecordById("HeroBase", code)

	if config then
		return config.Quality
	end

	return quality
end

function ClubBossMediator:setTimer()
	if self._timer then
		return
	end

	local function checkTimeFunc()
		self:refreshTVShow()
	end

	self._timer = LuaScheduler:getInstance():schedule(checkTimeFunc, 7, false)
end

function ClubBossMediator:stopTimer()
	if self._timer then
		self._timer:stop()

		self._timer = nil
	end
end

function ClubBossMediator:onClickPlayerHead(data)
	if not data or data:getId() == nil then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
	self._clubSystem:showMemberPlayerInfoView(data:getId())
end

function ClubBossMediator:runStartAction()
	self._mainPanel:stopAllActions()

	local action = cc.CSLoader:createTimeline("asset/ui/ClubBoss.csb")

	self._mainPanel:runAction(action)
	action:clearFrameEventCallFunc()
	action:gotoFrameAndPlay(0, 10, false)

	local function onFrameEvent(frame)
		if frame == nil then
			return
		end

		local str = frame:getEvent()

		if str == "end" then
			self._bottomAnim:gotoAndPlay(1)
			self._SkillAnim:gotoAndPlay(1)
			self:showTalkWord(false)

			if self._enterDoKillAnim then
				self._enterDoKillAnim = false

				self:doBossKilledAnim(true)
			end
		end
	end

	action:setFrameEventCallFunc(onFrameEvent)
end

function ClubBossMediator:doBossKilledLogic(event)
	local data = event:getData()

	if data and data.viewType ~= self._viewType then
		return
	end

	local scene = self:getInjector():getInstance("BaseSceneMediator", "activeScene")
	local topViewName = scene:getTopViewName()

	if self._goToBack then
		return
	end

	if topViewName ~= "ClubView" then
		self._delayDoKillAnim = true

		return
	end

	self:doBossKilledAnim(true)
end

function ClubBossMediator:doBossKilledAnim(notDelay)
	self._doingKillAnim = true

	self._clubSystem:clearClubBossKilled(self._viewType)

	if notDelay then
		self:showTalkWord(true)
		self._skillTipPanel:setVisible(false)
		self._heroAnim:gotoAndPlay(50)
	else
		performWithDelay(self:getView(), function ()
			self:showTalkWord(true)
			self._skillTipPanel:setVisible(false)
			self._heroAnim:gotoAndPlay(50)
		end, 1.2)
	end
end

function ClubBossMediator:afterKillAnim()
	self._doingKillAnim = false

	self._clubSystem:requestClubBossInfo(nil, true, self._viewType)
end

function ClubBossMediator:showTalkWord(isDead)
	local count = self._clubSystem:getClubBossBattleConunt(self._viewType, self._clubBossInfo:getNowPoint())

	if count > 0 and isDead == false then
		self._talkNode:stopAllActions()
		self._talkNode:setVisible(false)

		return
	end

	local currentBlockConfig = self._currentBossPoints:getBlockConfig()
	local playVoice = nil

	if currentBlockConfig.Bubble ~= nil then
		playVoice = currentBlockConfig.Bubble[math.random(1, #currentBlockConfig.Bubble)]
	end

	if isDead and currentBlockConfig.DeathBubble ~= nil then
		playVoice = currentBlockConfig.DeathBubble[1]
	end

	self:stopTalkEffect()

	local soundDesc = ConfigReader:getDataByNameIdAndKey("Sound", playVoice, "SoundDesc")

	if self._clubBossInfo:getPassAll() then
		soundDesc = "clubBoss_43"
	else
		self._heroEffect, _ = AudioEngine:getInstance():playEffect(playVoice, false)
	end

	if soundDesc ~= nil then
		self._talkNode:stopAllActions()
		self._talkNode:setVisible(true)
		self._talkText:setString(Strings:get(soundDesc))
		self._talkNode:setOpacity(0)

		local fadeAct = cc.FadeIn:create(0.25)
		local allDelayAction = cc.DelayTime:create(2.5)
		local fadeAct2 = cc.FadeOut:create(0.25)
		local callfunc1 = cc.CallFunc:create(function ()
			self._talkNode:setVisible(false)
		end)
		local seqAll = cc.Sequence:create(fadeAct, allDelayAction, fadeAct2, callfunc1)

		self._talkNode:runAction(seqAll)
	end
end

function ClubBossMediator:stopTalkEffect()
	AudioEngine:getInstance():stopEffect(self._heroEffect)
end

function ClubBossMediator:doReset(event)
	local data = event:getData()

	if data and (data[ResetId.kClubBlockTimesReset] or data[ResetId.kClubBlockReset]) then
		if DisposableObject:isDisposed(self) then
			return
		end

		self:stopTimer()
		self:dispatch(Event:new(EVT_POP_TO_TARGETVIEW, "homeView"))
	end

	return false
end

function ClubBossMediator:setStarAndEndTime()
	self._timeNode:setVisible(false)

	if self._viewType == ClubHallType.kActivityBoss then
		local activity = self._clubSystem:getClubBossSummerActivity()

		if activity then
			local timeStamp = activity:getTimeFactor()
			local _, _, y, mon, d, h, m, s = string.find(timeStamp.start[1], "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
			local table = {
				year = y,
				month = mon,
				day = d,
				hour = h,
				min = m,
				sec = s
			}
			local startTime = TimeUtil:timeByRemoteDate(table)
			local _, _, y, mon, d, h, m, s = string.find(timeStamp.start[2], "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
			local table = {
				year = y,
				month = mon,
				day = d,
				hour = h,
				min = m,
				sec = s
			}
			local endTime = TimeUtil:timeByRemoteDate(table)
			local tb = TimeUtil:localDate("*t", startTime)
			local starTimeStr = tostring(tb.year) .. "." .. tostring(tb.month) .. "." .. tostring(tb.day)
			tb = TimeUtil:localDate("*t", endTime)
			local endTimeStr = tostring(tb.year) .. "." .. tostring(tb.month) .. "." .. tostring(tb.day)
			local str = starTimeStr .. " - " .. endTimeStr
			local timeText = self._timeNode:getChildByFullName("time")

			timeText:setString(str)
			self._timeNode:setVisible(true)
		end
	end
end

function ClubBossMediator:setScore()
	if self._viewType == ClubHallType.kActivityBoss then
		local integralText = self._integralNode:getChildByFullName("integralText")

		integralText:setString(tostring(self._clubBossInfo:getAllScore()))

		local des1, des2 = self._clubSystem:getAttrEffectValueForScore(self._clubBossInfo:getAllScore())
		local effectText = self._integralNode:getChildByFullName("effectText")

		effectText:setString(des1)
		self._integralNode:setVisible(true)
		self._integralButton:setTouchEnabled(true)
		self._integralButton:setVisible(true)
		self._integralButton:addClickEventListener(function ()
			self:onClickIntegralButton()
		end)
	end
end

function ClubBossMediator:refreshBattleCount(event)
	local data = event:getData()

	if data and data.viewType ~= self._viewType then
		return
	end

	local count = self._clubSystem:getClubBossBattleConunt(self._viewType, self._clubBossInfo:getNowPoint())

	if count > 0 then
		self._battleAnimNode:setVisible(true)
		self._talkNode:stopAllActions()
		self._talkNode:setVisible(false)
	else
		self._battleAnimNode:setVisible(false)
	end
end

function ClubBossMediator:checkJoinToday()
	local result = false
	local lastJoinTime = self._developSystem:getPlayer():getClub():getInfo():getLastJoinTime()
	local curTime = self._gameServerAgent:remoteTimeMillis()
	local baseTime = {
		sec = 0,
		min = 0,
		hour = 5
	}
	local isSameDay = TimeUtil:isSameDay(lastJoinTime, curTime / 1000, baseTime)
	result = isSameDay

	return result
end
