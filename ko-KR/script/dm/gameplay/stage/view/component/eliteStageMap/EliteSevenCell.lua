EliteSevenCell = class("EliteSevenCell", ChapterBase)
local kBtnHandlers = {}

function EliteSevenCell:initialize(data)
	super.initialize(self, data)

	self._stageType = data.stageType
	self._mediator = data.mediator

	self:initView()
	self:mapButtonHandlersClick(kBtnHandlers)
end

function EliteSevenCell:update(stageType, redPointTab)
	self._stageType = stageType

	local function callFunc()
		local contentData = {
			stageType = self._stageType,
			tabOffX = self._mediator._tableView:getContentOffset().x
		}

		self._mediator:getStageSystem():setContentData(contentData)
	end

	self:initChapterPanel(self._chapter1, "E12", callFunc)
	self._chapter1.redPoint:setVisible(self:checkRedPoint(redPointTab, 12))
	self._chapter1:setPosition(cc.p(self._chapter1RowX, self._chapter1RowY))
	self:initChapterPanel(self._chapter2, "E13", callFunc)
	self._chapter2:setPosition(cc.p(self._chapter2RowX, self._chapter2RowY))
	self._chapter2.redPoint:setVisible(self:checkRedPoint(redPointTab, 13))
	AudioEngine:getInstance():playAction("Action_1", false)
end

function EliteSevenCell:initView()
	self:initWidget()
	self:initAnim()
end

function EliteSevenCell:onScroll(offX)
	self:initMobileObj(offX, self._chapter1, 380, cc.p(self._chapter1RowX, self._chapter1RowY), 10680, 500)
	self:initMobileObj(offX, self._chapter2, 380, cc.p(self._chapter2RowX, self._chapter2RowY), 10880, 450)
	self:initMobileObj(offX, self._textPanel, 150, cc.p(self._textPanelRowX, self._textPanelRowY), 11000, 400)
end

function EliteSevenCell:initWidget()
	self._main = self:getView():getChildByName("main")
	self._chapter1 = self._main:getChildByName("chapterCell1")
	self._chapter1.redPoint = self._chapter1:getChildByName("redPoint")
	self._chapter1RowX = self._chapter1:getPositionX()
	self._chapter1RowY = self._chapter1:getPositionY()
	self._chapter2 = self._main:getChildByName("chapterCell2")
	self._chapter2.redPoint = self._chapter2:getChildByName("redPoint")
	self._chapter2RowX = self._chapter2:getPositionX()
	self._chapter2RowY = self._chapter2:getPositionY()
	self._textPanel = self._main:getChildByName("textPanel")
	self._textPanelRowX = self._textPanel:getPositionX()
	self._textPanelRowY = self._textPanel:getPositionY()
	local Image1 = self._main:getChildByName("Image_1")

	AdjustUtils.adjustLayoutByType(Image1, AdjustUtils.kAdjustType.Bottom)

	local Image2 = self._main:getChildByName("Image_2")

	AdjustUtils.adjustLayoutByType(Image2, AdjustUtils.kAdjustType.Bottom)

	local text = self._textPanel:getChildByFullName("hideText.text1")

	text:getVirtualRenderer():setDimensions(20, 0)
	self._textPanel:setSwallowTouches(false)

	local hideText = self._textPanel:getChildByName("hideText")

	hideText:setPosition(cc.p(103, -30))

	local function callFunc(sender, eventType)
		local hideText = sender:getChildByName("hideText")

		if eventType == ccui.TouchEventType.began then
			hideText:stopAllActions()

			local fadeAct = cc.FadeIn:create(0.1)

			hideText:runAction(cc.Sequence:create(fadeAct, cc.CallFunc:create(function ()
				AudioEngine:getInstance():playEffect("Se_Effect_Display", false)
			end)))
		elseif eventType == ccui.TouchEventType.ended or eventType == ccui.TouchEventType.canceled then
			hideText:stopAllActions()

			local fadeAct = cc.FadeOut:create(0.5)

			hideText:runAction(fadeAct)
		end
	end

	mapButtonHandlerClick(nil, self._textPanel, {
		ignoreClickAudio = true,
		eventType = 4,
		func = callFunc
	})
end

function EliteSevenCell:initAnim()
	local mc = cc.MovieClip:create("huaban_zhuxianchangjing")

	mc:addTo(self:getView())
	mc:setPosition(cc.p(800, 390))
end
