BagSelectMaterialMediator = class("BagSelectMaterialMediator", DmPopupViewMediator, _M)

BagSelectMaterialMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
BagSelectMaterialMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")

local kBtnHandlers = {}

function BagSelectMaterialMediator:initialize()
	super.initialize(self)
end

function BagSelectMaterialMediator:dispose()
	super.dispose(self)
end

function BagSelectMaterialMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._bagSystem = self._developSystem:getBagSystem()
	self._heroSystem = self._developSystem:getHeroSystem()
	self._equipSystem = self._developSystem:getEquipSystem()
	self._useBtn = self:bindWidget("main.usebtn", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onOkClicked, self)
		}
	})
end

function BagSelectMaterialMediator:enterWithData(data)
	self:setupTopInfoWidget()
	self:initData(data)
	self:initNodes()
	self:setEquipView()
end

function BagSelectMaterialMediator:initData(data)
	self._data = data
	self._curMaterial = data.curMaterial
	self._equipType = EquipsShowType.kCompose
	self._callBack = data.callBack
	self._index = data.index
	self._equipList = {}
	self._equipList = {}
	self._heroData = nil

	if data then
		self._viewType = EquipsShowType.kCompose
		self._equipList = self._equipSystem:getEquipList(self._viewType, self._curMaterial)

		if self._equipList[1] and self._equipList[1].item then
			self._selectEquipId = self._equipList[1].item:getEquipId()
			self._selectEquipUUId = self._equipList[1].item:getId()
			self._selectEquipEquipData = self._equipList[1].item
		else
			self._selectEquipId = self._equipList[1] and self._equipList[1]:getEquipId() or ""
			self._selectEquipUUId = self._equipList[1] and self._equipList[1]:getId() or ""
			self._selectEquipEquipData = self._equipList[1] and self._equipList[1] or ""
		end
	end
end

function BagSelectMaterialMediator:setupTopInfoWidget()
	self._mainPanel = self:getView():getChildByFullName("main")
	local bgNode = self._mainPanel:getChildByFullName("tipnode")

	bindWidget(self, bgNode, PopupNormalWidget, {
		ignoreTitleNodeBg = true,
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onBackCall, self)
		},
		title = Strings:get("bag_UI33"),
		title1 = Strings:get("bag_EN_UI33"),
		bgSize = {
			width = 840,
			height = 621
		},
		offsetForImage_bg3 = {
			diffX = -30,
			diffY = 0
		}
	})
end

local kColumnNum = 5

function BagSelectMaterialMediator:initNodes()
	self._mainPanel = self:getView():getChildByFullName("main")
	self._listPanel = self._mainPanel:getChildByFullName("listPanel")
	self._cellClone = self._mainPanel:getChildByFullName("cellClone")

	self._cellClone:setVisible(false)

	self.emptyTip2 = self._mainPanel:getChildByFullName("emptyTip2")

	self.emptyTip2:setVisible(false)

	self._selectImage = self:createSelectImage()
end

