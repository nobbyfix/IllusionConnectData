require("dm.gameplay.stage.model.EliteStagePoint")
require("dm.gameplay.stage.model.StageMap")

EliteStageMap = class("EliteStageMap", StageMap, _M)

function EliteStageMap:initialize(mapId)
	super.initialize(self, mapId)
end

function EliteStageMap:sync(mapData)
	local mapPointData = mapData and mapData.points or {}

	if self._index2Points == nil then
		self._index2Points = {}
		self._id2Points = {}
		local config = self:_getConfig()
		local pointIds = config.SubPoint
		local pointCount = #pointIds

		for index = 1, pointCount do
			local pointId = pointIds[index]
			local point = EliteStagePoint:new(pointId)

			point:setIndex(index)
			point:setOwner(self)

			local pointData = mapPointData[pointId]

			if pointData then
				if pointData.stars and next(pointData.stars) ~= nil then
					pointData.isPass = true
				end

				point:sync(pointData)
			end

			self._index2Points[index] = point
			self._id2Points[pointId] = point
		end

		self:setPointCount(pointCount)
	else
		for pointId, pointData in pairs(mapPointData) do
			local point = self._id2Points[pointId]

			if point then
				if pointData.stars and next(pointData.stars) ~= nil then
					pointData.isPass = true
				end

				point:sync(pointData)
			end
		end
	end

	self:initStoryPointMap()
	self:initPracticePointMap()

	for k, v in pairs(self._id2PracticePoint) do
		local prePointId = ConfigReader:getDataByNameIdAndKey("BlockPracticePoint", v, "PrePoint")
		local index = nil

		for i, point in ipairs(self._index2Points) do
			if point:getId() == prePointId then
				index = i + 1

				break
			end
		end

		local _point = self._index2Points[index]

		if _point then
			_point:setPrePracPoint(v)
		end
	end

	local mapBoxData = mapData and mapData.starRewards or {}

	if self._mapBoxData and mapBoxData then
		local revertBoxData = {}

		for _, starCount in pairs(mapBoxData) do
			revertBoxData[starCount] = true
		end

		local currentStarCount = self:getCurrentStarCount()

		for _, boxData in pairs(self._mapBoxData) do
			if revertBoxData[boxData.stars] then
				boxData.boxState = StageBoxState.kHasReceived
			elseif boxData.boxState ~= StageBoxState.kHasReceived then
				if boxData.stars <= currentStarCount then
					boxData.boxState = StageBoxState.kCanReceive
				else
					boxData.boxState = StageBoxState.kCannotReceive
				end
			end
		end
	end

	if mapData.continueDiamondTime then
		self._continueDiamondTime = mapData.continueDiamondTime
	end
end

function EliteStageMap:isPass()
	local points = self._index2Points
	local finalPoint = points[#points]
	local storyPoints = self._index2StoryPoint

	if storyPoints and #storyPoints > 0 then
		local finalStoryPoint = storyPoints[#storyPoints]

		return finalPoint:isPass() and finalStoryPoint:isPass()
	end

	return finalPoint:isPass()
end

function EliteStageMap:isBattlePointPass()
	local points = self._index2Points
	local finalPoint = points[#points]

	return finalPoint:isPass()
end
