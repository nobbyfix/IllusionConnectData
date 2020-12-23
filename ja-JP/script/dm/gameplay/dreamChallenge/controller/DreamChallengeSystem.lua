DreamChallengeSystem = class("DreamChallengeSystem", legs.Actor)

DreamChallengeSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
DreamChallengeSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
DreamChallengeSystem:has("_service", {
	is = "r"
}):injectWith("DreamChallengeService")
DreamChallengeSystem:has("_dreamChallenge", {
	is = "r"
}):injectWith("DreamChallenge")
DreamChallengeSystem:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")

kDreamChallengeType = {
	kTwo = 2,
	kThree = 3,
	kOne = 1
}

function DreamChallengeSystem:initialize()
	super.initialize(self)
end

function DreamChallengeSystem:synchronize(data)
	self._dreamChallenge:synchronize(data)

	self._heroSystem = self._developSystem:getHeroSystem()
end

function DreamChallengeSystem:delete(data)
	self._dreamChallenge:delete(data)
end

function DreamChallengeSystem:tryEnter(data)
	data = data or {}

	local function enterDream()
		self:requestEnterUI(function (response)
			if response.resCode == GS_SUCCESS then
				self._dreamChallenge:synchronize(response.data)

				local view = self:getInjector():getInstance("DreamChallengeMainView")

				self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))
			end
		end)
	end

	local mapIds = self:getMapIds()

	for i = 1, #mapIds do
		local unLock = self:checkMapLock(mapIds[i])

		if unLock then
			AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
			enterDream()

			return
		end
	end

	local unlock, tips = self._systemKeeper:isUnlock("DreamChallenge")

	if not unlock then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = tips
		}))
	else
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
		enterDream()
	end
end

function DreamChallengeSystem:enterBattleTeam(mapId, pointId, battleId)
	local view = self:getInjector():getInstance("DreamChallengeTeamView")
	local team = self._developSystem:getSpTeamByType(StageTeamType.DREAM)

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		mapId = mapId,
		pointId = pointId,
		battleId = battleId,
		team = team,
		stageType = StageTeamType.DREAM
	}))
end

function DreamChallengeSystem:enterBattleEndUI(data, dreamId, mapId, pointId)
	local guideData = ConfigReader:getDataByNameIdAndKey("DreamChallengeBattle", pointId, "StoryLink")

	if guideData and guideData["end"] and data.pass then
		local function checkGuide(guideName)
			local storyDirector = self:getInjector():getInstance(story.StoryDirector)
			local guideAgent = storyDirector:getStoryAgent()

			guideAgent:setSkipCheckSave(false)
			guideAgent:trigger(guideName, nil, function ()
				local view = self:getInjector():getInstance("DreamChallengeBattleEndView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
					data = data,
					dreamId = dreamId,
					mapId = mapId,
					pointId = pointId
				}))
			end)
		end

		checkGuide(guideData["end"])
	else
		local view = self:getInjector():getInstance("DreamChallengeBattleEndView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
			data = data,
			dreamId = dreamId,
			mapId = mapId,
			pointId = pointId
		}))
	end
end

function DreamChallengeSystem:checkIsShowRedPoint()
	return self._dreamChallenge:checkRedPoint()
end

function DreamChallengeSystem:checkMapShow(mapId)
	local playerInfo = self._developSystem:getPlayer()
	local curTime = self._gameServerAgent:remoteTimeMillis() / 1000

	return self._dreamChallenge:checkMapShow(mapId, playerInfo, curTime)
end

function DreamChallengeSystem:checkMapLock(mapId)
	local playerInfo = self._developSystem:getPlayer()
	local curTime = self._gameServerAgent:remoteTimeMillis() / 1000

	return self._dreamChallenge:checkMapLock(mapId, playerInfo, curTime)
end

function DreamChallengeSystem:checkMapPass(mapId)
	return self._dreamChallenge:checkMapPass(mapId)
end

function DreamChallengeSystem:getFixedPointId(mapId)
	return self._dreamChallenge:getFixedPointId(mapId)
