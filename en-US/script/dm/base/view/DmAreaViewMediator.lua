DmAreaViewMediator = class("DmAreaViewMediator", AreaViewMediator, _M)

function DmAreaViewMediator:initialize()
	super.initialize(self)

	self._spinePool = SpineResManager.pushReleasePool()
end

function DmAreaViewMediator:dispose()
	SpineResManager.popReleasePool(self._spinePool)
	super.dispose(self)
end

function DmAreaViewMediator:adjustLayout(targetFrame)
	self._view:setContentSize(CC_DESIGN_RESOLUTION)
	tolua.cast(self._view, "cc.Layer")
	self._view:onTouch(function ()
		return true
	end, false, true)
	AdjustUtils.adjustLayoutUIByRootNode(self._view)
end

function DmAreaViewMediator:adaptBackground(node, targetWorldRect, anchorPt)
	if not node then
		return
	end

	local parent = node:getParent()
	local visibleSize = cc.Director:getInstance():getVisibleSize()
	local tmpTargetWorldRect = setmetatable({}, {
		__index = targetWorldRect
	})

	if parent then
		local worldToNodePoint = parent:convertToNodeSpace(cc.p(tmpTargetWorldRect.x or 0, tmpTargetWorldRect.y or 0))
		tmpTargetWorldRect.x = worldToNodePoint.x
		tmpTargetWorldRect.y = worldToNodePoint.y

		if targetWorldRect and targetWorldRect.width and targetWorldRect.height then
			tmpTargetWorldRect.width = targetWorldRect.width or visibleSize.width
			tmpTargetWorldRect.height = targetWorldRect.height or visibleSize.height
		else
			tmpTargetWorldRect.width = visibleSize.width
			tmpTargetWorldRect.height = visibleSize.height
		end
	end

	node:coverRegion(tmpTargetWorldRect, anchorPt)
end
