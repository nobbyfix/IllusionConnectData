EVT_CHANGEHEADIMG_SUCC = "EVT_CHANGEHEADIMG_SUCC"
EVT_BUGFEEDBACK_SUCC = "EVT_BUGFEEDBACK_SUCC"
EVT_CHANGEHEADFRAME_SUCC = "EVT_CHANGEHEADFRAME_SUCC"
BattleHp_ShowType = {
	Simple = 0,
	Hide = -1,
	Show = 1
}
BattleEffect_ShowType = {
	All = 1,
	Smooth = 2
}
DownlandResType = {
	Sound = 1,
	Resource = 2
}

require("dm.gameplay.setting.model.SettingModel")

SettingSystem = class("SettingSystem", legs.Actor)

SettingSystem:has("_settingModel", {
	is = "r"
})
SettingSystem:has("_regionData", {
	is = "r"
})
SettingSystem:has("_orderTab", {
	is = "r"
})
SettingSystem:has("_weatherData", {
	is = "r"
})
SettingSystem:has("_settingService", {
	is = "r"
}):injectWith("SettingService")
SettingSystem:has("_packageUpdater", {
	is = "r"
})

function SettingSystem:initialize()
	super.initialize(self)

	self._settingModel = SettingModel:new()
	self._regionData = ConfigReader:getDataTable("PlayerPlace")
	self._orderTab = {}

	for k, v in pairs(self._regionData) do
		local _tab = {
			Id = k,
			sort = v.Sort
		}
		self._orderTab[#self._orderTab + 1] = _tab
	end

	table.sort(self._orderTab, function (a, b)
		return a.sort < b.sort
	end)

	self._randomRolePool = {}
	self._randomBgPool = {}
end

function SettingSystem:dispose()
	if self._weatherTimer then
		LuaScheduler:getInstance():unschedule(self._weatherTimer)

		self._weatherTimer = nil
	end

	super.dispose(self)
end

function SettingSystem:userInject()
	local eventMap = self:getEventMap()

	eventMap:mapListener(self:getEventDispatcher(), EVT_REQUEST_LOGIN_SUCC, self, self.enableWeatherTimer)
end

function SettingSystem:enableWeatherTimer()
	self:getWeatherData()

	self._weatherTimer = LuaScheduler:getInstance():schedule(function ()
		self:getWeatherData()
	end, 3600, false)
end

function SettingSystem:getWeatherData()
	local playerArea = cc.UserDefault:getInstance():getStringForKey("playerCity", "")
	local cityId = -1

	if playerArea ~= "" and playerArea ~= nil then
		local a = string.split(playerArea, "-")
		local b = self._regionData[a[1]]
		local c = b.FID
		cityId = c[tonumber(a[2])]
	end

	self:requestWeatherData(cityId, function ()
		self:dispatch(Event:new(EVT_HOME_SET_CLIMATE))
	end)
end

function SettingSystem:updateMusicAndEffectVolume()
end

function SettingSystem:isMusicOff()
	return self._settingModel:isMusicOff()
end

function SettingSystem:isSoundEffectOff()
	return self._settingModel:isSoundEffectOff()
end

function SettingSystem:isSoundRoleEffectOff()
	return self._settingModel:isSoundRoleEffectOff()
end

function SettingSystem:setMusicVolume(volume)
	self:getSettingModel():setMusicVolume(volume)
end

function SettingSystem:getMusicVolume()
	return self:getSettingModel():getMusicVolume()
end

function SettingSystem:setEffectVolume(volume)
	self:getSettingModel():setEffectVolume(volume)
end

function SettingSystem:getEffectVolume()
	return self:getSettingModel():getEffectVolume()
end

function SettingSystem:setRoleEffectVolume(volume)
	self:getSettingModel():setRoleEffectVolume(volume)
end

function SettingSystem:getRoleEffectVolume()
	return self:getSettingModel():getRoleEffectVolume()
end

function SettingSystem:checkNetworkStatus(callback1, callback)
	local curNetState = 1

	if app.getDevice and app.getDevice() then
		curNetState = app.getDevice():getNetworkStatus()
	end

	if curNetState == 0 then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("setting_ui_DownloadTips_4")
		}))

		return
	end

	if curNetState == 2 then
		local outSelf = self
		local delegate = {
			willClose = function (self, popupMediator, data)
				if data.response == "ok" then
					if callback1 then
						callback1()
					end

					if callback then
						callback()
					end
				elseif data.response == "cancel" then
					-- Nothing
				elseif data.response == "close" then
					-- Nothing
				end
			end
		}
		local data = {
			title = Strings:get("SHOP_REFRESH_DESC_TEXT1"),
			title1 = Strings:get("UITitle_EN_Tishi"),
			content = Strings:get("setting_Text_WifiConfirm"),
			sureBtn = {
				text = Strings:get("setting_ui_Continue"),
				text1 = Strings:get("UITitle_EN_Queding")
			}
		}
		local view = self:getInjector():getInstance("AlertView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))

		return
	end

	if callback1 then
		callback1()
	end

	if callback then
		callback()
	end
end

function SettingSystem:setPortraitIgnoreNetState(ignore)
	local curNetState = 1

	if app.getDevice and app.getDevice() then
		curNetState = app.getDevice():getNetworkStatus()
	end

	self._portraitUpdater:setIgnoreNetState(ignore)

	if ignore then
		self._portraitUpdater:resumeTask()
	elseif curNetState == 2 then
		self._portraitUpdater:autoPauseTask()
	end
end

function SettingSystem:setSoundCVIgnoreNetState(ignore)
	local curNetState = 1

	if app.getDevice and app.getDevice() then
		curNetState = app.getDevice():getNetworkStatus()
	end

	self._soundCVUpdater:setIgnoreNetState(ignore)

	if ignore then
		self._soundCVUpdater:resumeTask()
	elseif curNetState == 2 then
		self._soundCVUpdater:autoPauseTask()
	end
end

function SettingSystem:setPackageIgnoreNetState(ignore)
	local curNetState = 1

	if app.getDevice and app.getDevice() then
		curNetState = app.getDevice():getNetworkStatus()
	end

	self._packageUpdater:setIgnoreNetState(ignore)

	if ignore then
		self._packageUpdater:resumeTask()
	elseif curNetState == 2 then
		self._packageUpdater:autoPauseTask()
	end
end

function SettingSystem:hasPackage()
	if not GameExtPackUpdaterManager or not GameConfigs.extPackType or DownloadPackType.kNoPackage >= tonumber(GameConfigs.extPackType) then
		return false
	end

	return true
end

function SettingSystem:canDownloadPortrait()
	if not self:hasPackage() then
		return false
	end

	local gotReward = self:gotPortraitReward()
	local downloadOver = self:isPortraitDownloadOver()

	return not gotReward or not downloadOver
end

function SettingSystem:gotPortraitReward()
	local develop = self:getInjector():getInstance(DevelopSystem)
	local generalReward = develop:getPlayer():getGeneralReward()
	local gotReward = generalReward[CommonRewardType.kPortraitDownload]

	return gotReward
end

function SettingSystem:isPortraitDownloadStart()
	local downloadStart = cc.UserDefault:getInstance():getBoolForKey(UserDefaultKey.kSpinePortraitDownloadStartKey)

	return downloadStart
end

function SettingSystem:isPortraitDownloadOver()
	if not self._portraitUpdater then
		return true
	end

	return self:getPortraitProgress() == 100
end

function SettingSystem:createPortraitDownloader()
	if not self._portraitUpdater then
		local delegate1 = {
			onAutoPause = function (self)
				print("网络变更为蜂窝流量自动暂停任务")
			end,
			onAutoResume = function (self)
				print("网络变更为wifi自动恢复任务")
			end
		}
		local outself = self

		function delegate1:onTaskError(task, errorCode, errorCodeInternal, errorStr)
			if errorCodeInternal ~= -1 and errorCodeInternal ~= 0 then
				local str = string.format("下载任务失败:%s,%s,%s,%s", task.requestURL or "", errorCode, errorCodeInternal, errorStr)

				CommonUtils.uploadDataToBugly("updater_spinePortrait_error:", str)
			end
		end

		self._portraitUpdater = GameExtPackUpdaterManager.getUpdater()

		self._portraitUpdater:setDelegate(delegate1)
		self._portraitUpdater:initWithTypeOrSqlStr(ExPackCgf.Spine_Portrait)

		self._portraitTotalSize = self._portraitUpdater:getTotalExpectedSize() / 1024 / 1024

		self._portraitUpdater:setProgressFunc(function (progress)
			if progress == 100 then
				cc.UserDefault:getInstance():setBoolForKey(UserDefaultKey.kSpinePortraitDownloadKey, true)
				self:dispatch(Event:new(EVT_DOWNLOAD_PORTRAIT_OVER, {}))
			end

			local currentSize = self._portraitUpdater:getTotalReceivedSize() / 1024 / 1024

			self:dispatch(Event:new(EVT_DOWNLOAD_PORTRAIT, {
				currentSize = currentSize,
				totalSize = self._portraitTotalSize,
				progress = progress
			}))
		end)

		local canAuto = cc.UserDefault:getInstance():getBoolForKey(UserDefaultKey.kAutoDownloadKey)

		self._portraitUpdater:setIgnoreNetState(canAuto)
	end
end

function SettingSystem:autoDownloadPortrait()
	if not self:hasPackage() then
		return false
	end

	self:createPortraitDownloader()

	local portraitProgress = self:getPortraitProgress()

	if portraitProgress == 100 then
		return
	end

	local canAuto = cc.UserDefault:getInstance():getBoolForKey(UserDefaultKey.kAutoDownloadKey)

	self._portraitUpdater:setIgnoreNetState(canAuto)
	self._portraitUpdater:run()
end

function SettingSystem:getPortraitProgress()
	if not self._portraitUpdater then
		return 100
	end

	local progress = self._portraitUpdater:getProgress()

	return progress
end

function SettingSystem:downloadPortrait()
	if not self:hasPackage() then
		return false
	end

	local downloadStart = true
	local downloadOver = self:isPortraitDownloadOver()
	local gotReward = self:gotPortraitReward()

	local function callback()
		local currentSize = self._portraitUpdater:getTotalReceivedSize() / 1024 / 1024
		local progress = self._portraitUpdater:getProgress()
		local data = {
			eventKey = EVT_DOWNLOAD_PORTRAIT,
			currentSize = currentSize,
			totalSize = self._portraitTotalSize,
			progress = progress,
			tips = Strings:get("setting_Text_ResourceFunction")
		}
		local view = self:getInjector():getInstance("SettingDownloadView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, nil))
	end

	local function callback1()
		cc.UserDefault:getInstance():setBoolForKey(UserDefaultKey.kSpinePortraitDownloadStartKey, true)
		self._portraitUpdater:run()
	end

	if not downloadStart then
		local outSelf = self
		local delegate = {
			willClose = function (self, popupMediator, data)
				if data.response == "ok" then
					outSelf:checkNetworkStatus(callback1, callback)
				elseif data.response == "cancel" then
					-- Nothing
				elseif data.response == "close" then
					-- Nothing
				end
			end
		}
		local data = {
			title = Strings:get("setting_ui_DownloadTips"),
			title1 = Strings:get("UITitle_EN_Xiazaitishi"),
			content = Strings:get("setting_Text_ResourceFunction") .. "\n" .. Strings:get("setting_Text_ResourceSize", {
				num = string.format("%.1f", self._portraitTotalSize)
			}),
			sureBtn = {
				text = Strings:get("setting_ui_ConfirmDownload"),
				text1 = Strings:get("UITitle_EN_Queding")
			}
		}
		local view = self:getInjector():getInstance("AlertView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))

		return
	end

	if not downloadOver then
		callback()

		return
	end

	if not gotReward then
		self:requestGetGeneralReward(CommonRewardType.kPortraitDownload)
	end
end

function SettingSystem:canDownloadSoundCV()
	if not self:hasPackage() then
		return false
	end

	local gotReward = self:gotSoundCVReward()
	local downloadOver = self:isSoundCVDownloadOver()

	return not gotReward or not downloadOver
end

function SettingSystem:gotSoundCVReward()
	local develop = self:getInjector():getInstance(DevelopSystem)
	local generalReward = develop:getPlayer():getGeneralReward()
	local gotReward = generalReward[CommonRewardType.kSoundDownload]

	return gotReward
end

function SettingSystem:isSoundCVDownloadStart()
	local downloadStart = cc.UserDefault:getInstance():getBoolForKey(UserDefaultKey.kSoundCVDownloadStartKey)

	return downloadStart
end

function SettingSystem:isSoundCVDownloadOver()
	if not self._soundCVUpdater then
		return true
	end

	return self:getSoundCVProgress() == 100
end

function SettingSystem:createSoundCVDownloader()
	if not self._soundCVUpdater then
		local delegate1 = {
			onAutoPause = function (self)
				print("网络变更为蜂窝流量自动暂停任务")
			end,
			onAutoResume = function (self)
				print("网络变更为wifi自动恢复任务")
			end
		}

		function delegate1:onTaskError(task, errorCode, errorCodeInternal, errorStr)
			if errorCodeInternal ~= -1 and errorCodeInternal ~= 0 then
				local str = string.format("下载任务失败:%s,%s,%s,%s", task.requestURL or "", errorCode, errorCodeInternal, errorStr)

				CommonUtils.uploadDataToBugly("updater_soundCV_error:", str)
			end
		end

		self._soundCVUpdater = GameExtPackUpdaterManager.getUpdater()

		self._soundCVUpdater:setDelegate(delegate1)
		self._soundCVUpdater:initWithTypeOrSqlStr(ExPackCgf.Sound_CV)

		self._soundTotalSize = self._soundCVUpdater:getTotalExpectedSize() / 1024 / 1024

		self._soundCVUpdater:setProgressFunc(function (progress)
			if progress == 100 then
				cc.UserDefault:getInstance():setBoolForKey(UserDefaultKey.kSoundCVDownloadKey, true)
				self:dispatch(Event:new(EVT_DOWNLOAD_SOUNDCV_OVER, {}))
			end

			local currentSize = self._soundCVUpdater:getTotalReceivedSize() / 1024 / 1024

			self:dispatch(Event:new(EVT_DOWNLOAD_SOUNDCV, {
				currentSize = currentSize,
				totalSize = self._soundTotalSize,
				progress = progress
			}))
		end)

		local canAuto = cc.UserDefault:getInstance():getBoolForKey(UserDefaultKey.kAutoDownloadKey)

		self._soundCVUpdater:setIgnoreNetState(canAuto)
	end
end

function SettingSystem:autoDownloadSoundCV()
	if not self:hasPackage() then
		return false
	end

	self:createSoundCVDownloader()

	local soundcvProgress = self:getSoundCVProgress()

	if soundcvProgress == 100 then
		return
	end

	local canAuto = cc.UserDefault:getInstance():getBoolForKey(UserDefaultKey.kAutoDownloadKey)

	self._soundCVUpdater:setIgnoreNetState(canAuto)
	self._soundCVUpdater:run()
end

function SettingSystem:getSoundCVProgress()
	if not self._soundCVUpdater then
		return 100
	end

	local progress = self._soundCVUpdater:getProgress()

	return progress
end

function SettingSystem:downloadSoundCV()
	if not self:hasPackage() then
		return false
	end

	local downloadStart = true
	local downloadOver = self:isSoundCVDownloadOver()
	local gotReward = self:gotSoundCVReward()

	local function callback()
		local currentSize = self._soundCVUpdater:getTotalReceivedSize() / 1024 / 1024
		local progress = self._soundCVUpdater:getProgress()
		local data = {
			eventKey = EVT_DOWNLOAD_SOUNDCV,
			currentSize = currentSize,
			totalSize = self._soundTotalSize,
			progress = progress,
			tips = Strings:get("setting_Text_VoiceFunction")
		}
		local view = self:getInjector():getInstance("SettingDownloadView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, nil))
	end

	local function callback1()
		cc.UserDefault:getInstance():setBoolForKey(UserDefaultKey.kSoundCVDownloadStartKey, true)
		self._soundCVUpdater:run()
	end

	if not downloadStart then
		local outSelf = self
		local delegate = {
			willClose = function (self, popupMediator, data)
				if data.response == "ok" then
					outSelf:checkNetworkStatus(callback1, callback)
				elseif data.response == "cancel" then
					-- Nothing
				elseif data.response == "close" then
					-- Nothing
				end
			end
		}
		local data = {
			title = Strings:get("setting_ui_DownloadTips"),
			title1 = Strings:get("UITitle_EN_Xiazaitishi"),
			content = Strings:get("setting_Text_VoiceFunction") .. "\n" .. Strings:get("setting_Text_ResourceSize", {
				num = string.format("%.1f", self._soundTotalSize)
			}),
			sureBtn = {
				text = Strings:get("setting_ui_ConfirmDownload"),
				text1 = Strings:get("UITitle_EN_Queding")
			}
		}
		local view = self:getInjector():getInstance("AlertView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
		}, data, delegate))

		return
	end

	if not downloadOver then
		callback()

		return
	end

	if not gotReward then
		self:requestGetGeneralReward(CommonRewardType.kSoundDownload)
	end
end

function SettingSystem:createMusicDownloader()
	if not self._musicUpdater then
		local delegate1 = {
			onAutoPause = function (self)
				print("网络变更为蜂窝流量自动暂停任务")
			end,
			onAutoResume = function (self)
				print("网络变更为wifi自动恢复任务")
			end
		}

		function delegate1:onTaskError(task, errorCode, errorCodeInternal, errorStr)
			if errorCodeInternal ~= -1 and errorCodeInternal ~= 0 then
				local str = string.format("下载任务失败:%s,%s,%s,%s", task.requestURL or "", errorCode, errorCodeInternal, errorStr)

				CommonUtils.uploadDataToBugly("updater_music_error:", str)
			end
		end

		self._musicUpdater = GameExtPackUpdaterManager.getUpdater()

		self._musicUpdater:setDelegate(delegate1)
		self._musicUpdater:initWithTypeOrSqlStr(ExPackCgf.Music_Expand)
		self._musicUpdater:setProgressFunc(function (progress)
		end)
	end
end

function SettingSystem:autoDownloadMusic()
	if not self:hasPackage() then
		return false
	end

	self:createMusicDownloader()
	self._musicUpdater:run()
end

function SettingSystem:canPackageDownload()
	local guideSystem = self:getInjector():getInstance(GuideSystem)
	local pass = guideSystem:getPassStory1_2()

	return pass
end

function SettingSystem:isPackageDownloadStart()
	local downloadStart = cc.UserDefault:getInstance():getBoolForKey(UserDefaultKey.kPackageDownloadStartKey)

	return downloadStart
end

function SettingSystem:isPackageDownloadOver()
	if not self._packageUpdater then
		return true
	end

	return self:getPackageProgress() == 100
end

function SettingSystem:createPackageDownloader()
	if not self._packageUpdater then
		local delegate1 = {
			onAutoPause = function (self)
				print("网络变更为蜂窝流量自动暂停任务")
			end,
			onAutoResume = function (self)
				print("网络变更为wifi自动恢复任务")
			end
		}

		function delegate1:onTaskError(task, errorCode, errorCodeInternal, errorStr)
			if errorCodeInternal ~= -1 and errorCodeInternal ~= 0 then
				local str = string.format("下载任务失败:%s,%s,%s,%s", task.requestURL or "", errorCode, errorCodeInternal, errorStr)

				CommonUtils.uploadDataToBugly("_updater_150_error:", str)
			end
		end

		self._packageUpdater = GameExtPackUpdaterManager.getUpdater()

		self._packageUpdater:setDelegate(delegate1)

		local sqlStr = string.format("extension IN (%s,%s,%s,%s,%s,%s)", ExPackCgf.animi_150, ExPackCgf.explore_150, ExPackCgf.heros_150, ExPackCgf.scene_150, ExPackCgf.items_150, ExPackCgf.sound_150)

		self._packageUpdater:initWithTypeOrSqlStr(nil, sqlStr)

		self._packageTotalSize = self._packageUpdater:getTotalExpectedSize() / 1024 / 1024

		self._packageUpdater:setProgressFunc(function (progress)
			if progress == 100 then
				cc.UserDefault:getInstance():setBoolForKey(UserDefaultKey.kPackageDownloadKey, true)
				self:dispatch(Event:new(EVT_DOWNLOAD_PACKAGE_OVER, {}))
				self._packageUpdater:setDownloaderMaxNumPerFrame(2)
				self:autoDownloadPortrait()
				self:autoDownloadSoundCV()
				self:autoDownloadMusic()
			end

			local currentSize = self._packageUpdater:getTotalReceivedSize() / 1024 / 1024

			self:dispatch(Event:new(EVT_DOWNLOAD_PACKAGE, {
				currentSize = currentSize,
				totalSize = self._packageTotalSize,
				progress = progress
			}))
		end)

		local canAuto = cc.UserDefault:getInstance():getBoolForKey(UserDefaultKey.kAutoDownloadKey)

		self._packageUpdater:setIgnoreNetState(canAuto)
	end
end

function SettingSystem:getPackageProgress()
	if not self._packageUpdater then
		return 100
	end

	local progress = self._packageUpdater:getProgress()

	return progress
end

function SettingSystem:autoDownloadPackage()
	if not GameExtPackUpdaterManager or not GameConfigs.extPackType or DownloadPackType.kMediumPackage >= tonumber(GameConfigs.extPackType) then
		self:autoDownloadPortrait()
		self:autoDownloadSoundCV()
		self:autoDownloadMusic()

		return false
	end

	self:createPackageDownloader()
	cc.UserDefault:getInstance():setBoolForKey(UserDefaultKey.kPackageDownloadStartKey, true)

	local canAuto = cc.UserDefault:getInstance():getBoolForKey(UserDefaultKey.kAutoDownloadKey)

	self._packageUpdater:setIgnoreNetState(canAuto)
	self._packageUpdater:run()
end

function SettingSystem:downloadPackage(callFunc)
	if not GameExtPackUpdaterManager or not GameConfigs.extPackType or DownloadPackType.kMediumPackage >= tonumber(GameConfigs.extPackType) then
		if callFunc then
			callFunc()
		end

		return false
	end

	local canDownload = self:canPackageDownload()

	if not canDownload then
		if callFunc then
			callFunc()
		end

		return false
	end

	local progress = self._packageUpdater:getProgress()

	if progress == 100 then
		if callFunc then
			callFunc()
		end

		return false
	end

	local function callback()
		local currentSize = self._packageUpdater:getTotalReceivedSize() / 1024 / 1024
		local progress = self._packageUpdater:getProgress()
		local data = {
			eventKey = EVT_DOWNLOAD_SOUNDCV,
			currentSize = currentSize,
			totalSize = self._packageTotalSize,
			progress = progress,
			tips = Strings:get("setting_ui_DownloadTips_5"),
			callFunc = function ()
				if callFunc then
					callFunc()
				end
			end
		}
		local view = self:getInjector():getInstance("DownloadPackageView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
			isAreaIndependent = true
		}, data, nil))
		self._packageUpdater:setDownloaderMaxNumPerFrame(4)
	end

	local outSelf = self
	local delegate = {
		willClose = function (self, popupMediator, data)
			if data.response == "ok" then
				if callback then
					callback()
				end
			elseif data.response == "cancel" then
				-- Nothing
			elseif data.response == "close" then
				-- Nothing
			end
		end
	}
	local data = {
		noClose = true,
		title = Strings:get("setting_ui_DownloadTips"),
		title1 = Strings:get("UITitle_EN_Xiazaitishi"),
		content = Strings:get("setting_ui_DownloadTips_2") .. "\n" .. Strings:get("setting_Text_ResourceSize", {
			num = string.format("%.1f", self._packageTotalSize)
		}),
		sureBtn = {
			text = Strings:get("setting_ui_ConfirmDownload"),
			text1 = Strings:get("UITitle_EN_Queding")
		}
	}
	local view = self:getInjector():getInstance("DownloadAlertView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		isAreaIndependent = true
	}, data, delegate))

	return true