end

function DreamChallengeSystem:checkPointShow(mapId, pointId)
	local playerInfo = self._developSystem:getPlayer()
	local curTime = self._gameServerAgent:remoteTimeMillis()
	local ownHeros = self._heroSystem:getOwnHeroIds()

	return self._dreamChallenge:checkPointShow(mapId, pointId, playerInfo, curTime, ownHeros)
end

function DreamChallengeSystem:checkPointLock(mapId, pointId)
	local playerInfo = self._developSystem:getPlayer()
	local curTime = self._gameServerAgent:remoteTimeMillis()
	local ownHeros = self._heroSystem:getOwnHeroIds()

	return self._dreamChallenge:checkPointLock(mapId, pointId, playerInfo, curTime, ownHeros)
end

function DreamChallengeSystem:checkPointPass(mapId, pointId)
	return self._dreamChallenge:checkPointPass(mapId, pointId)
end

function DreamChallengeSystem:checkBattleLock(mapId, pointId, battleId)
	local playerInfo = self._developSystem:getPlayer()

	return self._dreamChallenge:checkBattleLock(mapId, pointId, battleId, playerInfo)
end

function DreamChallengeSystem:checkBattlePass(mapId, pointId, battleId)
	return self._dreamChallenge:checkBattlePass(mapId, pointId, battleId)
end

function DreamChallengeSystem:isBattleHasPass(mapId, pointId, battleId)
	return self._dreamChallenge:isBattleHasPass(mapId, pointId, battleId)
end

function DreamChallengeSystem:checkBattleRewarded(mapId, pointId, battleId)
	return self._dreamChallenge:checkBattleRewarded(mapId, pointId, battleId)
end

function DreamChallengeSystem:checkBattleRewardLock(mapId, pointId, battleId)
	return self._dreamChallenge:checkBattleRewardLock(mapId, pointId, battleId)
end

function DreamChallengeSystem:checkHeroTired(mapId, pointId, heroId)
	return self._dreamChallenge:checkHeroTired(mapId, pointId, heroId)
end

function DreamChallengeSystem:checkHeroLocked(mapId, pointId, heroId)
	local heroInfo = self._heroSystem:getHeroInfoById(heroId)

	return self._dreamChallenge:checkHeroLocked(mapId, pointId, heroInfo)
end

function DreamChallengeSystem:checkHeroRecomand(mapId, pointId, heroId)
	local heroInfo = self._heroSystem:getHeroInfoById(heroId)

	return self._dreamChallenge:checkHeroRecomand(mapId, pointId, heroInfo)
end

function DreamChallengeSystem:checkHeroFullStar(heroId)
	local heroInfo = self._heroSystem:getHeroInfoById(heroId)

	return heroInfo.maxStar <= heroInfo.star
end

function DreamChallengeSystem:checkHeroAwaken(heroId)
	local heroInfo = self._heroSystem:getHeroInfoById(heroId)

	return heroInfo.awakenLevel > 0
end

function DreamChallengeSystem:checkHeroExist(heroId)
	local ownHeros = self._heroSystem:getOwnHeroIds()

	for j = 1, #ownHeros do
		local id = ownHeros[j].id

		if id == heroId then
			return true
		end
	end

	return false
end

function DreamChallengeSystem:getMasterList(mapId, pointId)
	return self._dreamChallenge:getMasterList(mapId, pointId)
end

function DreamChallengeSystem:getPointFatigue(mapId, pointId)
	return self._dreamChallenge:getPointFatigue(mapId, pointId)
end

function DreamChallengeSystem:getPointFatigueByHeroId(mapId, pointId, heroId)
	return self._dreamChallenge:getPointFatigueByHeroId(mapId, pointId, heroId)
end

function DreamChallengeSystem:getRecomandMaster(mapId, pointId)
	return self._dreamChallenge:getRecomandMaster(mapId, pointId)
end

function DreamChallengeSystem:getRecomandHero(mapId, pointId)
	return self._dreamChallenge:getRecomandHero(mapId, pointId)
end

