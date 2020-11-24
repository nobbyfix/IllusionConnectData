require("dm.gameplay.activity.model.BaseActivity")
require("dm.gameplay.activity.model.ActivityConfig")

ActivityList = class("ActivityList", objectlua.Object, _M)

function ActivityList:initialize()
	super.initialize(self)

	self._activityMap = {}
	self._activityIds = {}
	self._activityTypeMap = {}
end

function ActivityList:synchronize(data)
	if not data then
		return
	end

	for id, actData in pairs(data) do
		self:syncAloneActivity(id, actData)
	end
end

function ActivityList:syncAloneActivity(id, data)
	if not data then
		return
	end

	local activity = self:getActivityById(id)

	if activity then
		activity:synchronize(data)
	else
		local config = ConfigReader:getRecordById("Activity", id)

		if config and ActivityModel[config.Type] then
			activity = ActivityModel[config.Type]:new()
			data.activityId = id

			activity:synchronize(data)
			activity:setActivitySystem(self._activitySystem)

			self._activityMap[id] = activity
			self._activityIds[#self._activityIds + 1] = id
			local type = activity:getType()

			if not self._activityTypeMap[type] then
				self._activityTypeMap[type] = {}
			end

			self._activityTypeMap[type][id] = activity
		end
	end
end

function ActivityList:getAllActivityIds()
	return self._activityIds
end

function ActivityList:getAllActivities()
	return self._activityMap
end

function ActivityList:getActivityById(id)
	if id then
		return self._activityMap[id]
	end
end

function ActivityList:getActivityByType(actType)
	for id, activity in pairs(self._activityMap) do
		if activity:getType() == actType then
			return activity
		end
	end
end

function ActivityList:getActivitiesByType(type)
	return self._activityTypeMap[type] or {}
end

function ActivityList:deleteActivityById(activityId)
	local activity = self._activityMap[activityId]

	if activity == nil then
		return
	end

	table.removebyvalue(self._activityIds, activityId)

	local type = activity:getType()
	self._activityMap[activityId] = nil
	self._activityTypeMap[type][activityId] = nil
end

function ActivityList:deleteActivity(activityMap)
	for activityId, v in pairs(activityMap) do
		local activity = self._activityMap[activityId]

		if activity then
			if v == 1 then
				table.removebyvalue(self._activityIds, activityId)

				local type = activity:getType()
				self._activityMap[activityId] = nil
				self._activityTypeMap[type][activityId] = nil
			elseif v.subActivities and activity.deleteSubActivity then
				activity:deleteSubActivity(v.subActivities)
			end
		end
	end
end

function ActivityList:setActivitySystem(system)
	self._activitySystem = system
end
