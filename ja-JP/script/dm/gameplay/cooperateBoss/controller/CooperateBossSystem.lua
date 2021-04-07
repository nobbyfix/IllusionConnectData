CooperateBossSystem = class("CooperateBossSystem", legs.Actor)

CooperateBossSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
CooperateBossSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
CooperateBossSystem:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
CooperateBossSystem:has("_service", {
	is = "r"
}):injectWith("CooperateBossService")
CooperateBossSystem:has("_cooperateBoss", {
	is = "r"
}):injectWith("CooperateBoss")
CooperateBossSystem:has("_memberHelpTimeCDArr", {
	is = "rw"
})
CooperateBossSystem:has("_curBossCreateTime", {
	is = "rw"
})
CooperateBossSystem:has("_curBossRootView", {
	is = "rw"
})

kCooperateBossState = {
	kStart = "kStart",
	kHide = "kHide",
	kPreHot = "kPreHot",
	kEnd = "kEnd"
}
kCooperateBossFightTimeState = {
	kBuyTime = 2,
	kCanFight = 1,
	kNotFight = 3
}
kCooperateBossListen = {
	COOPERATE_BOSS_REFUSE = 1902,
	COOPERATE_BOSS_INVITE = 1900,
	COOPERATE_BOSS_BATTLE_OVER = 1904,
	COOPERATE_BOSS_LEAVEROOM = 1908,
	COOPERATE_BOSS_TRIGGER = 1909,
	COOPERATE_BOSS_ENTERROOM = 1907,
	COOPERATE_BOSS_DEAD = 1906,
	COOPERATE_BOSS_ESCAPED = 1905,
	COOPERATE_BOSS_AGREE = 1901,
	COOPERATE_BOSS_BEGIN = 1903
}
kCooperateBossEnemyState = {
	kLiving = "living",
	kInit = "init",
	kDead = "dead",
	kEscaped = "escaped"
}
kCooperateRoomState = {
	kOnFight = "onFight",
	kOnFinish = "onFinish",
	kOnReady = "onReady",
	kOnLeave = "onLeave"
}
EVT_DISPOSE_COOPERATE_FRIEND_VIEW = "EVT_DISPOSE_COOPERATE_FRIEND_VIEW"

function CooperateBossSystem:initialize()
	super.initialize(self)

	self._memberHelpTimeCDArr = {}

	self:createTimeSchedule()

	self._curBossCreateTime = 0
	self._curBossRootView = "homeView"
end

function CooperateBossSystem:dispose()
	self:shutSchedule()
	super.dispose(self)
end

function CooperateBossSystem:synchronize(data)
	self._cooperateBoss:synchronizeFromActivity(data)
end

function CooperateBossSystem:delete(data)
end

function CooperateBossSystem:resetMineBoss()
	self._cooperateBoss:resetMineBoss()
end

function CooperateBossSystem:redPointShow()
	if self:cooperateBossShow() then
		return self._cooperateBoss:getRewardState()
	end

	return false
end

function CooperateBossSystem:cooperateBossShow()
	if self._cooperateBoss:getId() ~= "0" and self:getcooperateBossState() ~= kCooperateBossState.kHide and self:getcooperateBossState() ~= kCooperateBossState.kEnd then
		return true
	end

	return false
end

function CooperateBossSystem:getcooperateBossState()
	local currentTime = TimeUtil:timeByRemoteDate()
	local hot = self._cooperateBoss:getHotTime()

	if currentTime < self._cooperateBoss:getStartTime() then
		return kCooperateBossState.kHide
	end

	if currentTime < self._cooperateBoss:getHotTime() then
		return kCooperateBossState.kPreHot
	end

	if currentTime < self._cooperateBoss:getEndTime() then
		return kCooperateBossState.kStart
	end

	return kCooperateBossState.kEnd
end

function CooperateBossSystem:checkMineDefaultBossShow(mineBoss)
	mineBoss = mineBoss or self._cooperateBoss:getMineBoss()

	if mineBoss == nil then
		return false
	end

	local mineBossConfig = ConfigReader:getRecordById("CooperateBossMain", mineBoss.confId)

	if mineBoss.bossId == nil or mineBossConfig == nil then
		return false
	end

	local endTime = mineBoss.bossCreateTime + mineBossConfig.Time
	local remainTime = endTime - self._gameServerAgent:remoteTimestamp()

	if remainTime <= 0 then
		return false
	end

	if mineBoss.state == kCooperateBossEnemyState.kDead or mineBoss.state == kCooperateBossEnemyState.kEscaped then
		return false
	end

	return true
