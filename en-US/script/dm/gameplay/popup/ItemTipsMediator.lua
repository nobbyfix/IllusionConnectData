ItemTipsMediator = class("ItemTipsMediator", DmPopupViewMediator, _M)

ItemTipsMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kWidth = 305
local kDefaultDelayTime = 0.1
local kMoveSensitiveDist = cc.p(5, 5)

function ItemTipsMediator:initialize()
	super.initialize(self)
end

function ItemTipsMediator:dispose()
	self._viewClose = true

	super.dispose(self)
end

function ItemTipsMediator:onRemove()
	super.onRemove(self)
end

function ItemTipsMediator:onRegister()
	super.onRegister(self)

	self._main = self:getView():getChildByName("main")

	self:mapEventListener(self:getEventDispatcher(), EVT_SHOW_ITEMTIP, self, self.onShowContent)
end

function ItemTipsMediator:userInject()
end

function ItemTipsMediator:enterWithData(data)
	assert(data.info ~= nil, "error:data.info=nil")
	assert(data.info.id ~= nil, "error:data.info.id=nil")
	self:setUi(data)

	local view = self:getView()
end

function ItemTipsMediator:onShowContent(event)
	local data = event:getData()

	assert(data.info ~= nil, "error:data.info=nil")
	assert(data.info.id ~= nil, "error:data.info.id=nil")
	assert(data.icon ~= nil, "error:data.icon=nil")
	self:setUi(data)
	self:adjustPos(data.icon, data.style and data.style.direction)
end

function ItemTipsMediator:setUi(data)
	local iconBg = self._main:getChildByName("icon")

	if data.info and data.info.clipIndex then
		data.info.clipIndex = 1
	end

	local showAmount = true

	if data.style and data.style.showAmount ~= nil then
		showAmount = data.style.showAmount
	end

	local icon = IconFactory:createIcon(data.info, {
		showAmount = false
	})

	icon:addTo(iconBg):center(iconBg:getContentSize())
	icon:setScale(0.7)

	local nameText = self._main:getChildByName("Text_name")

	nameText:setString(RewardSystem:getName(data.info))

	local descText = self._main:getChildByName("Text_desc")

	descText:setVisible(true)
	descText:setString(RewardSystem:getDesc(data.info))

	local attrPanel = self._main:getChildByName("Panel_attr")

	attrPanel:setVisible(false)

	local countText = self._main:getChildByName("Text_count")
	local countValue = self._main:getChildByName("count_value")

	countText:setVisible(false)
	countValue:setVisible(false)

	local hideTipAmount = false

	if data.style and data.style.hideTipAmount ~= nil then
		hideTipAmount = data.style.hideTipAmount
	end

	local rewardType = data.info.rewardType

	if rewardType == RewardType.kEquip or rewardType == RewardType.kEquipExplore then
		local config = ConfigReader:getRecordById("HeroEquipBase", data.info.id)

		GameStyle:setRarityText(nameText, config.Rareity)
	elseif not hideTipAmount then
		local textSize = descText:getContentSize()
		local lineCount = math.ceil(textSize.width / kWidth)

		if lineCount > 1 then
			-- Nothing
		end

		local quality = RewardSystem:getQuality(data.info)

		GameStyle:setQualityText(nameText, quality)

		local countInfo = self:getCountInfo(data.info)

		countValue:setVisible(countInfo.showCount)
		countText:setVisible(countInfo.showCount)

		if countInfo.showCount == true then
			countValue:setString(countInfo.count)
			countText:setString(countInfo.text)
		end
	end

	countValue:setPositionX(countText:getPositionX() + countText:getContentSize().width + 5)
	countValue:setPositionY(countText:getPositionY())
end

function ItemTipsMediator:getCountInfo(info)
	local id = tostring(info.id)
	local info = {}
	local config = ConfigReader:getRecordById("ItemConfig", id)

	if config and config.Id then
		local bagSystem = self._developSystem:getBagSystem()
		info.count = bagSystem:getItemCount(id)
		local showCount = true

		if id == "IR_Activity" or id == "IR_Exp" then
			showCount = false
		end

		info.showCount = showCount
		info.text = Strings:get("bag_UI7")
	end

	return info
end

function ItemTipsMediator:adjustPos(icon, direction)
	local view = self:getView()

	view:setAnchorPoint(cc.p(0.5, 0.5))
	view:setIgnoreAnchorPointForPosition(false)

	local kUpMargin = 1
	local kDownMargin = 1
	local kLeftMargin = 5
	local kRightMargin = 5
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

function ItemTipsMediator:_expandDescHeight(expandHeight)
	if expandHeight and expandHeight ~= 0 then
		local detailBg = self._main:getChildByName("Image_bg")
		local textBg = self._main:getChildByName("Image_descdi")
		local textBgSize = textBg:getContentSize()
		local bgSize = detailBg:getContentSize()

		self._main:setContentSize(cc.size(bgSize.width, bgSize.height + expandHeight))
		detailBg:setContentSize(cc.size(bgSize.width, bgSize.height + expandHeight))
		self._main:setPositionY(detailBg:getPositionY() + expandHeight + expandHeight * 0.5)
		detailBg:setPositionY(detailBg:getPositionY() - expandHeight * 0.5)
		textBg:setContentSize(cc.size(textBgSize.width, textBgSize.height + expandHeight))
		textBg:setPositionY(textBg:getPositionY() - expandHeight * 0.5)
	end
end

function ItemTipsMediator:checkNeedDelay(data)
	if data.style and data.style.needDelay then
		self:getView():setVisible(false)

		local icon = data.icon
		local initPos = icon:getParent():convertToWorldSpace(cc.p(icon:getPosition()))
		local delayAct = cc.DelayTime:create(data.delayTime or kDefaultDelayTime)
		local judgeShowAct = cc.CallFunc:create(function ()
			local endPos = icon:getParent():convertToWorldSpace(cc.p(icon:getPosition()))

			if math.abs(endPos.x - initPos.x) < kMoveSensitiveDist.x and math.abs(endPos.y - initPos.y) < kMoveSensitiveDist.y then
				self:getView():setVisible(true)
			end
		end)
		local seqAct = cc.Sequence:create(delayAct, judgeShowAct)

		self:getView():runAction(seqAct)
	end
end
