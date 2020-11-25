ClubSystem = class("ClubSystem", legs.Actor)

ClubSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
ClubSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ClubSystem:has("_clubService", {
	is = "r"
}):injectWith("ClubService")
ClubSystem:has("_listenPush", {
	is = "rw"
})

ClubPositionNameStr = {
	[ClubPosition.kProprieter] = Strings:get("Club_Text124"),
	[ClubPosition.kDeputyProprieter] = Strings:get("Club_Text125"),
	[ClubPosition.kElite] = Strings:get("Club_Text126"),
	[ClubPosition.kMember] = Strings:get("Club_Text127")
}
ClubHallType = {
	kBasicInfo = 1,
	kBoss = 6,
	kAudit = 3,
	kActivityBoss = 7,
	kLog = 4,
	kTechnology = 5
}
ClubPositionShowTitle = {
	ClubPosition.kProprieter,
	ClubPosition.kDeputyProprieter,
	ClubPosition.kElite
}

function ClubSystem:initialize()
	super.initialize(self)

	self._enterClubBossBattle = false
	self._clubBossKilled = false
	self._activityClubBossKilled = false
	self._enterClubBossBattle = false
	self._enterClubBossBattleViewType = 0
	self._forcedLeaveClub = false
	self._resetKey = {}
	self._summerActivityId = ""
	self._summerActivity = nil
	self._ClubBossBattleCount = {}
	self._ClubActivityBossBattleCount = {}
end

function ClubSystem:userInject(injector)
	self:requestClubInfo(function ()
		self:requestClubBossInfo(nil)
	end)
	self:requestClubBattleData(nil, false)
	self:refreshClubBossSummerActivityData()
end

function ClubSystem:getClub()
	return self._developSystem:getPlayer():getClub()
end

function ClubSystem:getClubInfoOj()
	return self:getClub():getInfo()
end

function ClubSystem:getHasJoinClub()
	return self:getClubId() ~= ""
end

function ClubSystem:getClubId()
	return self:getClubInfoOj():getClubId()
end

function ClubSystem:getAuditConditionOj()
	return self:getClubInfoOj():getAuditCondition()
end

function ClubSystem:getName()
	local clubId = self:getClubId()

	if clubId == "" then
		return Strings:get("Petrace_Text_78")
	end

	return self:getClubInfoOj():getName()
end

function ClubSystem:getLevel()
	return self:getClubInfoOj():getLevel()
end

function ClubSystem:onClickEditTeam(viewType)
	local team = self:getClubBoss(viewType):getLastTeam()
	local curUpdateTime = self:getClubBoss(viewType):getLastFightTime()
	local curDayTime = TimeUtil:getTimeByDateForTargetTimeInToday({
		sec = 0,
		min = 0,
		hour = 5
	})

	if curUpdateTime < curDayTime then
		team = self:getClubBoss(viewType):getTeam()
	end

	local view = self:getInjector():getInstance("ClubBossTeamView")
	local bossFightTimes = self:getClubBoss(viewType):getBossFightTimes()

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
		team = team,
		viewType = viewType
	}))
end

function ClubSystem:showRankView()
	local rankSystem = self:getInjector():getInstance(RankSystem)

	rankSystem:tryEnterRank({
		index = RankType.kClubBoss
	})
end

