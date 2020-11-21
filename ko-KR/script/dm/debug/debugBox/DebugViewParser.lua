DebugViewParser = class("DebugViewParser", objectlua.Object, _M)

function DebugViewParser:initialize()
	self._viewCache = {}
end

function DebugViewParser:dispose()
	for k, v in pairs(self._viewCache) do
		v:release()
	end

	self._viewCache = nil
end

function DebugViewParser:tryCreateView(id, viewObj)
	if self._viewCache[id] then
		return self._viewCache[id]:getView()
	end

	self.kViewWidth = 320
	self.kCellHeight = 100
	self.kSelectBoxWidth = 312
	self.kSelectBoxHeight = 200
	self.kSelectBoxCellWidth = 310
	self.kSelectBoxCellHeight = 30

	if viewObj.getViewWidth then
		self.kViewWidth = viewObj.getViewWidth()
	end

	local rootNode = ccui.Layout:create()

	viewObj:setView(rootNode)

	if not viewObj:isDynamic() then
		rootNode:retain()

		self._viewCache[id] = viewObj
	end

	rootNode:setContentSize(cc.size(self.kViewWidth, 640))

	local scollViewRect = ccui.Layout:create()

	scollViewRect:setName("scollViewRect")
	scollViewRect:setContentSize(cc.size(self.kViewWidth, 500))
	scollViewRect:setPositionY(rootNode:getContentSize().height * 0.5 - scollViewRect:getContentSize().height * 0.5)
	rootNode:addChild(scollViewRect, 1)
	scollViewRect:setBackGroundImageScale9Enabled(true)
	scollViewRect:setBackGroundImage(DebugBoxTool:getResPath("pic_dm_debug_tab_frame.png"))
	scollViewRect:setBackGroundImageCapInsets(cc.rect(20, 40, 18, 18))
	self:setupScrollerView(rootNode, scollViewRect, viewObj)

	local btnOk = ccui.Button:create(DebugBoxTool:getResPath("pic_dm_debug_ok_normal.png"), DebugBoxTool:getResPath("pic_dm_debug_ok_press.png"), "")

	btnOk:setName("btnOk")
	btnOk:setScale(1.5)
	scollViewRect:addChild(btnOk, 0)
	btnOk:setPosition(self.kViewWidth + btnOk:getContentSize().width * btnOk:getScale() * 0.5, btnOk:getContentSize().height * btnOk:getScale() * 0.5)
	btnOk:addTouchEventListener(function (sender, eventType)
		if eventType == ccui.TouchEventType.ended and viewObj.onClick then
			local config = viewObj:getViewConfig()
			local data = {}

			for k, v in pairs(config) do
				local curData = config[k]

				if curData.type == "Input" or curData.type == "SelectBox" then
					local text = curData.mtext

					if text == nil or text == "" then
						text = curData.default
					end

					data[curData.name] = text
				elseif curData.type == "Label" then
					-- Nothing
				end
			end

			data.type = viewObj:getOpType()

			viewObj:onClick(data)
		end
	end)

	return rootNode
end

