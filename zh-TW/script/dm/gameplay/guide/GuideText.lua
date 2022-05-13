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
	contentText:setAnchorPoint(cc.p(0, 0))
	contentText:addTo(labelNode)
	contentText:renderContent(labelNodeSize.width, 0, true)

	local textbg1 = view:getChildByName("textbg1")
	local textbg2 = view:getChildByName("textbg2")
	local textbg3 = view:getChildByName("textbg3")

	textbg1:setVisible(false)
	textbg2:setVisible(false)
	textbg3:setVisible(false)

	local fontHight = contentText:getContentSize().height

	if fontHight > 40 then
		textbg2:setVisible(true)
		contentText:setPositionY(textbg2:getPositionY() - 50)
	else
		textbg1:setVisible(true)
		contentText:setPositionY(textbg1:getPositionY() - 18)
	end

	if fontHight > 80 then
		textbg1:setVisible(false)
		textbg2:setVisible(false)

		local bgSize = textbg3:getContentSize()

		textbg3:setContentSize(cc.size(bgSize.width, fontHight + 80))
		textbg3:setVisible(true)
		contentText:setAnchorPoint(cc.p(0, 1))
		contentText:setPositionY(textbg3:getPositionY() + 15)
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
