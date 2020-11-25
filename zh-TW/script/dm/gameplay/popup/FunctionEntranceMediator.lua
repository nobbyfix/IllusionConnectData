FunctionEntranceMediator = class("FunctionEntranceMediator", DmAreaViewMediator, _M)

FunctionEntranceMediator:has("_arenaSystem", {
	is = "r"
}):injectWith("ArenaSystem")
FunctionEntranceMediator:has("_petRaceSystem", {
	is = "r"
}):injectWith("PetRaceSystem")
FunctionEntranceMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
FunctionEntranceMediator:has("_stagePracticeSystem", {
	is = "r"
}):injectWith("StagePracticeSystem")
FunctionEntranceMediator:has("_spStageSystem", {
	is = "r"
}):injectWith("SpStageSystem")
FunctionEntranceMediator:has("_exploreSystem", {
	is = "r"
}):injectWith("ExploreSystem")

local kFunctionData = {
	{
		cellNode = "arenaCell",
		des = "BlockArena_ShowUI_Des"
	},
	{
		cellNode = "petRaceCell",
		des = "BlockPet_ShowUI_Des"
	},
	{
		cellNode = "friendCell",
		des = "BlockSP_ShowUI_Desc"
	}
}

function FunctionEntranceMediator:initialize()
	super.initialize(self)
end

function FunctionEntranceMediator:dispose()
	super.dispose(self)
end

function FunctionEntranceMediator:onRegister()
	super.onRegister(self)
end

