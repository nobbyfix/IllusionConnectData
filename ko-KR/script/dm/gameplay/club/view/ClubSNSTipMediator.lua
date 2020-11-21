ClubSNSTipMediator = class("ClubSNSTipMediator", DmPopupViewMediator, _M)

ClubSNSTipMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ClubSNSTipMediator:has("_clubSystem", {
	is = "r"
}):injectWith("ClubSystem")
ClubSNSTipMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")

LocalSNSInfo = {
	state = 0,
	key = "",
	url = ""
}
local kBtnHandlers = {
	["main.btnOK"] = {
		clickAudio = "Se_Click_Confirm",
		func = "onClickCreate"
	},
	["main.keyNode.btnCopy"] = {
		clickAudio = "Se_Click_Confirm",
		func = "onClickCopy"
	},
	["main.button_rule"] = {
		clickAudio = "Se_Click_Confirm",
		func = "onClickRule"
	}
}

function ClubSNSTipMediator:initialize()
	super.initialize(self)
end

function ClubSNSTipMediator:dispose()
	super.dispose(self)
end

function ClubSNSTipMediator:userInject()
end

function ClubSNSTipMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	local injector = self:getInjector()
	local bgNode = self:getView():getChildByFullName("main.bg")
	local widget = self:bindWidget(bgNode, PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onCloseClicked, self)
		}
	})
end

function ClubSNSTipMediator:closeView(event)
	self:close()
end

function ClubSNSTipMediator:enterWithData()
	self:initUI()
end

function ClubSNSTipMediator:initUI()
	local btnName = self:getView():getChildByFullName("main.btnOK.labelName")

	btnName:setFontSize(28)

	self._clubPosition = self._clubSystem:getClubInfoOj():getPosition()

	if self._clubPosition == ClubPosition.kProprieter then
		btnName:setString(Strings:get("Common_button1"))
	else
		btnName:setString(Strings:get("ChatRoom_Join_Text"))
		btnName:setFontSize(22)
	end

	self:createTextFiled()
end

