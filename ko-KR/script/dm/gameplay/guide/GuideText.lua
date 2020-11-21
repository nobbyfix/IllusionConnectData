GuideText = class("GuideText", BaseWidget, _M)
local SHOW_DIR = {
	DOWN_L = 2,
	UP_R = 1,
	UP_L = 0,
	MID_L = 3
}

function GuideText:initialize(data)
	local resFile = "asset/ui/GuideText.csb"
	self._view = cc.CSLoader:createNode(resFile)

	self:setupView(data)
	super.initialize(self, self._view)
end

function GuideText:dispose()
	super.dispose(self)
end

function GuideText:setupView(data)
	local view = self._view
	local heroId = data.heroId or "ZTXChang"
	local headImgName = "guideText_" .. heroId .. ".png"
	local headbg = view:getChildByName("headbg")
	local iamge_say = headbg:getChildByFullName("Panel_1.Image_say")

	iamge_say:loadTexture(headImgName, ccui.TextureResType.plistType)

	local labelNode = view:getChildByFullName("content_label")

	labelNode:removeAllChildren()

	local labelNodeSize = labelNode:getContentSize()
	local text = Strings:get(data.text, {
		fontName = TTF_FONT_STORY
	}) or ""
	local contentText = ccui.RichText:createWithXML(text, {})

	contentText:setWrapMode(1)
	contentText:ignoreContentAdaptWithSize(false)
	contentText:setAnchorPoint(cc.p(0, 1))
	contentText:addTo(labelNode)
	contentText:renderContent(labelNodeSize.width, 0, true)

	local textbg1 = view:getChildByName("textbg1")
	local textbg2 = view:getChildByName("textbg2")

	textbg1:setVisible(true)
	textbg2:setVisible(false)

	local fontHight = contentText:getContentSize().height

	if fontHight > 70 then
		textbg1:setContentSize(textbg1:getContentSize().width, 182)
	elseif fontHight > 40 then
		textbg1:setContentSize(textbg1:getContentSize().width, 143)
	else
		textbg1:setContentSize(textbg1:getContentSize().width, 107)
	end

	local dir = data.dir or SHOW_DIR.UP_L
	local winSize = cc.Director:getInstance():getVisibleSize()
	local viewPos = cc.p(winSize.width * 0.105, winSize.height * 0.75)
	local posNode = view:getChildByName("headbg_pos1")

	if SHOW_DIR.UP_R == dir then
		viewPos.x = winSize.width * 0.12
		posNode = view:getChildByName("headbg_pos2")
	elseif SHOW_DIR.DOWN_L == dir then
		viewPos.y = winSize.height * 0.2
	elseif SHOW_DIR.MID_L == dir then
		viewPos.y = winSize.height * 0.5
	end

	view:setPosition(viewPos)
	headbg:setPosition(posNode:getPosition())
end
