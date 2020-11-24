DreamChallengeMainMediator = class("DreamChallengeMainMediator", DmAreaViewMediator, _M)

DreamChallengeMainMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
DreamChallengeMainMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
DreamChallengeMainMediator:has("_dreamSystem", {
	is = "r"
}):injectWith("DreamChallengeSystem")

local kBtnHandlers = {
	["main.honourBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickHonourBtn"
	},
	["main.callBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickCallBtn"
	},
	["main.infoBtn"] = {
		clickAudio = "Se_Click_Common_2",
		func = "onClickInfoBtn"
	}
}

function DreamChallengeMainMediator:initialize()
	super.initialize(self)
end

function DreamChallengeMainMediator:dispose()
	super.dispose(self)
end

function DreamChallengeMainMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
end

function DreamChallengeMainMediator:enterWithData(data)
	self:initWigetInfo()
	self:initData(data)
	self:setupTopView()
	self:setMapData()
	self:createTreeView()
	self:checkPointPassViewShow()
end

function DreamChallengeMainMediator:initWigetInfo()
	self._view = self:getView()
	self._main = self._view:getChildByName("main")
	self._pointTree = self._main:getChildByName("pointTree")
	self._pointView = self._main:getChildByName("point")
	self._firstNode = self._view:getChildByFullName("firstNode")
	self._secNode = self._view:getChildByFullName("secNode")
	self._showImg = self._main:getChildByName("bg")
end

function DreamChallengeMainMediator:initData(data)
	self._cacheView = nil
	self._mapId = nil

	if data.mapId then
		self._mapId = data.mapId
	end

	self._pointId = nil

	if data.pointId then
		self._pointId = data.pointId
	end

	self._battleId = nil

	if data.battleId then
		self._battleId = data.battleId
	end

	self._fromBattle = false

	if data.fromBattle then
		self._fromBattle = data.fromBattle
	end

	self._treeNodes = {}
end

