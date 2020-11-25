ClubBossTVType = {
	kLuxury = 3,
	kMiddle = 2,
	kDefault = 0,
	kNormal = 1
}
ClubBossHurtRewardStatus = {
	kCanGet = 2,
	kCannotGetButTip = 4,
	kHadGet = 3,
	kCanNotGet = 1
}
ClubBoss = class("ClubBoss", objectlua.Object, _M)

ClubBoss:has("_open", {
	is = "r"
})
ClubBoss:has("_season", {
	is = "r"
})
ClubBoss:has("_hurtTarget", {
	is = "r"
})
ClubBoss:has("_hurt", {
	is = "r"
})
ClubBoss:has("_nowPoint", {
	is = "r"
})
ClubBoss:has("_nowPointNum", {
	is = "r"
})
ClubBoss:has("_hpRate", {
	is = "r"
})
ClubBoss:has("_passAll", {
	is = "r"
})
ClubBoss:has("_tips", {
	is = "r"
})
ClubBoss:has("_score", {
	is = "r"
})
ClubBoss:has("_bossFightTimes", {
	is = "r"
})
ClubBoss:has("_bossFightTimesUpdataTime", {
	is = "r"
})
ClubBoss:has("_joinPoint", {
	is = "r"
})
ClubBoss:has("_hasGetAwards", {
	is = "r"
})
ClubBoss:has("_tiredHero", {
	is = "r"
})
ClubBoss:has("_hasGetHurtAward", {
	is = "r"
})
ClubBoss:has("_readTipTime", {
	is = "r"
})
ClubBoss:has("_team", {
	is = "r"
})
ClubBoss:has("_lastTeam", {
	is = "r"
})
ClubBoss:has("_lastFightTime", {
	is = "r"
})
ClubBoss:has("_name", {
	is = "r"
})

function ClubBoss:initialize()
	super.initialize(self)

	self._open = false
	self._season = ""
	self._hurtTarget = 0
	self._hurt = 0
	self._nowPoint = ""
	self._nowPointNum = 1
	self._hpRate = 0
	self._passAll = false
	self._allBossPoints = {}
	self._tips = {}
	self._score = {}
	self._bossFightTimes = 0
	self._bossFightTimesUpdataTime = 0
	self._joinPoint = 0
	self._hasGetAwards = {}
	self._tiredHero = {}
	self._hasGetHurtAward = false
	self._readTipTime = 0
	self._team = {}
	self._lastTeam = {}
	self._lastFightTime = 0
	self._name = Strings:get("clubBoss_TeamName")
end

function ClubBoss:sync(data, scoreData)
	if data.open ~= nil then
		self._open = data.open
	end

	if data.season then
		self._season = data.season
	end

	if data.hurtTarget then
		self._hurtTarget = data.hurtTarget
	end

	if data.hurt then
		self._hurt = data.hurt
	end

	if data.nowPoint then
		self._nowPoint = data.nowPoint
	end

	if data.nowPointNum then
		self._nowPointNum = data.nowPointNum
	end

	if data.hpRate then
		self._hpRate = data.hpRate
	end

	if data.passAll ~= nil then
		self._passAll = data.passAll
	end

	if data.gates then
		for index, dataValue in pairs(data.gates) do
			local oneBossPoint = ClubBossPoint:new(index)

			oneBossPoint:setClubBlockId(dataValue)

			self._allBossPoints[index] = oneBossPoint
		end
	end

	if data.passed then
		for index, dataValue in pairs(data.passed) do
			if self._allBossPoints[index] == nil then
				local oneBossPoint = ClubBossPoint:new(index)

				oneBossPoint:syncPassInfo(dataValue)

				self._allBossPoints[index] = oneBossPoint
			else
				self._allBossPoints[index]:syncPassInfo(dataValue)
			end
		end
	end

	if data.tips then
		self._tips = {}

		for ttype, tlist in pairs(data.tips) do
			local ntype = tonumber(ttype)

			if not self._tips[ntype] then
				self._tips[ntype] = {}
			end

			for _, vtip in ipairs(tlist) do
				local bossTip = ClubBossTip:new()

				bossTip:sync(vtip)
				table.insert(self._tips[ntype], bossTip)
			end
		end
	end

	if scoreData ~= nil then
		self._score = scoreData
	end
end

