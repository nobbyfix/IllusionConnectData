EVT_ACTIVITY_RESET = "EVT_ACTIVITY_RESET"
EVT_ACTIVITY_REFRESH = "EVT_ACTIVITY_REFRESH"
EVT_ACTIVITY_CLOSE = "EVT_ACTIVITY_CLOSE"
EVT_ACTIVITY_REDPOINT_REFRESH = "EVT_ACTIVITY_REDPOINT_REFRESH"
EVT_ACTIVITY_SAGA_SCORE = "EVT_ACTIVITY_SAGA_SCORE"
DailyGift = "FreeStamina"

require("dm.gameplay.activity.model.ActivityList")

ActivitySystem = class("ActivitySystem", legs.Actor)

ActivitySystem:has("_activityList", {
	is = "r"
})
ActivitySystem:has("_activityService", {
	is = "r"
}):injectWith("ActivityService")
ActivitySystem:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
ActivitySystem:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
ActivitySystem:has("_battleTeam", {
	is = "rw"
})
ActivitySystem:has("_curStageType", {
	is = "rw"
})

local checkNewOpenActivity = nil

function ActivitySystem:initialize()
	super.initialize(self)

	self._curStageType = ""
	self._activityList = ActivityList:new()

	self._activityList:setActivitySystem(self)

	self._timeSchel = nil
	self._timer = {}
	self._initActivityClubBoss = false
	self._bannerData = ConfigReader:getDataTable("ActivityBanner")
	checkNewOpenActivity = {}

	for k, v in pairs(self._bannerData) do
		if v.Type == ActivityBannerType.kActivity then
			checkNewOpenActivity[#checkNewOpenActivity + 1] = v.TypeId
		end
	end
end

function ActivitySystem:dispose()
	self:shutSchedule()

	if self._spCheckSchedule then
		LuaScheduler:getInstance():unschedule(self._spCheckSchedule)

		self._spCheckSchedule = nil
	end

	super.dispose(self)
end

function ActivitySystem:checkEnabled()
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlock, tips = systemKeeper:isUnlock("Activity")

	return unlock, tips
end

function ActivitySystem:tryEnter(data)
	local unlock, tips = self:checkEnabled()
	local outself = self

	if unlock then
		self:requestAllActicities(true, function ()
			local _1, _2, actIds = outself:getActivitiesInActivity()

			if actIds and #actIds > 0 then
				local view = self:getInjector():getInstance("ActivityView")

				self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))
			else
				self:dispatch(ShowTipEvent({
					duration = 0.35,
					tip = Strings:get("Activity_Not_Found")
				}))
			end
		end)
	else
		self:dispatch(ShowTipEvent({
			duration = 0.35,
			tip = tips
		}))
	end
end

