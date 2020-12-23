require("dm.battle.view.BattleMainMediator")

RTPVPBattleMainMediator = class("RTPVPBattleMainMediator", BattleMainMediator)

RTPVPBattleMainMediator:has("_controller", {
	is = "r"
}):injectWith("RTPVPController")

function RTPVPBattleMainMediator:initialize()
	super.initialize(self)
end

function RTPVPBattleMainMediator:onRemove()
	self._controller:leave()
	super.onRemove(self)
end

function RTPVPBattleMainMediator:enterWithData(data)
	super.enterWithData(self, data)
	self:mapEventListeners()

	if self._controller:getBattleFinishData() then
		local data = self._controller:getBattleFinishData()

		self._delegate:onBattleFinished(self, {
			winner = data.resultData.winner,
			summary = data.resultData.summary
		})
		self._controller:clearBattleFinishData()
	end

	local view = self:getView()

	self:createSurrenderButton()
end

function RTPVPBattleMainMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_RTPVP_BATTLE_SPEEDUP, self, self._speedUp)
	self:mapEventListener(self:getEventDispatcher(), EVT_RTPVP_BATTLE_STOPTICK, self, self._stopTick)
	self:mapEventListener(self:getEventDispatcher(), EVT_RTPVP_BATTLE_SKIP, self, self._battleSkip)
	self:mapEventListener(self:getEventDispatcher(), EVT_RTPVP_BATTLE_RESULT, self, self._battleResult)
	self:mapEventListener(self:getEventDispatcher(), EVT_RTPVP_BATTLE_EMOJI, self, self._displayEmoji)
	self:mapEventListener(self:getEventDispatcher(), EVT_RESIGN_ACTIVE, self, self._homeResign)
	self:mapEventListener(self:getEventDispatcher(), EVT_BECOME_ACTIVE, self, self._homeReturn)
	self._viewContext:addEventListener(EVT_BATTLE_POINT_READY, self, self._readyGoFinish)
	self:mapEventListener(self:getEventDispatcher(), EVT_RTPVP_CONN_ERROR, self, self._connectError)
end

function RTPVPBattleMainMediator:_connectError()
	local outSelf = self
	local delegate = {
		willClose = function (self, popupMediator, data)
			BattleLoader:popBattleView(outSelf)
		end
	}
	local data = {
		notMaskClose = true,
		title = Strings:get("Tower_Text48"),
		content = Strings:get("RTPK_UI_101"),
		sureBtn = {}
	}
	local view = self:getInjector():getInstance("AlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, data, delegate))
end

function RTPVPBattleMainMediator:setupHeadLayer(view)
	local leftTeam = self._leftTeam
	local rightTeam = self._rightTeam
	local leftIcon = leftTeam:getView():getChildByName("icon")
	local leftExpsWidget = leftTeam:getExpressionWidget()
	local rightExpsWidget = rightTeam:getExpressionWidget()

	leftExpsWidget:setFlipped(false)
	rightExpsWidget:setFlipped(true)
	leftExpsWidget:setScheduler(self._viewContext:getScalableScheduler())
	rightExpsWidget:setScheduler(self._viewContext:getScalableScheduler())
	leftIcon:setTouchEnabled(true)
	leftIcon:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			if leftExpsWidget:isEmojiPackageVisible() then
				leftExpsWidget:hideEmojiPackage()
			else
				leftExpsWidget:showEmojiPackage()
			end
		end
	end)
	leftExpsWidget:setChosenCallback(function (isOk, ret)
		if isOk then
			self._controller:sendEmoji({
				id = ret,
				rid = self._delegate:getMainPlayerId()
			})
		end
	end)

	self._rightExpsWidget = rightExpsWidget
	local netLabel = ccui.Text:create()

	netLabel:addTo(view)
	netLabel:setFontSize(16)
	netLabel:setFontName(DEFAULT_TTF_FONT)
	netLabel:setAnchorPoint(0, 0.5)
	netLabel:setPosition(view:getContentSize().width - 130, 25)

	self._netLabel = netLabel
	self._netTask = self._viewContext:getScheduler():schedule(function (task, dt)
		local delay = math.ceil(self._battleDirector:getNetDelay())

		netLabel:setString(Strings:get("RTPvp_Delay_Text", {
			delay = delay
		}))
		netLabel:setColor(delay < 100 and cc.GREEN or cc.RED)
	end, 1)
end

function RTPVPBattleMainMediator:_displayEmoji(evt)
	local data = evt:getData()

	if data.rid ~= self._delegate:getMainPlayerId() then
		self._rightExpsWidget:showEmoji(data.id)
	end
