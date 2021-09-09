DreamHouseSystem = class("DreamHouseSystem", legs.Actor)

DreamHouseSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
DreamHouseSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
DreamHouseSystem:has("_service", {
	is = "r"
}):injectWith("DreamHouseService")
DreamHouseSystem:has("_dreamHouse", {
	is = "r"
}):injectWith("DreamHouse")
DreamHouseSystem:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")

EVT_POINT_REWARD_REFRESH = "EVT_POINT_REWARD_REFRESH"
EVT_POINT_REFRESH_NEXT = "EVT_POINT_REFRESH_NEXT"
EVT_HOUSE_MAIN_REFRESH = "EVT_HOUSE_MAIN_REFRESH"

function DreamHouseSystem:initialize()
	super.initialize(self)
end

function DreamHouseSystem:synchronize(data)
	self._dreamHouse:synchronize(data)
end

function DreamHouseSystem:delete(data)
	self._dreamHouse:delete(data)
end

function DreamHouseSystem:tryEnter(data)
	self:updateHouse(function (response)
		if response.resCode == 0 then
			local view = self:getInjector():getInstance("DreamHouseMainView")

			self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {}))
		end
	end)
end

function DreamHouseSystem:enterDreamHouseDetail(mapId)
	local view = self:getInjector():getInstance("DreamHouseDetailView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		mapId = mapId
	}))
end

function DreamHouseSystem:enterDreamHouseStarReward(mapId, pointId, idx)
	local mapInfo = self:getMapById(mapId)
	local pointInfo = mapInfo:getPointById(pointId)
	local starBoxReward = ConfigReader:getDataByNameIdAndKey("DreamHousePoint", pointId, "StarReward")
	local boxStarNums = ConfigReader:getDataByNameIdAndKey("DreamHousePoint", pointId, "StarNum")
	local boxNum = #starBoxReward
	local boxIndex = idx
	local curStarNum = pointInfo and pointInfo:getTotalStar() or 0

	local function requestRewardSuc(data)
		self:dispatch(Event:new(EVT_POINT_REWARD_REFRESH))

		local view = self:getInjector():getInstance("getRewardView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			maskOpacity = 0
		}, {
			rewards = data
		}))
	end

	local data = {
		type = StageRewardType.kStarBox,
		rewardId = starBoxReward[boxIndex],
		extra = {}
	}

	if boxStarNums[boxIndex] <= curStarNum then
		if pointInfo and pointInfo:isBosRewarded(boxStarNums[boxIndex]) then
			data.state = StageBoxState.kHasReceived
		else
			self:requestReceiveBox(mapId, pointId, boxIndex - 1, function (data)
				if data.resCode == 0 then
					requestRewardSuc(data.data.rewards)
				end
			end)

			return
		end
	else
		data.state = StageBoxState.kCannotReceive
	end

	data.extra[1] = curStarNum
	data.extra[2] = boxStarNums[boxIndex]

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, self:getInjector():getInstance("StageShowRewardView"), {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, self))
end

function DreamHouseSystem:enterDreamHouseTeam(mapId, pointId, battleId)
	local view = self:getInjector():getInstance("DreamHouseTeamView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		mapId = mapId,
		pointId = pointId,
		battleId = battleId,
		team = self._developSystem:getSpTeamByType(StageTeamType.HOUSE)
	}))
end

function DreamHouseSystem:enterBattle(serverData, serverPlayerData)
	local playerData = serverData.playerData
	local enemyData = serverData.enemyData
	local battleId = serverData.battleId
	local mapId = serverData.mapId
	local pointId = serverData.pointId
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
	local battleSession = HouseBattleSession:new({
		playerData = playerData,
		enemyData = enemyData,
		battleId = battleId,
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

		outSelf:leaveBattle(serverData.battleId, serverData.mapId, serverData.pointId)
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

		outSelf:requestFinishBattle(serverData.battleId, serverData.mapId, serverData.pointId, realData, function (response)
			outSelf:dispatch(Event:new(EVT_HOUSE_MAIN_REFRESH, {
				mapId = serverData.mapId
			}))
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

		outSelf:requestFinishBattle(serverData.battleId, serverData.mapId, serverData.pointId, realData, function ()
			outSelf:dispatch(Event:new(EVT_HOUSE_MAIN_REFRESH, {
				mapId = serverData.mapId
			}))
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

	local pointConfig = ConfigReader:getRecordById("DreamHouseBattle", battleId)
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

function DreamHouseSystem:enterBattleEndUI(data, mapId, pointId, battleId)
	local view = self:getInjector():getInstance("DreamHouseBattleEndView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		data = data,
		battleId = battleId,
		mapId = mapId,
		pointId = pointId
	}))
end

function DreamHouseSystem:enterDreamHousePass(mapId, pointId, keyStr)
	local view = self:getInjector():getInstance("DreamHousePassView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		maskOpacity = 90
	}, {
		mapId = mapId,
		pointId = pointId,
		keyStr = keyStr
	}))
