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
	self._stagesMap[litStageType.NORMAL] = {}
	self._stagesMap[litStageType.ELITE] = {}
	self._mapList = {
		[litStageType.NORMAL] = {},
		[litStageType.ELITE] = {}
	}
end

function ActivityBlockMapActivity:synchronize(data)
	if not data then
		return
	end

	super.synchronize(self, data)

	if not self._activityConfig then
		self._activityConfig = self:getActivityConfig()
	end

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
		self:initStoryInfo()
	end
end

function ActivityBlockMapActivity:syncStageInfo(data)
	local cStageType = {
		[litStageType.NORMAL] = StageType.kNormal,
		[litStageType.ELITE] = StageType.kElite
	}

	for type, v in pairs(data) do
		if not self._stagesMap[type] then
			self._stagesMap[type] = {}
			self._mapList[type] = {}
		end

		for id, map in pairs(v.stageMaps) do
			if not self._stagesMap[type][id] then
				self._stagesMap[type][id] = ActivityStage:new(cStageType[type], id)

				if self._activityConfig.MapSort then
					self._stagesMap[type][id].index = tonumber(self._activityConfig.MapSort[id])
				end

				self._stagesMap[type][id]:setOwner(self)

				self._mapList[type][#self._mapList[type] + 1] = id
			end

			self._stagesMap[type][id]:sync(map)
		end

		if self._activityConfig.MapSort then
			local length = 0

			for k, stage in pairs(self._stagesMap[type]) do
				length = length + 1
			end

			local list = {}
			local mapId = nil
			local len = #list + 1

			for i = 1, length do
				for k, stage in pairs(self._stagesMap[type]) do
					if stage.index == len then
						mapId = k
						list[len] = mapId
						len = #list + 1
					end
				end
			end

			self._mapList[type] = list
		end
	end
end

function ActivityBlockMapActivity:initStoryInfo(data)
	for k, stageList in pairs(self._stagesMap) do
		for _, _stage in pairs(stageList) do
			_stage:initStoryPointMap()
		end
	end
end

function ActivityBlockMapActivity:hasRedPoint()
	for k, stageList in pairs(self._stagesMap) do
		for k, stage in pairs(stageList) do
			if stage and stage:hasRedPoint() then
				return true
			end
		end
	end

	return false
end

function ActivityBlockMapActivity:getStageByStageType(stageType)
	local type = litStageType[stageType]
	local stageMap = self._stagesMap[type]

	return stageMap[self._mapList[type][1]]
end

function ActivityBlockMapActivity:getActivityMapById(mapId)
	local mapType = ConfigReader:getDataByNameIdAndKey("ActivityBlockMap", mapId, "Type")

	if mapType then
		local type = litStageType[mapType]
		local stageMap = self._stagesMap[type]

		for k, stage in pairs(stageMap) do
			if mapId == stage._mapId then
				return stage
			end
		end

		return stageMap[self._mapList[type][1]]
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

function ActivityBlockMapActivity:getMapIdByPointId(pointId)
	local mapid = ConfigReader:getDataByNameIdAndKey("ActivityBlockPoint", pointId, "Map")
	mapid = mapid or ConfigReader:getDataByNameIdAndKey("ActivityStoryPoint", pointId, "Map")

	return mapid
end

function ActivityBlockMapActivity:getMapByIndex(index, stageType)
	if stageType == nil then
		stageType = StageType.kNormal
	end

	local type = litStageType[stageType] or litStageType[StageType.kNormal]
	local stageMap = self._stagesMap[type]
	local index = tonumber(index)

	return stageMap[self._mapList[type][index]]
end