function DreamChallengeMainMediator:setupTopView()
	local topInfoNode = self:getView():getChildByFullName("main.topinfo")
	local currencyInfoWidget = self._systemKeeper:getResourceBannerIds("Hero_Quality")
	local currencyInfo = {}

	for i = #currencyInfoWidget, 1, -1 do
		currencyInfo[#currencyInfoWidget - i + 1] = currencyInfoWidget[i]
	end

	local config = {
		style = 1,
		currencyInfo = currencyInfo,
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		title = Strings:get("DreamChallenge_Title")
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)

	local labelWordCount = string.len(config.title) / 3

	self._main:getChildByName("infoBtn"):setPositionX(labelWordCount * 70 + 25)
end

function DreamChallengeMainMediator:onClickBack(sender, eventType)
	self:dismiss()
end

function DreamChallengeMainMediator:setMapData()
	if self._fromBattle then
		return
	end

	local mapList = self._dreamSystem:getMapIds()

	for i = 1, #mapList do
		local isShow = self._dreamSystem:checkMapShow(mapList[i])
		local isUnLock = self._dreamSystem:checkMapLock(mapList[i])
		local isPass = self._dreamSystem:checkMapPass(mapList[i])

		if isShow and isUnLock then
			if isPass then
				self._mapId = mapList[i]
				local pointIds = self._dreamSystem:getPointIds(mapList[i])
				self._pointId = pointIds[#pointIds]
			else
				local pointIds = self._dreamSystem:getPointIds(mapList[i])

				for j = 1, #pointIds do
					local isPShow = self._dreamSystem:checkPointShow(mapList[i], pointIds[j])
					local isPPass = self._dreamSystem:checkPointPass(mapList[i], pointIds[j])
					local isPUnLock = self._dreamSystem:checkPointLock(mapList[i], pointIds[j])

					if isPShow and isPUnLock and not isPPass then
						self._mapId = mapList[i]
						self._pointId = pointIds[j]

						break
					end
				end
			end
		end
	end

	assert(self._mapId ~= nil, "没有可展示的梦境塔mapId，请检查配置")
	assert(self._pointId ~= nil, "没有可展示的梦境塔pointId，请检查配置")
end

function DreamChallengeMainMediator:createTreeView()
	if self._pointTree then
		self._pointTree:setScrollBarEnabled(false)
		self._pointTree:removeAllChildren()

		self._tree = Tree:new(self._pointTree)
		local node0 = ccui.Layout:create()

		node0:setContentSize(cc.size(205, 0))
		self._tree:createRoot(node0, "root", 0, true)

		local mapList = self._dreamSystem:getMapIds()
		local firstNodeIndex = 0

		for i = 1, #mapList do
			local isShow = self._dreamSystem:checkMapShow(mapList[i])

			if isShow then
				local node = self._firstNode:clone()
				local firstNode = self._tree:addFirstLayer(node, mapList[i], 10, true)

				if firstNode then
					firstNodeIndex = firstNodeIndex + 1

					firstNode:setUserData({
						mapIndex = firstNodeIndex,
						mapId = mapList[i]
					})
					firstNode:registClickEvent(self.onMapCellClick, self)

					if self._mapId ~= mapList[i] then
						firstNode:closeList()
					end

					self._treeNodes[mapList[i]] = {
						node = firstNode,
						child = {}
					}
				end

				self:refreshMapCell(mapList[i])

				local isUnLock = self._dreamSystem:checkMapLock(mapList[i])

				if isUnLock then
					local pointIds = self._dreamSystem:getPointIds(mapList[i])

					for j = 1, #pointIds do
						local open = self._dreamSystem:checkPointShow(mapList[i], pointIds[j])

						if open then
							local node1 = self._secNode:clone()
							local secNode = self._tree:addSecondLayer(node1, firstNodeIndex, pointIds[j], 0, true)

							if secNode then
								secNode:setUserData({
									mapIndex = firstNodeIndex,
									mapId = mapList[i],
									pointId = pointIds[j]
								})
								secNode:registClickEvent(self.onPointCellClick, self)

								self._treeNodes[mapList[i]].child[pointIds[j]] = secNode
							end

							self:refreshPointCell(mapList[i], pointIds[j], secNode)
						end
					end
				end
			end
		end
	end

	if self._fromBattle then
		self:onPointClick(self._mapId, self._pointId)
	else
		self:viewShow(self._mapId, self._pointId)
	end

	local musicId = self._dreamSystem:getMapBGM(self._mapId)

	AudioEngine:getInstance():playBackgroundMusic(musicId[1])
end

function DreamChallengeMainMediator:checkPointPassViewShow()
	if self._fromBattle and self._dreamSystem:checkPointPass(self._mapId, self._pointId) then
		local data = {
			mapId = self._mapId,
			pointId = self._pointId
		}
		local view = self:getInjector():getInstance("DreamChallengePassView")

		self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, nil, data))
	end
end

function DreamChallengeMainMediator:onMapCellClick(data)
	local isLock, tip = self._dreamSystem:checkMapLock(data.mapId)

	if not isLock then
		self:dispatch(ShowTipEvent({
			duration = 0.35,
			tip = tip
		}))

		return
	end

	self._mapId = data.mapId

	if data.pointId then
		self._pointId = data.pointId
	else
		local ids = self._dreamSystem:getPointIds(self._mapId)
		self._pointId = ids[1]
	end

	self:refreshMapCell(self._mapId)
	self:refreshPointCell(self._mapId, self._pointId)
	self:viewShow(self._mapId, self._pointId)

	local musicId = self._dreamSystem:getMapBGM(self._mapId)

	AudioEngine:getInstance():playBackgroundMusic(musicId[1])
end

function DreamChallengeMainMediator:onPointCellClick(data)
	self._mapId = data.mapId
	self._pointId = data.pointId
	local mapIndex = data.mapIndex
	local rootNode = self._tree:getRootNode()
	local firstNode = rootNode:getNodeByIndex(mapIndex)

	firstNode:setUserData({
		mapIndex = mapIndex,
		mapId = self._mapId,
		pointId = self._pointId
	})
	self:refreshPointCell(self._mapId, self._pointId)
	self:viewShow(self._mapId, self._pointId)
end

function DreamChallengeMainMediator:refreshMapCell(mapId)
	local node = self._treeNodes[mapId].node:getView()
	local isLock = self._dreamSystem:checkMapLock(mapId)

	node:getChildByName("Lock"):setVisible(not isLock)

	local mapImage = ""

	for key, value in pairs(self._treeNodes) do
		local bgNode = value.node:getView()

		if key == self._mapId then
			mapImage = self._dreamSystem:getMapTabImage(key) .. "_on.png"
		else
			mapImage = self._dreamSystem:getMapTabImage(key) .. ".png"
		end

		bgNode:getChildByName("Bg"):loadTexture(mapImage, ccui.TextureResType.plistType)
	end