function ClubSystem:showMemberPlayerInfoView(playerId)
	local memberData = self:getMemberRecordByRid(playerId)

	if memberData then
		local friendSystem = self:getInjector():getInstance(FriendSystem)
		local clubInfoOj = self:getClubInfoOj()

		local function gotoView(response)
			local record = BaseRankRecord:new()

			record:synchronize({
				headImage = memberData:getHeadId(),
				headFrame = memberData:getHeadFrame(),
				rid = memberData:getRid(),
				level = memberData:getLevel(),
				nickname = memberData:getName(),
				vipLevel = memberData:getVip(),
				combat = memberData:getCombat(),
				slogan = memberData:getSlogan(),
				master = memberData:getMaster(),
				heroes = memberData:getHeroes(),
				clubName = clubInfoOj:getName(),
				online = memberData:getIsOnline() == ClubMemberOnLineState.kOnline,
				offlineTime = memberData:getLastOnlineTime(),
				isFriend = response.isFriend,
				close = response.close,
				gender = memberData:getGender(),
				city = memberData:getCity(),
				birthday = memberData:getBirthday(),
				tags = memberData:getTags(),
				block = response.block
			})

			local view = self:getInjector():getInstance("PlayerInfoView")

			self:getEventDispatcher():dispatchEvent(ViewEvent:new(EVT_SHOW_POPUP, view, {
				remainLastView = true,
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, record))
		end

		friendSystem:requestSimpleFriendInfo(memberData:getRid(), function (response)
			gotoView(response)
		end)
	end
end

function ClubSystem:getClubBoss(viewType)
	return self._developSystem:getPlayer():getClub():getClubBossInfo(viewType)
end

function ClubSystem:getCurSeasonInfo(viewType)
	local seasonId = self:getClubBoss(viewType):getSeason()
	local record = ConfigReader:getRecordById("ClubBlockArena", seasonId)

	return record
end

function ClubSystem:getCurDayTiredHero(viewType)
	local tiredHeros = self:getClubBoss(viewType):getTiredHero()

	return tiredHeros
end

function ClubSystem:getHeroIsTired(heroId, viewType)
	if self:getIsRecommend(heroId, viewType) then
		return false
	end

	local tiredHeros = self:getCurDayTiredHero(viewType)

	for k, v in pairs(tiredHeros) do
		if v == heroId then
			return true
		end
	end

	return false
end

function ClubSystem:checkIsAllHeroIsTired(viewType)
	local result = true
	local heros = self._developSystem:getHeroList():getHeros()

	for k, v in pairs(heros) do
		if self:getHeroIsTired(v:getId(), viewType) == false then
			result = false

			break
		end
	end

	return result
end

function ClubSystem:getHeroEffectNum(heroId, viewType)
	local effectNum = 0
	local info = self._developSystem:getHeroSystem():getHeroById(heroId)
	local seasonEffectNum = self:getHeroSeasonEffectNum(heroId, viewType)
	local fiveStarEffectNum = self:getFiveStarEffectNum(heroId, info)
	local awakenLevelEffectNum = self:getAwakenLevelEffectNum(heroId, info)
	local maxFiveOrAwaken = math.max(fiveStarEffectNum, awakenLevelEffectNum)
	effectNum = seasonEffectNum + maxFiveOrAwaken

	return effectNum
end

function ClubSystem:getAwakenLevelEffectNum(heroId, info)
	local awakenLevelEffectNum = 0

	if info:getAwakenStar() > 0 then
		awakenLevelEffectNum = ConfigReader:getRecordById("SkillAttrEffect", "ExcellentHero_Awaken").Value[1] * 100
	end

	return awakenLevelEffectNum and awakenLevelEffectNum or 0
end

function ClubSystem:getFiveStarEffectNum(heroId, info)
	local fiveStarEffectNum = 0

	if info:getStar() >= 5 then
		fiveStarEffectNum = ConfigReader:getRecordById("SkillAttrEffect", "ExcellentHero_Stars").Value[1] * 100
	end

	return fiveStarEffectNum and fiveStarEffectNum or 0
end

function ClubSystem:getHeroSeasonEffectNum(heroId, viewType)
	local seasonInfo = self:getCurSeasonInfo(viewType)
	local HeroBase = ConfigReader:getRecordById("HeroBase", heroId)
	local seasonEffectNum = 0

	for k, v in pairs(seasonInfo.ExcellentHero) do
		if v.Hero then
			for index, id in pairs(v.Hero) do
				if id == HeroBase.Id then
					local num = ConfigReader:getRecordById("SkillAttrEffect", v.Effect).Value[1] * 100

					return num
				end
			end
		end
	end

	return seasonEffectNum
end

function ClubSystem:getIsRecommend(heroId, viewType)
	local seasonInfo = self:getCurSeasonInfo(viewType)
	local HeroBase = ConfigReader:getRecordById("HeroBase", heroId)

	for k, v in pairs(seasonInfo.ExcellentHero) do
		if v.Hero then
			for index, id in pairs(v.Hero) do
				if id == HeroBase.Id then
					return true
				end
			end
		end
	end

	return false
end

function ClubSystem:getPositionName()
	local tag = self:getClubInfoOj():getPosition()

	return self:getPositionNameStr(tag)
end

function ClubSystem:getApplyRecordListOj()
	return self:getClub():getApplyRecordList()
end

function ClubSystem:getFindRecordListOj()
	return self:getClub():getFindRecordList()
end

function ClubSystem:getMemberRecordListOj()
	return self:getClub():getMemberRecordList()
end

function ClubSystem:getMemberRecordByRid(rid)
	local list = self:getMemberRecordListOj():getList()
	local resultMember = nil

	for i = 1, #list do
		local oneMember = list[i]

		if oneMember:getRid() == rid then
			resultMember = oneMember

			break
		end
	end

	return resultMember
end

function ClubSystem:getAuditRecordListOj()
	return self:getClub():getAuditRecordList()
end

function ClubSystem:getLogRecordListOj()
	return self:getClub():getLogRecordList()
end

function ClubSystem:getTechnologyListOj()
	return self:getClub():getClubTechList()
end

function ClubSystem:getTechnologyById(id)
	local techList = self:getClub():getClubTechList()

	return techList:getTechById(id)
end

function ClubSystem:getTechPoint(techId, pointId)
	local tech = self:getTechnologyById(techId)

	return tech:getPointById(pointId)
end

function ClubSystem:getDonateLimit()
	local clubLevel = self:getClub():getInfo():getLevel()
	local limitList = ConfigReader:getDataByNameIdAndKey("ClubTechnologyPoint", "Club_Contribute_1", "Value2")

	return limitList and limitList[clubLevel] or limitList[#limitList]
end

function ClubSystem:getMaxDonateCount()
	local map = ConfigReader:getDataByNameIdAndKey("Reset", "Club_Donation_Times", "ResetSystem")

	return map.setValue or -1
end

function ClubSystem:isTechUnlock(condition)
	local clubLevel = self:getClub():getInfo():getLevel()
	local playerLevel = self._developSystem:getPlayer():getLevel()

	if condition and tonumber(condition.LEVEL) <= playerLevel and tonumber(condition.ClubLevel) <= clubLevel then
		return true
	end

	return false
end

function ClubSystem:isDonationPointUnlock(vipLimit)
	local vipLevel = self._developSystem:getPlayer():getVipLevel()

	if vipLimit <= vipLevel then
		return true
	end

	return false
end

function ClubSystem:getTechUpLevelExp(pointData)
	local pointLevel = pointData:getLevel()
	local expList = pointData:getLevel()

	return resetData and resetData.setValue or -1
end

function ClubSystem:getPositionNameStr(position)
	return ClubPositionNameStr[position]
end

local timeMap = {
	m = 60,
	s = 1,
	h = 3600,
	d = 86400
}

function ClubSystem:getTimeStr(time)
	time = math.modf(time)
	local curTime = time

	if time <= 0 then
		return Strings:get("Club_Text154")
	end

	if timeMap.d <= curTime then
		return Strings:get("Club_Text129", {
			day = math.modf(curTime / timeMap.d)
		})
	else
		local hour = math.modf(curTime / timeMap.h)

		if hour > 0 then
			return Strings:get("Club_Text130", {
				hour = hour
			})
		else
			curTime = curTime - timeMap.d * hour
			local min = math.modf(curTime / timeMap.m)

			if min > 0 then
				return Strings:get("Club_Text131", {
					min = min
				})
			else
				return Strings:get("Club_Text154")
			end
		end
	end
end

function ClubSystem:getMailLimitCount()
	local curPosition = self:getClubInfoOj():getPosition()

	if curPosition == ClubPosition.kProprieter then
		return ConfigReader:getDataByNameIdAndKey("ConfigValue", "Club_Mail_LeaderNumber", "content")
	else
		return ConfigReader:getDataByNameIdAndKey("ConfigValue", "Club_Mail_SecondNumber", "content")
	end
end

function ClubSystem:setCurMediatorTag(tag)
	self._viewTag = tag
end

function ClubSystem:getCurMediatorTag()
	return self._viewTag
end

function ClubSystem:requestClubInfo(callback)
	local info = {}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubInfo(info, true, function (response)
		if response.resCode == GS_SUCCESS then
			if response.data then
				self:syncClubInfo(response.data)
			end

			if callback then
				callback()
			end
		end
	end)
end

function ClubSystem:syncClubInfo(data)
	if data.myPosition then
		self:getClubInfoOj():setPosition(data.myPosition)
	end

	if data.playerMax then
		self:getClubInfoOj():setMemberLimitCount(data.playerMax)
	end

	if data.clubRank then
		self:getClubInfoOj():setRank(data.clubRank)
	end

	if data.presidentName then
		self:getClubInfoOj():setProprieterName(data.presidentName)
	end

	if data.normalCount then
		self:getClubInfoOj():setMemberCount(data.normalCount)
	end

	if data.playerCount then
		self:getClubInfoOj():setPlayerCount(data.playerCount)
	end

	if data.viceCount then
		self:getClubInfoOj():setDProprieterCount(data.viceCount)
	end

	if data.eliteCount then
		self:getClubInfoOj():setEliteCount(data.eliteCount)
	end

	if data.clubInfo then
		self:getClubInfoOj():sync(data.clubInfo)
		self:getClubInfoOj():setClubId(data.clubInfo.id)

		if data.clubInfo.clubDonation and data.clubInfo.clubDonation.donationFuncs then
			self:getClub():getClubTechList():cleanUp()
			self:getClub():getClubTechList():synchronize(data.clubInfo.clubDonation.donationFuncs)
		end
	else
		self:getClubInfoOj():setClubId("")
	end

	if data.playerList then
		self:getMemberRecordListOj():cleanUp()
		self:getMemberRecordListOj():synchronize({
			lb = data.playerList
		})
	end

	if data.clubList then
		self:getApplyRecordListOj():cleanUp()
		self:getApplyRecordListOj():synchronize({
			lb = data.clubList,
			hasApplyCount = data.hasApplyCount
		})
	end
end

function ClubSystem:requestApplyList(startNum, endNum, clearData, callback)
	local data = {
		start = startNum,
		["end"] = endNum
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestApplyList(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local applyRecordListOj = self:getApplyRecordListOj()

			if clearData then
				applyRecordListOj:cleanUp()
			end

			applyRecordListOj:synchronize({
				lb = response.data.clubList
			})

			if callback then
				callback()
			end
		end

		self:checkResCode(response.resCode)
	end)
end

function ClubSystem:searchClub(criteria, startNum, endNum, clearData, callback)
	local data = {
		criteria = criteria,
		start = startNum,
		["end"] = endNum
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:searchClub(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local findRecordListOj = self:getFindRecordListOj()

			if clearData then
				findRecordListOj:cleanUp()
			end

			findRecordListOj:synchronize({
				lb = response.data.clubList
			})

			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_CLUB_FINDCLUBLIST_SUCC))
		end

		self:checkResCode(response.resCode)
	end)
end

function ClubSystem:quickJoinClub()
	local data = {}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:quickJoinClub(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			if response.data.join == 0 then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Club_Text183")
				}))
			elseif response.data.join == 1 then
				self:syncClubInfo(response.data)
				self:agreeEnterClubTip(self:getName())
				self:dispatch(Event:new(EVT_CLUB_ENTER_SUCC))
			end
		elseif response.resCode == 11427 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		end

		self:checkResCode(response.resCode)
	end)
end

function ClubSystem:createClub(clubName, headImg, func)
	local data = {
		headImg = headImg,
		clubName = clubName,
		announce = Strings:get("Club_Notice")
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:createClub(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:syncClubInfo(response.data)
			self:requestClubBattleData(nil, false)

			if func then
				func()
			end

			self:dispatch(Event:new(EVT_CLUB_ENTER_SUCC))
		elseif response.resCode == 11427 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11410 then
			self:dispatch(Event:new(EVT_CLUB_CREATE_FAILED))
		end

		self:checkResCode(response.resCode)
	end)
end

function ClubSystem:changeClubHeadImg(changeImg)
	self:dispatch(Event:new(EVT_CLUB_CHANGECLUBICON_SUCC))

	local data = {
		changeImg = changeImg
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:changeClubHeadImg(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local clubObj = self:getClubInfoOj()

			clubObj:sync(response.data)
			self:dispatch(Event:new(EVT_CLUB_CHANGECLUBICON_SUCC))
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		end
	end)
end

function ClubSystem:getOtherPlayerList(startNum, endNum, clearData, callback)
	local data = {
		start = startNum,
		["end"] = endNum
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:getOtherPlayerList(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local memberRecordListOj = self:getMemberRecordListOj()

			if clearData then
				memberRecordListOj:cleanUp()
			end

			memberRecordListOj:synchronize({
				lb = response.data.playerList
			})

			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_CLUB_GETOTHERMEMBER_SUCC))
		end
	end)
end

function ClubSystem:quitClub()
	local data = {}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:quitClub(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Club_Text169")
			}))
			self:dispatch(Event:new(EVT_CLUB_QUIT_SUCC))
		end
	end)
