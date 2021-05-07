PageViewUtil = class("PageViewUtil", objectlua.Object)

function PageViewUtil:initialize(data)
	super.initialize(self)

	self._view = data.view
	self._delegate = data.delegate
	self._pageNum = self._delegate:getPageNum()
	self._viewSize = self._view:getContentSize()
	self._innerContainerSize = cc.size(self._viewSize.width * 3, self._viewSize.height * 3)

	self._view:setInnerContainerSize(self._innerContainerSize)
	self._view:setBounceEnabled(false)
	self._view:setScrollBarEnabled(false)
	self._view:setInertiaScrollEnabled(false)
	self._view:setClippingEnabled(true)
	self._view:setDirection(ccui.ScrollViewDir.horizontal)

	self._baseLayoutArray = self:initBaseLayout()
	self._curPageIndex = 1
	self._pageDirty = true
	self._speed = 600

	self._view:setInnerContainerPosition(cc.p(-self._viewSize.width, 0))
	self._view:setTouchEnabled(false)

	self._dragging = false
	self._ratio = 0.5

	self._view:addEventListener(function (sender, eventType)
		if ccui.ScrollviewEventType.autoscrollEnded == eventType then
			performWithDelay(self._view, function ()
				self._view:setTouchEnabled(true)
				self:refreshPage()
			end, 0)
		end
	end)

	local function onTouched(touch, event)
		if not self._view:isTouchEnabled() then
			return
		end

		if tolua.isnull(self._view) then
			return
		end

		local eventType = event:getEventCode()

		if eventType == ccui.TouchEventType.began then
			self._dragging = true
		end

		if eventType == ccui.TouchEventType.ended or eventType == ccui.TouchEventType.canceled then
			self._dragging = false

			self:dealTouchEnd()
		end

		return true
	end

	local listener = cc.EventListenerTouchOneByOne:create()

	listener:setSwallowTouches(false)
	listener:registerScriptHandler(onTouched, cc.Handler.EVENT_TOUCH_BEGAN)
	listener:registerScriptHandler(onTouched, cc.Handler.EVENT_TOUCH_MOVED)
	listener:registerScriptHandler(onTouched, cc.Handler.EVENT_TOUCH_ENDED)
	listener:registerScriptHandler(onTouched, cc.Handler.EVENT_TOUCH_CANCELLED)
	self._view:getEventDispatcher():addEventListenerWithFixedPriority(listener, -9999)
	self._view:registerScriptHandler(function (actionType)
		if actionType == "exit" then
			self._view:getEventDispatcher():removeEventListener(listener)
		end
	end)
end

function PageViewUtil:setRatioOfTriggerScroll(ratio)
	self._ratio = ratio
end

function PageViewUtil:setOffsetOfTriggerScroll(offset)
	self._ratio = offset / self._viewSize.width
end

function PageViewUtil:reloadData()
	self._pageNum = self._delegate:getPageNum()

	if self._pageNum > 1 then
		self._view:setVisible(true)
		self._view:setTouchEnabled(true)
	elseif self._pageNum == 1 then
		self._view:setVisible(true)
		self._view:setTouchEnabled(false)
	else
		self._view:setVisible(false)

		return
	end

	self._curPageIndex = 1
	self._pageDirty = true

	self:refreshPage()
end

function PageViewUtil:setCurPageIndex(index)
	local targetIdx = self:adjustIndex(index)

	if targetIdx == self._curPageIndex then
		return
	end

	self._curPageIndex = targetIdx

	self:refreshPageForce()
end

function PageViewUtil:scrollToDirection(dir, time)
	if self._dragging then
		return
	end

	local posX = self._view:getInnerContainerPosition().x
	local moveDistance = 0
	local moveTo = self._viewSize.width

	if dir > 0 then
		moveTo = self._viewSize.width * 2
	elseif dir < 0 then
		moveTo = 0
	end

	moveDistance = math.abs(moveTo - math.abs(posX))

	if moveDistance == 0 then
		self:refreshPage()

		return
	end

	self._view:scrollToPercentHorizontal(moveTo / (self._viewSize.width * 2) * 100, time or moveDistance / self._speed, true)
end