end

function CooperateBossSystem:checkInviteBossShow()
	local inviteBoss = self._cooperateBoss:getInvitedBossIdMap()

	if inviteBoss and next(inviteBoss) then
		return true
	end

	return false
end

function CooperateBossSystem:initMemberTimer(rid, cd, idx)
	self._memberHelpTimeCDArr[rid] = {
		cd = cd,
		idx = idx
	}
end

function CooperateBossSystem:setMemberIdx(rid, idx)
	if self._memberHelpTimeCDArr[rid] == nil then
		return
	end

	self._memberHelpTimeCDArr[rid].idx = idx
end

function CooperateBossSystem:updateMemberTimer()
	for k, v in pairs(self._memberHelpTimeCDArr) do
		self._memberHelpTimeCDArr[k].cd = math.max(v.cd - 1, 0)
	end
end

function CooperateBossSystem:createTimeSchedule()
	local function update()
		self:updateMemberTimer()
	end

	if not self._timeSchel then
		self._timeSchel = LuaScheduler:getInstance():schedule(update, 1, true)
	end
end

function CooperateBossSystem:shutSchedule()
	if self._timeSchel then
		LuaScheduler:getInstance():unschedule(self._timeSchel)

		self._timeSchel = nil
	end
end

function CooperateBossSystem:getIsRecommend(heroId, mapId)
	local config = ConfigReader:getRecordById("CooperateBossMain", mapId)
	local recomand = config.ExcellentHero

	for i = 1, #recomand do
		local heroIds = recomand[i].Hero

		for j = 1, #heroIds do
			if heroId == heroIds[j] then
				return true
			end
		end
	end

	return false
end

function CooperateBossSystem:getHeroEffectNum(heroId, mapId)
	local config = ConfigReader:getRecordById("CooperateBossMain", mapId)
	local recomand = config.ExcellentHero

	for i = 1, #recomand do
		local heroIds = recomand[i].Hero
		local effectId = recomand[i].Effect

		for j = 1, #heroIds do
			if heroId == heroIds[j] then
				local num = ConfigReader:getRecordById("SkillAttrEffect", effectId).Value[1] * 100

				return num
			end
		end
	end

	local info = self._developSystem:getHeroSystem():getHeroById(heroId)
	local fiveStarEffectNum = 0

	if info:getStar() >= 5 then
		fiveStarEffectNum = ConfigReader:getRecordById("SkillAttrEffect", config.StarsAttrEffect).Value[1] * 100

		return fiveStarEffectNum and fiveStarEffectNum or 0
	end

	local awakenLevelEffectNum = 0

	if info:getAwakenStar() > 0 then
		awakenLevelEffectNum = ConfigReader:getRecordById("SkillAttrEffect", config.AwakenAttrEffect).Value[1] * 100

		return awakenLevelEffectNum and awakenLevelEffectNum or 0
	end

	return 0
end

function CooperateBossSystem:getRecomandHeroIds(mapId)
	local config = ConfigReader:getRecordById("CooperateBossMain", mapId)
	local recomand = config.ExcellentHero
	local recomandHeroIds = {}

	for i = 1, #recomand do
		local heroIds = recomand[i].Hero

		for j = 1, #heroIds do
			table.insert(recomandHeroIds, heroIds[j])
		end
	end

	return recomandHeroIds
end

function CooperateBossSystem:getBossName(congfigId)
	local bossBattle = ConfigReader:getDataByNameIdAndKey("CooperateBossMain", congfigId, "BossBattle")
	local nameKey = ConfigReader:getDataByNameIdAndKey("CooperateBossBattle", bossBattle, "Name")

	return Strings:get(nameKey)
end

function CooperateBossSystem:getInviteBossTabImage(level)
	local config = ConfigReader:getDataByNameIdAndKey("ConfigValue", "CooperateBoss_BossColor", "content")

	for i = 1, #config do
		local tmp = config[i]

		if tmp.level[1] <= level and level <= tmp.level[2] then
			return "asset/ui/cooperateBoss/" .. tmp.pic .. ".png", tmp.anim
		end
	end

	return "", ""
