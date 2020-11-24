StagePracticeSystem = class("StagePracticeSystem", Facade, _M)

StagePracticeSystem:has("_stagePractice", {
	is = "r"
})
StagePracticeSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
StagePracticeSystem:has("_offsetX", {
	is = "rw"
})
StagePracticeSystem:has("_enemyHeroList", {
	is = "rw"
})
StagePracticeSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")

function StagePracticeSystem:initialize()
	super.initialize(self)

	self._stagePractice = StagePractice:new()
	self._offsetX = 0
end

function StagePracticeSystem:synchronize(data)
	self._stagePractice:sync(data)

	if not self._enemyHeros then
		self._enemyHeros = StagePracticeEnemyHeroList:new(self._developSystem)
	end
end

function StagePracticeSystem:getMapById(mapId)
	return self._stagePractice:getMapById(mapId)
end

function StagePracticeSystem:getPointById(mapId, pointId)
	print("mapId-->", mapId, " pointId-->", pointId)

	return self:getMapById(mapId):getPointById(pointId)
end

function StagePracticeSystem:getRankListOj()
	return self._stagePractice:getRankList()
end

function StagePracticeSystem:getFlagIdState(id)
	local rid = self._developSystem:getPlayer():getRid()

	return cc.UserDefault:getInstance():getBoolForKey(id .. rid)
end

function StagePracticeSystem:getCurPointData(mapIndex)
	return self._curPointData and self._curPointData[mapIndex]
end

function StagePracticeSystem:setFlagIdState(id)
	local rid = self._developSystem:getPlayer():getRid()

	cc.UserDefault:getInstance():setBoolForKey(id .. rid, true)
end

function StagePracticeSystem:setCurPoint(mapIndex, curpointdata)
	if not self._curPointData then
		self._curPointData = {}
	end

	self._curPointData[mapIndex] = curpointdata
end

function StagePracticeSystem:setCurPointIndex(mapIndex, pointIndex)
	if not self._curPointIndex then
		self._curPointIndex = {}
	end

	self._curPointIndex[mapIndex] = pointIndex
end

function StagePracticeSystem:getCurPointIndex(mapIndex)
	return self._curPointIndex and self._curPointIndex[mapIndex]
end

function StagePracticeSystem:getShowMapIds()
	local player = self._developSystem:getPlayer()
	local array = self._stagePractice:getArray()
	local showList = {}

	for i = 1, #array do
		local stageMap = array[i]
		local factor1 = not GameConfigs.closeStagePracticeTest
		local factor2 = GameConfigs.closeStagePracticeTest and stageMap:getId() ~= "PMTEST_0508"

		if factor1 or factor2 then
			showList[#showList + 1] = stageMap:getId()
		end
	end

	return showList
end

function StagePracticeSystem:popWinView(mapId, pointId, teamData, supportData, data, func)
	local pointData = self:getPointById(mapId, pointId)
	local view = self:getInjector():getInstance("StagePracticeWinView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		maskOpacity = 156,
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		data = {
			stars = data.stars,
			time = data.time,
			pointId = pointId,
			mapId = mapId,
			teamData = teamData,
			supportData = supportData,
			starCondition = pointData:getStarCondition(),
			reward = data.fullStarReward,
			stagePassReward = data.stagePassReward,
			stageStarReward = data.stageStarReward,
			func = func
		}
	}))
end

function StagePracticeSystem:hasRedPoint()
	local list = self._stagePractice:getList()

	for id, data in pairs(list) do
		if data:hasRedPoint() then
			return true
		end
	end

	return false
end

function StagePracticeSystem:mapHasRedPoint(mapIndex)
	local array = self._stagePractice:getArray()

	return array[mapIndex]:hasRedPoint()
end

function StagePracticeSystem:getMapLockTip(mapId)
	local mapData = self:getMapById(mapId)
	local condition = mapData:getShowCondition()
	local playerLevel = self._developSystem:getPlayer():getLevel()

	if condition.preMap and not self:getMapById(condition.preMap):isAllPointPass() then
		local config = ConfigReader:getRecordById("StagePracticeMap", tostring(condition.preMap))

		return Strings:get("TeachPtc_UnlockMapTip", {
			map = Strings:get(config and config.MapName)
		})
	elseif condition.level and playerLevel < condition.level then
		return Strings:get("Stage_Map_Level_Unlock_Tip", {
			level = condition.level
		})
	end
