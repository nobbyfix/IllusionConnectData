FreeStaminaActivityMediator = class("FreeStaminaActivityMediator", BaseActivityMediator, _M)

FreeStaminaActivityMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")

function FreeStaminaActivityMediator:initialize()
	super.initialize(self)
end

function FreeStaminaActivityMediator:dispose()
	if self._timeScheduler then
		self._timeScheduler:stop()

		self._timeScheduler = nil
	end

	super.dispose(self)
end

function FreeStaminaActivityMediator:onRemove()
	super.onRemove(self)
end

function FreeStaminaActivityMediator:onRegister()
	super.onRegister(self)

	local developSystem = self:getInjector():getInstance("DevelopSystem")
	self._bagSystem = developSystem:getBagSystem()

	self:bindWidget("main.Button_get", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Confirm",
			func = bind1(self.onOkClicked, self)
		}
	})

	self._main = self:getView():getChildByName("main")
	self._recoverTime = self._main:getChildByFullName("recoverTime")
	local roleNode = self._main:getChildByFullName("roleNode")

	roleNode:removeAllChildren()

	local roleModel = IconFactory:getRoleModelByKey("HeroBase", "YFZZhu")
	local img, jsonPath = IconFactory:createRoleIconSprite({
		iconType = "Bust4",
		id = roleModel
	})

	img:addTo(roleNode)
	img:setScale(1.4)
	img:offset(40, -100)
	self._main:getChildByFullName("Node_icon.Text_duration"):enableOutline(cc.c4b(80, 40, 20, 219.29999999999998), 1)
	self._main:getChildByFullName("title"):enableOutline(cc.c4b(80, 40, 20, 219.29999999999998), 1)
	self._main:getChildByFullName("text1"):setAdditionalKerning(5)
	self._main:getChildByFullName("Node_icon.Text_duration"):setAdditionalKerning(3)
	self._recoverTime:setAdditionalKerning(2)
end

function FreeStaminaActivityMediator:enterWithData(data)
	self._activity = data.activity
	self._parentMediator = data.parentMediator

	self:setupView()
end

function FreeStaminaActivityMediator:setupView()
	local iconBg = self._main:getChildByName("Node_icon")

	iconBg:removeChildByName("PowerIcon")

	local icon = IconFactory:createIcon({
		id = CurrencyIdKind.kPower
	})

	icon:addTo(iconBg):center(iconBg:getContentSize())
	icon:setName("PowerIcon")

	self._getBtn = self._main:getChildByName("Button_get")
	self._recoveringBtn = self._main:getChildByName("Button_recovering")
	self._gotImage = self._main:getChildByName("gotImage")

	self:refreshView()
end

local kRoleTag = 999

function FreeStaminaActivityMediator:refreshRolesState(playAnim)
	local time = ""
	local config = self._activity:getActivityConfig()

	if config then
		local showTime = {}
		local curList = config.FreeStamina

		table.copy(curList, showTime)
		table.sort(showTime, function (a, b)
			return a.Order < b.Order
		end)

		if curList then
			table.sort(curList, function (a, b)
				return self:compare(a, b)
			end)

			for i = 1, #curList do
				local showTimeData = showTime[i]
				local showTimeList1 = string.split(showTimeData.Time[1], ":")
				local showTimeList2 = string.split(showTimeData.Time[2], ":")

				if time == "" then
					time = showTimeList1[1] .. ":" .. showTimeList1[2] .. "-" .. showTimeList2[1] .. ":" .. showTimeList2[2]
				else
					time = time .. "  " .. showTimeList1[1] .. ":" .. showTimeList1[2] .. "-" .. showTimeList2[1] .. ":" .. showTimeList2[2]
				end

				local data = curList[i]

				if i == 1 then
					local timeStatus = self._activitySystem:isCanGetStamina(data.Time, data.Order)
					local showMask = true

					if timeStatus == StaminaRewardTimeStatus.kNow then
						showMask = false
					end

					local staminaLabel = self._main:getChildByName("Text_basenum")

					staminaLabel:setString(data.Amount)

					local addStaminaLabel = self._main:getChildByName("Text_addnum")
					local addNum = 0
					addNum = addNum or 0

					addStaminaLabel:setString(tostring("+" .. addNum))
					addStaminaLabel:setVisible(addNum and addNum > 0 or false)

					local durationLabel = self._main:getChildByFullName("Node_icon.Text_duration")
					local timeList1 = string.split(data.Time[1], ":")
					local timeList2 = string.split(data.Time[2], ":")
					local currentTime = timeList1[1] .. ":" .. timeList1[2] .. "-" .. timeList2[1] .. ":" .. timeList2[2]

					durationLabel:setString(currentTime)
					self._getBtn:setVisible(timeStatus == StaminaRewardTimeStatus.kNow)

					if self._getBtn:isVisible() then
						local function callFuncGet(sender, eventType)
							self:onClickGet(data.Order, data.Amount + addNum)
						end

						self:bindWidget("main.Button_get", OneLevelViceButton, {
							handler = {
								clickAudio = "Se_Click_Confirm",
								func = callFuncGet
							}
						})
					end

					if timeStatus ~= StaminaRewardTimeStatus.kNow then
						local status, currentTime = self:showCanNotGetStatus()

						self._recoveringBtn:setVisible(status == StaminaRewardTimeStatus.kAfter)
						self._gotImage:setVisible(status == StaminaRewardTimeStatus.kBefore)

						if self._gotImage:isVisible() and currentTime then
							durationLabel:setString(currentTime)
						end
					else
						self._recoveringBtn:setVisible(false)
						self._gotImage:setVisible(false)
					end

					self._centerIndex = data.Order
					self._centerStatus = timeStatus

					if not self._timeScheduler then
						self:createTimeScheduler()
					end
				end
			end
		end
	end

	self._recoverTime:setString(Strings:get("Activity_Free_Text3", {
		time = time
	}))
