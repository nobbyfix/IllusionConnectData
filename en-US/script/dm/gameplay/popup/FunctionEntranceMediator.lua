FunctionEntranceMediator = class("FunctionEntranceMediator", DmAreaViewMediator, _M)

FunctionEntranceMediator:has("_arenaSystem", {
	is = "r"
}):injectWith("ArenaSystem")
FunctionEntranceMediator:has("_petRaceSystem", {
	is = "r"
}):injectWith("PetRaceSystem")
FunctionEntranceMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
FunctionEntranceMediator:has("_stagePracticeSystem", {
	is = "r"
}):injectWith("StagePracticeSystem")
FunctionEntranceMediator:has("_spStageSystem", {
	is = "r"
}):injectWith("SpStageSystem")
FunctionEntranceMediator:has("_exploreSystem", {
	is = "r"
}):injectWith("ExploreSystem")
FunctionEntranceMediator:has("_rtpkSystem", {
	is = "r"
}):injectWith("RTPKSystem")
FunctionEntranceMediator:has("_cooperateBossSystem", {
	is = "r"
}):injectWith("CooperateBossSystem")
FunctionEntranceMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")

local kFunctionData = {
	{
		cellNode = "arenaCell",
		switchKey = "fn_arena_normal",
		des = "BlockArena_ShowUI_Des"
	},
	{
		cellNode = "petRaceCell",
		switchKey = "fn_arena_pet_race",
		des = "BlockPet_ShowUI_Des"
	},
	{
		cellNode = "friendCell",
		switchKey = "fn_arena_friend",
		des = "BlockSP_ShowUI_Desc"
	},
	{
		cellNode = "cooperateBossCell",
		switchKey = "fn_arena_cooperate_boss",
		des = "BlockSP_ShowUI_Desc"
	},
	{
		cellNode = "rtpkCell",
		switchKey = "fn_arena_rtpk",
		des = "BlockSP_ShowUI_Desc"
	}
}

function FunctionEntranceMediator:initialize()
	super.initialize(self)
end

function FunctionEntranceMediator:dispose()
	self._viewClose = true

	if self._rtpkTimer then
		self._rtpkTimer:stop()

		self._rtpkTimer = nil
	end

	super.dispose(self)
end

function FunctionEntranceMediator:onRegister()
	super.onRegister(self)
end

