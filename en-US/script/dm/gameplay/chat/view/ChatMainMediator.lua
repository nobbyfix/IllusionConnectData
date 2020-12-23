ChatMainMediator = class("ChatMainMediator", DmPopupViewMediator, _M)

ChatMainMediator:has("_chatSystem", {
	is = "r"
}):injectWith("ChatSystem")
ChatMainMediator:has("_chat", {
	is = "r"
})

local kBtnHandlers = {
	["main.bg.btn_close"] = {
		clickAudio = "Se_Click_Fold_2",
		func = "onClickBack"
	},
	["main.unopen_channel_tip.join_btn.button"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickJoinUnion"
	},
	["main.chatTable.unread_tip_bar"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickUnreadTip"
	}
}
local TabName = {
	"Chat_Label_System",
	"Chat_Label_World",
	"Chat_Label_Union",
	"Chat_Label_Team"
}
local TabNameTranslate = {
	"UITitle_EN_Xitong",
	"UITitle_EN_Shijie",
	"UITitle_EN_Jieshe",
	"UITitle_EN_Duiwu"
}
local kChatMainPanelWidth = 715

function ChatMainMediator:initialize()
	super.initialize(self)

	self._curTabType = ChatTabType.kWorld
	self._lockScreen = false
	self._newMessageCnt = 0
	self._messageItemCount = 0
end

function ChatMainMediator:userInject(injector)
	self._chat = self._chatSystem:getChat()
end

function ChatMainMediator:dispose()
	if self._chatOperatorWidget then
		self._chatOperatorWidget:dispose()

		self._chatOperatorWidget = nil
	end

	super.dispose(self)
end

function ChatMainMediator:onRegister()
	super.onRegister(self)
end

function ChatMainMediator:enterWithData(data)
	if data and data.tabType then
		self._curTabType = data.tabType
	end

	self:setUpView()
	self:mapButtonHandlersClick(kBtnHandlers)
	self:bindWidget("main.unopen_channel_tip.join_btn", TwoLevelViceButton, {})
	self:glueFieldAndUi()
	self:setupChatOperatorWidget()
	self:initTabView()
	self:flyInAnim()
	self:mapEventListener(self:getEventDispatcher(), EVT_CHAT_NEW_MESSAGE, self, self.refreshNewMessage)
end

function ChatMainMediator:setUpView()
	self._tabpanel = self:getView():getChildByFullName("main.tabpanel")
	self._unChatChannelTip = self:getView():getChildByFullName("main.unChat_channel_tip")
	local str = self._curTabType == ChatTabType.kSystem and Strings:get("unchatMessage_tips_1") or Strings:get("unchatMessage_tips_2")

	self._unChatChannelTip:getChildByFullName("tip_text"):setString(str)
	self._unChatChannelTip:setVisible(true)
end

function ChatMainMediator:initTabView()
	local config = {
		onClickTab = function (name, tag)
			self:onClickTab(name, tag)
		end
	}
	local data = {}

	for i = 1, #TabName do
		data[#data + 1] = {
			tabText = Strings:get(TabName[i]),
			tabTextTranslate = Strings:get(TabNameTranslate[i])
		}
	end

	config.btnDatas = data
	local injector = self:getInjector()
	local widget = TabBtnWidget:createWidgetNode()
	self._tabBtnWidget = self:autoManageObject(injector:injectInto(TabBtnWidget:new(widget)))

	self._tabBtnWidget:adjustScrollViewSize(0, 500)
	self._tabBtnWidget:initTabBtn(config, {
		ignoreSound = true,
		noCenterBtn = true,
		ignoreRedSelectState = true
	})
	self._tabBtnWidget:selectTabByTag(self._curTabType)
	self._tabBtnWidget:removeTabBg()

	local view = self._tabBtnWidget:getMainView()

	view:addTo(self._tabpanel):posite(0, 0)
	view:setLocalZOrder(1100)
end