end

function ClubSystem:kickoutPlayer(playerId)
	local data = {
		playerId = playerId
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:kickoutPlayer(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_CLUB_KICKOUT_SUCC))
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		elseif response.resCode == 11425 then
			self:dispatch(Event:new(EVT_CLUB_PUSHMEMBERCHANGE_SUCC))
		end
	end)
end

function ClubSystem:setWelcomeMsg(welcomeMsg, welcomeIndex, selfEdit, callback)
	local data = {
		welcomeMsg = welcomeMsg,
		welcomeIndex = welcomeIndex,
		selfEdit = selfEdit
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:setWelcomeMsg(data, true, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback()
		end
	end)
end

function ClubSystem:requestAuditList(startNum, endNum, clearData, callback)
	local data = {
		start = startNum,
		["end"] = endNum
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestAuditList(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local auditRecordListOj = self:getAuditRecordListOj()

			if clearData then
				auditRecordListOj:cleanUp()
			end

			auditRecordListOj:synchronize({
				lb = response.data.applyList
			})

			if callback then
				callback()
			end
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		end
	end)
end

function ClubSystem:requestLogList(startNum, endNum, clearData, callback)
	local data = {
		start = startNum,
		["end"] = endNum
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestLogList(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local logRecordListOj = self:getLogRecordListOj()

			if clearData then
				logRecordListOj:cleanUp()
			end

			logRecordListOj:synchronize({
				lb = response.data.logList
			})

			if callback then
				callback()
			end
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		end
	end)
end

function ClubSystem:checkEnabled(data)
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlock, tips = systemKeeper:isUnlock("Club_System")

	if data and data.tab then
		local tab = data.tab

		if tab == ClubHallType.kTechnology then
			local unlockCondition = ConfigReader:getDataByNameIdAndKey("ClubTechnology", "Club_Contribute", "Unlock")
			local levelCon = unlockCondition.LEVEL
			local clubLevelCon = unlockCondition.ClubLevel
			local developSystem = self:getInjector():getInstance(DevelopSystem)
			local playerLevel = developSystem:getPlayer():getLevel()
			local clubLevel = self:getLevel()

			if levelCon <= playerLevel and clubLevelCon <= clubLevel then
				unlock = true
			else
				local tipsId = ConfigReader:getDataByNameIdAndKey("ClubTechnology", "Club_Contribute", "UnlockDesc")
				tips = Strings:get(tipsId, {
					LEVEL = levelCon,
					ClubLevel = clubLevelCon
				})
				unlock = false
			end
		end
	end

	return unlock, tips
end

function ClubSystem:tryEnter(data)
	local clubName = nil

	if data and data.extraData then
		clubName = data.extraData.clubName
	end

	local goToActivityBossFormSunmmer = false

	if data and data.goToActivityBossFormSunmmer then
		goToActivityBossFormSunmmer = data.goToActivityBossFormSunmmer
	end

	local tab = data and data.tab
	local unlock, tips = self:checkEnabled()

	if unlock then
		self:requestClubInfo(function ()
			local view = self:getInjector():getInstance("ClubView")

			self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {
				clubName = clubName,
				tab = tab,
				goToActivityBossFormSunmmer = goToActivityBossFormSunmmer
			}))
		end)
	else
		self:dispatch(ShowTipEvent({
			tip = tips
		}))
	end
end

function ClubSystem:checkLeftCount(data)
	local unlock, tips = self:checkEnabled()

	if not unlock then
		return 1, tips
	end

	if data and data.tab then
		local tab = data.tab

		if tab == "kTechnology" then
			local curCount = self:getClub():getCurDonateCount()
			local maxDonateCount = self:getMaxDonateCount()

			return maxDonateCount and curCount or 0, Strings:get("Club_Donate_LeftCount_NotEnough")
		elseif tab == "kBoss" then
			if CommonUtils.GetSwitch("fn_clubBoss") == false or self._systemKeeper:canShow("ClubStage") == false then
				return 0, Strings:get("")
			end

			local clubBossInfo = self:getClub():getClubBossInfo(self._viewType)
			local leftTimes = clubBossInfo:getBossFightTimes()

			if clubBossInfo:getPassAll() then
				return 0, Strings:get("ClubBoss_PassAll")
			end

			return leftTimes, Strings:get("ClubBoss_LeftCount_NotEnough")
		end
	else
		return 1
	end
end

function ClubSystem:agreeEnterClubTip(clubName, enterClub)
	local delegate = {}
	local outSelf = self

	function delegate:willClose(popupMediator, data)
		outSelf:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))

		if enterClub then
			outSelf:tryEnter()
		end
	end

	local data = {
		playSound = 1,
		enabled = true,
		richTextStr = Strings:get("Club_Text190", {
			clubName = clubName,
			fontName = TTF_FONT_FZYH_R
		}),
		btnOkDate = {}
	}
	local view = self:getInjector():getInstance("ClubWaringTipView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end

function ClubSystem:requestApplyEnterClub(clubId, rank, callback, enterClub)
	local data = {
		clubId = clubId
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestApplyEnterClub(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:syncClubInfo(response.data)
			self:requestClubBattleData(nil, false)

			if self:getHasJoinClub() then
				self:agreeEnterClubTip(self:getName(), enterClub)
				self:dispatch(Event:new(EVT_CLUB_ENTER_SUCC))
			else
				local record = self:getApplyRecordListOj():getRecordByRank(rank)

				if record then
					record:setApplayState(ApplyClubState.kHas)
					self:getApplyRecordListOj():setHasApplyCount(response.data.hasApplyCount)
				end
			end

			if callback then
				callback()
			end
		elseif response.resCode == 11401 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11427 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11406 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11404 then
			-- Nothing
		end

		self:checkResCode(response.resCode)
	end)
end

function ClubSystem:cancelJoinClubApply(clubId, rank, callback)
	local data = {
		clubId = clubId
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:cancelJoinClubApply(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local record = self:getApplyRecordListOj():getRecordByRank(rank)

			record:setApplayState(ApplyClubState.kNotHas)
			self:getApplyRecordListOj():setHasApplyCount(response.data.hasApplyCount)

			if callback then
				callback()
			end
		end
	end)
end

function ClubSystem:changeClubName(changeName, callback)
	local data = {
		changeName = changeName
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:changeClubName(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:getClubInfoOj():setName(response.data.clubName)

			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_CLUB_CHANGENAME_SUCC))
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		end
	end)
end

function ClubSystem:changePlayerPos(playerId, pos, callback)
	local data = {
		playerId = playerId,
		pos = pos
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:changePlayerPos(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:syncClubInfo(response.data)

			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_CLUB_CHANGEPOS_SUCC))
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		elseif response.resCode == 11425 then
			self:dispatch(Event:new(EVT_CLUB_PUSHMEMBERCHANGE_SUCC))
		elseif response.resCode == 11426 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		end
	end)
end

function ClubSystem:agreeEnterClubApply(playerId, callback)
	local data = {
		playerId = playerId
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:agreeEnterClubApply(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local auditRecordListOj = self:getAuditRecordListOj()

			auditRecordListOj:cleanUp()
			auditRecordListOj:synchronize({
				lb = response.data.applyList
			})

			if callback then
				callback()
			end
		elseif response.resCode == 11412 then
			local auditRecordListOj = self:getAuditRecordListOj()

			auditRecordListOj:cleanUp()
			self:requestAuditList(1, 20, true, function ()
				self:dispatch(Event:new(EVT_CLUBAUDIT_REFRESH_SUCC))
			end)
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		elseif response.resCode == 11427 then
			local auditRecordListOj = self:getAuditRecordListOj()

			auditRecordListOj:cleanUp()
			self:requestAuditList(1, 20, true, function ()
				self:dispatch(Event:new(EVT_CLUBAUDIT_REFRESH_SUCC))
			end)
		elseif response.resCode == 11419 then
			local auditRecordListOj = self:getAuditRecordListOj()

			auditRecordListOj:cleanUp()
			self:requestAuditList(1, 20, true, function ()
				self:dispatch(Event:new(EVT_CLUBAUDIT_REFRESH_SUCC))
			end)
		elseif response.resCode == 11417 then
			local auditRecordListOj = self:getAuditRecordListOj()

			auditRecordListOj:cleanUp()
			self:requestAuditList(1, 20, true, function ()
				self:dispatch(Event:new(EVT_CLUBAUDIT_REFRESH_SUCC))
			end)
		elseif response.resCode == 11418 then
			local auditRecordListOj = self:getAuditRecordListOj()

			auditRecordListOj:cleanUp()
			self:requestAuditList(1, 20, true, function ()
				self:dispatch(Event:new(EVT_CLUBAUDIT_REFRESH_SUCC))
			end)
		end
	end)
end

function ClubSystem:refuseEnterClubApply(playerId, callback)
	local data = {
		playerId = playerId
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:refuseEnterClubApply(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local auditRecordListOj = self:getAuditRecordListOj()

			auditRecordListOj:cleanUp()
			auditRecordListOj:synchronize({
				lb = response.data.applyList
			})

			if callback then
				callback()
			end
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		end
	end)
end

function ClubSystem:getClubThresholdMax(callback)
	local data = {}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:getClubThresholdMax(data, true, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback(response.data.level, response.data.combat)
		end
	end)
end

function ClubSystem:setClubThreshold(auditType, level, combat, callback)
	local data = {
		type = auditType,
		level = level,
		combat = combat
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:setClubThreshold(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:getAuditConditionOj():synchronize(response.data.threshold)
			self:dispatch(Event:new(EVT_CLUB_SETCLUBAUDIT_SUCC))
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Club_Text162")
			}))
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		end

		if callback then
			callback(response.resCode)
		end
	end)
end

function ClubSystem:changeClubAnnounce(changeAnnounce, callback)
	local data = {
		changeAnnounce = changeAnnounce
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:changeClubAnnounce(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:getClubInfoOj():setSlogan(response.data.announce)
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		end

		if callback then
			callback()
		end
	end)
end

function ClubSystem:checkIsRecommend(checkId, heroInfo, viewType)
	self.starBuffNum = self.starBuffNum or ConfigReader:getRecordById("ConfigValue", "Tower_1_Star_Buff_Minimum_Star").content
	local attrAdds = {}
	local attrAddNum = 0
	local recommendDesc = ""
	local isMaxRecommend = false
	local seasonInfo = self:getCurSeasonInfo(viewType)

	for k, rData in pairs(seasonInfo.ExcellentHero) do
		if isMaxRecommend then
			break
		end

		if rData.Hero then
			for index, heroId in pairs(rData.Hero) do
				if heroId == checkId then
					attrAdds[#attrAdds + 1] = {}
					attrAdds[#attrAdds].title = Strings:get("Team_Hero_Type_Title")
					local effectConfig = ConfigReader:getRecordById("SkillAttrEffect", rData.Effect)
					attrAdds[#attrAdds].desc = ""
					recommendDesc = Strings:get("EXPLORE_UI22")

					if effectConfig then
						attrAdds[#attrAdds].desc = Strings:get(effectConfig.EffectDesc)
					end

					attrAdds[#attrAdds].type = StageAttrAddType.HERO_TYPE
					isMaxRecommend = true

					break
				end
			end
		end
	end

	if heroInfo.awakenLevel > 0 then
		self.awakenLevelEffectDesc = self.awakenLevelEffectDesc or ConfigReader:getRecordById("SkillAttrEffect", "ExcellentHero_Awaken").EffectDesc
		attrAdds[#attrAdds + 1] = {}
		attrAdds[#attrAdds].title = Strings:get("Tower_Main_awakenBuff")
		attrAdds[#attrAdds].desc = Strings:get(self.awakenLevelEffectDesc)
		attrAdds[#attrAdds].type = StageAttrAddType.HERO_AWAKE
		recommendDesc = Strings:get("clubBoss_46")
	elseif self.starBuffNum <= heroInfo.star then
		self.starEffectDesc = self.starEffectDesc or ConfigReader:getRecordById("SkillAttrEffect", "ExcellentHero_Stars").EffectDesc
		attrAdds[#attrAdds + 1] = {}
		attrAdds[#attrAdds].title = Strings:get("Tower_Main_starBuff")
		attrAdds[#attrAdds].desc = Strings:get(self.starEffectDesc)
		attrAdds[#attrAdds].type = StageAttrAddType.HERO_FULL_STAR
		recommendDesc = Strings:get("clubBoss_46")
	end

	local recommendData = {
		isRecommend = #attrAdds > 0,
		attrAddNum = attrAddNum,
		recommendDesc = recommendDesc,
		attrAdds = attrAdds
	}

	return recommendData
end

function ClubSystem:requestJoinClub(data, extraData)
	if extraData == {} or extraData == nil then
		return
	end

	local clubInfo = extraData.clubInfo
	local hasApplyCount = extraData.applyCount

	if clubInfo and hasApplyCount then
		local auditType = clubInfo.auditType
		local limitLevel = clubInfo.limitLevel
		local limitCombat = clubInfo.limitCombat

		if self:getHasJoinClub() then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("ChatEnterClub_Text")
			}))

			return
		end

		if auditType == ClubAuditType.kClose then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Club_Text195")
			}))

			return
		end

		local factor1 = self._developSystem:getPlayer():getLevel() < limitLevel
		local factor2 = self._developSystem:getPlayer():getCombat() < limitCombat

		if factor1 and not factor2 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Club_Text196", {
					level = limitLevel,
					combat = limitCombat
				})
			}))

			return
		elseif not factor1 and factor2 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Club_Text197", {
					level = limitLevel,
					combat = limitCombat
				})
			}))

			return
		elseif factor1 and factor2 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Club_Text186", {
					level = limitLevel,
					combat = limitCombat
				})
			}))

			return
		end

		self:requestTargetClubInfo(clubInfo.clubId, function (info)
			local record = ClubRankRecord:new()

			record:synchronize(info)

			local view = self:getInjector():getInstance("PlayerInfoView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, record, nil))
		end, true)
	end
end

function ClubSystem:sendRecruitMessage()
	local chatSystem = self:getInjector():getInstance("ChatSystem")
	local chat = chatSystem:getChat()
	local channelId = TabTypeToChannelId[ChatTabType.kWorld]
	local channel = chat:getChannel(channelId)

	if channel == nil then
		self:getEventDispatcher():dispatchEvent(ShowTipEvent({
			tip = Strings:get("Chat_Text8")
		}))

		return
	end

	local tipTextMap = {
		[ChannelId.kUnion] = "Chat_Text7",
		[ChannelId.kTeam] = "Chat_Text6"
	}
	local roomType, roomId = channel:getRoomTypeAndId(self:getInjector())

	if roomType == nil or roomId == nil then
		self:getEventDispatcher():dispatchEvent(ShowTipEvent({
			tip = Strings:get(tipTextMap[channel:getId()])
		}))

		return
	end

	local clubInfo = self:getClubInfoOj()
	local messageData = {
		channelIds = {
			channelId
		},
		sender = self._developSystem:getPlayer():getRid(),
		time = self:getInjector():getInstance("GameServerAgent"):remoteTimeMillis(),
		type = MessageType.kPlayer,
		contentId = "Announce_Club_Recruit",
		params = {
			Level = clubInfo:getLevel(),
			clubName = clubInfo:getName()
		}
	}
	local auditCondition = clubInfo:getAuditCondition()
	local clubInfo = {
		auditType = auditCondition:getType(),
		limitLevel = auditCondition:getLevel(),
		limitCombat = auditCondition:getCombat(),
		memberCount = clubInfo:getMemberCount(),
		memberLimitCount = clubInfo:getMemberLimitCount(),
		clubId = clubInfo:getClubId(),
		clubRank = clubInfo:getRank()
	}
	messageData.extraData = {
		clubInfo = clubInfo,
		applyCount = self:getApplyRecordListOj():getHasApplyCount()
	}
	local message = chat:syncMessage(messageData)

	chatSystem:updateActiveMember()
	chatSystem:requestSendMessage(roomType, roomId, messageData, function (data)
		message:sync(data)
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Club_Text173")
		}))
	end)
