CooperateBossMainMediator = class("CooperateBossMainMediator", DmAreaViewMediator)

CooperateBossMainMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
CooperateBossMainMediator:has("_cooperateBossSystem", {
	is = "r"
}):injectWith("CooperateBossSystem")

local kBtnHandlers = {
	["main.infoBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickInfoBtn"
	},
	["main.fightBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickFightBtnBtn"
	},
	["main.buyTimesBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onBuyTimesClick"
	}
}
local SHOW_HERO_ANIM = true
local PLAYING_BOSS_STPRY = false
local EVT_COOPERATE_BOSS_SELF_REFRESH = "EVT_COOPERATE_BOSS_SELF_REFRESH"

function CooperateBossMainMediator:initialize()
	super.initialize(self)
end

function CooperateBossMainMediator:dispose()
	self:getView():stopAllActions()

	if self._timer then
		self._timer:stop()

		self._timer = nil
	end

	super.dispose(self)
end

function CooperateBossMainMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListeners()
end

function CooperateBossMainMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_COOPERATE_BOSS_BUYTIME, self, self.refreshBuyTimes)
	self:mapEventListener(self:getEventDispatcher(), EVT_COOPERATE_BOSS_ESCAPED, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_COOPERATE_BOSS_NEWONE, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_COOPERATE_BOSS_AGREE, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_COOPERATE_BOSS_DEAD, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_COOPERATE_BOSS_INVITE, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_COOPERATE_REFRESH_INVITELIST, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_COOPERATE_BOSS_BACK_MAIN, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_COOPERATE_BOSS_SELF_REFRESH, self, self.setupView)
end

function CooperateBossMainMediator:enterWithData(data)
	self:initView()
	self:initAnim()
	self:setupRule()
	self:initData(data)
	self:setupView()
end

function CooperateBossMainMediator:resumeWithData()
end

function CooperateBossMainMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("main.topinfo_node")
	local config = {
		style = 1,
		currencyInfo = {
			CurrencyIdKind.kDiamond,
			CurrencyIdKind.kPower,
			CurrencyIdKind.kCrystal,
			CurrencyIdKind.kGold
		},
		title = Strings:get("CooperateBoss_SystemName"),
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		}
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function CooperateBossMainMediator:initView()
	self:setupTopInfoWidget()

	self._main = self:getView():getChildByFullName("main")
	self._bossList = self._main:getChildByFullName("bossList")
	self._ruleList = self._main:getChildByFullName("battleInfo.ruleList")
	self._noRecordPanel = self._main:getChildByFullName("battleRecord.Bg.noRecord")
	self._recordList = self._main:getChildByFullName("battleRecord.list")
	self._inviteCellClone = self:getView():getChildByFullName("inviteCellClone")
	self._battleRecordCellClone = self:getView():getChildByFullName("battleRecordCellClone")
	self._bossRole = self._main:getChildByFullName("bg.role")
	self._timeText = self._main:getChildByFullName("timeTile.time")
	self._fightBtn = self._main:getChildByFullName("fightBtn")
	self._talk = self._main:getChildByFullName("tablk")
	self._leaveTimesPanel = self._main:getChildByFullName("leaveTimes")
	self._leaveTimesLab = self._main:getChildByFullName("leaveTimes.text")
	self._buyTimesBtn = self._main:getChildByFullName("buyTimesBtn")
end

function CooperateBossMainMediator:initData(data)
	self._data = data
	self._cooperateBossData = self._cooperateBossSystem:getCooperateBoss()

	self:checkStory()
end

function CooperateBossMainMediator:setupView()
	self:setupBossMapList()
	self:setupRewardBtnState()
	self:setupBossModeShow(self._data.mineBoss)
	self:setupBattleRecord()
	self:setupTimeShow()
end

function CooperateBossMainMediator:setupRule()
	self._ruleList:removeAllChildren()
	self._ruleList:setScrollBarEnabled(false)

	local ruleKeys = ConfigReader:getDataByNameIdAndKey("ConfigValue", "CooperateBoss_RuleTitle", "content")

	for i = 1, #ruleKeys do
		local ruleStr = Strings:get(ruleKeys[i], {
			fontName = TTF_FONT_FZYH_R
		})

		if ruleStr and ruleStr ~= "" then
			local label = ccui.RichText:createWithXML(ruleStr, {})

			label:renderContent(450, 0)
			label:setAnchorPoint(cc.p(0, 0))
			label:setVerticalSpace(10)
			self._ruleList:pushBackCustomItem(label)
		end
	end
