ChatOperatorWidget = class("ChatOperatorWidget", BaseWidget, _M)

ChatOperatorWidget:has("_eventDispatcher", {
	is = "r"
}):injectWith("legs_sharedEventDispatcher")
ChatOperatorWidget:has("_chatSystem", {
	is = "r"
}):injectWith("ChatSystem")
ChatOperatorWidget:has("_content", {
	is = "r"
})

InputMode = {
	kText = 1,
	kVoice = 2
}
local maxLength = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Chat_Word_Limit", "content")
local tipTextMap = {
	[ChannelId.kUnion] = "Chat_Text7",
	[ChannelId.kTeam] = "Chat_Text6"
}
local unlockIdMap = {
	[ChannelId.kUnion] = "Club_Chat",
	[ChannelId.kTeam] = "Team_Chat",
	[ChannelId.kWorld] = "World_Chat"
}

function ChatOperatorWidget:initialize(view)
	super.initialize(self, view)

	self._inputMode = InputMode.kText
	self._isIMEOpen = false
	self._enableText = ""
	self._chatCDTime = 0
end

function ChatOperatorWidget:dispose()
	if self._chatColdTimer then
		self._chatColdTimer:stop()

		self._chatColdTimer = nil
	end

	super.dispose(self)
end

function ChatOperatorWidget:bindWidgets()
	mapButtonHandlerClick(self, "main_panel.btn_emoji", {
		clickAudio = "Se_Click_Common_1",
		func = "onClickEmoji"
	})
	mapButtonHandlerClick(self, "main_panel.btn_recording", {
		clickAudio = "Se_Click_Common_1",
		func = "onClickRecording"
	})
	bindWidget(self, "main_panel.btn_send", OneLevelViceButton, {
		handler = {
			ignoreClickAudio = true,
			func = bind1(self.onClickSend, self)
		}
	})
end

function ChatOperatorWidget:enterWithData(data)
	if data and data.delegate then
		self._delegate = data.delegate
	end

	if data and data.parentMediator then
		self._parentMediator = data.parentMediator
	end

	self._enterType = data.type or KEmotionShowType.KChat

	self:bindWidgets()

	local view = self:getView()
	self._voiceOrTextBtn = view:getChildByFullName("main_panel.btn_voice_or_text")

	self._voiceOrTextBtn:addEventListener(function (sender, eventType)
		self:onChangeInputMode(sender, eventType)
	end)
	self._voiceOrTextBtn:setSelected(false)

	self._bg = view:getChildByFullName("main_panel.input_bg")
	self._inputBg = view:getChildByFullName("main_panel.input_bg")
	self._btnSendName = view:getChildByFullName("main_panel.btn_send.name")
	self._editBox = view:getChildByFullName("main_panel.text_field")

	if self._editBox:getDescription() == "TextField" then
		self._editBox:setMaxLengthEnabled(true)
		self._editBox:setMaxLength(maxLength)
		self._editBox:setPlaceHolder(Strings:get("ChatOperator_TextFiled_Text"))
	end

	self._editBox = convertTextFieldToEditBox(self._editBox, nil, MaskWordType.CHAT)

	self._editBox:setPlaceholderFontColor(cc.c4b(255, 255, 255, 255))

	local contentLabel = self._editBox:getContentLabel()
	local placeHolderLabel = self._editBox:getPlaceholderLabel()

	contentLabel:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)
	placeHolderLabel:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

	self._editBox.initSize = self._editBox:getContentSize()
	self._editBox.orginSize = self._editBox:getContentSize()

	self._editBox:onEvent(function (eventName, sender)
		if eventName == "began" then
			self._editBox:setContentSize(self._editBox.initSize)

			self._enableText = ""
		elseif eventName == "ended" then
			self._content = self._editBox:getText()
			local contentLabel = self._editBox:getContentLabel()

			contentLabel:setLineHeight(50)
			contentLabel:setAnchorPoint(cc.p(0, 0))
			contentLabel:setPosition(cc.p(0, 0))

			local placeholderLabel = self._editBox:getPlaceholderLabel()

			placeholderLabel:setAnchorPoint(cc.p(0, 0))
			placeholderLabel:setPosition(cc.p(0, 0))
		elseif eventName == "return" then
			-- Nothing
		elseif eventName == "changed" then
			if self._editBox:getMaxLength() <= utf8.len(self._editBox:getText()) then
				local contentLabel = self._editBox:getContentLabel()

				contentLabel:setPosition(cc.p(-1000, -1000))

				local placeholderLabel = self._editBox:getPlaceholderLabel()

				placeholderLabel:setPosition(cc.p(-1000, -1000))
				self:getEventDispatcher():dispatchEvent(ShowTipEvent({
					tip = Strings:get("Tips_WordNumber_Limit", {
						number = sender:getMaxLength()
					})
				}))
			end
		elseif eventName == "ForbiddenWord" then
			self:getEventDispatcher():dispatchEvent(ShowTipEvent({
				tip = Strings:get("Common_Tip1")
			}))
		elseif eventName == "Exceed" then
			self:getEventDispatcher():dispatchEvent(ShowTipEvent({
				tip = Strings:get("Tips_WordNumber_Limit", {
					number = sender:getMaxLength()
				})
			}))
		end
	end)
	self:changeInputMode(InputMode.kText)

	local channel = self._delegate:getChannel()

	if channel then
		local systemKeeper = self:getInjector():getInstance(SystemKeeper)
		local unlockId = unlockIdMap[channel:getId()]
		unlockId = unlockId or "World_Chat"
		local unlock, tips = systemKeeper:isUnlock(unlockId)
		local btnSend = view:getChildByFullName("main_panel.btn_send.button")
		local btnImg = unlock and "common_btn_l01.png" or "common_btn_l02.png"

		btnSend:loadTextureNormal(btnImg, ccui.TextureResType.plistType)
		btnSend:loadTexturePressed(btnImg, ccui.TextureResType.plistType)

		local config = ConfigReader:getRecordById("UnlockSystem", unlockId)

		if config then
			local unLockLevel = config.Condition.LEVEL and config.Condition.LEVEL or 0

			if unlock then
				self._btnSendName:setString(Strings:get("Friend_UI10"))
			else
				self._btnSendName:setString(Strings:get("LEVEL_UNLOCK_TIP", {
					LEVEL = unLockLevel
				}))
			end
		end
	end