end

function ClubSystem:sendRecruitMsg(callback)
	local data = {}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:sendRecruitMsg(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:getClubInfoOj():setRecruitTime(response.data.lastRecruitTime)
			self:sendRecruitMessage()

			if callback then
				callback()
			end
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		end
	end)
end

function ClubSystem:sendClubMail(title, content, callback)
	local data = {
		title = title,
		content = content
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:sendClubMail(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback()
			end
		elseif response.resCode == 11412 then
			self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
		elseif response.resCode == 11413 then
			self:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
		end
	end)
end

function ClubSystem:checkResCode(resCode)
	if resCode == 11401 then
		self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
	end
end

local pushClubType = {
	kKickout = 2,
	kJoin = 1
}
local pushPosChangeType = {
	kDown = 2,
	kUp = 1
}

function ClubSystem:listenPush()
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:listenPushClubChange(function (response)
		local clubId = response.change == pushClubType.kKickout and "" or response.clubId

		self:getClubInfoOj():setClubId(clubId)

		if not self._listenPush then
			return
		end

		if response.change == pushClubType.kKickout then
			self:getClubInfoOj():setAuditRedPoint(ClubAuditRedPointState.kNo)

			local delegate = {}
			local outSelf = self

			function delegate:willClose(popupMediator, data)
				outSelf:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
			end

			local data = {
				enabled = true,
				richTextStr = Strings:get("Club_Text180", {
					clubName = response.clubName,
					nickName = response.nickName,
					fontName = TTF_FONT_FZYH_R
				}),
				btnOkDate = {}
			}
			local view = self:getInjector():getInstance("ClubWaringTipView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
			}, data, delegate))
			self:dispatch(Event:new(EVT_CLUB_PUSHREDPOINT_SUCC))

			return
		end

		self:agreeEnterClubTip(response.clubName)
	end)
	clubService:listenPushClubPlayerChange(function (response)
		if not self._listenPush then
			return
		end

		self:requestClubInfo(function ()
			self:dispatch(Event:new(EVT_CLUB_PUSHMEMBERCHANGE_SUCC))

			if not self:getClubInfoOj():canAuditMember() then
				self:getClubInfoOj():setAuditRedPoint(ClubAuditRedPointState.kNo)
				self:dispatch(Event:new(EVT_CLUB_PUSHREDPOINT_SUCC))
			end
		end)
	end)
	clubService:listenPushClubPosChange(function (response)
		local str = "Club_Text181"

		if response.change == pushPosChangeType.kDown then
			str = "Club_Text182"
		end

		if response.job == ClubPosition.kProprieter then
			str = "Club_Text151"
		end

		local delegate = {}
		local outSelf = self

		function delegate:willClose(popupMediator, data)
			outSelf:requestClubInfo(function ()
				outSelf:dispatch(Event:new(EVT_CLUB_PUSHPOSITIONCHANGE_SUCC))
			end)
		end

		local data = {
			enabled = true,
			richTextStr = Strings:get(str, {
				nickName = response.nickName,
				clubName = response.clubName,
				job = self:getPositionNameStr(response.job),
				fontName = TTF_FONT_FZYH_R
			}),
			btnOkDate = {}
		}
		local view = self:getInjector():getInstance("ClubWaringTipView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))
	end)
	clubService:listenPushClubPlayerChange(function (response)
		if not self._listenPush then
			return
		end

		self:requestClubInfo(function ()
			self:dispatch(Event:new(EVT_CLUB_PUSHMEMBERCHANGE_SUCC))
		end)
	end)
	clubService:listenPushClubRedPoint(function (response)
		self:getClubInfoOj():setAuditRedPoint(response.hasClubApply)
		self:dispatch(Event:new(EVT_CLUB_PUSHREDPOINT_SUCC))
	end)
end

function ClubSystem:requestClubSimpleInfo(blockUI)
	if blockUI == nil then
		blockUI = true
	end

	local data = {}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubSimpleInfo(data, blockUI, function (response)
		if response.resCode == GS_SUCCESS then
			self:getClubInfoOj():sync(response.data)
			self:getClubInfoOj():setClubId(response.data.clubId)
		end
	end)
end

function ClubSystem:requestTargetClubInfo(clubId, func)
	local data = {
		clubId = clubId
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestTargetClubInfo(data, true, function (response)
		if response.resCode == GS_SUCCESS and func then
			func(response.data.clubInfo)
		end
	end)
end

function ClubSystem:requestTargetDonationInfo(techId, func)
	local data = {
		funcId = techId
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestTargetDonationInfo(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local tech = self:getTechnologyById(techId)

			if tech then
				tech:synchronize(response.data.donationFunc)
			end

			if func then
				func()
			end
		end
	end)
end

function ClubSystem:requestClubDonate(techId, pointId, donationId)
	local data = {
		funcId = techId,
		pointId = pointId,
		donationId = donationId
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubDonate(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local tech = self:getTechnologyById(techId)

			if tech then
				tech:synchronize(response.data.donationFunc)
			end

			local clubInfo = self:getClubInfoOj()

			if response.data.todayDonation then
				clubInfo:setTodayDonation(response.data.todayDonation)
			end

			if response.data.refreshData and response.data.refreshData.level then
				clubInfo:setLevel(response.data.refreshData.level)
				self:dispatch(Event:new(EVT_CLUBDONATE_CLUBINFO_CHANGE))
			end

			self:dispatch(Event:new(EVT_CLUBDONATE_SUCC))

			if clubInfo:getTodayDonation() < self:getDonateLimit() then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Club_Contribute_Tip2")
				}))
			else
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Club_Contribute_Tip4")
				}))
			end
		end
	end)