end

function CooperateBossMainMediator:setupBossMapList()
	local maps = self._data.invitedBossIdMap

	self._bossList:removeAllChildren()
	self._bossList:setScrollBarEnabled(false)

	if maps and #maps == 0 then
		local boss = self._inviteCellClone:clone()

		self._bossList:pushBackCustomItem(boss)

		local name = boss:getChildByFullName("invitePanel.nameDi.name")
		local invite = boss:getChildByFullName("invitePanel.inviteDi.invite")
		local level = boss:getChildByFullName("invitePanel.level")

		name:setVisible(false)
		invite:setVisible(false)
		level:setVisible(false)

		local invitePanel = boss:getChildByFullName("invitePanel")

		invitePanel:addTouchEventListener(function (sender, eventType)
			if eventType == ccui.TouchEventType.ended then
				self:dispatch(ShowTipEvent({
					duration = 0.2,
					tip = Strings:get("CooperateBoss_Entry_UI09")
				}))
			end
		end)
	else
		for i = 1, #maps do
			local info = maps[i]
			local boss = self._inviteCellClone:clone()

			self._bossList:pushBackCustomItem(boss)

			local invitePanel = boss:getChildByFullName("invitePanel")
			local bossIcon = boss:getChildByFullName("invitePanel.role")
			local bossNameText = boss:getChildByFullName("invitePanel.nameDi.name")
			local bossLvText = boss:getChildByFullName("invitePanel.level.text")
			local playerNameText = boss:getChildByFullName("invitePanel.inviteDi.invite")

			playerNameText:setString(info.name)
			bossNameText:setString(self._cooperateBossData:getRoleModelName(info.confId))
			bossLvText:setString("Lv." .. info.lv)
			boss:getChildByFullName("invitePanel.info"):setVisible(false)

			local heroSprite = IconFactory:createRoleIconSprite({
				stencil = 1,
				iconType = "Bust13",
				id = self._cooperateBossData:getRoleModelId(info.confId),
				size = cc.size(145, 106)
			})

			heroSprite:addTo(bossIcon):center(bossIcon:getContentSize())
			invitePanel:addTouchEventListener(function (sender, eventType)
				if eventType == ccui.TouchEventType.ended then
					local data = {
						confId = info.confId,
						bossCreateTime = info.bossCreateTime,
						bossLevel = info.lv,
						name = info.name,
						bossId = info.bossId
					}

					self._cooperateBossSystem:enterCooperateBossInvite(data)
				end
			end)
		end
	end
end

