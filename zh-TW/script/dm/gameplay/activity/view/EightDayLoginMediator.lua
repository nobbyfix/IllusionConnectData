EightDayLoginMediator = class("EightDayLoginMediator", DmPopupViewMediator, _M)

EightDayLoginMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")

local kBtnHandlers = {}
local dayStr = {
	"Common_Text_One",
	"Common_Text_Two",
	"Common_Text_Three",
	"Common_Text_Four",
	"Common_Text_Five",
	"Common_Text_Six",
	"Common_Text_Seven",
	"Common_Text_Eight"
}

function EightDayLoginMediator:initialize()
	super.initialize(self)
end

function EightDayLoginMediator:dispose()
	super.dispose(self)
end

function EightDayLoginMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
end

function EightDayLoginMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.refreshView)
	self:mapEventListener(self:getEventDispatcher(), EVT_ACTIVITY_CLOSE, self, self.activityClose)
end

function EightDayLoginMediator:activityClose(event)
	local data = event:getData()
end

function EightDayLoginMediator:loadData()
	self._activityList = self._activity:getList()

	table.sort(self._activityList, function (a, b)
		return a.day < b.day
	end)

	self._loginDays = self._activity:getLoginDays()
end

function EightDayLoginMediator:enterWithData(data)
	self._activity = data.activity
	self._parentMediator = data.parentMediator

	self:setupView()
	self:setupClickEnvs()
end

function EightDayLoginMediator:setupView()
	self:loadData()

	self._main = self:getView():getChildByName("main")
	self._listPanel = self._main:getChildByName("Panel_list")
	self._cellPanel = self._main:getChildByName("Panel_cell")

	self._cellPanel:setVisible(false)

	self._cellPanel8 = self._main:getChildByName("Panel_cell_8")

	self._cellPanel8:setVisible(false)
	self._main:getChildByFullName("Text_login_day_num"):setString(self._loginDays)

	local heroPanel = self._main:getChildByFullName("heroPanel")

	heroPanel:removeAllChildren()

	local activityData = self._activityList[8]
	local rewards = activityData.reward
	local reward = rewards.Content[1]

	if reward.type == 7 then
		local config = ConfigReader:getRecordById("Surface", reward.code)
		local img = IconFactory:createRoleIconSprite({
			useAnim = true,
			iconType = "Bust4",
			id = config.Model
		})

		img:setScale(1.2)
		img:addTo(heroPanel):offset(370, 20)
	end

	self:initEightDayCell()
	self:mapEventListeners()
end