function ClubBoss:pushSync(data)
	if data.hurt then
		self._hurt = data.hurt
	end

	if data.pointId then
		local pointId = data.pointId

		if pointId ~= "" and pointId == self._nowPoint and data.rate then
			self._hpRate = data.rate
		end
	end
end

function ClubBoss:syncBasicInfo(data)
	if data.bossFightTimes then
		if data.bossFightTimes.value then
			self._bossFightTimes = data.bossFightTimes.value
		end

		if data.bossFightTimes.updateTime then
			self._bossFightTimesUpdataTime = data.bossFightTimes.updateTime
		end
	end

	if data.joinPoint then
		self._joinPoint = data.joinPoint
	end

	if data.getAwards then
		self._hasGetAwards = data.getAwards
	end

	if data.tiredHero then
		self._tiredHero = data.tiredHero
	end

	if data.getHurtAward ~= nil then
		self._hasGetHurtAward = data.getHurtAward
	end

	if data.readTipTime then
		self._readTipTime = data.readTipTime
	end

	if data.team then
		self._team = data.team
	end

	if data.lastteam then
		self._lastTeam = data.lastteam
	end

	if data.lastFightTime then
		self._lastFightTime = data.lastFightTime
	end

	if data.lastJoinTime then
		self._lastJoinTime = data.lastJoinTime
	end

	if data.joinedClubCount then
		self._joinedClubCount = data.joinedClubCount
	end
end

function ClubBoss:getShowAllBossList()
	local result = {}

	for index, dataValue in pairs(self._allBossPoints) do
		local onePoint = self._allBossPoints[index]
		local limit = self._nowPointNum + 3

		if self._nowPointNum < 4 then
			limit = 6
		end

		if onePoint:getPointNum() <= limit then
			result[onePoint:getPointNum()] = onePoint
		end
	end

	return result
end

function ClubBoss:checkHasGetHurtAward(PointNum, PointId)
	local result = ClubBossHurtRewardStatus.kCanGet

	if PointNum < self._joinPoint then
		result = ClubBossHurtRewardStatus.kCannotGetButTip

		return result
	end

	if self._nowPointNum < PointNum then
		result = ClubBossHurtRewardStatus.kCanNotGet

		return result
	end

	for k, onePonitNum in pairs(self._hasGetAwards) do
		if PointNum == onePonitNum then
			result = ClubBossHurtRewardStatus.kHadGet
		end
	end

	if PointNum == self._nowPointNum then
		if self._passAll == true then
			if result ~= ClubBossHurtRewardStatus.kHadGet then
				result = ClubBossHurtRewardStatus.kCanGet
			end
		else
			result = ClubBossHurtRewardStatus.kCanNotGet
		end
	end

	return result
end

function ClubBoss:checkHasRewardCanGet()
	local result = false
	local beganNum = self._joinPoint > 0 and self._joinPoint or 1

	for pointNum = beganNum, self._nowPointNum do
		if self:checkHasGetHurtAward(pointNum, nil) == ClubBossHurtRewardStatus.kCanGet then
			result = true

			break
		end
	end

	return result
end

function ClubBoss:checkDelayHurtRewardMark()
	local result = false

	if self._hurtTarget <= self._hurt and self._hasGetHurtAward == false and self._hurtTarget > 0 then
		result = true
	end

	return result
end

function ClubBoss:getAllScore()
	local result = 0

	if self._score then
		for k, v in pairs(self._score) do
			result = result + v
		end
	end

	return result
end

function ClubBoss:getCurrentSeasonConfig()
	local config = ConfigReader:getRecordById("ClubBlockArena", self._season)

	return config
end

function ClubBoss:getAllBossPointsVector()
	local allBossPointsVector = {}

	for k, v in pairs(self._allBossPoints) do
		allBossPointsVector[getPointNum()] = v
	end

	return allBossPointsVector
end

function ClubBoss:getBossPointsByPonitId(pointId)
	return self._allBossPoints[pointId]
end

function ClubBoss:getShowTVInfo()
	local showType = ClubBossTVType.kDefault

	for i = ClubBossTVType.kLuxury, ClubBossTVType.kNormal, -1 do
		if self._tips[i] and #self._tips[i] > 0 then
			showType = i

			break
		end
	end

	local tvinfo = nil

	if showType ~= ClubBossTVType.kDefault then
		tvinfo = self._tips[showType][1]

		table.remove(self._tips[showType], 1)
	end

	return showType, tvinfo
end

