ActivityStagePoint = class("ActivityStagePoint")

ActivityStagePoint:has("_id", {
	is = "r"
})
ActivityStagePoint:has("_index", {
	is = "rw"
})
ActivityStagePoint:has("_starCount", {
	is = "rw"
})
ActivityStagePoint:has("_owner", {
	is = "rw"
})
ActivityStagePoint:has("_starState", {
	is = "r"
})
ActivityStagePoint:has("_config", {
	is = "r"
})
ActivityStagePoint:has("_oldStar", {
	is = "rw"
})
ActivityStagePoint:has("_oldRate", {
	is = "rw"
})
ActivityStagePoint:has("_firstPass", {
	is = "rw"
})
ActivityStagePoint:has("_hpRate", {
	is = "rw"
})
ActivityStagePoint:has("_isDailyFirstEnter", {
	is = "rw"
})

local inlineState = {
	kUnlock = 0,
	kFirstPass = 2,
	kNotPass = 1,
	kReadyPass = 3
}
local SwipState = {
	OFF = 0,
	ON = 1
}

function ActivityStagePoint:initialize(pointId)
	super.initialize(self)

	self._id = pointId
	self._starCount = 0
	self._hpRate = 1
	self._oldRate = 1
	self._firstPass = nil
	self._firstPassTag = false
	self._isDailyFirstEnter = true
	self._config = ConfigReader:getRecordById("ActivityBlockPoint", pointId)
end

function ActivityStagePoint:sync(data)
	if data.firstPass == nil then
		self._firstPass = true
		self._firstPassTag = false
	else
		if self._firstPass == nil then
			self._firstPassTag = false
		elseif self._firstPass == true and data.firstPass == false then
			self._firstPassTag = true
		else
			self._firstPassTag = false
		end

		self._firstPass = data.firstPass
	end

	if data.hpRate then
		self._hpRate = data.hpRate
	end

	if data.stars then
		self:setStarState(data.stars)
	end
end

function ActivityStagePoint:setStarState(stars)
	self._starState = {}

	for i = 1, 3 do
		self._starState[i] = false
	end

	self._starCount = 0

	for k, v in pairs(stars) do
		self._starState[v] = true
		self._starCount = self._starCount + 1
	end
end

function ActivityStagePoint:isUnlock()
	if not self._owner:isUnlock() then
		return false
	end

	local prePoints = self._config.OpenPoint
	local preStoryPoints = self._config.PreStoryPoint

	if prePoints[1] then
		local _point = self._owner:getPointById(prePoints[1])

		if _point and not _point:isPass() then
			return false
		end
	end

	if preStoryPoints[1] then
		local _point = self._owner:getStoryPointById(preStoryPoints[1])

		if _point and not _point:isPass() then
			return false
		end
	end

	return true
end

function ActivityStagePoint:getState()
	if not self:isUnlock() then
		return inlineState.kUnlock
	end

	if self._firstPass then
		return inlineState.kNotPass
	end

	if self._firstPassTag then
		return inlineState.kFirstPass
	end

	return inlineState.kReadyPass
end

function ActivityStagePoint:recordOldStar()
	self._oldStar = self._starState or {}
end

function ActivityStagePoint:recordHpRate()
	self._oldRate = self._hpRate
end

function ActivityStagePoint:isPass()
	return not self._firstPass
end

function ActivityStagePoint:getName()
	return Strings:get(self._config.Name)
end

function ActivityStagePoint:isBoss()
	return self._config.PointType == StagePointType.kBoss
end

function ActivityStagePoint:getDesc()
	return Strings:get(self._config.BlockDesc)
end

function ActivityStagePoint:getType()
	return self._config.Type
end

function ActivityStagePoint:getCostEnergy()
	return self._config.StaminaCost
end

function ActivityStagePoint:getStarCondition()
	return self._config.StarCondition
end

function ActivityStagePoint:getRecommendCombat()
	return self._config.CombatValue
end

function ActivityStagePoint:getHiddenStory()
	return self._config.HiddenStory or {}
end

function ActivityStagePoint:getGuideDesc()
	return self._config.SpecialRuleShow
end

function ActivityStagePoint:getShowRewards()
	local rewardId = self._config.ShowItem
	local rewards = ConfigReader:getDataByNameIdAndKey("Reward", rewardId, "Content")

	return rewards
end

function ActivityStagePoint:getShowFirstKillReward()
	local rewardId = self._config.FirstKillReward
	local rewards = ConfigReader:getDataByNameIdAndKey("Reward", rewardId, "Content")

	return rewards
end

function ActivityStagePoint:getChallengeTimes()
	return 10
end

function ActivityStagePoint:canWipeOnce()
	if SwipState.ON == self._config.IsSweep then
		local needStars = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Stage_Sweep_Stars", "content")

		if needStars <= self:getStarCount() then
			return true
		end

		return false
	end

	return false
end