function ChatMainMediator:glueFieldAndUi()
	self._systemKeeper = self:getInjector():getInstance("SystemKeeper")
	self._main = self:getView():getChildByFullName("main")
	self._main.originPos = cc.p(self._main:getPosition())
	self._listView = self._main:getChildByFullName("chatTable.list_view")

	self._listView:setScrollBarEnabled(false)

	self._fadeLine = self._main:getChildByFullName("chatTable.fade_line")

	self._fadeLine:setVisible(true)

	self._systemOperatorNode = self._main:getChildByFullName("system_operator_node")
	self._unopenChannelTip = self._main:getChildByFullName("unopen_channel_tip")

	self._unopenChannelTip:setVisible(false)
	self._unopenChannelTip:getChildByFullName("tip_text"):enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

	self._unreadTipBar = self._main:getChildByFullName("chatTable.unread_tip_bar")

	self._unreadTipBar:getChildByFullName("tip_text"):enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)
	self._unreadTipBar:setVisible(false)
end

function ChatMainMediator:getCurChannel()
	local channelId = TabTypeToChannelId[self._curTabType]
	local channel = self:getChat():getChannel(channelId)

	return channel
end

function ChatMainMediator:setupChatOperatorWidget()
	local operatorNode = self._main:getChildByFullName("operator_node")
	local chatOperatorWidget = self:getInjector():injectInto(ChatOperatorWidget:new(operatorNode))

	if chatOperatorWidget then
		local delegate = {}
		local mySelf = self

		function delegate:adaptTextFieldFunc(delta)
			mySelf._listView:offset(0, delta)
		end

		function delegate:getChannel()
			return mySelf:getCurChannel()
		end

		function delegate:refreshMyMessage()
			if checkDependInstance(mySelf) then
				mySelf:refreshNewMessage()
			end
		end

		local originPos = self._main.originPos

		function delegate.onShow(sender, event)
			local duration = math.max(0, event.duration)
			local ended = event.ended
			local delta = ended.height - chatOperatorWidget:getView():getPositionY()

			if delta > 0 then
				local destPos = cc.p(originPos.x, originPos.y + delta)
				local moveToAction = cc.MoveTo:create(duration, destPos)

				mySelf._main:stopAllActions()
				mySelf._main:runAction(moveToAction)
			end
		end

		function delegate.onHide(sender, event)
			local duration = math.max(0, event.duration)
			local moveToAction = cc.MoveTo:create(duration, originPos)

			mySelf._main:stopAllActions()
			mySelf._main:runAction(moveToAction)
		end

		chatOperatorWidget:enterWithData({
			delegate = delegate,
			parentMediator = self._main,
			type = KEmotionShowType.KChat
		})

		self._chatOperatorWidget = chatOperatorWidget
	end

	local tiptext = self._systemOperatorNode:getChildByFullName("tip_text")

	tiptext:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

	local selfFilterBtn = self._systemOperatorNode:getChildByFullName("selfFilter_bg.self_filter_btn")

	selfFilterBtn:setSelected(self:getChatSystem():isOnlyShowSelf())
	selfFilterBtn:addEventListener(function (sender, eventType)
		self:onClickFliterSelf(sender, eventType)
	end)

	local selftext = self._systemOperatorNode:getChildByFullName("selfFilter_bg.self_text")

	selftext:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)
end

function ChatMainMediator:setupTabController()
	local tabBtns = {}
	local myStyle = {}
	local fontStyle = {
		light = {
			cc.c4b(223, 255, 46, 255),
			cc.c4b(57, 75, 10, 255),
			2
		},
		dark = {
			cc.c4b(255, 255, 255, 255),
			cc.c4b(69, 35, 6, 255),
			2
		}
	}
	myStyle.fontStyle = fontStyle

	for i = 1, 4 do
		tabBtns[i] = self._main:getChildByFullName("Panel_tab.tab_" .. i)

		tabBtns[i]:setTag(i)

		tabBtns[i].index = i
	end

	self._tabController = TabController:new(tabBtns, function (name, tag)
		self:onClickTab(name, tag)
	end, myStyle)
end

function ChatMainMediator:clearListView()
	self._listView:removeAllItems()

	self._messageItemCount = 0

	self._listView:onScroll(function (event)
	end)

	self._newMessageCnt = 0