function EightDayLoginMediator:initEightDayCell()
	self._eightDayCells = {}
	local start_x = 0

	self._listPanel:removeAllChildren()

	for i = 1, #self._activityList do
		local activityData = self._activityList[i]
		local day = activityData.day
		local cellClone = self._cellPanel:clone()

		if day == 8 then
			cellClone = self._cellPanel8:clone()
		end

		cellClone:setVisible(true)

		local posY = nil

		if i > 5 then
			start_x = 0
			posY = 7
			i = i - 5
		else
			start_x = 0
			posY = 187
		end

		if day == 8 then
			start_x = 18
			posY = 10
		end

		cellClone:setPosition(cc.p(start_x + (i - 1) * 140, posY))
		cellClone:addTo(self._listPanel)

		local rewardIcon = nil
		local rewards = activityData.reward

		if rewards then
			local reward = rewards.Content[1]

			if reward then
				local amount = reward.amount or 1

				if reward.type == RewardType.kHero then
					amount = ""
				end

				local iconPanel = cellClone:getChildByName("Panel_reward")

				iconPanel:removeAllChildren()

				if iconPanel then
					if day == 8 then
						if reward.type == 7 then
							local config = ConfigReader:getRecordById("Surface", reward.code)
							local model = ConfigReader:requireRecordById("RoleModel", config.Model).Model
							local node = RoleFactory:createRoleAnimation(model)

							node:addTo(iconPanel):offset(60, 8)
							node:setScale(0.77)
						end
					else
						rewardIcon = IconFactory:createRewardIcon(reward, {
							showAmount = false,
							notShowQulity = true,
							isWidget = true
						})

						iconPanel:addChild(rewardIcon)
						rewardIcon:setScale(0.6)
						rewardIcon:center(iconPanel:getContentSize())

						if self._parentMediator then
							IconFactory:bindClickHander(iconPanel, IconTouchHandler:new(self._parentMediator), reward, {
								touchDisappear = true
							})
						else
							IconFactory:bindClickHander(iconPanel, IconTouchHandler:new(self), reward, {
								touchDisappear = true
							})
						end
					end
				end

				if cellClone:getChildByFullName("reward_name_num") then
					local nameStr = RewardSystem:getName(reward)
					local nameText = cellClone:getChildByFullName("reward_name_num")

					nameText:setString(nameStr)
					cellClone:getChildByFullName("rewardCount"):setString(amount)

					if utf8.len(nameStr) > 5 then
						nameText:setFontSize(16)
					end
				end

				if cellClone:getChildByName("8rewardName") then
					local nameStr = RewardSystem:getName(reward)

					cellClone:getChildByName("8rewardName"):setString(nameStr)
				end
			end
		end

		cellClone:getChildByFullName("image_bg_get"):setVisible(false)
		cellClone:getChildByFullName("dayNum"):setString("")
		cellClone:getChildByFullName("dayNum_get"):setVisible(false)
		cellClone:getChildByFullName("Image_day_bg"):setVisible(true)

		local state = nil

		if self._loginDays < day then
			state = 3

			cellClone:getChildByFullName("dayNum"):setString(Strings:get("Activity_Day", {
				num = Strings:get(dayStr[day])
			}))
		elseif activityData.state == ActivityTaskStatus.kGet then
			state = 1

			cellClone:getChildByFullName("dayNum"):setString(Strings:get("Activity_Received"))

			local col = cc.c3b(125, 125, 125)

			cellClone:getChildByFullName("image_bg_normal"):setColor(col)

			if rewardIcon then
				rewardIcon:setColor(col)
			end

			if cellClone:getChildByFullName("reward_name_num") then
				cellClone:getChildByFullName("reward_name_num"):setColor(col)
				cellClone:getChildByFullName("rewardCount"):setColor(col)
			end

			if cellClone:getChildByName("8rewardName") then
				cellClone:getChildByFullName("8rewardName"):setColor(col)
			end
		else
			state = 2

			cellClone:getChildByFullName("image_bg_get"):setVisible(true)
			cellClone:getChildByFullName("dayNum_get"):setVisible(true)
			cellClone:getChildByFullName("Image_day_bg"):setVisible(false)

			local kelingqu = cc.MovieClip:create("kelingqu_kelingqu")

			kelingqu:setScale(0.95)
			kelingqu:addTo(cellClone:getChildByFullName("image_bg_get")):center(cellClone:getChildByFullName("image_bg_get"):getContentSize()):offset(1, 1)

			if day == 8 then
				kelingqu:setScaleX(3.25)
				kelingqu:offset(2, -10)
			end
		end

		local getBtn = cellClone:getChildByName("PanelTouch")
		local text_state = cellClone:getChildByName("Text_state")

		local function callFunc(sender, eventType)
			if self._loginDays < day then
				self:onClickTips(day)
			else
				self:onClickGet(day)
			end

			if cellClone.effect then
				cellClone.effect:stop()
				cellClone.effect:removeFromParent(true)

				cellClone.effect = nil
			end
		end

		mapButtonHandlerClick(nil, getBtn, {
			func = callFunc
		})
		getBtn:setVisible(state == 2)
		cellClone:getChildByName("GetedIcon"):setVisible(state == 1)

		self._eightDayCells[#self._eightDayCells + 1] = cellClone
	end
end

function EightDayLoginMediator:refreshView()
	self:loadData()
	self:initEightDayCell()
end

function EightDayLoginMediator:onGetRewardCallback(response)
	local response = response.data.reward
	local this = self
	local view = self:getInjector():getInstance("getRewardView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		maskOpacity = 0
	}, {
		rewards = response,
		callback = function ()
			local sequence = cc.Sequence:create(cc.CallFunc:create(function ()
				local storyDirector = this:getInjector():getInstance(story.StoryDirector)

				storyDirector:notifyWaiting("exit_GetRewardView_suc")
			end))

			this:getView():runAction(sequence)
		end
	}))
end

function EightDayLoginMediator:onClickGet(day)
	local activityId = self._activity:getId()
	local param = {
		doActivityType = 101,
		targetDay = day
	}

	self._activitySystem:requestDoActivity(activityId, param, function (response)
		self:dispatch(Event:new(EVT_CHARGETASK_FIN))
		self:onGetRewardCallback(response)
		self:refreshView()
	end)
end

function EightDayLoginMediator:onClickTips(str)
	self:dispatch(ShowTipEvent({
		tip = Strings:get("EightDaysTips3", {
			factor1 = str
		})
	}))
end

function EightDayLoginMediator:setupClickEnvs()
	if GameConfigs.closeGuide then
		return
	end

	local sequence = cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function ()
		local storyDirector = self:getInjector():getInstance(story.StoryDirector)
		local cell1 = self._eightDayCells[1]

		if cell1 then
			storyDirector:setClickEnv("eightDayLoginView.cell1", cell1, function (sender, eventType)
				self:onClickGet(1)
			end)
		end

		storyDirector:notifyWaiting("enter_eightDayLogin_view")
	end))

	self:getView():runAction(sequence)
end
