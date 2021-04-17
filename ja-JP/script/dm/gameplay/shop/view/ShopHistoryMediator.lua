ShopHistoryMediator = class("ShopHistoryMediator", DmPopupViewMediator, _M)

ShopHistoryMediator:has("_shopSystem", {
	is = "r"
}):injectWith("ShopSystem")
ShopHistoryMediator:has("_rechargeSystem", {
	is = "r"
}):injectWith("RechargeAndVipSystem")

local kBtnHandlers = {}
local kFontSize = 18
local kLineSpace = 6

function ShopHistoryMediator:initialize()
	super.initialize(self)
end

function ShopHistoryMediator:dispose()
	self:getView():stopAllActions()
	super.dispose(self)
end

function ShopHistoryMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
	self:bindWidget("main.bgNode", PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onClickBack, self)
		},
		bgSize = {
			width = 993.24,
			height = 584
		}
	})

	self._scrollView = self:getView():getChildByFullName("main.scrollView")

	self._scrollView:setClippingEnabled(true)
	self._scrollView:setScrollBarEnabled(false)

	self._textClone = self:getView():getChildByFullName("main.text")

	self._textClone:setFontSize(kFontSize)
	self._textClone:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_LEFT)
	self._textClone:getVirtualRenderer():setLineSpacing(kLineSpace)
	self._textClone:getVirtualRenderer():setDimensions(self._scrollView:getContentSize().width, 0)
	self._textClone:setVisible(true)
	self._textClone:setString("")
end

function ShopHistoryMediator:enterWithData(data)
	self:initData(data)
	self:initView()
end

function ShopHistoryMediator:resumeWithData()
end

function ShopHistoryMediator:refreshView()
	self:initData()
	self:initView()
end

function ShopHistoryMediator:initData(data)
	if data then
		self._data = data
	end
end

function ShopHistoryMediator:initView()
	if self._data then
		local title = self._data.title and Strings:get(self._data.title) or "title"
		local title1 = self._data.title1 and Strings:get(self._data.title1) or "title_En"

		self:bindWidget("main.bgNode", PopupNormalWidget, {
			btnHandler = {
				clickAudio = "Se_Click_Close_2",
				func = bind1(self.onClickBack, self)
			},
			title = title,
			title1 = title1,
			bgSize = {
				width = 993.24,
				height = 584
			}
		})

		if self._data.type then
			local type = self._data.type

			if type == "law" then
				self:showLaw(self._data.id)
			end

			if type == "history" then
				self:initContent(self._data.responseData)
			end
		end
	end
end

