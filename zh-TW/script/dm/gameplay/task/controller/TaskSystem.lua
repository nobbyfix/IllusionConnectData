TaskSystem = class("TaskSystem", Facade, _M)

TaskSystem:has("_taskListModel", {
	is = "r"
}):injectWith("TaskListModel")
TaskSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
TaskSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")

function TaskSystem:initialize()
	super.initialize(self)
end

function TaskSystem:checkEnabled(data)
	local unlock, tips = self._systemKeeper:isUnlock("Task_System")

	return unlock, tips
end

function TaskSystem:tryEnter(data)
	local unlock, tips = self:checkEnabled(data)

	if not unlock then
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = tips
		}))

		return
	end

	local params = {
		taskType = {
			TaskType.kDaily,
			TaskType.kBranch,
			TaskType.kStage
		}
	}

	self:requestTaskList(params, function ()
		local taskView = self:getInjector():getInstance("TaskMainView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, taskView, nil, data))
	end, self)
end

function TaskSystem:getDailyTask(callback)
	local unlock, tips = self._systemKeeper:isUnlock("DailyQuest")

	if unlock then
		self:requestTaskList({
			taskType = {
				TaskType.kDaily
			}
		}, function ()
			if callback then
				callback()
			end
		end)
	elseif callback then
		callback()
	end
end

function TaskSystem:synchronizeTask(data)
	if data.growTaskManager then
		self:getTaskListModel():updateTasks(data.growTaskManager)
	end

	if data.dailyTaskManager then
		self:getTaskListModel():updateTasks(data.dailyTaskManager)
	end

	if data.mainTaskManager then
		self:getTaskListModel():updateTasks(data.mainTaskManager)
	end

	if data.mapTaskManager then
		self:getTaskListModel():updateTasks(data.mapTaskManager)
	end

	self:dispatch(Event:new(EVT_TASK_REFRESHVIEW, {}))
end

function TaskSystem:synchronizeAchieveTask(data)
	if data.workingTasks then
		self:getTaskListModel():updateAchieveTask(data.workingTasks)
	end

	if data.points then
		self:getTaskListModel():updateAchievePoint(data.points)
	end
end

function TaskSystem:getLivenessList()
	local configList = ConfigReader:getDataByNameIdAndKey("ConfigValue", "ActiveReward", "content")
	local livenessList = {}

	for k, v in pairs(configList) do
		livenessList[#livenessList + 1] = tonumber(k)
	end

	table.sort(livenessList, function (a, b)
		return a < b
	end)

	return livenessList
end

function TaskSystem:getLivenessRewardByType(rType)
	local configList = ConfigReader:getDataByNameIdAndKey("ConfigValue", "ActiveReward", "content")
	local rewardId = nil

	for k, v in pairs(configList) do
		if k == rType then
			rewardId = v
		end
	end

	return rewardId
end

function TaskSystem:getWeekLivenessList()
	local configList = ConfigReader:getDataByNameIdAndKey("ConfigValue", "WeekActiveReward", "content")
	local livenessList = {}

	for k, v in pairs(configList) do
		livenessList[#livenessList + 1] = tonumber(k)
	end

	table.sort(livenessList, function (a, b)
		return a < b
	end)

	return livenessList
end

function TaskSystem:findValueByKey(map, key)
	for k, v in pairs(map) do
		if tostring(k) == tostring(key) then
			return v
		end
	end

	return nil
end

function TaskSystem:hasDailyRedPoint()
	local unlock, tip = self._systemKeeper:isUnlock("DailyQuest")
	local canShow = self._systemKeeper:canShow("DailyQuest")

	if not canShow or not unlock then
		return false
	end

	local boxStatusMap = self:getTaskListModel():getBoxStatusMap()
	local livenessList = self:getLivenessList()
	local liveness = self:getTaskListModel():getDayLiveness()

	if livenessList ~= {} then
		for i = 1, 5 do
			if liveness < livenessList[i] then
				-- Nothing
			elseif boxStatusMap then
				local status = self:findValueByKey(boxStatusMap, tostring(livenessList[i]))

				if not status then
					return true
				end
			end
		end
	end

	if self:hasWeekRewardRed() then
		return true
	end

	local daiyTaskList = self:getShowDailyTaskList()

	for i = 1, #daiyTaskList do
		local taskData = daiyTaskList[i]
		local taskStatus = taskData:getStatus()
		local condition = taskData:getShowCondition()
		local systemKeeper = self:getInjector():getInstance(SystemKeeper)

		if taskStatus == TaskStatus.kFinishNotGet and systemKeeper:isConditionReached(condition) then
			return true
		end
	end

	return false
end

function TaskSystem:hasWeekRewardRed()
	local weekBoxStatusMap = self:getTaskListModel():getWeekBoxStatusMap()
	local weekLivenessList = self:getWeekLivenessList()
	local weekLiveness = self:getTaskListModel():getWeekLiveness()

	if weekLivenessList ~= {} then
		for i = 1, #weekLivenessList do
			if weekLivenessList[i] <= weekLiveness and weekBoxStatusMap then
				local status = self:findValueByKey(weekBoxStatusMap, tostring(weekLivenessList[i]))

				if not status then
					return true
				end
			end
		end
	end

	return false
end

function TaskSystem:hasStageRedPoint()
	local unlock, tip = self._systemKeeper:isUnlock("MainTask")
	local canShow = self._systemKeeper:canShow("MainTask")

	if not canShow or not unlock then
		return false
	end

	local mainTask = self:getTaskListModel():getStageMainTask()

	if mainTask and mainTask:getStatus() == TaskStatus.kFinishNotGet then
		return true
	end

	local taskList = self:getTaskListModel():getStageBranchTask()

	for i = 1, #taskList do
		local task = taskList[i]

		if task:getStatus() == TaskStatus.kFinishNotGet then
			return true
		end
	end

	return false
end

function TaskSystem:doReset(resetId, value, data)
	value = value or 0

	if resetId == ResetId.kDailyTaskActivity and data then
		self:getTaskListModel():synchronizeModel(data)
		self:dispatch(Event:new(EVT_TASK_RESET, {}))
	end
end

function TaskSystem:getShowDailyTaskList()
	local daiyTaskList = self._taskListModel:getAllDailyTaskList()
	local showList = {}

	if daiyTaskList then
		for i = 1, #daiyTaskList do
			local taskData = daiyTaskList[i]
			local condition = taskData:getShowCondition()
			local systemKeeper = self:getInjector():getInstance(SystemKeeper)

			if systemKeeper:isConditionReached(condition) then
				self._taskListModel:checkIsShowNextTask(taskData, showList)
			end
		end
	end

	table.sort(showList, function (a, b)
		return self._taskListModel:compare(a, b)
	end)

	return showList
end

function TaskSystem:getTaskDataById(id)
	local taskConfig = ConfigReader:getRecordById("Task", id)

	return taskConfig
end

function TaskSystem:getShowMapTaskList()
	return self._taskListModel:getShowMapTask()
end

function TaskSystem:hasAchieveRedPoint()
	local unlock, tip = self._systemKeeper:isUnlock("Task_Achievement")
	local canShow = self._systemKeeper:canShow("Task_Achievement")

	if not canShow or not unlock then
		return false
	end

	local taskList = self:getTaskListModel():getAchieveTaskList()

	for i, v in pairs(taskList) do
		if v:getStatus() == TaskStatus.kFinishNotGet then
			return true
		end
	end

	return false
end

function TaskSystem:hasRedPoint(taskList)
	for i, v in pairs(taskList) do
		if v:getStatus() == TaskStatus.kFinishNotGet then
			return true
		end
	end

	return false
end

function TaskSystem:checkIsShowRedPoint()
	local unlock, tips = self._systemKeeper:isUnlock("Task_System")

	if not unlock then
		return false
	end

	if self:hasDailyRedPoint() or self:hasAchieveRedPoint() or self:hasStageRedPoint() then
		return true
	end

	return false
end

function TaskSystem:requestTaskList(params, callback, mediator, blockUI)
	local taskService = self:getInjector():getInstance(TaskService)

	taskService:requestTaskList(params, blockUI, function (response)
		if response.resCode == GS_SUCCESS then
			self:getTaskListModel():synchronizeModel(response.data)

			if mediator and DisposableObject:isDisposed(mediator) then
				return
			end

			if callback then
				callback(response)
			end
		end
	end)
end

function TaskSystem:requestTaskReward(params, callback)
	local taskService = self:getInjector():getInstance(TaskService)

	taskService:requestTaskReward(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_TASK_REWARD_SUCC, {
				response = response.data.rewards
			}))

			if callback then
				callback(response)
			end
		end
	end)
end

function TaskSystem:requestBoxReward(params, callback)
	local taskService = self:getInjector():getInstance(TaskService)

	taskService:requestBoxReward(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_BOX_REWARD_SUCC, {
				response = response.data
			}))

			if callback then
				callback(response)
			end
		elseif response.resCode == 10103 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("10456")
			}))
		end
	end)
end

function TaskSystem:requestWeekBoxReward(params, callback)
	local taskService = self:getInjector():getInstance(TaskService)

	taskService:requestWeekBoxReward(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_BOX_REWARD_SUCC, {
				response = response.data
			}))

			if callback then
				callback(response)
			end
		end
	end)
end

function TaskSystem:requestAchievementReward(params, callback)
	local taskService = self:getInjector():getInstance(TaskService)

	taskService:requestAchievementReward(params, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_TASK_ACHI_REWARD_SUCC, {
				response = response.data.rewards
			}))

			if callback then
				callback(response)
			end
		end
	end)
end