function CooperateBossMainMediator:setupBattleRecord()
	local records = self._data.battleRecordLst

	self._recordList:removeAllChildren()
	self._recordList:setScrollBarEnabled(false)

	if records == nil or #records == 0 then
		self._noRecordPanel:setVisible(true)
	else
		table.sort(records, function (a, b)
			local tiemA = a.finishBattleTime and a.finishBattleTime or a.bossCreateTime
			local tiemB = b.finishBattleTime and b.finishBattleTime or b.bossCreateTime

			return tiemB < tiemA
		end)
		self._noRecordPanel:setVisible(false)

		for i = 1, #records do
			local record = self._battleRecordCellClone:clone()
			local bossNameLab = record:getChildByFullName("name")
			local stateLab = record:getChildByFullName("state")
			local detailBtn = record:getChildByFullName("detail")
			local rewardPanel = record:getChildByFullName("reward")
			local rewardList = record:getChildByFullName("rewardList")
			local di = record:getChildByFullName("di")
			local config = ConfigReader:getRecordById("CooperateBossMain", records[i].confId)

			assert(config ~= nil, "Error configId : " .. records[i].confId)
			di:setVisible(i % 2 == 1)

			local nameKey = ConfigReader:getDataByNameIdAndKey("CooperateBossBattle", config.BossBattle, "Name")

			bossNameLab:setString(Strings:get(nameKey))

			if records[i].state == kCooperateBossEnemyState.kEscaped then
				stateLab:setString(Strings:get("CooperateBoss_BattleRecord_Status02"))
				stateLab:setColor(cc.c3b(255, 123, 123))
			elseif records[i].state == kCooperateBossEnemyState.kDead then
				stateLab:setString(Strings:get("CooperateBoss_BattleRecord_Status03"))
				stateLab:setColor(cc.c3b(173, 255, 113))
			else
				stateLab:setString(Strings:get("CooperateBoss_BattleRecord_Status01"))
				stateLab:setColor(cc.c3b(232, 236, 114))
			end

			local rewards = {}

			if records[i].battleRecord and records[i].battleRecord.lastKillRewards and #records[i].battleRecord.lastKillRewards > 0 then
				for j = 1, #records[i].battleRecord.lastKillRewards do
					local reward = records[i].battleRecord.lastKillRewards[j]
					reward.tagImg = "lastKillRewards"

					table.insert(rewards, reward)
				end
			end

			if records[i].battleRecord and records[i].battleRecord.roomOwnerRewards and #records[i].battleRecord.roomOwnerRewards > 0 then
				for j = 1, #records[i].battleRecord.roomOwnerRewards do
					local reward = records[i].battleRecord.roomOwnerRewards[j]
					reward.tagImg = "roomOwnerRewards"

					table.insert(rewards, reward)
				end
			end

			if records[i].battleRecord and records[i].battleRecord.assistRewards and #records[i].battleRecord.assistRewards > 0 then
				for j = 1, #records[i].battleRecord.assistRewards do
					local reward = records[i].battleRecord.assistRewards[j]
					reward.tagImg = "assistRewards"

					table.insert(rewards, reward)
				end
			end

			rewardPanel:removeAllChildren()
			rewardList:removeAllChildren()

			if #rewards <= 0 then
				if records[i].state ~= kCooperateBossEnemyState.kEscaped then
					local icon = cc.Sprite:createWithSpriteFrameName("gongdou_img_xx_wh.png")

					icon:setPosition(cc.p(-5, 0))
					rewardPanel:addChild(icon)
					rewardPanel:setContentSize(cc.size(icon:getContentSize().width + 20, icon:getContentSize().height))
					icon:setAnchorPoint(0, 0)
					rewardPanel:setPositionX(290)
				end
			else
				local dataList = self._cooperateBossData:getTokenRewardBossLst()
				local isDraw = false

				for k, v in pairs(dataList) do
					if v == records[i].bossId then
						isDraw = true
					end
				end

				if #rewards > 3 then
					rewardList:setVisible(true)
					rewardPanel:setVisible(false)

					for j = 1, #rewards do
						local reward = rewards[j]
						local icon = IconFactory:createRewardIcon(reward, {
							showAmount = true,
							isWidget = true,
							notShowQulity = false
						})

						icon:setPosition(cc.p((j - 1) * (icon:getContentSize().width + 10), 0))
						rewardList:pushBackCustomItem(icon)
						icon:setAnchorPoint(0, 0)
						rewardList:setScrollBarEnabled(false)
						rewardList:setContentSize(cc.size(icon:getContentSize().width * 3.5, icon:getContentSize().height + 14))
						IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), reward, {
							needDelay = true
						})

						local tagImgSrc = ""

						if reward.tagImg == "lastKillRewards" then
							tagImgSrc = "gongdou_img_xx_zs.png"
						elseif reward.tagImg == "roomOwnerRewards" then
							tagImgSrc = "gongdou_img_xx_fz.png"
						end

						if tagImgSrc ~= "" then
							local tagImg = cc.Sprite:createWithSpriteFrameName(tagImgSrc)

							icon:addChild(tagImg)
							tagImg:setScale(1.9)
							tagImg:setPositionY(icon:getContentSize().height - 20)
							tagImg:setPositionX(27)
						end

						if isDraw then
							local ylqImg = cc.Sprite:createWithSpriteFrameName("gongdou_txt_ylq.png")

							ylqImg:setScale(1.5)
							ylqImg:addTo(icon):center(icon:getContentSize())
						end
					end

					rewardList:setScale(0.4)
				else
					rewardList:setVisible(false)
					rewardPanel:setVisible(true)

					for j = 1, #rewards do
						local reward = rewards[j]
						local icon = IconFactory:createRewardIcon(reward, {
							showAmount = true,
							isWidget = true,
							notShowQulity = false
						})

						icon:setPosition(cc.p((j - 1) * (icon:getContentSize().width + 10), 0))
						rewardPanel:addChild(icon)
						rewardPanel:setContentSize(cc.size(icon:getContentSize().width * j + 20, icon:getContentSize().height))
						icon:setAnchorPoint(0, 0)
						IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), reward, {
							needDelay = true
						})

						local tagImgSrc = ""

						if reward.tagImg == "lastKillRewards" then
							tagImgSrc = "gongdou_img_xx_zs.png"
						elseif reward.tagImg == "roomOwnerRewards" then
							tagImgSrc = "gongdou_img_xx_fz.png"
						end

						if tagImgSrc ~= "" then
							local tagImg = cc.Sprite:createWithSpriteFrameName(tagImgSrc)

							icon:addChild(tagImg)
							tagImg:setScale(1.9)
							tagImg:setPositionY(icon:getContentSize().height - 15)
							tagImg:setPositionX(20)
						end

						if isDraw then
							local ylqImg = cc.Sprite:createWithSpriteFrameName("gongdou_txt_ylq.png")

							ylqImg:setScale(1.5)
							ylqImg:addTo(icon):center(icon:getContentSize())
						end
					end

					rewardPanel:setScale(0.4)
					rewardPanel:setPositionX(310 - #rewards * 20)
				end
			end

			detailBtn:setVisible(true)

			if records[i].state == kCooperateBossEnemyState.kEscaped then
				detailBtn:setVisible(false)
			end

			detailBtn:addTouchEventListener(function (sender, eventType)
				if eventType == ccui.TouchEventType.ended then
					self._cooperateBossSystem:enterCooperateBossInviteFriendView(records[i].bossId)
				end
			end)
			self._recordList:pushBackCustomItem(record)
		end
	end
end

function CooperateBossMainMediator:setupRewardBtnState()
	self._rewardBtn = self:bindWidget("main.rewardBtn", OneLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Cancle",
			func = bind1(self.onRewardBtnClick, self)
		}
	})
	local records = self._data.battleRecordLst

	self._rewardBtn:setGray(false)

	if records and #records == 0 then
		self._rewardBtn:setGray(true)
	else
		self:refreshRewardState()
	end

	self._rewardBtn:setButtonName(Strings:get("CooperateBoss_Receive"), "")
