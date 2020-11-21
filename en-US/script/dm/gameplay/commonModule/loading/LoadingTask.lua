LoadingTask = LoadingTask or {}

function LoadingTask:buildHeroPreloadTask(modelId)
	local config = ConfigReader:getRecordById("RoleModel", modelId)
	local taskBuilder = timesharding.TaskBuilder:new()
	local task = taskBuilder:buildParalelTask(function ()
		local animationResId = config.Model

		AnimLoadUtils.preLoadSkeletonAnimation(tostring(animationResId) .. ".skel")
	end)

	return task, 1
end