end

function FreeStaminaActivityMediator:showCanNotGetStatus()
	local config = self._activity:getActivityConfig()

	if config then
		local curList = config.FreeStamina
		local showTime = {}

		table.copy(curList, showTime)
		table.sort(showTime, function (a, b)
			return a.Order < b.Order
		end)

		local dayMaxTime = showTime[#showTime].Time
		local dayMaxDataMin = string.split(dayMaxTime[1], ":")
		local activity = self._activitySystem:getActivityById("FreeStamina")

		for i = 1, #curList do
			local data = curList[i]
			local index = data.Order
			local receiveStatus = activity:getRewardStatusByIndex(data.Order)
			local minData = string.split(data.Time[1], ":")
			local maxData = string.split(data.Time[2], ":")
			local currentTimeStamp = self:getInjector():getInstance("GameServerAgent"):remoteTimestamp()
			local curData = os.date("*t", currentTimeStamp)
			local minDayTimeStamp = os.time({
				year = curData.year,
				month = curData.month,
				day = curData.day,
				hour = dayMaxDataMin[1],
				min = dayMaxDataMin[2],
				sec = dayMaxDataMin[3]
			})
			local minTimeStamp, maxTimeStamp = nil

			if minDayTimeStamp <= currentTimeStamp and index ~= 3 then
				minTimeStamp = os.time({
					year = curData.year,
					month = curData.month,
					day = curData.day + 1,
					hour = minData[1],
					min = minData[2],
					sec = minData[3]
				})
				maxTimeStamp = os.time({
					year = curData.year,
					month = curData.month,
					day = curData.day + 1,
					hour = maxData[1],
					min = maxData[2],
					sec = maxData[3]
				})
			else
				minTimeStamp = os.time({
					year = curData.year,
					month = curData.month,
					day = curData.day,
					hour = minData[1],
					min = minData[2],
					sec = minData[3]
				})
				maxTimeStamp = os.time({
					year = curData.year,
					month = curData.month,
					day = curData.day,
					hour = maxData[1],
					min = maxData[2],
					sec = maxData[3]
				})
			end

			if currentTimeStamp <= maxTimeStamp and minTimeStamp <= currentTimeStamp and receiveStatus == ActivityTaskStatus.kGet then
				local currentTime = minData[1] .. ":" .. minData[2] .. "-" .. maxData[1] .. ":" .. maxData[2]

				return StaminaRewardTimeStatus.kBefore, currentTime
			end
		end
	end

	return StaminaRewardTimeStatus.kAfter
end

function FreeStaminaActivityMediator:refreshView(playAnim)
	self:refreshRolesState()
end

function FreeStaminaActivityMediator:compare(a, b)
	local timeAList = a.Time
	local timeBList = b.Time
	local aStatus = self._activitySystem:isCanGetStamina(timeAList, a.Order)
	local bStatus = self._activitySystem:isCanGetStamina(timeBList, b.Order)

	if aStatus == bStatus then
		return a.Order < b.Order
	else
		return bStatus < aStatus
	end
end

function FreeStaminaActivityMediator:createTimeScheduler()
	local function update()
		local config = self._activity:getActivityConfig()

		if config then
			local curList = config.FreeStamina

			if curList then
				table.sort(curList, function (a, b)
					return self:compare(a, b)
				end)

				local centerData = curList[1]
				local centerIndex = centerData.Order
				local centerStatus = self._activitySystem:isCanGetStamina(centerData.Time, centerIndex)

				if self._centerIndex == centerIndex then
					if self._centerStatus ~= centerStatus then
						self:refreshView()
						self:dispatch(Event:new(EVT_REDPOINT_REFRESH))
					end
				else
					self:refreshView(true)
					self:dispatch(Event:new(EVT_REDPOINT_REFRESH))
				end
			end
		end
	end

	self._timeScheduler = LuaScheduler:getInstance():schedule(update, 1, true)
end

function FreeStaminaActivityMediator:onClickGet(index, amount)
	if self._bagSystem:isPowerFull(amount) then
		self:dispatch(ShowTipEvent({
			duration = 0.2,
			tip = Strings:get("Tapenergy_Tips08")
		}))
	else
		local activityId = "FreeStamina"
		local param = {
			doActivityType = 101,
			index = index
		}

		self._activitySystem:requestDoActivity(activityId, param, function (response)
			self:dispatch(ShowTipEvent({
				tip = Strings:get("Power_Tips_1", {
					num = amount
				})
			}))
			self:refreshView()
		end)
	end
end
