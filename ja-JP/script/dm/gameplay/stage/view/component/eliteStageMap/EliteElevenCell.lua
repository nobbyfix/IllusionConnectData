EliteElevenCell = class("EliteElevenCell", ChapterBase)
local kBtnHandlers = {}
local onPlayAnim = nil

function EliteElevenCell:initialize(data)
	super.initialize(self, data)

	onPlayAnim = false
	self._stageType = data.stageType
	self._mediator = data.mediator

	self:initView()
	self:mapButtonHandlersClick(kBtnHandlers)
end

function EliteElevenCell:update(stageType, redPointTab)
	self._stageType = stageType

	local function callFunc()
		local contentData = {
			stageType = self._stageType,
			tabOffX = self._mediator._tableView:getContentOffset().x
		}

		self._mediator:getStageSystem():setContentData(contentData)
	end

	self:initChapterPanel(self._chapter1, "E20", callFunc)
	self._chapter1:setPosition(cc.p(self._chapter1RowX, self._chapter1RowY))
	self._chapter1.redPoint:setVisible(self:checkRedPoint(redPointTab, 20))
	self:initChapterPanel(self._chapter2, "E21", callFunc)
	self._chapter2:setPosition(cc.p(self._chapter2RowX, self._chapter2RowY))
	self._chapter2.redPoint:setVisible(self:checkRedPoint(redPointTab, 21))
end

function EliteElevenCell:initView()
	self:initWidget()
	self:initAnim()
end

function EliteElevenCell:initWidget()
	self._main = self:getView():getChildByName("main")
	self._chapter1 = self._main:getChildByName("chapterCell1")
	self._chapter1.redPoint = self._chapter1:getChildByName("redPoint")
	self._chapter1RowX = self._chapter1:getPositionX()
	self._chapter1RowY = self._chapter1:getPositionY()
	self._chapter2 = self._main:getChildByName("chapterCell2")
	self._chapter2.redPoint = self._chapter2:getChildByName("redPoint")

	AdjustUtils.adjustLayoutByType(self._chapter2, AdjustUtils.kAdjustType.Top)

	self._chapter2RowX = self._chapter2:getPositionX()
	self._chapter2RowY = self._chapter2:getPositionY()
	self._textPanel = self._main:getChildByName("textPanel")

	self._textPanel:setSwallowTouches(false)

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

function EliteElevenCell:initAnim()
	local mc = cc.MovieClip:create("ershiershiyi_zhuxianchangtuershiershiyi")
	local imageBgPanel = self._main:getChildByName("animnode")

	mc:addTo(imageBgPanel)
	mc:setPosition(cc.p(850, 5))
	AdjustUtils.adjustLayoutByType(mc, AdjustUtils.kAdjustType.Top)

	local bulidmc = mc:getChildByName("bulid")
	local bulidBg = self._main:getChildByName("BG")

	bulidBg:changeParent(bulidmc):center(bulidmc:getContentSize())
end
