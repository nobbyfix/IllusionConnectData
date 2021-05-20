require("dm.gameplay.miniGame.MiniGameConfig")
require("dm.gameplay.miniGame.controller.DartsSystem")

MiniGameSystem = class("MiniGameSystem", legs.Actor)

MiniGameSystem:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")
MiniGameSystem:has("_activityService", {
	is = "r"
}):injectWith("ActivityService")
MiniGameSystem:has("_miniGameService", {
	is = "r"
}):injectWith("MiniGameService")
MiniGameSystem:has("_rankSystem", {
	is = "r"
}):injectWith("RankSystem")
MiniGameSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
MiniGameSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
MiniGameSystem:has("_clubSystem", {
	is = "r"
}):injectWith("ClubSystem")
MiniGameSystem:has("_gameServerAgent", {
	is = "r"
}):injectWith("GameServerAgent")
MiniGameSystem:has("_rotation", {
	is = "rw"
})
MiniGameSystem:has("_dartsSystem", {
	is = "r"
})

local miniGameStageFunc = {}
local miniGameActivityFunc = {
	[MiniGameType.kDarts] = function (sys, pointId)
		sys:getDartsSystem():tryEnterByActivity(pointId)
	end
}
local miniGameClubFunc = {}

function MiniGameSystem:inintRotation()
	self._rotation = false
end

function MiniGameSystem:initialize()
	super.initialize(self)
	self:inintRotation()
	self:initSystem()
end

function MiniGameSystem:syncDispatch()
	self:dispatch(Event:new(EVT_CLUB_PUSHREDPOINT_SUCC))
end

function MiniGameSystem:userInject(injector)
	injector:injectInto(self._rankSystem)
	injector:injectInto(self._dartsSystem)
end

function MiniGameSystem:initSystem()
	self._dartsSystem = DartsSystem:new(self)
end

function MiniGameSystem:tryEnterByStage(pointId)
	if GameConfigs.forbiddenMiniGame then
		self:dispatch(ShowTipEvent({
			tip = GameConfigs.forbiddenMiniGameTips
		}))

		return
	end

	local config = ConfigReader:getRecordById("StagePoint", pointId)
	local gameType = config.PointGameConfig.MiniGameConfig.type

	if miniGameStageFunc[gameType] then
		miniGameStageFunc[gameType](self, pointId)
	end
end

function MiniGameSystem:getActivityByGameType(gameType)
	local map = self._activitySystem:getActivitysByType("MINIGAME")

	for activityId, activity in pairs(map) do
		local activityConfig = activity:getActivityConfig()

		if activityConfig.MiniGameConfig.type == gameType then
			return activity
		end
	end

	return nil
end

function MiniGameSystem:tryEnter()
	local activity = self._activitySystem:getActivityByType(ActivityType.KMiniGame)

	self:tryEnterByActivity(activity:getId())
end

function MiniGameSystem:tryEnterByActivityType(gameType)
	if GameConfigs.forbiddenMiniGame then
		self:dispatch(ShowTipEvent({
			tip = GameConfigs.forbiddenMiniGameTips
		}))

		return
	end

	local activity = self:getActivityByGameType(gameType)

	self:tryEnterByActivity(activity:getId())
end

function MiniGameSystem:tryEnterByActivity(activityId)
	if GameConfigs.forbiddenMiniGame then
		self:dispatch(ShowTipEvent({
			tip = GameConfigs.forbiddenMiniGameTips
		}))

		return
	end

	local config = ConfigReader:getRecordById("Activity", activityId)
	local gameType = config.ActivityConfig.MiniGameConfig.type

	if miniGameActivityFunc[gameType] then
		miniGameActivityFunc[gameType](self, activityId)
	end
end

function MiniGameSystem:tryEnterByClub(gameType)
	local unlock, tips = self:isClubGameUnlock(gameType)

	if not unlock then
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = tips
		}))

		return
	end

	local gameId = self:getGameByType(gameType):getId()

	self:getClubGameInfo(gameId, function ()
		if miniGameClubFunc[gameType] then
			miniGameClubFunc[gameType](self)
		end

		snkAudio.play("Se_Click_Open_2")
	end)
end

function MiniGameSystem:getActivityById(activityId)
	return self._activitySystem:getActivityById(activityId)
end

function MiniGameSystem:getRankListOjById(activityId)
	return self._rankSystem:getRank():getRankListByTypeAndSubId(RankType.kMiniGame, activityId)
end

function MiniGameSystem:getRankListById(activityId)
	return self:getRankListOjById(activityId):getList()
end

function MiniGameSystem:getClubMiniGameList()
	return self._developSystem:getPlayer():getClubMiniGameList()
end

function MiniGameSystem:getGameByType(gameType)
	return self:getClubMiniGameList():getGameByType(gameType)
end

function MiniGameSystem:getGameById(id)
	return self:getClubMiniGameList():getGameById(id)
end

function MiniGameSystem:isClubGameUnlock(gameType)
	local unLockId = self:getGameByType(gameType):getUnlockId()

	return self._systemKeeper:isUnlock(unLockId)
end

function MiniGameSystem:getClubRankListOjById(gameType)
	return self:getGameByType(gameType):getRankList()
end

function MiniGameSystem:tryEnterClubGameRank(gameType)
	local gameId = self:getGameByType(gameType):getId()

	self:requestClubGameRankData(gameId, 1, 20, function (response)
		local view = self:getInjector():getInstance("MiniGameRankView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, {
			evn = MiniGameEvn.kClub,
			type = gameType
		}, nil))
	end)
end