end

function ChatMainMediator:onClickTab(name, tag)
	self._curTabType = tag

	if self._curTabType == ChatTabType.kSystem then
		self._chatOperatorWidget:setVisible(false)
		self._systemOperatorNode:setVisible(true)
		self._unChatChannelTip:setVisible(true)
		self._unChatChannelTip:getChildByFullName("tip_text"):setString(Strings:get("unchatMessage_tips_1"))
	else
		self._chatOperatorWidget:setVisible(true)
		self._systemOperatorNode:setVisible(false)
		self._unChatChannelTip:setVisible(true)
		self._unChatChannelTip:getChildByFullName("tip_text"):setString(Strings:get("unchatMessage_tips_2"))
	end

	self:setLockScreen(false)
	self:getChatSystem():updateActiveMember()
	self:setupListView()

	local channel = self:getCurChannel()

	channel:setNewMessageCnt(0)
end

function ChatMainMediator:setupListView()
	self:clearListView()

	local channelId = TabTypeToChannelId[self._curTabType]

	if channelId == nil then
		return
	end

	if channelId == ChannelId.kUnion then
		local clubSystem = self:getInjector():getInstance("ClubSystem")

		if not clubSystem:getHasJoinClub() then
			self._unopenChannelTip:setVisible(true)

			local tipText = self._unopenChannelTip:getChildByFullName("tip_text")

			tipText:setString(Strings:get("Chat_Text2"))

			local joinBtn = self._unopenChannelTip:getChildByFullName("join_btn")

			joinBtn:setVisible(true)
			self._unChatChannelTip:setVisible(false)

			return
		end
	elseif channelId == ChannelId.kTeam then
		self._unopenChannelTip:setVisible(true)

		local tipText = self._unopenChannelTip:getChildByFullName("tip_text")

		tipText:setString(Strings:get("Chat_Text6"))

		local joinBtn = self._unopenChannelTip:getChildByFullName("join_btn")

		joinBtn:setVisible(false)
		self._unChatChannelTip:setVisible(false)

		return
	end

	self._unopenChannelTip:setVisible(false)

	local channel = self:getChat():getChannel(channelId)

	if channel == nil then
		return
	end

	local messages = channel:getMessages()
	local itemCount = math.min(10, #messages)
	local endIndex = #messages
	local startIndex = math.max(#messages - itemCount + 1, 1)
	local index = startIndex

	while index <= endIndex do
		local message = messages[index]

		self:pushMessageWidget(message, index)

		index = index + 1
	end

	self._newMessageCnt = 0

	self._listView:jumpToBottom()
	self._listView:onScroll(function (event)
		self:onListViewScroll(event)
	end)
end

function ChatMainMediator:createChatMessageView(message)
	local resFile = nil
	local messageType = message:getType()

	if messageType == MessageType.kPlayer then
		if self:getChatSystem():isMySend(message) then
			resFile = "asset/ui/ChatPlayerMessageRight.csb"
		else
			resFile = "asset/ui/ChatPlayerMessageLeft.csb"
		end
	elseif messageType == MessageType.kSystem then
		resFile = "asset/ui/SystemMessage.csb"
	end

	local view = ccui.Layout:create()
	local node = cc.CSLoader:createNode(resFile)

	node:setAnchorPoint(cc.p(0, 1))
	node:addTo(view):setName("main")

	return view
end

function ChatMainMediator:createChatMessageWidget(message)
	local messageView = self:createChatMessageView(message)
	local messageWidget = nil
	local messageType = message:getType()

	if messageType == MessageType.kPlayer then
		messageWidget = PlayerMessageWidget:new(messageView)

		self:getInjector():injectInto(messageWidget)
		messageWidget:decorateView(message, self:getChat():getSender(message:getSenderId()), self:getView())
	elseif messageType == MessageType.kSystem then
		messageWidget = SystemMessageWidget:new(messageView)

		self:getInjector():injectInto(messageWidget)
		messageWidget:decorateView(message)
	end

	return messageWidget
end

local time = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Chat_Time_Space", "content")

function ChatMainMediator:isShowTime(index)
	local channel = self:getCurChannel()

	if channel == nil then
		return
	end

	local messages = channel:getMessages()
	local message1 = messages[index - 1]

	if not message1 then
		local str = "index:" .. tostring(index) .. "curTab:" .. tostring(self._curTabType)

		CommonUtils.uploadDataToBugly("ChatDebug", str)
	end

	local message2 = messages[index]
	local time1 = message1:getTime()
	local time2 = message2:getTime()

	if (time2 - time1) * 0.001 > (time or 600) then
		return true
	end

	return false
end

function ChatMainMediator:pushTimeText(message)
	local fontPath = "asset/font/CustomFont_FZYH_R.TTF"
	local node = ccui.Widget:create()

	node:setAnchorPoint(cc.p(0.5, 0.5))

	local date = TimeUtil:localDate("%Y-%m-%d  %H:%M", message:getTime() * 0.001)
	local timeText = ccui.Text:create(date, fontPath, 16)

	timeText:setAnchorPoint(cc.p(0.5, 0))
	timeText:setTextColor(cc.c3b(147, 137, 135))
	timeText:addTo(node):posite(415, 22)
	node:setContentSize(cc.size(timeText:getContentSize().width, 50))
	self._listView:pushBackCustomItem(node)
end

function ChatMainMediator:insertTimeText(message)
	local fontPath = "asset/font/CustomFont_FZYH_R.TTF"
	local node = ccui.Widget:create()

	node:setAnchorPoint(cc.p(0.5, 0.5))

	local date = TimeUtil:localDate("%Y-%m-%d  %H:%M", message:getTime() * 0.001)
	local timeText = ccui.Text:create(date, fontPath, 16)

	timeText:setAnchorPoint(cc.p(0.5, 0))
	timeText:setTextColor(cc.c3b(147, 137, 135))
	timeText:addTo(node):posite(415, 22)
	node:setContentSize(cc.size(timeText:getContentSize().width, 50))
	self._listView:insertCustomItem(node, 0)
end

function ChatMainMediator:pushMessageWidget(message, index)
	self._unChatChannelTip:setVisible(false)

	if index == 1 then
		self:pushTimeText(message)
	elseif self:isShowTime(index) then
		self:pushTimeText(message)
	end

	local innerContainer = self._listView:getInnerContainer()
	local y = innerContainer:getPositionY()
	local messageWidget = self:createChatMessageWidget(message)
	local messageView = messageWidget:getView()

	self._listView:pushBackCustomItem(messageView)

	self._messageItemCount = self._messageItemCount + 1

	if self._lockScreen and not self:getChatSystem():isMySend(message) then
		self._newMessageCnt = self._newMessageCnt + 1
		y = y - messageView:getContentSize().height

		self._listView:doLayout()
		innerContainer:setPositionY(y)
	else
		self._listView:jumpToBottom()
	end
end

function ChatMainMediator:insertMessageWidget(message, index)
	local messageWidget = self:createChatMessageWidget(message)
	local messageView = messageWidget:getView()

	self._listView:insertCustomItem(messageView, 0)

	self._messageItemCount = self._messageItemCount + 1
	local channelId = TabTypeToChannelId[self._curTabType]
	local channel = self:getChat():getChannel(channelId)
	local messages = channel:getMessages()

	if messages[1] and message == messages[1] then
		self:insertTimeText(message)
	elseif self:isShowTime(index) then
		self:insertTimeText(message)
	end
end

function ChatMainMediator:refreshNewMessage(event)
	local channel = self:getCurChannel()

	if channel == nil then
		return
	end

	local newMessageCnt = channel:getNewMessageCnt()

	if newMessageCnt == 0 then
		return
	end

	local oldMessages = channel:getMessages()
	local count = #oldMessages
	local messages = channel:getNewMessages()

	for index, message in ipairs(messages) do
		self:pushMessageWidget(message, count - newMessageCnt + index)
	end

	channel:setNewMessageCnt(0)
	self:refreshListViewCellVisible()
end

function ChatMainMediator:refreshUnreadTipView()
	if self._lockScreen and self._newMessageCnt > 0 then
		self._unreadTipBar:setVisible(true)

		local tipText = self._unreadTipBar:getChildByFullName("tip_text")
		local count = self._newMessageCnt > 99 and "99+" or self._newMessageCnt

		tipText:setString(Strings:get("Chat_Text9", {
			newMessageCnt = count
		}))
	else
		self._unreadTipBar:setVisible(false)
	end
end

function ChatMainMediator:setLockScreen(isLock)
	self._lockScreen = isLock

	if not isLock then
		self._listView:jumpToBottom()
	end

	self._newMessageCnt = isLock == false and 0 or self._newMessageCnt

	self:refreshUnreadTipView()
end

function ChatMainMediator:flyInAnim()
	local rowPos = self._main.originPos

	self._main:setPosition(cc.p(rowPos.x - 700, rowPos.y))
	self._main:runAction(cc.MoveTo:create(0.1, cc.p(rowPos.x, rowPos.y)))
end

function ChatMainMediator:flyOutAnim()
	local rowPos = self._main.originPos

	self._main:runAction(cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(rowPos.x - 700, rowPos.y)), cc.CallFunc:create(function ()
		self:close()
	end)))
