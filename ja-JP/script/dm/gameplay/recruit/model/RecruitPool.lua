RecruitPool = class("RecruitPool", objectlua.Object, _M)

RecruitPool:has("_id", {
	is = "r"
})
RecruitPool:has("_freeTimes", {
	is = "rw"
})
RecruitPool:has("_owner", {
	is = "rw"
})

function RecruitPool:initialize(id)
	super.initialize(self)

	self._id = id
	self._config = ConfigReader:getRecordById("DrawCard", id)
	self._freeTimes = 0
end

function RecruitPool:dispose()
	super.dispose(self)
end

function RecruitPool:sync(data)
	if data.value then
		self._freeTimes = data.value
	end
end

function RecruitPool:getType()
	return self._config.DrawCardType
end

function RecruitPool:getName()
	return Strings:get(self._config.DrawCardName)
end

function RecruitPool:getNameEn()
	return Strings:get(self._config.DrawCardENName)
end

function RecruitPool:getRank()
	return self._config.Rank
end

function RecruitPool:getRealCostIdAndCount()
	local couponCount = self:CouponCost()
	local costId = self:getCouponId()
	local count1 = nil
	local count2 = couponCount[2]
	count1 = self._freeTimes > 0 and 0 or couponCount[1]

	if count2 then
		return {
			{
				costId = costId,
				costCount = count1
			},
			{
				costId = costId,
				costCount = count2
			}
		}
	else
		return {
			{
				costId = costId,
				costCount = count1
			}
		}
	end
end

function RecruitPool:getCouponId()
	return self._config.Coupon
end

function RecruitPool:CouponCost()
	return self._config.CouponCost
end

function RecruitPool:getRareDesc()
	return self._config.DrawCardDesc or {}
end

function RecruitPool:getRareTitle()
	return self._config.DrawCardDescTitle
end

function RecruitPool:getShortDesc()
	return self._config.ShortDesc
end

function RecruitPool:getShortDescEn()
	return self._config.ShortENDesc
end

function RecruitPool:getDescList()
	return self._config.ReviewText
end

function RecruitPool:getSpecialDescList()
	return self._config.ReviewTextSpecial
end

function RecruitPool:getRecruitTimes()
	return self._config.Number
end

function RecruitPool:getPreview()
	return self._config.Preview
end

function RecruitPool:getShowRewards()
	return self._config.ShowReward
end

function RecruitPool:getSpecialRewardTimes()
	return self._config.Times[2]
end

function RecruitPool:getNormalReward()
	local rewardId = self._config.NormalReward

	return rewardId and RewardSystem:getRewardsById(rewardId) or nil
end

function RecruitPool:getCondition()
	return self._config.Condition
end

function RecruitPool:getDrawLimit()
	return self._config.DrawLimit
end

function RecruitPool:hasDrawLimit()
	return self:getDrawLimit() ~= -1
end

function RecruitPool:getOffCount()
	return self._config.OffCount
end

function RecruitPool:getPoolInfo()
	return self._config.DrawCardUPDesc or {}
end

function RecruitPool:getRoleDetail()
	return self._config.RoleDetail
end

function RecruitPool:getLink()
	return self._config.Link
end