function ActivitySystem:enterActstageBattle(data, activityId, subActivityId)
	local blockPointId = data.blockPointId
	local blockMapId = data.blockMapId
	local pointType = data.pointType
	local isReplay = false
	local outSelf = self
	local battleDelegate = {}
	local battleSession = ActstageBattleSession:new(data)

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
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(SettingBattleTypes.kActstage)
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local canSkip = false
	local skipTime = 0
	local speedOpenSta = systemKeeper:getBattleSpeedOpen("actstage")
	local unlockSpeed, tipsSpeed = systemKeeper:isUnlock("BattleSpeed")
	local autoFight = systemKeeper:canShow("AutoFight")
	local speedCanshow = systemKeeper:canShow("BattleSpeed")
	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		teams = battleSession:genTeamAiInfo(),
		mainPlayerId = {
			data.playerData.rid
		}
	}

	function battleDelegate:onLeavingBattle()
		local params = {
			type = pointType,
			mapId = blockMapId,
			pointId = blockPointId,
			doActivityType = "104"
		}

		outSelf:requestLeaveActstage(activityId, subActivityId, params)
	end

	function battleDelegate:onPauseBattle(continueCallback, leaveCallback)
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

	function battleDelegate:onAMStateChanged(sender, isAuto)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(SettingBattleTypes.kActstage, isAuto)
	end

	function battleDelegate:tryLeaving(callback)
		callback(true)
	end

	function battleDelegate:onSkipBattle()
	end

	function battleDelegate:onBattleFinish(result)
		local realData = battleSession:getResultSummary()
		local params = {
			type = pointType,
			mapId = blockMapId,
			pointId = blockPointId,
			resultData = realData,
			doActivityType = "103"
		}

		outSelf:requestFinishActstage(activityId, subActivityId, params)
	end

	function battleDelegate:onDevWin()
		local realData = {
			randomSeed = 123321,
			opData = "dev",
			result = kBattleSideAWin,
			winners = {
				data.playerData.rid
			},
			pointId = data.blockPointId,
			mapId = blockMapId,
			statist = {
				totalTime = 10000,
				roundCount = 4,
				players = {
					[data.playerData.rid] = {
						unitsDeath = 0,
						hpRatio = 0.99999,
						unitsTotal = 3,
						unitSummary = {}
					},
					[data.blockPointId] = {
						unitsDeath = 20,
						hpRatio = 0,
						unitsTotal = 20,
						unitSummary = {}
					}
				}
			}
		}
		local params = {
			type = pointType,
			mapId = blockMapId,
			pointId = blockPointId,
			resultData = realData,
			doActivityType = "103"
		}

		outSelf:requestFinishActstage(activityId, subActivityId, params)
	end

	function battleDelegate:onTimeScaleChanged(timeScale)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(SettingBattleTypes.kActstage, nil, timeScale)
	end

	function battleDelegate:showBossCome(pauseFunc, resumeCallback, paseSta)
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

	local bgRes = ConfigReader:getDataByNameIdAndKey("ActivityBlockPoint", blockPointId, "Background") or "battle_scene_1"
	local BGM = ConfigReader:getDataByNameIdAndKey("ActivityBlockPoint", blockPointId, "BGM")
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
			mainView = "battlePlayer",
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			opPanelClazz = "BattleUIMediator",
			battleSettingType = SettingBattleTypes.kActstage,
			bulletTimeEnabled = BattleLoader:getBulletSetting("BulletTime_PVE_Main"),
			bgm = BGM,
			background = bgRes,
			refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
			battleSuppress = BattleDataHelper:getBattleSuppress(),
			hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting(),
			effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting(),
			passiveSkill = battlePassiveSkill,
			unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill"),
			finishWaitTime = BattleDataHelper:getBattleFinishWaitTime("crusade"),
			changeMaxNum = ConfigReader:getDataByNameIdAndKey("ActivityBlockPoint", blockPointId, "BossRound") or 1,
			btnsShow = {
				speed = {
					visible = speedOpenSta and speedCanshow,
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
					canChangeAuto = true,
					visible = autoFight,
					state = isAuto
				},
				pause = {
					enable = true,
					visible = true
				},
				restraint = {
					visible = self:getInjector():getInstance(SystemKeeper):canShow("Button_CombateDominating"),
					lock = not self:getInjector():getInstance(SystemKeeper):isUnlock("Button_CombateDominating")
				}
			}
		},
		loadingType = LoadingType.KActivity
	}

	BattleLoader:pushBattleView(self, data, nil, true)
end

function ActivitySystem:requestFinishActstage(activityId, subActivityId, params)
	local function callback(response)
		if response.resCode == GS_SUCCESS then
			local function finishCallBack()
				local data = response.data
				data.activityId = activityId
				data.subActivityId = subActivityId
				data.pointId = params.pointId

				if data.pass then
					local function endFunc()
						self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, self:getInjector():getInstance("ActivityStageFinishView"), {}, data, self))
					end

					local storyLink = ConfigReader:getDataByNameIdAndKey("ActivityBlockPoint", data.pointId, "StoryLink")
					local storynames = storyLink and storyLink.win
					local storyDirector = self:getInjector():getInstance(story.StoryDirector)
					local storyAgent = storyDirector:getStoryAgent()

					storyAgent:setSkipCheckSave(false)
					storyAgent:trigger(storynames, nil, endFunc)
				else
					self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, self:getInjector():getInstance("ActivityStageUnFinishView"), {}, data, self))
				end
			end

			if response.data.reviewFailed then
				local data = {
					title = Strings:get("Tip_Remind"),
					title1 = Strings:get("UITitle_EN_Tishi"),
					content = Strings:get("FAC_Des"),
					sureBtn = {
						text1 = "FAC_Btn"
					}
				}
				local outSelf = self
				local delegate = {
					willClose = function (self, popupMediator, data)
						finishCallBack()
					end
				}
				local view = self:getInjector():getInstance("AlertView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
				}, data, delegate))
			else
				finishCallBack()
			end

			return
		end

		print("requestFinishActstage error .activityId:" .. tostring(activityId))
		BattleLoader:popBattleView(self, {})

		if self:checkComplexActivity(activityId) then
			self:complexActivityTryEnter({
				activityId = activityId
			})
		else
			self:dispatch(SceneEvent:new(EVT_SWITCH_SCENE, "mainScene", nil, ))
		end
	end

	self:requestDoChildActivity(activityId, subActivityId, params, callback, true)
