module("story", package.seeall)

ClickNode = class("ClickNode", StageNode)

register_stage_node("Click", ClickNode)

function ClickNode:initialize(config)
	super.initialize(self, config)
end

function ClickNode:createRenderNode(config)
	local renderNode = cc.Node:create()
	self._decorate = self:createDecorate(config)

	self._decorate:getView():addTo(renderNode)
	renderNode:setVisible(false)

	return renderNode
end

function ClickNode:createDecorate(config)
	local decorate = nil
	local guideView = GuideWidget:new({
		arrowPos = 1
	})
	decorate = guideView

	return decorate
end

function ClickNode:click(clickData, clickListener)
	local style = clickData.style
	local arrowPos = clickData.arrowPos
	local targetPt = clickData.targetPt
	local clickSize = clickData.clickSize or {
		width = 300,
		height = 300
	}
	local offset = clickData.clickOffset or {
		x = 0,
		y = 0
	}
	local text = clickData.text
	local hasHand = true

	if clickData.hasHand ~= nil then
		hasHand = clickData.hasHand
	end

	self._renderNode:setVisible(true)
	self._decorate:getView():setPosition(cc.p(targetPt.x + 5, targetPt.y - 4))
	self._decorate:updateView(style, arrowPos, offset, text, hasHand)

	local clickPanel = self._decorate:getView():getChildByName("click_panel")
	self._clickPanel = clickPanel

	if clickSize then
		clickPanel:setContentSize(clickSize)
	end

	clickPanel:setPosition(cc.p(0, 0))
	clickPanel:offset(offset.x, offset.y)

	if style == "big" then
		clickPanel:setScale(3)
	else
		clickPanel:setScale(1)
	end

	clickPanel:setTouchEnabled(true)

	self._clickListener = clickListener

	local function click(sender, eventType)
		clickPanel:setContentSize({
			width = 0,
			height = 0
		})
		clickListener(sender, eventType)
	end

	clickPanel:addClickEventListener(click)
end

function ClickNode:hide()
	self._renderNode:setVisible(false)
end

ShowNode = class("ShowNode", StageNode)

register_stage_node("ShowNode", ShowNode)

function ShowNode:initialize(config)
	super.initialize(self, config)
end

function ShowNode:createRenderNode(config)
	local renderNode = ccui.Layout:create()
	local winSize = cc.Director:getInstance():getVisibleSize()

	renderNode:setContentSize(cc.size(winSize.width, winSize.height))
	renderNode:setVisible(false)

	self._renderNode = renderNode

	return renderNode
end

function ShowNode:show(args, clickListener)
	self._renderNode:stopAllActions()
	self._renderNode:removeAllChildren()
	self._renderNode:setVisible(true)
	self._renderNode:setTouchEnabled(true)
	self._renderNode:setSwallowTouches(true)

	local opacity = args.mask and args.mask.opacity or 0
	local winSize = cc.Director:getInstance():getVisibleSize()
	local maskLayer = cc.LayerColor:create(cc.c4b(0, 0, 0, 255 * opacity))

	maskLayer:setContentSize(cc.size(winSize.width, winSize.height))
	maskLayer:setTouchEnabled(true)
	maskLayer:setScale(1.2)

	local clippingNode = cc.ClippingNode:create()

	clippingNode:addTo(self._renderNode, 2)

	local stencil = cc.Node:create()

	self._renderNode:addClickEventListener(clickListener)

	local maskSize = args.maskSize
	local targetNode = args.targetNode

	if not maskSize and targetNode then
		local size = targetNode:getContentSize()
		maskSize = {
			w = size.width,
			h = size.height
		}
	end

	if args.maskRes and args.targetPt then
		local targetPt = args.targetPt
		local offset = args.clickOffset or {
			x = 0,
			y = 0
		}
		local nodeToActionMap = {}
		local image = ccui.ImageView:create(args.maskRes)
		local msSize = image:getContentSize()

		if maskSize then
			image:setScale(maskSize.w / msSize.width, maskSize.h / msSize.height)
		end

		stencil:addChild(image)
		image:setPosition(targetPt)
		image:offset(offset.x, offset.y)

		local scaleAnim = cc.MovieClip:create("suofang_yindao")

		scaleAnim:addTo(self._renderNode, 999)

		local scaleNode = scaleAnim:getChildByFullName("Image")
		local scaleImg = ccui.Scale9Sprite:createWithSpriteFrameName("zz_yindaoimage.png")

		scaleImg:setAnchorPoint(0.5, 0.5)
		scaleImg:setCapInsets(cc.rect(57, 57, 61, 61))
		scaleImg:setContentSize(cc.size(msSize.width + 20, msSize.height + 20))

		if maskSize then
			scaleImg:setContentSize(cc.size(maskSize.w + 20, maskSize.h + 20))
		end

		local actionPos = {
			x = image:getPositionX() + stencil:getPositionX() + clippingNode:getPositionX(),
			y = image:getPositionY() + stencil:getPositionY() + clippingNode:getPositionY()
		}

		scaleImg:addTo(self._renderNode, 999)
		scaleImg:setPosition(actionPos)

		nodeToActionMap[scaleImg] = scaleNode
		local startFunc, stopFunc = CommonUtils.bindNodeToActionNode(nodeToActionMap, scaleNode, true)
		local flickerAnim = cc.MovieClip:create("faguang_yindao")

		flickerAnim:addTo(self._renderNode, 999)

		local flickerNode = flickerAnim:getChildByFullName("Image")
		local flickerImg = ccui.Scale9Sprite:createWithSpriteFrameName("zg_yindaoimage.png")

		flickerImg:setAnchorPoint(0.5, 0.5)
		flickerImg:setCapInsets(cc.rect(73, 73, 49, 49))
		flickerImg:setContentSize(cc.size(msSize.width + 60, msSize.height + 60))

		local deltaOffsetX = 0
		local deltaOffsetY = 0

		if maskSize then
			local deltaW = maskSize.w >= 120 and 60 or 60 * maskSize.w / 146
			deltaOffsetX = maskSize.w >= 120 and 0 or 30 - 30 * maskSize.w / 146
			local deltaH = maskSize.h >= 120 and 60 or 60 * maskSize.h / 146
			deltaOffsetY = maskSize.h >= 120 and 0 or 30 - 30 * maskSize.h / 146

			flickerImg:setContentSize(cc.size(maskSize.w + deltaW, maskSize.h + deltaH))
		end

		flickerImg:addTo(self._renderNode, 999)
		flickerImg:setPosition(actionPos)
		flickerImg:offset(offset.x - deltaOffsetX / 2, offset.y - deltaOffsetY / 2)

		local nodeToActionMap2 = {
			[flickerImg] = flickerNode
		}
		local startFunc2, stopFunc2 = CommonUtils.bindNodeToActionNode(nodeToActionMap2, flickerNode)

		startFunc()
		scaleAnim:addCallbackAtFrame(17, function ()
			stopFunc()
			scaleAnim:setVisible(false)
			scaleImg:setVisible(false)
			startFunc2()
		end)
	end

	clippingNode:setInverted(true)
	clippingNode:addChild(maskLayer)
	clippingNode:setAlphaThreshold(0.05)
	clippingNode:setStencil(stencil)
