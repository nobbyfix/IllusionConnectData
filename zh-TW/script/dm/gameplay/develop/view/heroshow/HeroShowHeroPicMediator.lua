HeroShowHeroPicMediator = class("HeroShowHeroPicMediator", DmAreaViewMediator, _M)

HeroShowHeroPicMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kBtnHandlers = {
	backBtn = {
		clickAudio = "Se_Click_Close_1",
		func = "onClickBack"
	},
	screenBtn = {
		clickAudio = "Se_Click_Close_1",
		func = "onClickScreen"
	},
	backBtn_0 = {
		clickAudio = "Se_Click_Close_1",
		func = "onClickBack"
	},
	screenBtn_0 = {
		clickAudio = "Se_Click_Close_1",
		func = "onClickScreen"
	}
}

local function formatUnorderTable(unorderTable, compFunc)
	local _tab = {}

	for k, v in pairs(unorderTable) do
		_tab[#_tab + 1] = k
	end

	if compFunc then
		table.sort(_tab, compFunc)
	end

	return _tab
end

function HeroShowHeroPicMediator:initialize()
	super.initialize(self)
end

function HeroShowHeroPicMediator:dispose()
	super.dispose(self)
end

function HeroShowHeroPicMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._heroSystem = self._developSystem:getHeroSystem()
end

function HeroShowHeroPicMediator:enterWithData(data)
	self._setHomeBgId = data.setHomeBgId
	self._heroId = data.id
	self._heroData = self._heroSystem:getHeroById(self._heroId)
	self._model = self._heroData:getModel()

	self:initView()
	self:initHeroView()
end

function HeroShowHeroPicMediator:initView()
	self._main = self:getView():getChildByFullName("main")
	self._bg = self._main:getChildByFullName("bg")
	self._roleNode = self._main:getChildByFullName("roleNode")
	self._screenBtn = self:getView():getChildByFullName("screenBtn")
	self._backBtn = self:getView():getChildByFullName("backBtn")
	self._screenBtn1 = self:getView():getChildByFullName("screenBtn_0")
	self._backBtn1 = self:getView():getChildByFullName("backBtn_0")

	self._screenBtn1:setVisible(false)
	self._backBtn1:setVisible(false)

	self._backBtnPos = cc.p(self._backBtn:getPositionX(), self._backBtn:getPositionY())
	self._screenBtnPos = cc.p(self._screenBtn:getPositionX(), self._screenBtn:getPositionY())

	if self._setHomeBgId then
		self:initBg()
	else
		local party = self._heroData:getParty()
		local bgAnim = GameStyle:getHeroPartyBg(party)

		bgAnim:addTo(self._bg)
	end
end

function HeroShowHeroPicMediator:initBg()
	self._switchBgTag = -999
	local flashPanel = self._bg

	flashPanel:removeAllChildren()

	local timeTable = ConfigReader:getDataByNameIdAndKey("HomeBackground", self._setHomeBgId, "Loop")
	local keyTab = formatUnorderTable(timeTable, function (a, b)
		local aParts = string.split(a, ":", nil, true)
		local bParts = string.split(b, ":", nil, true)
		local aStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = aParts[1],
			min = aParts[2],
			sec = aParts[3]
		})
		local bStamp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = bParts[1],
			min = bParts[2],
			sec = bParts[3]
		})

		return aStamp < bStamp
	end)
	local curTimeStamp = self:getInjector():getInstance("GameServerAgent"):remoteTimestamp()
	local switchBgTag = #keyTab

	local function comp(switchTime, realTime)
		local parts = string.split(switchTime, ":", nil, true)
		local switchTimeStemp = TimeUtil:getTimeByDateForTargetTimeInToday({
			hour = parts[1],
			min = parts[2],
			sec = parts[3]
		})

		return switchTimeStemp <= realTime
	end

	for k, v in ipairs(keyTab) do
		if not comp(keyTab[k], curTimeStamp) then
			switchBgTag = k - 1

			break
		end
	end

	if switchBgTag < 1 then
		switchBgTag = #keyTab
	end

	if switchBgTag == self._switchBgTag then
		return
	end

	self._switchBgTag = switchBgTag
	local tabValue = timeTable[keyTab[self._switchBgTag]]
	local BGBackgroundId = tabValue.BG
	local imageInfo = ConfigReader:getRecordById("BackGroundPicture", BGBackgroundId)
	local winSize = cc.Director:getInstance():getWinSize()

	if imageInfo.Picture and imageInfo.Picture ~= "" then
		local bgImage = ccui.ImageView:create("asset/scene/" .. imageInfo.Picture .. ".jpg")

		bgImage:addTo(self._bg)

		if winSize.height < 641 then
			bgImage:setScale(winSize.width / 1386)
		end
	end

	local flashId = imageInfo.Flash1

	if flashId and flashId ~= "" then
		local mc = cc.MovieClip:create(flashId)

		mc:addTo(flashPanel):center(flashPanel:getContentSize())
		self:setClimateScene(mc)

		if winSize.height < 641 then
			mc:setScale(winSize.width / 1386)
		end

		local extFlashId = imageInfo.Flash2

		if extFlashId and extFlashId ~= "" then
			local extMc = cc.MovieClip:create(extFlashId)

			if extMc then
				extMc:addTo(flashPanel):center(flashPanel:getContentSize())
				extMc:setScale(winSize.width / 1386)
			end
		end
	end

	if imageInfo.Extra and imageInfo.Extra ~= "" then
		local extraView = cc.CSLoader:createNode("asset/ui/" .. imageInfo.Extra .. ".csb")

		extraView:addTo(flashPanel):center(flashPanel:getContentSize())

		if winSize.height < 641 then
			extraView:setScale(winSize.width / 1386)
		end
	end
