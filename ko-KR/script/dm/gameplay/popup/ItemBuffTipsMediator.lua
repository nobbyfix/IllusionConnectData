ItemBuffTipsMediator = class("ItemBuffTipsMediator", DmPopupViewMediator, _M)

ItemBuffTipsMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kWidth = 305

function ItemBuffTipsMediator:initialize()
	super.initialize(self)
end

function ItemBuffTipsMediator:dispose()
	self._viewClose = true

	super.dispose(self)
end

function ItemBuffTipsMediator:onRemove()
	super.onRemove(self)
end

function ItemBuffTipsMediator:onRegister()
	super.onRegister(self)

	self._main = self:getView():getChildByName("main")

	self:mapEventListener(self:getEventDispatcher(), EVT_SHOW_ITEMTIP, self, self.onShowContent)
end

function ItemBuffTipsMediator:enterWithData(data)
end

function ItemBuffTipsMediator:onShowContent(event)
	local data = event:getData()

	self:setUi(data)
	self:adjustPos(data.icon, data.style and data.style.direction)
end

function ItemBuffTipsMediator:setUi(data)
	local buffInfo = data.info
	local icon = self._main:getChildByFullName("icon")

	icon:removeAllChildren()

	local info = {
		id = buffInfo.id
	}
	local buffIcon = IconFactory:createBuffIcon(info, {
		scale = 0.55
	})

	buffIcon:addTo(icon):center(icon:getContentSize())

	local effectConfig = ConfigReader:getRecordById("Skill", buffInfo.id)
	local nameLab = self._main:getChildByFullName("title")

	nameLab:setString(Strings:get(effectConfig.Name))

	local descLab = self._main:getChildByFullName("desc")
	local desc = Strings:get(effectConfig.Desc, {
		fontSize = 18,
		fontName = TTF_FONT_FZYH_M
	})
	local richText = ccui.RichText:createWithXML(desc, {})

	richText:setAnchorPoint(descLab:getAnchorPoint())
	richText:setPosition(cc.p(descLab:getPosition()))
	richText:addTo(descLab:getParent())
	richText:renderContent(descLab:getContentSize().width, 0, true)

	local effectLab = self._main:getChildByFullName("effect")

	effectLab:setVisible(false)

	if buffInfo.desc and buffInfo.desc ~= "" then
		effectLab:setVisible(true)
		effectLab:setString(buffInfo.desc)
	end

	local tipImg = self._main:getChildByFullName("tag")
	local tipText = self._main:getChildByFullName("tag.text")

	if buffInfo.buffType == "OneTimeBuff" then
		tipImg:setVisible(true)
		tipImg:loadTexture("bg_mjt_jilibiaoshi.png", ccui.TextureResType.plistType)
		tipText:setString(Strings:get("DreamChallenge_Buff_Type_JL"))
	elseif buffInfo.buffType == "TimeBuff" then
		tipImg:setVisible(true)
		tipImg:loadTexture("bg_mjt_xianshi.png", ccui.TextureResType.plistType)
		tipText:setString(Strings:get("DreamChallenge_Buff_Type_XS"))
	else
		tipImg:setVisible(false)
	end

	tipImg:setPositionX(99 + nameLab:getContentSize().width)
end

function ItemBuffTipsMediator:adjustPos(icon, direction)
	local view = self:getView()

	view:setAnchorPoint(cc.p(0.5, 0.5))
	view:setIgnoreAnchorPointForPosition(false)

	local kUpMargin = 0
	local kDownMargin = 0
	local kLeftMargin = 0
	local kRightMargin = 0
	local viewSize = view:getContentSize()
	local iconBoundingBox = icon:getBoundingBox()
	local worldPos = icon:getParent():convertToWorldSpace(cc.p(iconBoundingBox.x, iconBoundingBox.y))
	local scene = cc.Director:getInstance():getRunningScene()
	local winSize = scene:getContentSize()
	direction = direction or (worldPos.y + iconBoundingBox.height + viewSize.height + kUpMargin > winSize.height - 30 or ItemTipsDirection.kUp) and (worldPos.x + iconBoundingBox.width * 0.5 >= winSize.width * 0.5 or ItemTipsDirection.kRight) and ItemTipsDirection.kLeft
	local iconBox = {
		x = worldPos.x,
		y = worldPos.y,
		width = icon:getContentSize().width * icon:getScale(),
		height = icon:getContentSize().height * icon:getScale()
	}
	local x, y = nil

	if direction == ItemTipsDirection.kUp then
		x = iconBox.x + iconBox.width * 0.5
		y = iconBox.y + iconBox.height + viewSize.height * 0.5 + kUpMargin
	elseif direction == ItemTipsDirection.kDown then
		x = iconBox.x + iconBox.width * 0.5
		y = iconBox.y - viewSize.height * 0.5 - kDownMargin
	elseif direction == ItemTipsDirection.kLeft then
		x = iconBox.x - viewSize.width * 0.5 - kLeftMargin
		y = iconBox.y + iconBox.height - viewSize.height * 0.5
	elseif direction == ItemTipsDirection.kRight then
		x = iconBox.x + iconBox.width + viewSize.width * 0.5 + kRightMargin
		y = iconBox.y + iconBox.height - viewSize.height * 0.5
	end

	local nodePos = view:getParent():convertToWorldSpace(cc.p(0, 0))
	local kLeftMinMargin = 0
	local kRightMinMargin = 0
	local kUpMinMargin = 0
	local kDownMinMargin = 0

	if kLeftMinMargin >= x - viewSize.width * 0.5 then
		x = kLeftMinMargin + viewSize.width * 0.5
	elseif x + viewSize.width * 0.5 >= winSize.width - kRightMinMargin then
		x = winSize.width - kRightMinMargin - viewSize.width * 0.5
	end

	if kDownMinMargin > y - viewSize.height * 0.5 then
		y = kDownMinMargin + viewSize.height * 0.5
	elseif y + viewSize.height * 0.5 > winSize.height - kUpMinMargin then
		y = winSize.height - kUpMinMargin - viewSize.height * 0.5
	end

	view:setPosition(cc.p(x - nodePos.x, y - nodePos.y))
end