end

function RTPVPBattleMainMediator:surrender()
	self._controller:getDirector():sendMessage("leave", "surrender")
end

function RTPVPBattleMainMediator:battleFinished(result)
	local resultData = {
		result = result
	}
	resultData.winner = resultData.winner or self:calWinnerId(result)
	local simulator = self._battleDirector:getBattleSimulator()

	if simulator then
		local battleStatist = simulator:getBattleStatist()
		local summary = battleStatist:getSummary()
		resultData.summary = summary
		resultData.opData = simulator:getInputManager():dumpInputHistory()
	else
		resultData.summary = {}
		resultData.opData = {}
	end

	self._controller:battleFinish(resultData)
	super.battleFinished(self, result)
end

function RTPVPBattleMainMediator:setupDevMode()
	if GameConfigs.openDevWin then
		local winBtn = ccui.Text:create("PASS", TTF_FONT_FZYH_M, 40)
		local viewFrame = self.targetFrame

		winBtn:setTouchEnabled(true)
		winBtn:setScale(0.95)
		winBtn:addTo(self:getView())
		winBtn:setAnchorPoint(1, 0.5)
		winBtn:setPosition(viewFrame.width - viewFrame.x, 105)
		winBtn:addClickEventListener(function (sender, eventType)
			self:finishBattle({
				winner = self._delegate:getMainPlayerId()
			})
		end)
	end
end

function RTPVPBattleMainMediator:createSurrenderButton()
	local surrenderBtn = ccui.Button:create("zd_zd_icon.png", "zd_zd_icon.png", "zd_zd_icon.png", ccui.TextureResType.plistType)
	local viewFrame = self.targetFrame

	surrenderBtn:addTo(self:getView())
	surrenderBtn:setAnchorPoint(1, 0.5)
	surrenderBtn:setPosition(viewFrame.width - viewFrame.x, 320)
	surrenderBtn:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			Bdump("surrender!!!!!")
			self:surrender()
		end
	end)
	surrenderBtn:setVisible(false)

	self._surrenderBtn = surrenderBtn
end

function RTPVPBattleMainMediator:calWinnerId(result)
	local isTeamAView = self._viewContext:getValue("IsTeamAView")

	if isTeamAView and result == kBattleSideAWin or not isTeamAView and result ~= kBattleSideAWin then
		return self._delegate:getMainPlayerId()
	else
		return self._delegate:getOpponentId()
	end
end

function RTPVPBattleMainMediator:_speedUp(evt)
	local newScale = evt:getData()
	local viewContext = self._viewContext
	local timeScale = viewContext:getTimeScale()

	if timeScale < newScale or newScale == 1 then
		viewContext:setTimeScale(newScale)
	end
end

function RTPVPBattleMainMediator:_stopTick()
	self.battleUIMediator:setTouchEnabled(false)
	self:stopScheduler()
	self._controller:errorLeave()
	self._delegate:onBattleFinished(self, {
		winner = self._delegate:getOpponentId()
	})
end

function RTPVPBattleMainMediator:_battleResult(evt)
	local resultData = evt:getData().resultData

	self._controller:displayToTheEnd()

	if resultData and resultData.reason == "PLAYER_LEFT" then
		self._delegate:onBattleFinished(self, resultData)

		return
	end
end

function RTPVPBattleMainMediator:didFinishBattle()
	if self._controller:getBattleFinishData() then
		local data = self._controller:getBattleFinishData()

		self._delegate:onBattleFinished(self, {
			winner = data.resultData.winner,
			summary = data.resultData.summary
		})
		self._controller:clearBattleFinishData()
	end
end

function RTPVPBattleMainMediator:battleWinOrLose(result)
	if self._controller:getBattleFinishData() then
		local data = self._controller:getBattleFinishData()

		self._delegate:onBattleFinished(self, {
			winner = data.resultData.winner,
			summary = data.resultData.summary
		})
		self._controller:clearBattleFinishData()
	end
end

function RTPVPBattleMainMediator:_battleSkip()
	BattleLoader:popBattleView(self)
end

function RTPVPBattleMainMediator:_readyGoFinish()
	self._surrenderBtn:setVisible(true)
end

function RTPVPBattleMainMediator:_homeResign()
	self._homeTs = os.timemillis()
end

function RTPVPBattleMainMediator:_homeReturn()
	if not self._homeTs then
		return
	end

	local tickMs = os.timemillis() - self._homeTs
	self._homeTs = nil

	self._controller:getDirector():repairHome()
	self:tick(tickMs / 1000)
end
