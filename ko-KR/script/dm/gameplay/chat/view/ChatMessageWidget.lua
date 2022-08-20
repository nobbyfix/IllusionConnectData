local kMaxPlayerContentWidth = 450
local kMaxSystemContentWidth = 668
local kDefaultBubbleWidth = 80
local kDefaultBubbleHeight = 66

local function openUrlView(url, injector, extraData, param)
	if url then
		local context = injector:instantiate(URLContext)
		local entry, params = UrlEntryManage.resolveUrlWithUserData(url)

		if entry then
			params.extraData = param

			entry:response(context, params)
		end
	end
end

local emoticonImageRation = 0.5
PlayerMessageWidget = class("PlayerMessageWidget", BaseWidget, _M)

PlayerMessageWidget:has("_eventDispatcher", {
	is = "r"
}):injectWith("legs_sharedEventDispatcher")
PlayerMessageWidget:has("_chatSystem", {
	is = "r"
}):injectWith("ChatSystem")

function PlayerMessageWidget:initialize(view)
	super.initialize(self, view)

	self._main = view:getChildByFullName("main")
	self._mainPanel = self._main:getChildByName("Text_panel")

	self._mainPanel:setSwallowTouches(false)
end

function PlayerMessageWidget:dispose()
	super.dispose(self)
end

function PlayerMessageWidget:isRichText(string)
	local str = "<font"
	local count = string:find(str)

	if count ~= nil then
		return true
	else
		return false
	end
end

