QuestionActivityMediator = class("QuestionActivityMediator", BaseActivityMediator, _M)

QuestionActivityMediator:has("_activitySystem", {
	is = "r"
}):injectWith("ActivitySystem")

local kBtnHandlers = {}

local function getHeroPortraitPath(roleModelId)
	local rolePicId = ConfigReader:getDataByNameIdAndKey("RoleModel", roleModelId, "Portrait")
	local modelID = ConfigReader:getDataByNameIdAndKey("RoleModel", roleModelId, "Model")
	local commonResource = ConfigReader:getDataByNameIdAndKey("RoleModel", roleModelId, "CommonResource")

	if not commonResource or commonResource == "" then
		commonResource = modelID
	end

	local picInfo = ConfigReader:getRecordById("SpecialPicture", rolePicId)
	local path = string.format("%s%s/%s.png", IconFactory.kIconPathCfg[tonumber(picInfo.Path)], commonResource, picInfo.Filename)

	return path
end

function QuestionActivityMediator:initialize()
	super.initialize(self)
end

function QuestionActivityMediator:dispose()
	if self._timeScheduler then
		self._timeScheduler:stop()

		self._timeScheduler = nil
	end

	local activityData = self._activityData

	if activityData._rewardStatus == true then
		activityData._endTime = 0
	end

	super.dispose(self)
end

function QuestionActivityMediator:onRemove()
	super.onRemove(self)
end

function QuestionActivityMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	bindWidget(self, "main.Button_go", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onQuestionClicked, self)
		}
	})
	bindWidget(self, "main.Button_get", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onRewardClicked, self)
		}
	})
end

function QuestionActivityMediator:enterWithData(data)
	self._activityData = data.activity
	self._parentMediator = data.parentMediator
	self._activityConfig = self._activityData._config.ActivityConfig

	self:setupView()
end

function QuestionActivityMediator:setupView()
	self:refreshView()
	self:updateTime()
	self:initAnim()
end

function QuestionActivityMediator:refreshView()
	local title = self:getView():getChildByFullName("main.title")
	local node_reward = self:getView():getChildByFullName("main.Node_reward")
	local button_go = self:getView():getChildByFullName("main.Button_go")
	local button_get = self:getView():getChildByFullName("main.Button_get")
	local node_complete = self:getView():getChildByFullName("main.Node_complete")
	local label_complete = self:getView():getChildByFullName("main.Node_complete.Text_des")
	local label_des = self:getView():getChildByFullName("main.label_des")
	local label_timeDes = self:getView():getChildByFullName("main.Node_time.Text_des")

	label_timeDes:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

	local lable_none = self:getView():getChildByFullName("main.lable_none")

	lable_none:setString(Strings:get("Activity_Finish"))
	title:setString(Strings:get(self._activityConfig.Title))
	label_des:setString(Strings:get(self._activityConfig.Desc))
	label_des:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)
	label_complete:setAdditionalKerning(2)
	label_des:setAdditionalKerning(2)
	label_timeDes:setAdditionalKerning(2)

	local path = getHeroPortraitPath(self._activityConfig.RoleModel)
	local heroPanel = self:getView():getChildByFullName("main.heroPanel.hero")
	local heroWordPanel = self:getView():getChildByFullName("main.heroPanel.image")

	heroPanel:loadTexture(path, ccui.TextureResType.localType)
	heroWordPanel:loadTexture(self._activityConfig.DesPng .. ".png", ccui.TextureResType.plistType)

	local canGetRewSta = self._activityData._canGetRewSta
	local rewardStatus = self._activityData._rewardStatus

	lable_none:setVisible(false)

	if rewardStatus then
		button_go:setVisible(false)
		button_get:setVisible(false)
		node_complete:setVisible(true)
	else
		node_complete:setVisible(false)

		if canGetRewSta then
			button_go:setVisible(false)
			button_get:setVisible(true)
		else
			button_go:setVisible(true)
			button_get:setVisible(false)
		end
	end

	node_reward:removeAllChildren()

	local rewardId = self._activityConfig.reward

	if rewardId then
		local rewards = ConfigReader:getDataByNameIdAndKey("Reward", rewardId, "Content")

		if rewards then
			local num = #rewards
			local kIconWigth = 73.6

			for k, v in pairs(rewards) do
				local rewardData = v
				local icon = IconFactory:createRewardIcon(rewardData, {
					isWidget = true
				})

				icon:addTo(node_reward, 1):center(node_reward:getContentSize())
				icon:setScaleNotCascade(0.56)
				IconFactory:bindTouchHander(icon, IconTouchHandler:new(self._parentMediator), rewardData, {
					needDelay = true
				})

				local initX = node_reward:getContentSize().width / 2 - (num - 1) * 0.5 * kIconWigth

				icon:setPosition(cc.p(initX + (k - 1) * kIconWigth, 0))
			end
		end
	end
