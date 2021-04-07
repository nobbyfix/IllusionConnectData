RTPKMainMediator = class("RTPKMainMediator", DmAreaViewMediator, _M)

RTPKMainMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
RTPKMainMediator:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
RTPKMainMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
RTPKMainMediator:has("_rtpkSystem", {
	is = "r"
}):injectWith("RTPKSystem")

local kBtnHandlers = {
	["bg_bottom.btn_report"] = {
		clickAudio = "Se_Click_Open_2",
		func = "onClickReport"
	},
	["bg_bottom.btn_rank"] = {
		clickAudio = "Se_Click_Open_2",
		func = "onClickRank"
	},
	["bg_bottom.btn_reward"] = {
		clickAudio = "Se_Click_Open_2",
		func = "onClickReward"
	},
	["bg_bottom.btn_team"] = {
		clickAudio = "Se_Click_Open_2",
		func = "onClickTeam"
	},
	btn_rule = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickRule"
	},
	["seasonRule.btn_rule"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSeasonRule"
	}
}

function RTPKMainMediator:initialize()
	super.initialize(self)
end

function RTPKMainMediator:dispose()
	if self._timer then
		self._timer:stop()

		self._timer = nil
	end

	super.dispose(self)
end

function RTPKMainMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._main = self:getView():getChildByName("main")
	self._seasonPanel = self._main:getChildByName("seasoninfo")
	self._rulePanel = self:getView():getChildByName("seasonRule")
	self._bottom = self:getView():getChildByName("bg_bottom")
	self._gradeRewardPoint = self._bottom:getChildByFullName("btn_reward.redPoint")
	self._matchBtn = self:bindWidget("main.btn_match", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onClickMatch, self)
		}
	})
	self._matchBtnRed = self._main:getChildByFullName("btn_match.redPoint")

	self._matchBtnRed:setVisible(false)

	local btns = {
		"btn_report",
		"btn_rank",
		"btn_reward",
		"btn_team"
	}

	for i = 1, 4 do
		local lineGradiantVec2 = {
			{
				ratio = 0.3,
				color = cc.c4b(255, 255, 255, 255)
			},
			{
				ratio = 0.7,
				color = cc.c4b(167, 186, 255, 255)
			}
		}
		local lineGradiantDir2 = {
			x = 0,
			y = -1
		}
		local bottomPanel = self:getView():getChildByName("bg_bottom")
		local btn = bottomPanel:getChildByFullName(btns[i])

		btn:getChildByFullName("text"):enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, lineGradiantDir2))
	end
end

function RTPKMainMediator:enterWithData(data)
	self._rtpk = self._rtpkSystem:getRtpk()

	self:setupTopInfoWidget()
	self:mapEventListeners()
	self:setupView()
	self:showNewSeasonView()
	self:refreshRedPoint()
end

function RTPKMainMediator:resumeWithData(data)
	super.resumeWithData(self, data)

	if self._needShowTips then
		self:matchFailTips()
	end
end

function RTPKMainMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_RTPK_STARTMATCH, self, self.onStartMatchCallback)
	self:mapEventListener(self:getEventDispatcher(), EVT_RTPK_UPDATEINFO, self, self.onUpdateRTPKInfo)
	self:mapEventListener(self:getEventDispatcher(), EVT_REFRESH_GRADE_REWARD_DONE, self, self.onGetRewardCallback)
end

function RTPKMainMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")

	topInfoNode:setLocalZOrder(999)

	local infoConfig = {
		CurrencyIdKind.kDiamond,
		CurrencyIdKind.kPower,
		CurrencyIdKind.kCrystal,
		CurrencyIdKind.kGold
	}
	local config = {
		style = 1,
		currencyInfo = infoConfig,
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		title = Strings:get("RTPK_SystemName")
	}
	self._topInfoWidget = self:autoManageObject(self:getInjector():injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function RTPKMainMediator:showNewSeasonView()
	if self._rtpkSystem:checkIsNewSeason() then
		self._rtpkSystem:setNewSeasonKeyValue()

		local view = self:getInjector():getInstance("RTPKNewSeasonTipsView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {}, {}))
	end
end

function RTPKMainMediator:setupView()
	self:setBackGround()
	self:setSeasonInfo()
	self:startTimer()
	self:refreshMatchStatus()
	self:setSeasonRule()
	self:addAnim()
end

function RTPKMainMediator:refreshView()
	self:refreshMatchStatus()
	self:refreshRedPoint()
end

function RTPKMainMediator:addAnim()
	local animNode = self._main:getChildByName("Node_anim")
	local anim = cc.MovieClip:create("main_tiantizhujiemian")

	anim:addTo(animNode):posite(32, 35)

	local anim = cc.MovieClip:create("effect_tiantiduanweieff")

	anim:addTo(self._bottom, 100):posite(580, 355)
end

function RTPKMainMediator:setBackGround()
	local defaultBgId = ConfigReader:getDataByNameIdAndKey("ConfigValue", "RTPK_DefaultShowBG", "content")
	local bgId = self._rtpk:getSeasonBackground() or defaultBgId
	local bgConfig = ConfigReader:getRecordById("BackGroundPicture", bgId)

	if bgConfig.Picture and bgConfig.Picture ~= "" then
		local background = cc.Sprite:create("asset/scene/" .. bgConfig.Picture .. ".jpg")

		background:setAnchorPoint(cc.p(0.5, 0.5))
		background:setPosition(cc.p(568, 320))
		background:addTo(self._main, -1)

		self._bgSize = background:getContentSize()
	else
		self._bgSize = self._main:getContentSize()
	end

	if bgConfig.Flash1 and bgConfig.Flash1 ~= "" then
		local mc = cc.MovieClip:create(bgConfig.Flash1)

		mc:setPosition(cc.p(568, 320))
		mc:addTo(self._main, -1)
	end

	if bgConfig.Flash2 and bgConfig.Flash2 ~= "" then
		local mc = cc.MovieClip:create(bgConfig.Flash2)

		mc:setPosition(cc.p(568, 320))
		mc:addTo(self._main, -1)
	end

	local heroNode = self._main:getChildByName("heroNode")
	local defaultHeroId = ConfigReader:getDataByNameIdAndKey("ConfigValue", "RTPK_DefaultShowHero", "content")
	local heroId = self._rtpk:getSeasonShowModel() or defaultHeroId
	local modelId = IconFactory:getRoleModelByKey("HeroBase", heroId)
	local role = IconFactory:createRoleIconSprite({
		useAnim = true,
		iconType = "Bust4",
		id = modelId
	})

	role:addTo(heroNode):posite(120, -80):setScale(0.75)
end

function RTPKMainMediator:setTextEffect(text)
	local lineGradiantVec2 = {
		{
			ratio = 0.2,
			color = cc.c4b(255, 255, 255, 255)
		},
		{
			ratio = 0.8,
			color = cc.c4b(157, 181, 241, 255)
		}
	}

	text:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
		x = 0,
		y = -1
	}))
	text:enableOutline(cc.c4b(103, 89, 150, 255), 2)
end

function RTPKMainMediator:setSeasonInfo()
	local seasonConfig = self._rtpk:getSeasonConfig()
	local indexText = self._seasonPanel:getChildByName("Text_index")
	local indexText2 = self._seasonPanel:getChildByName("Text_index_2")

	indexText:setString(Strings:get("RTPK_Main_Season", {
		index = seasonConfig.SeasonOrder
	}))
	indexText2:setString(Strings:get("RTPK_Main_Season", {
		index = seasonConfig.SeasonOrder
	}))

	local nameText = self._seasonPanel:getChildByName("Text_name")
	local nameText2 = self._seasonPanel:getChildByName("Text_name_2")

	nameText:setString(Strings:get(seasonConfig.Name))
	nameText2:setString(Strings:get(seasonConfig.Name))
	self:setTextEffect(nameText)
	self:setTextEffect(self._seasonPanel:getChildByName("Text_14"))

	local openText = self._main:getChildByName("Text_opentime")
	local param = self._rtpkSystem:formatMatchTimeParam()

	openText:setString(Strings:get("RTPK_OpenTime", param))

	local gradeData = self._rtpk:getCurGrade()
	self.seasonDataForRule = {
		topic = Strings:get(seasonConfig.Name),
		starttime = TimeUtil:localDate("%Y.%m.%d %H:%M", self._rtpk:getStartTime()),
		endtime = TimeUtil:localDate("%Y.%m.%d %H:%M", self._rtpk:getEndTime()),
		level = Strings:get(gradeData.Name),
		time = TimeUtil:localDate("%H:%M", self._rtpk:getEndTime())
	}
end

function RTPKMainMediator:startTimer()
	local timeText = self._seasonPanel:getChildByName("Text_time")

	local function update()
		local curTime = self._gameServerAgent:remoteTimestamp()
		local status = self._rtpk:getCurStatus()

		if status == RTPKSeasonStatus.kShow then
			timeText:setString(Strings:get("RTPK_Tip_SeasonClose"))

			local remainTime = math.max(self._rtpk:getCloseTime() - curTime, 0)

			if remainTime == 0 then
				self._rtpkSystem:requestRTPKInfo(nil, false)
			end
		elseif status == RTPKSeasonStatus.kRest then
			timeText:setString(Strings:get("RTPK_Main_BtnTip"))

			local remainTime = math.max(self._rtpkSystem:getSeasonNextCD() - curTime, 0)

			if remainTime == 0 then
				self._rtpkSystem:requestRTPKInfo(nil, false)
			end
		elseif status == RTPKSeasonStatus.kCanMatch or status == RTPKSeasonStatus.kNotCanMatch then
			local str = ""
			local remainTime = math.max(self._rtpk:getEndTime() - curTime, 0)
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

			timeText:setString(Strings:get("RTPK_Season_Countdown", {
				time = str
			}))

			if remainTime == 0 then
				self._rtpkSystem:requestRTPKInfo(nil, false)
			end

			self:refreshMatchStatus()
		end
	end

	self._timer = LuaScheduler:getInstance():schedule(update, 1, false)

	update()
