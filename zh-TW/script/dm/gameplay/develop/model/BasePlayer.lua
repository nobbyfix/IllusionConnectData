BasePlayer = class("BasePlayer", objectlua.Object, _M)

BasePlayer:has("_uid", {
	is = "rw"
})
BasePlayer:has("_rid", {
	is = "rw"
})
BasePlayer:has("_cid", {
	is = "rw"
})
BasePlayer:has("_headId", {
	is = "rw"
})
BasePlayer:has("_nickName", {
	is = "rw"
})
BasePlayer:has("_exp", {
	is = "rw"
})
BasePlayer:has("_vipLevel", {
	is = "rw"
})
BasePlayer:has("_level", {
	is = "rw"
})
BasePlayer:has("_combat", {
	is = "rw"
})
BasePlayer:has("_energyData", {
	is = "rw"
})
BasePlayer:has("_slogan", {
	is = "rw"
})
BasePlayer:has("_gender", {
	is = "rw"
})
BasePlayer:has("_city", {
	is = "rw"
})
BasePlayer:has("_birthday", {
	is = "rw"
})
BasePlayer:has("_tags", {
	is = "rw"
})
BasePlayer:has("_firstRecharge", {
	is = "rw"
})
BasePlayer:has("_rechargeRewards", {
	is = "rw"
})
BasePlayer:has("_buyPackItems", {
	is = "rw"
})
BasePlayer:has("_generalReward", {
	is = "rw"
})
BasePlayer:has("_firstUpdateBirthDay", {
	is = "rw"
})
BasePlayer:has("_cheatCount", {
	is = "rw"
})
BasePlayer:has("_curHeadFrame", {
	is = "rw"
})
BasePlayer:has("_headFrames", {
	is = "rw"
})

function BasePlayer:initialize(config)
	super.initialize(self)

	self._level = 0

	self:setLevel(0)

	self._vipLevel = 0
	self._combat = 0
	self._exp = 0
	self._firstRecharge = 0
	self._rechargeRewards = {}
	self._slogan = ""
	self._buyPackItems = {}
	self._generalReward = {}
	self._birthday = "2000-01-01"
	self._firstUpdateBirthDay = false
	self._cheatCount = 0
	self._curHeadFrame = ""
	self._headFrames = {}
end

function BasePlayer:synchronizeInfoDiff(diffData)
	if not diffData then
		return
	end

	if diffData.level then
		self:setLevel(diffData.level)
	end

	if diffData.vipLevel then
		self:setVipLevel(diffData.vipLevel)
	end

	if diffData.uid then
		self:setUid(diffData.uid)
	end

	if diffData.rid then
		self:setRid(diffData.rid)
	end

	if diffData.cid then
		self:setCid(diffData.cid)
	end

	if diffData.heads and diffData.heads.currHead then
		self:setHeadId(tostring(diffData.heads.currHead))
	end

	if diffData.nickname then
		self:setNickName(diffData.nickname)
	end

	if diffData.vipLevel then
		self:setVipLevel(diffData.vipLevel)
	end

	if diffData.level then
		self:setLevel(diffData.level)
	end

	if diffData.combat then
		self:setCombat(diffData.combat)
	end

	if diffData.xp then
		self:setExp(diffData.xp)
	end

	if diffData.energy then
		self:setEnergyData(diffData.energy)
	end

	if diffData.slogan then
		self:setSlogan(Strings:get(diffData.slogan))
	end

	if diffData.gender then
		self:setGender(diffData.gender)
	end

	if diffData.city then
		self:setCity(diffData.city)
	end

	if diffData.birthday then
		self:setBirthday(diffData.birthday)
	end

	if diffData.tags then
		self:setTags(diffData.tags)
	end

	if diffData.firstRecharge then
		self:setFirstRecharge(diffData.firstRecharge)
	end

	if diffData.rechargeRewards then
		self:setRechargeRewards(diffData.rechargeRewards)
	end

	if diffData.buyPackItems then
		for i, v in pairs(diffData.buyPackItems) do
			local index = tonumber(i + 1)
			self._buyPackItems[index] = v
		end
	end

	if diffData.generalReward then
		for i, rewardType in pairs(diffData.generalReward) do
			self._generalReward[rewardType] = true
		end
	end

	if diffData.firstUpdateBirthDay ~= nil then
		self._firstUpdateBirthDay = diffData.firstUpdateBirthDay
	end

	if diffData.cheatCount then
		self:setCheatCount(diffData.cheatCount)
	end

	if diffData.curHeadFrame ~= nil then
		self._curHeadFrame = diffData.curHeadFrame
	end

	if diffData.headFrames ~= nil then
		self:setHeadFrames(diffData.headFrames)
	end
end

function BasePlayer:setHeadFrames(data)
	for id, value in pairs(data) do
		self._headFrames[id] = value
	end
end
