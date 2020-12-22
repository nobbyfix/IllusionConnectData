AutoBattle = class("AutoBattle", DebugViewTemplate, _M)

function AutoBattle:initialize()
	self._viewConfig = {
		{
			name = "result",
			_selectBoxShow = true,
			type = "SelectBox",
			title = "自动闯关",
			_selectBoxAutoHide = false,
			selectHandler = function (selectStr)
				local ret = {}

				table.insert(ret, {
					"1",
					"普通副本"
				})
				table.insert(ret, {
					"2",
					"精英副本"
				})
				table.insert(ret, {
					"3",
					"试炼经验副本"
				})
				table.insert(ret, {
					"4",
					"试炼金币副本"
				})
				table.insert(ret, {
					"5",
					"试炼水晶副本"
				})
				table.insert(ret, {
					"6",
					"远征副本"
				})

				return ret
			end
		}
	}
end

function AutoBattle:onClick(data)
	self._isAutoStop = false
	local mText = self._viewConfig[1].mtext

	if tostring(mText) == "1" then
		self:_startStage(true)
	elseif tostring(mText) == "2" then
		self:_startStage(false)
	elseif tostring(mText) == "3" then
		self:_startTrial(SpStageType.kExp, "StageSp_Exp", SettingBattleTypes.kSpStage_exp)
	elseif tostring(mText) == "4" then
		self:_startTrial(SpStageType.kGold, "StageSp_Gold", SettingBattleTypes.kSpStage_gold)
	elseif tostring(mText) == "5" then
		self:_startTrial(SpStageType.kCrystal, "StageSp_Crystal", SettingBattleTypes.kSpStage_crystal)
	elseif tostring(mText) == "6" then
		self:_startCrusade()
	elseif tostring(mText) == "7" then
		-- Nothing
	elseif tostring(mText) == "8" then
		-- Nothing
	elseif tostring(mText) == "9" then
		-- Nothing
	end
end

function AutoBattle:_startStage(isNormal)
	local stageType = isNormal and StageType.kNormal or StageType.kElite
	local stageSystem = self:getInjector():getInstance(StageSystem)
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local this = self

	local function getNextPointData()
		local data = {}
		local mapList = stageSystem:getChapterListInfo(stageType)

		for _, map in ipairs(mapList) do
			if not map:isBattlePointPass() then
				local passCount = map:getPassPointCount()

				dump({
					passCount
				}, "startBattle ---")

				local point = map:getPointByIndex(passCount + 1)
				data.mapId = map:getId()
				data.pointId = point:getId()

				dump({
					passCount,
					data
				}, "ddddddddddddd")

				break
			end
		end

		return data
	end

	local function startNextPoint()
		local pointData = getNextPointData()
		local delegate = {}

		function delegate:onLeavingBattle(battleSession)
			local realData = battleSession:getExitSummary()
			local data = {
				roundCount = 1,
				mapId = pointData.mapId,
				pointId = pointData.pointId,
				battleStatist = realData.statist.players
			}

			stageSystem:requestLeaveStage(pointData.mapId, pointData.pointId, function (response)
				BattleLoader:popBattleView(nil, {
					viewName = "homeView"
				})
			end)
		end

		function delegate:onBattleStart(sender, event)
			BattleStoryExtension:new(pointData.pointId, event)
		end

		function delegate:onBattleFinish(realData)
			self._isAutoStop = true

			local function winCallBack()
				self._isAutoStop = false

				stageSystem:requestStageProgress(function ()
					startNextPoint()
				end, false)
			end

			stageSystem:battleResultCallBack(realData, pointData, nil, winCallBack)
		end

		function delegate:onDevWin()
		end

		local function getTeamByPointType()
			if stageType == StageType.kNormal then
				return StageTeamType.STAGE_NORMAL
			else
				return StageTeamType.STAGE_ELITE
			end
		end

		local pointConfig = ConfigReader:getRecordById("BlockPoint", pointData.pointId)
		local enterData = {
			battleType = isNormal and SettingBattleTypes.kNormalStage or SettingBattleTypes.kEliteStage,
			BGM = pointConfig.BGM,
			bgRes = pointConfig.Background
		}
		enterData.speed = enterData.battleType
		enterData.changeMaxNum = ConfigReader:getDataByNameIdAndKey("BlockPoint", pointData.pointId, "BossRound")
		enterData.loadingType = isNormal and LoadingType.KStageNormal or LoadingType.KStageElite
		local _teamType = getTeamByPointType()
		local team = developSystem:getTeamByType(_teamType)

		stageSystem:setBattleTeamInfo(team)
		stageSystem:requestStageEnter(pointData, function (rsdata)
			local serverData = rsdata
			serverData.pointId = pointData.pointId
			enterData.serverData = serverData

			this:_startBattle(StageBattleSession, enterData, delegate)
		end, true)
	end

	startNextPoint()