end

function ActivitySystem:requestLeaveActstage(activityId, subActivityId, params)
	local function callback(response)
		if response.resCode == GS_SUCCESS then
			local data = response.data
			data.activityId = activityId
			data.subActivityId = subActivityId
			data.pointId = params.pointId
			data.activeLeave = true

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, self:getInjector():getInstance("ActivityStageUnFinishView"), {}, data))
		else
			print("requestLeaveActstage error .activityId:" .. tostring(activityId))
			BattleLoader:popBattleView(self, {})

			if self:checkComplexActivity(activityId) then
				self:complexActivityTryEnter({
					activityId = activityId
				})
			else
				self:dispatch(SceneEvent:new(EVT_SWITCH_SCENE, "mainScene", nil, ))
			end
		end
	end

	self:requestDoChildActivity(activityId, subActivityId, params, callback, true)
end

function ActivitySystem:getActivityOpenStatusById(activityId)
	local activityId = tostring(activityId)
	local _, activities = self:getActivitiesInActivity()
	local activity = activities[activityId]

	if activity then
		return true
	end

	return false
end

function ActivitySystem:getAllActivityIds()
	return self:getActivityList():getAllActivityIds()
end

function ActivitySystem:checkActivityState()
	self:shutSchedule()

	local activityList = self:getAllActivityIds()
	local hasNewActivity = false

	for k, activityId in pairs(activityList) do
		local isOver = self:isActivityOver(activityId)

		if not isOver and not self._timer[activityId] then
			self._timer[activityId] = 1

			if table.indexof(checkNewOpenActivity, activityId) then
				hasNewActivity = true
			end
		end
	end

	if hasNewActivity then
		self:dispatch(Event:new(EVT_CHARGETASK_FIN))
	end

	self:createTimeSchedule()
end

function ActivitySystem:createTimeSchedule()
	local function update()
		local activityList = self:getAllActivityIds()

		for k, activityId in ipairs(activityList) do
			if self._timer[activityId] == 1 then
				local isOver = self:isActivityOver(activityId)

				if isOver then
					self:dispatch(Event:new(EVT_ACTIVITY_CLOSE, {
						activityId = activityId
					}))

					self._timer[activityId] = 0
				end
			end
		end
	end

	if not self._timeSchel then
		self._timeSchel = LuaScheduler:getInstance():schedule(update, 2, true)
	end
end

function ActivitySystem:checkSpecialActivityOpen()
	local function checkFunc()
		local activity = self:getActivityByType("Carnival")

		if activity and activity:getIsCanShow() == "false" and self:checkConditionWithId("Carnival") then
			activity:setIsCanShow("true")
			self:dispatch(Event:new(EVT_CHARGETASK_FIN))
		end
	end

	if not self._spCheckSchedule then
		self._spCheckSchedule = LuaScheduler:getInstance():schedule(checkFunc, 2, true)
	end
end

function ActivitySystem:shutSchedule()
	if self._timeSchel then
		LuaScheduler:getInstance():unschedule(self._timeSchel)

		self._timeSchel = nil
	end
end

function ActivitySystem:checkCarnival()
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlock, tips = systemKeeper:isUnlock("Carnival")
	local isOpen = self:isActivityOpen("Carnival")
	local isOver = self:isActivityOver("Carnival")
	local openCondition = self:checkConditionWithId("Carnival")

	return isOpen and not isOver and unlock and openCondition
end

function ActivitySystem:tryEnterCarnival()
	if self:checkCarnival() then
		self:requestAllActicities(true, function ()
			local view = self:getInjector():getInstance("CarnivalView")

			self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {}))
		end)
	end
end

function ActivitySystem:enterEasterEgg(data)
	local view = self:getInjector():getInstance("ActivityBlockEggView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		activityId = data.activityId
	}))
end

function ActivitySystem:showEasterRewards(data)
	local view = self:getInjector():getInstance("ActivityEggRewardView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		activityId = data.activityId
	}))
end

function ActivitySystem:enterTeam(activityId, blockActivity)
	local view = self:getInjector():getInstance("ActivityBlockTeamView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		activity = blockActivity,
		activityId = activityId
	}))
end

function ActivitySystem:enterSurface(param)
	local surfaceSystem = self:getInjector():getInstance(SurfaceSystem)

	surfaceSystem:tryEnter(param)
end