end

function RTPKMainMediator:refreshMatchStatus()
	local gradeData = self._rtpk:getCurGrade()
	local isMaxGrade = self._rtpk:isMaxGrade()
	local scoreText = self._main:getChildByName("Text_score")

	if isMaxGrade then
		scoreText:setString(Strings:get("RTPK_ScoreShow02", {
			cur = self._rtpk:getCurScore()
		}))
	else
		scoreText:setString(Strings:get("RTPK_ScoreShow01", {
			cur = self._rtpk:getCurScore(),
			total = gradeData.ScoreHigh
		}))
	end

	local iconImg = self._main:getChildByName("Image_icon")
	local icon = iconImg.icon
	local needChangeIcon = false

	if not icon then
		needChangeIcon = true
	elseif icon.gradeId ~= gradeData.Id then
		needChangeIcon = true
	end

	if needChangeIcon then
		iconImg:removeAllChildren()

		local icon = IconFactory:createRTPKGradeIcon(gradeData.Id, true)

		icon:addTo(iconImg):center(iconImg:getContentSize()):offset(7, 22)

		iconImg.icon = icon
	end

	local timesText = self._main:getChildByName("Text_matchtimes")

	timesText:setVisible(false)
	timesText:setString(Strings:get("RTPK_MatchTimes", {
		cur = self._rtpk:getLeftCount(),
		total = self._rtpkSystem:getMaxMatchTimes()
	}))

	local status = self._rtpk:getCurStatus()
	local btnStr = ""

	if status == RTPKSeasonStatus.kShow or status == RTPKSeasonStatus.kRest then
		btnStr = Strings:get("RTPK_Btn_SeasonClose")
	elseif self._rtpkSystem:isInMatchTime() then
		btnStr = Strings:get("RTPK_Btn_ReadyToMatch")
	else
		btnStr = Strings:get("RTPK_Btn_Unabletoplay")
	end

	self._matchBtn:setButtonName(btnStr)
end

function RTPKMainMediator:setSeasonRule()
	local ruleData = self._rtpkSystem:getSeasonBuffData()
	local listView = self._rulePanel:getChildByName("ListView")

	listView:setScrollBarEnabled(false)

	local ruleCell = self._rulePanel:getChildByName("rule")

	ruleCell:setVisible(false)

	local height = 0

	local function setRuleCell(data)
		local cell = ruleCell:clone()

		cell:setVisible(true)

		local nameText = cell:getChildByName("Text_name")

		nameText:setString(data.name)

		local descText = cell:getChildByName("Text_desc")

		descText:setString(data.shortDesc)
		descText:setVisible(false)

		local desc = data.shortDesc
		local data = string.split(desc, "<font")

		if #data <= 1 then
			local rtStr = "<outline color='#000000' size = '1'><font face='${fontName}'  size='18' color='#FFFFFF'>${text}</font></outline>"
			local templateStr = TextTemplate:new(rtStr)
			desc = templateStr:stringify({
				fontName = TTF_FONT_FZYH_M,
				text = desc
			})
		end

		local label = ccui.RichText:createWithXML(desc, {})

		label:setAnchorPoint(cc.p(0, 0.5))
		label:renderContent()

		if nameText:getContentSize().width > 79 then
			label:addTo(cell):posite(nameText:getPositionX() + nameText:getContentSize().width + 10, nameText:getPositionY())
		else
			label:addTo(cell):posite(descText:getPosition())
		end

		height = height + cell:getContentSize().height

		listView:pushBackCustomItem(cell)
	end

	local hasBuff = false

	if ruleData.seasonSkill then
		setRuleCell(ruleData.seasonSkill)

		local skillConfig = ConfigReader:getRecordById("Skill", ruleData.seasonSkill.buffId)
		self.seasonDataForRule.buff = Strings:get(skillConfig.Desc, {
			fontSize = 18,
			fontName = TTF_FONT_FZYH_M
		})
		hasBuff = true
	else
		self.seasonDataForRule.buff = Strings:get("RTPK_SeasonReset_NoBuffTip")
	end

	if ruleData.levelLimit then
		setRuleCell(ruleData.levelLimit)

		hasBuff = true
	end

	if ruleData.hero then
		for i, v in pairs(ruleData.hero) do
			setRuleCell(v)
		end

		hasBuff = true
	end

	if ruleData.awakenSkill then
		setRuleCell(ruleData.awakenSkill)

		hasBuff = true
	end

	if ruleData.starSkill then
		setRuleCell(ruleData.starSkill)

		hasBuff = true
	end

	local size = listView:getContentSize()

	listView:setContentSize(cc.size(size.width, height))

	local tipsText = self._rulePanel:getChildByName("Text_tips")
	local ruleBtn = self._rulePanel:getChildByName("btn_rule")

	if hasBuff then
		tipsText:setVisible(false)
		ruleBtn:setVisible(true)
	else
		tipsText:setVisible(true)
		ruleBtn:setVisible(false)
	end
