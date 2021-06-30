ArenaVictoryMediator = class("ArenaVictoryMediator", DmPopupViewMediator, _M)

ArenaVictoryMediator:has("_arenaSystem", {
	is = "r"
}):injectWith("ArenaSystem")
ArenaVictoryMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kBtnHandlers = {}
local pos = {
	{
		cc.p(463, 30)
	},
	{
		cc.p(383, 30),
		cc.p(553, 30)
	},
	{
		cc.p(293, 30),
		cc.p(463, 30),
		cc.p(633, 30)
	},
	{
		cc.p(213, 30),
		cc.p(383, 30),
		cc.p(553, 30),
		cc.p(723, 30)
	},
	{
		cc.p(123, 30),
		cc.p(293, 30),
		cc.p(463, 30),
		cc.p(633, 30),
		cc.p(803, 30)
	}
}

function ArenaVictoryMediator:initialize()
	super.initialize(self)
end

function ArenaVictoryMediator:dispose()
	self._data = nil

	super.dispose(self)
end

function ArenaVictoryMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:bindWidget("bg.button_panel.button_show", OneLevelMainButton, {
		ignoreAddKerning = true,
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onClickShow, self)
		}
	})
	self:bindWidget("bg.button_panel.button_replay", OneLevelMainButton, {
		ignoreAddKerning = true,
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onClickReplay, self)
		}
	})
	self:bindWidget("bg.button_panel.button_exit", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onClickExit, self)
		}
	})
end

function ArenaVictoryMediator:enterWithData(data)
	self:setupView(data)
	self:setupClickEnvs()
end

function ArenaVictoryMediator:setupView(data)
	self._data = data
	self._replayType = self._data.replayType

	if self._replayType == ArenaBattlePlayType.kNormal then
		if self._data.resultData.attackerWin then
			self._winnerId = self._data.resultData.attacker.id

			AudioEngine:getInstance():playBackgroundMusic("Mus_Battle_Common_Win")
		else
			self._winnerId = self._data.resultData.defender.id

			AudioEngine:getInstance():playBackgroundMusic("Mus_Battle_Common_Lose")
		end
	elseif self._replayType == ArenaBattlePlayType.kReport then
		if self._data.resultData:getAttackerWin() then
			self._winnerId = self._data.resultData:getAttacker():getId()

			AudioEngine:getInstance():playBackgroundMusic("Mus_Battle_Common_Win")
		else
			self._winnerId = self._data.resultData:getDefender():getId()

			AudioEngine:getInstance():playBackgroundMusic("Mus_Battle_Common_Lose")
		end
	end

	self:initWidgetInfo()

	if self._replayType == ArenaBattlePlayType.kNormal then
		self:initViewDataWithNormalReplay(self._data.resultData)
	elseif self._replayType == ArenaBattlePlayType.kReport then
		self:initViewDataWithReportReplay(self._data.resultData)
	end
end

function ArenaVictoryMediator:initWidgetInfo()
	local bg = self:getView():getChildByName("bg")
	self._animNode = bg:getChildByFullName("animNode")
	self._heroPanel = bg:getChildByFullName("heroPanel")
	self._rewardNode = bg:getChildByFullName("panel_win.rewardNode")
	self._listView = bg:getChildByFullName("panel_win.listView")

	self._listView:setScrollBarEnabled(false)

	self._winnerName = bg:getChildByFullName("node_1.action_node_1.winer_name")
	self._winnerRank = bg:getChildByFullName("node_1.action_node_1.winer_rank")
	self._winerIconBg = bg:getChildByFullName("node_1.action_node_1.winer_icon_bg.icon_bg")
	self._winnerRankRise = bg:getChildByFullName("node_1.action_node_1.rankRise")
	local anim = cc.MovieClip:create("anim_jingjichangjiesuan")

	anim:addTo(self._animNode)
	anim:addEndCallback(function ()
		anim:stop()
	end)

	self._iconPanel = anim:getChildByFullName("icon")
	local winTitle = bg:getChildByFullName("node_1.action_node_1.winTitle")
	local winAnim = cc.MovieClip:create("shengliz_fubenjiesuan")

	winAnim:addTo(winTitle)
	winAnim:addEndCallback(function ()
		winAnim:stop()
	end)
	CommonUtils.runActionEffectByRootNode(bg, "ArenaVictoryEffect")

	local action_node_4 = self._winnerRankRise:getChildByFullName("action_node_4")
	local anim = cc.MovieClip:create("tisheng_jingjichangjiesuan")

	anim:addTo(action_node_4)
	anim:addEndCallback(function ()
		anim:stop()
	end)