function ActivitySystem:showEggSucc(activityId, eggActivity, callback)
	local view = self:getInjector():getInstance("ActivityEggSuccView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		maskOpacity = 0
	}, {
		activityId = activityId,
		eggActivity = eggActivity,
		callback = callback
	}))
end

function ActivitySystem:showActivityRules(rules, param, extraParams)
	local view = self:getInjector():getInstance("ArenaRuleView")
	local event = ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		rule = rules,
		param1 = param,
		useParam = param ~= nil or extraParams ~= nil,
		extraParams = extraParams
	}, nil)

	self:dispatch(event)
end

function ActivitySystem:enterSummerExchange(activityId)
	local view = self:getInjector():getInstance("ActivityBlockSummerExchangeView")
	local event = ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		activityId = activityId
	})

	self:dispatch(event)
end

function ActivitySystem:monsterShopGoodsExchange(activityId, subActivityId, data, callback)
	local params = {
		doActivityType = 101,
		exchangeId = data.goodsId,
		index = data.index or 1,
		exchangeAmount = data.goodsNum or 1
	}
	local activityId = activityId

	local function callbackFunc(response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback(response)
			end

			local data = response.data.rewards

			self:dispatch(Event:new(EVT_MONSTERSHOP_REFRESH, {
				activityId = activityId
			}))

			if data and next(data) then
				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					rewards = data
				}))
			end
		end
	end

	if subActivityId then
		self:requestDoChildActivity(activityId, subActivityId, params, callbackFunc)
	else
		self:requestDoActivity(activityId, params, callbackFunc)
	end
end

function ActivitySystem:monsterShopCandyExchange(activityId, subActivityId, callback)
	local params = {
		doActivityType = 102
	}
	local activityId = activityId

	local function callbackFunc(response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback(response)
			end

			local data = response.data.rewards

			self:dispatch(Event:new(EVT_MONSTERSHOP_REFRESH, {
				activityId = activityId
			}))

			if data and next(data) then
				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					rewards = data
				}))
			end
		end
	end

	if subActivityId then
		self:requestDoChildActivity(activityId, subActivityId, params, callbackFunc)
	else
		self:requestDoActivity(activityId, params, callbackFunc)
	end
end

function ActivitySystem:monsterShopGetMoneyRates(activityId, subActivityId, callback)
	local params = {
		doActivityType = 103
	}
	local activityId = activityId

	local function callbackFunc(response)
		if response.resCode == GS_SUCCESS and callback then
			callback(response)
		end
	end

	if subActivityId then
		self:requestDoChildActivity(activityId, subActivityId, params, callbackFunc)
	else
		self:requestDoActivity(activityId, params, callbackFunc)
	end
end