end

function HeroShowHeroPicMediator:setClimateScene(node)
	local settingModel = self:getInjector():getInstance(SettingSystem):getSettingModel()
	local weathData = settingModel:getWeatherData()
	local climateDay = GameStyle:getClimateById(weathData.conditionIdDay)

	if Climate2LayerName[climateDay] then
		local layer = node:getChildByName(Climate2LayerName[climateDay])

		if layer then
			local climateMc = cc.MovieClip:create(Climate2MCName[climateDay])

			climateMc:addTo(layer)
		end
	end
end

function HeroShowHeroPicMediator:initHeroView()
	local heroSprite, _, spineani, picInfo = IconFactory:createRoleIconSprite({
		useAnim = true,
		iconType = "Bust6",
		id = self._model
	})

	heroSprite:addTo(self._roleNode):posite(0, -200)

	if spineani then
		spineani:registerSpineEventHandler(handler(self, self.spineAnimEvent), sp.EventType.ANIMATION_COMPLETE)

		self._sharedSpine = spineani
	else
		self._sharedSpine = nil
	end

	self._roleAnim = heroSprite
	local surfaceId = self._heroData:getSurfaceId()

	if surfaceId then
		self._touchTimes = 0
		local surfaceData = ConfigReader:getDataByNameIdAndKey("Surface", surfaceId, "ClickAction")
		local num = #surfaceData

		for i = 1, num do
			local _info = surfaceData[i]
			local touchPanel = ccui.Layout:create()

			touchPanel:setAnchorPoint(cc.p(0.5, 0.5))

			local point = _info.point
			local size = heroSprite:getContentSize()

			if point[1] == "all" then
				touchPanel:setContentSize(cc.size(size.width / 2 * picInfo.zoom, size.height * picInfo.zoom))
				touchPanel:setPosition(size.width / 2 + picInfo.Deviation[1], size.height / 2 + picInfo.Deviation[2])
			else
				touchPanel:setContentSize(cc.size(_info.range[1] * picInfo.zoom, _info.range[2] * picInfo.zoom))
				touchPanel:setPosition(cc.p(_info.point[1] * picInfo.zoom + picInfo.Deviation[1] + size.width / 2, _info.point[2] * picInfo.zoom + picInfo.Deviation[2]))
			end

			if GameConfigs.HERO_TOUCHVIEW_DEBUG then
				touchPanel:setBackGroundColorType(1)
				touchPanel:setBackGroundColor(cc.c3b(255, 0, 0))
				touchPanel:setBackGroundColorOpacity(180)
			end

			touchPanel:setTouchEnabled(true)
			touchPanel:addTouchEventListener(function (sender, eventType)
				if eventType == ccui.TouchEventType.ended then
					if self._sharedSpine and self._sharedSpine:hasAnimation(_info.action) then
						self._sharedSpine:playAnimation(0, _info.action, true)
					end

					self._touchTimes = self._touchTimes + 1

					if self._touchTimes > 1 then
						-- Nothing
					end

					if self._boardHeroEffect then
						return
					end

					local soundTab = {}

					for _, v in ipairs(_info.voice) do
						local isUnlock = self:checkSoundUnlock(v)

						if isUnlock and (self._lastClickSound ~= v or #soundTab == 0) then
							soundTab[#soundTab + 1] = v
						end
					end

					local weighting = 1

					if self._touchTimes > 5 and self._lastClickSound ~= "Voice_" .. self._heroId .. "_60" then
						soundTab[#soundTab + 1] = "Voice_" .. self._heroId .. "_60"
						weighting = 1.6
					end

					local randomCount = math.ceil(#soundTab * weighting)
					local soundId = soundTab[math.random(1, randomCount)]
					soundId = soundId or "Voice_" .. self._heroId .. "_60"
					local isExistStr = Strings:get(ConfigReader:getDataByNameIdAndKey("Sound", soundId, "CueName"))

					if isExistStr and isExistStr ~= "Voice_Default" then
						local trueSoundId = nil
						self._boardHeroEffect, trueSoundId = AudioEngine:getInstance():playRoleEffect(soundId, false, function ()
							self._boardHeroEffect = nil
						end)
						self._lastClickSound = soundId
					end
				end
			end)
			touchPanel:addTo(heroSprite, num + 1 - i)
		end
	end
end

function HeroShowHeroPicMediator:checkSoundUnlock(soundId)
	local sound = {
		config = ConfigReader:getRecordById("Sound", soundId),
		setUnlock = function (self, unlock)
		end,
		getUnlockDesc = function (self)
			return self.config.UnlockDesc
		end,
		getUnlockCondition = function (self)
			local unlock = self.config.Unlock or {}

			return unlock
		end
	}

	return self._heroSystem:getSoundUnlock(self._heroData, sound)
end

function HeroShowHeroPicMediator:onClickBack()
	self:dismiss()
end

function HeroShowHeroPicMediator:onClickScreen()
	if not self._viewState then
		self._viewState = true

		self._main:setRotation(-90)
		self._screenBtn1:setVisible(true)
		self._backBtn1:setVisible(true)
		self._screenBtn:setVisible(false)
		self._backBtn:setVisible(false)
		self._bg:setScale(1.63)
		self._roleAnim:setPosition(cc.p(0, -50))
	else
		self._viewState = false

		self._main:setRotation(0)
		self._screenBtn1:setVisible(false)
		self._backBtn1:setVisible(false)
		self._screenBtn:setVisible(true)
		self._backBtn:setVisible(true)
		self._bg:setScale(1)
		self._roleAnim:setPosition(cc.p(0, -200))
	end
end

function HeroShowHeroPicMediator:spineAnimEvent(event)
	if event.type == "complete" and event.animation ~= "animation" and self._sharedSpine then
		if event.animation == spineTouchEventName then
			spineTouchEventTag = false
		end

		self._sharedSpine:playAnimation(0, "animation", true)
	end
end
