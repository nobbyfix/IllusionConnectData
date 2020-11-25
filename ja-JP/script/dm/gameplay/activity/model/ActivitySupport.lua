ActivitySupport = class("ActivitySupport", BaseActivity, _M)

ActivitySupport:has("_subActivityMap", {
	is = "r"
})
ActivitySupport:has("_isCanShow", {
	is = "rw"
})
ActivitySupport:has("_score", {
	is = "rw"
})
ActivitySupport:has("_allScore", {
	is = "rw"
})
ActivitySupport:has("_scoreAwards", {
	is = "rw"
})
ActivitySupport:has("_itemUseCount", {
	is = "rw"
})
ActivitySupport:has("_periodsInfo", {
	is = "rw"
})
ActivitySupport:has("_periodId", {
	is = "rw"
})
ActivitySupport:has("_periodStatus", {
	is = "rw"
})
ActivitySupport:has("_lastPeriodEndTime", {
	is = "r"
})
ActivitySupport:has("_winHeroId", {
	is = "rw"
})
ActivitySupport:has("_winPopularity", {
	is = "r"
})

ActivitySupportStatus = {
	Starting = 2,
	Ended = 3,
	Preparing = 1,
	NotStarted = -1
}
ActivitySupportViewEnter = {
	Main = 2,
	Stage = 1
}
ActivitySupportItems = {
	[ActivityId.kActivityBlockZuoHe] = {
		"IM_ABSoreItem_1",
		"IM_ABSoreItem_2",
		"IM_ABClubAttrItem_1",
		"IM_ABClubAttrItem_2"
	},
	[ActivityId.kActivityWxh] = {
		"IM_WuXiuHuiSoreItem_1",
		"IM_WuXiuHuiSoreItem_2",
		"IM_WuXiuHuiClubAttrItem_1",
		"IM_WuXiuHuiClubAttrItem_2"
	}
}
ActivitySupportScheduleType = {
	preliminaries = 0,
	finals = 2,
	rematch = 1
}

function ActivitySupport:initialize()
	super.initialize(self)

	self._subActivityMap = {}
	self._isCanShow = "false"
	self._obtainedRewardBoxes = {}
	self._score = 0
	self._allScore = 0
	self._scoreAwards = {}
	self._itemUseCount = {}
	self._periodsInfo = {}
	self._periodId = nil
	self._periodStatus = nil
	self._lastPeriodEndTime = 0
	self._winHeroId = ""
	self._winPopularity = 0
end

function ActivitySupport:dispose()
	super.dispose(self)
end

