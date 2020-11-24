AccumulatedLoginMediator = class("AccumulatedLoginMediator", DmPopupViewMediator, _M)

AccumulatedLoginMediator:has("_activitySystem", {
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

function AccumulatedLoginMediator:initialize()
	super.initialize(self)
end

function AccumulatedLoginMediator:dispose()
	super.dispose(self)
end

function AccumulatedLoginMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
end

function AccumulatedLoginMediator:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_PLAYER_SYNCHRONIZED, self, self.refreshView)
end

function AccumulatedLoginMediator:loadData()
	self._activityList = self._activity._taskList

	table.sort(self._activityList, function (a, b)
		local aNum = a._config.OrderNum
		local bNum = b._config.OrderNum

		return aNum < bNum
	end)

	local todayNum = #self._activityList

	for i = 1, #self._activityList do
		local taskInfo = self._activityList[i]
		local status = taskInfo:getStatus()

		if status == ActivityTaskStatus.kUnfinish then
			todayNum = i - 1

			break
		end
	end

	for i = 1, #self._activityList do
		local taskInfo = self._activityList[i]
		taskInfo.day = i
	end

	self._loginDays = todayNum
end

function AccumulatedLoginMediator:enterWithData(data)
	self._activity = data.activity
	self._parentMediator = data.parentMediator

	self:setupView()
end

function AccumulatedLoginMediator:setupView()
	self:loadData()

	self._main = self:getView():getChildByName("main")
	self._listPanel = self._main:getChildByName("Panel_list")
	self._cellPanel = self._main:getChildByName("Panel_cell")

	self._cellPanel:setVisible(false)

	self._cellPanel8 = self._main:getChildByName("Panel_cell_8")

	self._cellPanel8:setVisible(false)

	self._cellPanel4 = self._main:getChildByName("Panel_cell_4")

	self._cellPanel4:setVisible(false)
	self._main:getChildByFullName("Text_login_day_num"):setString(self._loginDays)
	self:initEightDayCell()
	self:mapEventListeners()
end

function AccumulatedLoginMediator:initEightDayCell()
	self._eightDayCells = {}
	local start_x = 0

	self._listPanel:removeAllChildren()

	for i = 1, #self._activityList do
		local activityData = self._activityList[i]
		local day = activityData.day
		local cellClone = nil

		if day == 8 then
			cellClone = self._cellPanel8:clone()
		elseif day == 4 then
			cellClone = self._cellPanel4:clone()
		else
			cellClone = self._cellPanel:clone()
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

		local iconPanel = cellClone:getChildByName("Panel_reward")
		local rewardId = activityData._config.Reward
		local rewards = ConfigReader:getRecordById("Reward", rewardId)

		if rewards then
			local reward = rewards.Content[1]

			if reward then
				local amount = reward.amount or 1

				if reward.type == RewardType.kHero or reward.type == RewardType.kSurface then
					amount = ""
				end

				iconPanel:removeAllChildren()

				if day == 8 then
					if reward.type == 7 then
						local config = ConfigReader:getRecordById("Surface", reward.code)
						local model = ConfigReader:requireRecordById("RoleModel", config.Model).Model
						local node = RoleFactory:createRoleAnimation(model)

						node:addTo(iconPanel):offset(65, 5):setName("rewardInstance")
						node:setScale(0.5)
					elseif reward.type == 3 then
						local config = ConfigReader:getRecordById("HeroBase", reward.code)
						local model = ConfigReader:requireRecordById("RoleModel", config.RoleModel).Model
						local node = RoleFactory:createRoleAnimation(model)

						node:addTo(iconPanel):offset(77, 8):setName("rewardInstance")
						node:setScale(-0.77, 0.77)
					end
				else
					local rewardIcon = IconFactory:createRewardIcon(reward, {
						showAmount = false,
						notShowQulity = true,
						isWidget = true
					})

					iconPanel:addChild(rewardIcon)
					rewardIcon:setScale(0.6)
					rewardIcon:center(iconPanel:getContentSize())
					rewardIcon:setName("rewardInstance")

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
		elseif activityData:getStatus() == ActivityTaskStatus.kGet then
			state = 1

			cellClone:getChildByFullName("dayNum"):setString(Strings:get("Activity_Received"))

			local col = cc.c3b(125, 125, 125)

			cellClone:getChildByFullName("image_bg_normal"):setColor(col)

			local rewardInstance = iconPanel:getChildByName("rewardInstance")

			rewardInstance:setColor(col)

			if day == 8 then
				rewardInstance:stopAnimation()
				cellClone:getChildByFullName("Image_2"):setColor(col)
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
				self:onClickGet(activityData:getId(), day)
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

function AccumulatedLoginMediator:refreshView()
	self:loadData()
	self:initEightDayCell()
end

function AccumulatedLoginMediator:onGetRewardCallback(response)
	local response = response.data.reward
	local view = self:getInjector():getInstance("getRewardView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		maskOpacity = 0
	}, {
		rewards = response
	}))
end

function AccumulatedLoginMediator:onClickGet(taskId, day)
	local activityId = self._activity:getId()
	local param = {
		doActivityType = 101,
		taskId = taskId
	}

	self._activitySystem:requestDoActivity(activityId, param, function (response)
		if checkDependInstance(self) then
			self:onGetRewardCallback(response)
			self:refreshView()
		end
	end)
end

function AccumulatedLoginMediator:onClickTips(str)
	self:dispatch(ShowTipEvent({
		tip = Strings:get("EightDaysTips3", {
			factor1 = str
		})
	}))
end