function ClubBoss:insertTVInfo(tip)
	local type = tip:getType()

	if self._tips and self._tips[type] then
		table.insert(self._tips[type], tip)
	end
end

ClubBossPoint = class("ClubBossPoint", objectlua.Object, _M)

ClubBossPoint:has("_pointId", {
	is = "r"
})
ClubBossPoint:has("_passTime", {
	is = "r"
})
ClubBossPoint:has("_winIde", {
	is = "r"
})
ClubBossPoint:has("_winName", {
	is = "r"
})
ClubBossPoint:has("_winShowId", {
	is = "r"
})
ClubBossPoint:has("_tableConfig", {
	is = "r"
})
ClubBossPoint:has("_blockId", {
	is = "r"
})

function ClubBossPoint:initialize(pointId)
	super.initialize(self)

	self._pointId = pointId
	self._passTime = 0
	self._winIde = ""
	self._winName = ""
	self._winShowId = ""
	self._tableConfig = {}
	local config = ConfigReader:getRecordById("ClubBlockPoint", pointId)

	if config ~= nil then
		self._tableConfig = config
	end
end

function ClubBossPoint:setClubBlockId(blockId)
	self._blockId = blockId
end

function ClubBossPoint:syncPassInfo(data)
	if data.passTime then
		self._passTime = data.passTime
	end

	if data.winId then
		self._winIde = data.winId
	end

	if data.winName then
		self._winName = data.winName
	end

	if data.winShowId then
		self._winShowId = data.winShowId
	end
end

function ClubBossPoint:getPointName()
	local result = ""

	if self._tableConfig ~= nil and self._tableConfig.Name ~= nil then
		result = Strings:get(self._tableConfig.Name)
	end

	return result
end

function ClubBossPoint:getPointNum()
	local result = 0

	if self._tableConfig ~= nil and self._tableConfig.Num ~= nil then
		result = self._tableConfig.Num
	end

	return result
end

function ClubBossPoint:getPointType()
	local result = "NORMAL"

	if self._tableConfig ~= nil and self._tableConfig.Type ~= nil then
		result = self._tableConfig.Type
	end

	return result
end

function ClubBossPoint:getZoom()
	local result = 1

	if self._tableConfig ~= nil and self._tableConfig.Amplify ~= nil then
		result = checknumber(self._tableConfig.Amplify)
	end

	return result
end

function ClubBossPoint:getNextPoint()
	local result = ""

	if self._tableConfig ~= nil and self._tableConfig.NextPoint ~= nil then
		result = self._tableConfig.NextPoint
	end

	return result
end

function ClubBossPoint:getBlockConfig()
	local config = ConfigReader:getRecordById("ClubBlockBattle", self._blockId)

	return config
end

ClubBossTip = class("ClubBossTip", objectlua.Object, _M)

ClubBossTip:has("_type", {
	is = "r"
})
ClubBossTip:has("_name", {
	is = "r"
})
ClubBossTip:has("_gate", {
	is = "r"
})
ClubBossTip:has("_hurt", {
	is = "r"
})
ClubBossTip:has("_heroId", {
	is = "r"
})
ClubBossTip:has("_time", {
	is = "r"
})
ClubBossTip:has("_head", {
	is = "r"
})
ClubBossTip:has("_headFrame", {
	is = "r"
})
ClubBossTip:has("_id", {
	is = "r"
})
ClubBossTip:has("_item", {
	is = "r"
})

function ClubBossTip:initialize()
	super.initialize(self)

	self._type = 0
	self._name = ""
	self._gate = 0
	self._hurt = 0
	self._heroId = ""
	self._time = 0
	self._head = ""
	self._headFrame = ""
	self._id = ""
	self._item = {}
end

function ClubBossTip:sync(data)
	if data.type then
		self._type = data.type
	end

	if data.name then
		self._name = data.name
	end

	if data.gate then
		self._gate = data.gate
	end

	if data.hurt then
		self._hurt = data.hurt
	end

	if data.getHeroId then
		local cjson = require("cjson.safe")
		local logs = cjson.decode(data.getHeroId)

		if logs ~= nil then
			self._item = logs
		else
			self._heroId = data.getHeroId
		end
	end

	if data.time then
		self._time = data.time
	end

	if data.head then
		self._head = data.head
	end

	if data.headFrame then
		self._headFrame = data.headFrame
	end

	if data.id then
		self._id = data.id
	end
end