function FunctionEntranceMediator:setupTopInfoWidget(data)
	local topInfoNode = self:getView():getChildByFullName("topinfo_node")
	local config = {
		currencyInfo = data and data.currencyInfo or {},
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		title = data.title,
		style = data.style
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function FunctionEntranceMediator:enterWithData(data)
	self._data = data

	self:setupView(data)
	self:setupClickEnvs()
end

function FunctionEntranceMediator:resumeWithData()
	self:refreshRed()
end

function FunctionEntranceMediator:setupView(data)
	self:setupTopInfoWidget(data)
	self:initWidgetInfo(data)
end

function FunctionEntranceMediator:initWidgetInfo(data)
	self._main = self:getView():getChildByFullName("main")
	self._arenaPanel = self._main:getChildByFullName("arenaPanel")

	if not data then
		return
	end

	self._showPanel = self._arenaPanel

	self:refreshRed()

	local action = cc.CSLoader:createTimeline("asset/ui/Athletics.csb")

	action:clearFrameEventCallFunc()
	self._main:stopAllActions()
	self._main:runAction(action)

	local backgroundBG = self._main:getChildByFullName("backgroundBG")

	backgroundBG:setPosition(cc.p(568, 310))
	backgroundBG:runAction(cc.MoveTo:create(0.26666666666666666, cc.p(568, 320)))

	local animPanel = self._arenaPanel:getChildByFullName("animPanel")
	local jjAnim = cc.MovieClip:create("jingjirukou_jingjirukou")

	jjAnim:setPosition(cc.p(0, 0))
	animPanel:addChild(jjAnim)
	jjAnim:addCallbackAtFrame(12, function ()
		jjAnim:stop()
	end)
	action:gotoFrameAndPlay(0, 9, false)
	self:createArenaAnim()
	self:createPetRaceAnim()
	self:createFriendAnim()

	local function onFrameEvent(frame)
		if frame == nil then
			return
		end

		local str = frame:getEvent()

		if str == "ArenaAnim" then
			self._arenaPanel:getChildByFullName("arenaCell.ShowAnim"):setVisible(true)
			self._arenaPanel:getChildByFullName("arenaCell.ShowAnim"):gotoAndPlay(0)
		end

		if str == "PetRaceAnim" then
			self._arenaPanel:getChildByFullName("petRaceCell.ShowAnim"):setVisible(true)
			self._arenaPanel:getChildByFullName("petRaceCell.ShowAnim"):gotoAndPlay(0)
		end

		if str == "FriendAnim" then
			self._arenaPanel:getChildByFullName("friendCell.ShowAnim"):setVisible(true)
			self._arenaPanel:getChildByFullName("friendCell.ShowAnim"):gotoAndPlay(0)
		end
	end

	action:setFrameEventCallFunc(onFrameEvent)
	self:refreshView()
end

function FunctionEntranceMediator:createArenaAnim()
	local arenaCell = self._arenaPanel:getChildByFullName("arenaCell")
	local descLabel = arenaCell:getChildByFullName("text"):clone()

	descLabel:setVisible(true)

	local redPoint = arenaCell:getChildByFullName("redPoint"):clone()

	arenaCell:removeAllChildren()

	local anim = cc.MovieClip:create("arenaCell_jingjirukou")

	anim:addTo(arenaCell)
	anim:addCallbackAtFrame(21, function ()
		anim:stop()
	end)
	anim:setPosition(cc.p(126, 120))
	anim:setName("ShowAnim")
	anim:setVisible(false)

	local descPanel = anim:getChildByFullName("descPanel")

	if descPanel then
		descPanel:removeAllChildren()
		descLabel:addTo(descPanel):posite(-70, 4)
		redPoint:addTo(descPanel):posite(80, 36)

		arenaCell.redPoint = redPoint
	end
end

function FunctionEntranceMediator:createPetRaceAnim()
	local petRaceCell = self._arenaPanel:getChildByFullName("petRaceCell")
	local descLabel = petRaceCell:getChildByFullName("text"):clone()

	descLabel:setVisible(true)

	local redPoint = petRaceCell:getChildByFullName("redPoint"):clone()

	petRaceCell:removeAllChildren()

	local anim = cc.MovieClip:create("petRaceCell_jingjirukou")

	anim:addTo(petRaceCell)
	anim:addCallbackAtFrame(21, function ()
		anim:stop()
	end)
	anim:setPosition(cc.p(140, 130))
	anim:setName("ShowAnim")
	anim:setVisible(false)

	local descPanel = anim:getChildByFullName("descPanel")

	if descPanel then
		descPanel:removeAllChildren()
		descLabel:addTo(descPanel):posite(-70, 4)
		redPoint:addTo(descPanel):posite(90, -20)

		petRaceCell.redPoint = redPoint
	end
end

function FunctionEntranceMediator:createFriendAnim()
	local petRaceCell = self._arenaPanel:getChildByFullName("friendCell")
	local descLabel = petRaceCell:getChildByFullName("text"):clone()

	descLabel:setVisible(true)

	local redPoint = petRaceCell:getChildByFullName("redPoint"):clone()

	petRaceCell:removeAllChildren()

	local anim = cc.MovieClip:create("friendCell_jingjirukou")

	anim:addTo(petRaceCell)
	anim:addCallbackAtFrame(26, function ()
		anim:stop()
	end)
	anim:setPosition(cc.p(146, 120))
	anim:setName("ShowAnim")
	anim:setVisible(false)

	local descPanel = anim:getChildByFullName("descPanel")

	if descPanel then
		descPanel:removeAllChildren()
		descLabel:addTo(descPanel):posite(-70, 0)
		redPoint:addTo(descPanel):posite(80, -20)

		petRaceCell.redPoint = redPoint
	end
end

function FunctionEntranceMediator:createRulePanel(parent, str)
	local image = ccui.ImageView:create("asset/common/sl_bg_msd.png")

	image:setAnchorPoint(cc.p(1, 0.5))
	image:addTo(parent):posite(132, -13)

	local label = cc.Label:createWithTTF(str, TTF_FONT_FZYH_M, 19)

	GameStyle:setCommonOutlineEffect(label, 255)
	label:setAnchorPoint(cc.p(1, 0.5))
	label:addTo(image):posite(242, 32)
	image:setOpacity(0)
	performWithDelay(self:getView(), function ()
		image:fadeIn({
			time = 0.2
		})
	end, 0.5)

	return image
end

function FunctionEntranceMediator:refreshView()
	for i = 1, #kFunctionData do
		local data = kFunctionData[i]
		local cellNode = data.cellNode
		local panel = self._showPanel:getChildByFullName(cellNode)

		if panel then
			panel:addClickEventListener(function ()
				self:clickPanel(i)
			end)
		end
	end
end

function FunctionEntranceMediator:clickPanel(index)
	if index == 1 then
		self:enterArenaView()
	elseif index == 2 then
		self:enterPetRaceView()
	elseif index == 3 then
		self:enterFriendView()
	end
end

function FunctionEntranceMediator:refreshRed()
	local redFunc = {
		function ()
			return self._arenaSystem:checkAwardRed()
		end,
		function ()
			return self._petRaceSystem:redPointShow()
		end,
		function ()
			return self._stagePracticeSystem:checkAwardRed()
		end
	}

	for i = 1, #kFunctionData do
		local data = kFunctionData[i]
		local cellNode = data.cellNode
		local panel = self._showPanel:getChildByFullName(cellNode)

		if panel then
			local redPoint1 = panel:getChildByFullName("redPoint")
			local redPoint2 = panel.redPoint
			local resShow = redFunc[i]()

			if redPoint1 then
				redPoint1:setVisible(resShow)
			end

			if redPoint2 then
				redPoint2:setVisible(resShow)
			end
		end
	end
end

function FunctionEntranceMediator:enterArenaView()
	local unlock, tip = self._arenaSystem:checkEnabled()

	if not unlock then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = tip
		}))
	else
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
		self:getArenaSystem():tryEnter()
	end