function PageViewUtil:adjustIndex(index)
	if index == 0 then
		index = self._pageNum
	end

	if index < 0 then
		index = self._pageNum + 1 + index
	end

	if self._pageNum < index then
		index = 1
	end

	return index
end

function PageViewUtil:dealTouchEnd()
	local posX = self._view:getInnerContainerPosition().x
	local moveDistance = 0
	local moveTo = self._viewSize.width

	if posX < -self._viewSize.width * (1 + self._ratio) then
		moveTo = self._viewSize.width * 2
	elseif posX > -self._viewSize.width * (1 - self._ratio) then
		moveTo = 0
	else
		moveTo = self._viewSize.width
	end

	moveDistance = math.abs(moveTo - math.abs(posX))

	if moveDistance == 0 then
		self:refreshPage()

		return
	end

	self._view:scrollToPercentHorizontal(moveTo / (self._viewSize.width * 2) * 100, moveDistance / self._speed, true)
end

function PageViewUtil:initBaseLayout()
	local array = {}

	for i = 0, 2 do
		local baseLayout = ccui.Layout:create()

		baseLayout:setTouchEnabled(true)
		baseLayout:setContentSize(self._viewSize)
		baseLayout:setPosition(i * self._viewSize.width, 0)
		baseLayout:addTouchEventListener(function (sender, eventType)
			if eventType == ccui.TouchEventType.ended and self._delegate.pageTouchedAtIndex then
				local dataIndex = self:adjustIndex(self._curPageIndex + i - 1)

				self._delegate:pageTouchedAtIndex(dataIndex)
			end
		end)
		self._view:addChild(baseLayout)

		array[i + 1] = baseLayout
	end

	return array
end

function PageViewUtil:_cleanPages()
	for i = 1, 3 do
		self._baseLayoutArray[i]:removeAllChildren()
	end
end

function PageViewUtil:refreshPage()
	local posX = self._view:getInnerContainerPosition().x
	local targetIndex = self._curPageIndex
	local moveTo = self._viewSize.width

	if posX < -self._viewSize.width * 1.5 then
		targetIndex = targetIndex + 1
	elseif posX > -self._viewSize.width * 0.5 then
		targetIndex = targetIndex - 1
	else
		moveTo = self._viewSize.width
	end

	targetIndex = self:adjustIndex(targetIndex)

	if self._curPageIndex ~= targetIndex then
		self._pageDirty = true
		self._curPageIndex = targetIndex
	end

	self._view:setInnerContainerPosition(cc.p(-self._viewSize.width, 0))

	if not self._pageDirty then
		return
	end

	self._pageDirty = false
	local leftIndex = self:adjustIndex(self._curPageIndex - 1)
	local midIndex = self._curPageIndex
	local rightIndex = self:adjustIndex(self._curPageIndex + 1)

	self:_cleanPages()

	local leftNode = self._delegate:getPageByIndex(leftIndex)
	local midNode = self._delegate:getPageByIndex(midIndex)
	local rightNode = self._delegate:getPageByIndex(rightIndex)

	self._baseLayoutArray[1]:addChild(leftNode)
	self._baseLayoutArray[2]:addChild(midNode)
	self._baseLayoutArray[3]:addChild(rightNode)

	if self._delegate.flipEndCallBack then
		self._delegate:flipEndCallBack(midNode, self._curPageIndex)
	end
end

function PageViewUtil:refreshPageForce()
	self._view:setInnerContainerPosition(cc.p(-self._viewSize.width, 0))

	local leftIndex = self:adjustIndex(self._curPageIndex - 1)
	local midIndex = self._curPageIndex
	local rightIndex = self:adjustIndex(self._curPageIndex + 1)

	self:_cleanPages()

	local leftNode = self._delegate:getPageByIndex(leftIndex)
	local midNode = self._delegate:getPageByIndex(midIndex)
	local rightNode = self._delegate:getPageByIndex(rightIndex)

	self._baseLayoutArray[1]:addChild(leftNode)
	self._baseLayoutArray[2]:addChild(midNode)
	self._baseLayoutArray[3]:addChild(rightNode)

	if self._delegate.flipEndCallBack then
		self._delegate:flipEndCallBack(midNode, self._curPageIndex)
	end
end