end

function ClubSystem:doReset(resetId, value, data)
	value = value or 0

	if resetId == ResetId.kClubDonationReset and data then
		self:syncClubInfo(data)
		self:dispatch(Event:new(EVT_CLUBDONATE_SUCC))
	end

	if (resetId == ResetId.kClubBlockTimesReset or resetId == ResetId.kClubBlockReset) and data then
		self._enterClubBossBattle = false
		self._clubBossKilled = false
	end
end

function ClubSystem:setClubSnsInfo(url, key, func)
	local params = {
		data = {
			url = url,
			key = key
		}
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:setClubSnsInfo(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:syncClubInfo(response.data)

			if func then
				func()
			end
		end
	end)
end

function ClubSystem:getClubBossSummerActivityID()
	return self._summerActivityId
end

function ClubSystem:getClubBossSummerActivity()
	return self._summerActivity
end

function ClubSystem:refreshClubBossSummerActivityData()
	local activitySystem = self:getInjector():getInstance("ActivitySystem")

	activitySystem:setInitActivityClubBossMark()

	local summerMainActivity = activitySystem:getBlockSummerActivity()

	if summerMainActivity then
		local activity, tips = summerMainActivity:getActivityClubBossActivity()

		if activity then
			self._summerActivity = activity

			self:getClub():syncActivityClubBossBasicInfo(activity:getAllData())

			self._summerActivityId = activity:getId()
		end
	end
end

function ClubSystem:getAttrEffectValueForScore(score)
	local activitySkill = self._summerActivity:getActivityConfig().ActivitySkill
	local ActivitySkillLevel = self._summerActivity:getActivityConfig().ActivitySkillLevel
	local buffInfo = ConfigReader:getRecordById("SkillAttrEffect", activitySkill)
	local effectDesc = buffInfo.EffectDesc
	local addNumData = buffInfo.Value[1]
	local level = 0

	for i = 1, #ActivitySkillLevel do
		if score < ActivitySkillLevel[i] then
			level = i - 1

			break
		end
	end

	if ActivitySkillLevel[#ActivitySkillLevel] <= score then
		level = #ActivitySkillLevel
	end

	local addNUm = 0

	if level > 0 then
		addNUm = addNumData[level] and addNumData[level] or 0
	end

	local value = {
		addNUm
	}
	local des1 = Strings:get(effectDesc, {
		Value = value
	})
	local addNUm2 = addNumData[level + 1] and addNumData[level + 1] or 0
	local value2 = {
		addNUm2
	}
	local des2 = Strings:get(effectDesc, {
		Value = value2
	})
	local nextTarget = ActivitySkillLevel[level + 1] and ActivitySkillLevel[level + 1] or 0

	return des1, des2, nextTarget
end

function ClubSystem:requestClubBossInfo(func, refresh, viewType)
	local result, tip = self._systemKeeper:isUnlock("ClubStage")

	if result == false then
		if func then
			func()
		end

		if refresh then
			self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH, {
				viewType = viewType
			}))
		end

		return
	end

	local data = {}

	if viewType == ClubHallType.kActivityBoss then
		data.activityId = self._summerActivityId
	else
		data.activityId = ""
	end

	local type = viewType
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubBossInfo(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local data = response.data

			self:synchronizeClubBoss(data.boss, type, data.score)

			if func then
				func()
			end

			if refresh then
				self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH, {
					viewType = viewType
				}))
			end
		end
	end)
end

function ClubSystem:synchronizeClubBoss(data, viewType, scoreData)
	self:getClub():synchronizeClubBoss(data, viewType, scoreData)
end

function ClubSystem:requestGainClubBossDayHurtReward(viewType)
	local data = {}

	if viewType == ClubHallType.kActivityBoss then
		data.activityId = self._summerActivityId
	else
		data.activityId = ""
	end

	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestGainClubBossDayHurtReward(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local rewards = response.data.rewards

			if rewards then
				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					needClick = true,
					rewards = rewards
				}))
				self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH_HURTREWARD, {
					viewType = viewType
				}))
			end
		end
	end)
end