function PlayerMessageWidget:decorateView(message, senderInfo, parent)
	self._message = message
	self._parentMediator = parent
	local bubble = self._main:getChildByFullName("Text_panel.bubble")
	local contentRect = self._main:getChildByFullName("Text_panel.bubble.content_rect")
	local initBubble = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Bubble_Init", "content")
	local bubbleWidth = kDefaultBubbleWidth
	local bubbleheight = kDefaultBubbleHeight

	if senderInfo.chatBubble and senderInfo.chatBubble ~= "" and senderInfo.chatBubble ~= initBubble then
		local config = ConfigReader:getRecordById("ChatBubble", senderInfo.chatBubble)
		local path = "asset/ui/chatBubble/" .. config.Icon .. ".png"
		local parent = bubble:getParent()
		local x, y = bubble:getPosition()
		local ch = bubble:getAnchorPoint()

		contentRect:removeFromParent()
		bubble:removeFromParent()

		bubble = ccui.ImageView:create(path)

		bubble:addTo(parent):posite(x, y):setName("bubble")
		bubble:setAnchorPoint(ch)

		bubbleWidth = bubble:getContentSize().width
		bubbleheight = bubble:getContentSize().height

		contentRect:addTo(bubble):setName("content_rect")
	end

	bubble:setScale9Enabled(true)
	bubble:setCapInsets(cc.rect(45, 37, 1, 1))

	local content = message:getContent()
	local contentText = self._main:getChildByFullName("content_text")

	if self:isRichText(content) then
		if contentText == nil then
			contentText = ccui.RichText:createWithXML(content, {})

			contentText:setTouchEnabled(true)
			contentText:setSwallowTouches(false)
			contentText:setWrapMode(1)
			contentText:setAnchorPoint(contentRect:getAnchorPoint())
			contentText:addTo(contentRect:getParent()):posite(contentRect:getPosition()):offset(6, 0):setName("content_text")
			contentText:setOpenUrlHandler(function (url)
				openUrlView(url, self:getInjector(), message:getExtraData(), message:getParams())
			end)
			contentText:setFontSize(18)
			contentText:setFontColor("#343434")
		else
			contentText:setString(content)
		end

		contentText:renderContent()

		local size = contentText:getContentSize()
		local realWidth = math.min(size.width, kMaxPlayerContentWidth)

		contentText:renderContent(realWidth, 0, true)

		self._contentText = contentText
	else
		if contentText == nil then
			contentText = cc.Label:createWithTTF(xmlUnescape(content), TTF_FONT_FZYH_R, 18)

			contentText:setAnchorPoint(contentRect:getAnchorPoint())
			contentText:addTo(contentRect:getParent()):posite(contentRect:getPosition()):offset(7, 0):setName("content_text")
			contentText:setColor(cc.c3b(52, 52, 52))
			contentText:setOverflow(cc.LabelOverflow.CLAMP)
		else
			contentText:setString(content)
		end

		local size = contentText:getContentSize()
		local realWidth = math.min(size.width, kMaxPlayerContentWidth)

		if kMaxPlayerContentWidth < size.width then
			contentText:setDimensions(realWidth, 0)
		end

		self._contentText = contentText
	end

	local realSize = self._contentText:getContentSize()
	local setBubbleSizeX = bubbleWidth < realSize.width + 40 and realSize.width + 40 or bubbleWidth
	local setBubbleSizeY = bubbleheight < realSize.height + 40 and realSize.height + 40 or bubbleheight

	bubble:setContentSize(setBubbleSizeX, setBubbleSizeY)
	contentText:setPositionY(setBubbleSizeY * 0.5)

	if senderInfo then
		self._senderInfo = senderInfo
		local headRect = self._main:getChildByFullName("head_rect")
		local head, oldIcon = IconFactory:createPlayerIcon({
			headFrameScale = 0.4,
			id = senderInfo.headImg,
			size = cc.size(82, 82),
			headFrameId = senderInfo.headFrame
		})

		oldIcon:setScale(0.4)

		if head then
			head:setScale(0.9)
			head:addTo(headRect):center(headRect:getContentSize())
			head:setTouchEnabled(true)
			head:setSwallowTouches(false)

			local function callFunc(sender, eventType)
				self:onClickHead(senderInfo, sender)
			end

			mapButtonHandlerClick(nil, head, {
				func = callFunc
			})
		end

		local textlevel = self._main:getChildByFullName("text_lv")
		local playerlevel = senderInfo.level

		textlevel:setString("lv." .. playerlevel)
		textlevel:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

		local nameText = self._main:getChildByFullName("Text_panel.name_text")

		nameText:setString(senderInfo.nickname or "")
		nameText:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

		local textPanel = self._main:getChildByName("Text_panel")
		local titleIcon = textPanel:getChildByName("title")

		if titleIcon then
			titleIcon:removeFromParent()
		end

		local title = senderInfo.title

		if title ~= nil and title ~= "" then
			titleIcon = IconFactory:createTitleIcon({
				id = title
			})

			titleIcon:addTo(textPanel):setName("title")
			titleIcon:setScale(0.57)

			if self:getChatSystem():isMySend(message) then
				titleIcon:posite(nameText:getPositionX() - nameText:getContentSize().width - 38, nameText:getPositionY() + 15)
			else
				titleIcon:posite(nameText:getPositionX() + nameText:getContentSize().width + 42, nameText:getPositionY() + 15)
			end
		end

		local vipNode = self._main:getChildByFullName("Text_panel.vipnode")
		local vipLevel = senderInfo.vipLevel or 0
		self._playerVipWidget = self:getInjector():injectInto(PlayerVipWidget:new(vipNode))

		self._playerVipWidget:updateView(vipLevel)

		local nameTextX = nameText:getPositionX()
		local nameTextWidth = nameText:getContentSize().width
		local widthTrim = vipLevel > 9 and 85 or 75
		local setX = nameTextX > 0 and 328 - nameTextWidth - widthTrim or nameTextWidth

		vipNode:setPositionX(setX)
	end

	local mainSize = self._main:getContentSize()
	local msgLine = math.modf(realSize.height / 24)

	self._view:setContentSize(mainSize.width, setBubbleSizeY + 35)
	self._main:posite(0, self._view:getContentSize().height)
	self:createEmotionView(message, senderInfo, parent)
end

function PlayerMessageWidget:createEmotionView(message, senderInfo, parent)
	local bubble = self._main:getChildByFullName("Text_panel.bubble")
	local emotion = self._main:getChildByFullName("Text_panel.emotion")

	bubble:setVisible(true)
	emotion:setVisible(false)

	if message.getEmotionId and message:getEmotionId() then
		if self._chatSystem.getEmotionDataById and self._chatSystem:getEmotionDataById(message:getEmotionId()) then
			bubble:setVisible(false)
			emotion:setVisible(true)

			local d = self._chatSystem:getEmotionDataById(message:getEmotionId())
			local path = string.format("asset/emotion/%s.png", d.Icon)

			emotion:getChildByFullName("img"):loadTexture(path)
			self._view:setContentSize(self._view:getContentSize().width, self._view:getContentSize().height + 50)
			self._main:posite(0, self._view:getContentSize().height)
		else
			self._contentText:setString(Strings:get("Emoji_NoFind"))
		end
	end
end

