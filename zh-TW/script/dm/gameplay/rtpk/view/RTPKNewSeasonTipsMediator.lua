RTPKNewSeasonTipsMediator = class("RTPKNewSeasonTipsMediator", DmPopupViewMediator, _M)

RTPKNewSeasonTipsMediator:has("_rtpkSystem", {
	is = "r"
}):injectWith("RTPKSystem")

function RTPKNewSeasonTipsMediator:initialize()
	super.initialize(self)
end

function RTPKNewSeasonTipsMediator:dispose()
	super.dispose(self)
end

function RTPKNewSeasonTipsMediator:onRegister()
	super.onRegister(self)

	self._main = self:getView():getChildByName("main")
end

function RTPKNewSeasonTipsMediator:enterWithData(data)
	self._rtpk = self._rtpkSystem:getRtpk()

	self:mapEventListeners()
	self:initWidget()
	self:setupView()
end

function RTPKNewSeasonTipsMediator:mapEventListeners()
end

function RTPKNewSeasonTipsMediator:initWidget()
	self._timeLayout = self._main:getChildByName("timeLayout")
	self._lastScoreText = self._main:getChildByName("Text_lastscore")
	self._curScoreText = self._main:getChildByName("Text_curscore")
	local animNode = self._main:getChildByName("animNode")
	local anim = cc.MovieClip:create("rtpkxinsaijikaiqi_xinsaijikaiqi")

	anim:addTo(animNode):posite(0, -35)

	local nodeToActionMap = {}
	local donguzo = anim:getChildByFullName("dongzuo")
	nodeToActionMap[self._timeLayout] = donguzo
	local startFunc2, stopFunc2 = CommonUtils.bindNodeToActionNode(nodeToActionMap, animNode, false)

	startFunc2()
	anim:addCallbackAtFrame(11, function ()
		stopFunc2()
	end)

	local nodeToActionMap = {}
	local seasonConfig = self._rtpk:getSeasonConfig()

	if seasonConfig.SeasonOrder ~= 1 then
		local donguzo = anim:getChildByFullName("mc_season")
		nodeToActionMap[self._lastScoreText] = donguzo
		local startFunc2, stopFunc2 = CommonUtils.bindNodeToActionNode(nodeToActionMap, animNode, false)

		startFunc2()
		anim:addCallbackAtFrame(50, function ()
			stopFunc2()
		end)
	end

	local nodeToActionMap = {}
	local donguzo = anim:getChildByFullName("mc_score")
	nodeToActionMap[self._curScoreText] = donguzo
	local startFunc2, stopFunc2 = CommonUtils.bindNodeToActionNode(nodeToActionMap, animNode, false)

	startFunc2()
	anim:addCallbackAtFrame(50, function ()
		stopFunc2()
	end)
	anim:addCallbackAtFrame(55, function ()
		anim:stop()
	end)
end

function RTPKNewSeasonTipsMediator:setupView()
	local seasonConfig = self._rtpk:getSeasonConfig()
	local indexText = self._main:getChildByName("Text_index")

	indexText:setString(Strings:get("RTPK_Main_Season", {
		index = seasonConfig.SeasonOrder
	}) .. Strings:get("RTPK_Main_SeasonText"))

	local nameText = self._main:getChildByName("Text_name")

	nameText:setString(Strings:get(seasonConfig.Name))
	self._lastScoreText:setString(Strings:get("RTPK_LastSeason_Score", {
		score = self._rtpk:getLastSeasonScore()
	}))
	self._curScoreText:setString(Strings:get("RTPK_InheritLasetSeason_Score", {
		inheritScore = self._rtpk:getCurScore()
	}))

	local startTime = TimeUtil:localDate("%Y.%m.%d %H:%M", self._rtpk:getStartTime())
	local endTime = TimeUtil:localDate("%Y.%m.%d %H:%M", self._rtpk:getEndTime())
	local timeText = self._timeLayout:getChildByName("Text_time")

	timeText:setString(startTime .. "-" .. endTime)

	if seasonConfig.SeasonOrder == 1 then
		self._lastScoreText:setVisible(false)
		self._curScoreText:setString(Strings:get("RTPK_NewSeason_Score", {
			score = self._rtpk:getCurScore()
		}))
	end
end
