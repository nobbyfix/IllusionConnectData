PushSystem = class("PushSystem", legs.Actor)

PushSystem:has("_pushService", {
	is = "r"
}):injectWith("PushService")
PushSystem:has("_gameServer", {
	is = "r"
}):injectWith("GameServerAgent")

function PushSystem:initialize()
	super.initialize(self)
end

function PushSystem:listenBeforeLogin()
	self:listenPayOffDiff()
end

function PushSystem:listen()
	self:listenTimeChange()
	self:listenNewMail()
	self:listenArenaSeasonOver()
	self:listenFriendPower()
	self:listenFriendNewApply()
	self:listenFriendCountChange()
	self:listenBattleCheckFail()
	self:listenFriendPvp()
	self:listenLoginByOthers()
	self:listenWelfareCode()
	self:listenCrusadeDiff()
	self:listenMaskWordDiff()
	self:listenForcedToLeaveClubCode()
	self:listenRankingRewardCode()
	self:listenClubBossKilledCode()
	self:listenClubBossTVTipCode()
	self:listenClubBossHurtCode()
	self:listenClubBossBattleStartCode()
	self:listenClubBossBattleEndCode()
	self:listenCommonTipsCode()
end

function PushSystem:listenLoginByOthers()
	self._pushService:listenLoginByOthers(function (response)
		self:dispatch(ShowStaticTipEvent({
			delay = 9999,
			tip = Strings:get("LOGIN_BY_OTHERS")
		}))
	end)
end

function PushSystem:listenTimeChange()
	self._pushService:listenTimeChange(function (response)
		self._gameServer:setTimeOffset(response.timeOffset)
	end)
end

function PushSystem:listenNewMail()
	self._pushService:listenNewMail(function (response)
		dump(response, "response-_________listenNewMail")

		local function callback(mailResponse)
			self:dispatch(Event:new(EVT_HOMEVIEW_REDPOINT_REF, {
				type = 1
			}))
		end

		local mailSystem = self:getInjector():getInstance(MailSystem)

		mailSystem:requestUnreadMailCnt(false, callback)
	end)
end

function PushSystem:listenWelfareCode()
	self._pushService:listenWelfareCode(function (response)
		local status = response.status

		if status == 0 then
			self:dispatch(Event:new(EVT_CODE_EXCHANGE_SUC))

			local view = self:getInjector():getInstance("getRewardView")

			self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
				maskOpacity = 0
			}, {
				rewards = response.rewards
			}))
		elseif status == 20004 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR1")
			}))
		elseif status == 20006 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR2")
			}))
		elseif status == 20007 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR3")
			}))
		elseif status == 20003 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR5")
			}))
		elseif status == 20001 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR_1")
			}))
		elseif status == 20002 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR_2")
			}))
		elseif status == 20005 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR_5")
			}))
		elseif status == 20008 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR_8")
			}))
		elseif status == 20009 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR_9")
			}))
		elseif status == 20010 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR10")
			}))
		else
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Welfare_ERROR4")
			}))
		end
	end)
end

function PushSystem:listenArenaSeasonOver()
	self._pushService:listenArenaSeasonOver(function (response)
		dump(response, "arenaSeasonOver")
		self:dispatch(Event:new(EVT_ARENA_SEASON_OVER))
	end)
end

function PushSystem:listenFriendPower()
	self._pushService:listenFriendPower(function (response)
		local friendSystem = self:getInjector():getInstance(FriendSystem)
		local canShowRedPoint = friendSystem:getReceveStateAsBool()

		if canShowRedPoint then
			self:dispatch(Event:new(EVT_HOMEVIEW_REDPOINT_REF, {
				showRedPoint = 1,
				type = 2
			}))
		end
	end)
end

function PushSystem:listenFriendNewApply()
	self._pushService:listenFriendNewApply(function (response)
		local friendSystem = self:getInjector():getInstance(FriendSystem)

		friendSystem:setHasNewApplyFriends(true)
		self:dispatch(Event:new(EVT_REDPOINT_REFRESH))
		self:dispatch(Event:new(EVT_FRIENDAPPLY_REFRESH))
	end)
end

function PushSystem:listenFriendPvp()
	local friendPvpSystem = self:getInjector():getInstance(FriendPvpSystem)

	friendPvpSystem:listen()
end

function PushSystem:listenFriendCountChange()
	self._pushService:listenFriendCountChange(function (response)
		dump(response, "response-_________listenFriendCountChange")

		local friendSystem = self:getInjector():getInstance(FriendSystem)

		if response.type == 1 then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Friend_Tip1", {
					nickname = response.nickname,
					fontName = TTF_FONT_FZYH_M
				})
			}))
		end

		friendSystem._friendService:requestFriendsMainInfo({}, false)
	end)
end

function PushSystem:listenBattleCheckFail()
end

function PushSystem:listenPayOffDiff()
	local payOffSystem = self:getInjector():getInstance(PayOffSystem)

	payOffSystem:listenPayOffDiff()
end

function PushSystem:listenCrusadeDiff()
	local crusadeSystem = self:getInjector():getInstance(CrusadeSystem)

	crusadeSystem:listenCrusadeDiff()
end

function PushSystem:listenMaskWordDiff()
	local maskWordSystem = self:getInjector():getInstance(MaskWordSystem)

	maskWordSystem:listenMaskWordDiff()
end

function PushSystem:listenForcedToLeaveClubCode()
	self._pushService:listenForcedToLeaveClubCode(function (response)
		local clubSystem = self:getInjector():getInstance(ClubSystem)

		clubSystem:listenForcedToLeaveClubCode(response)
	end)
end

function PushSystem:listenRankingRewardCode()
	self._pushService:listenRankingRewardCode(function (response)
		local rankSystem = self:getInjector():getInstance(RankSystem)

		rankSystem:requestGetRewardList()
	end)
end

function PushSystem:listenClubBossKilledCode()
	self._pushService:listenClubBossKilledCode(function (response)
		local clubSystem = self:getInjector():getInstance(ClubSystem)

		clubSystem:listenClubBossKilledCode(response)
	end)
end

function PushSystem:listenClubBossTVTipCode()
	self._pushService:listenClubBossTVTipCode(function (response)
		local clubSystem = self:getInjector():getInstance(ClubSystem)

		clubSystem:listenClubBossTVTipCode(response)
	end)
end

function PushSystem:listenClubBossHurtCode()
	self._pushService:listenClubBossHurtCode(function (response)
		local clubSystem = self:getInjector():getInstance(ClubSystem)

		clubSystem:listenClubBossHurtCode(response)
	end)
end

function PushSystem:listenClubBossBattleStartCode()
	self._pushService:listenClubBossBattleStartCode(function (response)
		local clubSystem = self:getInjector():getInstance(ClubSystem)

		clubSystem:listenClubBossBattleStartCode(response)
	end)
end

function PushSystem:listenClubBossBattleEndCode()
	self._pushService:listenClubBossBattleEndCode(function (response)
		local clubSystem = self:getInjector():getInstance(ClubSystem)

		clubSystem:listenClubBossBattleEndCode(response)
	end)
end

function PushSystem:listenCommonTipsCode()
	self._pushService:listenCommonTipsCode(function (response)
		if response and response.transCode then
			self:dispatch(ShowTipEvent({
				duration = 0.3,
				tip = Strings:get(tostring(response.transCode))
			}))
		end
	end)
end