end

function DreamHouseSystem:checkEnabled()
	local unlock, tips = self._systemKeeper:isUnlock("DreamHouseUnlockParm")

	return unlock, tips
end

function DreamHouseSystem:getHouse()
	return self._dreamHouse
end

function DreamHouseSystem:getHouseMaps()
	local out = {}
	local heroSystem = self._developSystem:getHeroSystem()
	local allIds = self._dreamHouse:getMapIds()

	for i = 1, #allIds do
		local isShow = false
		local hasNum = 0
		local data = self:getMapById(allIds[i])
		local heroIds = data:getMapConfig().HeroId

		for j = 1, #heroIds do
			if heroSystem:hasHero(heroIds[j]) then
				hasNum = hasNum + 1
			end
		end

		local limitNum = tonumber(ConfigReader:getDataByNameIdAndKey("ConfigValue", "DreamHouseViewNum", "content"))

		if limitNum <= hasNum then
			isShow = true
		end

		if isShow then
			table.insert(out, allIds[i])
		end
	end

	return out
end

function DreamHouseSystem:getMapById(id)
	return self._dreamHouse:getMapById(id)
end

function DreamHouseSystem:checkIsShowRedPoint()
	if CommonUtils.GetSwitch("fn_train_dreamhouse") then
		local mapIds = self:getHouseMaps()

		for i = 1, #mapIds do
			local mapId = mapIds[i]
			local mapData = self:getMapById(mapId)
			local pointIds = mapData:getPointIds()

			for j = 1, #pointIds do
				local pointId = pointIds[j]
				local pointData = mapData:getPointById(pointId)

				if pointData:isHasRedPoint() then
					return true
				end
			end
		end

		for i = 1, #mapIds do
			local mapId = mapIds[i]
			local mapData = self:getMapById(mapId)

			if not mapData:isLock() and not self._dreamHouse:isMapRewardGet(mapId) then
				return true
			end
		end
	end

	return false
end

function DreamHouseSystem:checkIsShowRedPointByMap(mapId)
	local mapData = self:getMapById(mapId)
	local pointIds = mapData:getPointIds()

	for j = 1, #pointIds do
		local pointId = pointIds[j]
		local pointData = mapData:getPointById(pointId)

		if pointData:isHasRedPoint() then
			return true
		end
	end

	return false
end

function DreamHouseSystem:checkHeroTired(mapId, pointId, heroId)
	local mapData = self._dreamHouse:getMapById(mapId)
	local pointData = mapData:getPointById(pointId)
	local fatigue = pointData:getFatigue()

	for id, count in pairs(fatigue) do
		if id == heroId and count <= 0 then
			return true
		end
	end

	return false
end

function DreamHouseSystem:getPointFatigue()
	return tonumber(ConfigReader:getDataByNameIdAndKey("ConfigValue", "DreamHouseHeroBattleNum", "content"))
end

function DreamHouseSystem:getPointFatigueByHeroId(mapId, pointId, heroId)
	local mapData = self._dreamHouse:getMapById(mapId)
	local pointData = mapData:getPointById(pointId)
	local fatigue = pointData:getFatigue()

	for id, count in pairs(fatigue) do
		if id == heroId and count <= 0 then
			return 1
		end
	end

	return 0
end

function DreamHouseSystem:getTeamBuffStr(battleId)
	local out = ""
	local buffAdd = ConfigReader:getDataByNameIdAndKey("DreamHouseBattle", battleId, "BuffEffect")
	local titleArray = ConfigReader:getDataByNameIdAndKey("ConfigValue", "HeroPartyName", "content")
	local buffNum = 0

	for k, v in pairs(buffAdd) do
		for key, value in pairs(v) do
			buffNum = buffNum + 1
		end
	end

	local i = 0

	for k, v in pairs(buffAdd) do
		for key, value in pairs(v) do
			i = i + 1
			local preStr = ""

			if k == "camp" then
				preStr = Strings:get(titleArray[key]) .. Strings:get("DreamHouse_Main_UI33")
			elseif k == "profession" then
				preStr = Strings:get(titleArray[key]) .. Strings:get("DreamHouse_Main_UI34")
			elseif k == "hero" then
				preStr = Strings:get(ConfigReader:getDataByNameIdAndKey("HeroBase", key, "Name"))
			end

			local skillId = value[1]
			local effectConfig = ConfigReader:getRecordById("Skill", skillId)

			if effectConfig and i < buffNum then
				out = out .. preStr .. Strings:get(effectConfig.Desc_short) .. Strings:get("DreamHouse_Main_UI35")
			else
				out = out .. preStr .. Strings:get(effectConfig.Desc_short)
			end
		end
	end

	return out
