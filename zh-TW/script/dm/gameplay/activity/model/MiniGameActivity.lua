MiniGameActivity = class("MiniGameActivity", BaseActivity, _M)

MiniGameActivity:has("_totalScore", {
	is == "r"
})
MiniGameActivity:has("_gameTimes", {
	is == "r"
})
MiniGameActivity:has("_buyTimes", {
	is == "r"
})
MiniGameActivity:has("_highestScore", {
	is == "r"
})
MiniGameActivity:has("_taskMap", {
	is == "r"
})
MiniGameActivity:has("_taskList", {
	is == "r"
})
MiniGameActivity:has("_dailyTaskList", {
	is == "r"
})
MiniGameActivity:has("_dailyRewards", {
	is == "r"
})

function MiniGameActivity:initialize(id)
	super.initialize(self, id)

	self._totalScore = 0
	self._gameTimes = 0
	self._buyTimes = 0
	self._highestScore = 0
	self._taskMap = {}
	self._taskList = {}
	self._dailyTaskList = {}
	self._dailyRewards = {}
end

function MiniGameActivity:synchronize(data)
	if not data then
		return
	end

	super.synchronize(self, data)

	if data.totalScore then
		self._totalScore = data.totalScore
	end

	if data.gameTimes then
		self._gameTimes = data.gameTimes
	end

	if data.highestScore then
		self._highestScore = data.highestScore
	end

	if data.buyTimes then
		self._buyTimes = data.buyTimes
	end

	if data.taskList then
		self:syncTaskList(data.taskList, self._taskList)
	end

	if data.dailyTaskList then
		self:syncTaskList(data.dailyTaskList, self._dailyTaskList)
	end

	if data.dailyTotalRewards then
		self._dailyRewards = data.dailyTotalRewards
	end
end

function MiniGameActivity:syncTaskList(taskData, taskList)
	for id, data in pairs(taskData) do
		if self._taskMap[id] then
			self._taskMap[id]:synchronizeModel(data)
		else
			local taskConfig = ConfigReader:getRecordById("ActivityTask", id)

			if taskConfig ~= nil and taskConfig.Id ~= nil then
				local task = ActivityTask:new()

				task:synchronizeModel(data)

				taskList[#taskList + 1] = task
				self._taskMap[id] = task
			end
		end
	end
end

function MiniGameActivity:isLimitReward()
	return self._dailyRewardIsMax == 1
end

function MiniGameActivity:getRewardList()
	return self._rewardList or {}
end

function MiniGameActivity:hasRedPoint()
	if self._gameTimes > 0 then
		return true
	end

	if self:hasTaskReward() then
		return true
	end

	return false
end

function MiniGameActivity:hasTaskReward()
	for _, task in pairs(self._taskMap) do
		if task:getStatus() == TaskStatus.kFinishNotGet then
			return true
		end
	end

	return false
end

function MiniGameActivity:getTaskById(id)
	return self._taskMap[id]
end

function MiniGameActivity:canBuyTimes()
	return self._buyTimes < self:getLimitBuyTimes()
end

function MiniGameActivity:canBuyTimesBanZang()
	return self._buyTimes < self:getBanZangLimitBuyTimes()
end

function MiniGameActivity:getCost()
	local data = self:getBuyCost()
	local amountList = data.amount
	local amount = amountList[self._buyTimes + 1] or amountList[#amountList]

	return {
		id = data.itemId,
		amount = amount
	}
end

function MiniGameActivity:getBanZangCost()
	local data = self:getActivityConfig().buyTimesCost
	local amountList = data.amount
	local amount = amountList[self._buyTimes + 1] or amountList[#amountList]

	return {
		id = data.id,
		amount = amount
	}
end

function MiniGameActivity:getAllTimes()
	return self:getActivityConfig().times
end

function MiniGameActivity:getBanZangAllTimes()
	return self:getActivityConfig().maxTimes
end

function MiniGameActivity:getLimitBuyTimes()
	return self:getActivityConfig().buyTimes
end

function MiniGameActivity:getBanZangLimitBuyTimes()
	return self:getActivityConfig().buyLimit
end

function MiniGameActivity:getbBanZangBuyCostItemId()
	return self:getActivityConfig().buyTimesCost.id
end

function MiniGameActivity:getBuyCost()
	return self:getActivityConfig().buyCost
end

function MiniGameActivity:getMiniGameConfig()
	return self:getActivityConfig().MiniGameConfig
end

function MiniGameActivity:getGameDecs()
	return Strings:get(self:getActivityConfig().gameDecs)
end

function MiniGameActivity:getRules()
	return self:getActivityConfig().rule
end

function MiniGameActivity:getTask()
	return self:getActivityConfig().task
end

function MiniGameActivity:hasBanZangRewardRedPoint()
	for key, value in pairs(self._finalTaskList) do
		local state = 0
		state = value.taskStatus

		if state == 1 then
			return true
		end
	end

	for key, value in pairs(self._dailyTaskList) do
		local state = 0
		state = value.taskStatus

		if state == 1 then
			return true
		end
	end

	return false
end

function MiniGameActivity:hasChallengeRedPoint()
	return self._curTimes == self:getBanZangAllTimes()
end

function MiniGameActivity:hasBanZangRedPoint()
	if self:hasBanZangRewardRedPoint() then
		return true
	end

	return self:hasChallengeRedPoint()
end

function MiniGameActivity:getBanZangMaximumShow()
	return self:getActivityConfig().maximumShow
end

function MiniGameActivity:getRuleDesc()
	return self:getActivityConfig().RuleDesc
end