function PlayerMessageWidget:onClickHead(senderInfo, sender)
	local function callFuncMsg()
		local friendSystem = self:getInjector():getInstance(FriendSystem)

		local function gotoView(response)
			local record = BaseRankRecord:new()

			record:synchronize({
				headImage = senderInfo.headImg,
				headFrame = senderInfo.headFrame,
				rid = senderInfo.id,
				level = senderInfo.level,
				nickname = senderInfo.nickname,
				vipLevel = senderInfo.vipLevel,
				combat = senderInfo.combat,
				slogan = senderInfo.slogan,
				master = senderInfo.master,
				heroes = senderInfo.heroes,
				clubName = senderInfo.clubName,
				online = senderInfo.online,
				offlineTime = senderInfo.offlineTime,
				isFriend = response.isFriend,
				close = response.close,
				gender = senderInfo.gender,
				city = senderInfo.city,
				birthday = senderInfo.birthday,
				tags = senderInfo.tags,
				block = response.block,
				leadStageId = senderInfo.leadStageId,
				leadStageLevel = senderInfo.leadStageLevel,
				title = senderInfo.title
			})
			friendSystem:showFriendPlayerInfoView(record:getRid(), record)
		end

		friendSystem:requestSimpleFriendInfo(senderInfo.id, function (response)
			gotoView(response)
		end)
	end

	callFuncMsg()
end

SystemMsgLabelType = {
	kSelf = 2,
	kSystem = 1,
	kTeam = 3,
	kMogul = 6,
	kFight = 8,
	kEmperor = 7,
	kUnion = 4,
	kWorld = 5
}
SystemMsgLabelMap = {
	[SystemMsgLabelType.kSystem] = {
		rtColor = "FFE1C9",
		pic = "liaotian_bg_xt.png",
		text = Strings:get("Chat_Label_System"),
		color = cc.c4b(227, 76, 76, 255),
		titleColor = cc.c4b(255, 225, 201, 255)
	},
	[SystemMsgLabelType.kSelf] = {
		rtColor = "cdeb93",
		pic = "liaotian_bg_gr.png",
		text = Strings:get("Chat_Label_Self"),
		color = cc.c4b(111, 210, 98, 255),
		titleColor = cc.c4b(205, 235, 147, 255)
	},
	[SystemMsgLabelType.kTeam] = {
		rtColor = "EEBEBE",
		pic = "liaotian_bg_dw.png",
		text = Strings:get("Chat_Label_Team"),
		color = cc.c4b(95, 181, 247, 255),
		titleColor = cc.c4b(238, 190, 190, 255)
	},
	[SystemMsgLabelType.kUnion] = {
		rtColor = "EDEEBE",
		pic = "liaotian_bg_gh.png",
		text = Strings:get("Chat_Label_Union"),
		color = cc.c4b(248, 209, 105, 255),
		titleColor = cc.c4b(237, 238, 190, 255)
	},
	[SystemMsgLabelType.kWorld] = {
		rtColor = "BED4EE",
		pic = "liaotian_bg_sj.png",
		text = Strings:get("Chat_Label_World"),
		color = cc.c4b(188, 95, 247, 255),
		titleColor = cc.c4b(190, 212, 238, 255)
	},
	[SystemMsgLabelType.kMogul] = {
		text = Strings:get("Chat_Label_Mogul"),
		titleColor = cc.c4b(255, 35, 149, 255)
	},
	[SystemMsgLabelType.kEmperor] = {
		text = Strings:get("Chat_Label_Emperor"),
		titleColor = cc.c4b(174, 0, 255, 255)
	},
	[SystemMsgLabelType.kFight] = {
		text = Strings:get("Chat_Label_Fight"),
		titleColor = cc.c4b(134, 194, 255, 255)
	}
}
SystemMessageWidget = class("SystemMessageWidget", BaseWidget, _M)

function SystemMessageWidget:initialize(view)
	super.initialize(self, view)

	self._main = self:getView():getChildByName("main")
end

function SystemMessageWidget:dispose()
	super.dispose(self)
end