function ClubSNSTipMediator:createTextFiled()
	self._urlEditBox = self:getView():getChildByFullName("main.urlNode.editBox.textfiled")
	self._keyEditBox = self:getView():getChildByFullName("main.keyNode.editBox.textfiled")

	self._urlEditBox:setVisible(false)
	self._keyEditBox:setVisible(false)

	local labelUrl = self:getView():getChildByFullName("main.urlNode.editBox.labelUrl")
	local labelKey = self:getView():getChildByFullName("main.keyNode.editBox.labelKey")

	labelUrl:setVisible(false)
	labelKey:setVisible(false)

	local btnCopy = self:getView():getChildByFullName("main.keyNode.btnCopy")
	self._tips = self:getView():getChildByFullName("main.labelTip")

	self._tips:setOpacity(0)

	local snsInfo = self._clubSystem:getClubInfoOj():getSnsInfo() or {
		key = "",
		url = ""
	}

	if snsInfo then
		if snsInfo.url ~= "" and snsInfo.url ~= nil then
			self._strUrl = snsInfo.url
			LocalSNSInfo.state = 1
		else
			self._strUrl = LocalSNSInfo.url
		end

		if snsInfo.key ~= "" and snsInfo.key ~= nil then
			self._strKey = snsInfo.key
			LocalSNSInfo.state = 1
		else
			self._strKey = LocalSNSInfo.key
		end
	end

	local strUrlTip, strKeyTip = nil

	if self._clubPosition == ClubPosition.kProprieter then
		strUrlTip = Strings:get("ChatRoom_Number_InputTips")
		strKeyTip = Strings:get("ChatRoom_Password_InputTips")
		bClick = true

		btnCopy:setEnabled(false)
		btnCopy:setOpacity(0)

		if LocalSNSInfo.state == 0 then
			self._tips:setOpacity(255)
		end

		self._urlEditBox:setVisible(true)
		self._keyEditBox:setVisible(true)

		local maxLen = 150

		if self._urlEditBox:getDescription() == "TextField" then
			self._urlEditBox:setPlaceHolder(strUrlTip)
			self._urlEditBox:setMaxLength(maxLen)
			self._urlEditBox:setMaxLengthEnabled(true)
			self._urlEditBox:setString(self._strUrl)
		end

		self._urlEditBox = convertTextFieldToEditBox(self._urlEditBox, nil, )

		self._urlEditBox:onEvent(function (eventName, sender)
			if eventName == "began" then
				-- Nothing
			elseif eventName == "ended" then
				if not self:checkUrl(self._strUrl) and self._strUrl ~= "" then
					self._urlEditBox:setText("")
					self:dispatch(ShowTipEvent({
						tip = Strings:get("ChatRoom_Url_Error")
					}))

					return
				end

				if LocalSNSInfo.url ~= self._strUrl then
					LocalSNSInfo.url = self._strUrl

					self._tips:setOpacity(255)
				end
			elseif eventName == "return" then
				-- Nothing
			elseif eventName == "changed" then
				self._strUrl = self._urlEditBox:getText()
			elseif eventName == "ForbiddenWord" then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Common_Tip1")
				}))
			elseif eventName == "Exceed" then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Tips_WordNumber_Limit", {
						number = sender:getMaxLength()
					})
				}))
			end
		end)

		if self._keyEditBox:getDescription() == "TextField" then
			self._keyEditBox:setPlaceHolder(strKeyTip)
			self._keyEditBox:setMaxLength(10)
			self._keyEditBox:setMaxLengthEnabled(true)
			self._keyEditBox:setString(self._strKey)
		end

		self._keyEditBox = convertTextFieldToEditBox(self._keyEditBox, nil, )

		self._keyEditBox:onEvent(function (eventName, sender)
			if eventName == "began" then
				-- Nothing
			elseif eventName == "ended" then
				if not self:checkLetterAndNum(self._strKey) and self._strKey ~= "" then
					self._keyEditBox:setText("")
					self:dispatch(ShowTipEvent({
						tip = Strings:get("ChatRoom_Key_Error")
					}))

					return
				end

				if LocalSNSInfo.key ~= self._strKey then
					LocalSNSInfo.key = self._strKey

					self._tips:setOpacity(255)
				end
			elseif eventName == "return" then
				-- Nothing
			elseif eventName == "changed" then
				self._strKey = self._keyEditBox:getText()
			elseif eventName == "ForbiddenWord" then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Common_Tip1")
				}))
				self._keyEditBox:setText("")
			elseif eventName == "Exceed" then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("Tips_WordNumber_Limit", {
						number = sender:getMaxLength()
					})
				}))
			end
		end)
	else
		self._urlEditBox:setEnabled(false)
		self._urlEditBox:setTouchEnabled(false)
		self._keyEditBox:setEnabled(false)
		self._keyEditBox:setTouchEnabled(false)
		labelUrl:setVisible(true)
		labelKey:setVisible(true)

		local _tmpUrl = self._strUrl

		if string.len(_tmpUrl) > 22 then
			_tmpUrl = string.sub(_tmpUrl, 0, 22) .. "......"
		end

		labelUrl:setString(_tmpUrl)
		labelKey:setString(self._strKey)

		strUrlTip = Strings:get("ChatRoom_Number_Tips")
		strKeyTip = Strings:get("ChatRoom_Password_Tips")

		btnCopy:setEnabled(true)
		btnCopy:setOpacity(255)
	end
end

function ClubSNSTipMediator:onClickCreate(sender, eventType)
	if self._strUrl == "" then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("ChatRoom_Url_Error")
		}))

		return
	end

	if self._strKey == "" then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("ChatRoom_Key_Error")
		}))

		return
	end

	if self._clubPosition == ClubPosition.kProprieter then
		self._clubSystem:setClubSnsInfo(self._strUrl, self._strKey, function ()
			LocalSNSInfo.state = 1

			self:dispatch(ShowTipEvent({
				tip = Strings:get("ChatRoom_Save_SnsInfo")
			}))
			self:close()
		end)
	else
		cc.Application:getInstance():openURL(self._strUrl)
	end
end

function ClubSNSTipMediator:onCloseClicked(sender, eventType)
	self:close()
end

function ClubSNSTipMediator:onClickCopy(sender, eventType)
	if app.getDevice and app.getDevice() then
		app.getDevice():copyStringToClipboard(self._strKey)
		self:dispatch(ShowTipEvent({
			tip = Strings:get("ChatRoom_Copy_Success")
		}))
	end
end

function ClubSNSTipMediator:onClickRule(sender, eventType)
	local Rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Club_SNS_Rule", "content")
	local view = self:getInjector():getInstance("ExplorePointRule")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		rule = Rule
	}))
end

function ClubSNSTipMediator:checkUrl(str)
	if str == "" or not str then
		return false
	end

	local strTemp = string.match(str, "^[http|https]+://+[%w%p]+$")

	if strTemp == nil then
		return false
	end

	return strTemp == str
end

function ClubSNSTipMediator:checkLetterAndNum(str)
	if str == "" or not str then
		return false
	end

	local strTemp = string.match(str, "^[A-Za-z0-9]+$")

	if strTemp == nil then
		return false
	end

	return strTemp == str
end
