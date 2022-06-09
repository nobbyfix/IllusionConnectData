MazeTowerFinishMediator = class("MazeTowerFinishMediator", DmPopupViewMediator, _M)

MazeTowerFinishMediator:has("_mazeTowerSystem", {
	is = "r"
}):injectWith("MazeTowerSystem")

function MazeTowerFinishMediator:initialize()
	super.initialize(self)
end

function MazeTowerFinishMediator:dispose()
	super.dispose(self)
end

function MazeTowerFinishMediator:onRegister()
	super.onRegister(self)

	self._main = self:getView():getChildByName("main")
end

function MazeTowerFinishMediator:enterWithData(data)
	local anim = cc.MovieClip:create("dhb_tiaozhanjieshu")

	anim:addTo(self._main):center(self._main:getContentSize())

	local titleNode = anim:getChildByName("title")
	local titleImg = ccui.ImageView:create("zyfb_tzjs2.png", 1)

	titleImg:addTo(titleNode):center(titleNode:getContentSize())
	anim:addCallbackAtFrame(30, function ()
		anim:stop()
	end)
	anim:addEndCallback(function ()
		BattleLoader:popBattleView(self, {})
	end)

	self._anim = anim
end

function MazeTowerFinishMediator:onTouchMaskLayer()
	if self._animPlay then
		return
	end

	self._anim:gotoAndPlay(31)

	self._animPlay = true
end