end

function ShowNode:hide()
	self._renderNode:stopAllActions()
	self._renderNode:setVisible(false)
end

GuideTextNode = class("GuideTextNode", StageNode)

register_stage_node("GuideText", GuideTextNode)

local acitons = {
	show = GuideTextShow,
	hide = GuideTextHide
}

GuideTextNode:extendActionsForClass(acitons)

function GuideTextNode:initialize(config)
	super.initialize(self, config)
end

function GuideTextNode:createRenderNode(config)
	self._guideText = GuideText:new({})
	local renderNode = self._guideText._view

	renderNode:setVisible(false)

	return renderNode
end

function GuideTextNode:show(args)
	local renderNode = self._renderNode

	self._guideText:setupView(args)
	renderNode:setVisible(true)
end

function GuideTextNode:hide(text)
	local renderNode = self._renderNode

	renderNode:setVisible(false)
end

GuideDragLineNode = class("GuideDragLineNode", StageNode)

register_stage_node("GuideDragLine", GuideDragLineNode)

local acitons = {
	show = GuideDragLineNodeShow,
	hide = GuideDragLineNodeHide
}

GuideDragLineNode:extendActionsForClass(acitons)

function GuideDragLineNode:initialize(config)
	super.initialize(self, config)
end

function GuideDragLineNode:createRenderNode(config)
	self._maskLayerListener = nil
	local winSize = cc.Director:getInstance():getVisibleSize()
	local renderNode = cc.Node:create()

	renderNode:setContentSize(winSize)

	local touchLayer = ccui.Layout:create()

	touchLayer:setAnchorPoint(cc.p(0.5, 0.5))
	touchLayer:addTo(renderNode, 2):center(renderNode:getContentSize())
	touchLayer:setContentSize(cc.size(winSize.width, winSize.height))
	touchLayer:setTouchEnabled(false)

	self._touchLayer = touchLayer
	self._guideDrag = GuideDrag:new({})
	local dragView = self._guideDrag._view

	dragView:addTo(renderNode, 3):center(renderNode:getContentSize())
	renderNode:setVisible(false)

	return renderNode
end

