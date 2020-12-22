RewardSystem = class("RewardSystem", legs.Actor)

function RewardSystem:initialize(developSystem)
	super.initialize(self)

	self._developSystem = developSystem
end

function RewardSystem:userInject(injector)
end

RewardType = {
	kKernel = 5,
	kExp = 1,
	kSpecialValue = 4,
	kEquip = 6,
	kEquipExplore = 11,
	kRewardLink = 9,
	kBuff = 17,
	kItem = 2,
	kHero = 3,
	kShow = 99,
	kSurface = 7,
	kStory = "STORY",
	kInvalid = -1
}
RewardRandomType = {
	kOnce = "Once",
	kTimes = "Times",
	kOnce2 = "Once2",
	kQQLevel = "QQLevel",
	kSeeds = "Seeds",
	kArrays = "Arrays",
	kVIP = "VIP",
	kLevel = "Level",
	kTimesResetByMaxValue = "TimesResetByMaxValue",
	kFixed = "Fixed"
}
local kTypeCodeMap = {
	{
		["0"] = "Exp",
		["1"] = "xxx"
	},
	[4] = {
		["1"] = ConfigReader:getRecordById("ConfigValue", "ActiveRewardChange").content,
		["8"] = ConfigReader:getRecordById("ConfigValue", "PansLabGOLDChange").content
	}
}
local kRewardConfig = {
	[RewardType.kRewardLink] = {
		name = Strings:get(ConfigReader:getDataByNameIdAndKey("ConfigValue", "MysteryItemName", "content")),
		desc = Strings:get(ConfigReader:getDataByNameIdAndKey("ConfigValue", "MysteryItemDesc", "content"))
	},
	[RewardType.kStory] = {
		name = Strings:get(ConfigReader:getDataByNameIdAndKey("ConfigValue", "StoryItemName", "content")),
		desc = Strings:get(ConfigReader:getDataByNameIdAndKey("ConfigValue", "StoryItemDesc", "content"))
	}
}

function RewardSystem:getFixedAmount(rewardId)
	if rewardId then
		local Reward = ConfigReader:getRecordById("Reward", rewardId)

		if Reward and Reward.Content then
			local firstData = Reward.Content[1]

			return firstData and firstData.amount
		end
	end
end

function RewardSystem.class:getName(rewardData)
	local info = rewardData
	local rewardConfig = kRewardConfig[rewardData.type]

	if rewardConfig then
		return rewardConfig.name
	end

	if rewardData.type ~= nil and rewardData.code ~= nil then
		info = self:parseInfo(rewardData)
	end

	assert(info ~= nil, "error:rewardData=nil")
	assert(info.id ~= nil, "error:id error")

	local id = tostring(info.id)

	if info.rewardType then
		if info.rewardType == RewardType.kSurface then
			local config = ConfigReader:getRecordById("Surface", id)

			if config and config.Id then
				return Strings:get(config.Name)
			end
		elseif info.rewardType == RewardType.kHero then
			local config = ConfigReader:getRecordById("HeroBase", id)

			if config and config.Id then
				return Strings:get(config.Name)
			end
		elseif info.rewardType == RewardType.kEquip or info.rewardType == RewardType.kEquipExplore then
			local config = ConfigReader:getRecordById("HeroEquipBase", id)

			if config and config.Id then
				return Strings:get(config.Name)
			end
		end
	end

	local config = ConfigReader:getRecordById("ItemConfig", id)

	if config and config.Id then
		return Strings:get(config.Name)
	end

	config = ConfigReader:getRecordById("ResourcesIcon", id)

	if config then
		return Strings:get(config.Name)
	end

	config = ConfigReader:getRecordById("Skill", id)

	if config and config.Id then
		return Strings:get(config.Name)
	end

	config = ConfigReader:getRecordById("MasterCoreBase", id)

	if config and config.Id then
		return Strings:get(config.Name)
	end

	config = ConfigReader:getRecordById("PlayerHeadFrame", id)

	if config and config.Id then
		return Strings:get(config.Name)
	end

	return ""
