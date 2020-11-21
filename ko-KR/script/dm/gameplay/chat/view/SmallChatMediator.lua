SmallChatMediator = class("SmallChatMediator", DmPopupViewMediator, _M)

SmallChatMediator:has("_chatSystem", {
	is = "r"
}):injectWith("ChatSystem")

function SmallChatMediator:initialize()
	super.initialize(self)

	self._runningNewMsg = {}
	self._suspendedNewMsg = {}
	self._tag = 0
end

function SmallChatMediator:dispose()
	self._shareMessageWidget:dispose()
	super.dispose(self)
end

function SmallChatMediator:onRegister()
	super.onRegister(self)

	self.channelListeners = {}
	local messageView = SimpleMessageWidget:createWidgetNode()
	local messageWidget = SimpleMessageWidget:new(messageView)
	self._shareMessageWidget = messageWidget
	self.pl_main = self:getView():getChildByFullName("chatPanel.text_panel")

	self._shareMessageWidget:getView():addTo(self.pl_main)
	self:mapEventListener(self:getEventDispatcher(), EVT_CHAT_NEW_MESSAGE, self, self.receiveNewMessage)
end

function SmallChatMediator:initWidget()
	self.btn_chat = self:getView():getChildByFullName("btn_chat")

	self.btn_chat:addClickEventListener(function ()
		self:openMessageBox()
	end)
end

function SmallChatMediator:enterWithData(data)
	self:initWidget()
end

function SmallChatMediator:openMessageBox()
	AudioEngine:getInstance():playEffect("Se_Click_Fold_1", false)

	local data = nil
	local view = self:getInjector():getInstance("chatMainView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, data))
end

function SmallChatMediator:refreshAll()
end

function SmallChatMediator:receiveNewMessage(event)
	local message = event:getData().message

	if message and not message:isPrivateMessage() then
		local msgTab = self:getRunningNewMsgTab()
		msgTab[#msgTab + 1] = message

		if not self._isRunning then
			self:startShowNewMessage()
		end
	end
end

function SmallChatMediator:getRunningNewMsgTab()
	if self._tag == 0 then
		return self._runningNewMsg, self._tag
	else
		return self._suspendedNewMsg, self._tag
	end
end

function SmallChatMediator:swapNewMsgTab()
	if self._tag == 0 then
		self._tag = 1
	else
		self._tag = 0
	end
end

local scrollTime = 0.3
local messageShowTime = 1

function SmallChatMediator:startShowNewMessage()
	self._isRunning = true
	local msgTab, tag = self:getRunningNewMsgTab()

	self:swapNewMsgTab()

	local contentLayoutSize = self.pl_main:getContentSize()
	local messageView = self._shareMessageWidget:getView()

	messageView:stopAllActions()

	local index = 1
	local actions = {}
	local startFunc = cc.CallFunc:create(function ()
		local message = msgTab[index]

		if message then
			local sender = nil

			if message:getType() == MessageType.kPlayer then
				sender = self._chatSystem:getChat():getSender(message:getSenderId())
			end

			self._shareMessageWidget:decorateView(message, sender)

			local viewSize = messageView:getContentSize()

			messageView:setPosition(cc.p(0, -(viewSize.height / 2)))

			index = index + 1
		end
	end)
	actions[#actions + 1] = startFunc
	local moveInAct = cc.MoveTo:create(scrollTime, cc.p(0, contentLayoutSize.height - 5))
	actions[#actions + 1] = moveInAct
	local delayTimeAct = cc.DelayTime:create(messageShowTime)
	actions[#actions + 1] = delayTimeAct
	local repeatAct = cc.Repeat:create(cc.Sequence:create(unpack(actions)), #msgTab)

	messageView:runAction(repeatAct)

	if tag == 0 then
		self._runningNewMsg = {}
	else
		self._suspendedNewMsg = {}
	end

	self._isRunning = false
end