end

function ChatMainMediator:onClickFliterSelf(sender, eventType)
	local channelId = TabTypeToChannelId[self._curTabType]
	local channel = self:getChat():getChannel(channelId)

	if channel == nil then
		return
	end

	if channel:getType() ~= ChannelType.kFilter then
		return
	end

	if eventType == ccui.CheckBoxEventType.selected then
		channel:modifyFilterRule(ChannelId.kSystem, false)
		self:getChatSystem():setIsOnlyShowSelf(true)
	elseif eventType == ccui.CheckBoxEventType.unselected then
		channel:modifyFilterRule(ChannelId.kSystem, true)
		self:getChatSystem():setIsOnlyShowSelf(false)
	end

	self:setupListView()
end

function ChatMainMediator:onClickBack(sender, eventType)
	if not self._chatOperatorWidget:isIMEOpen() then
		self:flyOutAnim()
	end
end

function ChatMainMediator:onTouchMaskLayer()
	self:onClickBack()
end

function ChatMainMediator:onClickJoinUnion(sender, eventType)
	local unlock, tips = self._systemKeeper:isUnlock("Club_System")

	if unlock then
		local clubSystem = self:getInjector():getInstance(ClubSystem)

		clubSystem:requestClubInfo(function ()
			local view = self:getInjector():getInstance("ClubView")

			self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil))
			self:close()
		end)
	else
		self:dispatch(ShowTipEvent({
			tip = tips
		}))
	end
