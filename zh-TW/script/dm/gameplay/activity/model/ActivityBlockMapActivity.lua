require("dm.gameplay.activity.model.stageModel.ActivityStage")
require("dm.gameplay.develop.model.team.Team")

ActivityBlockMapActivity = class("ActivityBlockMapActivity", BaseActivity, _M)

ActivityBlockMapActivity:has("_team", {
	is = "rw"
})
ActivityBlockMapActivity:has("_storySet", {
	is = "rw"
})

local litStageType = {
	NORMAL = "Normal",
	ELITE = "Elite"
}

function ActivityBlockMapActivity:initialize()
	self._stagesMap = {}
	self._storySet = {}
	self._stagesMap[litStageType.NORMAL] = ActivityStage:new(StageType.kNormal)

	self._stagesMap[litStageType.NORMAL]:setOwner(self)

	self._stagesMap[litStageType.ELITE] = ActivityStage:new(StageType.kElite)

	self._stagesMap[litStageType.ELITE]:setOwner(self)
end

function ActivityBlockMapActivity:synchronize(data)
	if not data then
		return
	end

	super.synchronize(self, data)

	if data.team then
		if not self._team then
			self._team = Team:new({})
		end

		self._team:synchronize(data.team)
	end

	if data.storySet then
		self._storySet = data.storySet
	end

	if data.stageInfos then
		self:syncStageInfo(data.stageInfos)
	elseif data.storySet then
		for _, _stage in pairs(self._stagesMap) do
			_stage:initStoryPointMap()
		end
	end
end

function ActivityBlockMapActivity:syncStageInfo(data)
	for k, v in pairs(data) do
		local _stage = self._stagesMap[k]

		_stage:sync(v)
	end
end

function ActivityBlockMapActivity:hasRedPoint()
	for k, stage in pairs(self._stagesMap) do
		if stage and stage:hasRedPoint() then
			return true
		end
	end

	return false
end

function ActivityBlockMapActivity:getStageByStageType(stageType)
	return self._stagesMap[litStageType[stageType]]
end

function ActivityBlockMapActivity:getActivityMapById(mapId)
	local mapType = ConfigReader:getDataByNameIdAndKey("ActivityBlockMap", mapId, "Type")

	if mapType then
		local stage = self._stagesMap[litStageType[mapType]]

		return stage
	end
end

function ActivityBlockMapActivity:getPointById(pointId)
	local mapid = ConfigReader:getDataByNameIdAndKey("ActivityBlockPoint", pointId, "Map")
	mapid = mapid or ConfigReader:getDataByNameIdAndKey("ActivityStoryPoint", pointId, "Map")

	if not mapid then
		return
	end

	local stage = self:getActivityMapById(mapid)

	return stage:getPointById(pointId)
end

function ActivityBlockMapActivity:getMapIdByStageType(stageType)
	local stage = self:getStageByStageType(stageType)

	return stage:getMapId()
end

function ActivityBlockMapActivity:getStageTypeById(pointId)
	local point = self:getPointById(pointId)

	return point:getType()
end
