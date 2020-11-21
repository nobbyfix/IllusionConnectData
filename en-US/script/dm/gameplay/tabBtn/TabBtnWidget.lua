TabBtnWidget = class("TabBtnWidget", BaseWidget, _M)

function TabBtnWidget.class:createWidgetNode()
	local resFile = "asset/ui/LeftTabBtnWidget.csb"

	return cc.CSLoader:createNode(resFile)
end

function TabBtnWidget.class:createWidgetNode1()
	local resFile = "asset/ui/LeftTabBtnWidget1.csb"

	return cc.CSLoader:createNode(resFile)
end

local maxLength = 4
local kLine = {
	[1.0] = "common_bg_line01.png",
	[2.0] = "common_bg_line02.png"
}

function TabBtnWidget:initialize(view)
	super.initialize(self, view)
	self:initSubviews(view)
end

function TabBtnWidget:dispose()
	self._closeView = true

	super.dispose(self)
end

function TabBtnWidget:initSubviews(view)
	self._view = view
	self._scrollView = self._view:getChildByFullName("scrollview")

	self._scrollView:setScrollBarEnabled(false)

	self._tabClone = self._view:getChildByFullName("tabclone1")

	self._tabClone:setVisible(false)

	self._maxHeight = self._scrollView:getContentSize().height
	self._maxWidth = self._scrollView:getContentSize().height
	self._cellWidth = self._tabClone:getContentSize().width
	self._cellHeight = self._tabClone:getContentSize().height
	self._addHeight = 0
end

function TabBtnWidget:getScrollViewOffSetY()
	return self._scrollView:getInnerContainer():getPositionY()
end

function TabBtnWidget:initTabBtnData(data, style)
	self._data = data or {}
	style = style or {}
	self._style = style
	self._btnDatas = data.btnDatas or {}
	self._onClickTab = data.onClickTab
	self._hideBtnAnim = self._style.hideBtnAnim

	if data.addCellHeight then
		self._cellHeight = self._cellHeight + data.addCellHeight
		self._addHeight = data.addCellHeight
	end

	self._tabImageScale = data.tabImageScale or 1
end

function TabBtnWidget:initTabBtn(data, style)
	self:initTabBtnData(data, style)

	self._mainNode = cc.MovieClip:create("zuobiankuang_paihang")

	self._mainNode:setPlaySpeed(1.8)

	if not self._style.hideBg then
		local animNode = self._mainNode:getChildByName("bg")

		if animNode then
			-- Nothing
		end
	end

	local animNode = self._mainNode:getChildByName("btn1")

	if animNode then
		local node = self:_createTabBtns()

		node:addTo(animNode):center(animNode:getContentSize()):offset(143, -244)
	end

	self._mainNode:addEndCallback(function ()
		self._mainNode:stop()
	end)
end

function TabBtnWidget:removeTabBg()
	local animNode = self._mainNode:getChildByName("bg")

	if animNode then
		animNode:removeAllChildren()
	end
end

