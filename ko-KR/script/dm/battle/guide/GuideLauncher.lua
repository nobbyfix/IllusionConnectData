local GuideLauncher = {
	enterGuideBattle = function (self, dispatcher, callback, guideBattle)
		local GuideBattle1 = require("dm.battle.guide." .. (guideBattle or "GuideBattle1"))
		local battleLogic = GuideBattleLogic:new(GuideBattle1)
		local battleSimulator = BattleSimulator:new()

		battleSimulator:setBattleLogic(battleLogic)

		local battleRecorder = BattleRecorder:new()

		battleSimulator:setBattleRecorder(battleRecorder)

		local battleInterpreter = BattleInterpreter:new()

		battleInterpreter:setRecordsProvider(battleRecorder)

		local battleDirector = LocalBattleDirector:new()

		battleDirector:setBattleInterpreter(battleInterpreter)
		battleDirector:setBattleSimulator(battleSimulator)

		local logicInfo = {
			director = battleDirector,
			interpreter = battleInterpreter,
			teams = {
				{
					players = {
						"player1"
					}
				},
				{
					players = {
						"player2"
					}
				}
			},
			mainPlayerId = {
				"player1"
			}
		}
		local battleDelegate = {
			onLeavingBattle = function (self, sender)
				BattleLoader:popGuideBattleView(dispatcher)

				if callback then
					callback()
				end
			end,
			onPauseBattle = function (self, continueCallback, leaveCallback)
			end,
			tryLeaving = function (self, callback)
				if callback then
					callback(true)
				end
			end,
			onSkipBattle = function (self)
			end,
			onBattleFinish = function (self, result)
				BattleLoader:popGuideBattleView(dispatcher)

				if callback then
					callback()
				end
			end,
			onDevWin = function (self, mainMediator)
				delayCallByTime(0, function ()
					mainMediator:stopScheduler()
					self:onBattleFinish()
				end)
			end
		}
		local bgRes = ConfigReader:getDataByNameIdAndKey("ConfigValue", "First_Battle_Scene", "content") or "battle_scene_1"
		local BGM = ConfigReader:getDataByNameIdAndKey("ConfigValue", "First_Battle_Music", "content")
		local data = {
			battleData = battleData,
			battleConfig = battleConfig,
			isReplay = isReplay,
			logicInfo = logicInfo,
			delegate = battleDelegate,
			viewConfig = {
				hpShow = 1,
				mainView = "battlePlayer",
				canChangeSpeedLevel = true,
				opPanelRes = "asset/ui/BattleUILayer.csb",
				opPanelClazz = "BattleUIMediator",
				bgm = BGM,
				background = bgRes,
				refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
				battleSuppress = BattleDataHelper:getBattleSuppress(),
				btnsShow = {
					speed = {
						visible = false
					},
					skip = {
						visible = false
					},
					auto = {
						enable = false,
						lock = true,
						visible = false
					},
					pause = {
						visible = false
					},
					restraint = {
						visible = false
					}
				}
			}
		}

		BattleLoader:pushBattleView(dispatcher, data, true)
	end
}

return GuideLauncher
