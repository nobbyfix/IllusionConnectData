require("dm.base.TimeUtil")

AudioTimerSystem = AudioTimerSystem or {}
local shareInjector = DmGame:getInstance()._injector

function AudioTimerSystem:getLoginAndEnterHomeSound(heroId)
	local customDataSystem = shareInjector:getInstance(CustomDataSystem)
	local lastLoginTime = customDataSystem:getValue(PrefixType.kGlobal, "lastLogin", -1)
	lastLoginTime = tonumber(lastLoginTime)
	local curTime = shareInjector:getInstance("GameServerAgent"):remoteTimestamp()
	curTime = math.ceil(curTime)
	local soundId = nil

	if lastLoginTime == -1 then
		soundId = "Voice_" .. heroId .. "_35"
	elseif curTime - lastLoginTime > 259200 then
		soundId = "Voice_" .. heroId .. "_38"
	else
		local today4TimeStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
			sec = 0,
			min = 0,
			hour = 4
		})

		if today4TimeStamp <= curTime and lastLoginTime < today4TimeStamp then
			soundId = "Voice_" .. heroId .. "_35"
		else
			local _tabCurTime = TimeUtil:getHMSByTimestamp(curTime)
			local hour = _tabCurTime.hour

			if hour >= 4 and hour < 11 then
				soundId = "Voice_" .. heroId .. "_53"
			elseif hour >= 11 and hour < 14 then
				soundId = "Voice_" .. heroId .. "_54"
			elseif hour >= 14 and hour < 18 then
				soundId = "Voice_" .. heroId .. "_55"
			elseif hour >= 18 and hour < 22 then
				soundId = "Voice_" .. heroId .. "_56"
			else
				soundId = "Voice_" .. heroId .. "_57"
			end
		end
	end

	customDataSystem:setValue(PrefixType.kGlobal, "lastLogin", curTime)

	return soundId
end

function AudioTimerSystem:getResumeHomeSound(heroId, weather)
	local mailSystem = shareInjector:getInstance(MailSystem)

	if mailSystem:queryRedPointState() then
		return "Voice_" .. heroId .. "_59"
	end

	local activitySystem = shareInjector:getInstance(ActivitySystem)
	local isActivity = activitySystem:hasRedPointForActivity(DailyGift)

	if isActivity then
		return "Voice_" .. heroId .. "_58"
	end

	local soundIdTab = {}

	if weather == ClimateType.Sunshine then
		soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_50"
	elseif weather == ClimateType.Rain or weather == ClimateType.RainS then
		soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_52"
	else
		soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_51"
	end

	local curTime = shareInjector:getInstance("GameServerAgent"):remoteTimestamp()
	local _tabCurTime = TimeUtil:getHMSByTimestamp(curTime)
	local hour = _tabCurTime.hour

	if hour >= 4 and hour < 11 then
		soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_53"
		soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_40_1"
	elseif hour >= 11 and hour < 22 then
		soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_40_2"

		if hour >= 11 and hour < 14 then
			soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_54"
		elseif hour >= 14 and hour < 18 then
			soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_55"
		elseif hour >= 18 and hour < 22 then
			soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_56"
		end
	else
		soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_40_3"
		soundIdTab[#soundIdTab + 1] = "Voice_" .. heroId .. "_57"
	end

	local randomNum = math.random(1, #soundIdTab)
	local soundId = soundIdTab[randomNum]

	if soundId == self._passSoundId then
		if randomNum == 1 then
			randomNum = randomNum + 1
		else
			randomNum = randomNum - 1
		end
	end

	self._passSoundId = soundIdTab[randomNum]

	return self._passSoundId
end