function TabBtnWidget:setInvalidButtons(tabBtns)
	tabBtns = tabBtns or self._tabBtns
	self._invalidButtons = {}

	for i = 1, #tabBtns do
		local btn = tabBtns[i]
		local data = self._btnDatas[i]

		if data.lock then
			self._invalidButtons[#self._invalidButtons + 1] = btn
		end
	end

	self._tabController:setInvalidButtons(self._invalidButtons)
end

function TabBtnWidget:getMainView()
	return self._mainNode
end

function TabBtnWidget:getTabBtns()
	return self._tabBtns
end

function TabBtnWidget:refreshView(data, style)
	self:initTabBtnData(data, style)
	self:refreshAllRedPoint()
	self:refreshAllLock()
	self:setInvalidButtons()
end

function TabBtnWidget:selectTabByTag(curTabType, disOnClickTab)
	self:_refrshSelectTabBtn(curTabType)

	if not disOnClickTab then
		self._tabController:selectTabByTag(curTabType)
	end
end

function TabBtnWidget:setSelectState(curTabType, isSelect)
	local tabBtn = self._tabBtns[curTabType]

	if tabBtn then
		tabBtn.btnNode:setSelectState(isSelect)
	end
end

function TabBtnWidget:refreshAllRedPoint()
	for i = 1, #self._tabBtns do
		local btn = self._tabBtns[i]
		local curIndex = self._curIndex

		if self._style.ignoreRedSelectState then
			curIndex = false
		end

		btn:refreshRedPoint(curIndex)
	end
end

function TabBtnWidget:refreshAllLock()
	for i = 1, #self._tabBtns do
		local btn = self._tabBtns[i]

		btn:refreshLockPos(self._curIndex == i)

		local config = self._btnDatas[i]

		btn:refreshLockState(config.lock)
	end
end

function TabBtnWidget:refreshAllNodePos(curTabType)
	for i = 1, #self._tabBtns do
		local tabBtn = self._tabBtns[i]

		tabBtn.btnNode:resetVisible()
		tabBtn:refreshLockPos(curTabType == i)
	end
end

function TabBtnWidget:scrollTabPanel(tag)
	if tag > 5 then
		local scrollInnerWidth = self._scrollView:getInnerContainerSize().width
		local percent = (tag - 2) * self._cellHeight / scrollInnerWidth

		self._scrollView:scrollToPercentVertical(percent * 100, 0.1, false)
	end
end

function TabBtnWidget:adjustScrollViewSize(width, height)
	local size = self._scrollView:getContentSize()
	width = width or size.width
	height = height or size.height

	self._scrollView:setContentSize(cc.size(size.width + width, height))

	self._maxWidth = size.width + width
	self._maxHeight = height
end

function TabBtnWidget:refreshSelectBtn(selectTag)
	local btn = self._tabBtns[selectTag]

	self._tabController:refreshSelectBtn(btn)
	self:_refrshSelectTabBtn(selectTag)
end

function TabBtnWidget:_setTabNormalTextEffect(text)
	text:enableOutline(cc.c4b(3, 1, 4, 51), 1)
	text:setColor(cc.c3b(110, 108, 108))
	text:enableShadow(cc.c4b(3, 1, 4, 25.5), cc.size(1, 0), 1)
end

function TabBtnWidget:_setTabPressTextEffect(text)
	text:enableOutline(cc.c4b(3, 1, 4, 51), 1)
	text:setColor(cc.c3b(101, 126, 32))
	text:enableShadow(cc.c4b(3, 1, 4, 25.5), cc.size(1, 0), 1)
end

function TabBtnWidget:_bindBtnText(btn, config)
	local tabText = config.tabText
	local tabTextTranslate = config.tabTextTranslate or ""
	local tabImage = config.tabImage or {
		"common_btn_fy1.png",
		"common_btn_fy2.png"
	}
	local fontName = config.fontName or TTF_FONT_FZYH_M
	local fontSize = config.fontSize or 30
	local fontColor = config.fontColor or nil
	local fontColorSel = config.fontColorSel or nil
	local unEnableOutline = config.unEnableOutline
	local textOffsetx = config.textOffsetx or 0
	local textOffsety = config.textOffsety or 18
	local darkText = cc.Label:createWithTTF(tabText, fontName, fontSize)

	darkText:setAnchorPoint(0.5, 0.5)

	if fontColor then
		darkText:setColor(fontColor)
	end

	if not unEnableOutline then
		darkText:enableOutline(cc.c4b(3, 1, 4, 255), 1)
	end

	darkText:setOverflow(cc.LabelOverflow.SHRINK)
	darkText:setDimensions(self._cellWidth * 0.68, self._cellHeight * 0.65)
	darkText:setAlignment(cc.TEXT_ALIGNMENT_CENTER, cc.TEXT_ALIGNMENT_CENTER)

	local lightText = cc.Label:createWithTTF(tabText, fontName, fontSize)

	if fontColorSel then
		lightText:setColor(fontColorSel)
	end

	lightText:setAnchorPoint(0.5, 0.5)

	if not unEnableOutline then
		lightText:enableOutline(cc.c4b(3, 1, 4, 255), 1)
	end

	lightText:setOverflow(cc.LabelOverflow.SHRINK)
	lightText:setDimensions(self._cellWidth * 0.68, self._cellHeight * 0.65)
	lightText:setAlignment(cc.TEXT_ALIGNMENT_CENTER, cc.TEXT_ALIGNMENT_CENTER)

	local darkTextTranslate = cc.Label:createWithTTF(tabTextTranslate, TTF_FONT_FZYH_M, 16)

	darkTextTranslate:setAnchorPoint(0.5, 0.5)
	self:_setTabNormalTextEffect(darkTextTranslate)

	local lightTextTranslate = cc.Label:createWithTTF(tabTextTranslate, TTF_FONT_FZYH_M, 16)

	lightTextTranslate:setAnchorPoint(0.5, 0.5)
	self:_setTabPressTextEffect(lightTextTranslate)

	local btnNode = cc.Node:create()

	btnNode:addTo(btn):center(btn:getContentSize()):offset(0, -10)

	btnNode.lightNode = cc.Node:create()

	btnNode.lightNode:addTo(btnNode)

	btnNode.darkNode = cc.Node:create()

	btnNode.darkNode:addTo(btnNode)

	if self._hideBtnAnim then
		local lightImg = cc.Sprite:createWithSpriteFrameName(tabImage[2])

		lightImg:setAnchorPoint(0.5, 0.5)
		lightImg:addTo(btnNode.lightNode):setScale(self._tabImageScale)
	else
		local anim = cc.MovieClip:create("chang_anniu")

		anim:setPlaySpeed(1.2)
		anim:addTo(btnNode.lightNode)
		anim:addCallbackAtFrame(21, function ()
			lightText:stopAllActions()
			lightTextTranslate:stopAllActions()
			lightText:setScale(1)
			lightTextTranslate:setOpacity(255)
		end)
		anim:addCallbackAtFrame(22, function ()
			local scaleTo1 = cc.ScaleTo:create(0.1, 1.2)
			local scaleTo2 = cc.ScaleTo:create(0.06666666666666667, 1)
			local seq = cc.Sequence:create(scaleTo1, scaleTo2)

			lightText:runAction(seq)

			local callFunc = cc.CallFunc:create(function ()
				lightTextTranslate:setOpacity(120)
			end)
			local fadeIn = cc.FadeIn:create(0.16666666666666666)
			local seq = cc.Sequence:create(callFunc, fadeIn)

			lightTextTranslate:runAction(seq)
		end)
		anim:addCallbackAtFrame(31, function ()
			anim:stop()
		end)
		anim:gotoAndStop(21)

		btnNode.anim = anim
	end

	local darkImg = cc.Sprite:createWithSpriteFrameName(tabImage[1])

	darkImg:setAnchorPoint(0.5, 0.5)
	darkImg:addTo(btnNode.darkNode):setScale(self._tabImageScale)

	function btnNode:setSelectState(isSelect)
		btnNode.lightNode:setVisible(isSelect)
		btnNode.darkNode:setVisible(not isSelect)

		if isSelect and btnNode.anim then
			btnNode.anim:gotoAndPlay(21)
		end
	end

	function btnNode:resetVisible()
		btnNode.lightNode:setVisible(false)
		btnNode.darkNode:setVisible(true)
	end

	btn.btnNode = btnNode

	lightTextTranslate:addTo(btnNode.lightNode):offset(0, 1)
	darkTextTranslate:addTo(btnNode.darkNode):offset(0, 1)
	lightText:addTo(btnNode.lightNode):offset(textOffsetx, textOffsety)
	darkText:addTo(btnNode.darkNode):offset(textOffsetx, textOffsety)
end

function TabBtnWidget:_createBtnView(btn, config)
	btn:setVisible(true)
	btn:setSwallowTouches(false)
	self:_bindBtnText(btn, config)
	self:_bindRedPoint(btn, config)
	self:_bindLockImg(btn, config)
end

function TabBtnWidget:_bindLockImg(btn, config)
	if not btn.lockImg then
		btn.lockImg = ccui.ImageView:create("asset/common/common_icon_lock.png")

		btn.lockImg:setAnchorPoint(cc.p(1, 0.5))
		btn.lockImg:addTo(btn, 1):posite(190, 56)
		btn.lockImg:setLocalZOrder(99900)
		btn.lockImg:setCascadeOpacityEnabled(false)
		btn.lockImg:setCascadeColorEnabled(false)
	end

	function btn:refreshLockState(isLock)
		btn.btnNode:setGray(isLock)

		if btn.lockImg then
			btn.lockImg:setVisible(isLock)
		end
	end

	function btn:refreshLockPos(isSelect)
	end

	btn:refreshLockState(config.lock)
end

function TabBtnWidget:_createTabBtns()
	local cellCount = #self._btnDatas
	local allHeight = cellCount * (self._cellHeight + self._addHeight) + 20
	local innerContainerHeight = math.max(allHeight, self._maxHeight)

	self._scrollView:setInnerContainerSize(cc.size(self._maxWidth, innerContainerHeight))

	local topPosY = nil

	if self._style.noCenterBtn then
		topPosY = innerContainerHeight
	else
		local diffValue = innerContainerHeight - allHeight + 20
		topPosY = innerContainerHeight - diffValue / 2
	end

	local myDrawNode = cc.DrawNode:create()
	local array = {
		cc.p(0, 0),
		cc.p(self._maxWidth, 0),
		cc.p(self._maxWidth, self._maxHeight),
		cc.p(0, self._maxHeight)
	}

	myDrawNode:drawPolygon(array, 4, cc.c4f(0, 0, 0, 0), 0, cc.c4f(0, 0, 0, 0))

	local clippingNode = cc.ClippingNode:create(myDrawNode)

	self._view:addTo(clippingNode)

	local tabBtns = {}

	for i = 1, cellCount do
		local btn = self._tabClone:clone()

		function btn:getIndex()
			return btn.index
		end

		btn.index = i

		btn:setVisible(true)

		local config = self._btnDatas[i]

		self:_createBtnView(btn, config)

		tabBtns[#tabBtns + 1] = btn
		btn.config = config

		btn:addTo(self._scrollView)
		btn:setTag(i)
		btn:setAnchorPoint(0, 1)

		local btnOffsetX = config.btnOffsetX or 0

		btn:setPosition(btnOffsetX, topPosY - 10 - (i - 1) * (self._cellHeight + self._addHeight))
	end

	self._tabBtns = tabBtns

	self:_createTabController(tabBtns)

	return clippingNode
end

function TabBtnWidget:_createTabController(tabBtns)
	local style = {
		buttonClick = function (sender, eventType, selectTag)
			self:onButtonTab(sender, eventType, selectTag)
		end
	}
	self._tabController = TabController:new(tabBtns, nil, style)

	self:setInvalidButtons()
end

function TabBtnWidget:_refrshSelectTabBtn(curTabType)
	self._curIndex = curTabType

	self:refreshAllNodePos(self._curIndex)
	self:setSelectState(self._curIndex, true)
	self:refreshAllRedPoint()
end

function TabBtnWidget:_bindRedPoint(btn, config)
	if not btn.redPoint then
		btn.redPoint = RedPoint:createDefaultNode()
		local posx = config.redPointPosx or 188
		local posy = config.redPointPosy or 88

		btn.redPoint:addTo(btn):posite(posx, posy)
		btn.redPoint:setLocalZOrder(99900)
	end

	function btn:refreshRedPoint(curIndex)
		local factor1 = config.redPointFunc and config.redPointFunc()
		local factor2 = not curIndex or curIndex and self:getTag() ~= curIndex

		self.redPoint:setVisible(factor1 and factor2)
	end
end

function TabBtnWidget:onButtonTab(sender, eventType, selectTag)
	if self._style.buttonClick then
		self._style.buttonClick(sender, eventType, selectTag)
	end

	if eventType == ccui.TouchEventType.began then
		self._scrollOffSetY = self:getScrollViewOffSetY()
	elseif eventType == ccui.TouchEventType.canceled then
		-- Nothing
	elseif eventType == ccui.TouchEventType.ended and math.abs(self._scrollOffSetY - self:getScrollViewOffSetY()) < 2 then
		local config = self._btnDatas[selectTag]

		if config.lock then
			if self._onClickTab then
				self._onClickTab(sender, selectTag)
			end

			return
		end

		if not self._style.ignoreSound then
			AudioEngine:getInstance():playEffect("Se_Click_Tab_1", false)
		else
			self._style.ignoreSound = false
		end

		if not self._style.ignoreBtnShowState then
			self._tabController:refreshSelectBtn(sender)
			self:_refrshSelectTabBtn(selectTag)
		end

		if self._onClickTab then
			self._onClickTab(sender, selectTag)
		end
	end
end