function SystemMessageWidget:decorateView(message)
	local labelType = message:getLabelType()
	local titleStr = SystemMsgLabelMap[labelType].text
	local titleText = self._main:getChildByFullName("bg.Text_who")

	titleText:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)
	titleText:setTextColor(SystemMsgLabelMap[labelType].titleColor)

	if titleStr then
		titleText:setString(titleStr)
	end

	local contentRect = self._main:getChildByFullName("content.content_rect")

	contentRect:setString("")

	local content = message:getContent()
	local contentText = self._main:getChildByFullName("content_text")

	if contentText == nil then
		contentText = ccui.RichText:createWithXML(content, {})

		contentText:setTouchEnabled(true)
		contentText:setSwallowTouches(false)
		contentText:setWrapMode(1)

		local anchor = contentRect:getAnchorPoint()
		local pos = contentRect:getPosition()

		contentText:setAnchorPoint(anchor)
		contentText:setName("content_text"):posite(90, 20):addTo(contentRect:getParent())
		contentText:setOpenUrlHandler(function (url)
			openUrlView(url, self:getInjector(), message:getExtraData(), message:getParams())
		end)
	else
		contentText:setString(content)
	end

	contentText:renderContent()

	local size = contentText:getContentSize()
	local realWidth = math.min(size.width, kMaxSystemContentWidth)

	contentText:renderContent(realWidth, 0, true)

	local realSize = contentText:getContentSize()
	local kDefaultSystemBubbleHeight = 43
	local bg = self._main:getChildByFullName("bg")
	local setBubbleSizeX = kDefaultBubbleWidth < realSize.width + 28 and realSize.width + 28 or kDefaultBubbleWidth
	local setBubbleSizeY = kDefaultSystemBubbleHeight < realSize.height + 14 and realSize.height + 14 or kDefaultSystemBubbleHeight

	bg:setContentSize(796, setBubbleSizeY)

	local contentPanel = self._main:getChildByFullName("content")

	contentPanel:setContentSize(10, setBubbleSizeY)
	contentText:setPositionY(setBubbleSizeY * 0.5)
	titleText:setPositionY(setBubbleSizeY * 0.5)

	local minSize = self._main:getContentSize()

	self._view:setContentSize(minSize.width, setBubbleSizeY + 14)
	self._main:posite(0, self._view:getContentSize().height + 7)
end

PrivateMessageWidget = class("PrivateMessageWidget", BaseWidget, _M)

PrivateMessageWidget:has("_eventDispatcher", {
	is = "r"
}):injectWith("legs_sharedEventDispatcher")
PrivateMessageWidget:has("_chatSystem", {
	is = "r"
}):injectWith("ChatSystem")

function PrivateMessageWidget:initialize(view)
	super.initialize(self, view)

	self._main = view:getChildByFullName("main")
end

function PrivateMessageWidget:dispose()
	super.dispose(self)
end

function PrivateMessageWidget:decorateView(message, senderInfo, parent)
	dump(message, "message >>>>>>>>>>")

	self._message = message
	self._senderInfo = senderInfo
	self._parentMediator = parent
	local headRect = self._main:getChildByFullName("head_rect")
	local head, oldIcon = IconFactory:createPlayerIcon({
		headFrameScale = 0.4,
		id = senderInfo.headImg,
		size = cc.size(82, 82),
		headFrameId = senderInfo.headFrame
	})

	oldIcon:setScale(0.4)

	if head then
		head:setScale(0.8)
		head:addTo(headRect):center(headRect:getContentSize())
		head:setTouchEnabled(true)
		head:setSwallowTouches(false)

		local function callFunc(sender, eventType)
			self:onClickHead(senderInfo, sender)
		end

		mapButtonHandlerClick(nil, head, {
			func = callFunc
		})
	end

	local textlevel = self._main:getChildByFullName("text_lv")
	local playerlevel = senderInfo.level

	textlevel:setString("lv." .. playerlevel)
	textlevel:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

	local nameText = self._main:getChildByFullName("name_text")

	nameText:setString(senderInfo.nickname or "")
	nameText:enableOutline(cc.c4b(0, 0, 0, 219.29999999999998), 1)

	local bubble = self._main:getChildByFullName("bubble")
	local contentRect = self._main:getChildByFullName("bubble.content_rect")
	local initBubble = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Bubble_Init", "content")
	local bubbleWidth = kDefaultBubbleWidth
	local bubbleheight = kDefaultBubbleHeight

	if senderInfo.chatBubble and senderInfo.chatBubble ~= "" and senderInfo.chatBubble ~= initBubble then
		local config = ConfigReader:getRecordById("ChatBubble", senderInfo.chatBubble)
		local path = "asset/ui/chatBubble/" .. config.Icon .. ".png"
		local parent = bubble:getParent()
		local x, y = bubble:getPosition()
		local ch = bubble:getAnchorPoint()

		contentRect:removeFromParent()
		bubble:removeFromParent()

		bubble = ccui.ImageView:create(path)

		bubble:addTo(parent):posite(x, y):setName("bubble")
		bubble:setAnchorPoint(ch)

		bubbleWidth = bubble:getContentSize().width
		bubbleheight = bubble:getContentSize().height

		contentRect:addTo(bubble):setName("content_rect")
	end

	bubble:setScale9Enabled(true)
	bubble:setCapInsets(cc.rect(46, 35, 1, 1))

	local content = message:getContent()
	local contentText = self._main:getChildByFullName("content_text")

	if contentText == nil then
		contentText = ccui.RichText:createWithXML(content, {})

		contentText:setFontFace(TTF_FONT_FZYH_R)
		contentText:setFontColor("#503214")
		contentText:setFontSize(20)
		contentText:setTouchEnabled(true)
		contentText:setSwallowTouches(false)
		contentText:setWrapMode(1)
		contentText:setAnchorPoint(contentRect:getAnchorPoint())
		contentText:addTo(contentRect:getParent()):posite(contentRect:getPosition()):offset(6, 0):setName("content_text")
		contentText:setOpenUrlHandler(function (url)
			openUrlView(url, self:getInjector(), message:getExtraData(), message:getParams())
		end)
	else
		contentText:setString(content)
	end

	contentText:renderContent()

	local size = contentText:getContentSize()
	local realWidth = math.min(size.width, kMaxPlayerContentWidth)

	contentText:renderContent(realWidth, 0, true)

	local realSize = contentText:getContentSize()
	local setBubbleSizeX = kDefaultBubbleWidth < realSize.width + 20 and realSize.width + 20 or kDefaultBubbleWidth
	local setBubbleSizeY = kDefaultBubbleHeight < realSize.height + 26 and realSize.height + 26 or kDefaultBubbleHeight

	bubble:setContentSize(setBubbleSizeX, setBubbleSizeY)
	contentText:setPositionY(setBubbleSizeY * 0.5)

	local mainSize = self._main:getContentSize()

	self._view:setContentSize(mainSize.width, setBubbleSizeY + 35)
	self._main:posite(0, setBubbleSizeY + 30)
	self:createEmotionView(message, senderInfo, parent)