function FunctionEntranceMediator:setupTopInfoWidget(data)
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")
	local config = {
		currencyInfo = data and data.currencyInfo or {},
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		title = data.title,
		style = data.style
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function FunctionEntranceMediator:enterWithData(data)
	self._data = data

	self:setupView(data)
	self:setupClickEnvs()

	if CommonUtils.GetSwitch("fn_arena_rtpk") then
		self._rtpkSystem:checkSeasonData(function ()
			if self._viewClose then
				return
			end

			self:refreshRTPKCell()
		end)
	end
end

function FunctionEntranceMediator:resumeWithData()
	self:refreshRed()
	self:refreshCooperateBoss()
	self:refreshRTPKCell()
end

function FunctionEntranceMediator:setupView(data)
	self:setupTopInfoWidget(data)
	self:initWidgetInfo(data)
end

function FunctionEntranceMediator:initWidgetInfo(data)
	self._main = self:getView():getChildByFullName("main")
	self._arenaPanel = self._main:getChildByFullName("arenaPanel")

	if not data then
		return
	end

	self._showPanel = self._arenaPanel
	local action = cc.CSLoader:createTimeline("asset/ui/Athletics.csb")

	action:clearFrameEventCallFunc()
	self._main:stopAllActions()
	self._main:runAction(action)

	local backgroundBG = self._main:getChildByFullName("backgroundBG")

	backgroundBG:setPosition(cc.p(568, 310))
	backgroundBG:runAction(cc.MoveTo:create(0.26666666666666666, cc.p(568, 320)))

	local animPanel = self._arenaPanel:getChildByFullName("animPanel")
	local jjAnim = cc.MovieClip:create("jingjirukou_jingjirukou")

	jjAnim:setPosition(cc.p(0, 0))
	animPanel:addChild(jjAnim)
	jjAnim:addCallbackAtFrame(15, function ()
		jjAnim:stop()
	end)

	for i, v in pairs(kFunctionData) do
		local cell = self._arenaPanel:getChildByFullName(v.cellNode)

		cell:setVisible(false)
	end

	action:gotoFrameAndPlay(0, 30, false)

	if CommonUtils.GetSwitch("fn_arena_normal") then
		self:createArenaAnim()
	end

	if CommonUtils.GetSwitch("fn_arena_pet_race") then
		self:createPetRaceAnim()
	end

	if CommonUtils.GetSwitch("fn_arena_friend") then
		self:createFriendAnim()
	end

	if CommonUtils.GetSwitch(kFunctionData[4].switchKey) and self._cooperateBossSystem:cooperateBossShow() then
		self:createCooperateBossAnim()
	end

	if CommonUtils.GetSwitch("fn_arena_rtpk") then
		self:createRTPKAnim()
	end

	local function onFrameEvent(frame)
		if frame == nil then
			return
		end

		local str = frame:getEvent()

		if str == "ArenaAnim" and CommonUtils.GetSwitch("fn_arena_normal") then
			self._arenaPanel:getChildByFullName("arenaCell.ShowAnim"):setVisible(true)
			self._arenaPanel:getChildByFullName("arenaCell.ShowAnim"):gotoAndPlay(0)
		end

		if str == "PetRaceAnim" and CommonUtils.GetSwitch("fn_arena_pet_race") then
			self._arenaPanel:getChildByFullName("petRaceCell.ShowAnim"):setVisible(true)
			self._arenaPanel:getChildByFullName("petRaceCell.ShowAnim"):gotoAndPlay(0)
		end

		if str == "FriendAnim" and CommonUtils.GetSwitch("fn_arena_friend") then
			self._arenaPanel:getChildByFullName("friendCell.ShowAnim"):setVisible(true)
			self._arenaPanel:getChildByFullName("friendCell.ShowAnim"):gotoAndPlay(0)
		end

		if str == "CooperateBossAnim" and CommonUtils.GetSwitch(kFunctionData[4].switchKey) and self._cooperateBossSystem:cooperateBossShow() then
			self._arenaPanel:getChildByFullName("cooperateBossCell.ShowAnim"):setVisible(true)
			self._arenaPanel:getChildByFullName("cooperateBossCell.ShowAnim"):gotoAndPlay(0)
		end

		if str == "RTPKAnim" and CommonUtils.GetSwitch("fn_arena_rtpk") then
			self._arenaPanel:getChildByFullName("rtpkCell.ShowAnim"):setVisible(true)
			self._arenaPanel:getChildByFullName("rtpkCell.ShowAnim"):gotoAndPlay(0)
		end

		if str == "redShow" then
			self:refreshRed()
		end
	end

	action:setFrameEventCallFunc(onFrameEvent)
	self:refreshView()
end

function FunctionEntranceMediator:createArenaAnim()
	local arenaCell = self._arenaPanel:getChildByFullName("arenaCell")

	arenaCell:setVisible(true)

	local descLabel = arenaCell:getChildByFullName("text"):clone()

	descLabel:setVisible(true)

	local redPoint = arenaCell:getChildByFullName("redPoint"):clone()

	arenaCell:removeAllChildren()

	local anim = cc.MovieClip:create("arenaCell_jingjirukou")

	anim:addTo(arenaCell)
	anim:addCallbackAtFrame(21, function ()
		anim:stop()
	end)
	anim:setPosition(cc.p(126, 120))
	anim:setName("ShowAnim")
	anim:setVisible(false)

	local descPanel = anim:getChildByFullName("descPanel")

	if descPanel then
		descPanel:removeAllChildren()
		descLabel:addTo(descPanel):posite(-70, 4)
		redPoint:addTo(descPanel):posite(80, 36)

		arenaCell.redPoint = redPoint
	end
end

function FunctionEntranceMediator:createPetRaceAnim()
	local petRaceCell = self._arenaPanel:getChildByFullName("petRaceCell")

	petRaceCell:setVisible(true)

	local descLabel = petRaceCell:getChildByFullName("text"):clone()

	descLabel:setVisible(true)

	local redPoint = petRaceCell:getChildByFullName("redPoint"):clone()

	petRaceCell:removeAllChildren()

	local anim = cc.MovieClip:create("petRaceCell_jingjirukou")

	anim:addTo(petRaceCell)
	anim:addCallbackAtFrame(21, function ()
		anim:stop()
	end)
	anim:setPosition(cc.p(140, 130))
	anim:setName("ShowAnim")
	anim:setVisible(false)

	local descPanel = anim:getChildByFullName("descPanel")

	if descPanel then
		descPanel:removeAllChildren()
		descLabel:addTo(descPanel):posite(-70, 4)
		redPoint:addTo(descPanel):posite(90, -20)

		petRaceCell.redPoint = redPoint
	end
end

function FunctionEntranceMediator:createFriendAnim()
	local petRaceCell = self._arenaPanel:getChildByFullName("friendCell")

	petRaceCell:setVisible(true)

	local descLabel = petRaceCell:getChildByFullName("text"):clone()

	descLabel:setVisible(true)

	local redPoint = petRaceCell:getChildByFullName("redPoint"):clone()

	petRaceCell:removeAllChildren()

	local anim = cc.MovieClip:create("friendCell_jingjirukou")

	anim:addTo(petRaceCell)
	anim:addCallbackAtFrame(26, function ()
		anim:stop()
	end)
	anim:setPosition(cc.p(146, 120))
	anim:setName("ShowAnim")
	anim:setVisible(false)

	local descPanel = anim:getChildByFullName("descPanel")

	if descPanel then
		descPanel:removeAllChildren()
		descLabel:addTo(descPanel):posite(-70, 0)
		redPoint:addTo(descPanel):posite(80, -20)

		petRaceCell.redPoint = redPoint
	end
end

function FunctionEntranceMediator:createCooperateBossAnim()
	local petRaceCell = self._arenaPanel:getChildByFullName("cooperateBossCell")

	petRaceCell:setVisible(true)

	local descLabel = petRaceCell:getChildByFullName("text"):clone()
	local stateLabel = petRaceCell:getChildByFullName("text1"):clone()
	local timeLabel = petRaceCell:getChildByFullName("text2"):clone()

	descLabel:setVisible(true)
	timeLabel:setVisible(true)
	stateLabel:setVisible(true)

	local redPoint = petRaceCell:getChildByFullName("redPoint"):clone()

	petRaceCell:removeAllChildren()

	local state = self._cooperateBossSystem:getcooperateBossState()
	local startTime = TimeUtil:localDate("%Y.%m.%d", self._cooperateBossSystem:getCooperateBoss():getHotTime())
	local endTime = TimeUtil:localDate("%Y.%m.%d", self._cooperateBossSystem:getCooperateBoss():getEndTime())

	if kCooperateBossState.kPreHot == state then
		stateLabel:setString(Strings:get("CooperateBoss_Entry_UI03"))
		stateLabel:setTextColor(cc.c3b(249, 91, 91))
		timeLabel:setString(Strings:get("CooperateBoss_Entry_UI02", {
			Start = startTime,
			End = endTime
		}))
	elseif kCooperateBossState.kStart == state then
		self._cooperateBossSystem:requestGetInviteInfo(function ()
			local mineBossShow = self._cooperateBossSystem:checkMineDefaultBossShow()

			stateLabel:setVisible(false)

			if mineBossShow then
				stateLabel:setVisible(true)
				stateLabel:setString(Strings:get("CooperateBoss_Entry_UI05"))
				stateLabel:setTextColor(cc.c3b(249, 217, 91))
				stateLabel:setColor(cc.c3b(255, 255, 255))
			end
		end)
		timeLabel:setString(Strings:get("CooperateBoss_Entry_UI04", {
			EndTime = endTime
		}))
	elseif kCooperateBossState.kEnd == state then
		stateLabel:setString(Strings:get("CooperateBoss_Entry_UI06"))
		stateLabel:setTextColor(cc.c3b(249, 91, 91))
		timeLabel:setString(Strings:get("CooperateBoss_Entry_UI04", {
			EndTime = endTime
		}))
	end

	local anim = cc.MovieClip:create("cooperateBossCell_jingjirukou")

	anim:addTo(petRaceCell)
	anim:addCallbackAtFrame(26, function ()
		anim:stop()
	end)
	anim:setPosition(cc.p(146, 120))
	anim:setName("ShowAnim")
	anim:setVisible(false)

	local descPanel = anim:getChildByFullName("descPanel")

	if descPanel then
		descPanel:removeAllChildren()
		descLabel:addTo(descPanel):posite(-70, 5)
		stateLabel:addTo(descPanel):posite(-13, 37)
		stateLabel:setName("stateLabel")
		timeLabel:addTo(descPanel):posite(0, -35)
		redPoint:addTo(descPanel):posite(80, -10)

		petRaceCell.redPoint = redPoint
	end

	self._cooperateBossStateLabel = stateLabel
end

function FunctionEntranceMediator:refreshCooperateBoss()
	local coopNode = self._arenaPanel:getChildByFullName("cooperateBossCell.ShowAnim")

	if self._cooperateBossStateLabel and not DisposableObject:isDisposed(self._cooperateBossStateLabel) then
		local stateLabel = self._cooperateBossStateLabel
		local state = self._cooperateBossSystem:getcooperateBossState()

		if kCooperateBossState.kPreHot == state then
			stateLabel:setString(Strings:get("CooperateBoss_Entry_UI03"))
			stateLabel:setTextColor(cc.c3b(249, 91, 91))
		elseif kCooperateBossState.kStart == state then
			self._cooperateBossSystem:requestGetInviteInfo(function ()
				local mineBossShow = self._cooperateBossSystem:checkMineDefaultBossShow()

				stateLabel:setVisible(false)

				if mineBossShow then
					stateLabel:setVisible(true)
					stateLabel:setString(Strings:get("CooperateBoss_Entry_UI05"))
					stateLabel:setTextColor(cc.c3b(249, 217, 91))
					stateLabel:setColor(cc.c3b(255, 255, 255))
				end
			end)
		elseif kCooperateBossState.kEnd == state then
			self._arenaPanel:getChildByFullName("cooperateBossCell.ShowAnim"):setVisible(false)
			self._arenaPanel:getChildByFullName("cooperateBossCell.ShowAnim"):stop()
		end
	end
end

function FunctionEntranceMediator:createRTPKAnim()
	local rtpkCell = self._arenaPanel:getChildByFullName("rtpkCell")

	rtpkCell:setVisible(true)

	local redPoint = rtpkCell:getChildByFullName("redPoint"):clone()

	redPoint:setVisible(false)

	local seasonLabel = rtpkCell:getChildByFullName("text1"):clone()
	local timeLabel = rtpkCell:getChildByFullName("text2"):clone()

	seasonLabel:setVisible(true)
	timeLabel:setVisible(true)
	rtpkCell:removeAllChildren()

	local anim = cc.MovieClip:create("rtpkCell_jingjirukou")

	anim:addTo(rtpkCell)
	anim:addCallbackAtFrame(21, function ()
		anim:stop()
	end)
	anim:setPosition(cc.p(126, 120))
	anim:setName("ShowAnim")
	anim:setVisible(false)

	local descPanel = anim:getChildByFullName("descPanel")

	if descPanel then
		seasonLabel:addTo(descPanel):posite(-30, 10)
		timeLabel:addTo(descPanel):posite(0, -12)
		redPoint:addTo(descPanel):posite(60, 15)

		rtpkCell.redPoint = redPoint
		rtpkCell.seasonLabel = seasonLabel
		rtpkCell.timeLabel = timeLabel
	end

	self:refreshRTPKCell()
end

function FunctionEntranceMediator:refreshRTPKCell()
	local rtpkCell = self._arenaPanel:getChildByFullName("rtpkCell")

	if not rtpkCell:isVisible() then
		return
	end

	local seasonLabel = rtpkCell.seasonLabel
	local timeLabel = rtpkCell.timeLabel
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlock, tips, unLockLevel = systemKeeper:isUnlock("RTPK")

	if not unlock then
		local config = ConfigReader:getRecordById("UnlockSystem", "RTPK")

		seasonLabel:setVisible(false)
		timeLabel:setString(Strings:get("RTPK_EntryUnlockTipShow", {
			uLevel = unLockLevel,
			serverDay = config.Condition.SERVER
		}))
	else
		self:refreshRTPKTimer()
	end
end

function FunctionEntranceMediator:refreshRTPKTimer()
	local rtpkCell = self._arenaPanel:getChildByFullName("rtpkCell")
	local seasonLabel = rtpkCell.seasonLabel
	local timeLabel = rtpkCell.timeLabel
	local rtpk = self._rtpkSystem:getRtpk()

	if self._rtpkTimer then
		self._rtpkTimer:stop()

		self._rtpkTimer = nil
	end

	local function update()
		local status = rtpk:getCurStatus()
		local curTime = self._gameServerAgent:remoteTimestamp()

		if status ~= RTPKSeasonStatus.kRest then
			local seasonConfig = rtpk:getSeasonConfig()

			seasonLabel:setVisible(true)
			seasonLabel:setString(Strings:get("RTPK_Main_Season", {
				index = seasonConfig.SeasonOrder
			}) .. Strings:get("RTPK_Main_SeasonText"))

			local startTime = TimeUtil:localDate("%Y.%m.%d", rtpk:getStartTime())
			local endTime = TimeUtil:localDate("%Y.%m.%d", rtpk:getEndTime())

			timeLabel:setString(startTime .. "-" .. endTime)

			local remainTime = math.max(rtpk:getCloseTime() - curTime, 0)

			if remainTime == 0 then
				self._rtpkSystem:requestRTPKInfo(function ()
					if self._viewClose then
						return
					end

					self:refreshRed()
				end, false)
			end
		else
			seasonLabel:setVisible(false)

			if self._rtpkSystem:getSeasonNextCD() > 0 then
				local str = ""
				local remainTime = math.max(self._rtpkSystem:getSeasonNextCD() - curTime, 0)
				local fmtStr = "${d}:${HH}:${M}:${SS}"
				local timeStr = TimeUtil:formatTime(fmtStr, remainTime)
				local parts = string.split(timeStr, ":", nil, true)
				local timeTab = {
					day = tonumber(parts[1]),
					hour = tonumber(parts[2]),
					min = tonumber(parts[3]),
					sec = tonumber(parts[4])
				}

				if timeTab.day > 0 then
					str = timeTab.day .. Strings:get("TimeUtil_Day") .. timeTab.hour .. Strings:get("RTPK_TimeUtil_Hour")
				elseif timeTab.hour > 0 then
					str = timeTab.hour .. Strings:get("RTPK_TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min")
				elseif timeTab.min > 0 then
					str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
				else
					str = timeTab.sec .. Strings:get("TimeUtil_Sec")
				end

				timeLabel:setString(Strings:get("RTPK_NewSeason_Countdown", {
					time = str
				}))

				if remainTime == 0 then
					self._rtpkSystem:requestRTPKInfo(function ()
						if self._viewClose then
							return
						end

						self:refreshRed()
					end, false)
				end
			else
				timeLabel:setString(Strings:get("Function_Not_Open"))
			end
		end
	end

	self._rtpkTimer = LuaScheduler:getInstance():schedule(update, 1, false)

	update()
end

function FunctionEntranceMediator:createRulePanel(parent, str)
	local image = ccui.ImageView:create("asset/common/sl_bg_msd.png")

	image:setAnchorPoint(cc.p(1, 0.5))
	image:addTo(parent):posite(132, -13)

	local label = cc.Label:createWithTTF(str, TTF_FONT_FZYH_M, 19)

	GameStyle:setCommonOutlineEffect(label, 255)
	label:setAnchorPoint(cc.p(1, 0.5))
	label:addTo(image):posite(242, 32)
	image:setOpacity(0)
	performWithDelay(self:getView(), function ()
		image:fadeIn({
			time = 0.2
		})
	end, 0.5)

	return image
end

function FunctionEntranceMediator:refreshView()
	for i = 1, #kFunctionData do
		local data = kFunctionData[i]
		local cellNode = data.cellNode
		local panel = self._showPanel:getChildByFullName(cellNode)

		if panel and CommonUtils.GetSwitch(data.switchKey) then
			panel:addClickEventListener(function ()
				self:clickPanel(i)
			end)
		end
	end
end

function FunctionEntranceMediator:clickPanel(index)
	if index == 1 then
		self:enterArenaView()
	elseif index == 2 then
		self:enterPetRaceView()
	elseif index == 3 then
		self:enterFriendView()
	elseif index == 4 then
		if self._cooperateBossSystem:getcooperateBossState() == kCooperateBossState.kStart then
			self:enterCooperateBoss()
		elseif self._cooperateBossSystem:getcooperateBossState() == kCooperateBossState.kPreHot then
			local startTime = TimeUtil:localDate("%m" .. Strings:get("Setting_UI_Month") .. "%d" .. Strings:get("Setting_UI_Day"), self._cooperateBossSystem:getCooperateBoss():getHotTime())

			self:dispatch(ShowTipEvent({
				tip = Strings:get("CooperateBoss_Entry_UI07", {
					StartTime = startTime
				})
			}))
		end
	elseif index == 5 then
		self:enterRTPKView()
	end
end

function FunctionEntranceMediator:refreshRed()
	local redFunc = {
		function ()
			return self._arenaSystem:checkAwardRed()
		end,
		function ()
			return self._petRaceSystem:redPointShow()
		end,
		function ()
			return self._stagePracticeSystem:checkAwardRed()
		end,
		function ()
			return self._cooperateBossSystem:redPointShow()
		end,
		function ()
			return self._rtpkSystem:checkShowRed()
		end
	}

	for i = 1, #kFunctionData do
		local data = kFunctionData[i]
		local cellNode = data.cellNode
		local panel = self._showPanel:getChildByFullName(cellNode)

		if panel then
			local redPoint1 = panel:getChildByFullName("redPoint")
			local redPoint2 = panel.redPoint
			local resShow = redFunc[i]()

			if redPoint1 then
				redPoint1:setVisible(resShow)
			end

			if redPoint2 then
				redPoint2:setVisible(resShow)
			end
		end
	end
end

function FunctionEntranceMediator:enterArenaView()
	local unlock, tip = self._arenaSystem:checkEnabled()

	if not unlock then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = tip
		}))
	else
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
		self:getArenaSystem():tryEnter()
	end
