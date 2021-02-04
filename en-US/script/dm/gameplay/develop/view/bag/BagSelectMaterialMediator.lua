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
	self._bagSystem = self._developSystem:getBagSystem()
	self._useBtn = self:bindWidget("main.usebtn", OneLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Common_1",
			func = bind1(self.onOkClicked, self)
		}
	})

	self:mapEventListener(self:getEventDispatcher(), EVT_EQUIP_LOCK_SUCC, self, self.refreshViewByLock)
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
	self._heroData = nil

	if data then
		self._viewType = EquipsShowType.kCompose

		self:refreshData(true)
	end
end

function BagSelectMaterialMediator:refreshData(isEnter)
	self._equipList = {}
	local allEquipList = self._equipSystem:getEquipList(self._viewType, self._curMaterial)

	for i = 1, #allEquipList do
		local oneEquip = allEquipList[i]
		local equipId = oneEquip:getEquipId()
		local uuId = oneEquip:getId()

		if self:checkUsed(equipId, uuId) == false then
			self._equipList[#self._equipList + 1] = oneEquip
		end
	end

	if isEnter then
		print("refreshData")
		table.sort(self._equipList, function (a, b)
			local a_lock = a:getUnlock() and 1 or 0
			local b_lock = b:getUnlock() and 1 or 0
			local a_used = a:getHeroId() ~= "" and 0 or 1
			local b_used = b:getHeroId() ~= "" and 0 or 1

			if a_lock + a_used == b_lock + b_used then
				if a_used == b_used then
					if a:getRarity() == b:getRarity() then
						if a:getStar() == b:getStar() then
							if a:getLevel() == b:getLevel() then
								if a:getSort() == b:getSort() then
									return a:getId() < b:getId()
								end

								return a:getSort() < b:getSort()
							end

							return a:getLevel() < b:getLevel()
						end

						return a:getStar() < b:getStar()
					end

					return a:getRarity() < b:getRarity()
				end

				return b_used < a_used
			end

			return a_lock + a_used > b_lock + b_used
		end)
	end

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
	self._itemCellLock = self:getView():getChildByFullName("cell_lock")

	self._itemCellLock:setVisible(false)
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

				if self:checkUsed(equipId, uuId) then
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

					unLock:setVisible(false)
				else
					tipPanel:setVisible(false)
					tipPanel:getChildByFullName("Image_4_0"):setVisible(false)
					tipPanel:getChildByFullName("heroIcon"):setVisible(false)
					tipPanel:getChildByFullName("Image_4"):setVisible(false)
					tipPanel:getChildByFullName("Image_36"):setVisible(false)
					tipPanel:getChildByFullName("text"):setVisible(false)

					local node_lock = self._itemCellLock:clone()

					node_lock:setVisible(true)
					node_lock:addTo(node):center(node:getContentSize())

					local Panel_unlock = node_lock:getChildByFullName("Panel_unlock")
					local Panel_lock = node_lock:getChildByFullName("Panel_lock")

					Panel_unlock:addTouchEventListener(function (sender, eventType)
						self:onUnlockOrLockEquip(sender, eventType, equipData)
					end)
					Panel_lock:addTouchEventListener(function (sender, eventType)
						self:onUnlockOrLockEquip(sender, eventType, equipData)
					end)

					if ownUnlock then
						Panel_unlock:setVisible(true)
						Panel_lock:setVisible(false)
					else
						Panel_unlock:setVisible(false)
						Panel_lock:setVisible(true)
					end
				end

				if self._selectEquipUUId == equipData:getId() then
					self._selectImage:setVisible(true)
					self._selectImage:removeFromParent(false)
					self._selectImage:addTo(node):center(node:getContentSize())
				end

				if self._heroData then
					local type = self._heroData:getType()
					local typeRange = equipData:getOccupation()
					local occupationType = equipData:getOccupationType()
					local heroId = self._heroData:getId()

					if occupationType == nil or occupationType == 0 then
						if not table.indexof(typeRange, type) then
							tipPanel:setColor(cc.c3b(131, 131, 131))
							iconPanel:setColor(cc.c3b(131, 131, 131))
						end
					elseif occupationType == 1 and not table.indexof(typeRange, heroId) then
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

function BagSelectMaterialMediator:checkUsed(equipId, uuid)
	local key_equip = equipId .. "_" .. uuid
	local usedList = self._equipSystem:getComposeUsedEquips()
	local used = false

	for key, value in pairs(usedList) do
		if key_equip == value then
			used = true

			break
		end
	end

	return used
end

function BagSelectMaterialMediator:onUnlockOrLockEquip(sender, eventType, equipData)
	if eventType == ccui.TouchEventType.began then
		self._isReturn = true
	elseif eventType == ccui.TouchEventType.ended and self._isReturn then
		local params = {
			viewtype = 2,
			equipId = equipData:getId()
		}
		self._doTip_Unlock = equipData:getUnlock()
		self._ChangeEquipData = equipData

		self._equipSystem:requestEquipLock(params)
	end
end

function BagSelectMaterialMediator:refreshViewByLock()
	local tip = self._doTip_Unlock and Strings:get("Equip_Lock_Tips_2") or Strings:get("Equip_Lock_Tips_1")

	self:dispatch(ShowTipEvent({
		tip = tip
	}))
	self._ChangeEquipData:setUnlock(not self._doTip_Unlock)

	local offsetY = self._equipView:getContentOffset().y

	self._equipView:reloadData()
	self._equipView:setContentOffset(cc.p(0, offsetY))
end