end

function PrivateMessageWidget:onClickHead(senderInfo, sender)
	local function callFuncMsg()
		local friendSystem = self:getInjector():getInstance(FriendSystem)

		local function gotoView(response)
			local record = BaseRankRecord:new()

			record:synchronize({
				headImage = senderInfo.headImg,
				headFrame = senderInfo.headFrame,
				rid = senderInfo.id,
				level = senderInfo.level,
				nickname = senderInfo.nickname,
				vipLevel = senderInfo.vipLevel,
				combat = senderInfo.combat,
				slogan = senderInfo.slogan,
				master = senderInfo.master,
				heroes = senderInfo.heroes,
				clubName = senderInfo.clubName,
				online = senderInfo.online,
				offlineTime = senderInfo.offlineTime,
				isFriend = response.isFriend,
				close = response.close,
				gender = senderInfo.gender,
				city = senderInfo.city,
				birthday = senderInfo.birthday,
				tags = senderInfo.tags,
				block = response.block,
				leadStageId = senderInfo.leadStageId,
				leadStageLevel = senderInfo.leadStageLevel
			})
			friendSystem:showFriendPlayerInfoView(record:getRid(), record)
		end

		friendSystem:requestSimpleFriendInfo(senderInfo.id, function (response)
			gotoView(response)
		end)
	end

	callFuncMsg()
end

function PrivateMessageWidget:createEmotionView(message, senderInfo, parent)
	local bubble = self._main:getChildByFullName("bubble")
	local emotion = self._main:getChildByFullName("emotion")

	bubble:setVisible(true)
	emotion:setVisible(false)

	if message.getEmotionId and message:getEmotionId() then
		if self._chatSystem.getEmotionDataById and self._chatSystem:getEmotionDataById(message:getEmotionId()) then
			bubble:setVisible(false)
			emotion:setVisible(true)

			local d = self._chatSystem:getEmotionDataById(message:getEmotionId())
			local path = string.format("asset/emotion/%s.png", d.Icon)

			emotion:getChildByFullName("img"):loadTexture(path)
			self._view:setContentSize(self._view:getContentSize().width, self._view:getContentSize().height + 50)
			self._main:posite(0, self._view:getContentSize().height)
		else
			self._contentText:setString(Strings:get("Emoji_NoFind"))
		end
	end
end