end

function RTPKMainMediator:onClickBack()
	self:dismiss()
end

function RTPKMainMediator:onClickReport()
	local status = self._rtpk:getCurStatus()

	if status == RTPKSeasonStatus.kRest then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("RTPK_Tip_Btn_SeasonClose")
		}))

		return
	end

	self._rtpkSystem:requestBattleReportList(function ()
		local view = self:getInjector():getInstance("RTPKReportView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil))
	end)
end

function RTPKMainMediator:onClickShop()
	self._shopSystem:tryEnter({
		shopId = "Shop_Normal",
		rightTabIndex = 4
	})
end

function RTPKMainMediator:onClickRank()
	local status = self._rtpk:getCurStatus()

	if status == RTPKSeasonStatus.kRest then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("RTPK_Tip_Btn_SeasonClose")
		}))

		return
	end

	local view = self:getInjector():getInstance("RTPKRankView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {}, nil))
end

function RTPKMainMediator:onClickReward()
	local status = self._rtpk:getCurStatus()

	if status == RTPKSeasonStatus.kRest then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("RTPK_Tip_Btn_SeasonClose")
		}))

		return
	end

	self._rtpkSystem:enterRewardView()
end

function RTPKMainMediator:onClickTeam()
	local status = self._rtpk:getCurStatus()

	if status == RTPKSeasonStatus.kRest or status == RTPKSeasonStatus.kShow then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("RTPK_Tip_BtnTeam")
		}))

		return
	end

	local view = self:getInjector():getInstance("RTPKTeamView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		stageType = StageTeamType.RTPK,
		outself = self
	}))
end

function RTPKMainMediator:onClickRule()
	local Rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "RTPK_RuleTranslate", "content")
	local view = self:getInjector():getInstance("ExplorePointRule")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		rule = Rule,
		ruleReplaceInfo = self.seasonDataForRule
	}))
end

function RTPKMainMediator:onClickMatch()
	local status = self._rtpk:getCurStatus()

	if status == RTPKSeasonStatus.kShow or status == RTPKSeasonStatus.kRest then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("RTPK_Tip_BtnStartMatch")
		}))

		return
	end

	if self._rtpkSystem:isInMatchTime() then
		if self._rtpk:getLeftCount() > 0 then
			self._rtpkSystem:requestStartMatch()
		else
			self:dispatch(ShowTipEvent({
				tip = Strings:get("RTPK_Tip_NoMoreTimes")
			}))
		end
	else
		local param = self._rtpkSystem:formatMatchTimeParam()

		self:dispatch(ShowTipEvent({
			tip = Strings:get("RTPK_Tip_OpenTime", param)
		}))
	end
end

function RTPKMainMediator:onClickSeasonRule()
	local view = self:getInjector():getInstance("RTPKBuffDetailView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {}))
end

function RTPKMainMediator:onStartMatchCallback(event)
	local view = self:getInjector():getInstance("RTPKMatchView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		delegate = self
	}))
end

function RTPKMainMediator:onUpdateRTPKInfo()
	self:refreshView()
end

function RTPKMainMediator:onGetRewardCallback()
	self:refreshRedPoint()
end

function RTPKMainMediator:refreshRedPoint()
	self._gradeRewardPoint:setVisible(self._rtpkSystem:checkGradeRewardRedpoint())
	self._matchBtnRed:setVisible(false)
end

function RTPKMainMediator:matchFailTips()
	self._needShowTips = false
	local data = {
		title = Strings:get("RTPK_PopUp_CancelMatch_Title"),
		title1 = Strings:get("UITitle_EN_Tishi"),
		content = Strings:get("RTPK_PopUp_CancelMatch_Desc"),
		sureBtn = {
			text1 = "RTPK_PopUp_CancelMatch_Btn"
		}
	}
	local view = self:getInjector():getInstance("AlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end