end

function CooperateBossMainMediator:setupBossModeShow(mineBoss)
	self._bossRole:removeAllChildren()

	local bossId = nil

	if SHOW_HERO_ANIM then
		self._bossRole:stopAllActions()

		local heroAnim = self._bossRole:getChildByName("HeroAnim")

		if not heroAnim then
			heroAnim = cc.MovieClip:create("renwu_yingling")

			heroAnim:addTo(self._bossRole)
			heroAnim:setName("HeroAnim")
			heroAnim:addCallbackAtFrame(25, function ()
				heroAnim:stop()
			end)
			heroAnim:gotoAndPlay(0)
			heroAnim:setPlaySpeed(0.7)
		end

		local iconNode = heroAnim:getChildByName("heroIcon")

		iconNode:removeAllChildren()

		local roleModel = nil

		if mineBoss and self._cooperateBossSystem:checkMineDefaultBossShow(mineBoss) then
			bossId = mineBoss.confId
			local bossConfig = ConfigReader:getRecordById("CooperateBossMain", mineBoss.confId)
			roleModel = bossConfig.RoleModel

			self._fightBtn:setVisible(true)
			self._talk:setVisible(false)
			self._leaveTimesPanel:setVisible(true)
			self._buyTimesBtn:setVisible(true)

			if self._cooperateBossSystem:redPointShow() then
				self._buyTimesBtn:setGray(false)
			else
				self._buyTimesBtn:setGray(true)
			end

			local curTimes = self._cooperateBossData:getBossFightTimes()
			local resetData = DataReader:getDataByNameIdAndKey("Reset", "CooperateBoss", "ResetSystem")

			self._leaveTimesLab:setString(Strings:get("CooperateBoss_Trigger_UI04", {
				cur = curTimes.value,
				total = resetData.max
			}))
		else
			bossId = ConfigReader:getDataByNameIdAndKey("ConfigValue", "CooperateBoss_MainBossShow", "content")
			roleModel = IconFactory:getRoleModelByKey("HeroBase", bossId)
			self._heroSystem = self._developSystem:getHeroSystem()
			local hero = self._heroSystem:getHeroById(bossId)

			if hero then
				roleModel = hero:getModel()
			end

			self._fightBtn:setVisible(false)
			self._talk:setVisible(true)
			self._buyTimesBtn:setVisible(false)
			self._leaveTimesPanel:setVisible(false)
		end

		local img, path, spineani, picInfo = IconFactory:createRoleIconSprite({
			useAnim = true,
			iconType = "Bust4",
			id = roleModel
		})

		img:addTo(iconNode)
		img:setPosition(cc.p(60, -63))

		return
	end

	if mineBoss and self._cooperateBossSystem:checkMineDefaultBossShow(mineBoss) then
		bossId = mineBoss.confId
		local bossConfig = ConfigReader:getRecordById("CooperateBossMain", mineBoss.confId)
		local roleModel = bossConfig.RoleModel
		local heroSprite, _, spineani, picInfo = IconFactory:createRoleIconSprite({
			useAnim = true,
			iconType = 6,
			id = roleModel
		})

		heroSprite:addTo(self._bossRole)
		heroSprite:setPosition(cc.p(70, -70))
		heroSprite:setTouchEnabled(false)
		self._fightBtn:setVisible(true)
		self._talk:setVisible(false)
		self._leaveTimesPanel:setVisible(true)
		self._buyTimesBtn:setVisible(true)

		if self._cooperateBossSystem:redPointShow() then
			self._buyTimesBtn:setGray(false)
		else
			self._buyTimesBtn:setGray(true)
		end

		local curTimes = self._cooperateBossData:getBossFightTimes()
		local resetData = DataReader:getDataByNameIdAndKey("Reset", "CooperateBoss", "ResetSystem")

		self._leaveTimesLab:setString(Strings:get("CooperateBoss_Trigger_UI04", {
			cur = curTimes.value,
			total = resetData.max
		}))
	else
		bossId = ConfigReader:getDataByNameIdAndKey("ConfigValue", "CooperateBoss_MainBossShow", "content")
		local roleModel = IconFactory:getRoleModelByKey("HeroBase", bossId)
		self._heroSystem = self._developSystem:getHeroSystem()
		local hero = self._heroSystem:getHeroById(bossId)

		if hero then
			roleModel = hero:getModel()
		end

		local heroSprite, _, spineani, picInfo = IconFactory:createRoleIconSprite({
			useAnim = true,
			iconType = 6,
			id = roleModel
		})

		heroSprite:addTo(self._bossRole)
		heroSprite:setPosition(cc.p(160, -70))
		heroSprite:setTouchEnabled(false)
		self._fightBtn:setVisible(false)
		self._talk:setVisible(true)
		self._buyTimesBtn:setVisible(false)
		self._leaveTimesPanel:setVisible(false)
	end