end

function ChatMainMediator:onClickUnreadTip(sender, eventType)
	self:setLockScreen(false)
end

local loadMessageLock = false

function ChatMainMediator:onListViewScroll(sender, eventType)
	local innerContainer = self._listView:getInnerContainer()
	local innerContentSize = innerContainer:getContentSize()
	local contentSize = self._listView:getContentSize()
	local innerContainerPos = cc.p(innerContainer:getPosition())

	if innerContainerPos.y < -0.001 then
		self:setLockScreen(true)
	else
		self:setLockScreen(false)
	end

	if not loadMessageLock and innerContentSize.height <= contentSize.height + math.abs(innerContainerPos.y) then
		local channelId = TabTypeToChannelId[self._curTabType]

		if channelId == nil then
			return
		end

		local channel = self:getChat():getChannel(channelId)

		if channel == nil then
			return
		end

		loadMessageLock = true
		local messages = channel:getMessages()
		local loadCount = 1
		local endIndex = #messages - self._messageItemCount

		if endIndex > 0 then
			local startIndex = math.max(endIndex - loadCount + 1, 1)

			for k = startIndex, endIndex do
				local message = messages[k]

				self:insertMessageWidget(message, k)
			end

			self._listView:doLayout()
			innerContainer:setPosition(innerContainerPos)
		end

		loadMessageLock = false
	end

	self:refreshListViewCellVisible()
end

function ChatMainMediator:refreshListViewCellVisible()
end