end

function RewardSystem.class:getQuality(rewardData)
	local info = rewardData

	if rewardData.type == RewardType.kRewardLink or rewardData.type == RewardType.kStory then
		return rewardData.quality
	end

	if rewardData.type ~= nil and rewardData.code ~= nil then
		info = self:parseInfo(rewardData)
	end

	assert(info ~= nil, "error:rewardData=nil")
	assert(info.id ~= nil, "error:id error")

	local id = tostring(info.id)

	if info.rewardType then
		if info.rewardType == RewardType.kSurface then
			local config = ConfigReader:getRecordById("Surface", id)

			if config and config.Id then
				return config.Quality
			end
		elseif info.rewardType == RewardType.kHero then
			local config = ConfigReader:getRecordById("HeroBase", id)

			if config and config.Id then
				local qualityConfig = ConfigReader:getRecordById("HeroQuality", config.BaseQualityAttr)

				return math.floor(qualityConfig.Quality / 10)
			end
		elseif info.rewardType == RewardType.kEquip or info.rewardType == RewardType.kEquipExplore then
			local config = ConfigReader:getRecordById("HeroEquipBase", id)

			if config and config.Id then
				return config.Rareity
			end
		end
	end

	local config = ConfigReader:getRecordById("ResourcesIcon", id)

	if config then
		local index = nil

		if rewardData.amount then
			for i, num in ipairs(config.Segmentation) do
				if rewardData.amount < num then
					index = i - 1

					break
				end
			end

			index = index ~= nil and math.max(index, 1) or math.min(#config.Segmentation, #config.LargeIcons)
		else
			index = 1
		end

		local quality = rewardData.quality or config.Quality[index] or config.Quality[1]

		return quality
	end

	config = ConfigReader:getRecordById("ItemConfig", id)

	if config and config.Id then
		return config.Quality
	end

	config = ConfigReader:getRecordById("HeroBase", id)

	if config and config.Id then
		local qualityConfig = ConfigReader:getRecordById("HeroQuality", config.BaseQualityAttr)

		return math.floor(qualityConfig.Quality / 10)
	end

	config = ConfigReader:getRecordById("MasterCoreBase", id)

	if config and config.Id then
		return config.Quality
	end
end

function RewardSystem.class:getDesc(rewardData)
	local info = rewardData
	local rewardConfig = kRewardConfig[rewardData.type]

	if rewardConfig then
		return rewardConfig.name
	end

	if rewardData.type ~= nil and rewardData.code ~= nil then
		info = self:parseInfo(rewardData)
	end

	assert(info ~= nil, "error:rewardData=nil")
	assert(info.id ~= nil, "error:id error")

	local id = tostring(info.id)

	if info.rewardType then
		if info.rewardType == RewardType.kSurface then
			local config = ConfigReader:getRecordById("Surface", id)

			if config and config.Id then
				return Strings:get(config.Desc)
			end
		elseif info.rewardType == RewardType.kHero then
			local config = ConfigReader:getRecordById("HeroBase", id)

			if config and config.Id then
				return Strings:get(config.ShortDesc)
			end
		elseif info.rewardType == RewardType.kEquip or info.rewardType == RewardType.kEquipExplore then
			local config = ConfigReader:getRecordById("HeroEquipBase", id)

			if config and config.Id then
				return Strings:get(config.Desc)
			end
		end
	end

	local config = ConfigReader:getRecordById("ItemConfig", id)

	if config and config.Id then
		return Strings:get(config.FunctionDesc ~= "" and config.FunctionDesc or config.Desc)
	end

	config = ConfigReader:getRecordById("ResourcesIcon", id)

	if config then
		return Strings:get(config.Desc)
	end

	config = ConfigReader:getRecordById("Skill", id)

	if config and config.Id then
		return config.desc
	end

	config = ConfigReader:getRecordById("PlayerHeadFrame", id)

	if config and config.Id then
		return Strings:get(config.Desc)
	end

	return ""
end

function RewardSystem.class:parseInfo(rewardData)
	if rewardData.type == RewardType.kRewardLink or rewardData.type == RewardType.kStory then
		rewardData.id = "random"

		return rewardData
	end

	if rewardData.type == RewardType.kShow then
		local info = {
			rewardType = RewardType.kShow,
			icon = rewardData.icon or "",
			title = rewardData.title or "",
			desc = rewardData.desc or "",
			tips = rewardData.tips or ""
		}

		return info
	end

	assert(rewardData ~= nil, "error:rewardData=nil")
	assert(rewardData.type ~= nil and rewardData.code ~= nil and rewardData.amount ~= nil, "error:config error")

	if rewardData.typeValue then
		rewardData.type = rewardData.typeValue
	end

	local intType = tonumber(rewardData.type)
	local strCode = tostring(rewardData.code)
	local info = {
		amount = rewardData.amount,
		rewardType = intType,
		clipIndex = rewardData.clipIndex,
		showEquipAmount = rewardData.showEquipAmount
	}

	if kTypeCodeMap[intType] then
		if intType == 4 then
			info.id = kTypeCodeMap[intType][strCode]
		else
			info.id = kTypeCodeMap[intType][strCode]

			assert(info.id ~= nil, "error:no code=" .. tostring(rewardData.code) .. " of type " .. tostring(intType))

			local config = ConfigReader:getRecordById("ResourcesIcon", info.id)
			local index = nil

			for i, num in ipairs(config.Segmentation) do
				if info.amount < num then
					index = i - 1

					break
				end
			end

			index = index ~= nil and math.max(index, 1) or #config.Segmentation
			info.quality = config.Quality[index]
		end
	elseif intType == RewardType.kHero then
		info.id = rewardData.code
		info.star = rewardData.amount
		info.level = 1
		local heroConfig = ConfigReader:getRecordById("HeroBase", info.id)

		if heroConfig ~= nil then
			local qualityConfig = ConfigReader:getRecordById("HeroQuality", heroConfig.BaseQualityAttr)
			info.quality = qualityConfig.Quality
			info.modelId = info.modelId or heroConfig.BattleModel
		end
	elseif intType == RewardType.kBuff then
		info.id = rewardData.code
		info.buffType = rewardData.buffType or "Buff"
		info.desc = rewardData.desc
		info.title = rewardData.title
		info.icon = rewardData.icon
	else
		info.id = rewardData.code
	end

	return info
end

function RewardSystem:isCurrency(Reward)
	return Reward and Reward.type == RewardType.kCurrency
end

function RewardSystem.class:getRewardsById(id, param)
	if not id or id == "" then
		return {}
	end

	local config = ConfigReader:requireRecordById("Reward", id)
	local type = config.RandomType
	local rewards = config.Content

	if type == RewardRandomType.kFixed then
		local showRewards = {}

		for i = 1, #rewards do
			if rewards[i].code ~= 3 then
				table.insert(showRewards, rewards[i])
			end
		end

		return showRewards
	elseif type == RewardRandomType.kLevel or type == RewardRandomType.kVIP then
		if param then
			return rewards[param] or {}
		end

		local showRewards = {}

		for i = 1, #rewards do
			for level, data in pairs(rewards[i]) do
				for index = 1, #data do
					showRewards[#showRewards + 1] = data[index]
				end
			end
		end

		return showRewards
	elseif type == RewardRandomType.kOnce or type == RewardRandomType.kOnce2 or type == RewardRandomType.kTimes or type == RewardRandomType.kTimesResetByMaxValue or type == RewardRandomType.kArrays then
		local showRewards = {}

		for i = 1, #rewards do
			for level, data in pairs(rewards[i]) do
				for index = 1, #data do
					showRewards[#showRewards + 1] = data[index]
				end
			end
		end

		return showRewards
	elseif type == RewardRandomType.kSeeds then
		-- Nothing
	end

	return {}
end