function DreamChallengeSystem:getRecomandParty(mapId, pointId)
	return self._dreamChallenge:getRecomandParty(mapId, pointId)
end

function DreamChallengeSystem:getRecomandJob(mapId, pointId)
	return self._dreamChallenge:getRecomandJob(mapId, pointId)
end

function DreamChallengeSystem:getRecomandTag(mapId, pointId)
	return self._dreamChallenge:getRecomandTag(mapId, pointId)
end

function DreamChallengeSystem:getPointScreen(mapId, pointId)
	return self._dreamChallenge:getPointScreen(mapId, pointId)
end

function DreamChallengeSystem:getMapName(mapId)
	return Strings:get(self._dreamChallenge:getMapName(mapId))
end

function DreamChallengeSystem:getMapTabImage(mapId)
	return self._dreamChallenge:getMapTabImage(mapId)
end

function DreamChallengeSystem:getPointName(pointId)
	local pointStr = ConfigReader:getDataByNameIdAndKey("DreamChallengePoint", pointId, "Name")

	return Strings:get(pointStr)
end

function DreamChallengeSystem:getPointPassDesc(pointId)
	local pointStr = ConfigReader:getDataByNameIdAndKey("DreamChallengePoint", pointId, "EndDesc")

	return Strings:get(pointStr)
end

function DreamChallengeSystem:getPointTabImage(mapId, pointId)
	return self._dreamChallenge:getPointTabImage(mapId, pointId)
end

function DreamChallengeSystem:getBattleName(battleId)
	local pointStr = ConfigReader:getDataByNameIdAndKey("DreamChallengeBattle", battleId, "Name")

	return Strings:get(pointStr)
end

function DreamChallengeSystem:getTeamBuffStr(battleId)
	local desc = ConfigReader:getDataByNameIdAndKey("DreamChallengeBattle", battleId, "BattleDesc")

	return desc
end

function DreamChallengeSystem:getTeamPetNumLimit(battleId)
	local num = ConfigReader:getDataByNameIdAndKey("DreamChallengeBattle", battleId, "BattleNumLimit")

	if num == nil or num == -1 then
		num = 10
	end

	return num
end

function DreamChallengeSystem:getBattleRewardBuff(battleId)
	local reward = ConfigReader:getDataByNameIdAndKey("DreamChallengeBattle", battleId, "reward")

	if reward and #reward > 0 then
		for i = 1, #reward do
			if reward[i] and (reward[i].Type == "OneTimeBuff" or reward[i].Type == "TimeBuff") then
				return reward[i]
			end
		end
	end

	return nil
end

function DreamChallengeSystem:getBattleTeam()
	return self._developSystem:getSpTeamByType(StageTeamType.DREAM)
end

function DreamChallengeSystem:getNpc(mapId, pointId, battleId)
	return self._dreamChallenge:getNpc(mapId, pointId, battleId)
end

function DreamChallengeSystem:getNpcForbidId(mapId, pointId, battleId)
	return self._dreamChallenge:getNpcForbidId(mapId, pointId, battleId)
end

function DreamChallengeSystem:getHeroInfo(heroId)
	local heroInfo = self._heroSystem:getHeroById(heroId)

	if not heroInfo then
		return nil
	end

	local heroData = {
		isNpc = false,
		id = heroInfo:getId(),
		heroId = heroId,
		level = heroInfo:getLevel(),
		star = heroInfo:getStar(),
		rareity = heroInfo:getRarity(),
		name = heroInfo:getName(),
		roleModel = heroInfo:getModel(),
		type = heroInfo:getType(),
		cost = heroInfo:getCost(),
		littleStar = heroInfo:getLittleStar(),
		combat = heroInfo:getCombat(),
		maxStar = heroInfo:getMaxStar(),
		awakenLevel = heroInfo:getAwakenStar()
	}

	return heroData
end

function DreamChallengeSystem:getMapStartAndEndTime(mapId)
	return self._dreamChallenge:getMapStartAndEndTime(mapId)
end