function BagSelectMaterialMediator:setEquipView()
	self.emptyTip2:setVisible(#self._equipList == 0)

	local width = self._listPanel:getContentSize().width
	local height = self._cellClone:getContentSize().height

	local function scrollViewDidScroll(view)
		self._isReturn = false
	end

	local function cellSizeForTable(table, idx)
		if idx == 0 then
			return width, height + 15
		end

		return width, height
	end

	local function numberOfCellsInTableView(table)
		return math.ceil(#self._equipList / kColumnNum)
	end

	local function tableCellAtIndex(table, idx)
		local cell = table:dequeueCell()

		if cell == nil then
			cell = cc.TableViewCell:new()
		end

		self:createCell(cell, idx + 1)

		return cell
	end

	local size = cc.size(width, self._listPanel:getContentSize().height)
	local tableView = cc.TableView:create(size)
	self._equipView = tableView

	tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
	tableView:setAnchorPoint(0, 0)
	tableView:setPosition(cc.p(0, 0))
	tableView:setDelegate()
	tableView:setBounceable(false)
	self._listPanel:addChild(tableView, 1)
	tableView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
	tableView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
	tableView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
	tableView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
	self._equipView:reloadData()
end

function BagSelectMaterialMediator:createCell(cell, index)
	cell:removeAllChildren()

	for i = 1, kColumnNum do
		local equipIndex = kColumnNum * (index - 1) + i
		local equipData = self._equipList[equipIndex]

		if equipData then
			local equipId, uuId = nil
			local node = self._cellClone:clone()

			node:setVisible(true)
			node:addTo(cell)
			node:setPosition(cc.p((i - 1) * self._cellClone:getContentSize().width, 0))
			node:setTouchEnabled(true)
			node:setSwallowTouches(false)

			local tipPanel = node:getChildByFullName("tipPanel")

			tipPanel:setVisible(false)
			tipPanel:setLocalZOrder(10)

			local iconPanel = node:getChildByFullName("iconPanel")
			local icon = nil
			local data = {}

			if equipData.item and equipData.item:getSubType() and equipData.item:getSubType() == ItemTypes.K_EQUIP_EXP then
				equipId = equipData.item:getEquipId()
				uuId = equipData.item:getId()
				local iconData = {
					scaleRatio = 0.8,
					id = equipData.item:getConfigId(),
					amount = equipData.count,
					rarity = equipData.item:getRarity()
				}
				icon = IconFactory:createIcon(iconData, {
					showAmount = true
				})

				icon:addTo(iconPanel):center(iconPanel:getContentSize())
				icon:setColor(cc.c3b(255, 255, 255))
				iconPanel:setColor(cc.c3b(255, 255, 255))
				tipPanel:setColor(cc.c3b(255, 255, 255))

				local quickSelectItems = self._equipSystem:getStrengthenConsumeItems()
				local num = 0

				for i = 1, #quickSelectItems do
					if quickSelectItems[i] == equipId then
						num = num + 1
					end
				end

				if num > 0 then
					local selectImage = ccui.ImageView:create("zhuangbei_bg_gou.png", 1)
					local image = ccui.ImageView:create("zb_btn_duigou.png", 1)

					selectImage:addTo(node)
					selectImage:setPosition(cc.p(23, 18))
					image:addTo(selectImage):posite(15, 20)
					image:setScale(0.9)
					selectImage:setName("SelectImage")
					self:createMinusPanel(selectImage, num, equipId)

					if equipData.count - num <= 0 then
						node:setTouchEnabled(false)
					end
				end

				data.amount = 1
				data.type = 6
				data.code = iconData.id
			else
				equipId = equipData:getEquipId()
				uuId = equipData:getId()
				local level = equipData:getLevel()
				local star = equipData:getStar()
				local rarity = equipData:getRarity()
				local ownUnlock = equipData:getUnlock()
				local param = {
					lock = false,
					id = equipData:getEquipId(),
					level = level,
					star = star,
					rarity = rarity
				}
				data = param
				icon = IconFactory:createEquipIcon(param)

				icon:addTo(iconPanel):center(iconPanel:getContentSize())
				icon:setColor(cc.c3b(255, 255, 255))
				iconPanel:setColor(cc.c3b(255, 255, 255))
				tipPanel:setColor(cc.c3b(255, 255, 255))

				if not ownUnlock then
					iconPanel:setColor(cc.c3b(150, 150, 150))
				end

				local heroId = equipData:getHeroId()

				if heroId ~= "" then
					tipPanel:setVisible(true)

					local heroIcon = tipPanel:getChildByFullName("heroIcon")
					local unLock = tipPanel:getChildByFullName("Image_4_0")

					heroIcon:removeAllChildren()

					local heroInfo = {
						id = IconFactory:getRoleModelByKey("HeroBase", heroId)
					}
					local headImgName = IconFactory:createRoleIconSprite(heroInfo)

					headImgName:setScale(0.16)

					headImgName = IconFactory:addStencilForIcon(headImgName, 2, cc.size(31, 31))

					headImgName:addTo(heroIcon):center(heroIcon:getContentSize()):offset(-0.5, 0.5)
					icon:setColor(cc.c3b(131, 131, 131))

					local state = equipData:getUnlock()

					unLock:setVisible(not state)
				end

				if not ownUnlock and heroId == "" then
					tipPanel:setVisible(true)
					tipPanel:getChildByFullName("Image_4_0"):setVisible(false)
					tipPanel:getChildByFullName("heroIcon"):setVisible(false)
					tipPanel:getChildByFullName("Image_4"):setVisible(false)
					tipPanel:getChildByFullName("Image_36"):setVisible(false)
					tipPanel:getChildByFullName("text"):setVisible(false)

					local unLock = tipPanel:getChildByFullName("Image_4_0")

					unLock:setVisible(true)
				end

				if self._selectEquipUUId == equipData:getId() then
					self._selectImage:setVisible(true)
					self._selectImage:removeFromParent(false)
					self._selectImage:addTo(node):center(node:getContentSize())
				end

				if self._heroData then
					local type = self._heroData:getType()
					local typeRange = equipData:getOccupation()

					if not table.indexof(typeRange, type) then
						tipPanel:setColor(cc.c3b(131, 131, 131))
						iconPanel:setColor(cc.c3b(131, 131, 131))
					end
				end

				data.amount = 1
				data.type = 6
				data.code = equipId
			end

			IconFactory:bindTouchHander(iconPanel, IconTouchHandler:new(self), data, {
				needDelay = true
			})
			icon:setScale(0.9)
			node:getChildByFullName("clickPanel"):setSwallowTouches(false)
			node:getChildByFullName("clickPanel"):addTouchEventListener(function (sender, eventType)
				self:onClickEquipIcon(sender, eventType, equipId, uuId, equipData)
			end)
		end
	end
end

function BagSelectMaterialMediator:onClickEquipIcon(sender, eventType, equipId, uuId, equipData)
	if eventType == ccui.TouchEventType.began then
		self.isDelay = false
		local delayAct = cc.DelayTime:create(0.2)
		local judgeShowAct = cc.CallFunc:create(function ()
			self.isDelay = true
		end)
		local seqAct = cc.Sequence:create(delayAct, judgeShowAct)

		sender:runAction(seqAct)

		self._isReturn = true
	elseif eventType == ccui.TouchEventType.ended then
		if self.isDelay then
			return
		end

		if self._isReturn then
			AudioEngine:getInstance():playEffect("Se_Click_Common_1", false)
			self:onSelectToReplace(sender, equipId, uuId, equipData)
		end
	elseif eventType == ccui.TouchEventType.canceled then
		-- Nothing
	end
end

function BagSelectMaterialMediator:onSelectToReplace(sender, equipId, uuId, equipData)
	if uuId == self._selectEquipUUId then
		return
	end

	self._selectImage:setVisible(true)
	self._selectImage:removeFromParent(false)
	self._selectImage:addTo(sender):center(sender:getContentSize())

	self._selectEquipId = equipId
	self._selectEquipUUId = uuId
	self._selectEquipEquipData = equipData
end

function BagSelectMaterialMediator:createSelectImage()
	local selectImage = ccui.ImageView:create("yizhuang_icon_ixuanzhong.png", 1)

	selectImage:addTo(self:getView())
	selectImage:setLocalZOrder(-1)
	selectImage:setScale(1.1)
	selectImage:setName("SelectImage")
	selectImage:setVisible(false)
	selectImage:retain()
	selectImage:removeFromParent(false)

	return selectImage
end

function BagSelectMaterialMediator:onOkClicked()
	if self._selectEquipId == "" then
		self:close()

		return
	end

	if self._selectEquipEquipData:getHeroId() ~= "" then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("bag_UI39")
		}))

		return
	end

	if not self._selectEquipEquipData:getUnlock() then
		self:dispatch(ShowTipEvent({
			tip = Strings:get("bag_UI38")
		}))

		return
	end

	if self._data.callBack then
		self._data.callBack(self._data, self._selectEquipId, self._selectEquipUUId)
	end

	self:close()
end

function BagSelectMaterialMediator:onBackCall()
	self:close()
end