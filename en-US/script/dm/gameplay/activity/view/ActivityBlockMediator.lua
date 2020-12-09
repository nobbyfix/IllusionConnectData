ActivityBlockMediator = class("ActivityBlockMediator", DmAreaViewMediator, _M)

ActivityBlockMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")
ActivityBlockMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
ActivityBlockMediator:has("_surfaceSystem", {
	is = "r"
}):injectWith("SurfaceSystem")

local kBtnHandlers = {
	["main.stagePanel.button"] = {
		ignoreClickAudio = true,
		func = "onClickStage"
	},
	["main.stagePanel.heroTouch"] = {
		ignoreClickAudio = true,
		func = "onClickAttrAdd"
	},
	["main.surfacebtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickSurface"
	},
	["main.taskBtn"] = {
		ignoreClickAudio = true,
		func = "onClickTask"
	},
	["main.teamBtn"] = {
		ignoreClickAudio = true,
		func = "onClickTeam"
	},
	["main.eggBtn"] = {
		ignoreClickAudio = true,
		func = "onClickEgg"
	},
	tipBtn = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickRule"
	},
	["main.btnNode.rightBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickRight"
	},
	["main.btnNode.leftBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickLeft"
	}
}
local kModelType = {
	kSurface = "Surface",
	kHero = "Hero"
}

function ActivityBlockMediator:initialize()
	super.initialize(self)
end

function ActivityBlockMediator:dispose()
	self:stopTimer()
	super.dispose(self)
end

function ActivityBlockMediator:stopTimer()
	if self._timer then
		self._timer:stop()

		self._timer = nil
	end

	if self._roleTimer then
		self._roleTimer:stop()

		self._roleTimer = nil
	end
end

function ActivityBlockMediator:onRegister()
	super.onRegister(self)

	self._heroSystem = self._developSystem:getHeroSystem()

	self:mapButtonHandlersClick(kBtnHandlers)
	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_RESET_DONE, self, self.doReset)

	self._main = self:getView():getChildByName("main")
	self._imageBg = self._main:getChildByName("Imagebg")
	self._titleImage = self._main:getChildByName("titleImage")

	self._titleImage:ignoreContentAdaptWithSize(true)

	self._surfaceBtn = self._main:getChildByName("surfacebtn")
	self._tipNode = self._main:getChildByName("tipNode")
	self._roleNode = self._main:getChildByName("roleNode")
	self._btnNode = self._main:getChildByName("btnNode")
	self._timeNode = self._main:getChildByName("timeNode")
	self._stagePanel = self._main:getChildByName("stagePanel")
	self._taskBtn = self._main:getChildByName("taskBtn")
	self._eggBtn = self._main:getChildByName("eggBtn")
	self._teamBtn = self._main:getChildByName("teamBtn")

	self._taskBtn:getChildByFullName("text"):getVirtualRenderer():setLineSpacing(-15)
	self._eggBtn:getChildByFullName("text"):getVirtualRenderer():setLineSpacing(-15)
	self._teamBtn:getChildByFullName("text"):getVirtualRenderer():setLineSpacing(-15)

	local Image_2 = self._timeNode:getChildByName("Image_2")
	local text = self._timeNode:getChildByName("text")
	local time = self._timeNode:getChildByName("time")
	local width1 = text:getContentSize().width + 10

	if getCurrentLanguage() ~= GameLanguageType.CN then
		time:setFontSize(17)

		local text4 = self._stagePanel:getChildByName("text4")

		text4:setFontSize(12)
	end

	time:setPositionX(text:getPositionX() + width1)
	Image_2:setContentSize(cc.size(width1 + 185, 29))
end

function ActivityBlockMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByName("topinfo_node")
	local config = {
		style = 1,
		hideLine = true,
		currencyInfo = self._model:getResourcesBanner(),
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		}
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function ActivityBlockMediator:enterWithData(data)
	self._activityId = data.activityId or ActivityId.kActivityBlock
	self._canChangeHero = true

	self:initData()
	self:setupTopInfoWidget()
	self:initView()
