MainTLInterpreter = class("MainTLInterpreter", TLInterpreter, _M)

function MainTLInterpreter:initialize(viewContext)
	super.initialize(self)

	self._context = viewContext
	self._mainMediator = viewContext:getValue("BattleMainMediator")
	self._battleUIMediator = viewContext:getValue("BattleUIMediator")
	self._screenEffectLayer = viewContext:getValue("BattleScreenEffectLayer")
	self._viewFrame = self._mainMediator:getTargetFrame()
end

function MainTLInterpreter:act_Prepare(action, args)
	if self._battleUIMediator.setTotalTime then
		self._battleUIMediator:setTotalTime(args.time)
	end

	local waveWidget = self._context:getValue("BattleWaveWidget")

	if waveWidget ~= nil then
		waveWidget:setWave(args.bout, args.total)
	end

	self._battleUIMediator:enableCtrlButton()
	self._screenEffectLayer:showReadyStart(function ()
		if self._battleUIMediator.enableBottomButton then
			self._battleUIMediator:enableBottomButton()
		end

		if self._battleUIMediator.afterReadyStart then
			self._battleUIMediator:afterReadyStart()
		end

		local battleShowQueue = self._context:getValue("BattleShowQueue")

		if battleShowQueue then
			battleShowQueue:show()
		end
	end)

	local data = {
		mainMediator = self._mainMediator
	}

	self._context:dispatch(Event:new(EVT_BATTLE_POINT_READY, data))
end

function MainTLInterpreter:act_GoFighting()
end

function MainTLInterpreter:act_NewPhase(action, args)
	local energySpeed = args.energySpeed

	if type(args.energySpeed) == "table" then
		if self._context:getValue("IsTeamAView") then
			energySpeed = args.energySpeed[1]
		else
			energySpeed = args.energySpeed[2]
		end
	end

	local phase = math.max(args.bout or -1, args.phase or -1)

	self._battleUIMediator:startNewPhase(phase, args.duration, args.time, energySpeed, args.timelimit)

	local viewConfig = self._mainMediator:getViewConfig()
	local bgm = phase and viewConfig and viewConfig.bgm and viewConfig.bgm[phase]

	if bgm and bgm ~= "" then
		self._mainMediator:playBGM(bgm)
	end
end

function MainTLInterpreter:act_Round(action, args)
	self._battleUIMediator:roundChanged(args.num, args.max)

	local lootsWidget = self._context:getValue("BattleLootWidget")

	if lootsWidget ~= nil then
		lootsWidget:collectAllLoots(self._context:getScalableScheduler())
	end
end

function MainTLInterpreter:act_Timing(action, args)
	if args.ctrl == "pause" then
		self._battleUIMediator:pauseTiming(args.time)
		self._battleUIMediator:pauseEnergyIncreasing()
	elseif args.ctrl == "resume" then
		self._battleUIMediator:resumeTiming(args.time)
		self._battleUIMediator:resumeEnergyIncreasing()
	end
end

function MainTLInterpreter:act_FinishBout(action, args)
	local lootsWidget = self._context:getValue("BattleLootWidget")

	if lootsWidget ~= nil then
		lootsWidget:collectAllLoots(self._context:getScalableScheduler())
	end

	if self._battleUIMediator.getCardArray and self._battleUIMediator:getCardArray() then
		self._battleUIMediator:getCardArray():forceTouchEnded()
		self._battleUIMediator:getCardArray():setGray(true)
		self._battleUIMediator:getCardArray():setTouchEnabled(false)
	end
end

function MainTLInterpreter:act_NewBout(action, args)
	if self._battleUIMediator.getCardArray and self._battleUIMediator:getCardArray() then
		self._battleUIMediator:getCardArray():setGray(false)
		self._battleUIMediator:getCardArray():setTouchEnabled(true)
	end
end

function MainTLInterpreter:act_NextBout(action, args)
	self._context:setValue("FinalHit", false)
	self._context:setValue("CameraActId", nil)

	local camera = self._context:getValue("Camera")

	camera:focusOn(display.cx, display.cy, 1, 0.2)

	local waveWidget = self._context:getValue("BattleWaveWidget")

	if waveWidget ~= nil then
		waveWidget:setWave(args.bout, args.total)
	end

	if self._battleUIMediator.showNewWaveLabel then
		self._battleUIMediator:showNewWaveLabel(args.bout)
	end
end

function MainTLInterpreter:act_EndWave(action, args)
	local lootsWidget = self._context:getValue("BattleLootWidget")

	if lootsWidget ~= nil then
		lootsWidget:collectAllLoots(self._context:getScalableScheduler())
	end

	if self._battleUIMediator.getCardArray and self._battleUIMediator:getCardArray() then
		self._battleUIMediator:getCardArray():forceTouchEnded()
		self._battleUIMediator:getCardArray():setGray(true)
		self._battleUIMediator:getCardArray():setTouchEnabled(false)
	end
end

function MainTLInterpreter:act_NewWave(action, args)
	if self._battleUIMediator.getCardArray and self._battleUIMediator:getCardArray() then
		self._battleUIMediator:getCardArray():setGray(false)
		self._battleUIMediator:getCardArray():setTouchEnabled(true)
	end
end

function MainTLInterpreter:act_Finish(action, args)
	local sideOfWinner = result == kBattleSideAWin and kBattleSideA or kBattleSideB
	local sideOfViewer = self._context:getValue("IsTeamAView") and kBattleSideA or kBattleSideB

	if sideOfWinner == sideOfViewer then
		local lootsWidget = self._context:getValue("BattleLootWidget")

		if lootsWidget ~= nil then
			lootsWidget:collectAllLoots(self._context:getScalableScheduler())
		end
	end

	self._context:finishBattle(args.result)
	self._battleUIMediator:setTouchEnabled(false)
	self._mainMediator:battleFinished(args.result)
end

function MainTLInterpreter:act_ChangeBG(action, args)
	self._mainMediator:changeBackground(args.filename)
end

function MainTLInterpreter:act_Timeup(action, args)
	self._context:finishBattle(args.result)
	self._mainMediator:battleTimeup(args.result)
end

function MainTLInterpreter:act_BossComing(action, args)
	local battleShowQueue = self._context:getValue("BattleShowQueue")

	if battleShowQueue then
		if args.pause then
			battleShowQueue:addFirstBossShow()
		else
			battleShowQueue:addEndBossShow()
		end
	end
end

function MainTLInterpreter:act_Error(action, args)
	self._mainMediator:uploadErrorBattleDump(args)
end