function ActivitySystem:colourEggGetAll(activityId, subActivityId, callback)
	local params = {
		doActivityType = 101
	}
	local activityId = activityId

	local function callbackFunc(response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback(response.data)
			end

			self:dispatch(Event:new(EVT_COLOUR_EGG_REFRESH, response.data))
		end
	end

	if subActivityId then
		self:requestDoChildActivity(activityId, subActivityId, params, callbackFunc)
	else
		self:requestDoActivity(activityId, params, callbackFunc)
	end
end

function ActivitySystem:colourEggGetTarget(activityId, subActivityId, eggId, callback)
	local params = {
		doActivityType = 102,
		eggId = eggId
	}
	local activityId = activityId

	local function callbackFunc(response)
		if response.resCode == GS_SUCCESS and callback then
			callback(response.data)
		end
	end

	if subActivityId then
		self:requestDoChildActivity(activityId, subActivityId, params, callbackFunc)
	else
		self:requestDoActivity(activityId, params, callbackFunc)
	end
end

function ActivitySystem:getCurrentTime()
	return self._gameServerAgent:remoteTimestamp()
end

function ActivitySystem:getActivityById(activityId)
	return self:getActivityList():getActivityById(activityId)
end

function ActivitySystem:getActivityByType(actType)
	return self:getActivityList():getActivityByType(actType)
end

function ActivitySystem:getActivityByComplexId(complexId)
	return self:getActivityList():getActivityByComplexId(complexId)
end

function ActivitySystem:getActivityByComplexUI(ui)
	return self:getActivityList():getActivityByComplexUI(ui)
end

function ActivitySystem:getActivitiesByType(type)
	return self:getActivityList():getActivitiesByType(type)
end

function ActivitySystem:getActivitiesByShowTab(showTab)
	local activitiesForIndex = {}
	local activitiesForId = {}
	local allActivities = self:getActivityList():getAllActivities()
	local index = 1

	for id, activity in pairs(allActivities) do
		if activity:getShowTab() == showTab and self:isActivityOpen(id) and not self:isActivityOver(id) then
			activitiesForIndex[index] = activity
			activitiesForId[id] = activity
			index = index + 1
		end
	end

	table.sort(activitiesForIndex, function (a, b)
		return a:getShowIndex() < b:getShowIndex()
	end)

	return activitiesForIndex, activitiesForId
end

function ActivitySystem:getActivitiesInActivity()
	local activitiesForIndex = {}
	local activitiesForId = {}
	local activityList = {}
	local allActivities = self:getActivityList():getAllActivities()
	local index = 1

	for id, activity in pairs(allActivities) do
		if (activity:getShowTab() == ActivityShowTab.kInActivity or activity:getShowTab() == ActivityShowTab.kInAll) and self:isActivityOpen(id) and not self:isActivityOver(id) and self:checkConditionWithId(id) then
			activitiesForIndex[index] = activity
			activitiesForId[id] = activity
			activityList[index] = id
			index = index + 1
		end
	end

	table.sort(activitiesForIndex, function (a, b)
		return a:getShowIndex() < b:getShowIndex()
	end)

	return activitiesForIndex, activitiesForId, activityList
end

function ActivitySystem:getExtraMarkByType(type)
	local activities = self:getActivitiesByType(ActivityType.kBLOCKSPEXTRA)

	for id, activity in pairs(activities) do
		local config = activity:getActivityConfig()

		if config[type] then
			local path = string.format("asset/commonLang/%s.png", config[type])

			return path
		end
	end

	return nil
end

function ActivitySystem:checkConditionWithId(activityId)
	local activity = self:getActivityById(activityId)

	if not activity then
		return false
	end

	local condition = activity:getClientCondition()

	if not condition or type(condition) ~= "table" then
		return true
	end

	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local unlockSystem = self:getInjector():getInstance(SystemKeeper)
	local playerLevel = developSystem:getPlayer():getLevel()
	local isOk = true

	for k, v in pairs(condition) do
		if k == "LEVEL" then
			isOk = isOk and v <= playerLevel
		end

		if k == "STAGE" then
			isOk = isOk and unlockSystem:checkStagePointLock(v)
		end
	end

	return isOk
end

function ActivitySystem:getActivitiesInHome()
	local activitiesForIndex = {}
	local activitiesForId = {}
	local allActivities = self:getActivityList():getAllActivities()
	local index = 1

	for id, activity in pairs(allActivities) do
		if (activity:getShowTab() == ActivityShowTab.kInHome or activity:getShowTab() == ActivityShowTab.kInAll) and self:isActivityOpen(id) and not self:isActivityOver(id) then
			activitiesForIndex[index] = activity
			activitiesForId[id] = activity
			index = index + 1
		end
	end

	table.sort(activitiesForIndex, function (a, b)
		return a:getShowIndex() < b:getShowIndex()
	end)

	return activitiesForIndex, activitiesForId
end

function ActivitySystem:hasActivitySystemRedPoint()
	local activitiesForIndex, activitiesForId = self:getActivitiesInActivity()

	for index, activity in pairs(activitiesForIndex) do
		if activity:hasRedPoint() then
			return true
		end
	end

	return false
end

function ActivitySystem:hasRedPointForActivity(activityId)
	local activity = self:getActivityById(activityId)

	if activity then
		return activity:hasRedPoint()
	end

	return false
end

function ActivitySystem:hasRedPointForActivityWsj(activityId)
	if not self:hasRedPointForActivity(activityId) then
		return self:hasRedPointForActivity(self:getActivityById(activityId):getActivityConfig().LoginActivity)
	end

	return true
end

function ActivitySystem:hasRedPointForActivitySummer(activityId)
	if not self:hasRedPointForActivity(activityId) then
		local limit = ConfigReader:getRecordById("Reset", "AcitvitySummerStamina_Reset").ResetSystem.limit
		local bagSystem = self:getInjector():getInstance(BagSystem)
		local num = bagSystem:getAcitvitySummerPower()
		local isHave, tips = self:getActivityById(activityId):getActivityClubBossActivity()

		return isHave and limit <= num
	end

	return true
end

function ActivitySystem:isActivityOpen(activityId)
	local activity = self:getActivityById(activityId)

	if activity then
		local curTime = self._gameServerAgent:remoteTimeMillis()

		if curTime < activity:getStartTime() or activity:getEndTime() < curTime then
			return false
		end

		return activity:getIsTodayOpen()
	end

	return false
end

function ActivitySystem:isActivityOver(activityId)
	local activity = self:getActivityById(activityId)

	if activity then
		local curTime = self._gameServerAgent:remoteTimeMillis()

		return activity:getEndTime() <= curTime
	end

	return false
end

function ActivitySystem:getActivityRemainTime(activityId)
	local activity = self:getActivityById(activityId)

	if activity then
		local curTime = self._gameServerAgent:remoteTimeMillis()

		return math.floor(activity:getEndTime() - curTime)
	end

	return 0
end

function ActivitySystem:disableEightDayLoginPop()
	local activity = self:getActivityById("EightDaysCheckIn")

	if activity then
		activity:setCanHomePop(false)
	end
end

function ActivitySystem:isCarnivalGruopOpen(index)
	local activity = self:getActivityById("Carnival")

	return activity:isGroupOpen(index)
end

function ActivitySystem:doReset(resetId, value, response)
	if response then
		self:getActivityList():synchronize(response.activityMap)
		self:dispatch(Event:new(EVT_ACTIVITY_REFRESH))
	end
end

function ActivitySystem:hasOverActivity(showTab)
	local activities = self:getActivitiesByShowTab(showTab)

	if tabType == nil then
		activities = self:getActivityList():getAllActivities()
	end

	for _, activity in pairs(activities) do
		if self:isActivityOver(activity:getId()) then
			return true
		end
	end

	return false
end

function ActivitySystem:hasOverActivityInActivity(list)
	local activities = list

	for _, activity in pairs(activities) do
		if self:isActivityOver(activity:getId()) then
			return true
		end
	end

	return false
end

function ActivitySystem:deleteActivity(activityMap)
	self:getActivityList():deleteActivity(activityMap)
end

function ActivitySystem:getTimeWillOpen(start)
	local _, _, y, mon, d, h, m, s = string.find(start, "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
	local table = {
		year = y,
		month = mon,
		day = d,
		hour = h,
		min = m,
		sec = s
	}
	local mills = TimeUtil:timeByRemoteDate(table)
	local remoteTimestamp = self:getCurrentTime()
	local remainTime = mills - remoteTimestamp
	local str = ""
	local fmtStr = "${d}:${H}:${M}:${S}"
	local timeStr = TimeUtil:formatTime(fmtStr, remainTime)
	local parts = string.split(timeStr, ":", nil, true)
	local timeTab = {
		day = tonumber(parts[1]),
		hour = tonumber(parts[2]),
		min = tonumber(parts[3])
	}

	if timeTab.day > 0 then
		str = timeTab.day .. Strings:get("TimeUtil_Day")
	elseif timeTab.hour > 0 then
		str = timeTab.hour .. Strings:get("TimeUtil_Hour")
	else
		timeTab.min = math.max(1, timeTab.min)
		str = timeTab.min .. Strings:get("TimeUtil_Min")
	end

	return str
end

function ActivitySystem:isCanGetStamina(timeList, index)
	local activity = self:getActivityById("FreeStamina")
	local timeSlot = activity:getTotalTimeSlot()
	local receiveStatus = activity:getRewardStatusByIndex(index)
	local dayMaxTime = activity:getDayMaxTimeList()
	local dayMaxDataMin = string.split(dayMaxTime[1], ":")
	local minData = string.split(timeList[1], ":")
	local maxData = string.split(timeList[2], ":")
	local currentTimeStamp = self:getInjector():getInstance("GameServerAgent"):remoteTimestamp()
	local minDayTimeStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
		hour = dayMaxDataMin[1],
		min = dayMaxDataMin[2],
		sec = dayMaxDataMin[3]
	})
	local minTimeStamp, maxTimeStamp, isTomorrow = nil

	if minDayTimeStamp <= currentTimeStamp and index ~= timeSlot then
		minTimeStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = minData[1],
			min = minData[2],
			sec = minData[3]
		})
		maxTimeStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = maxData[1],
			min = maxData[2],
			sec = maxData[3]
		})
		minTimeStamp = minTimeStamp + 86400
		maxTimeStamp = maxTimeStamp + 86400
		isTomorrow = true
	else
		minTimeStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = minData[1],
			min = minData[2],
			sec = minData[3]
		})
		maxTimeStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = maxData[1],
			min = maxData[2],
			sec = maxData[3]
		})
		isTomorrow = false
	end

	if maxTimeStamp < currentTimeStamp then
		return StaminaRewardTimeStatus.kBefore, isTomorrow
	elseif currentTimeStamp <= maxTimeStamp and minTimeStamp <= currentTimeStamp then
		if receiveStatus == ActivityTaskStatus.kGet then
			return StaminaRewardTimeStatus.kBefore, isTomorrow
		else
			return StaminaRewardTimeStatus.kNow, isTomorrow
		end
	else
		return StaminaRewardTimeStatus.kAfter, isTomorrow
	end