end

function ActivityBlockMediator:resumeWithData()
	local quit = self:doReset()

	if quit then
		return
	end

	self:initData()
	self:initView()
end

function ActivityBlockMediator:initData()
	self._model = self._activitySystem:getActivityById(self._activityId)
	self._blockActivity = nil
	self._taskActivities = {}
	self._eggActivity = nil

	if self._model then
		self._blockActivity = self._model:getBlockMapActivity()
		self._taskActivities = self._model:getTaskActivities()
		self._eggActivity = self._model:getEggActivity()
	end

	self._roleIndex = 1
	self._roles = self._model:getRoleParams()
end

function ActivityBlockMediator:initView()
	self:initInfo()
	self:initTimer()
	self:initRoleTimer()
	self:updateRolePanel()
	self:playBackgroundMusic()
end

function ActivityBlockMediator:playBackgroundMusic()
	local bgm = self._model:getBgm()

	AudioEngine:getInstance():playBackgroundMusic(bgm)
end

function ActivityBlockMediator:initInfo()
	self._imageBg:loadTexture(self._model:getBgPath())
	self._titleImage:loadTexture(self._model:getTitlePath(), 1)

	local btns = self._model:getButtonConfig()
	local tipStr = self._model:getActivityConfig().SubActivityEndTip
	self._endTip = {}
	local redPoint = self._stagePanel:getChildByName("redPoint")

	redPoint:setVisible(self._blockActivity and self._blockActivity:hasRedPoint())

	local text1 = self._stagePanel:getChildByName("text1")
	local text2 = self._stagePanel:getChildByName("text2")
	local image = self._stagePanel:getChildByName("image")

	image:ignoreContentAdaptWithSize(true)

	local itemNode = self._stagePanel:getChildByName("itemNode")

	itemNode:removeAllChildren()

	local heroNode = self._stagePanel:getChildByName("heroNode")

	heroNode:removeAllChildren()

	if btns.blockParams then
		image:loadTexture(btns.blockParams.icon .. ".png", 1)

		local title = btns.blockParams.title
		local localLanguage = getCurrentLanguage()

		if localLanguage ~= GameLanguageType.CN then
			text1:setVisible(false)
			text2:setString(title)
			text2:setPositionX(40)
		else
			text2:setVisible(true)

			local length = utf8.len(title)
			local name1 = utf8.sub(title, 1, 2)
			local name2 = utf8.sub(title, 3, length)

			text1:setString(name1)
			text2:setString(name2)
		end

		if btns.blockParams.rewards then
			local length = math.ceil(#btns.blockParams.rewards / 4)

			for i = 1, length do
				for jj = 1, 4 do
					local index = 4 * (i - 1) + jj
					local reward = btns.blockParams.rewards[index]

					if reward then
						local icon = IconFactory:createRewardIcon(reward, {
							showAmount = false,
							notShowQulity = true
						})

						icon:addTo(itemNode):setScale(0.26)

						local x = 33 * (jj - 1)
						local y = -30 * (i - 1)

						icon:setPosition(cc.p(x, y))
					end
				end
			end
		end

		if btns.blockParams.heroes then
			local length = #btns.blockParams.heroes

			for i = 1, length do
				local id = btns.blockParams.heroes[i]
				local icon = IconFactory:createHeroIconForReward({
					star = 0,
					id = id
				})

				icon:addTo(heroNode):setScale(0.5)

				local x = 30 * (3 - length) + 68 * (i - 1)

				icon:setPositionX(x)

				local image = ccui.ImageView:create("jjc_bg_ts_new.png", 1)

				image:addTo(icon):posite(92, 20):setScale(1.2)
			end
		end

		self._endTip.blockEndTip = Strings:get(tipStr, {
			activityId = title
		})
	end

	local redPoint = self._eggBtn:getChildByName("redPoint")

	redPoint:setVisible(self._eggActivity and self._eggActivity:hasRedPoint())

	local image = self._eggBtn:getChildByName("image")

	image:ignoreContentAdaptWithSize(true)

	local text = self._eggBtn:getChildByName("text")

	if btns.eggParams then
		image:loadTexture(btns.eggParams.icon .. ".png", 1)

		local title = btns.eggParams.title

		text:setString(title)

		self._endTip.eggEndTip = Strings:get(tipStr, {
			activityId = title
		})
	end

	local redPoint = self._teamBtn:getChildByName("redPoint")

	redPoint:setVisible(false)

	self._endTip.taskEndTip = Strings:get(tipStr, {
		activityId = Strings:get("ActivityBlock_UI_10")
	})
	local redPoint = self._taskBtn:getChildByName("redPoint")
	local hasRed = false

	if self._taskActivities then
		for i = 1, #self._taskActivities do
			if self._taskActivities[i]:hasRedPoint() then
				hasRed = true

				break
			end
		end
	end

	redPoint:setVisible(hasRed)
end

function ActivityBlockMediator:initTimer()
	local text = self._timeNode:getChildByName("time")

	text:setString(self._model:getTimeStr())

	local remainLabel = self._stagePanel:getChildByName("remainTime")

	if self._blockActivity then
		local remoteTimestamp = self._activitySystem:getCurrentTime()
		self._endTime = self._blockActivity:getEndTime() / 1000

		if remoteTimestamp < self._endTime then
			if self._timer then
				return
			end

			local function checkTimeFunc()
				remoteTimestamp = self._activitySystem:getCurrentTime()
				local remainTime = self._endTime - remoteTimestamp

				if remainTime <= 0 then
					self._timer:stop()

					self._timer = nil

					remainLabel:setString(Strings:get("ActivityBlock_UI_8"))

					return
				end

				local str = ""
				local fmtStr = "${d}:${H}:${M}:${S}"
				local timeStr = TimeUtil:formatTime(fmtStr, remainTime)
				local parts = string.split(timeStr, ":", nil, true)
				local timeTab = {
					day = tonumber(parts[1]),
					hour = tonumber(parts[2]),
					min = tonumber(parts[3])
				}

				if timeTab.day > 0 then
					str = timeTab.day .. Strings:get("TimeUtil_Day")
				elseif timeTab.hour > 0 then
					str = timeTab.hour .. Strings:get("TimeUtil_Hour")
				else
					timeTab.min = math.max(1, timeTab.min)
					str = timeTab.min .. Strings:get("TimeUtil_Min")
				end

				remainLabel:setString(Strings:get("ActivityBlock_UI_24", {
					time = str
				}))
			end

			self._timer = LuaScheduler:getInstance():schedule(checkTimeFunc, 1, false)

			checkTimeFunc()
		else
			remainLabel:setString(Strings:get("ActivityBlock_UI_8"))
		end

		return
	end

	remainLabel:setString(Strings:get("ActivityBlock_UI_8"))
end

function ActivityBlockMediator:initRoleTimer()
	if self._roleTimer then
		self._roleTimer:stop()
	end

	local function checkTimeFunc()
		self._roleIndex = self._roleIndex + 1

		if self._roleIndex > #self._roles then
			self._roleIndex = 1
		end

		self:updateRolePanel()
	end

	self._roleTimer = LuaScheduler:getInstance():schedule(checkTimeFunc, 5, false)
end

function ActivityBlockMediator:updateRolePanel()
	local type_ = self._roles[self._roleIndex].type
	local model = self._roles[self._roleIndex].model
	self._roleUrl = self._roles[self._roleIndex].url
	local desc = Strings:get(self._roles[self._roleIndex].desc)

	self._tipNode:getChildByName("text"):setString(desc)

	local showTip = true
	local showSurface = self._roleUrl and self._roleUrl ~= ""

	if type_ == kModelType.kSurface then
		local surfaces = self._surfaceSystem:getSurfaceById(model)

		if surfaces:getUnlock() then
			showTip = false
		end

		model = ConfigReader:getDataByNameIdAndKey("Surface", model, "Model")
	elseif type_ == kModelType.kHero then
		local hero = self._heroSystem:getHeroById(model)

		if hero then
			showTip = false
		end

		model = IconFactory:getRoleModelByKey("HeroBase", model)
	end

	self._roleNode:removeAllChildren()

	local img, jsonPath = IconFactory:createRoleIconSprite({
		useAnim = true,
		iconType = "Bust4",
		id = model
	})

	img:addTo(self._roleNode):posite(50, -100)
	img:setScale(0.78)
	self._surfaceBtn:setVisible(showTip and showSurface)
	self._tipNode:setVisible(showTip)
end

function ActivityBlockMediator:doReset()
	self:stopTimer()

	local model = self._activitySystem:getActivityById(self._activityId)

	if not model then
		self:dispatch(Event:new(EVT_POP_TO_TARGETVIEW, "homeView"))

		return true
	end

	self:initData()
	self:initView()

	return false
end

function ActivityBlockMediator:refreshView()
	self:doReset()
end

function ActivityBlockMediator:onClickBack(sender, eventType)
	self:dismiss()
end

function ActivityBlockMediator:onClickStage()
	if not self._blockActivity then
		self:dispatch(ShowTipEvent({
			tip = self._endTip.blockEndTip
		}))

		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Story_Dream", false)
	self._activitySystem:enterBlockMap(self._activityId)
end

function ActivityBlockMediator:onClickAttrAdd()
	if not self._blockActivity then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_2", false)

	local rules = self._blockActivity:getActivityConfig().BonusHeroDesc

	self._activitySystem:showActivityRules(rules)
end

function ActivityBlockMediator:onClickRule()
	local rules = self._model:getActivityConfig().RuleDesc

	self._activitySystem:showActivityRules(rules)
end

function ActivityBlockMediator:onClickTask()
	if #self._taskActivities == 0 then
		self:dispatch(ShowTipEvent({
			tip = self._endTip.taskEndTip
		}))

		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_2", false)
	self._activitySystem:enterSupportTaskView(self._activityId)
end

function ActivityBlockMediator:onClickTeam()
	if not self._blockActivity then
		self:dispatch(ShowTipEvent({
			tip = self._endTip.blockEndTip
		}))

		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_2", false)
	self._activitySystem:enterTeam(self._activityId, self._blockActivity)
end

function ActivityBlockMediator:onClickEgg()
	if not self._eggActivity then
		self:dispatch(ShowTipEvent({
			tip = self._endTip.eggEndTip
		}))

		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Common_2", false)
	self._activitySystem:enterEasterEgg({
		activityId = self._activityId
	})
end

function ActivityBlockMediator:onClickSurface()
	if not self._roleUrl or self._roleUrl == "" then
		return
	end

	local context = self:getInjector():instantiate(URLContext)
	local entry, params = UrlEntryManage.resolveUrlWithUserData(self._roleUrl)

	if not entry then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("Function_Not_Open")
		}))
	else
		entry:response(context, params)
	end
end

function ActivityBlockMediator:onClickLeft()
	if not self._canChangeHero then
		return
	end

	self:initRoleTimer()

	self._canChangeHero = false

	performWithDelay(self:getView(), function ()
		self._canChangeHero = true
	end, 0.3)

	self._roleIndex = self._roleIndex - 1

	if self._roleIndex < 1 then
		self._roleIndex = #self._roles
	end

	self:updateRolePanel()
end

function ActivityBlockMediator:onClickRight()
	if not self._canChangeHero then
		return
	end

	self:initRoleTimer()

	self._canChangeHero = false

	performWithDelay(self:getView(), function ()
		self._canChangeHero = true
	end, 0.3)

	self._roleIndex = self._roleIndex + 1

	if self._roleIndex > #self._roles then
		self._roleIndex = 1
	end

	self:updateRolePanel()
end