function ActivitySupport:synchronize(data)
	if not data then
		return
	end

	super.synchronize(self, data)

	if data.subActivities then
		for id, value in pairs(data.subActivities) do
			local activity = self:getSubActivityById(id)

			if activity then
				activity:synchronize(value)
			else
				local config = ConfigReader:getRecordById("Activity", id)

				if config and ActivityModel[config.Type] then
					activity = ActivityModel[config.Type]:new()

					activity:synchronize(value)

					self._subActivityMap[id] = activity
				end
			end
		end
	end

	if data.score then
		self._score = data.score
	end

	if data.allScore then
		self._allScore = data.allScore
	end

	if data.scoreAwards then
		local list = {}

		for key, value in pairs(data.scoreAwards) do
			list[#list + 1] = value
		end

		self._scoreAwards = list
	end

	if data.itemUseCount then
		for key, value in pairs(data.itemUseCount) do
			self._itemUseCount[key] = value
		end
	end

	if data.period then
		self._periodId = data.period
	end

	if data.periodStatus then
		self._periodStatus = data.periodStatus
	end

	if data.lastPeriodEndTime then
		self._lastPeriodEndTime = data.lastPeriodEndTime
	end

	if data.winHeroId then
		self._winHeroId = data.winHeroId
	end

	if data.winPopularity then
		self._winPopularity = data.winPopularity
	end
end

function ActivitySupport:synchronizePeriodsInfo(data)
	self._periodsInfo = data
end

function ActivitySupport:getSupportCurPeriodData(_id)
	local id = _id or self._periodId
	local info = {
		data = self._periodsInfo.periods and self._periodsInfo.periods[id] or nil,
		config = ConfigReader:getRecordById("ActivitySupport", id)
	}

	return info
end

function ActivitySupport:getPeriodStartTime(periodId, index, activityId)
	local index = index or 1
	local pd = {}

	if activityId == ActivityId.kActivityWxh then
		pd = {
			winner = "ABS_WuXiuHui_3_1",
			ABS_WuXiuHui_2_1 = "ABS_WuXiuHui_1_" .. index,
			ABS_WuXiuHui_2_2 = "ABS_WuXiuHui_1_" .. index + 2,
			ABS_WuXiuHui_3_1 = "ABS_WuXiuHui_2_" .. index
		}
	else
		pd = {
			winner = "ABS_ZuoHe_3_1",
			ABS_ZuoHe_2_1 = "ABS_ZuoHe_1_" .. index,
			ABS_ZuoHe_2_2 = "ABS_ZuoHe_1_" .. index + 2,
			ABS_ZuoHe_3_1 = "ABS_ZuoHe_2_" .. index
		}
	end

	if not pd[periodId] then
		return nil
	end

	local info = self:getSupportCurPeriodData(pd[periodId])

	return {
		startTime = info.data.startTime,
		name = Strings:get(info.config.Name)
	}
end

function ActivitySupport:getSupportScoreRewardData(_id)
	local data = self:getSupportCurPeriodData(_id)
	local scoreReward = data.config.ScoreReward
	local list = {}

	for score, rewardId in pairs(scoreReward) do
		local status = ActivityTaskStatus.kUnfinish

		if tonumber(score) <= self._allScore then
			if table.indexof(self._scoreAwards, score) then
				status = ActivityTaskStatus.kGet
			else
				status = ActivityTaskStatus.kFinishNotGet
			end
		end

		list[#list + 1] = {
			score = tonumber(score),
			rewardId = rewardId,
			status = status
		}
	end

	local sortStatus = {
		ActivityTaskStatus.kFinishNotGet,
		ActivityTaskStatus.kUnfinish,
		ActivityTaskStatus.kGet
	}

	table.sort(list, function (a, b)
		if a.status ~= b.status then
			return table.indexof(sortStatus, a.status) < table.indexof(sortStatus, b.status)
		else
			return a.score < b.score
		end
	end)

	return list
end

function ActivitySupport:getSupportScoreRewardRedPoint()
	if self._periodStatus ~= ActivitySupportStatus.Starting then
		return false
	end

	local list = self:getSupportScoreRewardData()

	for key, value in pairs(list) do
		if value.status == ActivityTaskStatus.kFinishNotGet then
			return true
		end
	end

	return false
end

function ActivitySupport:getTalkShow(_activityId, _heroId, _itemId)
	local config = self:getHeroDataById(_heroId)

	if not config then
		return nil
	end

	local bubble = config.Bubble
	local item = ActivitySupportItems[_activityId]

	if bubble then
		local content = nil

		if _itemId == item[1] or item[2] then
			content = bubble.ScoreItem
		else
			content = bubble.ClubAttrItem
		end

		local index = math.random(1, #content)
		local data = content[index] or content[1]

		return data
	end

	return nil
end

function ActivitySupport:getHeroDataById(_heroId)
	return ConfigReader:getRecordById("ActivitySupportHero", _heroId)
end

function ActivitySupport:reset()
	super.reset(self)

	self._subActivityMap = {}
end

function ActivitySupport:getSubActivityById(id)
	if id then
		return self._subActivityMap[id]
	end
end

function ActivitySupport:getBlockMapActivity()
	local activityIds = self:getActivity()

	for i = 1, #activityIds do
		local id = activityIds[i]
		local activity = self:getSubActivityById(id)

		if activity and self:subActivityOpen(id) and activity:getType() == ActivityType.KActivityBlockMap then
			return activity
		end
	end

	return nil
end

function ActivitySupport:getTaskActivities()
	local taskActivities = {}
	local activityIds = self:getActivity()

	for i = 1, #activityIds do
		local id = activityIds[i]
		local activity = self:getSubActivityById(id)

		if activity and self:subActivityOpen(id) and activity:getType() == ActivityType.kTASK then
			table.insert(taskActivities, activity)
		end
	end

	return taskActivities
end

function ActivitySupport:hasRedPoint()
	if self:activityHasRedPoint() then
		return true
	end

	local acts = self:getActivity()

	for i = 1, #acts do
		local id = acts[i]

		if self:subActivityHasRedPoint(id) and self:subActivityOpen(id) then
			return true
		end
	end

	return false
end

function ActivitySupport:subActivityHasRedPoint(id)
	local activity = self:getSubActivityById(id)

	if activity then
		return activity:hasRedPoint()
	end

	return false
end

function ActivitySupport:activityHasRedPoint()
	return self:getSupportScoreRewardRedPoint()
end

function ActivitySupport:subActivityOpen(id)
	local activity = self:getSubActivityById(id)

	if activity then
		local curTime = DmGame:getInstance()._injector:getInstance("GameServerAgent"):remoteTimeMillis()

		if curTime < activity:getStartTime() or activity:getEndTime() < curTime or not activity:getIsTodayOpen() then
			return false
		end

		return true
	end

	return false
end

function ActivitySupport:subActivityHasNoFinish(id)
	local activity = self:getSubActivityById(id)

	if activity then
		local taskList = activity:getTaskList()

		for index, task in pairs(taskList) do
			local status = task.status

			if status == ActivityTaskStatus.kUnfinish then
				return true
			end
		end
	end

	return false
end

function ActivitySupport:getButtonConfig()
	if self._btnParams then
		return self._btnParams
	end

	local btns = {
		blockParams = {},
		supportParams = {}
	}
	local data = {
		icon = self._config.ActivityConfig.ButtonIcon,
		title = Strings:get(self._config.Title)
	}
	btns.supportParams = data
	local activityIds = self:getActivity()

	for i = 1, #activityIds do
		local id = activityIds[i]
		local config = ConfigReader:getRecordById("Activity", id)

		if config and config.Type == ActivityType.KActivityBlockMap then
			local data = {
				icon = config.ActivityConfig.ButtonIcon,
				title = Strings:get(config.Title),
				rewards = ConfigReader:getDataByNameIdAndKey("Reward", config.ActivityConfig.ShowReward, "Content"),
				heroes = config.ActivityConfig.BonusHero
			}
			btns.blockParams = data

			break
		end
	end

	self._btnParams = btns

	return self._btnParams
end

function ActivitySupport:getBgPath()
	return string.format("asset/scene/%s.jpg", self:getActivityConfig().Bmg)
end

function ActivitySupport:getTitlePath()
	return string.format("%s.png", self:getActivityConfig().Logo)
end

function ActivitySupport:getTimeStr()
	if self._timeStr then
		return self._timeStr
	end

	local timeStr = self._config.TimeFactor
	local start = ""
	local end_ = ""

	if timeStr.start then
		if type(timeStr.start) == "table" then
			start = string.split(timeStr.start[1], " ")[1]
		else
			start = string.split(timeStr.start, " ")[1]
		end

		local startTemp = string.split(start, "-")
		start = string.format("%s.%s.%s", startTemp[1], tonumber(startTemp[2]), tonumber(startTemp[3]))
	end

	if timeStr["end"] then
		end_ = string.split(timeStr["end"], " ")[1]
		local endTemp = string.split(end_, "-")
		end_ = string.format("%s.%s.%s", endTemp[1], tonumber(endTemp[2]), tonumber(endTemp[3]))
	end

	self._timeStr = string.format("%s~%s", start, end_)

	return self._timeStr
end

function ActivitySupport:getRoleParams()
	return self:getActivityConfig().ModelId
end

function ActivitySupport:getResourcesBanner()
	return self:getActivityConfig().ResourcesBanner
end

function ActivitySupport:getActivity()
	local actConfig = self:getActivityConfig()

	return actConfig.Activity
end

function ActivitySupport:deleteSubActivity(activityMap)
	for activityId, v in pairs(activityMap) do
		if v == 1 then
			self._subActivityMap[activityId] = nil
		else
			local activity = self._subActivityMap[activityId]

			if activity and activity.delete then
				activity:delete(v)
			end
		end
	end
end
