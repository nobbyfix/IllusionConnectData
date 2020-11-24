StagePracticeSpecialRuleMediator = class("StagePracticeSpecialRuleMediator", DmPopupViewMediator, _M)
local kBtnHandlers = {
	["main.closeBtn"] = {
		clickAudio = "Se_Click_Close_1",
		func = "onClickClose"
	}
}

function StagePracticeSpecialRuleMediator:initialize()
	super.initialize(self)
end

function StagePracticeSpecialRuleMediator:dispose()
	super.dispose(self)
end

function StagePracticeSpecialRuleMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)
end

function StagePracticeSpecialRuleMediator:enterWithData(data)
	self._ruleList = data.ruleList or {}
	self._title = self._ruleList[1]

	self:initContent()
end

function StagePracticeSpecialRuleMediator:initContent()
	local title = self:getView():getChildByFullName("main.title")

	title:setString(Strings:get(self._title))

	for i = 2, 4 do
		local textNode = self:getView():getChildByFullName("main.textNode" .. i)

		if self._ruleList[i] then
			local richText = ccui.RichText:createWithXML(Strings:get(self._ruleList[i], {
				fontName = TTF_FONT_FZYH_R
			}), {})

			richText:addTo(textNode)
			richText:setAnchorPoint(cc.p(0, 1))
			richText:setPosition(cc.p(18, 13))
			richText:renderContent(372, 0, true)
		else
			textNode:setVisible(false)
		end
	end

	local bublingText = self:getView():getChildByFullName("main.bubling.text")
	local strs = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Point_Skill_Text", "content")
	local text = Strings:get(strs[math.random(1, #strs)])

	bublingText:setString(text)
	bublingText:getVirtualRenderer():setMaxLineWidth(120)
end

function StagePracticeSpecialRuleMediator:onTouchMaskLayer()
end

function StagePracticeSpecialRuleMediator:onClickClose()
	self:close()
end
