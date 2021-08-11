require("dm.gameplay.activity.model.stageModel.ActivityStageNew")
require("dm.gameplay.develop.model.team.Team")
require("dm.gameplay.stage.model.StageManager")

ActivityBlockMapNewActivity = class("ActivityBlockMapNewActivity", BaseActivity, _M)

ActivityBlockMapNewActivity:has("_team", {
	is = "rw"
})
ActivityBlockMapNewActivity:has("_storySet", {
	is = "rw"
})
ActivityBlockMapNewActivity:has("_mapList", {
	is = "rw"
})

function ActivityBlockMapNewActivity:initialize()
	self._stagesMap = {}
	self._storySet = {}
	self._stagesMap = {}
	self._mapList = {}
end

function ActivityBlockMapNewActivity:synchronize(data)
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

function ActivityBlockMapNewActivity:syncStageInfo(data)
	for id, map in pairs(data) do
		if not self._stagesMap[id] then
			local stage = ActivityStageNew:new(id)
			self._stagesMap[id] = stage

			self._stagesMap[id]:setOwner(self)

			self._mapList[table.indexof(self._activityConfig.ActivityBlockMap, id)] = stage
		end

		self._stagesMap[id]:sync(map)
	end
end

function ActivityBlockMapNewActivity:initStoryInfo(data)
	for k, _stage in pairs(self._stagesMap) do
		_stage:initStoryPointMap()
	end
end

function ActivityBlockMapNewActivity:hasRedPoint()
	for k, stage in pairs(self._stagesMap) do
		local points = stage:getIndex2Points()

		for index, point in ipairs(points) do
			if point and point:isPass() and not point:isPerfect() then
				local developSystem = DmGame:getInstance()._injector:getInstance(DevelopSystem)
				local player = developSystem:getPlayer()
				local value = cc.UserDefault:getInstance():getBoolForKey("activityStageRed" .. point:getId() .. player:getRid(), flase)

				if not value then
					return true
				end
			end
		end
	end

	local gallerySystem = DmGame:getInstance()._injector:getInstance(GallerySystem)

	if gallerySystem:getStoryPackRedPointByType(GalleryMemoryPackType.ACTIVI) then
		return true
	end

	return false
end

function ActivityBlockMapNewActivity:getStageByStageIndex(stageIndex)
	return self._mapList[stageIndex]
end

function ActivityBlockMapNewActivity:getActivityMapById(mapId)
	for k, stage in pairs(self._stagesMap) do
		if mapId == stage._mapId then
			return stage
		end
	end

	return self._mapList[1]
end

function ActivityBlockMapNewActivity:getPointById(pointId)
	if not pointId then
		return
	end

	local mapid = ConfigReader:getDataByNameIdAndKey("ActivityBlockSort", pointId, "Map")
	mapid = mapid or ConfigReader:getDataByNameIdAndKey("ActivityStoryPoint", pointId, "Map")

	if not mapid then
		return
	end

	local stage = self:getActivityMapById(mapid)

	return stage:getPointById(pointId)
end

function ActivityBlockMapNewActivity:getSubPointById(pointId)
	if not pointId then
		return
	end

	local sortId = ConfigReader:getDataByNameIdAndKey("ActivityBlockBattle", pointId, "Map")
	local mapid = ConfigReader:getDataByNameIdAndKey("ActivityBlockSort", sortId, "Map")
	mapid = mapid or ConfigReader:getDataByNameIdAndKey("ActivityStoryPoint", sortId, "Map")

	if not mapid then
		return
	end

	local stage = self:getActivityMapById(mapid)
	local sortPoint = stage:getPointById(sortId)

	return sortPoint:getPointById(pointId)
end

function ActivityBlockMapNewActivity:getMapIdByStageIndex(stageIndex)
	local stage = self:getStageByStageIndex(stageIndex)

	return stage:getMapId()
end

function ActivityBlockMapNewActivity:getMapIndexByMap(mapId)
	for index, value in ipairs(self._mapList) do
		if value:getMapId() == mapId then
			return index
		end
	end

	return nil
end

function ActivityBlockMapNewActivity:getMapIdStartTimeByStageType(stageIndex)
	local stage = self:getStageByStageIndex(stageIndex)

	return stage:getStartTimestamp()
end

function ActivityBlockMapNewActivity:getStageTypeById(pointId)
	local point = self:getPointById(pointId)

	return point:getType()
end

function ActivityBlockMapNewActivity:getMapIdByPointId(pointId)
	local mapid = ConfigReader:getDataByNameIdAndKey("ActivityBlockSort", pointId, "Map")
	mapid = mapid or ConfigReader:getDataByNameIdAndKey("ActivityStoryPoint", pointId, "Map")

	return mapid
end

function ActivityBlockMapNewActivity:getMapIdexBySortId(sortId)
	if not sortId then
		return
	end

	local mapid = self:getMapIdByPointId(sortId)

	if not mapid then
		return nil
	end

	local mapIndex = self:getMapIndexByMap(mapid)

	return mapIndex
end

function ActivityBlockMapNewActivity:getAssistEnemyInfo(enemyId)
	local enemyInfo = ConfigReader:getRecordById("EnemyHero", enemyId)

	if not enemyInfo then
		return nil
	end

	local heroData = {
		awakenLevel = 0,
		isNpc = true,
		id = enemyInfo.Id,
		level = enemyInfo.Level,
		star = enemyInfo.Star,
		rareity = enemyInfo.Rarity,
		name = Strings:get(enemyInfo.Name or "NPC"),
		roleModel = enemyInfo.RoleModel,
		type = enemyInfo.Type,
		cost = enemyInfo.Cost,
		combat = enemyInfo.Combat,
		maxStar = HeroStarCountMax
	}

	return heroData
end

function ActivityBlockMapNewActivity:getAssistEnemyList(mapId)
	local list = {}

	for mapId, stage in ipairs(self._stagesMap) do
		local points = stage:getIndex2Points()

		for index, pointId in ipairs(points) do
			local assistEnemy = self:getPointById(pointId):getAssistEnemy()

			for i, enemyId in ipairs(assistEnemy) do
				local enemyData = self:getAssistEnemyInfo(enemyId)

				if enemyData then
					list[#list + 1] = enemyData
				end
			end
		end
	end

	return list
end

function ActivityBlockMapNewActivity:isHeroAttrStarExtra()
	return false
end

function ActivityBlockMapNewActivity:isAllPointPass(stageType)
	for mapId, stage in ipairs(self._stagesMap) do
		local points = stage:getIndex2Points()

		for index, pointId in ipairs(points) do
			for _, point in ipairs(points) do
				local isPass = point:isPass()

				if not isPass then
					return false
				end
			end
		end
	end

	return true
end