end

function ActivitySystem:requestAllActicities(blockUI, callback)
	blockUI = blockUI or true
	local params = {}

	self._activityService:requestAllActicities(params, blockUI, function (response)
		if response.resCode == GS_SUCCESS then
			self:getActivityList():synchronize(response.data.activityMap)
			self:dispatch(Event:new(EVT_ACTIVITY_REFRESH))

			if callback then
				callback(response)
			end
		end
	end)
end

function ActivitySystem:requestActicityById(activityId, callback)
	local params = {
		activityId = activityId
	}

	self._activityService:requestActicityById(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:getActivityList():syncAloneActivity(activityId, response.data)

			if callback then
				callback(response)
			end
		end
	end)
end

function ActivitySystem:requestDoActivity(activityId, param, callback)
	if not self:getVersionCanBuy(activityId) then
		return
	end

	local cjson = require("cjson.safe")
	local params = {
		activityId = activityId,
		param = param
	}

	self._activityService:requestDoActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback(response)
			end

			self:dispatch(Event:new(EVT_ACTIVITY_REDPOINT_REFRESH, {}))
		end
	end)
end

function ActivitySystem:requestDoChildActivity(activityId, subActivityId, param, callback, forceCallback)
	if not self:getVersionCanBuy(activityId) then
		return
	end

	local params = {
		subActivityId = subActivityId,
		activityId = activityId,
		param = param
	}

	self._activityService:requestDoChildActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback(response)
			end

			self:dispatch(Event:new(EVT_ACTIVITY_REDPOINT_REFRESH, {}))
		elseif forceCallback and callback then
			callback(response)
		end
	end)