end

function SettingSystem:setMusicOff(isOff)
	self:getSettingModel():setMusicOff(isOff)
	self:updateMusic(isOff)
end

function SettingSystem:updateMusic(isOff)
	AudioEngine:getInstance():setMusicOff(isOff)
end

function SettingSystem:setSoundEffectOff(isOff)
	self:getSettingModel():setSoundEffectOff(isOff)
	self:updateSound(isOff)
end

function SettingSystem:updateSound(isOff)
	self:getSettingModel():setSoundEffectOff(isOff)
end

function SettingSystem:setTouchEffectOff(isOff)
	self:getSettingModel():setTouchEffectOff(isOff)
end

function SettingSystem:setRoleEffectOff(isOff)
	self:getSettingModel():setRoleEffectOff(isOff)
end

function SettingSystem:getCurBGMusicId()
	local musicId = self:getSettingModel():getBGMusicId()

	if not musicId or musicId == "" then
		local musicList = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Music_PlayList", "content")
		musicId = musicList and musicList[1]
	end

	return musicId
end

function SettingSystem:setHpShow(hpShow)
	self:getSettingModel():setHpShowSetting(hpShow)
end

function SettingSystem:setCurMediatorTag(tag)
	self._tag = tag
end

function SettingSystem:getCurMediatorTag()
	return self._tag