function DreamChallengeSystem:getNpcInfo(npcId)
	local npcInfo = ConfigReader:getRecordById("EnemyHero", npcId)

	if not npcInfo then
		return nil
	end

	local heroData = {
		awakenLevel = 0,
		isNpc = true,
		id = npcInfo.Id,
		level = npcInfo.Level,
		star = npcInfo.Star,
		rareity = npcInfo.Rarity,
		name = Strings:get(npcInfo.Name or "NPC"),
		roleModel = npcInfo.RoleModel,
		type = npcInfo.Type,
		cost = npcInfo.Cost,
		combat = npcInfo.Combat,
		maxStar = HeroStarCountMax
	}

	return heroData
end

function DreamChallengeSystem:sortHerosByType(heros, type, recomands)
	self._heroSystem:sortHeroes(heros, type, recomands)
end

function DreamChallengeSystem:getBattleIds(mapId, pointId)
	return self._dreamChallenge:getBattleIds(mapId, pointId)
end

function DreamChallengeSystem:getBattleBackground(mapId, pointId, battleId)
	return self._dreamChallenge:getBattleBackground(mapId, pointId, battleId)
end

function DreamChallengeSystem:getBattleReward(mapId, pointId, battleId)
	return self._dreamChallenge:getBattleReward(mapId, pointId, battleId)
end

function DreamChallengeSystem:getPointShowImg(mapId, pointId)
	return self._dreamChallenge:getPointShowImg(mapId, pointId)
end

function DreamChallengeSystem:getPointMapShowImg(mapId, pointId)
	return self._dreamChallenge:getPointMapShowImg(mapId, pointId)
end

function DreamChallengeSystem:getPointShowReward(mapId, pointId)
	return self._dreamChallenge:getPointShowReward(mapId, pointId)
end

function DreamChallengeSystem:getPointLongDesc(mapId, pointId)
	return self._dreamChallenge:getPointLongDesc(mapId, pointId)
end

function DreamChallengeSystem:getMapIds()
	return self._dreamChallenge:getMapIds()
end

function DreamChallengeSystem:getPointIds(mapId)
	return self._dreamChallenge:getPointIds(mapId)
end

function DreamChallengeSystem:getEndTime(mapId)
	return self._dreamChallenge:getEndTime(mapId)
end

function DreamChallengeSystem:getShortDesc(mapId, pointId)
	return self._dreamChallenge:getShortDesc(mapId, pointId)
end

function DreamChallengeSystem:getPointLockCond(mapId, pointId)
	return self._dreamChallenge:getPointLockCond(mapId, pointId)
end

function DreamChallengeSystem:getMapTimeDesc(mapId)
	return self._dreamChallenge:getMapTimeDesc(mapId)
end

function DreamChallengeSystem:getPointTimeDesc(pointId)
	return DataReader:getDataByNameIdAndKey("DreamChallengePoint", pointId, "PointDesc")
end

function DreamChallengeSystem:getFullStarSkill(mapId, pointId)
	return self._dreamChallenge:getFullStarSkill(mapId, pointId)
end

function DreamChallengeSystem:getAwakenSkill(mapId, pointId)
	return self._dreamChallenge:getAwakenSkill(mapId, pointId)
end

function DreamChallengeSystem:getBuffs(mapId, pointId)
	return self._dreamChallenge:getBuffs(mapId, pointId)
end

function DreamChallengeSystem:getMapBGM(mapId)
	return self._dreamChallenge:getMapBGM(mapId)
end

function DreamChallengeSystem:checkBuffLock(mapId, poindId, buffId)
	local buffs = self._dreamChallenge:getBuffs(mapId, poindId)

	if buffs[buffId] then
		return false
	end

	return true
end

function DreamChallengeSystem:checkBuffUsed(mapId, poindId, buffId)
	local buffs = self._dreamChallenge:getBuffs(mapId, poindId)

	if buffs[buffId] then
		local buff = buffs[buffId]

		if buff.buffType == "Buff" then
			return false
		end

		if buff.buffType == "OneTimeBuff" and (buff.duration == -1 or buff.duration > 0) then
			return false
		end

		if buff.buffType == "TimeBuff" then
			local curTime = self._gameServerAgent:remoteTimeMillis()

			if curTime < buff.time then
				return false
			end
		end

		return true
	end

	return false
