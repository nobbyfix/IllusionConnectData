RTPVPRobotBattleMediator = class("RTPVPRobotBattleMediator", BattleMainMediator, _M)

function RTPVPRobotBattleMediator:initialize()
	super.initialize(self)
end

function RTPVPRobotBattleMediator:onRemove()
	cancelDelayCall(self._surrenderTimer)
	super.onRemove(self)
end

function RTPVPRobotBattleMediator:enterWithData(data)
	super.enterWithData(self, data)
	self:mapEventListeners()
	self:createSurrenderButton()
end

function RTPVPRobotBattleMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_RESIGN_ACTIVE, self, self._homeResign)
	self:mapEventListener(self:getEventDispatcher(), EVT_BECOME_ACTIVE, self, self._homeReturn)
	self._viewContext:addEventListener(EVT_BATTLE_POINT_READY, self, self._readyGoFinish)
end

function RTPVPRobotBattleMediator:resumeWithData(data)
	super.resumeWithData(self, data)
end

function RTPVPRobotBattleMediator:createSurrenderButton()
	local surrenderBtn = ccui.Button:create("zd_zd_icon.png", "zd_zd_icon.png", "zd_zd_icon.png", ccui.TextureResType.plistType)
	local ctrlButtons = self.battleUIMediator:getCtrlButtons()
	local ctrlView = ctrlButtons:getView()

	surrenderBtn:addTo(ctrlView)
	surrenderBtn:setAnchorPoint(0.5, 0.5)
	surrenderBtn:setPosition(0, 30)
	surrenderBtn:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended then
			self:stopScheduler()
			self._delegate:onBattleSurrender()
		end
	end)
	surrenderBtn:setVisible(false)

	self._surrenderBtn = surrenderBtn
end

function RTPVPRobotBattleMediator:_readyGoFinish()
	local time = ConfigReader:getDataByNameIdAndKey("ConfigValue", "RTPK_LostTine", "content")
	self._surrenderTimer = delayCallByTime((time + 1) * 1000, function ()
		self._surrenderBtn:setVisible(true)
	end)
end

function RTPVPRobotBattleMediator:_homeResign()
	self._homeTs = os.timemillis()
end

function RTPVPRobotBattleMediator:_homeReturn()
	if not self._homeTs then
		return
	end

	local tickMs = os.timemillis() - self._homeTs
	self._homeTs = nil

	self._controller:getDirector():repairHome()
	self:tick(tickMs / 1000)
end