end

function SettingSystem:getShowHeadImgList()
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local heroSystem = developSystem:getHeroSystem()
	local masterSystem = developSystem:getMasterSystem()
	local bagSystem = developSystem:getBagSystem()
	local list = {}
	local config = ConfigReader:getDataTable("PlayerHeadModel")

	for k, value in pairs(config) do
		local data = {
			unlock = 0
		}

		if value.Type == 1 then
			if heroSystem:hasHero(value.HeroMasterId) then
				data.unlock = 1
			else
				data.unlock = 0
			end
		elseif value.Type == 2 then
			if masterSystem:getMasterById(value.HeroMasterId):getIsLock() then
				data.unlock = 0
			else
				data.unlock = 1
			end
		elseif value.Type == 3 then
			local rewardEntry = bagSystem:getEntryById(value.HeroMasterId)

			if rewardEntry then
				data.unlock = 1
			else
				data.unlock = 0
			end
		elseif value.Type == 4 then
			if heroSystem:hasHeroAwake(value.HeroMasterId) then
				data.unlock = 1
			else
				data.unlock = 0
			end
		end

		if data.unlock == 1 or value.IsHiddenHead == 0 then
			data.id = value.Id
			data.config = value
			list[#list + 1] = data
		end
	end

	table.sort(list, function (a, b)
		if a.unlock == b.unlock then
			return a.id < b.id
		else
			return b.unlock < a.unlock
		end
	end)

	return list
end

function SettingSystem:getHomeBgId()
	local defValue = ConfigReader:getDataByNameIdAndKey("ConfigValue", "HomeBackground_Default", "content")
	local value = cc.UserDefault:getInstance():getStringForKey("HomeViewBG_ID", defValue)

	return value
end

function SettingSystem:setHomeBgId(id)
	cc.UserDefault:getInstance():setStringForKey("HomeViewBG_ID", id)
end

function SettingSystem:requestChangeHeadImg(headImg, callback)
	local params = {
		headId = headImg
	}

	self._settingService:requestChangeHeadImg(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_CHANGEHEADIMG_SUCC))
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Tip5")
			}))

			if callback then
				callback()
			end
		end
	end)