end

function AutoBattle:_startTrial(stageType, stageId, battleSettingType)
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local spStageSystem = self:getInjector():getInstance(SpStageSystem)
	local this = self

	local function getNextPointData()
		local curIndex = spStageSystem:getMaxDftStage(stageId)
		local config = spStageSystem:getPointConfigByType(stageType)
		local data = {}
		local teamList = developSystem:getAllUnlockTeams()
		local curTeam = teamList[1]
		local masterId = curTeam:getMasterId()
		local heros = {}

		for k, v in pairs(curTeam:getHeroes()) do
			table.insert(heros, {
				id = v
			})
		end

		local params = {
			spType = spStageSystem:getStageTypeById(stageId),
			pointId = config[curIndex].Id,
			stageId = stageId,
			heros = heros,
			masterId = masterId
		}

		return params
	end

	local function startNextPoint()
		local pointData = getNextPointData()
		local delegate = {
			onLeavingBattle = function (self, battleSession)
				local data = {
					spType = pointData.spType,
					pointId = pointData.pointId
				}

				spStageSystem:requestLeaveStage(data, function ()
					BattleLoader:popBattleView(spStageSystem, {
						viewName = "homeView"
					})
				end)
			end,
			onBattleStart = function (self, sender, event)
			end,
			onBattleFinish = function (self, realData, enterData)
				local function callBack()
					if not this._isAutoStop then
						startNextPoint()
					end
				end

				local data = {
					pointId = pointData.pointId,
					lastScore = enterData.lastScore,
					resultData = realData
				}

				spStageSystem:requestFinishSpStage(data, pointData.spType, true, callBack)
			end
		}
		local enemyIconDict = {
			crystal = "asset/common/zd_yslc.png",
			gold = "asset/common/zd_ctxs.png",
			exp = "asset/common/zd_tttx.png"
		}
		local dropIconDict = {
			crystal = "crystal",
			gold = "gold",
			exp = "exp"
		}
		local pointConfig = ConfigReader:getRecordById("BlockSpPoint", pointData.pointId)
		local enterData = {
			battleType = battleSettingType,
			BGM = pointConfig.BGM,
			bgRes = pointConfig.Background,
			speed = pointData.spType,
			loadingType = SpStageLoadingType[pointData.spType],
			showEscape = pointData.spType == "gold",
			enemyIcon = enemyIconDict[pointData.spType],
			dropIcon = dropIconDict[pointData.spType]
		}

		if pointData.spType == SpStageType.kCrystal then
			local eupipInfo = {}
			local playerCard = pointConfig.PlayerCard
			local eupipFormation = ConfigReader:getDataByNameIdAndKey("EnemyCard", playerCard, "FirstFormation")
			eupipInfo.formation = eupipFormation
			enterData.eupipInfo = eupipInfo
		end

		spStageSystem:getSpStageService():requestEnterSpStage(pointData, function (response)
			if response.resCode == GS_SUCCESS then
				local serverData = response.data
				serverData.pointId = pointData.pointId
				enterData.serverData = serverData
				enterData.lastScore = spStageSystem:getStageDamage(pointData.stageId)

				this:_startBattle(SpStageBattleSession, enterData, delegate)
			end
		end)
	end

	startNextPoint()
end

function AutoBattle:_startCrusade()
	local this = self
	local crusadeSystem = self:getInjector():getInstance(CrusadeSystem)

	local function getNextPointData()
	end

	local function startNextPoint()
		local pointData = getNextPointData()
		local delegate = {
			onLeavingBattle = function (self, battleSession)
				crusadeSystem:requestLeaveBattle(function (data)
					BattleLoader:popBattleView(nil, {
						viewName = "homeView"
					})
				end)
			end,
			onBattleStart = function (self, sender, event)
			end
		}

		function delegate:onBattleFinish(realData, enterData)
			local function callback(battleReport)
				if battleReport.pass then
					if not this._isAutoStop then
						startNextPoint()
					end
				else
					local loseData = {
						viewType = "crusade",
						battleStatist = battleReport.statist.players
					}

					crusadeSystem:dispatch(ViewEvent:new(EVT_SHOW_POPUP, crusadeSystem:getInjector():getInstance("StageLosePopView"), {}, loseData, self))
				end
			end

			crusadeSystem:requestFinishBattle(realData, callback)
		end

		local crusadePointModel = crusadeSystem:getCurCrusadePointModel()
		local enterData = {
			battleType = SettingBattleTypes.kCrusade,
			BGM = crusadePointModel:getBGM(),
			bgRes = crusadePointModel:getBackground(),
			speed = "crusade",
			loadingType = LoadingType.KCrusade
		}

		crusadeSystem:getCrusadeService():requestBeginBattle(nil, true, function (response)
			if response.resCode == GS_SUCCESS then
				enterData.serverData = response.data
				enterData.changeMaxNum = ConfigReader:getDataByNameIdAndKey("CrusadePoint", response.data.blockPointId, "BossRound")

				this:_startBattle(CrusadeBattleSession, enterData, delegate)
			end
		end)
	end

	startNextPoint()