end

function CooperateBossSystem:enterCooperateBoss(isSwitch)
	local function callback(data)
		local uiName = self._cooperateBoss:getUI()

		if uiName then
			local view = self:getInjector():getInstance(uiName)

			if isSwitch then
				self:dispatch(ViewEvent:new(EVT_SWITCH_VIEW, view, nil, data))
			else
				self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))
			end
		end
	end

	self:requestCooperateBossMain(callback)
end

function CooperateBossSystem:requestCooperateBossMain(callback)
	local state = self:getcooperateBossState()

	if state == kCooperateBossState.kPreHot then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)

		local startTime = TimeUtil:localDate("%Y-%m-%d", self._cooperateBoss:getHotTime())

		self:dispatch(ShowTipEvent({
			tip = Strings:get("CooperateBoss_Entry_UI07", {
				StartTime = startTime
			})
		}))

		return
	end

	if state == kCooperateBossState.kEnd then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = Strings:get("CooperateBoss_Entry_UI06")
		}))

		return
	end

	local params = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 100
		}
	}

	self._service:requestDoActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if response.data.mineBoss then
				self._cooperateBoss:setMineBoss(response.data.mineBoss)
			end

			if callback then
				callback(response.data)
			end
		end
	end)
end

function CooperateBossSystem:enterCooperateBossInviteFriendView(bossId)
	local function callback(data)
		local scene = self:getInjector():getInstance("BaseSceneMediator", "activeScene")
		local topViewName = scene:getTopViewName()
		self._curBossRootView = topViewName
		local view = self:getInjector():getInstance("CooperateBossInviteFriendView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))
	end

	self:requestCooperateBossFriendInvite(bossId, callback)
end

function CooperateBossSystem:requestCooperateBossFriendInvite(bossId, callback)
	local params = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 106,
			bossId = bossId
		}
	}

	self._service:requestDoActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback(response.data)
			end
		elseif response.resCode == 53010 then
			-- Nothing
		end
	end)
end

function CooperateBossSystem:drawBattleRewards(callback)
	local params = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 101
		}
	}

	self._service:requestDoActivity(params, true, function (response)
		if callback then
			callback(response)
		end
	end)
end

function CooperateBossSystem:requestFriendTimes(callback)
	local params = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 110
		}
	}

	self._service:requestDoActivity(params, true, function (response)
		if callback then
			callback(response)
		end
	end)
end

function CooperateBossSystem:requestInviteFriend(bossId, friendRid, callback)
	local params = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 103,
			bossId = bossId,
			friendRid = friendRid
		}
	}

	self._service:requestDoActivity(params, true, function (response)
		if callback then
			callback(response)
		end
	end)
end

function CooperateBossSystem:requestLeaveTeam(bossId, callback)
	local params = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 109,
			bossId = bossId
		}
	}

	self._service:requestDoActivity(params, true, function (response)
		if callback then
			callback(response)
		end
	end)
end

function CooperateBossSystem:enterEditTeamView(bossInfo)
	local view = self:getInjector():getInstance("CooperateBossTeamView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		stageType = StageTeamType.COOPERATE_BOSS,
		bossInfo = bossInfo,
		outself = self
	}))
end

function CooperateBossSystem:doRequestBattleFinish(data, callback)
	local params = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 108,
			bossId = self._curBossId,
			resultData = data.resultData
		}
	}

	self._service:requestDoActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._curBossId = nil

			if func then
				func(response.data)
			end

			if response.data then
				self:enterCooperateBossBattleEnd(response.data)
			end
		elseif response.resCode == 12806 then
			BattleLoader:popBattleView(self, {})
			self:dispatch(SceneEvent:new(EVT_SWITCH_SCENE, "mainScene", nil, ))
		end
	end)
end

function CooperateBossSystem:doRequestBattleStart(params)
	local param = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 107,
			bossId = params.bossId
		}
	}

	self._service:requestDoActivity(param, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._curBossId = params.bossId
			self._curBossCreateTime = params.bossCreateTime

			self:enterBattle(response.data, self._viewType)
		end
	end)
end