end

function SettingSystem:requestChangeHeadFrame(headFrameId, callback)
	local params = {
		headFrameId = headFrameId
	}

	self._settingService:requestChangeHeadFrame(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_CHANGEHEADFRAME_SUCC))
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Change_Frame_Tips")
			}))

			if callback then
				callback()
			end
		end
	end)
end

function SettingSystem:requestBugFeedback(question)
	local params = {
		question = question
	}

	self._settingService:requestBugFeedback(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_BUGFEEDBACK_SUCC))
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Setting_Tip6")
			}))
		end
	end)
end

function SettingSystem:requestChangePlayerName(name, hideTip, callback)
	local params = {
		nickname = name
	}

	self._settingService:requestChangePlayerName(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_CHANGENAME_SUCC))

			if hideTip == nil then
				self:dispatch(ShowTipEvent({
					tip = Strings:get("setting_tips4")
				}))
			end

			if callback then
				callback()
			end
		end
	end)
end

function SettingSystem:requestChangePlayerSlogan(slogan)
	local params = {
		slogan = slogan
	}

	self._settingService:requestChangePlayerSlogan(params, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_CHANGESLOGAN_SUCC))
			self:dispatch(ShowTipEvent({
				tip = Strings:get("ARENA_CHANGE_DELARE_SUC")
			}))
		end
	end)