end

function StagePracticeSystem:getPointLockTip(mapId, pointId)
	local pointData = self:getPointById(mapId, pointId)
	local condition = pointData:getUnlockCondition()
	local playerLevel = self._developSystem:getPlayer():getLevel()

	if condition.prePoint and self:getPointById(mapId, condition.prePoint):getPassed() ~= 1 then
		local config = ConfigReader:getRecordById("StagePracticePoint", tostring(condition.prePoint))

		return Strings:get("TeachPtc_UnlockPointTip", {
			point = Strings:get(config and config.Name)
		})
	elseif condition.level and playerLevel < condition.level then
		return Strings:get("Stage_Map_Level_Unlock_Tip", {
			level = condition.level
		})
	end
end

function StagePracticeSystem:getPointReward(mapId, pointId)
	local info = {
		mapId = mapId,
		pointId = pointId
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:getPointReward(info, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_STAGEPRACTICE_GETREWARD_SUCC, response.data))
		end
	end)
end

function StagePracticeSystem:requestRank(pointId, rankStart, rankEnd, func)
	rankStart = rankStart or 1
	rankEnd = rankEnd or 20
	local info = {
		type = 13,
		subId = pointId,
		start = rankStart,
		["end"] = rankEnd
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestRank(info, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._stagePractice:syncRankList(response.data)

			if func then
				func()
			end
		end
	end)
end

function StagePracticeSystem:requestEmbattle(mapId, pointId, herosdata, masterids, func)
	local info = {
		mapId = mapId,
		pointId = pointId,
		masterId = masterids,
		heros = herosdata
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	dump(info, "训练本保存阵容")
	stagePracticeService:requestEmbattle(info, true, function (response)
		if response.resCode == GS_SUCCESS and func then
			func()
		end
	end)
end

function StagePracticeSystem:requestPracticeBattleBefor(mapId, pointId, herosdata, masterids, func)
	local params = {
		mapId = mapId,
		pointId = pointId,
		masterId = masterids,
		heros = herosdata
	}

	dump(params, "战前请求数据发送")

	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestPracticeBattleBefor(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			local pointId = params.pointId
			local playerData = response.data.playerData
			local lastScore = self:getStageDamage(params.stageId)
			local mapdata = {
				mapId = mapId,
				pointId = pointId
			}

			self:enterBattle(playerData, pointId, mapdata, lastScore)

			if func then
				func()
			end
		end
	end)
end

function StagePracticeSystem:requestBattleAfter(mapId, pointId, resultData, func)
	local info = {
		mapId = mapId,
		pointId = pointId,
		resultData = resultData
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestBattleAfter(info, true, function (response)
		if response.resCode == GS_SUCCESS then
			if func then
				func(response.data)
			end

			if response.data.mapRank then
				for pointId, data in pairs(response.data.mapRank) do
					if self:getPointById(mapId, pointId) then
						self:getPointById(mapId, pointId):getPlayerInfo():sync(data)
					end
				end
			end
		end
	end)
end

function StagePracticeSystem:requestLevelStagePractice(mapId, pointId, func)
	local info = {
		mapId = mapId,
		pointId = pointId
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestLevelStagePractice(info, true, function (response)
		if response.resCode == GS_SUCCESS and func then
			func(response.data)
		end
	end)
end

function StagePracticeSystem:requestSaveStageTeam(pointId, herosdata, masterids, func)
	local info = {
		pointId = pointId,
		masterId = masterids,
		heros = herosdata
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestSaveStageTeam(info, true, function (response)
		if response.resCode == GS_SUCCESS and func then
			func()
		end
	end)
end

function StagePracticeSystem:requestStageBattleBefore(pointId, herosdata, masterids, func)
	local params = {
		pointId = pointId,
		masterId = masterids,
		heros = herosdata
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestStageBattleBefore(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			local pointId = params.pointId
			local playerData = response.data.playerData
			local stageSystem = self:getInjector():getInstance(StageSystem)
			local pointInstance = stageSystem:getPointById(pointId)

			self:enterStagePractice(playerData, pointId)

			if func then
				func()
			end
		end
	end)
end

function StagePracticeSystem:requestStageBattleAfter(pointId, resultData, func)
	local info = {
		pointId = pointId,
		resultData = resultData
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestStageBattleAfter(info, true, function (response)
		if response.resCode == GS_SUCCESS then
			local stageSystem = self:getInjector():getInstance(StageSystem)
			local point = stageSystem:getPointById(pointId)

			point:sync()

			if func then
				func(response.data)
			end
		end
	end)
end

function StagePracticeSystem:requestLeaveStagePoint(pointId, func)
	local info = {
		pointId = pointId
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestLeaveStagePoint(info, true, function (response)
		if response.resCode == GS_SUCCESS and func then
			func(response.data)
		end
	end)
end

function StagePracticeSystem:getStageDamage(id)
	local stageInfo = self._stagePractice:getMapById(id)
	local damage = stageInfo and stageInfo:getTotalProgressCount() or 0

	return damage
end

function StagePracticeSystem:enterBattle(playerData, pointId, mapData)
	local outSelf = self
	local battleDelegate = {}
	local isReplay = false
	local battleType = SettingBattleTypes.kPractice
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(battleType)
	local randomSeed = tonumber(tostring(os.time()):reverse():sub(1, 6))
	local battleSession = StagePracticeBattleSession:new({
		playerData = playerData,
		pointId = pointId,
		logicSeed = randomSeed
	})

	battleSession:buildAll()

	local battleData = battleSession:getPlayersData()
	local battleConfig = battleSession:getBattleConfig()
	local battleSimulator = battleSession:getBattleSimulator()
	local battleLogic = battleSimulator:getBattleLogic()
	local battlePassiveSkill = battleSession:getBattlePassiveSkill()

	if (not GameConfigs or not GameConfigs.closeGuide) and pointId == "PM01P10" then
		local guide = nil

		require("dm.gameplay.stage.guide.StageGuide")

		local storyDirector = self:getInjector():getInstance(story.StoryDirector)
		local guideSystem = self:getInjector():getInstance(GuideSystem)
		local guideAgent = storyDirector:getGuideAgent()
		local guideFile = "PracticeGuidePM01P10"
		local point = self:getPointById(mapData.mapId, mapData.pointId)
		local skipAllSta = guideAgent:isSaved("GUIDE_SKIP_ALL")
		local canPoint = true

		if point and point:getPassed() == 1 or skipAllSta then
			canPoint = false
		end

		if guideFile and guideFile ~= "" and canPoint then
			guide = require("dm.gameplay.stage.guide." .. guideFile)
		end

		if guide then
			guide:setInjector(self:getInjector())

			local guideLogic = GuideBattleLogic:new(bind1(guide.main, guide))

			guideLogic:attachBattleLogic(battleLogic)
			battleSimulator:setBattleLogic(guideLogic)
		end
	end

	local battleInterpreter = BattleInterpreter:new()

	battleInterpreter:setRecordsProvider(battleSession:getBattleRecordsProvider())

	local battleDirector = LocalBattleDirector:new()

	battleDirector:setBattleSimulator(battleSimulator)
	battleDirector:setBattleInterpreter(battleInterpreter)

	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		teams = battleSession:genTeamAiInfo(),
		mainPlayerId = {
			playerData.rid
		}
	}
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlockSpeed, tipsSpeed = systemKeeper:isUnlock("BattleSpeed")
	local speedOpenSta = systemKeeper:getBattleSpeedOpen("practice_battle")

	function battleDelegate:onLeavingBattle()
		local realData = battleSession and battleSession:getExitSummary()
		local data = {
			roundCount = 1,
			mapId = mapData.mapId,
			pointId = mapData.pointId,
			battleStatist = realData and realData.statist
		}

		outSelf:requestLevelStagePractice(mapData.mapId, mapData.pointId, function (response)
			outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, outSelf:getInjector():getInstance("StagePracticeLoseView"), {}, data, outSelf))
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
		callback(true)
	end

	function battleDelegate:onBattleFinish(result)
		dump(resultData, "onBattleFinish-resultData-训练本_____")

		local realData = battleSession:getResultSummary()

		outSelf:battleResultCallBack(realData, mapData)
	end

	function battleDelegate:onDevWin()
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
						unitsTotal = 3
					},
					[pointId] = {
						unitsDeath = 20,
						hpRatio = 0,
						unitsTotal = 20
					}
				}
			}
		}

		outSelf:battleResultCallBack(realData, mapData)
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

	local pointConfig = self:getPointConfigById(pointId)
	local bgRes = pointConfig.Background or "battle_scene_1"
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
			finalHitShow = true,
			mainView = "battlePlayer",
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			opPanelClazz = "BattleUIMediator",
			finalTaskFinishShow = true,
			battleSettingType = battleType,
			bulletTimeEnabled = BattleLoader:getBulletSetting("BulletTime_PVE_Training"),
			bgm = pointConfig.BGM,
			background = bgRes,
			refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
			battleSuppress = BattleDataHelper:getBattleSuppress(),
			hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting(),
			effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting(),
			passiveSkill = battlePassiveSkill,
			unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill"),
			finishWaitTime = BattleDataHelper:getBattleFinishWaitTime("practice_battle"),
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
					visible = false
				},
				auto = {
					visible = false
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
		loadingType = LoadingType.KStagePractice
	}

	BattleLoader:pushBattleView(self, data)
end

function StagePracticeSystem:enterStagePractice(playerData, pointId)
	local outSelf = self
	local battleDelegate = {}
	local isReplay = false
	local battleType = SettingBattleTypes.kPractice
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(battleType)
	local randomSeed = tonumber(tostring(os.time()):reverse():sub(1, 6))
	local battleSession = StagePracticeBattleSession:new({
		playerData = playerData,
		pointId = pointId,
		logicSeed = randomSeed
	})

	battleSession:buildAll()

	local battleData = battleSession:getPlayersData()
	local battleConfig = battleSession:getBattleConfig()
	local battleSimulator = battleSession:getBattleSimulator()
	local battleLogic = battleSimulator:getBattleLogic()
	local battlePassiveSkill = battleSession:getBattlePassiveSkill()

	if (not GameConfigs or not GameConfigs.closeGuide) and pointId == "P02S01" then
		local stageSystem = self:getInjector():getInstance(StageSystem)
		local point = stageSystem:getPointById(pointId)
		local storyDirector = self:getInjector():getInstance(story.StoryDirector)
		local guideAgent = storyDirector:getGuideAgent()
		local skipAllSta = guideAgent:isSaved("GUIDE_SKIP_ALL")

		if point and not point:isPass() and not skipAllSta then
			require("dm.gameplay.stage.guide.StageGuide")

			local guideSystem = self:getInjector():getInstance(GuideSystem)
			local guideFile = "PracticeGuide" .. tostring(pointId)

			if guideFile and guideFile ~= "" then
				local guide = require("dm.gameplay.stage.guide." .. guideFile)

				guide:setInjector(self:getInjector())

				local guideLogic = GuideBattleLogic:new(bind1(guide.main, guide))

				guideLogic:attachBattleLogic(battleLogic)
				battleSimulator:setBattleLogic(guideLogic)
			end
		end
	end

	local battleInterpreter = BattleInterpreter:new()

	battleInterpreter:setRecordsProvider(battleSession:getBattleRecordsProvider())

	local battleDirector = LocalBattleDirector:new()

	battleDirector:setBattleSimulator(battleSimulator)
	battleDirector:setBattleInterpreter(battleInterpreter)

	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		teams = battleSession:genTeamAiInfo(),
		mainPlayerId = {
			playerData.rid
		}
	}
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlockSpeed, tipsSpeed = systemKeeper:isUnlock("BattleSpeed")
	local speedOpenSta = systemKeeper:getBattleSpeedOpen("practice_battle")

	function battleDelegate:onLeavingBattle()
		local realData = battleSession and battleSession:getExitSummary()
		local data = {
			roundCount = 1,
			pointId = pointId,
			battleStatist = realData and realData.statist
		}

		outSelf:requestLeaveStagePoint(pointId, function (response)
			outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, outSelf:getInjector():getInstance("StagePracticeLoseView"), {}, data, outSelf))
		end)
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

	function battleDelegate:tryLeaving(callback)
		callback(true)
	end

	function battleDelegate:onBattleFinish(result)
		local realData = battleSession:getResultSummary()

		outSelf:requestStageBattleAfter(pointId, realData, function (response)
			if realData.result == 1 then
				response.pointId = pointId
				response.battleStatist = realData.statist

				outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, outSelf:getInjector():getInstance("StagePracticeWinView"), {}, response))
			else
				local loseData = {
					pointId = pointId,
					roundCount = realData.statist.roundCount,
					battleStatist = realData.statist
				}

				outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, outSelf:getInjector():getInstance("StagePracticeLoseView"), {}, loseData))
			end
		end, false)
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

	local pointConfig = ConfigReader:getRecordById("BlockPracticePoint", pointId)
	local bgRes = pointConfig.Background or "battle_scene_1"
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
			finalHitShow = true,
			mainView = "battlePlayer",
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			opPanelClazz = "BattleUIMediator",
			finalTaskFinishShow = true,
			battleSettingType = battleType,
			bulletTimeEnabled = BattleLoader:getBulletSetting("BulletTime_PVE_Training"),
			bgm = pointConfig.BGM,
			background = bgRes,
			refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
			hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting(),
			effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting(),
			passiveSkill = battlePassiveSkill,
			unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill"),
			finishWaitTime = BattleDataHelper:getBattleFinishWaitTime("practice_battle"),
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
					visible = false
				},
				auto = {
					visible = false
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
		loadingType = LoadingType.KStagePractice
	}

	BattleLoader:pushBattleView(self, data)