end

function ArenaVictoryMediator:initViewDataWithNormalReplay(data)
	local winnerData = {}
	local defenderData = {}
	local rankRaise = data.rankChange

	if data.attackerWin then
		winnerData = data.attacker
		defenderData = data.defender
	else
		winnerData = data.defender
		defenderData = data.attacker
	end

	self._winnerName:setString(winnerData.nickname)
	self._winnerRank:setString(Strings:get("ARENA_RESULT_RANK") .. self._data.rank)
	self:checkRankRaise(rankRaise)

	local headIcon = IconFactory:createPlayerIcon({
		clipType = 2,
		id = winnerData.headImg,
		size = cc.size(180, 180)
	})

	headIcon:setScale(0.51)
	headIcon:addTo(self._iconPanel)

	local saoguan = headIcon:getChildByName("awakenSao")

	if saoguan then
		saoguan:setVisible(false)
	end

	local rewards = self._data.rewards

	self:showReward(rewards)
	self:showMVP()
end

function ArenaVictoryMediator:initViewDataWithReportReplay(data)
	local winnerData = {}
	local defenderData = {}
	local rankRaise = data:getRankChange()

	if data:getAttackerWin() then
		winnerData = data:getAttacker()
		defenderData = data:getDefender()
	else
		winnerData = data:getDefender()
		defenderData = data:getAttacker()
	end

	self._winnerName:setString(winnerData:getNickname())
	self._winnerRank:setString(Strings:get("ARENA_RESULT_RANK") .. data:getRank())
	self:checkRankRaise(rankRaise)

	local headIcon = IconFactory:createPlayerIcon({
		clipType = 2,
		id = winnerData:getHeadImg(),
		size = cc.size(180, 180)
	})

	headIcon:setScale(0.51)
	headIcon:addTo(self._iconPanel)

	local rewards = data:getReward()

	self:showReward(rewards)
	self:showMVP()
end

function ArenaVictoryMediator:showReward(rewards)
	self._rewardNode:removeAllChildren()
	self._listView:removeAllItems()

	local showRewards = {}

	for i = 1, #rewards do
		if rewards[i].type ~= RewardType.kSpecialValue then
			table.insert(showRewards, rewards[i])
		end
	end

	if #showRewards > 0 then
		for i = 1, #showRewards do
			local newPanel = ccui.Layout:create()

			newPanel:setAnchorPoint(cc.p(0, 0))
			newPanel:setContentSize(cc.size(82, 85))

			local icon = IconFactory:createRewardIcon(showRewards[i])

			icon:setScale(0.64)
			icon:addTo(newPanel):center(newPanel:getContentSize())

			local delay = cc.DelayTime:create(0.8 + (i - 1) * 0.2)

			icon:setScale(1)
			icon:setOpacity(0)

			local scale = cc.ScaleTo:create(0.2, 0.64)
			local fadeIn = cc.FadeIn:create(0.2)
			local spawn = cc.Spawn:create(scale, fadeIn)
			local seq = cc.Sequence:create(delay, spawn)

			icon:runAction(seq)
			self._listView:pushBackCustomItem(newPanel)
		end
	end
end