end

function QuestionActivityMediator:onQuestionClicked(data)
	local url = nil

	if self._activityData then
		url = self._activityConfig.URL
	end

	if url then
		cc.Application:getInstance():openURL(url)

		self._activityData._canGetRewSta = true

		self:dispatch(Event:new(EVT_REDPOINT_REFRESH))

		local function callback()
			self:refreshView()
		end

		local delay = cc.DelayTime:create(0.1)
		local sequence = cc.Sequence:create(delay, cc.CallFunc:create(callback))

		self:getView():runAction(sequence)
	end
end

function QuestionActivityMediator:onRewardClicked()
	local activityData = self._activityData
	local activityId = self._activityData._id
	local param = {
		doActivityType = 101
	}

	self._activitySystem:requestDoActivity(activityId, param, function (response)
		activityData._rewardStatus = true

		self:showRewardView(response.data)
		self:dispatch(Event:new(EVT_REDPOINT_REFRESH))
	end)
end

function QuestionActivityMediator:updateTime()
	local function update()
		local button_go = self:getView():getChildByFullName("main.Button_go")
		local Node_time = self:getView():getChildByFullName("main.Node_time")
		local lable_none = self:getView():getChildByFullName("main.lable_none")
		local activityId = self._activityData._id
		local oneDaySec = 86400
		local minSec = 60
		local hourSec = 3600
		local leaveTime = self:getActivitySystem():getActivityRemainTime(activityId)
		local text_num = self:getView():getChildByFullName("main.Node_time.Text_num")

		text_num:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

		local text_time = self:getView():getChildByFullName("main.Node_time.Text_time")

		text_time:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

		if self._activitySystem:isActivityOver(activityId) then
			button_go:setVisible(false)
			Node_time:setVisible(false)
			lable_none:setVisible(true)

			return
		end

		if leaveTime <= 0 then
			text_num:setString(0)
			text_time:setString(Strings:get("Questionnaire_UI_Desc7"))
			button_go:setVisible(false)
			Node_time:setVisible(false)
			lable_none:setVisible(false)

			return
		end

		Node_time:setVisible(true)
		lable_none:setVisible(false)

		leaveTime = leaveTime / 1000

		if minSec >= leaveTime then
			local num = math.floor(leaveTime / minSec)

			text_num:setString(num)
			text_time:setString(Strings:get("Questionnaire_UI_Desc7"))
		elseif leaveTime <= hourSec then
			local num = math.floor(leaveTime / hourSec)

			text_num:setString(num)
			text_time:setString(Strings:get("Questionnaire_UI_Desc6"))
		else
			local num = math.floor(leaveTime / oneDaySec)

			text_num:setString(num)
			text_time:setString(Strings:get("Questionnaire_UI_Desc5"))
		end
	end

	if self._timeScheduler == nil then
		self._timeScheduler = LuaScheduler:getInstance():schedule(update, 1, true)
	end

	update()
end

function QuestionActivityMediator:initAnim()
	local heroPanel = self:getView():getChildByFullName("main.heroPanel")

	heroPanel:setOpacity(0)

	local posX, posY = heroPanel:getPosition()

	heroPanel:setPositionX(posX + 600)

	local moveAct = cc.MoveTo:create(0.3, cc.p(posX, posY))
	local action = cc.EaseBackOut:create(moveAct)

	action:update(0.95)
	heroPanel:runAction(cc.Spawn:create(action, cc.FadeIn:create(0.25)))
end