end

function FunctionEntranceMediator:enterPetRaceView()
	local unlock, tip = self._petRaceSystem:checkEnabled()

	if not unlock then
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = tip
		}))
	else
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)
		self:getPetRaceSystem():tryEnter()
	end
end

function FunctionEntranceMediator:enterFriendView()
	local systemKeeper = self:getInjector():getInstance("SystemKeeper")
	local unlock, tips = systemKeeper:isUnlock("Friend_PK")

	if unlock then
		AudioEngine:getInstance():playEffect("Se_Click_Open_1", false)

		local friendPvpSystem = self:getInjector():getInstance(FriendPvpSystem)

		friendPvpSystem:tryEnter()
	else
		AudioEngine:getInstance():playEffect("Se_Alert_Error", false)
		self:dispatch(ShowTipEvent({
			tip = tips
		}))
	end
end

function FunctionEntranceMediator:onClickBack(sender, eventType)
	self._main:stopAllActions()
	self:dismissWithOptions({
		transition = ViewTransitionFactory:create(ViewTransitionType.kCommonAreaView)
	})
end

function FunctionEntranceMediator:setupClickEnvs()
	if GameConfigs.closeGuide then
		return
	end

	local sequence = cc.Sequence:create(cc.CallFunc:create(function ()
		local storyDirector = self:getInjector():getInstance(story.StoryDirector)

		for i = 1, #kFunctionData do
			local data = kFunctionData[i]
			local cellNode = data.cellNode
			local panel = self._showPanel:getChildByFullName(cellNode)

			if panel then
				storyDirector:setClickEnv("functionEntrance.node_" .. i, panel, function (sender, eventType)
					self:clickPanel(i)
				end)
			end
		end

		storyDirector:notifyWaiting("enter_FunctionEntrance_view")
	end))

	self:getView():runAction(sequence)
end

function FunctionEntranceMediator:didFinishResumeTransition()
	local winSize = cc.Director:getInstance():getWinSize()
	local transitionView = cc.LayerColor:create(cc.c4b(0, 0, 0, 255), winSize.width, winSize.height)

	transitionView:addTo(self:getView())
	transitionView:center(cc.size(1136, 640))
	transitionView:runAction(cc.Sequence:create(cc.FadeTo:create(0.1, 0), cc.CallFunc:create(function ()
		transitionView:removeFromParent(true)
	end)))
end