function CooperateBossSystem:enterBattle(params, viewType)
	local playerData = params.playerData
	local enemyData = params.enemyData
	local mapId = params.blockMapId
	local pointId = params.blockPointId
	local randomSeed = params.logicSeed
	local strategySeedA = params.strategySeedA
	local strategySeedB = params.strategySeedB
	local herosEffect = params.herosEffect or {}
	local battleType = SettingBattleTypes.kClubStage
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(battleType)
	local isReplay = false
	local canSkip = false
	local skipTime = tonumber(ConfigReader:getDataByNameIdAndKey("ConfigValue", "CooperateBoss_SkipBattle_WaitTime", "content"))

	if self._systemKeeper:isUnlock("CooperateBoss_SkipBattle") then
		canSkip = true
	end

	local unlock, tips = self._systemKeeper:isUnlock("AutoFight")

	if not unlock then
		isAuto = false
	end

	local outSelf = self
	local battleDelegate = {}
	local battleSession = CooperateBattleSession:new({
		playerData = playerData,
		enemyData = enemyData,
		mapId = mapId,
		pointId = pointId,
		logicSeed = randomSeed,
		herosEffect = herosEffect,
		strategySeedA = strategySeedA,
		strategySeedB = strategySeedB
	}, curSeason)

	battleSession:buildAll()

	local battleData = battleSession:getPlayersData()
	local battleConfig = battleSession:getBattleConfig()
	local battleSimulator = battleSession:getBattleSimulator()
	local battleLogic = battleSimulator:getBattleLogic()
	local battleInterpreter = BattleInterpreter:new()

	battleInterpreter:setRecordsProvider(battleSession:getBattleRecordsProvider())

	local battleDirector = LocalBattleDirector:new()

	battleDirector:setBattleSimulator(battleSimulator)
	battleDirector:setBattleInterpreter(battleInterpreter)

	local battlePassiveSkill = battleSession:getBattlePassiveSkill()
	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		teams = battleSession:genTeamAiInfo(),
		mainPlayerId = {
			playerData.rid
		}
	}
	local systemKeeper = self._systemKeeper
	local unlockSpeed, tipsSpeed = systemKeeper:isUnlock("BattleSpeed")
	local speedOpenSta = systemKeeper:getBattleSpeedOpen(battleType)

	function battleDelegate:onAMStateChanged(sender, isAuto)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, isAuto)
	end

	function battleDelegate:onLeavingBattle()
		local realData = battleSession:getResultSummary()
		local data = {
			pointId = pointId,
			resultData = realData
		}

		outSelf:doRequestBattleFinish(data, function ()
		end)
	end

	function battleDelegate:onPauseBattle(continueCallback, leaveCallback)
		local delegate = self
		local popupDelegate = {
			willClose = function (self, sender, data)
				if data.opt == BattlePauseResponse.kLeave then
					leaveCallback()
				else
					continueCallback(data.hpShow, data.effectShow)
				end
			end
		}
		local pauseView = outSelf:getInjector():getInstance("battlePauseView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, pauseView, nil, {}, popupDelegate))
	end

	function battleDelegate:tryLeaving(callback)
		local delegate = {}

		function delegate:willClose(popupMediator, data)
			if data.response == AlertResponse.kOK then
				callback(true)
			else
				callback(false)
			end
		end

		local data = {
			title = Strings:get("SHOP_REFRESH_DESC_TEXT1"),
			content = Strings:get("CooperateBoss_QuitTip"),
			sureBtn = {},
			cancelBtn = {}
		}
		local view = outSelf:getInjector():getInstance("AlertView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))
	end

	function battleDelegate:onBattleFinish(result)
		local realData = battleSession:getResultSummary()
		local data = {
			pointId = pointId,
			resultData = realData
		}

		outSelf:doRequestBattleFinish(data, function ()
		end)
	end

	function battleDelegate:onDevWin(sender)
		local realData = {
			randomSeed = 123321,
			opData = "dev",
			result = kBattleSideAWin,
			winners = {
				playerData.rid
			},
			statist = {
				totalTime = 10000,
				roundCount = 4,
				players = {
					[playerData.rid] = {
						unitsDeath = 0,
						hpRatio = 0.99999,
						unitsTotal = 3,
						unitSummary = {}
					},
					[pointId] = {
						unitsDeath = 20,
						hpRatio = 0,
						unitsTotal = 20
					}
				}
			}
		}
		local data = {
			pointId = pointId,
			resultData = realData
		}

		outSelf:requestFinishBossBattle(data, function ()
		end)
	end

	function battleDelegate:onTimeScaleChanged(timeScale)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, nil, timeScale)
	end

	function battleDelegate:showBossCome(pauseFunc, resumeCallback, paseSta)
		local delegate = self
		local popupDelegate = {
			willClose = function (self, sender, data)
				if resumeCallback then
					resumeCallback()
				end
			end
		}
		local bossView = outSelf:getInjector():getInstance("battleBossComeView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, bossView, nil, {
			paseSta = paseSta
		}, popupDelegate))

		if pauseFunc then
			pauseFunc()
		end
	end

	function battleDelegate:onShowRestraint(continueCallback)
		local popupDelegate = {
			willClose = function (self, sender)
				continueCallback()
			end
		}
		local view = outSelf:getInjector():getInstance("battlerofessionalRestraintView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {}, popupDelegate))
	end

	local pointConfig = ConfigReader:getRecordById("CooperateBossBattle", mapId)
	local battleSpeed_Display = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BattleSpeed_Display", "content")
	local battleSpeed_Actual = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BattleSpeed_Actual", "content")
	local data = {
		battleType = battleSession:getBattleType(),
		battleData = battleData,
		battleConfig = battleConfig,
		isReplay = isReplay,
		logicInfo = logicInfo,
		delegate = battleDelegate,
		viewConfig = {
			opPanelClazz = "ClubBattleUIMediator",
			mainView = "ClubBossBattleView",
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			noHpFormat = true,
			finalHitShow = true,
			finalTaskFinishShow = true,
			battleSettingType = battleType,
			chatFlow = ChannelId.kBattleFlow,
			bulletTimeEnabled = BattleLoader:getBulletSetting("BulletTime_PVE_Source"),
			bgm = pointConfig.BGM or {
				"Mus_Battle_Resource_Jingsha",
				"",
				""
			},
			background = pointConfig.Background or "Battle_Scene_Sp02",
			refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
			battleSuppress = BattleDataHelper:getBattleSuppress(),
			hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting(),
			effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting(),
			passiveSkill = battlePassiveSkill,
			unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill"),
			finishWaitTime = BattleDataHelper:getBattleFinishWaitTime(battleType),
			btnsShow = {
				speed = {
					visible = speedOpenSta and self:getInjector():getInstance(SystemKeeper):canShow("BattleSpeed"),
					lock = not unlockSpeed,
					tip = tipsSpeed,
					speedConfig = battleSpeed_Actual,
					speedShowConfig = battleSpeed_Display,
					timeScale = timeScale
				},
				skip = {
					enable = true,
					waitTips = "ARENA_SKIP_TIP",
					visible = canSkip,
					skipTime = skipTime
				},
				auto = {
					visible = self:getInjector():getInstance(SystemKeeper):canShow("AutoFight"),
					state = isAuto,
					lock = not systemKeeper:isUnlock("AutoFight")
				},
				pause = {
					visible = true
				},
				restraint = {
					visible = self:getInjector():getInstance(SystemKeeper):canShow("Button_CombateDominating"),
					lock = not self:getInjector():getInstance(SystemKeeper):isUnlock("Button_CombateDominating")
				}
			}
		},
		loadingType = LoadingType.KClubBoss
	}

	BattleLoader:pushBattleView(self, data)
end

function CooperateBossSystem:listenCooperateBoss(code, data)
	if code == kCooperateBossListen.COOPERATE_BOSS_TRIGGER then
		self._cooperateBoss:setMineBoss(data)
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_NEWONE, data))
		self:enterCooperateBossNewOne(data)
	elseif code == kCooperateBossListen.COOPERATE_BOSS_INVITE then
		self._cooperateBoss:setInvitedBossIdMap(data)
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_INVITE, data))
	elseif code == kCooperateBossListen.COOPERATE_BOSS_AGREE then
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_AGREE, data))
	elseif code == kCooperateBossListen.COOPERATE_BOSS_REFUSE then
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_REFUSE, data))
	elseif code == kCooperateBossListen.COOPERATE_BOSS_BEGIN then
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_BEGIN, data))
	elseif code == kCooperateBossListen.COOPERATE_BOSS_BATTLE_OVER then
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_BATTLE_OVER, data))
	elseif code == kCooperateBossListen.COOPERATE_BOSS_ESCAPED then
		self._cooperateBoss:removeBossData(data)
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_ESCAPED, data))
	elseif code == kCooperateBossListen.COOPERATE_BOSS_DEAD then
		self._cooperateBoss:removeBossData(data)
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_DEAD, data))
	elseif code == kCooperateBossListen.COOPERATE_BOSS_ENTERROOM then
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_ENTERROOM, data))
	elseif code == kCooperateBossListen.COOPERATE_BOSS_LEAVEROOM then
		self:dispatch(Event:new(EVT_COOPERATE_BOSS_LEAVEROOM, data))
	end