end

function SettingSystem:requestUpdatePlayerInfo(playerInfo, callback)
	self._settingService:requestUpdatePlayerInfo(playerInfo, true, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Set_PlayerInfo_Suc")
			}))

			if callback then
				callback()
			end
		end
	end)
end

local combinationStyle = {
	{
		"NameFirst",
		"NameMiddle",
		"NameLast"
	},
	{
		"NameFirst",
		"NameLast"
	}
}

function SettingSystem:getStrName()
	local style = combinationStyle[math.random(1, #combinationStyle)]
	local endStr = ""

	for i = 1, #style do
		local namelibrary = ConfigReader:getKeysOfTable(style[i])
		local random = math.random(1, #namelibrary)
		local str = ConfigReader:getDataByNameIdAndKey(style[i], tostring(random), style[i])
		endStr = endStr .. str
	end

	return endStr
end

function SettingSystem:requestWeatherData(cityId, callback)
	local params = {
		cityId = tostring(cityId)
	}
	local loginSystem = self:getInjector():getInstance(LoginSystem)
	local url = loginSystem:getLoginUrl()

	self._settingService:requestGetWeatherData(url, params, function (status, response)
		local cjson = require("cjson.safe")
		local resData = cjson.decode(response)

		self:dealWeatherData(resData)

		if callback then
			callback()
		end
	end)
end

function SettingSystem:requestWelfareCode(key, callback)
	local params = {
		key = key
	}

	self._settingService:requestWelfareCode(params, true, function (response)
		if callback then
			callback()
		end
	end)
end

function SettingSystem:requestGetGeneralReward(rewardType, callback, blockUI)
	local params = {
		rewardType = rewardType
	}

	self._settingService:requestGetGeneralReward(params, function (response)
		if response.resCode == GS_SUCCESS then
			self:dispatch(Event:new(EVT_DOWNLOAD_REWARDS_SUCC, {
				rewards = response.data.reward
			}))

			if callback then
				callback()
			end
		end
	end, blockUI)
end

function SettingSystem:dealWeatherData(data)
	if data and data.data and data.data.data and data.data.data.forecast then
		local weatherData = data.data.data.forecast
		local todayWeather = weatherData[1]
		local _weatherData = {
			temperatureDay = todayWeather.tempDay,
			temperatureNight = todayWeather.tempNight,
			conditionDay = todayWeather.conditionDay,
			conditionNight = todayWeather.conditionNight,
			conditionIdDay = todayWeather.conditionIdDay
		}

		self._settingModel:setWeatherData(_weatherData)
	end
end

KTabType = {
	HEAD = 1,
	FRAME = 2
}
KFrameType = {
	RARE = "RARE",
	ACTIVITY = "ACTIVITY",
	FESTIVAL = "FESTIVAL"
}
KFrameSort = {
	ALL = 0,
	ACTIVITY = 1,
	FESTIVAL = 2,
	RARE = 3
}

function SettingSystem:getHeadFrameData()
	if not self._headFrameDB then
		self._headFrameDB = ConfigReader:getDataTable("PlayerHeadFrame")
	end

	return self._headFrameDB
end

function SettingSystem:getShowHeadFrameList()
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local headFrames = developSystem:getPlayer():getHeadFrames()
	local list = {}

	self:getHeadFrameData()

	for k, value in pairs(self._headFrameDB) do
		local data = {
			unlock = 0
		}

		if headFrames[k] then
			data.unlock = 1
			data.frameData = headFrames[k]
		end

		if data.unlock == 1 or value.Unlook == 1 then
			data.id = value.Id
			data.config = value
			list[#list + 1] = data
		end
	end

	table.sort(list, function (a, b)
		if a.unlock == b.unlock then
			local typea = KFrameSort[a.config.Type]
			local typeb = KFrameSort[b.config.Type]

			if typea == typeb then
				return a.config.Order < b.config.Order
			end

			return typea < typeb
		else
			return b.unlock < a.unlock
		end
	end)

	return list
end

function SettingSystem:getRandomShowRoleAndBg()
	local resultRoleId = ""
	local resultBGId = ""
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local heroSystem = developSystem:getHeroSystem()
	local herosList = heroSystem:getOwnHeroIds()

	if self._randomRolePool == nil or #self._randomRolePool == 0 then
		self._randomRolePool = {}

		for k, v in pairs(herosList) do
			local roleId = v.id
			self._randomRolePool[#self._randomRolePool + 1] = roleId
		end
	end

	local random1 = math.random(1, #self._randomRolePool)
	resultRoleId = self._randomRolePool[random1]

	table.remove(self._randomRolePool, random1)

	if self._randomBgPool == nil or #self._randomBgPool == 0 then
		local allBg = ConfigReader:getDataTable("HomeBackground")
		self._randomBgPool = {}

		for k, v in pairs(allBg) do
			local bgId = v.Id
			local unlockCondition = v.Condition
			local isUnlock, argeNum = self:checkCondition(unlockCondition)

			if isUnlock then
				self._randomBgPool[#self._randomBgPool + 1] = bgId
			end
		end
	end

	local random2 = math.random(1, #self._randomBgPool)
	resultBGId = self._randomBgPool[random2]

	table.remove(self._randomBgPool, random2)

	return resultRoleId, resultBGId
end

function SettingSystem:checkCondition(unlockCondition)
	local isOK = true
	local argeNum = nil
	local developSystem = self:getInjector():getInstance(DevelopSystem)
	local unlockSystem = self:getInjector():getInstance(SystemKeeper)
	local playerLevel = developSystem:getPlayer():getLevel()

	for k, v in pairs(unlockCondition) do
		if k == "LEVEL" and playerLevel < v then
			isOK = false
			argeNum = v

			break
		end

		if k == "STAGE" then
			isOK, argeNum = unlockSystem:checkStagePointLock(v)
		end
	end

	return isOK, argeNum
end
