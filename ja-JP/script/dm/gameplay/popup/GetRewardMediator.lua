GetRewardMediator = class("GetRewardMediator", DmPopupViewMediator, _M)
local kMaxshowIconCount = 5

function GetRewardMediator:initialize()
	super.initialize(self)

	self._needClick = true
end

function GetRewardMediator:dispose()
	super.dispose(self)
end

function GetRewardMediator:onRegister()
	super.onRegister(self)

	self._main = self:getView():getChildByName("main")
	self._iconPanel = self._main:getChildByName("iconpanel")

	self._iconPanel:setLocalZOrder(10)

	self._kIconWidth = self._iconPanel:getContentSize().width / kMaxshowIconCount
end

function GetRewardMediator:enterWithData(data)
	self._rewards = data.rewards
	self._callback = data.callback or nil

	if data.needClick ~= nil then
		self._needClick = data.needClick
	end

	self._tips = data.tips or false
	self._title = data.title or nil
	self._title1 = data.title1 or nil
	self._tipStr = data.tipStr or ""
	self._showStr = data.showStr or "Tower_Normal_Reward_Tips"
	self._offset = data.offset or cc.p(0, 0)
	self._delayTime = 0.7

	self:createDelayAction()

	local rewardsNow = {}
	local filter = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Activity_Point_Hide", "content")

	for i = 1, table.nums(self._rewards) do
		if self._rewards[i] and self._rewards[i].code then
			local code = self._rewards[i].code
			local type = self._rewards[i].type
			local amount = self._rewards[i].amount

			if type == RewardType.kEquip or type == RewardType.kEquipExplore then
				for j = 1, amount do
					local reward = {
						amount = 1,
						code = code,
						type = type,
						rewardType = type
					}
					rewardsNow[#rewardsNow + 1] = reward
				end
			elseif not table.indexof(filter, code) and type ~= RewardType.kSpecialValue then
				rewardsNow[#rewardsNow + 1] = self._rewards[i]
			end
		end
	end

	self._rewards = rewardsNow

	local function getTypeOrderForSort(rewardData)
		if rewardData then
			local typeOrder = 10

			if rewardData.type == RewardType.kHero then
				typeOrder = 100
			end

			if rewardData.type == RewardType.kEquip or rewardData.type == RewardType.kEquipExplore then
				typeOrder = 50
			end

			if rewardData.type == RewardType.kSurface then
				typeOrder = 25
			end

			return typeOrder
		end
	end

	table.sort(self._rewards, function (a, b)
		local result = false
		local aQualityFlag = self:getQualityForSort(a)
		local bQualityFlag = self:getQualityForSort(b)

		if bQualityFlag < aQualityFlag then
			result = true
		elseif aQualityFlag == bQualityFlag then
			local aTypeOrder = getTypeOrderForSort(a)
			local bTypeOrder = getTypeOrderForSort(b)
			result = bTypeOrder < aTypeOrder
		end

		return result
	end)

	self._rewardIndex = 1
	self._maxGroupCount = math.ceil(#self._rewards / kMaxshowIconCount)
	self._curGroupIndex = 1

	self:setupView()
end

function GetRewardMediator:getQualityForSort(rewardData)
	local quality = 1

	if rewardData then
		if rewardData.type == RewardType.kEquip or rewardData.type == RewardType.kEquipExplore then
			local config = ConfigReader:getRecordById("HeroEquipBase", rewardData.code)
			quality = config.Rareity - 9
		elseif rewardData.type == RewardType.kHero then
			local config = ConfigReader:getRecordById("HeroBase", rewardData.code)

			if config and config.Id then
				quality = config.Rareity - 9
			end
		else
			quality = RewardSystem:getQuality(rewardData)
		end

		if quality == nil then
			quality = 1
		end
	end

	return quality
end

function GetRewardMediator:setupView()
	AudioEngine:getInstance():playEffect("Se_Alert_Reward", false)
	self:getView():getChildByFullName("main.tipPanel"):setVisible(self._tips)

	self._tipLabel = self:getView():getChildByFullName("main.tipLabel")

	self._tipLabel:setString(self._tipStr)

	local text = self:getView():getChildByFullName("main.tipPanel.Text_67")
	local button_rule = self:getView():getChildByFullName("main.tipPanel.button_rule")

	text:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)
	text:setString(Strings:get(self._showStr))
	button_rule:setPosition(cc.p(text:getPositionX() - text:getContentSize().width / 2 - 20, text:getPositionY() + text:getContentSize().height / 2 - 20))
	self:showGetRewardAnim()
end

function GetRewardMediator:getCurShowRewardCount()
	if self._curGroupIndex < self._maxGroupCount or #self._rewards % kMaxshowIconCount == 0 then
		return kMaxshowIconCount
	else
		return #self._rewards % kMaxshowIconCount
	end
end

function GetRewardMediator:showGetRewardAnim()
	local animNode = self:getView():getChildByFullName("main.animNode")

	self._tipLabel:setOpacity(0)

	local anim = cc.MovieClip:create("huodetishi_huodetishi")

	anim:addTo(animNode, 1)
	anim:addCallbackAtFrame(39, function ()
		anim:stop()

		if not self._needClick then
			local close = self:onClickOk()

			if close then
				anim:gotoAndPlay(40)
				self._iconPanel:fadeOut({
					time = 0.4
				})
			else
				self._iconPanel:removeAllChildren(true)
				self:showOneIcon(1)
			end
		end
	end)
	anim:addCallbackAtFrame(55, function ()
		local callback = self._callback
		local developSystem = self:getInjector():getInstance("DevelopSystem")

		self:close()
		developSystem:popPlayerLvlUpView()

		if callback then
			callback()
		end
	end)

	local cnText = anim:getChildByFullName("cnText")
	local enText = anim:getChildByFullName("enText")
	local t = self._title or Strings:get("Get_Reward_Title")
	local title1 = cc.Label:createWithTTF(t, CUSTOM_TTF_FONT_1, 50)

	title1:enableOutline(cc.c4b(0, 0, 0, 255), 1)
	title1:addTo(cnText):offset(0, -3)

	local t1 = self._title1 or Strings:get("UITitle_EN_Gongxihuode")
	local title2 = cc.Label:createWithTTF(t1, TTF_FONT_FZYH_M, 18)

	title2:setColor(cc.c3b(150, 160, 255))
	title2:addTo(enText)
	anim:addCallbackAtFrame(9, function ()
		self._tipLabel:fadeIn({
			time = 0.2
		})
		self:showOneIcon(1)
	end)

	self._mainAnim = anim
end

function GetRewardMediator:showOneIcon(index)
	if DisposableObject:isDisposed(self) then
		return
	end

	self._rewardIndex = index + (self._curGroupIndex - 1) * kMaxshowIconCount
	local baseNode = cc.Node:create()

	self._iconPanel:addChild(baseNode)

	local rewardData = self._rewards[self._rewardIndex]

	if not rewardData then
		return
	end

	local anim = cc.MovieClip:create("icon_group_gongxihuode")

	anim:setPlaySpeed(1.5)
	anim:setPosition(cc.p(-8, 27))
	baseNode:addChild(anim, 2)
	anim:addCallbackAtFrame(5, function ()
		local iconNode = cc.Node:create()

		baseNode:addChild(iconNode)

		local hasAddIcon = false

		if rewardData.type == RewardType.kItem or rewardData.type == RewardType.kEquip or rewardData.type == RewardType.kEquipExplore then
			local config = ConfigReader:getRecordById("ItemConfig", rewardData.code)
			local ResourcesShine = 0

			if rewardData.type == RewardType.kItem then
				local resourcesConfig = ConfigReader:getRecordById("ResourcesIcon", rewardData.code)

				if resourcesConfig and resourcesConfig.Shine and rewardData.amount and resourcesConfig.Segmentation then
					local index = #resourcesConfig.Shine

					for i, num in ipairs(resourcesConfig.Segmentation) do
						if rewardData.amount < num then
							index = i - 1

							break
						end
					end

					index = index ~= nil and math.max(index, 1) or math.min(#resourcesConfig.Segmentation, #resourcesConfig.Shine)

					if index > 0 and index <= #resourcesConfig.Shine then
						ResourcesShine = resourcesConfig.Shine[index]
					end
				end
			end

			if rewardData.type == RewardType.kEquip or rewardData.type == RewardType.kEquipExplore then
				config = ConfigReader:getRecordById("HeroEquipBase", rewardData.code)
			end

			if config and config.Id and (config.Shine and config.Shine >= 1 or ResourcesShine >= 1) then
				local anim = cc.MovieClip:create("ssrchuchang_zhuangbeishilian")

				anim:addEndCallback(function ()
					anim:stop()
				end)

				local equipNode = anim:getChildByFullName("equipNode")

				if equipNode then
					anim:offset(12, 30)

					local iconNode1 = equipNode:getChildByFullName("icon")
					local iconNode2 = equipNode:getChildByFullName("iconNode")
					local bgFile = GameStyle:getItemQuaRectFile(self:getQualityForSort(rewardData), 1)
					local bgImage = IconFactory:createSprite(bgFile)

					bgImage:addTo(iconNode2):posite(-1.5, 0)

					local icon = IconFactory:createRewardIcon(rewardData, {
						isWidget = true,
						notShowQulity = true
					})

					IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewardData, {
						swallowTouches = true,
						needDelay = true
					})
					icon:addTo(iconNode1):posite(-5, -1.5)
				else
					local iconNode1 = anim:getChildByFullName("iconNode")
					local icon = IconFactory:createRewardIcon(rewardData, {
						isWidget = true
					})

					IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewardData, {
						swallowTouches = true,
						needDelay = true
					})
					icon:addTo(iconNode1)
				end

				anim:setScale(0.72)
				anim:addTo(iconNode):posite(9, 20)

				hasAddIcon = true
			end
		end

		if hasAddIcon == false then
			local icon = IconFactory:createRewardIcon(rewardData, {
				isWidget = true
			})

			icon:addTo(iconNode, 1):center(iconNode:getContentSize())
			IconFactory:bindTouchHander(icon, IconTouchHandler:new(self), rewardData, {
				swallowTouches = true,
				needDelay = true
			})
			icon:setScaleNotCascade(0.6)
		end

		local name = RewardSystem:getName(rewardData)
		local nameText = cc.Label:createWithTTF(name, TTF_FONT_FZYH_M, 16, cc.size(100, 60))

		nameText:setAlignment(1, 0)
		nameText:setAnchorPoint(cc.p(0.5, 1))
		nameText:enableOutline(cc.c4b(0, 0, 0, 127), 1)
		nameText:addTo(iconNode):center(iconNode:getContentSize()):offset(0, -76)
		nameText:setOverflow(cc.LabelOverflow.SHRINK)
		nameText:setDimensions(100, 50)

		if rewardData.type == RewardType.kEquip or rewardData.type == RewardType.kEquipExplore then
			local config = ConfigReader:getRecordById("HeroEquipBase", rewardData.code)

			GameStyle:setRarityText(nameText, config.Rareity)
		else
			GameStyle:setQualityText(nameText, self:getQualityForSort(rewardData))
		end

		AudioEngine:getInstance():playEffect("Se_Alert_Common_Gain")
	end)
	anim:addEndCallback(function ()
		anim:stop()
		anim:setVisible(false)
	end)

	local initX = self._iconPanel:getContentSize().width / 2 - (self:getCurShowRewardCount() - 1) * 0.5 * self._kIconWidth

	baseNode:setPosition(cc.p(initX + (index - 1) * self._kIconWidth, 0))

	local frame = {
		2,
		2,
		3,
		2,
		2
	}

	anim:addCallbackAtFrame(frame[index], function ()
		if rewardData.type == 3 then
			self:showNewHeroView(rewardData.code)

			if index < self:getCurShowRewardCount() then
				index = index + 1

				self:showOneIcon(index)
			end
		elseif index < self:getCurShowRewardCount() then
			index = index + 1

			self:showOneIcon(index)
		end
	end)
end

function GetRewardMediator:showNewHeroView(heroId, callback)
	local view = self:getInjector():getInstance("newHeroView")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, {
		heroId = heroId,
		callback = callback
	}))
end

function GetRewardMediator:onClickOk()
	if self._curGroupIndex and self._maxGroupCount and self._curGroupIndex < self._maxGroupCount then
		self._curGroupIndex = self._curGroupIndex + 1

		return false
	else
		return true
	end
end

function GetRewardMediator:onTouchMaskLayer()
	if self._delayClick then
		return
	end

	local close = self:onClickOk()

	if not self._needClick or close then
		self._mainAnim:stop()

		local callback = self._callback
		local developSystem = self:getInjector():getInstance("DevelopSystem")

		super.onTouchMaskLayer(self)
		developSystem:popPlayerLvlUpView()

		if callback then
			callback()
		end
	elseif not close then
		self:createDelayAction()
		self._iconPanel:removeAllChildren(true)
		self:showOneIcon(1)
	end
end

function GetRewardMediator:createDelayAction()
	self._delayClick = true

	performWithDelay(self:getView(), function ()
		self._delayClick = false
	end, self._delayTime)
end
