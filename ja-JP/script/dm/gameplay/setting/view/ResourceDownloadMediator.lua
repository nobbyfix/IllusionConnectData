ResourceDownloadMediator = class("ResourceDownloadMediator", DmPopupViewMediator)
local kBtnHandlers = {}

function ResourceDownloadMediator:initialize()
	super.initialize(self)
end

function ResourceDownloadMediator:dispose()
	super.dispose(self)
end

function ResourceDownloadMediator:onRegister()
	super.onRegister(self)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_REWARDS_SUCC, self, self.showDownloadReward)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_PORTRAIT_OVER, self, self.downloadPortraitOver)
	self:mapEventListener(self:getEventDispatcher(), EVT_DOWNLOAD_SOUNDCV_OVER, self, self.downloadSoundCVOver)
	self:bindWidget("main.bg", PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickClose, self)
		},
		title = Strings:get("Setting_Text26"),
		bgSize = {
			width = 690,
			height = 408
		}
	})
end

function ResourceDownloadMediator:enterWithData(data)
	self._type = data._type

	if self._type == DownlandResType.Sound then
		-- Nothing
	end

	self._tips = self:getView():getChildByFullName("main.tips")
	local icon = self:getView():getChildByFullName("main.icon")
end

function ResourceDownloadMediator:onClickClose()
	self:close()
end

function ResourceDownloadMediator:refreshDownloadStatus()
	self:downloadPortraitOver()
	self:downloadSoundCVOver()
end

function ResourceDownloadMediator:onClickSpinePortraitBtn()
	self._settingSystem:downloadPortrait()
end

function ResourceDownloadMediator:onClickSoundCVBtn()
	self._settingSystem:downloadSoundCV()
end

function ResourceDownloadMediator:showDownloadReward(event)
	self:refreshDownloadStatus()

	local data = event:getData()

	if data.rewards and #data.rewards > 0 then
		local view = self:getInjector():getInstance("getRewardView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			maskOpacity = 0
		}, {
			rewards = data.rewards
		}))
	end
end

function ResourceDownloadMediator:downloadPortraitOver()
	self._resDownloadBtn:setVisible(self._settingSystem:canDownloadPortrait())

	local isPortraitDownloadOver = self._settingSystem:isPortraitDownloadOver()
	local str1 = not isPortraitDownloadOver and Strings:get("setting_ui_DownloadResource") or Strings:get("setting_ui_DownloadReward")

	self._resDownloadBtn:getChildByFullName("text"):setString(str1)
end

function ResourceDownloadMediator:downloadSoundCVOver()
	self._soundDownloadBtn:setVisible(self._settingSystem:canDownloadSoundCV())

	local isSoundCVDownloadOver = self._settingSystem:isSoundCVDownloadOver()
	local str2 = not isSoundCVDownloadOver and Strings:get("setting_ui_DownloadVoice") or Strings:get("setting_ui_DownloadReward")

	self._soundDownloadBtn:getChildByFullName("text"):setString(str2)
end
