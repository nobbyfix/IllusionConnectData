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