function DebugViewParser:setupScrollerView(rootNode, scollViewRect, viewObj)
	local delegate = {}
	local parent = self
	local config = viewObj:getViewConfig()

	function delegate:createCellTemplate()
		local scollerCell = ccui.Layout:create()

		scollerCell:setName("scollerCell")
		scollerCell:setContentSize(cc.size(parent.kViewWidth, parent.kCellHeight))

		local label = ccui.Text:create("--", CUSTOM_TTF_DEBUG_BOX, 28)

		label:setName("label")
		label:setColor(cc.c3b(52, 65, 132))
		label:setAnchorPoint(cc.p(0, 0.5))
		scollerCell:addChild(label, 10)
		label:setPositionX(10)
		label:setPositionY(parent.kCellHeight - 20)

		local lineBg = ccui.Layout:create()

		lineBg:setContentSize(cc.size(parent.kViewWidth, 2))
		lineBg:setPosition(0, 0)
		scollerCell:addChild(lineBg, 1)
		lineBg:setBackGroundImageScale9Enabled(true)
		lineBg:setBackGroundImage(DebugBoxTool:getResPath("pic_dm_debug_line.png"))
		lineBg:setBackGroundImageCapInsets(cc.rect(20, 0, 5, 1))

		local bgNormal = ccui.ImageView:create(DebugBoxTool:getResPath("pic_dm_debug_tab_normal.png"))

		bgNormal:setVisible(true)
		bgNormal:setName("bgNormal")
		bgNormal:setScale9Enabled(true)
		bgNormal:setContentSize(cc.size(parent.kViewWidth, parent.kCellHeight))
		bgNormal:setCapInsets(cc.rect(30, 20, 14, 10))
		bgNormal:setAnchorPoint(cc.p(0, 0))
		scollerCell:addChild(bgNormal, 0)

		local bgPress = ccui.ImageView:create(DebugBoxTool:getResPath("pic_dm_debug_tab_press.png"))

		bgPress:setVisible(false)
		bgPress:setName("bgPress")
		bgPress:setScale9Enabled(true)
		bgPress:setCapInsets(cc.rect(30, 20, 14, 10))
		bgPress:setContentSize(cc.size(parent.kViewWidth, parent.kCellHeight))
		bgPress:setAnchorPoint(cc.p(0, 0))
		scollerCell:addChild(bgPress, 0)

		local textField = ccui.TextField:create("input words here", CUSTOM_TTF_DEBUG_BOX, 30)

		textField:setAnchorPoint(cc.p(0, 0))
		textField:setVisible(true)
		textField:setString("input words here")
		textField:setCursorEnabled(true)
		scollerCell:addChild(textField, 1000)
		textField:setPosition(10, parent.kCellHeight * 0.2)
		textField:setName("textField")

		return scollerCell
	end

	function delegate:_tableCellTouchedImpl(table, cell)
		local scollerCell = cell:getChildByName("scollerCell")

		if scollerCell == nil then
			scollerCell = cell
		end

		local bgPress = scollerCell:getChildByName("bgPress")

		if bgPress then
			if self._oldBgPress then
				self._oldBgPress:setVisible(false)
			end

			bgPress:setVisible(true)

			self._oldBgPress = bgPress
		end
	end

	function delegate:tableCellTouched(table, cell)
		self:_tableCellTouchedImpl(table, cell)
	end

	function delegate:cellNum()
		return #config
	end

	function delegate:cellSizeForTable(table, idx)
		local data = config[idx + 1]

		if data and data.type == "SelectBox" and data._selectBoxShow == true then
			return parent.kViewWidth, parent.kCellHeight + parent.kSelectBoxHeight
		end

		return nil
	end

	function delegate:createCell(cell, idx, tableView)
		cell:setSwallowTouches(false)

		local data = config[idx]

		if data ~= nil then
			local label = cell:getChildByName("label")

			if label then
				local name = data.name

				if data.title then
					name = data.title
				end

				label:setString(name)
			end

			if data.type == "Input" or data.type == "SelectBox" then
				local textField = cell:getChildByName("textField")

				if textField then
					textField:setVisible(true)
					textField:setTouchAreaEnabled(true)
					textField:setTouchSize(cc.size(parent.kViewWidth - 10, parent.kCellHeight - 10))

					if textField:getString() == "input words here" and data.default then
						textField:setString(data.default)
					end

					if data.type == "Input" then
						textField:addEventListener(function (sender, type)
							data.mtext = sender:getString()

							if type == ccui.TextFiledEventType.attach_with_ime then
								self:_tableCellTouchedImpl(table, cell)

								if data.mtext == tostring(data.default) then
									sender:setString("")
								end
							elseif type == ccui.TextFiledEventType.detach_with_ime then
								if data.mtext == tostring(data.default) or data.mtext == "" then
									sender:setString(data.default)
								end
							elseif type == ccui.TextFiledEventType.insert_text then
								-- Nothing
							elseif type == ccui.TextFiledEventType.delete_backward then
								-- Nothing
							end
						end)
					elseif data.type == "SelectBox" then
						textField:addEventListener(function (sender, type)
							data.mtext = sender:getString()

							if type == ccui.TextFiledEventType.attach_with_ime then
								self:_tableCellTouchedImpl(table, cell)
								sender:setString("")

								if data._selectBoxShow ~= true then
									data._selectBoxShow = true

									createSelectBox(cell, data)
									tableView:reloadData()
								end
							elseif type == ccui.TextFiledEventType.detach_with_ime then
								if data.mtext == tostring(data.default) or data.mtext == "" then
									sender:setString(data.default)
								end
							elseif type == ccui.TextFiledEventType.insert_text or type == ccui.TextFiledEventType.delete_backward then
								cell.selectBox.config = data.selectHandler(data.mtext)

								cell.selectBox.view:reloadData()
							end
						end)
					end
				end
			else
				local textField = cell:getChildByName("textField")

				if textField then
					textField:setVisible(false)
				end
			end

			function removeSelectBox(parentCell, idx)
				local cellChild = parentCell:getParent():getChildByTag(9988)

				parentCell:getParent():removeChildByTag(9988)
			end

			function createSelectBox(parentCell, data)
				local selectBoxDelegate = {}

				function selectBoxDelegate:createCellTemplate()
					local bg = ccui.Layout:create()

					bg:setSwallowTouches(false)
					bg:setName("scollViewRect")
					bg:setContentSize(cc.size(parent.kSelectBoxCellWidth, parent.kSelectBoxCellHeight - 1))
					bg:setBackGroundImageScale9Enabled(true)
					bg:setBackGroundImage(DebugBoxTool:getResPath("pic_dm_debug_tab_frame.png"))
					bg:setBackGroundImageCapInsets(cc.rect(20, 40, 18, 18))

					local text = ccui.Text:create("", CUSTOM_TTF_DEBUG_BOX, 18)

					text:setName("selectBoxLabel")
					text:setColor(cc.c3b(52, 65, 132))
					text:setAnchorPoint(cc.p(0, 0))
					text:setString("")
					text:setTag(999)
					text:setPositionX(5)
					bg:addChild(text)

					return bg
				end

				function selectBoxDelegate:cellSizeForTable(table, idx)
					return parent.kSelectBoxCellWidth, parent.kSelectBoxCellHeight
				end

				function selectBoxDelegate:tableCellTouched(table, _cell)
					local selectBoxCell = _cell:getChildByTag(110)
					local idx = selectBoxCell.configIdx
					local str = parentCell.selectBox.config[idx]
					local textField = parentCell:getChildByName("textField")

					if str and type(str) == "table" then
						data.mtext = str[1]

						textField:setString(str[1])
					elseif str then
						data.mtext = str

						textField:setString(str)
					end

					if data._selectBoxAutoHide and data._selectBoxShow == true then
						data._selectBoxShow = false

						removeSelectBox(parentCell)
						tableView:reloadData()
					end
				end

				function selectBoxDelegate:cellNum()
					return #parentCell.selectBox.config
				end

				function selectBoxDelegate:createCell(cellTemplate, idx)
					cellTemplate.configIdx = idx
					local str = parentCell.selectBox.config[idx]
					local label = cellTemplate:getChildByTag(999)

					if str and type(str) == "table" then
						label:setString(str[1] .. "," .. str[2])
					elseif str then
						label:setString(str)
					end
				end

				parentCell.selectBox = {
					config = data.selectHandler("")
				}
				local layout = ccui.Layout:create()

				layout:setName("scollViewRect")
				layout:setTag(9988)
				parentCell:getParent():addChild(layout, 1)
				layout:setBackGroundImageScale9Enabled(true)
				layout:setBackGroundImage(DebugBoxTool:getResPath("pic_dm_debug_tab_frame.png"))
				layout:setBackGroundImageCapInsets(cc.rect(20, 40, 18, 18))
				layout:setContentSize(cc.size(parent.kSelectBoxWidth, parent.kSelectBoxHeight))

				local tableView = DebugBoxTool:createTableView(layout, layout, selectBoxDelegate)

				tableView:setAnchorPoint(cc.p(0, 0))
				tableView:setPosition(cc.p(0, 5))
				layout:setAnchorPoint(cc.p(0, 0))
				layout:setPosition(cc.p(0, 0))

				parentCell.selectBox.view = tableView
			end

			removeSelectBox(cell, idx)

			if data.type == "SelectBox" and data._selectBoxShow == true then
				createSelectBox(cell, data)
			end
		end
	end

	DebugBoxTool:createTableView(rootNode, scollViewRect, delegate)
end