function ClubSystem:requestGainClubBossPointReward(pointId, all, viewType)
	local data = {
		pointId = pointId,
		all = all
	}

	if viewType == ClubHallType.kActivityBoss then
		data.activityId = self._summerActivityId
	else
		data.activityId = ""
	end

	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestGainClubBossPointReward(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local rewards = response.data.reward

			if rewards then
				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					needClick = true,
					rewards = rewards
				}))
				self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH, {
					viewType = viewType
				}))
			end
		end
	end)
end

function ClubSystem:requestClubBossBlockPointRewardByPonitID(pointId, viewType)
	local data = {
		pointId = pointId
	}

	if viewType == ClubHallType.kActivityBoss then
		data.activityId = self._summerActivityId
	else
		data.activityId = ""
	end

	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubBossBlockPointRewardByPonitID(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local rewardsData = response.data

			if rewardsData then
				local view = self:getInjector():getInstance("ClubBossShowRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
				}, rewardsData))
			end
		end
	end)
end

function ClubSystem:listenClubBossKilledCode(data)
	if data.actId and data.actId ~= "" then
		self._activityClubBossKilled = true

		if self._enterClubBossBattle == false then
			self:dispatch(Event:new(EVT_CLUBBOSS_KILLED, {
				viewType = ClubHallType.kActivityBoss
			}))
		end
	else
		self._clubBossKilled = true

		if self._enterClubBossBattle == false then
			self:dispatch(Event:new(EVT_CLUBBOSS_KILLED, {
				viewType = ClubHallType.kBoss
			}))
		end
	end
end

function ClubSystem:getClubBossKilled(viewType)
	local result = self._clubBossKilled

	if viewType == ClubHallType.kActivityBoss then
		result = self._activityClubBossKilled
	end

	return result
end

function ClubSystem:clearClubBossKilled(viewType)
	if viewType == ClubHallType.kActivityBoss then
		self._activityClubBossKilled = false
	else
		self._clubBossKilled = false
	end
end

function ClubSystem:listenClubBossTVTipCode(data)
	if data.actId and data.actId ~= "" then
		local bossTip = ClubBossTip:new()

		bossTip:sync(data)
		self:getClub():getClubBossInfo(ClubHallType.kActivityBoss):insertTVInfo(bossTip)
	else
		local bossTip = ClubBossTip:new()

		bossTip:sync(data)
		self:getClub():getClubBossInfo():insertTVInfo(bossTip)
	end
end

function ClubSystem:listenClubBossHurtCode(data)
	if data then
		if data.actId and data.actId ~= "" then
			self:getClub():getClubBossInfo(ClubHallType.kActivityBoss):pushSync(data)
			self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH_HURTANDHP, {
				viewType = ClubHallType.kActivityBoss
			}))
		else
			self:getClub():getClubBossInfo(ClubHallType.kBoss):pushSync(data)
			self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH_HURTANDHP, {
				viewType = ClubHallType.kBoss
			}))
		end
	end
end

function ClubSystem:requestUpdateTeam(data, callback, blockUI, params)
	self._clubService:requestUpdateTeam(data, function (response)
		if response.resCode == GS_SUCCESS then
			if params and params and not params.ignoreTip then
				-- Nothing
			end

			if callback then
				callback(response)
			end
		end
	end, blockUI)
end

function ClubSystem:getCurTowerId(viewType)
	return self:getClubBoss(viewType):getNowPoint()
end

function ClubSystem:requestStartOpenBoss(func)
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubOpenBoss(false, function (response)
		dump(response, "requestClubOpenBoss_____")

		if response.resCode == GS_SUCCESS and func then
			func(response.data)
		end
	end)
end

function ClubSystem:requestStartBossBattle(params, func)
	local clubService = self:getInjector():getInstance(ClubService)

	self:setClubBossTeamInfo(params)
	clubService:requestClubStartBattle(params, true, function (response)
		if response.resCode == GS_SUCCESS and func then
			func(response.data)
		end
	end)
end

function ClubSystem:requestFinishBossBattle(params, func)
	local clubService = self:getInjector():getInstance(ClubService)
	local viewType = self:getEnterClubBossBattleViewType()

	if viewType == ClubHallType.kActivityBoss then
		params.activityId = self._summerActivityId
	else
		params.activityId = ""
	end

	clubService:requestClubFinishBattle(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if func then
				func(response.data)
			end

			if response.data then
				self:recordKillReward(response.data)

				local view = self:getInjector():getInstance("ClubBossShowBattleResultView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
				}, response.data))
			end
		end
	end)
end

function ClubSystem:recordKillReward(data)
	if data and data.rewards1 then
		self._killRewardData = data.rewards1
	end
end

function ClubSystem:getKillReward()
	return self._killRewardData
end

function ClubSystem:clearKillReward()
	self._killRewardData = nil
end

function ClubSystem:clearEnterClubBossBattleMark()
	self._enterClubBossBattle = false
end

function ClubSystem:getEnterClubBossBattleMark()
	return self._enterClubBossBattle
end

function ClubSystem:clearEnterClubBossBattleViewType()
	self._enterClubBossBattleViewType = 0
end

function ClubSystem:getEnterClubBossBattleViewType()
	return self._enterClubBossBattleViewType
end