end

function DreamChallengeSystem:enterBattle(serverData, serverPlayerData)
	local playerData = serverData.playerData
	local enemyData = serverData.enemyData
	local dreamId = serverData.pointId
	local mapId = serverData.dreamId
	local pointId = serverData.mapId
	local randomSeed = serverData.logicSeed
	local strategySeedA = serverData.strategySeedA
	local strategySeedB = serverData.strategySeedB
	local battleSettingType = SettingBattleTypes.kDreamStage
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(battleSettingType)
	local isReplay = false
	local unlock, tips = self._systemKeeper:isUnlock("AutoFight")

	if not unlock then
		isAuto = false
	end

	local outSelf = self
	local battleDelegate = {}
	local battleSession = DreamBattleSession:new({
		playerData = playerData,
		enemyData = enemyData,
		dreamId = dreamId,
		mapId = mapId,
		pointId = pointId,
		logicSeed = randomSeed,
		strategySeedA = strategySeedA,
		strategySeedB = strategySeedB
	}, serverPlayerData)

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
	local speedOpenSta = systemKeeper:getBattleSpeedOpen(battleSettingType)

	function battleDelegate:onAMStateChanged(sender, isAuto)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleSettingType, isAuto)
	end

	function battleDelegate:onLeavingBattle()
		local realData, reason = battleSession:getResultSummary()

		outSelf:requestFinishBattle(serverData.dreamId, serverData.mapId, serverData.pointId, realData, function ()
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
		local realData, reason = battleSession:getResultSummary()

		outSelf:requestFinishBattle(serverData.dreamId, serverData.mapId, serverData.pointId, realData, function ()
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

		outSelf:requestFinishBattle(serverData.dreamId, serverData.mapId, serverData.pointId, realData, function ()
		end)
	end

	function battleDelegate:onTimeScaleChanged(timeScale)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleSettingType, nil, timeScale)
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

	local pointConfig = ConfigReader:getRecordById("DreamChallengeBattle", dreamId)
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
			opPanelClazz = "BattleUIMediator",
			mainView = "DreamBattleView",
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			finalHitShow = true,
			finalTaskFinishShow = true,
			battleSettingType = battleSettingType,
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
					visible = false
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
		loadingType = LoadingType.kDream
	}

	BattleLoader:pushBattleView(self, data)
end

function DreamChallengeSystem:requestEnterUI(callback)
	self._service:requestEnterUI({}, true, callback)
end

function DreamChallengeSystem:requestEnterBattle(heros, masterId, dreamId, mapId, pointId, callback)
	local params = {
		heros = heros,
		masterId = masterId,
		dreamId = dreamId,
		mapId = mapId,
		pointId = pointId
	}

	self._service:requestEnterBattle(params, true, callback)
end

function DreamChallengeSystem:requestFinishBattle(dreamId, mapId, pointId, result, callback)
	local params = {
		dreamId = dreamId,
		mapId = mapId,
		pointId = pointId,
		battleResult = result
	}

	self._service:requestFinishBattle(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:enterBattleEndUI(response.data, dreamId, mapId, pointId)
		else
			self:dispatch(SceneEvent:new(EVT_SWITCH_SCENE, "mainScene", nil, ))
		end
	end)
end

function DreamChallengeSystem:requestLeaveBattle(callback)
	self._service:requestLeaveBattle({}, true, callback)
end

function DreamChallengeSystem:requestReceiveBox(dreamId, mapId, pointId, callback)
	local params = {
		dreamId = dreamId,
		mapId = mapId,
		pointId = pointId
	}

	self._service:requestReceiveBox(params, true, callback)
end

function DreamChallengeSystem:requestResetPoint(dreamId, mapId, callback)
	local params = {
		dreamId = dreamId,
		mapId = mapId
	}

	self._service:requestResetPoint(params, true, callback)
end