function GuideDragLineNode:show(args)
	local renderNode = self._renderNode
	local beginPos = args.beginPos
	local endPos = args.endPos
	local arrowOffset = args.arrowOffset or cc.p(0, 0)

	self._guideDrag:setupView(args)

	local dragView = self._guideDrag._view

	dragView:setPosition(cc.p(beginPos.x + arrowOffset.x, beginPos.y + arrowOffset.y))

	local rotation = args.rotation or 0

	if args.autoRotation then
		local angle = math.deg(math.atan2(endPos.y - beginPos.y, endPos.x - beginPos.x))
		rotation = 90 - angle
	end

	dragView:setRotation(rotation)

	local touchLayer = self._touchLayer

	if args.listener then
		self._maskLayerListener = args.listener

		touchLayer:setTouchEnabled(true)
		touchLayer:addTouchEventListener(function (sender, eventType)
			if self._maskLayerListener then
				self._maskLayerListener(sender, eventType)
			end
		end)
	else
		touchLayer:setTouchEnabled(false)

		self._maskLayerListener = nil
	end

	renderNode:setVisible(true)
end

function GuideDragLineNode:hide()
	self._touchLayer:setTouchEnabled(false)

	local renderNode = self._renderNode

	renderNode:setVisible(false)
end

GuiderNode = class("GuiderNode", StageNode)

register_stage_node("Guider", GuiderNode)

local acitons = {
	say = GuiderSay,
	hide = GuiderHide
}

GuiderNode:extendActionsForClass(acitons)

function GuiderNode:initialize(config)
	super.initialize(self, config)
end

function GuiderNode:createRenderNode(config)
	local resFile = "asset/ui/GuiderWidget.csb"
	local renderNode = cc.CSLoader:createNode(resFile)

	renderNode:setContentSize(cc.size(495, 238))
	renderNode:setVisible(false)

	local anim = cc.MovieClip:create("yindaoyuan_zhandouyindao")

	anim:setTag(1193046)
	anim:addTo(renderNode):posite(-100, 220)

	local animText = anim:getChildByName("text")
	local animName = anim:getChildByName("name")
	local animImage = anim:getChildByName("image")
	local content = renderNode:getChildByFullName("content_text")
	local name = renderNode:getChildByName("name")
	local image = renderNode:getChildByName("model")

	image:ignoreContentAdaptWithSize(true)
	content:changeParent(animText):center(animName:getContentSize()):offset(0, -15)
	name:changeParent(animName):center(animName:getContentSize()):offset(-3, 0)
	image:changeParent(animImage):center(animImage:getContentSize()):offset(30, 10)
	content:setTextAreaSize(cc.size(210, 60))

	renderNode.content = content
	renderNode.name = name
	renderNode.image = image

	return renderNode
end

function GuiderNode:say(guider, content, nameStr, audio, callback)
	local renderNode = self._renderNode

	renderNode:setVisible(true)

	self._callback = callback
	local anim = renderNode:getChildByTag(1193046)

	if anim then
		if content then
			local contentText = renderNode.content

			contentText:setString(Strings:get(content))
		end

		if nameStr then
			local name = renderNode.name

			name:setString(Strings:get(nameStr))
		end

		if guider then
			local guiderImage = renderNode.image

			guiderImage:loadTexture("asset/story/" .. guider)
		end

		anim:gotoAndPlay(1)
		anim:addCallbackAtFrame(16, function (cid, mc)
			if self._callback then
				self._callback()

				self._callback = nil
			end
		end)
		anim:addEndCallback(function (cid, mc)
			mc:stop()
		end)
	end
end

function GuiderNode:hide()
	self._renderNode:setVisible(false)
end

GuideEnterBattleAnim = class("GuideEnterBattleAnim", StageNode)

register_stage_node("GuideEnterBattleAnim", GuideEnterBattleAnim)

local acitons = {
	play = GuideEnterBattleAnimPlay
}

GuideEnterBattleAnim:extendActionsForClass(acitons)

function GuideEnterBattleAnim:initialize(config)
	super.initialize(self, config)
end

function GuideEnterBattleAnim:createRenderNode(config)
	local renderNode = ccui.Layout:create()

	renderNode:setContentSize(cc.size(1386, 852))
	renderNode:setAnchorPoint(0.5, 0.5)
	renderNode:setVisible(false)

	return renderNode
end

function GuideEnterBattleAnim:play(callback)
	self._renderNode:setVisible(true)

	if callback then
		callback()
	end
end

function GuideEnterBattleAnim:hide()
	self._renderNode:setVisible(false)
end

GuidePopViewAnim = class("GuidePopViewAnim", StageNode)

register_stage_node("GuidePopViewAnim", GuidePopViewAnim)

local acitons = {
	play = GuidePopViewPlay
}

GuidePopViewAnim:extendActionsForClass(acitons)

function GuidePopViewAnim:initialize(config)
	super.initialize(self, config)
end

function GuidePopViewAnim:createRenderNode(config)
	local renderNode = ccui.Layout:create()

	renderNode:setContentSize(cc.size(1386, 852))
	renderNode:setAnchorPoint(0.5, 0.5)
	renderNode:setVisible(false)

	return renderNode
end

function GuidePopViewAnim:play(callback)
	self._renderNode:setVisible(true)

	if callback then
		callback()
	end
end

function GuidePopViewAnim:hide()
	self._renderNode:setVisible(false)
end