end

function ChatOperatorWidget:changeInputMode(inputMode)
	self._inputMode = inputMode

	self._inputBg:setVisible(inputMode == InputMode.kText)
	self._editBox:setVisible(inputMode == InputMode.kText)

	local recordingBtn = self:getView():getChildByFullName("main_panel.btn_recording")

	recordingBtn:setVisible(inputMode == InputMode.kVoice)
end

function ChatOperatorWidget:onChangeInputMode(sender, eventType)
	if eventType == ccui.CheckBoxEventType.unselected then
		self:changeInputMode(InputMode.kText)
	elseif eventType == ccui.CheckBoxEventType.selected then
		self:changeInputMode(InputMode.kVoice)
	end
end

function ChatOperatorWidget:onClickSend(sender, eventType)
	local channel = self._delegate:getChannel()

	if channel == nil then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:getEventDispatcher():dispatchEvent(ShowTipEvent({
			tip = Strings:get("Chat_Text8")
		}))

		return
	end

	local systemKeeper = self:getInjector():getInstance(SystemKeeper)
	local unlockId = unlockIdMap[channel:getId()]
	unlockId = unlockId or "World_Chat"
	local unlock, tips = systemKeeper:isUnlock(unlockId)

	if unlock then
		local roomType, roomId = channel:getRoomTypeAndId(self:getInjector())

		if roomType == nil or roomId == nil then
			AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
			self:getEventDispatcher():dispatchEvent(ShowTipEvent({
				tip = Strings:get(tipTextMap[channel:getId()])
			}))

			return
		end

		if not sender.emotionId and (self._content == nil or self._content == "") then
			AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
			self:getEventDispatcher():dispatchEvent(ShowTipEvent({
				tip = Strings:get("Chat_Text5")
			}))

			return
		end

		if self._chatColdTimer then
			AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
			self:getEventDispatcher():dispatchEvent(ShowTipEvent({
				tip = Strings:get("Chat_Tip1")
			}))

			return
		else
			AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)

			local coldTime = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Chat_Send_CD", "content")
			self._chatCDTime = coldTime

			self._btnSendName:setString(string.format(Strings:get("Friend_UI10_CD"), tostring(self._chatCDTime)))

			self._chatColdTimer = LuaScheduler:getInstance():schedule(function ()
				self._chatCDTime = self._chatCDTime - 1

				if self._chatCDTime <= 0 then
					self._chatColdTimer:stop()

					self._chatColdTimer = nil

					self._btnSendName:setString(Strings:get("Friend_UI10"))
				else
					self._btnSendName:setString(string.format(Strings:get("Friend_UI10_CD"), tostring(self._chatCDTime)))
				end
			end, 1, false)
		end

		local developSystem = self:getInjector():getInstance("DevelopSystem")
		local messageData = {}
		local channelId = channel:getId()
		messageData.channelIds = {
			channelId
		}
		messageData.content = self._content
		messageData.time = self:getInjector():getInstance("GameServerAgent"):remoteTimeMillis()
		messageData.sender = developSystem:getPlayer():getRid()
		messageData.type = MessageType.kPlayer

		if sender.emotionId then
			messageData.content = nil
			messageData.emotionId = sender.emotionId
		end

		local chatSystem = self:getChatSystem()

		chatSystem:requestSendMessage(roomType, roomId, messageData, function (data)
			if data.status == -1 then
				self:getEventDispatcher():dispatchEvent(ShowTipEvent({
					tip = Strings:get("TalkLimit_Tips")
				}))

				return
			end

			chatSystem:updateActiveMember()

			local chat = chatSystem:getChat()
			local message = chat:syncMessage(messageData)

			if not message then
				return
			end

			message:sync(data)
			self._delegate:refreshMyMessage()
			self:getEventDispatcher():dispatchEvent(Event:new(EVT_CHAT_NEW_MESSAGE, {
				message = message
			}))
		end)
	else
		self:getEventDispatcher():dispatchEvent(ShowTipEvent({
			tip = tips
		}))
	end

	self._editBox.orginSize = self._editBox.initSize

	self._editBox:setText("")

	self._content = ""
