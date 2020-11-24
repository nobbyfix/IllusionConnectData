require("dm.gameplay.popup.PopupBgWidget")
require("dm.gameplay.popup.PopupNormalWidget")

DmPopupViewMediator = class("DmPopupViewMediator", PopupViewMediator)

DmPopupViewMediator:has("_bgWidget", {
	is = "rw"
})

local BgWidgetArr = {
	middle = PopupMiddleBgWidget,
	small = PopupSmallBgWidget
}

function DmPopupViewMediator:initialize()
	super.initialize(self)

	self._hasEnterAnim = false
end

function DmPopupViewMediator:dispose()
	self._hasEnterAnim = nil

	super.dispose(self)
end

function DmPopupViewMediator:setupBgWidget(bgNode, style, params)
	local config = {
		btnHandler = params.btnHandler,
		title = params.title,
		upperCharCount = params.upperCharCount,
		bgNew = params.bgNew,
		showDiImg = params.showDiImg,
		showAnim = params.showAnim,
		height = params.height
	}
	local injector = self:getInjector()
	local widget = BgWidgetArr[style]

	assert(widget ~= nil, "style " .. style .. " not exists!")

	self._bgWidget = injector:injectInto(widget:new(bgNode))

	self._bgWidget:updateView(config)
	self:autoManageObject(self._bgWidget)

	return self._bgWidget
end

function DmPopupViewMediator:didFinishEnterTransition(transition)
	self._hasEnterAnim = transition and true or false

	if self._bgWidget and self._bgWidget.playAnim then
		self._bgWidget:playAnim()
	end
end

function DmPopupViewMediator:adjustLayout(targetFrame)
	self:getView():setContentSize(CC_DESIGN_RESOLUTION)
	AdjustUtils.adjustLayoutUIByRootNode(self:getView())
end

function DmPopupViewMediator:close(data)
	if self._isOnclose then
		return
	end

	self._isOnclose = true
	local options = nil

	if self._hasEnterAnim then
		options = options or {}
		options.transition = ViewTransitionFactory:create(ViewTransitionType.kPopupExit)
	end

	if self._backBtnAnim and false then
		local blockUIPanel = ccui.Layout:create()

		blockUIPanel:setTouchEnabled(true)
		blockUIPanel:setContentSize(cc.size(1386, 852))
		blockUIPanel:setAnchorPoint(cc.p(0.5, 0.5))
		self:getView():addChild(blockUIPanel, 20000)
		blockUIPanel:center(self:getView():getContentSize())
		self._backBtnAnim:addCallbackAtFrame(88, function ()
			if data and data.callback then
				data.callback()
			end

			self._backBtnAnim:stop()
			self:closeWithOptions(options, data)
		end)
		self._backBtnAnim:setPlaySpeed(2.3)
		self._backBtnAnim:gotoAndPlay(79)
	else
		if data and data.callback then
			data.callback()
		end

		self:closeWithOptions(options, data)
	end
end

function DmPopupViewMediator:onTouchMaskLayer()
	AudioEngine:getInstance():playEffect("Se_Click_Close_2", false)
	self:close()
end