end

function CooperateBossSystem:CanJoinCooperateBoss()
	local bossFightTime = self._cooperateBoss:getBossFightTimes()

	if bossFightTime.value > 0 then
		return kCooperateBossFightTimeState.kCanFight
	end

	local configBuyTimes = ConfigReader:getRecordById("ConfigValue", "CooperateBoss_PurchaseTime").content
	local buyTimes = self._cooperateBoss:getBoughtBossFightTimes()

	if buyTimes < #configBuyTimes then
		return kCooperateBossFightTimeState.kBuyTime
	end

	return kCooperateBossFightTimeState.kNotFight, configBuyTimes[buyTimes + 1]
end

function CooperateBossSystem:enterCooperateBossNewOne(data)
	local view = self:getInjector():getInstance("CooperateBossFightView")

	self:getEventDispatcher():dispatchEvent(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data))
end

function CooperateBossSystem:enterCooperateBossInvite(data)
	local view = self:getInjector():getInstance("CooperateBossInviteView")

	self:getEventDispatcher():dispatchEvent(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data))
end

function CooperateBossSystem:enterCooperateBossBattleEnd(data)
	local function getResultData()
		local player = self._developSystem:getPlayer()
		local id = player:getRid()
		local data = {
			bossLevel = data.bossLevel or 1,
			configId = data.bossConfId,
			hurt = data.hurt,
			bossState = data.bossState,
			blood = tonumber(string.format("%.2f", data.bossHpRate)),
			playerId = id,
			statist = data.statist,
			bossId = data.bossId,
			finishBattlePid = data.finishBattlePid,
			finishBattleName = data.finishBattleName
		}

		return data
	end

	local view = self:getInjector():getInstance("CooperateBossBattleEndView")

	self:getEventDispatcher():dispatchEvent(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, getResultData()))
