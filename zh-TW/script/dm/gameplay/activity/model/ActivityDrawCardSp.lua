ActivityDrawCardSp = class("ActivityDrawCardSp", BaseActivity, _M)

ActivityDrawCardSp:has("_totalDrawTime", {
	is = "r"
})
ActivityDrawCardSp:has("_drawTime", {
	is = "r"
})
ActivityDrawCardSp:has("_round", {
	is = "r"
})
ActivityDrawCardSp:has("_boxes", {
	is = "r"
})
ActivityDrawCardSp:has("_recruitPool", {
	is = "r"
})
ActivityDrawCardSp:has("_subActivity", {
	is = "r"
})

function ActivityDrawCardSp:initialize()
	super.initialize(self)

	self._totalDrawTime = 0
	self._drawTime = 0
	self._round = 0
	self._boxes = {}
	self._taskList = {}
	self._subActivity = nil
end

function ActivityDrawCardSp:dispose()
	super.dispose(self)
end

function ActivityDrawCardSp:synchronize(data)
	if not data then
		return
	end

	super.synchronize(self, data)

	if data.subActivities then
		for id, value in pairs(data.subActivities) do
			if self._subActivity then
				self._subActivity:synchronize(value)
			else
				local config = ConfigReader:getRecordById("Activity", id)

				if config and ActivityModel[config.Type] then
					self._subActivity = ActivityModel[config.Type]:new()

					self._subActivity:synchronize(value)
				end
			end
		end
	end

	self:initRecruitPool()

	if data.totalDrawTime then
		self._totalDrawTime = data.totalDrawTime
	end

	if data.drawTime then
		self._drawTime = data.drawTime
	end

	if data.round then
		self._round = data.round
	end

	if data.boxes then
		self._boxes = data.boxes
	end
end

function ActivityDrawCardSp:initRecruitPool()
	local activityConfig = self:getActivityConfig()

	if activityConfig.DRAW then
		local recruitId = activityConfig.DRAW
		local configData = ConfigReader:getRecordById("DrawCard", recruitId)

		if configData then
			local recuritPool = RecruitPool:new(recruitId)
			self._recruitPool = recuritPool
		end
	end
end

function ActivityDrawCardSp:getIsDrawCardBagin(currentTime)
	local resuit = false
	local startTime = 0
	local activityConfig = self:getActivityConfig()

	if activityConfig.Activity then
		local subActivity = activityConfig.Activity[1]
		local timeStamp = ConfigReader:getDataByNameIdAndKey("Activity", subActivity, "TimeFactor")
		local _, _, y, mon, d, h, m, s = string.find(timeStamp["end"], "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
		startTime = TimeUtil:timeByRemoteDate({
			year = y,
			month = mon,
			day = d,
			hour = h,
			min = m,
			sec = s
		})

		if startTime < currentTime then
			resuit = true
		end
	end

	return resuit, startTime
end

function ActivityDrawCardSp:getCanGainReward()
	local resuit = false
	local curTime = DmGame:getInstance()._injector:getInstance("GameServerAgent"):remoteTimeMillis()

	if self._subActivity and self._subActivity and self._subActivity:getStartTime() <= curTime and curTime < self._subActivity:getEndTime() then
		resuit = self._subActivity:hasRewardToGet()
	end

	return resuit
end

function ActivityDrawCardSp:getShowTimeRewardData()
	local timeRewardList, timeRewardArray = self._recruitPool:getTimeRewardData()
	local showRound = self._round
	local isFull = false
	local showTimeRewardId = self._recruitPool:getFirstTimeRewardId()

	for key, value in pairs(self._boxes) do
		local checkout = false
		local index = 0

		for id, stage in pairs(value) do
			if stage == 1 then
				showRound = key
				showTimeRewardId = id
				checkout = true
				isFull = true

				break
			end

			index = index + 1
		end

		if checkout then
			break
		elseif index < #timeRewardArray then
			showTimeRewardId = timeRewardArray[index + 1].Id
		end
	end

	local result = {
		showData = timeRewardList[showTimeRewardId],
		showRound = showRound,
		isFull = isFull
	}

	return result
end

function ActivityDrawCardSp:hasRedPoint()
	return self:getCanGainReward()
end