end

function ChatOperatorWidget:resetEditBoxText()
	self._editBox:setText("")
end

function ChatOperatorWidget:onClickEmoji(sender, eventType)
	if not self._chatSystem.getEmotionData or not self._chatSystem:getEmotionData() then
		self:getEventDispatcher():dispatchEvent(ShowTipEvent({
			tip = Strings:get("Item_PleaseWait")
		}))

		return
	end

	local widget = EmotionTipWidget:createWidgetNode()
	self._emotionTipWidget = self:autoManageObject(self:getInjector():injectInto(EmotionTipWidget:new(widget)))
	local view = self._emotionTipWidget:getView()

	view:setAnchorPoint(cc.p(0, 0))
	view:addTo(self._parentMediator):center(self._parentMediator:getContentSize())

	local function callFunc(data)
		self:onClickSend({
			emotionId = data.Id
		})
	end

	self._emotionTipWidget:enterWithData({
		data = self._chatSystem:getEmotionList(),
		sender = sender,
		callFunc = callFunc,
		type = self._enterType
	})
end

function ChatOperatorWidget:onClickRecording(sender, eventType)
	self:getEventDispatcher():dispatchEvent(ShowTipEvent({
		tip = Strings:get("Item_PleaseWait")
	}))
end

function ChatOperatorWidget:setAdaptTextFieldFunc(func)
	self._adaptTextFieldFunc = func
end

function ChatOperatorWidget:adaptTextFieldContent(detla)
	if detla and detla ~= 0 then
		local inputBgSize = self._inputBg:getContentSize()
		local bgSize = self._bg:getContentSize()

		self._inputBg:setContentSize(cc.size(inputBgSize.width, inputBgSize.height + detla))
		self._bg:setContentSize(cc.size(bgSize.width, bgSize.height + detla))

		if self._delegate and self._delegate.adaptTextFieldFunc then
			self._delegate.adaptTextFieldFunc(detla)
		end

		self._editBox.orginSize = self._editBox:getContentSize()
	end
end

function ChatOperatorWidget:isIMEOpen()
	return self._isIMEOpen
end