end

function CooperateBossSystem:requestBuyFightTime()
	local param = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 102
		}
	}

	self._service:requestDoActivity(param, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_COOPERATE_BOSS_BUYTIME, data))
			self:dispatch(ShowTipEvent({
				tip = Strings:get("RewardTitle_Purchased")
			}))
		end
	end)
end

function CooperateBossSystem:requestAcceptInvite(bossid, callback)
	local param = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 105,
			bossId = bossid
		}
	}

	self._service:requestDoActivity(param, true, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback()
		end

		self:dispatch(Event:new(EVT_COOPERATE_REFRESH_INVITELIST))
	end)
end

function CooperateBossSystem:requestAfuseInvite(bossid)
	local param = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 104,
			bossId = bossid
		}
	}

	self._service:requestDoActivity(param, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_COOPERATE_REFRESH_INVITELIST))
		end
	end)
end

function CooperateBossSystem:requestGetInviteInfo(callback)
	local param = {
		activityId = self._cooperateBoss:getId(),
		param = {
			doActivityType = 111
		}
	}

	self._service:requestDoActivity(param, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._cooperateBoss:setInvitedBossIdMap(response.data.invitedBossIdMap)
			self._cooperateBoss:setMineBoss(response.data.mineBoss)

			if callback then
				callback()
			end
		end
	end)
end

function CooperateBossSystem:save(bossIds)
	if type(bossIds) ~= "string" then
		return
	end

	local customDataSystem = self:getInjector():getInstance("CustomDataSystem")

	customDataSystem:setValue(PrefixType.kGlobal, bossIds, true)
end

function CooperateBossSystem:isSaved(bossIds)
	if type(bossIds) ~= "string" then
		return
	end

	local customDataSystem = self:getInjector():getInstance("CustomDataSystem")

	return customDataSystem:getValue(PrefixType.kGlobal, bossIds, false)
end