end

function ActivitySystem:getHomeRedPointSta()
	if self:checkEnabled() and self:hasActivitySystemRedPoint() then
		return true
	end

	return false
end

function ActivitySystem:getPlatform()
	return device.platform
end

function ActivitySystem:getVersionCanBuy(activityId)
	local config = ConfigReader:getRecordById("Activity", activityId)

	if config then
		local v = config.Version

		if v then
			local p = self:getPlatform()
			local baseVersion = app.pkgConfig.packJobId

			if baseVersion and v[p] and tonumber(baseVersion) < tonumber(v[p]) then
				local tips = Strings:get("Activity_Version_Tips3")

				if config.Type == "EXCHANGE" then
					tips = Strings:get("Activity_Version_Tips2")
				end

				self:dispatch(ShowTipEvent({
					duration = 0.2,
					tip = tips
				}))

				return false
			end
		end
	end

	return true
end

function ActivitySystem:setBattleTeamInfo(team)
	local teamInfo = {
		teamHeroInfo = {}
	}
	local heroIds = team:getHeroes()
	local heroSystem = self:getInjector():getInstance("DevelopSystem"):getHeroSystem()

	for _, v in ipairs(heroIds) do
		local heroInfo = heroSystem:getHeroById(v)
		teamInfo.teamHeroInfo[v] = {
			level = heroInfo:getLevel(),
			exp = heroInfo:getExp()
		}
	end

	self:setBattleTeam(teamInfo)
end

function ActivitySystem:checkPassActivityData()
	local passSystem = self:getInjector():getInstance(PassSystem)

	passSystem:checkPassActivityData()
end

function ActivitySystem:setInitActivityClubBossMark()
	self._initActivityClubBoss = true
end

function ActivitySystem:checkClubBossSummerActivityData()
	if self._initActivityClubBoss == false then
		return
	end

	if self:getBlockSummerActivity() ~= nil then
		local clubSystem = self:getInjector():getInstance(ClubSystem)

		clubSystem:refreshClubBossSummerActivityData()
	end
end

function ActivitySystem:getBlockSummerActivity()
	local resultActivity = nil
	local activityList = self:getAllActivityIds()

	for k, activityId in ipairs(activityList) do
		local activity = self:getActivityById(activityId)

		if activity:getUI() == ActivityType_UI.kActivityBlockSummer then
			resultActivity = activity

			break
		end
	end

	return resultActivity
end

