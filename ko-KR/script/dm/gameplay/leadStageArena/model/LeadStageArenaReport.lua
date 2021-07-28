LeadStageArenaReportRole = class("LeadStageArenaReportRole", objectlua.Object, _M)

LeadStageArenaReportRole:has("_id", {
	is = "r"
})
LeadStageArenaReportRole:has("_level", {
	is = "r"
})
LeadStageArenaReportRole:has("_headImg", {
	is = "r"
})
LeadStageArenaReportRole:has("_nickname", {
	is = "r"
})

function LeadStageArenaReportRole:initialize()
	super.initialize(self)

	self._id = nil
	self._level = 0
	self._headImg = nil
	self._nickname = ""
end

function LeadStageArenaReportRole:synchronize(data)
	for i, v in pairs(data) do
		self["_" .. i] = v
	end
end

LeadStageArenaReport = class("LeadStageArenaReport", objectlua.Object, _M)

LeadStageArenaReport:has("_id", {
	is = "r"
})
LeadStageArenaReport:has("_index", {
	is = "r"
})
LeadStageArenaReport:has("_seasonId", {
	is = "r"
})
LeadStageArenaReport:has("_winRid", {
	is = "r"
})
LeadStageArenaReport:has("_rid", {
	is = "r"
})
LeadStageArenaReport:has("_rivalId", {
	is = "r"
})
LeadStageArenaReport:has("_defender", {
	is = "r"
})
LeadStageArenaReport:has("_attacker", {
	is = "r"
})
LeadStageArenaReport:has("_watchFlag", {
	is = "r"
})
LeadStageArenaReport:has("_baseWinCoin", {
	is = "r"
})
LeadStageArenaReport:has("_increase", {
	is = "r"
})
LeadStageArenaReport:has("_fightRecordMap", {
	is = "r"
})
LeadStageArenaReport:has("_outOfTime", {
	is = "r"
})
LeadStageArenaReport:has("_winTimes", {
	is = "r"
})
LeadStageArenaReport:has("_isBattleResult", {
	is = "r"
})
LeadStageArenaReport:has("_extraWinCoin", {
	is = "r"
})
LeadStageArenaReport:has("_loseTimes", {
	is = "r"
})
LeadStageArenaReport:has("_isLeaveBattle", {
	is = "r"
})

function LeadStageArenaReport:initialize(index)
	super.initialize(self)

	self._index = index
	self._id = nil
	self._seasonId = ""
	self._winRid = ""
	self._rid = ""
	self._attacker = nil
	self._defender = nil
	self._recordMills = 0
	self._attackerWin = false
	self._extraWinCoin = 0
	self._watchFlag = false
	self._baseWinCoin = 0
	self._increase = 0
	self._fightRecordMap = {}
	self._outOfTime = false
	self._isBattleResult = false
	self._winTimes = 0
	self._loseTimes = 0
	self._isLeaveBattle = false
end

function LeadStageArenaReport:synchronize(data)
	if data.reportId then
		self._id = data.reportId
	end

	if data.seasonId then
		self._seasonId = data.seasonId
	end

	if data.winRid then
		self._winRid = data.winRid
	end

	if data.watchFlag then
		self._watchFlag = data.watchFlag
	end

	if data.baseWinCoin then
		self._baseWinCoin = data.baseWinCoin
	end

	if data.extraWinCoin then
		self._extraWinCoin = data.extraWinCoin
	end

	if data.increase then
		self._increase = data.increase
	end

	if data.fightRecordMap then
		self._fightRecordMap = data.fightRecordMap
	end

	if data.winTimes then
		self._winTimes = data.winTimes
	end

	if data.outOfTime then
		self._outOfTime = data.outOfTime
	end

	if data.isBattleResult then
		self._isBattleResult = data.isBattleResult
	end

	if data.loseTimes then
		self._loseTimes = data.loseTimes
	end

	if data.leaveBattle then
		self._isLeaveBattle = data.leaveBattle
	end

	if data.rivalId then
		if not self._defender then
			self._defender = LeadStageArenaReportRole:new()
		end

		local d = {
			id = data.rivalId,
			level = data.rivalLevel,
			headImg = data.rivalHeadImage,
			nickname = data.rivalNickname or ""
		}

		self._defender:synchronize(d)
	end

	if data.rid then
		self._rid = data.rid

		if not self._attacker then
			self._attacker = LeadStageArenaReportRole:new()
		end

		local d = {
			id = data.rid,
			level = data.level or 0,
			headImg = data.headImg,
			nickname = data.nickname or ""
		}

		self._attacker:synchronize(d)
	end
end

function LeadStageArenaReport:getAttackerWin()
	return self._winRid == self._rid
end