function html2Text(htmlStr)
	if htmlStr == nil then
		return ""
	end

	htmlStr = string.gsub(htmlStr, "<[^>]+>", "")
	htmlStr = string.gsub(htmlStr, "\\s*|\t|\r|\n", "")

	return htmlStr
end

SimpleMessageWidget = class("SimpleMessageWidget", BaseWidget, _M)

SimpleMessageWidget:has("_chatSystem", {
	is = "r"
}):injectWith("ChatSystem")

function SimpleMessageWidget.class:createWidgetNode()
	local resFile = "asset/ui/SimpleMessage.csb"
	local view = ccui.Layout:create()

	view:setAnchorPoint(cc.p(0, 1))
	view:setCascadeOpacityEnabled(true)

	local node = cc.CSLoader:createNode(resFile)

	node:setAnchorPoint(cc.p(0, 1))
	node:addTo(view):setName("main")

	return view
end

function SimpleMessageWidget:initialize(view)
	super.initialize(self, view)

	self._main = view:getChildByFullName("main")
end

function SimpleMessageWidget:dispose()
	local view = self._view

	if view then
		view:removeFromParent()

		self._view = nil
	end

	super.dispose(self)
end

function SimpleMessageWidget:decorateView(message, senderInfo)
	local labelName, labelColor = nil
	local messageType = message:getType()
	local labelColorFF = nil

	if messageType == MessageType.kPlayer then
		labelName = ""
		labelColor = cc.c4b(195, 195, 195, 255)
		labelColorFF = "a76936"
	elseif messageType == MessageType.kSystem then
		local labelType = message:getLabelType()
		labelName = SystemMsgLabelMap[labelType] and SystemMsgLabelMap[labelType].text
		labelColor = SystemMsgLabelMap[labelType] and SystemMsgLabelMap[labelType].titleColor
		labelColorFF = SystemMsgLabelMap[labelType] and SystemMsgLabelMap[labelType].rtColor
	end

	local title = self._main:getChildByName("content_rect")

	title:setString(labelName)
	title:setTextColor(labelColor)
	title:removeAllChildren()

	local titleSize = title:getContentSize()
	local content = message:getContent()
	local str = nil

	if messageType == MessageType.kPlayer then
		local nickname = senderInfo and senderInfo.nickname
		content = html2Text(content)
		local emotionId = message:getEmotionId()

		if emotionId then
			local chatSystem = DmGame:getInstance()._injector:getInstance("ChatSystem")
			content = "[" .. Strings:get(chatSystem:getEmotionDataById(emotionId).Name) .. "]"
			content = string.format("<font face='asset/font/CustomFont_FZYH_M.TTF' size='16' color='#33E90B'>%s</font>", content)
		end

		str = Strings:get("Chat_Label_Style", {
			fontName = TTF_FONT_FZYH_M,
			label = nickname and nickname .. " " or "",
			color = labelColorFF and "#" .. labelColorFF or "#ffffff",
			factor = content
		})
	else
		str = content
	end

	local contentText = ccui.RichText:createWithXML(str, {})

	contentText:ignoreContentAdaptWithSize(true)
	contentText:rebuildElements()
	contentText:formatText()
	contentText:setAnchorPoint(cc.p(0, 1))
	contentText:renderContent(335 - (titleSize.width + 3), 0)

	local contentTextSize = contentText:getContentSize()

	contentText:setPosition(cc.p(titleSize.width + 3, titleSize.height))
	contentText:addTo(title)

	local width = titleSize.width + 3 + contentTextSize.width
	local height = math.max(contentTextSize.height, titleSize.height)

	self._main:setPosition(0, height)
	self._view:setContentSize(width, height)
end

FlowMessageWidget = class("FlowMessageWidget", BaseWidget, _M)

function FlowMessageWidget:setupView()
	local view = ccui.Layout:create()

	view:setCascadeOpacityEnabled(true)

	return view
end

function FlowMessageWidget:initialize()
	local view = self:setupView()

	super.initialize(self, view)
end

function FlowMessageWidget:dispose()
	local view = self._view

	if view then
		view:removeFromParent()

		self._view = nil
	end

	super.dispose(self)
end

function FlowMessageWidget:decorateView(message, senderInfo)
	local content = message:getContent()
	local contentText = ccui.RichText:createWithXML(content, {})

	contentText:setWrapMode(1)
	contentText:setAnchorPoint(0, 0)
	contentText:addTo(self:getView()):setName("content_text")
	contentText:renderContent()
	self:getView():setContentSize(contentText:getContentSize())
end