end

function StagePracticeSystem:getPointConfigById(pointId)
	return ConfigReader:getRecordById("StagePracticePoint", pointId)
end

function StagePracticeSystem:tryEnter()
	local unlock, tips, unLockLevel = self._systemKeeper:isUnlock("Stage_Practice")

	if unlock then
		local view = self:getInjector():getInstance("StagePracticeEnterView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil))
	else
		self:dispatch(ShowTipEvent({
			tip = tips
		}))
	end
end

function StagePracticeSystem:battleResultCallBack(realData, mapData)
	self:requestBattleAfter(mapData.mapId, mapData.pointId, realData, function (response)
		if realData.result == 1 then
			response.mapId = mapData.mapId
			response.pointId = mapData.pointId
			response.battleStatist = realData.statist

			local function endFunc()
				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, self:getInjector():getInstance("StagePracticeWinView"), {}, response, self))
			end

			local storyLink = ConfigReader:getDataByNameIdAndKey("BlockPoint", mapData.pointId, "StoryLink")
			local storynames = storyLink and storyLink.win
			local storyDirector = self:getInjector():getInstance(story.StoryDirector)
			local storyAgent = storyDirector:getStoryAgent()

			storyAgent:setSkipCheckSave(false)
			storyAgent:trigger(storynames, nil, endFunc)
		else
			local loseData = {
				mapId = mapData.mapId,
				pointId = mapData.pointId,
				roundCount = realData.statist.roundCount,
				battleStatist = realData.statist
			}

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, self:getInjector():getInstance("StagePracticeLoseView"), {}, loseData, self))
		end
	end, false)
