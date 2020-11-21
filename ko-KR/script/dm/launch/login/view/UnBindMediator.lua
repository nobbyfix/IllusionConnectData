UnBindMediator = class("UnBindMediator", DmPopupViewMediator, _M)

UnBindMediator:has("_loginSystem", {
	is = "r"
}):injectWith("LoginSystem")

local kBtnHandlers = {}

function UnBindMediator:initialize()
	super.initialize(self)
end

function UnBindMediator:dispose()
	self:stopTimer()
	super.dispose(self)
end

function UnBindMediator:onRemove()
	super.onRemove(self)
end

function UnBindMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._main = self:getView():getChildByName("main")
	self._bindTipsView = self._main:getChildByFullName("bindTips")
	self._bindCancelBtn = self:bindWidget("main.bindTips.btn_cancel", OneLevelMainButton, {
		handler = {
			clickAudio = "Se_Click_Cancle",
			func = bind1(self.onCloseBindTips, self)
		}
	})
	self._bindSureBtn = self:bindWidget("main.bindTips.btn_ok", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Confirm",
			func = bind1(self.onBindOKClicked, self)
		}
	})
end

function UnBindMediator:userInject()
end

function UnBindMediator:enterWithData()
	local offTime, curTiem = SDKHelper:getOffTime()
	self._leaveTime = offTime - curTiem

	self:setUi()
end

function UnBindMediator:setUi()
	local data = {
		cancelBtn = {}
	}
	data.cancelBtn.text = Strings:get("UnBind_Cancel")
	data.cancelBtn.text1 = Strings:get("UnBind_Cancel_En")
	data.sureBtn = {
		text = Strings:get("UnBind_OK"),
		text1 = Strings:get("UnBind_OK_En")
	}
	data.title = Strings:get("UnBind_Dealing")
	data.content = Strings:get("UnBind_Sure")
	local bgNode = self._bindTipsView:getChildByFullName("bg")
	local tempNode = bindWidget(self, bgNode, PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onCloseBindTips, self)
		},
		title = Strings:get("GUEST_ACCOUNT_PAY_WARNING_Title"),
		title1 = Strings:get("GUEST_ACCOUNT_PAY_WARNING_Title1") or ""
	})

	tempNode:getView():getChildByFullName("btn_close"):setVisible(not data.noClose)

	local title = self._bindTipsView:getChildByName("Text_title")
	local desc = self._bindTipsView:getChildByName("Text_desc1")
	local desc2 = self._bindTipsView:getChildByName("Text_desc2")
	local bgImage = self._bindTipsView:getChildByName("Image_2")

	title:setString(data.title or "")
	desc:setString(data.content or "")
	desc:getVirtualRenderer():setLineHeight(35)

	if self._leaveTime > 0 then
		desc2:setString(Strings:get("UnBind_Leave_Time", {
			time = self:formatTimeStr(self._leaveTime)
		}))
		self:startTimer()
	end

	self._bindCancelBtn:setVisible(false)
	self._bindSureBtn:setVisible(false)

	local btnShowCount = 0

	if data.cancelBtn then
		if data.cancelBtn.text then
			if data.cancelBtn.text1 then
				self._bindCancelBtn:setButtonName(data.cancelBtn.text, data.cancelBtn.text1)
			else
				self._bindCancelBtn:setButtonName(data.cancelBtn.text)
			end
		end

		self._bindCancelBtn:setVisible(true)

		btnShowCount = btnShowCount + 1
	end

	if data.sureBtn then
		if data.sureBtn.text then
			if data.sureBtn.text1 then
				self._bindSureBtn:setButtonName(data.sureBtn.text, data.sureBtn.text1)
			else
				self._bindSureBtn:setButtonName(data.sureBtn.text)
			end
		end

		self._bindSureBtn:setVisible(true)

		btnShowCount = btnShowCount + 1
	end

	self._bindTipsView:setVisible(true)
end

function UnBindMediator:formatTimeStr(leaveTime)
	local formatStr = Strings:get("UnBind_Time_Format")
	local timeStr = TimeUtil:formatTime(formatStr, leaveTime)

	return timeStr
end

function UnBindMediator:startTimer()
	self:stopTimer()

	local desc = self._bindTipsView:getChildByName("Text_desc2")

	local function checkTimeFunc()
		self._leaveTime = self._leaveTime - 1

		if self._leaveTime > 0 then
			desc:setString(Strings:get("UnBind_Leave_Time", {
				time = self:formatTimeStr(self._leaveTime)
			}))
		else
			self:stopTimer()
			self:close()
		end
	end

	self._timer = LuaScheduler:getInstance():schedule(checkTimeFunc, 1, false)
end

function UnBindMediator:stopTimer()
	if self._timer then
		self._timer:stop()

		self._timer = nil
	end
end

function UnBindMediator:onTouchMaskLayer()
	self:onLogOut()
	self:close()
end

function UnBindMediator:onCloseBindTips()
	self:onLogOut()
	self:close()
end

function UnBindMediator:onBindOKClicked()
	self._loginSystem:requestCancleUnBindAccount(SDKHelper:getOffAccountId(), function (status, response)
		local cjson = require("cjson.safe")
		local resData = cjson.decode(response)

		SDKHelper:setOffTimeData(resData.data.logOffData, 0)
		self:close()
	end)
end

function UnBindMediator:onLogOut()
	dmAudio.releaseAllAcbs()
	dmAudio.stopAll(AudioType.Music)

	if SDKHelper and SDKHelper:isEnableSdk() then
		self._loginSystem:saveGamePoliceAgreeSta(false)
		SDKHelper:logOut()
	end

	REBOOT("REBOOT_NOUPDATE")
end