end

function CooperateBossMainMediator:setupTimeShow()
	if self._timer then
		self._timer:stop()

		self._timer = nil
	end

	local endTime = self._cooperateBossData:getEndTime()

	local function checkTimeFunc()
		if DisposableObject:isDisposed(self) or DisposableObject:isDisposed(self:getView()) then
			if self._timer then
				self._timer:stop()

				self._timer = nil
			end

			return
		end

		local curServerTime = TimeUtil:timeByRemoteDate()

		if endTime - curServerTime <= 0 then
			if self._timer then
				self._timer:stop()

				self._timer = nil
			end

			self._timeText:setString(Strings:get("CooperateBoss_Invite_UI23"))

			return
		end

		local remainTimeStr = TimeUtil:formatTime("${HH}:${MM}:${SS}", endTime - curServerTime)
		local str = ""
		local fmtStr = "${d}:${H}:${M}:${S}"
		local timeStr = TimeUtil:formatTime(fmtStr, endTime - curServerTime)
		local parts = string.split(timeStr, ":", nil, true)
		local timeTab = {
			day = tonumber(parts[1]),
			hour = tonumber(parts[2]),
			min = tonumber(parts[3]),
			sec = tonumber(parts[4])
		}

		if timeTab.day > 0 then
			str = timeTab.day .. Strings:get("TimeUtil_Day") .. timeTab.hour .. Strings:get("TimeUtil_Hour")
		elseif timeTab.hour > 0 then
			str = timeTab.hour .. Strings:get("TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min")
		else
			str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
		end

		self._timeText:setString(Strings:get("CooperateBoss_Countdown", {
			time = str
		}))
	end

	self._timer = LuaScheduler:getInstance():schedule(checkTimeFunc, 1, false)

	checkTimeFunc()
end

