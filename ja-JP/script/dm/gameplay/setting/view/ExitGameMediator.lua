ExitGameMediator = class("ExitGameMediator", DmPopupViewMediator, _M)
local btnHandlers = {
	["main.btn_ok.button"] = {
		clickAudio = "Se_Click_Confirm",
		func = "onClickExitGame"
	},
	["main.btn_cancel.button"] = {
		clickAudio = "Se_Click_Cancle",
		func = "onClickClose"
	}
}

function ExitGameMediator:initialize()
	super.initialize(self)
end

function ExitGameMediator:dispose()
	super.dispose(self)
end

function ExitGameMediator:onRegister()
	super:onRegister(self)
	self:mapButtonHandlersClick(btnHandlers)
	self:bindWidget("main.bg", PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickClose, self)
		},
		title = Strings:get("Setting_Text8"),
		title1 = Strings:get("UITitle_EN_Qiehuanzhanghao"),
		bgSize = {
			width = 690,
			height = 408
		}
	})
	self:bindWidget("main.btn_ok", OneLevelViceButton, {})
	self:bindWidget("main.btn_cancel", OneLevelMainButton, {})
end

function ExitGameMediator:onRemove()
	super.onRemove(self)
end

function ExitGameMediator:onClickClose(sender, eventType)
	self:close()
end

function ExitGameMediator:onClickExitGame(sender, eventType)
	dmAudio.releaseAllAcbs()
	dmAudio.stopAll(AudioType.Music)

	if SDKHelper and SDKHelper:isEnableSdk() then
		SDKHelper:logOut()

		local developSystem = self:getInjector():getInstance(DevelopSystem)
		local player = developSystem:getPlayer()

		SDKHelper:reportLogout({
			roleName = tostring(player:getNickName()),
			roleId = tostring(player:getRid()),
			roleLevel = tostring(player:getLevel()),
			roleCombat = checkint(player:getCombat()),
			ip = tostring(developSystem:getServerIp()),
			port = tostring(developSystem:getServerPort())
		})
	end

	REBOOT("REBOOT_NOUPDATE")
end