end

function StagePracticeSystem:requestPass(mapId, pointId, resultData, callback, blockUI)
	local params = {
		mapId = mapId,
		pointId = pointId,
		resultData = resultData
	}
	local pointInfo = self:getPointById(mapId, pointId)

	pointInfo:recordOldStar()
	Bdump("requestPass:{}", params)
	self:requestBattleAfter(mapId, pointId, resultData, function (response)
		if response.resCode == GS_SUCCESS then
			if response.data.pointData then
				-- Nothing
			end

			self:dispatch(Event:new(EVT_STAGE_FIGHT_SUCC, {}))

			if callback then
				callback(response.data)
			end
		end
	end, blockUI)
end

function StagePracticeSystem:showResetDialog(mapId, pointId, teamData, supportData, func, resumeFunc)
	local outSelf = self
	local delegate = {
		willClose = function (self, popupMediator, data)
			if data.response == AlertResponse.kOK then
				outSelf:requestBattleBefore(mapId, pointId, teamData, supportData, func)
			elseif resumeFunc then
				resumeFunc()
			end
		end
	}
	local pointData = outSelf:getPointById(mapId, pointId)
	local cost = pointData:getCost()
	local data = {
		cost = cost
	}
	local view = self:getInjector():getInstance("StagePracticeResetTipsView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end

function StagePracticeSystem:requestGetMapRank(mapId, func)
	local info = {
		mapId = mapId
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestGetMapRank(info, true, function (response)
		if response.resCode == GS_SUCCESS then
			for pointId, data in pairs(response.data) do
				if self:getPointById(mapId, pointId) then
					self:getPointById(mapId, pointId):getPlayerInfo():sync(data)
				end
			end

			if func then
				func()
			end
		end
	end)
end

function StagePracticeSystem:requestGetMapFullStarReward(mapId, func)
	local info = {
		mapId = mapId
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestGetMapFullStarReward(info, true, function (response)
		if response.resCode == GS_SUCCESS then
			for pointId, data in pairs(response.data) do
				if self:getPointById(mapId, pointId) then
					self:getPointById(mapId, pointId):getPlayerInfo():sync(data)
				end
			end

			if func then
				func(response)
			end
		end
	end)
end

function StagePracticeSystem:requestEnterPracticeMain(mapId, func)
	local info = {
		mapId = mapId
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestEnterPracticeMain(info, true, function (response)
		if response.resCode == GS_SUCCESS and func then
			func(response)
		end
	end)
end

function StagePracticeSystem:requestPointComment(pointid, mapid, callback)
	local info = {
		mapId = mapid,
		pointId = pointid
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestPointComment(info, true, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback(response)
		end
	end)
end

function StagePracticeSystem:requestSupportPointComment(pointid, mapid, commentid, callback)
	local info = {
		mapId = mapid,
		pointId = pointid,
		commentId = commentid
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestSupportPointComment(info, true, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback(response)
		end
	end)
end

function StagePracticeSystem:requestPublishPointComment(pointid, mapid, contents, callback)
	local info = {
		mapId = mapid,
		pointId = pointid,
		content = contents
	}
	local stagePracticeService = self:getInjector():getInstance(StagePracticeService)

	stagePracticeService:requestPublishPointComment(info, true, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback(response)
		end
	end)
end

function StagePracticeSystem:getEnemyHeroById(id)
	if not self._enemyHeros then
		self._enemyHeros = StagePracticeEnemyHeroList:new(self._developSystem)
	end

	return self._enemyHeros:getEnemyHeroById(id)
end

function StagePracticeSystem:sortHeroes(list, type, order)
	if not self._enemyHeros then
		self._enemyHeros = StagePracticeEnemyHeroList:new(self._developSystem)
	end

	self._enemyHeros:sortHeroes(list, type, order)
end

function StagePracticeSystem:sortOnTeamPets(idList)
	if not self._enemyHeros then
		self._enemyHeros = StagePracticeEnemyHeroList:new(self._developSystem)
	end

	return self._enemyHeros:sortOnTeamPets(idList)
end

function StagePracticeSystem:getPointRewardConfig(pointid)
	local rewardid = ConfigReader:getDataByNameIdAndKey("StagePracticePoint", pointid, "PassReward")

	return ConfigReader:getDataByNameIdAndKey("Reward", rewardid, "Content")
end

function StagePracticeSystem:checkAwardRed()
	for k, v in pairs(self._stagePractice._list) do
		for kk, vv in pairs(v._pointArray) do
			if vv._firstPassState == SPracticeRewardState.kCanGet then
				return true
			end
		end
	end

	return false
end