function ShopHistoryMediator:initContent(data)
	local emptyStr = Strings:get("Shop_Recharge_Empty")
	local loadingStr = Strings:get("Shop_Recharge_Loading")

	if not data or data == "" or data == {} then
		self._textClone:setString(emptyStr)

		return
	end

	self._content = {}

	for key, value in pairs(data) do
		table.insert(self._content, #self._content + 1, value)
	end

	table.sort(self._content, function (a, b)
		return b.time < a.time
	end)

	local length = #self._content
	local viewSize = self._scrollView:getContentSize()
	local height = kFontSize * 2 + kLineSpace * 2
	local allHeight = math.max(viewSize.height, height * length)

	self._scrollView:setInnerContainerSize(cc.size(viewSize.width, allHeight))
	self._scrollView:setInnerContainerPosition(cc.p(0, viewSize.height - allHeight))

	local width = viewSize.width - 10
	local payOffSystem = DmGame:getInstance()._injector:getInstance(PayOffSystem)

	for i = 1, length do
		local temp = self._content[i]
		local node = self._textClone:clone():setVisible(true)
		local date = os.date("*t", temp.time)
		local config = ConfigReader:getRecordById("Pay", temp.payId)
		local payInfo = payOffSystem:getPayInfoByProductId(temp.productId)
		local str = Strings:get("Shop_Recharge_Template_1", {
			month = date.month,
			day = date.day,
			hour = date.hour,
			minute = date.min,
			cost = math.ceil(temp.money / 100)
		}, {
			formatStr = function (num, ...)
				return self:formatStr(num, ...)
			end
		})
		local strId = "Shop_Recharge_Template_1_1"

		if PlatformHelper:isDMMChannel() then
			strId = "DMMPCost"
		end

		str = str .. "  " .. Strings:get(strId, {
			cost = math.ceil(temp.money / 100)
		}, {
			formatStr = function (num, ...)
				return self:formatStr(num, ...)
			end
		})
		str = str .. "  " .. Strings:get("Shop_Recharge_Template_2", {
			num = 1,
			goods = Strings:get(config.Name)
		})

		if temp.extraCoin and temp.extraCoin > 0 then
			local giftName = Strings:get("IR_Diamond_Name")

			dump(temp.mallFirstBuy, "temp.mallFirstBuy")

			if temp.mallFirstBuy then
				str = str .. Strings:get("Shop_Recharge_Template_Add", {
					gift = giftName,
					num = temp.extraCoin
				})
			else
				str = str .. Strings:get("Shop_Recharge_Template_Add_2", {
					gift = giftName,
					num = temp.extraCoin
				})
			end
		end

		node:setPosition(cc.p(viewSize.width * 0.5, allHeight - (i - 1) * height))
		node:addTo(self._scrollView)
		node:setString(str)
	end
end

function ShopHistoryMediator:showLaw(lawId)
	dump(lawId, "lawId")

	local rule = ConfigReader:getDataByNameIdAndKey("ConfigValue", lawId, "content")

	assert(rule, "Law config can not find in table ConfigValue.." .. "key.." .. lawId)

	self._content = rule
	local length = #self._content
	local viewSize = self._scrollView:getContentSize()
	local height = kFontSize * 2 + kLineSpace * 2
	local allHeight = 20
	local width = viewSize.width - 10
	local space = 18
	local str = Strings:get(rule[1], {
		fontName = TTF_FONT_FZYH_M
	})
	local text = ccui.RichText:createWithXML(str, {})

	text:setFontSize(28)
	text:ignoreContentAdaptWithSize(true)
	text:rebuildElements()
	text:formatText()
	text:renderContent()
	text:addTo(self._scrollView):setTag(1)
	text:setAnchorPoint(cc.p(0, 1))
	text:setPosition(cc.p(10, viewSize.height - 15))

	for i = 2, #rule do
		local str = "·" .. Strings:get(rule[i])
		str = string.gsub(str, "<br/>", "\n")
		local text = ccui.Text:create(str, TTF_FONT_FZYH_M, 20)

		text:getVirtualRenderer():setLineSpacing(kLineSpace)
		text:setColor(cc.c3b(255, 255, 255))
		text:setAnchorPoint(cc.p(0, 1))
		text:setPosition(cc.p(10, viewSize.height - 15))
		text:addTo(self._scrollView):setTag(i)
		text:getVirtualRenderer():setMaxLineWidth(width)
	end

	for i = 1, #rule do
		local text = self._scrollView:getChildByTag(i)
		allHeight = allHeight + text:getContentSize().height + 20
	end

	allHeight = math.max(viewSize.height, allHeight)

	dump(allHeight, "allHeight")
	self._scrollView:setInnerContainerSize(cc.size(viewSize.width, allHeight))

	for i = 1, #rule do
		local prewText = self._scrollView:getChildByTag(i - 1)
		local text = self._scrollView:getChildByTag(i)

		if prewText then
			local topPosY = prewText:getPositionY() - prewText:getContentSize().height

			dump(topPosY, "topPosY")
			dump(text:getContentSize().height, "text:getContentSize().height")
			text:setPosition(cc.p(10, topPosY - space))
		else
			text:setPosition(cc.p(10, allHeight - 10))
		end

		dump(text:getPositionY(), "text:getPositionY")
	end
end

function ShopHistoryMediator:formatStr(num, len, fill)
	local fill = fill or ""

	return string.format("%" .. fill .. len .. "d", num)
end

function ShopHistoryMediator:onClickBack()
	self:close()
end