function ArenaVictoryMediator:showMVP()
	self._heroPanel:removeAllChildren()

	local role = self._data.battleStatist

	if role[self._winnerId] then
		local unitSummary = role[self._winnerId].unitSummary
		local heroes = {}
		local master = {}

		for key, value in pairs(unitSummary) do
			local num = 0

			if value.type == "hero" then
				if value.cure then
					num = num + value.cure
				end

				if value.damage then
					num = num + value.damage
				end

				local type = ConfigReader:getDataByNameIdAndKey("RoleModel", value.model, "Type")

				if num ~= 0 and type == RoleModelType.kHero then
					local addSta = false

					for _index, _value in pairs(heroes) do
						if _value.model == value.model then
							addSta = true
							_value.num = _value.num + num
						end
					end

					if not addSta then
						heroes[#heroes + 1] = {
							model = value.model,
							num = num
						}
					end
				end
			elseif value.type == "master" and value.presentMaster then
				master[#master + 1] = {
					model = value.model
				}
			end
		end

		table.sort(heroes, function (a, b)
			return b.num < a.num
		end)

		if #heroes == 0 then
			if master[1] then
				local heroAnim = RoleFactory:createHeroAnimation(master[1].model)

				heroAnim:setAnchorPoint(cc.p(0.5, 0))
				heroAnim:addTo(self._heroPanel)
				heroAnim:setScale(0.75)
				heroAnim:setPosition(pos[1][1])

				if master[1].model == "Model_LFKLFTe_DGun" then
					heroAnim:setScale(0.35)
					heroAnim:offset(-270, 40)
				end
			end
		else
			local showHeroNum = math.min(#heroes, 5)

			for i = 1, showHeroNum do
				local heroAnim, jsonPath = RoleFactory:createHeroAnimation(heroes[i].model)

				heroAnim:setAnchorPoint(cc.p(0.5, 0))
				heroAnim:addTo(self._heroPanel)
				heroAnim:setScale(0.75)
				heroAnim:setOpacity(0)
				heroAnim:setTag(i)

				local position = pos[showHeroNum][i]

				heroAnim:setPosition(cc.p(position.x - 30, position.y))

				local moveto = cc.MoveTo:create(0.2, cc.p(position.x, position.y))
				local spawn = cc.Spawn:create(cc.FadeIn:create(0.2), moveto)
				local seq = cc.Sequence:create(cc.DelayTime:create(i * 0.1), spawn)

				heroAnim:runAction(seq)
			end
		end
	end
end

function ArenaVictoryMediator:checkRankRaise(raise)
	if tonumber(raise) <= 0 then
		self._winnerRankRise:setVisible(false)
	else
		self._winnerRankRise:setVisible(true)
		self._winnerRankRise:getChildByName("text"):setString(Strings:get("RANK_UI13", {
			num = raise
		}))
	end
end

function ArenaVictoryMediator:onClickReplay(sender, eventType, oppoRecord)
	if self._replayType == ArenaBattlePlayType.kNormal then
		self._arenaSystem:requestReportDetail(self._data.resultData.reportId)
	elseif self._replayType == ArenaBattlePlayType.kReport then
		self._arenaSystem:requestReportDetail(self._data.resultData:getId())
	end
end

function ArenaVictoryMediator:onClickExit(sender, eventType, oppoRecord)
	local data = nil

	if self._replayType == ArenaBattlePlayType.kNormal then
		data = {
			viewName = "ArenaView"
		}
	elseif self._replayType == ArenaBattlePlayType.kReport then
		data = {
			viewName = self._arenaSystem:getShowViewAfterBattle()
		}
	end

	BattleLoader:popBattleView(self, data)
end

function ArenaVictoryMediator:onClickShow()
	self:dispatch(ShowTipEvent({
		duration = 0.2,
		tip = Strings:find("ARENAVIEW_NOTICE")
	}))
end

function ArenaVictoryMediator:setupClickEnvs()
	if GameConfigs.closeGuide then
		return
	end

	local sequence = cc.Sequence:create(cc.CallFunc:create(function ()
		local storyDirector = self:getInjector():getInstance(story.StoryDirector)
		local button_exit = self:getView():getChildByFullName("bg.button_panel.button_exit")

		storyDirector:setClickEnv("ArenaVictoryMediator.button_exit", button_exit, function (sender, eventType)
			self:onClickExit(sender, eventType)
		end)
		storyDirector:notifyWaiting("enter_ArenaVictoryMediator")
	end))

	self:getView():runAction(sequence)
end

function ArenaVictoryMediator:onTouchMaskLayer()
end