end

function FunctionEntranceMediator:enterPetRaceView()
	local unlock, tip = self._petRaceSystem:checkEnabled()

	if not unlock then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = tip
		}))
	else
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
		self:getPetRaceSystem():tryEnter()
	end
end

function FunctionEntranceMediator:enterFriendView()
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlock, tips = systemKeeper:isUnlock("Friend_PK")

	if unlock then
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

		local friendPvpSystem = self:getInjector():getInstance(FriendPvpSystem)

		friendPvpSystem:tryEnter()
	else
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = tips
		}))
	end
end

function FunctionEntranceMediator:enterRTPKView()
	self._rtpkSystem:tryEnter()
end

function FunctionEntranceMediator:enterCooperateBoss()
	self._cooperateBossSystem:enterCooperateBoss()
end

function FunctionEntranceMediator:onClickBack(sender, eventType)
	self._main:stopAllActions()
	self:dismissWithOptions({
		transition = ViewTransitionFactory:create(ViewTransitionType.kCommonAreaView)
	})
end

function FunctionEntranceMediator:setupClickEnvs()
	if GameConfigs.closeGuide then
		return
	end

	local sequence = cc.Sequence:create(cc.CallFunc:create(function ()
		local storyDirector = self:getInjector():getInstance(story.StoryDirector)

		for i = 1, #kFunctionData do
			local data = kFunctionData[i]
			local cellNode = data.cellNode
			local panel = self._showPanel:getChildByFullName(cellNode)

			if panel and CommonUtils.GetSwitch(data.switchKey) then
				storyDirector:setClickEnv("functionEntrance.node_" .. i, panel, function (sender, eventType)
					self:clickPanel(i)
				end)
			end
		end

		storyDirector:notifyWaiting("enter_FunctionEntrance_view")
	end))

	self:getView():runAction(sequence)
end

function FunctionEntranceMediator:didFinishResumeTransition()
	local winSize = cc.Director:getInstance():getWinSize()
	local transitionView = cc.LayerColor:create(cc.c4b(0, 0, 0, 255), winSize.width, winSize.height)

	transitionView:addTo(self:getView())
	transitionView:center(cc.size(1136, 640))
	transitionView:runAction(cc.Sequence:create(cc.FadeTo:create(0.1, 0), cc.CallFunc:create(function ()
		transitionView:removeFromParent(true)
	end)))
end