function CooperateBossMainMediator:checkStory()
	if PLAYING_BOSS_STPRY then
		return
	end

	local ownerRecords = {}

	for i = 1, #self._data.battleRecordLst do
		local tmp = self._data.battleRecordLst[i]

		if tmp.isOwner then
			table.insert(ownerRecords, tmp)
		end
	end

	if #ownerRecords > 0 then
		local triggerStory = nil

		if ownerRecords[1].state == kCooperateBossEnemyState.kDead then
			local config = ConfigReader:getDataByNameIdAndKey("CooperateBossMain", ownerRecords[1].confId, "Story")
			triggerStory = config[2]
		elseif ownerRecords[1].state == kCooperateBossEnemyState.kEscaped then
			local config = ConfigReader:getDataByNameIdAndKey("CooperateBossMain", ownerRecords[1].confId, "Story")
			triggerStory = config[1]
		elseif ownerRecords[2] then
			if ownerRecords[2].state == kCooperateBossEnemyState.kDead then
				local config = ConfigReader:getDataByNameIdAndKey("CooperateBossMain", ownerRecords[2].confId, "Story")
				triggerStory = config[2]
			elseif ownerRecords[2].state == kCooperateBossEnemyState.kEscaped then
				local config = ConfigReader:getDataByNameIdAndKey("CooperateBossMain", ownerRecords[2].confId, "Story")
				triggerStory = config[1]
			end
		end

		if triggerStory then
			PLAYING_BOSS_STPRY = true
			local storyDirector = self:getInjector():getInstance(story.StoryDirector)
			local guideAgent = storyDirector:getStoryAgent()

			guideAgent:setSkipCheckSave(false)
			guideAgent:trigger(triggerStory, nil, function ()
				PLAYING_BOSS_STPRY = false
			end)
		end
	end
end

function CooperateBossMainMediator:onRewardBtnClick(sender, eventType)
	local records = self._data.battleRecordLst

	if records and #records == 0 then
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = Strings:get("CooperateBoss_PopUp_UI05")
		}))
	else
		self._cooperateBossSystem:drawBattleRewards(function (respons)
			if respons.resCode == 0 then
				local rewards = respons.data.rewards

				if #rewards == 0 then
					self:dispatch(ShowTipEvent({
						duration = 0.2,
						tip = Strings:get("CooperateBoss_PopUp_UI05")
					}))
				else
					self:refreshRewardState()

					local view = self:getInjector():getInstance("getRewardView")

					self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
						maskOpacity = 0
					}, {
						rewards = rewards
					}))
				end
			end
		end)
	end
end

function CooperateBossMainMediator:initAnim()
	self._fightBtn:removeAllChildren()

	local mc = cc.MovieClip:create("xiangqingxunhuan_zhuxianguanka_UIjiaohudongxiao")

	mc:addCallbackAtFrame(30, function ()
		mc:stop()
	end)
	mc:stop()
	mc:addTo(self._fightBtn):center(self._fightBtn:getContentSize())
	mc:setScale(0.8)
	mc:setLocalZOrder(100)
end

function CooperateBossMainMediator:onClickBack(sender, eventType)
	self:dismissWithOptions({
		transition = ViewTransitionFactory:create(ViewTransitionType.kCommonAreaView)
	})
end

function CooperateBossMainMediator:onClickInfoBtn()
	local Rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "CooperateBoss_MainRule", "content")
	local view = self:getInjector():getInstance("ArenaRuleView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		rule = Rule,
		ruleReplaceInfo = {
			time = TimeUtil:getSystemResetDate()
		}
	}))
end

function CooperateBossMainMediator:onClickFightBtnBtn()
	local mineBoss = self._data.mineBoss

	self._cooperateBossSystem:enterCooperateBossInviteFriendView(mineBoss.bossId)
end

function CooperateBossMainMediator:onBuyTimesClick()
	local view = self:getInjector():getInstance("CooperateBossBuyTimeView")

	self:getEventDispatcher():dispatchEvent(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, nil))
end

function CooperateBossMainMediator:refreshBuyTimes()
	local curTimes = self._cooperateBossData:getBossFightTimes()
	local resetData = DataReader:getDataByNameIdAndKey("Reset", "CooperateBoss", "ResetSystem")

	self._leaveTimesLab:setString(Strings:get("CooperateBoss_Trigger_UI04", {
		cur = curTimes.value,
		total = resetData.max
	}))
end

function CooperateBossMainMediator:refreshView(data)
	local function callback(data)
		self:initData(data)
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_SELF_REFRESH))
	end

	self._cooperateBossSystem:requestCooperateBossMain(callback)
end

function CooperateBossMainMediator:refreshRewardState()
	self:setupBattleRecord()
	self._rewardBtn:setGray(not self._cooperateBossData:getRewardState())
end