function ActivitySystem:checkComplexActivity(activityId)
	local isOpen = self:isActivityOpen(activityId)
	local isOver = self:isActivityOver(activityId)
	local openCondition = self:checkConditionWithId(activityId)

	return isOpen and not isOver and openCondition
end

function ActivitySystem:complexActivityTryEnter(data)
	local activityId = data.activityId
	local activity = self:getActivityById(activityId)

	if activity then
		local ui = activity:getActivityComplexUI()

		self:tryEnterComplexMainView(ui)
	end
end

function ActivitySystem:tryEnterComplexMainView(ui)
	local activity = self:getActivityByComplexUI(ui)

	if activity and self:checkComplexActivity(activity:getId()) then
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
		self:requestAllActicities(true, function ()
			local view = self:getInjector():getInstance(ActivityComplexUI.tryEnterComplexMainView[ui])

			self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
				activityId = activity:getId()
			}))
		end)
	end
end

function ActivitySystem:tryEnterBlockMonsterShopView(data)
	local activityId = data.activityId

	self:enterBlockMonsterShopView(activityId)
end

function ActivitySystem:enterSupportStage(activityId)
	local activity = self:getActivityById(activityId)

	if activity then
		local ui = activity:getActivityComplexUI()
		local view = self:getInjector():getInstance(ActivityComplexUI.enterSupportStageView[ui])
		local event = ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
			activityId = activity:getId()
		})

		self:dispatch(event)
	end
end

function ActivitySystem:enterSagaSupportStage(activityId)
	local params = {
		doActivityType = 101
	}

	self:requestDoActivity(activityId, params, function (response)
		self:getActivityById(activityId):synchronizePeriodsInfo(response.data)

		local activity = self:getActivityById(activityId)

		if activity then
			local ui = activity:getActivityComplexUI()
			local view = self:getInjector():getInstance(ActivityComplexUI.enterSagaSupportStageView[ui])

			self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
				activityId = activityId
			}))
		end
	end)
end

function ActivitySystem:enterSagaSupportSchedule(activityId)
	local params = {
		doActivityType = 101
	}

	self:requestDoActivity(activityId, params, function (response)
		self:getActivityById(activityId):synchronizePeriodsInfo(response.data)

		local activity = self:getActivityById(activityId)

		if activity then
			local ui = activity:getActivityComplexUI()
			local view = self:getInjector():getInstance(ActivityComplexUI.enterSagaSupportScheduleView[ui])

			self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
				activityId = activityId
			}))
		end
	end)
end

function ActivitySystem:enterSupportTaskView(activityId)
	local activity = self:getActivityById(activityId)

	if activity then
		local ui = activity:getActivityComplexUI()
		local view = self:getInjector():getInstance(ActivityComplexUI.enterSupportTaskView[ui])

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
			activityId = activityId
		}))
	end
end

function ActivitySystem:enterSagaSupportRankRewardView(activityId, periodId)
	local activity = self:getActivityById(activityId)

	if activity then
		local ui = activity:getActivityComplexUI()
		local view = self:getInjector():getInstance(ActivityComplexUI.enterSagaSupportRankRewardView[ui])

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			periodId = periodId,
			activityId = activityId
		}))
	end
end

function ActivitySystem:enterSagaWinView(activityId)
	local activity = self:getActivityById(activityId)

	if activity then
		local ui = activity:getActivityComplexUI()
		local view = self:getInjector():getInstance(ActivityComplexUI.enterSagaWinView[ui])

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {}, {
			activityId = activityId
		}))
	end
end

function ActivitySystem:enterBlockMap(activityId)
	local activity = self:getActivityById(activityId)

	if activity then
		local ui = activity:getActivityComplexUI()
		local view = self:getInjector():getInstance(ActivityComplexUI.enterSupportStageView[ui])
		local event = ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
			activityId = activityId
		})

		self:dispatch(event)
	end
end

function ActivitySystem:enterBlockMonsterShopView(activityId)
	local activity = self:getActivityById(activityId)

	if activity then
		local ui = activity:getActivityComplexUI()
		local view = self:getInjector():getInstance(ActivityComplexUI.enterBlockMonsterShopView[ui])
		local event = ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
			activityId = activityId
		})

		self:dispatch(event)
	end
end

function ActivitySystem:enterBlockFudaiView(activityId)
	AudioEngine:getInstance():playEffect("Se_Click_Select_1", false)

	local function callback()
		local view = self:getInjector():getInstance("ActivityBlockFudaiView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			activityId = activityId
		}))
	end

	self._shopSystem:requestGetPackageShop(callback)
end
