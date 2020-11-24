ClubMediator = class("ClubMediator", DmAreaViewMediator, _M)

ClubMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ClubMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
ClubMediator:has("_clubSystem", {
	is = "r"
}):injectWith("ClubSystem")

local kBtnHandlers = {}
ClubViewType = {
	kJoin = 2,
	kNotJoin = 1
}
local kClubViewPath = {
	[ClubViewType.kNotJoin] = "ClubApplyView",
	[ClubViewType.kJoin] = "ClubHallView"
}
local kClubViewNameStr = {
	[ClubViewType.kNotJoin] = Strings:get("Club_Text48"),
	[ClubViewType.kJoin] = Strings:get("Club_Text50")
}

function ClubMediator:initialize()
	super.initialize(self)
end

function ClubMediator:dispose()
	if self._chatFlowWidget then
		self._chatFlowWidget:dispose()

		self._chatFlowWidget = nil
	end

	self._viewClose = true

	self._clubSystem:setListenPush(false)
	self:disposeView()
	super.dispose(self)
end

function ClubMediator:disposeView()
	self._viewCache = nil
end

function ClubMediator:userInject()
end

function ClubMediator:onRegister()
	local view = self:getView()
	local background = cc.Sprite:create("asset/scene/common_bg.jpg")

	background:addTo(view, -1):setName("backgroundBG"):center(view:getContentSize())
	super.onRegister(self)
	self:setupChatFlowWidget()
end

function ClubMediator:enterWithData(data)
	self:setupTopInfoWidget()
	self:initNodes()
	self:createData()
	self:refreshData()
	self:createMainView(data)
	self:refreshSelectView(data)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUB_CREATECLUB_SUCC, self, self.refreshViewByCreateClubScuess)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUB_QUIT_SUCC, self, self.rquitClubScuess)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUB_APPLYSCUESS_SUCC, self, self.applyClubScuess)
	self:mapEventListener(self:getEventDispatcher(), EVT_CLUB_REFRESHCLUBINFO_SUCC, self, self.refreshClubScuess)
	self._clubSystem:listenPush()
	self._clubSystem:setListenPush(true)
	self:setupClickEnvs()
end

function ClubMediator:setupChatFlowWidget()
	local chatFLowNode = self:getView():getChildByName("chat_flow_node")

	chatFLowNode:setLocalZOrder(9999)

	local chatFlowWidget = ChatFlowWidget:new(chatFLowNode)

	self:getInjector():injectInto(chatFlowWidget)
	chatFlowWidget:start(ChannelId.kUnionFlow)

	self._chatFlowWidget = chatFlowWidget
end

function ClubMediator:refreshClubScuess(event)
	self._clubSystem:requestClubInfo(function ()
		self:createMainView()
	end)
end

function ClubMediator:applyClubScuess(event)
	self:createMainView()
end

function ClubMediator:rquitClubScuess(event)
	delayCallByTime(500, function ()
		self:dispatch(Event:new(EVT_HOMEVIEW_REDPOINT_REF, {
			showRedPoint = -1,
			type = 4
		}))
		self:dismissWithOptions({
			transition = ViewTransitionFactory:create(ViewTransitionType.kCommonAreaView)
		})
		cc.Director:getInstance():getOpenGLView():setIMEKeyboardState(false)
	end)
end

function ClubMediator:refreshViewByCreateClubScuess(event)
	self:createMainView()
end

function ClubMediator:initNodes()
	self._mainPanel = self:getView():getChildByFullName("main")
end

function ClubMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")

	topInfoNode:setLocalZOrder(999)

	local currencyInfoWidget = self._systemKeeper:getResourceBannerIds("Club_System")
	local currencyInfo = {}

	for i = #currencyInfoWidget, 1, -1 do
		currencyInfo[#currencyInfoWidget - i + 1] = currencyInfoWidget[i]
	end

	local config = {
		style = 1,
		title = "",
		hasAnim = true,
		currencyInfo = currencyInfo,
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		}
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function ClubMediator:createData()
	self._player = self._developSystem:getPlayer()
	self._clubInfoOj = self._clubSystem:getClubInfoOj()
end

function ClubMediator:refreshData()
end

function ClubMediator:createMainView(data)
	local hasJoinClub = self._clubSystem:getHasJoinClub()
	local viewType = hasJoinClub and ClubViewType.kJoin or ClubViewType.kNotJoin
	local viewPath = kClubViewPath[viewType]

	if self._curView then
		self._curView:removeFromParent(true)
	end

	if viewType == ClubViewType.kNotJoin and self._clubSystem:getForcedLeaveClubMark() == true then
		self._clubSystem:clearForcedLeaveClubMark()
		self:dispatch(ShowTipEvent({
			tip = Strings:get("clubBoss_47")
		}))
	end

	local view = self:getInjector():getInstance(viewPath)

	if view then
		self:getView():addChild(view)
		view:setLocalZOrder(9)
		view:setPosition(0, 0)

		local mediator = self:getMediatorMap():retrieveMediator(view)

		if mediator then
			view.mediator = mediator

			mediator:enterWithData(data)
		end

		self._curView = view
	end

	local viewNameStr = kClubViewNameStr[viewType]

	self._topInfoWidget:updateTitle(viewNameStr)
end

function ClubMediator:refreshSelectView(data)
	if not data or not data.clubName then
		return
	end

	if self._curView then
		local mediator = self._curView.mediator

		mediator:refreshView()

		if mediator.setSelectClubId then
			mediator:setSelectClubId(data.clubName)
		end
	end
end

function ClubMediator:onClickBack(sender, eventType)
	self:dispatch(Event:new(EVT_HOMEVIEW_REDPOINT_REF, {
		showRedPoint = -1,
		type = 4
	}))
	self:dismissWithOptions({
		transition = ViewTransitionFactory:create(ViewTransitionType.kCommonAreaView)
	})
	cc.Director:getInstance():getOpenGLView():setIMEKeyboardState(false)
end

function ClubMediator:setupClickEnvs()
	local sequence = cc.Sequence:create(cc.CallFunc:create(function ()
		local storyDirector = self:getInjector():getInstance(story.StoryDirector)

		storyDirector:notifyWaiting("enter_ClubMediator")
	end))

	self:getView():runAction(sequence)
end
