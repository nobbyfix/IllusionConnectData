require("dm.gameplay.activity.model.stageModel.ActivityStagePoint")
require("dm.gameplay.activity.model.ActivityColorEgg")

ActivityStage = class("ActivityStage")

ActivityStage:has("_mapCount", {
	is = "rw"
})
ActivityStage:has("_type", {
	is = "rw"
})
ActivityStage:has("_mapId", {
	is = "rw"
})
ActivityStage:has("_config", {
	is = "rw"
})
ActivityStage:has("_owner", {
	is = "rw"
})

local StageBoxState = {
	kCannotReceive = -1,
	kHasReceived = 1,
	kCanReceive = 0
}

function ActivityStage:initialize(stageType, id)
	self._mapCount = 0
	self._type = stageType
	self._mapId = id
	self._index2Points = nil
	self._id2Points = nil
	self._mapBoxData = nil
end

function ActivityStage:sync(data)
	if data.mapId then
		self._mapId = data.mapId
	end

	self._config = ConfigReader:getRecordById("ActivityBlockMap", self._mapId)

	self:syncPointInfo(data.points)
	self:syncStarInfo(data.starRewards)
	self:initStoryPointMap()
	self:initColorEggMap()
end

function ActivityStage:syncStarInfo(data)
	local mapBoxConfig = self._config.StarBoxReward

	if not self._mapBoxData then
		self._mapBoxData = {}

		for key, value in pairs(mapBoxConfig) do
			local stars = tonumber(key)
			local rewardId = value
			local boxData = {
				stars = stars,
				rewardId = rewardId
			}
			self._mapBoxData[#self._mapBoxData + 1] = boxData
		end

		table.sort(self._mapBoxData, function (a, b)
			return a.stars < b.stars
		end)
	end

	local mapBoxData = data
	local revertBoxData = {}

	for _, starCount in pairs(mapBoxData) do
		revertBoxData[starCount] = true
	end

	local currentStarCount = self:getCurrentStarCount()

	for _, boxData in pairs(self._mapBoxData) do
		if revertBoxData[boxData.stars] then
			boxData.lastState = boxData.boxState
			boxData.boxState = StageBoxState.kHasReceived
		elseif boxData.boxState ~= StageBoxState.kHasReceived then
			if boxData.stars <= currentStarCount then
				boxData.lastState = boxData.boxState
				boxData.boxState = StageBoxState.kCanReceive
			else
				boxData.lastState = boxData.boxState
				boxData.boxState = StageBoxState.kCannotReceive
			end
		end
	end
end

function ActivityStage:hasRedPoint()
	if not self._mapBoxData then
		return false
	end

	for _, boxData in pairs(self._mapBoxData) do
		if boxData.boxState and boxData.boxState == StageBoxState.kCanReceive then
			return true
		end
	end

	return false
end

function ActivityStage:getCurrentStarCount()
	local currentStarCount = 0

	for _, point in pairs(self._index2Points) do
		currentStarCount = currentStarCount + point:getStarCount()
	end

	return currentStarCount
end

function ActivityStage:setMapBoxReceived(stars)
	local mapBoxData = self._mapBoxData

	if not mapBoxData then
		return
	end

	for _, boxData in pairs(mapBoxData) do
		if boxData.stars == stars then
			boxData.boxState = StageBoxState.kHasReceived

			return
		end
	end
end

function ActivityStage:getMapBoxState(stars)
	local mapBoxData = self._mapBoxData

	if not mapBoxData then
		return
	end

	for _, boxData in pairs(mapBoxData) do
		if boxData.stars == stars then
			return boxData.boxState
		end
	end
end

function ActivityStage:syncPointInfo(data)
	if self._index2Points == nil then
		self._index2Points = {}
		self._id2Points = {}
		local pointIds = self._config.SubPoint

		for index = 1, #pointIds do
			local pointId = pointIds[index]
			local point = ActivityStagePoint:new(pointId)

			point:setIndex(index)
			point:setOwner(self)

			local pointData = data[pointId] or {}

			point:sync(pointData)

			self._index2Points[index] = point
			self._id2Points[pointId] = point
		end
	else
		for pointId, pointData in pairs(data) do
			local point = self._id2Points[pointId]

			if point then
				point:sync(pointData)
			end
		end
	end
end

function ActivityStage:initStoryPointMap()
	if self._index2StoryPoint == nil then
		self._index2StoryPoint = {}
		self._id2StoryPoint = {}
		local storyPointIds = self._config.SubStoryPoint or {}

		for index = 1, #storyPointIds do
			local storyPointId = storyPointIds[index]
			local storyPoint = StoryPoint:new(storyPointId, "ActivityStoryPoint")

			storyPoint:setIndex(index)
			storyPoint:setOwner(self)

			self._index2StoryPoint[index] = storyPoint
			self._id2StoryPoint[storyPointId] = storyPoint
		end

		local subPointIds = self._config.SubPoint or {}

		for index = 1, #subPointIds do
			local subPointId = subPointIds[index]
			local config = ConfigReader:getRecordById("ActivityBlockPoint", subPointId)

			if config.HiddenStory then
				for sPointId, v in pairs(config.HiddenStory) do
					local storyPoint = StoryPoint:new(sPointId, "ActivityStoryPoint")

					storyPoint:setIndex(#self._index2StoryPoint + 1)
					storyPoint:setOwner(self)
					storyPoint:setIsHidden(true)

					self._index2StoryPoint[#self._index2StoryPoint + 1] = storyPoint
					self._id2StoryPoint[sPointId] = storyPoint
				end
			end
		end
	end

	self:syncStoryPoint()
end

function ActivityStage:getStoryPoints()
	return self._index2StoryPoint
end

function ActivityStage:syncStoryPoint()
	local storyPointList = self._owner:getStorySet()

	for _, k in pairs(storyPointList) do
		if self._id2StoryPoint[k] ~= nil then
			self._id2StoryPoint[k]:sync({
				isPass = true
			})
		end
	end
end

function ActivityStage:getPointById(pointId)
	local point = self._id2Points[pointId]

	if point then
		return point, kStageTypeMap.point
	end

	point = self._id2StoryPoint[pointId]

	if point then
		return point, kStageTypeMap.StoryPoint
	end

	return nil
end

function ActivityStage:getStoryPointById(pointId)
	return self._id2StoryPoint[pointId]
end

function ActivityStage:initColorEggMap()
	if self._colorEggsMap == nil then
		self._colorEggsMap = {}
		local colorEggs = self._config.ColourEgg

		if colorEggs then
			for index = 1, #colorEggs do
				local eggId = colorEggs[index]
				local egg = ActivityColorEgg:new(eggId)
				self._colorEggsMap[eggId] = egg
			end
		end
	end
end

function ActivityStage:isUnlock()
	if self._type == StageType.kNormal then
		return true
	else
		local normalStage = self:getOwner():getStageByStageType(StageType.kNormal)

		return normalStage:isPass()
	end
end

function ActivityStage:isPass()
	local lastBattlePoint = self._index2Points[#self._index2Points]

	if self._index2StoryPoint and next(self._index2StoryPoint) then
		local lastStoryPoint = self._index2StoryPoint[#self._index2StoryPoint]

		for i = #self._index2StoryPoint, 0, -1 do
			if not self._index2StoryPoint[i]:getIsHidden() then
				lastStoryPoint = self._index2StoryPoint[i]

				break
			end
		end

		return lastBattlePoint:isPass() and lastStoryPoint:isPass()
	else
		return lastBattlePoint:isPass()
	end
end
