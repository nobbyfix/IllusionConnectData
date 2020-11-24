SortHeroListComponent = class("SortHeroListComponent", DisposableObject, _M)

SortHeroListComponent:has("_view", {
	is = "r"
})
SortHeroListComponent:has("_info", {
	is = "r"
})
SortHeroListComponent:has("_mediator", {
	is = "r"
})

local SortHeroListComponentPath = "asset/ui/SortTip.csb"
local PosY = {
	227,
	168,
	110,
	0
}

function SortHeroListComponent:initialize(info)
	super.initialize(self)

	self._info = info
	self._mediator = info.mediator
	self._sortType = self._info.sortType
	self._stageSystem = self._mediator:getInjector():getInstance(StageSystem)
	self._sortNum = self._stageSystem:getSortNum()
	self._sortExtendNum = self._stageSystem:getSortExtendNum()
	self._isHide = info.isHide

	self:createView(info)
end

function SortHeroListComponent:createView(info)
	self._view = info.mainNode

	if not self._view then
		self._view = cc.CSLoader:createNode(SortHeroListComponentPath)
	end

	local touchLayer = self._view:getChildByFullName("touchLayer")

	touchLayer:setTouchEnabled(true)
	touchLayer:addClickEventListener(function ()
		self:onTouchCloseView()
	end)
	self._view:setVisible(false)

	self._mainPanel = self._view:getChildByFullName("mainpanel")
	self._extandPanel = self._view:getChildByFullName("extandPanel")

	self._extandPanel:setVisible(false)
	self:initShowHideBtn()

	self._btnClone = self._view:getChildByFullName("nodepanel")

	self._btnClone:setVisible(false)

	self._extandBtnClone = self._view:getChildByFullName("extandBtnPanel")

	self._extandBtnClone:setVisible(false)

	self._extandPartyBtnPanel = self._view:getChildByFullName("extandPartyBtnPanel")

	self._extandPartyBtnPanel:setVisible(false)

	self._btnCache = {}
	self._btnCache1 = {}

	for i = 1, self._sortNum do
		local newBtn = self._btnClone:clone()

		newBtn:setVisible(true)

		self._btnCache[#self._btnCache + 1] = newBtn

		newBtn:setPosition(cc.p(136.5, 11 + 51 * (self._sortNum - i)))
		self._mainPanel:addChild(newBtn, 1)

		local nameStr = self._stageSystem:getSortTypeStr(i)

		newBtn:getChildByFullName("namelabel"):setString(tostring(nameStr))

		local image = i == self._sortType and "common_btn_s01.png" or "common_btn_s02.png"

		newBtn:getChildByFullName("selectimg"):loadTexture(image, 1)
		newBtn:addClickEventListener(function ()
			self:onClickSortIcon(i)
		end)
	end

	for i = 1, self._sortExtendNum do
		local length = self._stageSystem:getSortExtendMaxNum()
		local extendParams = self._stageSystem:getSortExtandParam(i)

		for j = 1, length do
			local extendinfo = extendParams[j]

			if extendinfo then
				local newBtn1 = nil

				if i <= 3 then
					newBtn1 = self._extandBtnClone:clone()

					newBtn1:setVisible(true)
					newBtn1:getChildByFullName("namelabel"):setString(extendinfo)

					local selectimg = newBtn1:getChildByFullName("selectimg")

					selectimg:loadTexture("kazu_btn_fenlei_1.png", 1)

					selectimg.selectStatus = false
				else
					newBtn1 = self._extandPartyBtnPanel:clone()

					newBtn1:setVisible(true)
					newBtn1:getChildByFullName("Image"):loadTexture(IconFactory:getPartyPath(extendinfo, "building"))

					local selectimg = newBtn1:getChildByFullName("selectimg")

					selectimg:setVisible(false)

					selectimg.selectStatus = false
				end

				newBtn1.index = i
				self._btnCache1[#self._btnCache1 + 1] = newBtn1
				local posX = 303 + 80 * (j - 1)
				local posY = PosY[i]

				if j > 7 then
					posY = posY - 43
					posX = 303 + 80 * (j - 8)
				end

				newBtn1:setPosition(cc.p(posX, posY))
				self._extandPanel:addChild(newBtn1, 1)

				local selectimg = newBtn1:getChildByFullName("selectimg")

				newBtn1:addClickEventListener(function ()
					self:onClickSortExtend(i, j, selectimg)
				end)
			end
		end
	end

	self:initShowHideBtn()
end

function SortHeroListComponent:initShowHideBtn()
	self._showBtn = self._mainPanel:getChildByFullName("showExtand")

	self._showBtn:setVisible(self._isHide)
	self._showBtn:setTouchEnabled(true)
	self._showBtn:addClickEventListener(function ()
		self:onClickExtand(true)
	end)

	local hideBtn = self._extandPanel:getChildByFullName("hideExtand")

	hideBtn:setTouchEnabled(true)
	hideBtn:addClickEventListener(function ()
		self:onClickExtand(false)
	end)
end

function SortHeroListComponent:refreshView()
	for i = 1, #self._btnCache do
		local newBtn = self._btnCache[i]
		local nameStr = self._stageSystem:getSortTypeStr(i)

		newBtn:getChildByFullName("namelabel"):setString(tostring(nameStr))

		local image = i == self._sortType and "common_btn_s01.png" or "common_btn_s02.png"

		newBtn:getChildByFullName("selectimg"):loadTexture(image, 1)
	end

	for i = 1, #self._btnCache1 do
		local newBtn = self._btnCache1[i]
		local selectimg = newBtn:getChildByFullName("selectimg")

		if newBtn.index <= 3 then
			selectimg:loadTexture("kazu_btn_fenlei_1.png", 1)

			selectimg.selectStatus = false
		else
			selectimg.selectStatus = false

			selectimg:setVisible(false)
		end
	end

	self._extandPanel:setVisible(false)
	self._showBtn:setVisible(self._isHide)
end

function SortHeroListComponent:getRootNode()
	return self._view
end

function SortHeroListComponent:dispose()
	super.dispose(self)
end

function SortHeroListComponent:onClickSortIcon(i)
	if self._sortType == i then
		return
	end

	AudioEngine:getInstance():playEffect("Se_Click_Tab_4", false)

	if self._info and self._info.callBack then
		self._info.callBack({
			sortType = i
		})
	end

	self._sortType = i

	self._view:setVisible(not self._isHide)

	if not self._isHide then
		self:refreshView()
	end
end

function SortHeroListComponent:onClickSortExtend(sortType, sortExtangType, selectimg)
	AudioEngine:getInstance():playEffect("Se_Click_Tab_1", false)
	self._stageSystem:setSortExtand(sortType, sortExtangType)

	selectimg.selectStatus = not selectimg.selectStatus

	if sortType <= 3 then
		local image = selectimg.selectStatus and "kazu_btn_fenlei_2.png" or "kazu_btn_fenlei_1.png"

		selectimg:loadTexture(image, 1)
	else
		selectimg:setVisible(selectimg.selectStatus)
	end

	self._mediator:dispatch(Event:new(EVT_TEAM_REFRESH_PETS, {}))
end

function SortHeroListComponent:onClickExtand(isShow)
	AudioEngine:getInstance():playEffect("Se_Click_Common_2", false)
	self._extandPanel:setVisible(isShow)
	self._showBtn:setVisible(not isShow)
end

function SortHeroListComponent:onTouchCloseView()
	AudioEngine:getInstance():playEffect("Se_Click_Fold_2", false)
	self._showBtn:setVisible(true)
	self:getRootNode():setVisible(false)
end
