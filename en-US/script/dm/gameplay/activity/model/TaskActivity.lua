TaskActivity = class("TaskActivity", BaseActivity, _M)

TaskActivity:has("_taskList", {
	is = "r"
})
TaskActivity:has("_isTodayOpen", {
	is = "r"
})

function TaskActivity:initialize()
	super.initialize(self)

	self._taskList = {}
	self._isTodayOpen = false
end

function TaskActivity:dispose()
	super.dispose(self)
end

function TaskActivity:synchronize(data)
	if not data then
		return
	end

	super.synchronize(self, data)

	if data.taskList then
		for id, value in pairs(data.taskList) do
			if not value.taskId then
				value.taskId = id
			end

			if not value.activityId then
				value.activityId = data.activityId
			end

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

	if data.isTodayOpen then
		self._isTodayOpen = data.isTodayOpen
	end
end

function TaskActivity:getTaskCountByStatus(status)
	local value = 0

	for i, task in pairs(self._taskList) do
		if task ~= nil and task:getStatus() == status then
			value = value + 1
		end
	end

	return value
end

function TaskActivity:hasRewardToGet()
	return self:getTaskCountByStatus(ActivityTaskStatus.kFinishNotGet) > 0
end

function TaskActivity:hasRedPoint()
	return self:hasRewardToGet()
end

function TaskActivity:getActivityTaskById(taskId)
	if self._taskList then
		for k, v in pairs(self._taskList) do
			if v:getId() == taskId then
				return v
			end
		end
	end
end

function TaskActivity:getActivityTaskIndexById(taskId)
	if self._taskList then
		for k, v in pairs(self._taskList) do
			if v:getId() == taskId then
				return k
			end
		end
	end
end

function TaskActivity:getSortActivityList()
	local list = {}

	for i, taskData in pairs(self._taskList) do
		list[#list + 1] = taskData
	end

	table.sort(list, function (a, b)
		if a:getStatus() ~= b:getStatus() then
			return kTaskStatusPriorityMap[a:getStatus()] < kTaskStatusPriorityMap[b:getStatus()]
		else
			return a:getOrderNum() < b:getOrderNum()
		end
	end)

	return list
end

function TaskActivity:getTimeStr()
	if self._timeStr then
		return self._timeStr
	end

	local timeStr = self:getLocalTimeFactor()
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

function TaskActivity:delete(data)
	if data.taskList then
		for id, v in pairs(data.taskList) do
			local index = self:getActivityTaskIndexById(id)

			if index then
				if v == 1 then
					table.remove(self._taskList, index)
				else
					local task = self._taskList[index]

					if task.delete then
						task:delete(v)
					end
				end
			end
		end
	end
end