function ClubSystem:enterBattle(params, viewType)
	self._enterClubBossBattle = true
	self._enterClubBossBattleViewType = viewType
	local playerData = params.playerData
	local enemyData = params.enemyData
	local mapId = params.blockMapId
	local pointId = params.blockPointId
	local randomSeed = params.logicSeed
	local strategySeedA = params.strategySeedA
	local strategySeedB = params.strategySeedB
	local herosEffect = params.herosEffect or {}
	local battleType = SettingBattleTypes.kClubStage
	local isAuto, timeScale = self:getInjector():getInstance(SettingSystem):getSettingModel():getBattleSetting(battleType)
	local isReplay = false
	local canSkip = false
	local skipTime = tonumber(ConfigReader:getDataByNameIdAndKey("ConfigValue", "ClubBoss_SkipBattle_WaitTime", "content"))

	if self._systemKeeper:isUnlock("ClubStage") then
		canSkip = true
	end

	local unlock, tips = self._systemKeeper:isUnlock("AutoFight")

	if not unlock then
		isAuto = false
	end

	local curSeason = self:getCurSeasonInfo(viewType)
	local outSelf = self
	local battleDelegate = {}
	local battleSession = ClubBattleSession:new({
		playerData = playerData,
		enemyData = enemyData,
		mapId = mapId,
		pointId = pointId,
		logicSeed = randomSeed,
		herosEffect = herosEffect,
		strategySeedA = strategySeedA,
		strategySeedB = strategySeedB
	}, curSeason)

	battleSession:buildAll()

	local battleData = battleSession:getPlayersData()
	local battleConfig = battleSession:getBattleConfig()
	local battleSimulator = battleSession:getBattleSimulator()
	local battleLogic = battleSimulator:getBattleLogic()
	local battleInterpreter = BattleInterpreter:new()

	battleInterpreter:setRecordsProvider(battleSession:getBattleRecordsProvider())

	local battleDirector = LocalBattleDirector:new()

	battleDirector:setBattleSimulator(battleSimulator)
	battleDirector:setBattleInterpreter(battleInterpreter)

	local battlePassiveSkill = battleSession:getBattlePassiveSkill()
	local logicInfo = {
		director = battleDirector,
		interpreter = battleInterpreter,
		teams = battleSession:genTeamAiInfo(),
		mainPlayerId = {
			playerData.rid
		}
	}
	local systemKeeper = self._systemKeeper
	local unlockSpeed, tipsSpeed = systemKeeper:isUnlock("BattleSpeed")
	local speedOpenSta = systemKeeper:getBattleSpeedOpen(battleType)

	function battleDelegate:onAMStateChanged(sender, isAuto)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, isAuto)
	end

	function battleDelegate:onLeavingBattle()
		local realData = battleSession:getResultSummary()
		local data = {
			pointId = pointId,
			resultData = realData
		}

		outSelf:requestFinishBossBattle(data, function ()
		end)
	end

	function battleDelegate:onPauseBattle(continueCallback, leaveCallback)
		local delegate = self
		local popupDelegate = {
			willClose = function (self, sender, data)
				if data.opt == BattlePauseResponse.kLeave then
					leaveCallback()
				else
					continueCallback(data.hpShow, data.effectShow)
				end
			end
		}
		local pauseView = outSelf:getInjector():getInstance("battlePauseView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, pauseView, nil, {}, popupDelegate))
	end

	function battleDelegate:tryLeaving(callback)
		local delegate = {}

		function delegate:willClose(popupMediator, data)
			if data.response == AlertResponse.kOK then
				callback(true)
			else
				callback(false)
			end
		end

		local data = {
			title = Strings:get("SHOP_REFRESH_DESC_TEXT1"),
			content = Strings:get("clubBoss_50"),
			sureBtn = {},
			cancelBtn = {}
		}
		local view = outSelf:getInjector():getInstance("AlertView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))
	end

	function battleDelegate:onBattleFinish(result)
		local realData = battleSession:getResultSummary()
		local data = {
			pointId = pointId,
			resultData = realData
		}

		outSelf:requestFinishBossBattle(data, function ()
		end)
	end

	function battleDelegate:onDevWin(sender)
		local realData = {
			randomSeed = 123321,
			opData = "dev",
			result = kBattleSideAWin,
			winners = {
				playerData.rid
			},
			statist = {
				totalTime = 10000,
				roundCount = 4,
				players = {
					[playerData.rid] = {
						unitsDeath = 0,
						hpRatio = 0.99999,
						unitsTotal = 3,
						unitSummary = {}
					},
					[pointId] = {
						unitsDeath = 20,
						hpRatio = 0,
						unitsTotal = 20
					}
				}
			}
		}
		local data = {
			pointId = pointId,
			resultData = realData
		}

		outSelf:requestFinishBossBattle(data, function ()
		end)
	end

	function battleDelegate:onTimeScaleChanged(timeScale)
		outSelf:getInjector():getInstance(SettingSystem):getSettingModel():setBattleSetting(battleType, nil, timeScale)
	end

	function battleDelegate:showBossCome(pauseFunc, resumeCallback, paseSta)
		local delegate = self
		local popupDelegate = {
			willClose = function (self, sender, data)
				if resumeCallback then
					resumeCallback()
				end
			end
		}
		local bossView = outSelf:getInjector():getInstance("battleBossComeView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, bossView, nil, {
			paseSta = paseSta
		}, popupDelegate))

		if pauseFunc then
			pauseFunc()
		end
	end

	function battleDelegate:onShowRestraint(continueCallback)
		local popupDelegate = {
			willClose = function (self, sender)
				continueCallback()
			end
		}
		local view = outSelf:getInjector():getInstance("battlerofessionalRestraintView")

		outSelf:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {}, popupDelegate))
	end

	local pointConfig = ConfigReader:getRecordById("ClubBlockBattle", mapId)
	local battleSpeed_Display = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BattleSpeed_Display", "content")
	local battleSpeed_Actual = ConfigReader:getDataByNameIdAndKey("ConfigValue", "BattleSpeed_Actual", "content")
	local data = {
		battleType = battleSession:getBattleType(),
		battleData = battleData,
		battleConfig = battleConfig,
		isReplay = isReplay,
		logicInfo = logicInfo,
		delegate = battleDelegate,
		viewConfig = {
			opPanelClazz = "ClubBattleUIMediator",
			mainView = "ClubBossBattleView",
			opPanelRes = "asset/ui/BattleUILayer.csb",
			canChangeSpeedLevel = true,
			noHpFormat = true,
			finalHitShow = true,
			finalTaskFinishShow = true,
			battleSettingType = battleType,
			chatFlow = ChannelId.kBattleFlow,
			bulletTimeEnabled = BattleLoader:getBulletSetting("BulletTime_PVE_Source"),
			bgm = pointConfig.BGM or {
				"Mus_Battle_Resource_Jingsha",
				"",
				""
			},
			background = pointConfig.Background or "Battle_Scene_Sp02",
			refreshCost = ConfigReader:getRecordById("ConfigValue", "TacticsCard_Reload").content,
			battleSuppress = BattleDataHelper:getBattleSuppress(),
			hpShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getHpShowSetting(),
			effectShow = self:getInjector():getInstance(SettingSystem):getSettingModel():getEffectShowSetting(),
			passiveSkill = battlePassiveSkill,
			unlockMasterSkill = self:getInjector():getInstance(SystemKeeper):isUnlock("Master_BattleSkill"),
			finishWaitTime = BattleDataHelper:getBattleFinishWaitTime(battleType),
			btnsShow = {
				speed = {
					visible = speedOpenSta and self:getInjector():getInstance(SystemKeeper):canShow("BattleSpeed"),
					lock = not unlockSpeed,
					tip = tipsSpeed,
					speedConfig = battleSpeed_Actual,
					speedShowConfig = battleSpeed_Display,
					timeScale = timeScale
				},
				skip = {
					enable = true,
					waitTips = "ARENA_SKIP_TIP",
					visible = canSkip,
					skipTime = skipTime
				},
				auto = {
					visible = self:getInjector():getInstance(SystemKeeper):canShow("AutoFight"),
					state = isAuto,
					lock = not systemKeeper:isUnlock("AutoFight")
				},
				pause = {
					visible = true
				},
				restraint = {
					visible = self:getInjector():getInstance(SystemKeeper):canShow("Button_CombateDominating"),
					lock = not self:getInjector():getInstance(SystemKeeper):isUnlock("Button_CombateDominating")
				}
			}
		},
		loadingType = LoadingType.KClubBoss
	}

	BattleLoader:pushBattleView(self, data)
end

function ClubSystem:requestLeaveTowerBattle(towerId, callback)
	local params = {
		towerId = towerId
	}

	self._clubService:requestLeaveTowerBattle(params, true, function (response)
		if response.resCode == GS_SUCCESS and callback then
			callback(response.data)
		end
	end)
end

function ClubSystem:setTowerFinishData(data)
	self._towerFinishData = data
end

function ClubSystem:requestAfterTowerBattle(towerId, resultData, callback)
	local params = {
		towerId = towerId,
		resultData = resultData
	}

	self._clubService:requestAfterTowerBattle(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			if response.data.reviewFailed then
				local data = {
					title = Strings:get("Tip_Remind"),
					title1 = Strings:get("UITitle_EN_Tishi"),
					content = Strings:get("FAC_Des"),
					sureBtn = {
						text1 = "FAC_Btn"
					}
				}
				local outSelf = self
				local delegate = {
					willClose = function (self, popupMediator, data)
						if callback then
							callback(response.data)
						end
					end
				}
				local view = self:getInjector():getInstance("AlertView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
				}, data, delegate))
			elseif callback then
				callback(response.data)
			end
		end
	end)
end

function ClubSystem:setClubBossTeamInfo(info)
	self._teamInfo = info
end

function ClubSystem:getClubBossTeamInfo()
	return self._teamInfo
end

function ClubSystem:resetClubBossTabRed()
	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local currentTime = gameServerAgent:remoteTimestamp()

	cc.UserDefault:getInstance():setIntegerForKey(UserDefaultKey.kClubBossRedKey, currentTime)
end

function ClubSystem:hasHomeRedPoint()
	if CommonUtils.GetSwitch("fn_clubBoss") == false then
		return false
	end

	local result, tip = self._systemKeeper:isUnlock("ClubStage")

	if not result then
		return false
	end

	local hasJoinClub = self:getHasJoinClub()

	if hasJoinClub == false then
		return false
	end

	local value = cc.UserDefault:getInstance():getIntegerForKey(UserDefaultKey.kClubBossRedKey)

	if not value or value == 0 then
		cc.UserDefault:getInstance():setBoolForKey("ClubBoss_UserDefaultKey", true)

		local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
		local currentTime = gameServerAgent:remoteTimestamp()

		cc.UserDefault:getInstance():setIntegerForKey(UserDefaultKey.kClubBossRedKey, currentTime)

		return true
	end

	local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
	local lastLoginTime = gameServerAgent:remoteTimestamp()
	local clock5Time = TimeUtil:getTimeByDateForTargetTimeInToday({
		sec = 0,
		min = 0,
		hour = 5
	})

	if clock5Time < lastLoginTime and value <= clock5Time then
		return true
	end

	local result = false
	result = self:getClub():getClubBossInfo(ClubHallType.kBoss):checkDelayHurtRewardMark() or self:getClub():getClubBossInfo(ClubHallType.kBoss):checkHasRewardCanGet()

	return result
end

function ClubSystem:hasHomeActivityRedPoint()
	local hasJoinClub = self:getHasJoinClub()

	if hasJoinClub == false then
		return false
	end

	if self:checkHaveActivityBoss() == false then
		return false
	end

	local result, tip = self._systemKeeper:isUnlock("Activity_ClubStage")

	if not result then
		return false
	end

	local result = false
	result = self:getClub():getClubBossInfo(ClubHallType.kActivityBoss):checkDelayHurtRewardMark() or self:getClub():getClubBossInfo(ClubHallType.kActivityBoss):checkHasRewardCanGet()

	return result
end