end

function AutoBattle:_startBattle(sessionClass, enterData, outDelegate)
	local isReplay = false
	local battleType = enterData.battleType
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(battleType)
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlock, tips = systemKeeper:isUnlock("AutoFight")

	if not unlock then
		isAuto = false
	end

	local outSelf = self
	local battleDelegate = {}
	local randomSeed = tonumber(tostring(os.time()):reverse():sub(1, 6))
	enterData.serverData.logicSeed = randomSeed
	local battleSession = sessionClass:new(enterData.serverData)

	battleSession:buildAll()

	local battleData = battleSession:getPlayersData()
	local battleConfig = battleSession:getBattleConfig()
	local battleSimulator = battleSession:getBattleSimulator()
	local battleLogic = battleSimulator:getBattleLogic()
	local battlePassiveSkill = battleSession:getBattlePassiveSkill()
	local battleInterpreter = BattleInterpreter:new()

	battleInterpreter:setRecordsProvider(battleSession:getBattleRecordsProvider())

	local battleDirector = LocalBattleDirector:new()

	battleDirector:setBattleSimulator(battleSimulator)
	battleDirector:setBattleInterpreter(battleInterpreter)

	local unlockSpeed, tipsSpeed = systemKeeper:isUnlock("BattleSpeed")
	local speedOpenSta = systemKeeper:getBattleSpeedOpen(enterData.speed)

	dump({
		speedOpenSta,
		self:getInjector():getInstance(SystemKeeper):canShow("BattleSpeed")
	}, "aaaaaaaa")

	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		teams = battleSession:genTeamAiInfo(),
		mainPlayerId = {
			enterData.serverData.playerData.rid
		}
	}

	function battleDelegate:onAMStateChanged(sender, isAuto)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, isAuto)
	end

	function battleDelegate:onLeavingBattle()
		if outDelegate.onLeavingBattle then
			outDelegate:onLeavingBattle(battleSession)
		end
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

	function battleDelegate:onBattleStart(sender, event)
		if outDelegate.onBattleStart then
			outDelegate:onBattleStart(sender, event)
		end
	end

	function battleDelegate:tryLeaving(callback)
		callback(true)
	end

	function battleDelegate:onBattleFinish(result)
		if outDelegate.onBattleFinish then
			outDelegate:onBattleFinish(battleSession:getResultSummary(), enterData)
		end
	end

	function battleDelegate:onDevWin()
		if outDelegate.onDevWin then
			outDelegate:onDevWin()
		end
	end

	function battleDelegate:onTimeScaleChanged(timeScale)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, nil, timeScale)
	end

	function battleDelegate:showHero(heroBaseId, pauseFunc, resumeCallback)
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
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			finalTaskFinishShow = true,
			showEscape = enterData.showEscape,
			enemyIcon = enterData.enemyIcon,
			dropIcon = enterData.dropIcon,
			battleSettingType = battleType,
			bulletTimeEnabled = BattleLoader:getBulletSetting("BulletTime_PVE_Main"),
			bgm = enterData.BGM or {
				"Mus_Battle_Danger",
				"",
				""
			},
			mainView = enterData.mainView or "battlePlayer",
			opPanelClazz = enterData.opPanelClazz or "BattleUIMediator",
			background = enterData.bgRes or "Battle_Scene_1",
			eupipInfo = enterData.eupipInfo,
			refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
			hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting(),
			effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting(),
			battleSuppress = BattleDataHelper:getBattleSuppress(),
			passiveSkill = battlePassiveSkill,
			unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill"),
			finishWaitTime = BattleDataHelper:getBattleFinishWaitTime(battleType),
			changeMaxNum = enterData.changeMaxNum or 1,
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
		loadingType = enterData.loadingType or LoadingType.KStageNormal
	}

	BattleLoader:pushBattleView(self, data)
end