end

function DreamHouseSystem:checkHeroRecomand(battleId, heroId)
	local config = ConfigReader:getDataByNameIdAndKey("DreamHouseBattle", battleId, "BuffEffect")
	local heroSystem = self._developSystem:getHeroSystem()
	local heroInfo = heroSystem:getHeroInfoById(heroId)

	for key, value in pairs(config) do
		if key == "camp" then
			for k, v in pairs(value) do
				if k == heroInfo.party then
					return true
				end
			end
		end

		if key == "hero" then
			for k, v in pairs(value) do
				if k == heroInfo.id then
					return true
				end
			end
		end

		if key == "profession" then
			for k, v in pairs(value) do
				if k == heroInfo.type then
					return true
				end
			end
		end
	end

	return false
end

function DreamHouseSystem:updateHouse(callback)
	local params = {}

	self._service:updateHouse(params, true, callback)
end

function DreamHouseSystem:requestReceiveBox(mapId, pointId, index, callback)
	local params = {
		mapId = mapId,
		pointId = pointId,
		index = index
	}

	self._service:requestReceiveBox(params, true, callback)
end

function DreamHouseSystem:resetDreamHouse(mapId, pointId, callback)
	local params = {
		mapId = mapId,
		pointId = pointId
	}

	self._service:requestResetPoint(params, true, callback)
end

function DreamHouseSystem:requestMapReward(mapId, callback)
	local params = {
		mapId = mapId
	}

	self._service:requestMapReward(params, true, callback)
end

function DreamHouseSystem:requestEnterBattle(heros, masterId, mapId, pointId, battleId, callback)
	local params = {
		heros = heros,
		masterId = masterId,
		mapId = mapId,
		pointId = pointId,
		battleId = battleId
	}

	self._service:requestEnterBattle(params, true, callback)
end

function DreamHouseSystem:requestFinishBattle(battleId, mapId, pointId, battleResult)
	local params = {
		mapId = mapId,
		pointId = pointId,
		battleId = battleId,
		battleResult = battleResult
	}

	self._service:requestFinishBattle(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:enterBattleEndUI(response.data, mapId, pointId, battleId)
		end
	end)
end

function DreamHouseSystem:leaveBattle(battleId, mapId, pointId)
	local params = {}

	self._service:leaveBattle(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:enterBattleEndUI(response.data, mapId, pointId, battleId)
		end
	end)
end

function DreamHouseSystem:save(str)
	if type(str) ~= "string" then
		return
	end

	local customDataSystem = self:getInjector():getInstance("CustomDataSystem")

	customDataSystem:setValue(PrefixType.kGlobal, str, true)
end

function DreamHouseSystem:isSaved(str)
	if type(str) ~= "string" then
		return
	end

	local customDataSystem = self:getInjector():getInstance("CustomDataSystem")

	return customDataSystem:getValue(PrefixType.kGlobal, str, false)
end

function DreamHouseSystem:getPointStarDesc(cond)
	local starLang = ConfigReader:getDataByNameIdAndKey("ConfigValue", "DreamHouse_StarTrans", "content")

	for type, value in pairs(cond) do
		if type == "win" then
			return Strings:get(starLang[type])
		elseif type == "usedHero" or type == "killBossHero" then
			local name = Strings:get(ConfigReader:getDataByNameIdAndKey("HeroBase", value, "Name"))

			return Strings:get(starLang[type], {
				num = name
			})
		elseif type == "killCount" then
			local heroId = ""
			local count = 0

			for k, v in pairs(value) do
				heroId = k
				count = v
			end

			local name = Strings:get(ConfigReader:getDataByNameIdAndKey("HeroBase", heroId, "Name"))

			return Strings:get(starLang[type], {
				num = name,
				num1 = count
			})
		elseif type == "occupationCount" then
			local jobType = ""
			local count = 0
			local attrName = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Hero_SkillAttrName", "content")

			for k, v in pairs(value) do
				jobType = k
				count = v
			end

			local name = Strings:get(attrName[jobType])

			return Strings:get(starLang[type], {
				num = name,
				num1 = count
			})
		end
	end

	return ""
end

function DreamHouseSystem:getPointRecomandTeam(cond)
	local team = {}

	for i = 1, #cond do
		for type, value in pairs(cond[i]) do
			if type == "usedHero" or type == "killBossHero" then
				table.insert(team, value)
			elseif type == "killCount" then
				local heroId = ""
				local count = 0

				for k, v in pairs(value) do
					heroId = k
					count = v
				end

				local name = Strings:get(ConfigReader:getDataByNameIdAndKey("HeroBase", heroId, "Name"))

				table.insert(team, heroId)
			elseif type == "occupationCount" then
				-- Nothing
			end
		end
	end

	return team
end