function ClubSystem:checkHaveActivityBoss()
	local result = false

	if self._summerActivity ~= nil and self._summerActivityId ~= "" then
		local activitySystem = self:getInjector():getInstance("ActivitySystem")
		result = true
		local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
		local curTime = gameServerAgent:remoteTimeMillis()

		if curTime < self._summerActivity:getStartTime() or self._summerActivity:getEndTime() < curTime then
			result = false
		end
	end

	result = result and CommonUtils.GetSwitch("fn_activity_club_boss")

	return result
end

function ClubSystem:listenForcedToLeaveClubCode(data)
	self._forcedLeaveClub = true
	self._enterClubBossBattle = false
	self._clubBossKilled = false

	self:dispatch(Event:new(EVT_CLUB_FORCEDLEVEL))
	self:dispatch(Event:new(EVT_CLUB_REFRESHCLUBINFO_SUCC))
end

function ClubSystem:getForcedLeaveClubMark()
	return self._forcedLeaveClub
end

function ClubSystem:clearForcedLeaveClubMark()
	self._forcedLeaveClub = false
end

function ClubSystem:showClubBossRecordView(viewType)
	self:requestClubBossRecordData(viewType)
end

function ClubSystem:requestClubBossRecordData(viewType)
	local data = {}

	if viewType == ClubHallType.kActivityBoss then
		data.activityId = self._summerActivityId
	else
		data.activityId = ""
	end

	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubBossRecordData(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local resultData = response.data

			if resultData then
				local view = self:getInjector():getInstance("ClubBossRecordView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
				}, resultData))
			end
		end
	end)
end

function ClubSystem:requestClubBossSetTipReadTime(time, viewType)
	local data = {
		time = time
	}

	if viewType == ClubHallType.kActivityBoss then
		data.activityId = self._summerActivityId
	else
		data.activityId = ""
	end

	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubBossSetTipReadTime(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			-- Nothing
		end
	end)
end

function ClubSystem:tryEnterClubResourcesBattle()
	local ClubResourcesBattleData = self:getClub():getClubResourcesBattleInfo()

	if ClubResourcesBattleData:getStatus() == "NOTOPEN" or ClubResourcesBattleData:getStatus() == "MATCHING" then
		self:dispatch(ShowTipEvent({
			duration = 0.35,
			tip = Strings:get("Club_ResourceBattle_9")
		}))

		return
	end

	if ClubResourcesBattleData:getCanJoin() == false then
		self:dispatch(ShowTipEvent({
			duration = 0.35,
			tip = Strings:get("Club_ResourceBattle_16")
		}))
		self:requestClubBattleData(nil, false)

		return
	end

	local view = self:getInjector():getInstance("ClubResourcesBattleView")

	self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, {}))
end

function ClubSystem:requestClubBattleData(func, refresh)
	if CommonUtils.GetSwitch("fn_club_resource_battle") == false then
		return
	end

	local hasJoinClub = self:getHasJoinClub()

	if hasJoinClub == false then
		return
	end

	if self._requestClubBattleDataMark then
		return
	end

	self._requestClubBattleDataMark = true
	local data = {}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubBattleData(data, true, function (response)
		self._requestClubBattleDataMark = false

		if response.resCode == GS_SUCCESS then
			local data = response.data

			self:synchronizeClubResourcesBattleData(data)

			if func then
				func()
			end

			if refresh then
				self:dispatch(Event:new(EVT_CLUBBATTLE_REFRESH))
			end
		end
	end)
end

function ClubSystem:isClubResourcesBattleOpen()
	local result = false
	local hasJoinClub = self:getHasJoinClub()

	if hasJoinClub == false then
		return false
	end

	local clubResourcesBattleInfo = self:getClub():getClubResourcesBattleInfo()

	if clubResourcesBattleInfo:getIsLoadedData() then
		local gameServerAgent = self:getInjector():getInstance("GameServerAgent")
		local remoteTimestamp = gameServerAgent:remoteTimestamp()
		local timeData = clubResourcesBattleInfo:getStartTimeAndEndTime()

		if timeData and timeData.startTime and timeData.endTime and timeData.startTime <= remoteTimestamp and remoteTimestamp < timeData.endTime then
			result = true
		end
	end

	if CommonUtils.GetSwitch("fn_club_resource_battle") == false then
		result = false
	end

	return result
end

function ClubSystem:synchronizeClubResourcesBattleData(data)
	self:getClub():synchronizeClubResourcesBattleData(data)
end

function ClubSystem:requestClubBattleReward(index, isWin)
	local data = {
		index = index,
		isWin = isWin
	}
	local clubService = self:getInjector():getInstance(ClubService)

	clubService:requestClubBattleReward(data, true, function (response)
		if response.resCode == GS_SUCCESS then
			local rewards = response.data

			if rewards then
				local view = self:getInjector():getInstance("getRewardView")

				self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
					maskOpacity = 0
				}, {
					needClick = true,
					rewards = rewards
				}))
				self:dispatch(Event:new(EVT_CLUBBATTLE_AFTER_GET_REWARD))
			end
		end
	end)
end

function ClubSystem:getRemainTime(remainTime, useNotZero)
	local str = ""
	local fmtStr = "${d}:${H}:${M}:${S}"
	local timeStr = TimeUtil:formatTime(fmtStr, remainTime)
	local parts = string.split(timeStr, ":", nil, true)
	local timeTab = {
		day = tonumber(parts[1]),
		hour = tonumber(parts[2]),
		min = tonumber(parts[3]),
		sec = tonumber(parts[4])
	}

	if timeTab.day > 0 then
		str = timeTab.day .. Strings:get("TimeUtil_Day") .. timeTab.hour .. Strings:get("TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
	elseif timeTab.hour > 0 then
		str = timeTab.hour .. Strings:get("TimeUtil_Hour") .. timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
	else
		str = timeTab.min .. Strings:get("TimeUtil_Min") .. timeTab.sec .. Strings:get("TimeUtil_Sec")
	end

	if useNotZero then
		str = ""

		if timeTab.day > 0 then
			str = str .. timeTab.day .. Strings:get("TimeUtil_Day")
		end

		if timeTab.hour > 0 then
			str = str .. timeTab.hour .. Strings:get("TimeUtil_Hour_1")
		end

		if timeTab.min > 0 then
			str = str .. timeTab.min .. Strings:get("TimeUtil_Min")
		end

		if timeTab.sec > 0 then
			str = str .. timeTab.sec .. Strings:get("TimeUtil_Sec")
		end
	end

	return str
end

function ClubSystem:listenClubBossBattleStartCode(data)
	local pointId = data.pointId

	if data.actId and data.actId ~= "" then
		if self._ClubActivityBossBattleCount[pointId] == nil then
			self._ClubActivityBossBattleCount[pointId] = 0
		end

		self._ClubActivityBossBattleCount[pointId] = self._ClubActivityBossBattleCount[pointId] + 1

		self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH_BATTLECOUNT, {
			viewType = ClubHallType.kActivityBoss
		}))
	else
		if self._ClubBossBattleCount[pointId] == nil then
			self._ClubBossBattleCount[pointId] = 0
		end

		self._ClubBossBattleCount[pointId] = self._ClubBossBattleCount[pointId] + 1

		self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH_BATTLECOUNT, {
			viewType = ClubHallType.kBoss
		}))
	end
end

function ClubSystem:listenClubBossBattleEndCode(data)
	local pointId = data.pointId

	if data.actId and data.actId ~= "" then
		if self._ClubActivityBossBattleCount[pointId] == nil then
			self._ClubActivityBossBattleCount[pointId] = 0
		end

		self._ClubActivityBossBattleCount[pointId] = self._ClubActivityBossBattleCount[pointId] - 1

		if self._ClubActivityBossBattleCount[pointId] < 0 then
			self._ClubActivityBossBattleCount[pointId] = 0
		end

		self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH_BATTLECOUNT, {
			viewType = ClubHallType.kActivityBoss
		}))
	else
		if self._ClubBossBattleCount[pointId] == nil then
			self._ClubBossBattleCount[pointId] = 0
		end

		self._ClubBossBattleCount[pointId] = self._ClubBossBattleCount[pointId] - 1

		if self._ClubBossBattleCount[pointId] < 0 then
			self._ClubBossBattleCount[pointId] = 0
		end

		self:dispatch(Event:new(EVT_CLUBBOSS_REFRESH_BATTLECOUNT, {
			viewType = ClubHallType.kBoss
		}))
	end
end

function ClubSystem:getClubBossBattleConunt(viewType, pointId)
	local result = nil

	if viewType == ClubHallType.kActivityBoss then
		result = self._ClubActivityBossBattleCount[pointId]
	end

	if viewType == ClubHallType.kBoss then
		result = self._ClubBossBattleCount[pointId]
	end

	if result == nil then
		result = 0
	end

	return result
end
