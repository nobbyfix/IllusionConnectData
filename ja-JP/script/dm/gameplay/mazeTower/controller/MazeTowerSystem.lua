require("dm.gameplay.mazeTower.model.MazeTower")

EVT_MAZE_TOWER_MOVE_END = "EVT_MAZE_TOWER_MOVE_END"
EVT_MAZE_TOWER_REFRESH = "EVT_MAZE_TOWER_REFRESH"
EVT_MAZE_TOWER_GETREWARD = "EVT_MAZE_TOWER_GETREWARD"
MazeTowerSystem = class("MazeTowerSystem", legs.Actor)

MazeTowerSystem:has("_mazeTowerService", {
	is = "r"
}):injectWith("MazeTowerService")
MazeTowerSystem:has("_mazeTower", {
	is = "r"
})
MazeTowerSystem:has("_isReset", {
	is = "rw"
})

function MazeTowerSystem:initialize()
	super.initialize(self)

	self._mazeTower = MazeTower:new()
	self._isReset = false
end

function MazeTowerSystem:synchronize(data)
	self._mazeTower:synchronize(data)
	self:dispatch(Event:new(EVT_MAZE_TOWER_REFRESH))
end

function MazeTowerSystem:tryEnter()
	local function enterView()
		local view = self:getInjector():getInstance("MazeTowerMainView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {}))
	end

	if self._mazeTower:getCurPointId() == "" then
		self:requestMainInfo(function ()
			enterView()
		end)
	else
		enterView()
	end
end

function MazeTowerSystem:hasRedPoint()
	return self._mazeTower:hasRedPoint()
end

function MazeTowerSystem:getRecommendCombat(pointId)
	local pointNum = self._mazeTower:getTotalPointNum()
	local combat = 0
	local pointConfig = ConfigReader:getRecordById("MazeBlockBattle", pointId)
	local attrEffect = pointConfig.AttrEffect

	for k, v in pairs(attrEffect) do
		local effectConfig = ConfigReader:getRecordById("MazeAttrEffect", v)
		combat = combat + effectConfig.BasicCombat + pointNum * effectConfig.GrowthCombat
	end

	return combat
end

function MazeTowerSystem:requestMainInfo(callback)
	local params = {}

	self._mazeTowerService:requestMainInfo(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:synchronize(response.data)

			if callback then
				callback()
			end
		end
	end)
end

function MazeTowerSystem:requestMove(params, callback)
	self._mazeTowerService:requestMove(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._isReset = response.data.isReset

			self:dispatch(Event:new(EVT_MAZE_TOWER_MOVE_END, response.data))

			if callback then
				callback(response)
			end
		end
	end)
end

function MazeTowerSystem:requestFinishBattle(params, callback)
	self._mazeTowerService:requestFinishBattle(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self._isReset = response.data.isReset
			local view = self:getInjector():getInstance("MazeTowerFinishView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {}))
		end
	end)
end

function MazeTowerSystem:requestTaskReward(params, callback)
	self._mazeTowerService:requestTaskReward(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:synchronize(response.data)

			if callback then
				callback(response)
			end

			self:dispatch(Event:new(EVT_MAZE_TOWER_GETREWARD, response.data))
		end
	end)
end

function MazeTowerSystem:enterBattle(serverData, gridIndex)
	local battleType = SettingBattleTypes.kMazeTower
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(battleType)
	local isReplay = false
	local playerData = serverData.playerData
	local pointId = serverData.blockPointId
	local outSelf = self
	local battleDelegate = {}
	local battleSession = MazeTowerBattleSession:new(serverData)

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
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlockSpeed, tipsSpeed = systemKeeper:isUnlock("BattleSpeed")

	function battleDelegate:onAMStateChanged(sender, isAuto)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, isAuto)
	end

	function battleDelegate:onLeavingBattle()
		local realData = battleSession:getResultSummary()
		local params = {
			battleResult = realData,
			x = gridIndex.x,
			y = gridIndex.y
		}

		outSelf:requestFinishBattle(params)
	end

	function battleDelegate:onPauseBattle(continueCallback, leaveCallback)
		local popupDelegate = {
			willClose = function (self, sender, data)
				if data.response == AlertResponse.kOK then
					leaveCallback(true)
				else
					continueCallback(data.hpShow, data.effectShow)
				end
			end
		}
		local data = {
			title = Strings:get("Tip_Remind"),
			content = Strings:get("Maze_Tip_3"),
			sureBtn = {},
			cancelBtn = {}
		}
		local view = outSelf:getInjector():getInstance("AlertView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, popupDelegate))
	end

	function battleDelegate:tryLeaving(callback)
		callback(true)
	end

	function battleDelegate:onBattleFinish(result)
		local realData = battleSession:getResultSummary()
		local params = {
			battleResult = realData,
			x = gridIndex.x,
			y = gridIndex.y
		}

		outSelf:requestFinishBattle(params)
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

		outSelf:battleResultCallBack(realData)
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

	local pointConfig = ConfigReader:getRecordById("MazeBlockBattle", pointId)
	local bgRes = pointConfig.Background or "battle_scene_1"
	local BGM = pointConfig.BGM or ConfigReader:getDataByNameIdAndKey("ConfigValue", "Music_BattleBGM_Maze", "content")
	local battleSpeed_Display = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BattleSpeed_Display", "content")
	local battleSpeed_Actual = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BattleSpeed_Actual", "content")
	local data = {
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
			battleType = battleSession:getBattleType(),
			bulletTimeEnabled = BattleLoader:getBulletSetting("BulletTime_PVE_Tower"),
			bgm = BGM,
			background = bgRes,
			refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
			battleSuppress = BattleDataHelper:getBattleSuppress(),
			hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting(),
			effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting(),
			passiveSkill = battlePassiveSkill,
			unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill"),
			finishWaitTime = BattleDataHelper:getBattleFinishWaitTime("maze_battle"),
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
		loadingType = LoadingType.KMaze
	}

	BattleLoader:pushBattleView(self, data)
end

function MazeTowerSystem:battleResultCallBack()
end