end

function DreamChallengeMainMediator:refreshPointCell(mapId, pointId)
	local showImg = self._dreamSystem:getPointShowImg(self._mapId, self._pointId)

	self._showImg:loadTexture("asset/scene/" .. showImg, ccui.TextureResType.localType)

	for i, v in pairs(self._treeNodes[mapId].child) do
		local view = v:getView()

		view:getChildByName("guang"):setVisible(i == self._pointId)
	end

	local node = self._treeNodes[mapId].child[pointId]:getView()
	local pointName = self._dreamSystem:getPointName(pointId)
	local pic = self._dreamSystem:getPointTabImage(mapId, pointId)

	node:getChildByName("bg"):loadTexture(pic, ccui.TextureResType.plistType)

	local lock = self._dreamSystem:checkPointLock(mapId, pointId)
	local lockTag = node:getChildByName("lock")

	lockTag:setVisible(not lock)

	local isPass = self._dreamSystem:checkPointPass(mapId, pointId)

	node:getChildByName("gou"):setVisible(isPass)
end

function DreamChallengeMainMediator:onClickCallBtn()
	self:dispatch(ShowTipEvent({
		tip = Strings:get("DreamChallenge_Function_Not_Open")
	}))
end

function DreamChallengeMainMediator:onClickHonourBtn()
	self:dispatch(ShowTipEvent({
		tip = Strings:get("DreamChallenge_Function_Not_Open")
	}))
end

function DreamChallengeMainMediator:onClickInfoBtn()
	local Rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Dream_Challenge_Rule", "content")
	local view = self:getInjector():getInstance("ExplorePointRule")

	self:dispatch(ViewEvent:new(EVT_SHOW_POPUP, view, {
		transition = ViewTransitionFactory:create(ViewTransitionType.kPopupEnter)
	}, {
		rule = Rule
	}))
end

function DreamChallengeMainMediator:viewShow(mapId, pointId)
	if self._cacheView then
		self._cacheView:removeFromParent()

		self._cacheView = nil
	end

	local view = self:getInjector():getInstance("DreamChallengeDetailView")

	if view then
		view:addTo(self._pointView):center(self._pointView:getContentSize())
		AdjustUtils.adjustLayoutUIByRootNode(view)
		view:setLocalZOrder(2)

		local mediator = self:getMediatorMap():retrieveMediator(view)

		if mediator then
			view.mediator = mediator

			mediator:setupView(self, {
				mapId = mapId,
				pointId = pointId
			})
		end

		self._cacheView = view
	end
end

function DreamChallengeMainMediator:onPointClick(mapId, pointId)
	if self._cacheView then
		self._cacheView:removeFromParent()

		self._cacheView = nil
	end

	local function enterPoint(mapId, pointId)
		local view = self:getInjector():getInstance("DreamChallengePointView")

		if view then
			view:addTo(self._pointView):center(self._pointView:getContentSize())
			AdjustUtils.adjustLayoutUIByRootNode(view)
			view:setLocalZOrder(2)

			local mediator = self:getMediatorMap():retrieveMediator(view)

			if mediator then
				view.mediator = mediator

				mediator:setupView(self, {
					mapId = mapId,
					pointId = pointId
				})
			end

			self._cacheView = view
		end
	end

	local function checkGuide(guideName)
		local storyDirector = self:getInjector():getInstance(story.StoryDirector)
		local guideAgent = storyDirector:getStoryAgent()

		guideAgent:setSkipCheckSave(false)
		guideAgent:trigger(guideName, nil, function ()
			enterPoint(mapId, pointId)
		end)
	end

	local guideData = ConfigReader:getDataByNameIdAndKey("DreamChallengePoint", pointId, "StoryLink")

	if guideData then
		local scriptName = guideData.enter

		if self._fromBattle and self._dreamSystem:checkPointPass(mapId, pointId) then
			scriptName = guideData["end"]
		end

		if type(scriptName) == "table" and #scriptName > 0 then
			checkGuide(scriptName)
		else
			enterPoint(mapId, pointId)
		end
	else
		enterPoint(mapId, pointId)
	end
end
