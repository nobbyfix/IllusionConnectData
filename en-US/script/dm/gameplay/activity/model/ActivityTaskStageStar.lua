ActivityTaskStageStar = class("ActivityTaskStageStar", BaseActivity, _M)

ActivityTaskStageStar:has("_taskList", {
	is = "r"
})

function ActivityTaskStageStar:initialize()
	super.initialize(self)

	self._taskList = {}
end

function ActivityTaskStageStar:dispose()
	super.dispose(self)
end

function ActivityTaskStageStar:synchronize(data)
	if not data then
		return
	end

	super.synchronize(self, data)

	if data.taskList then
		for id, value in pairs(data.taskList) do
			local task = self:getActivityTaskById(id)

			if task then
				task:updateModel(value)
			else
				local taskConfig = ConfigReader:getRecordById("ActivityTask", id)

				if taskConfig ~= nil and taskConfig.Id ~= nil then
					task = ActivityTask:new()

					task:synchronizeModel(value)

					self._taskList[#self._taskList + 1] = task
				end
			end
		end
	end
end

function ActivityTaskStageStar:getTaskCountByStatus(status)
	local value = 0

	for i, task in pairs(self._taskList) do
		if task ~= nil and task:getStatus() == status then
			value = value + 1
		end
	end

	return value
end

function ActivityTaskStageStar:hasRewardToGet()
	if self:getTaskCountByStatus(ActivityTaskStatus.kFinishNotGet) > 0 then
		return true
	elseif self:getPayStatus() then
		local list = self:getSortActivityList()

		for key, data in pairs(list) do
			if data:getStatus() == ActivityTaskStatus.kGet then
				local get = self:getRechargeStatus(data:getId())

				if not get then
					return true
				end
			end
		end
	end

	return false
end

function ActivityTaskStageStar:hasRedPoint()
	return self:hasRewardToGet()
end

function ActivityTaskStageStar:getActivityTaskById(taskId)
	if self._taskList then
		for k, v in pairs(self._taskList) do
			if v:getId() == taskId then
				return v
			end
		end
	end
end

function ActivityTaskStageStar:getSortActivityList()
	local list = {}

	for i, taskData in pairs(self._taskList) do
		list[#list + 1] = taskData
	end

	table.sort(list, function (a, b)
		return a:getOrderNum() < b:getOrderNum()
	end)

	return list
end

function ActivityTaskStageStar:getRechargeStatus(taskId)
	local list = self:getExtraGot()

	for _taskId, times in pairs(list) do
		if _taskId == taskId then
			return true
		end
	end

	return false
end

function ActivityTaskStageStar:getDeadline()
	local gameServerAgent = DmGame:getInstance()._injector:getInstance("GameServerAgent")
	local remoteTimestamp = gameServerAgent:remoteTimestamp()
	local startTime = self:getStartTime() / 1000
	local buyDays = self:getActivityConfig().buyDays
	local endMills = startTime + tonumber(buyDays) * 24 * 60 * 60

	return remoteTimestamp >= endMills
end

function ActivityTaskStageStar:getPayStatus()
	local payId = self:getActivityConfig().payId
	local rechargeAndVipModel = DmGame:getInstance()._injector:getInstance("RechargeAndVipModel")
	local buy = rechargeAndVipModel:getRechargedStatus(payId)

	return buy
end