function MiniGameSystem:synchronizeClubGamePlaneTask(data)
	local clubGamePlaneData = self._planeWarSystem:getClubGamePlaneData()

	if data and data.workingTasks and clubGamePlaneData then
		clubGamePlaneData:getTaskList():synchronize(data.workingTasks)
		self:dispatch(Event:new(EVT_CLUB_PUSHREDPOINT_SUCC))
	end
end

function MiniGameSystem:requestActivityRankData(subId, rankStart, rankEnd, callFunc)
	local data = {
		type = RankType.kMiniGame,
		subId = subId,
		rankStart = rankStart,
		rankEnd = rankEnd
	}

	self._rankSystem:requestAloneRankData(data, function (response)
		if callFunc then
			callFunc(response)
		end
	end)
end

function MiniGameSystem:requestActivityGameBegin(activityId, callFunc)
	local params = {
		activityId = activityId,
		param = {
			doActivityType = 101
		}
	}

	self._activityService:requestDoActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callFunc then
				callFunc(response)
			end

			self:dispatch(Event:new(EVT_ACTIVITY_MINIGAME_BEGIN_SCUESS))
		end
	end)
end

function MiniGameSystem:requestActivityGameBuyTimes(activityId, callFunc)
	local params = {
		activityId = activityId,
		param = {
			doActivityType = 102
		}
	}

	self._activityService:requestDoActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callFunc then
				callFunc(response)
			end

			self:dispatch(Event:new(EVT_ACTIVITY_MINIGAME_BUYTIMES_SCUESS))
		end
	end)
end

function MiniGameSystem:requestActivityGameResult(activityId, param, callFunc)
	param.doActivityType = 103
	local params = {
		param = param,
		activityId = activityId
	}

	self._activityService:requestDoActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_ACTIVITY_MINIGAME_RESULT_SCUESS, {
				response = response
			}))
		end

		if callFunc then
			callFunc(response)
		end
	end)
end

function MiniGameSystem:requestActivityGameGetReward(activityId, taskId, callFunc, type)
	local opType = 104

	if type then
		opType = type
	end

	local params = {
		param = {
			doActivityType = opType,
			taskId = taskId
		},
		activityId = activityId
	}

	self._activityService:requestDoActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callFunc then
				callFunc(response)
			end

			self:dispatch(Event:new(EVT_ACTIVITY_MINIGAME_GETREWARD_SCUESS, {
				response = response.data.reward
			}))
		end
	end)
end

function MiniGameSystem:requestActivityGameGetCumulativeReward(activityId, taskId, callFunc)
	local params = {
		param = {
			doActivityType = 104,
			taskId = taskId
		},
		activityId = activityId
	}

	self._activityService:requestDoActivity(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callFunc then
				callFunc(response)
			end

			self:dispatch(Event:new(EVT_ACTIVITY_MINIGAME_GETREWARD_SCUESS, {
				response = response.data.reward
			}))
		end
	end)
end

function MiniGameSystem:requestClubGameRankData(gameId, rankStart, rankEnd, callFunc)
	rankStart = rankStart or 1
	rankEnd = rankEnd or 20
	local params = {
		game = gameId,
		start = rankStart,
		["end"] = rankEnd
	}

	self._miniGameService:requestClubGameRankData(params, true, function (response)
		self:getGameById(gameId):getRankList():synchronize(response.data)

		if callFunc then
			callFunc(response)
		end
	end)
end

function MiniGameSystem:requestClubGameStart(gameId, callFunc)
	local params = {
		game = gameId
	}

	self._miniGameService:requestClubGameStart(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_CLUB_MINIGAME_BEGIN_SCUESS))
		end

		if callFunc then
			callFunc(response)
		end
	end)
end

function MiniGameSystem:requestClubGameFinish(gameId, params, callFunc)
	local params = {
		game = gameId,
		params = params
	}

	self._miniGameService:requestClubGameFinish(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if gameId == "ClubGame_Jump" then
				local customDataSystem = self:getInjector():getInstance(CustomDataSystem)

				customDataSystem:setValue(PrefixType.kGlobal, "played_jump", true, true)
			end

			self:dispatch(Event:new(EVT_CLUB_MINIGAME_RESULT_SCUESS, {
				response = response
			}))
		end

		if callFunc then
			callFunc(response)
		end
	end)
end

function MiniGameSystem:requestClubGameBuyTimes(gameId, callFunc)
	local params = {
		game = gameId
	}

	self._miniGameService:requestClubGameBuyTimes(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_CLUB_MINIGAME_BUYTIMES_SCUESS))
		end

		if callFunc then
			callFunc(response)
		end
	end)
end

function MiniGameSystem:requestClubGameCustom(gameId, params, callFunc)
	local params = {
		game = gameId,
		params = params
	}

	self._miniGameService:requestClubGameCustom(params, true, function (response)
		if callFunc then
			callFunc(response)
		end
	end)
end

function MiniGameSystem:getClubGameInfo(gameId, callFunc)
	local params = {
		game = gameId
	}

	self._miniGameService:getClubGameInfo(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			local gameData = self:getGameById(gameId)

			if gameData then
				gameData:synchronize(response.data)
				self:dispatch(Event:new(EVT_CLUB_PUSHREDPOINT_SUCC))
			end
		end

		if callFunc then
			callFunc(response)
		end
	end)
end

function MiniGameSystem:getClubGameSweep(gameId, callFunc)
	local params = {
		game = gameId
	}

	self._miniGameService:getClubGameSweep(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			local gameData = self:getGameById(gameId)

			if gameData then
				gameData:synchronize(response.data)
				self:dispatch(Event:new(EVT_CLUB_MINIGAME_SWEEEP_SCUESS))
			end

			if callFunc then
				callFunc(response)
			end
		end
	end)
end
