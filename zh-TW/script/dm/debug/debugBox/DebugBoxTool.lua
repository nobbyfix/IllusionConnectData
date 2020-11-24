DebugBoxTool = {
	getResPath = function (self, resName)
		return "debug/" .. resName
	end,
	createTableView = function (self, rootNode, scollViewRect, delegate)
		assert(delegate ~= nil, "can not be nil")

		local panel = rootNode
		local scollerCell = nil

		if delegate and delegate.createCellTemplate then
			scollerCell = delegate:createCellTemplate()
		end

		assert(scollerCell ~= nil, "function delegate.createCellTemplate can not be nil")
		scollerCell:setVisible(false)
		rootNode:addChild(scollerCell)

		local allCellNum = 0
		local selectCell = nil
		local kCellRoundTag = 110

		local function scrollViewDidScroll(view)
		end

		local function scrollViewDidZoom(view)
		end

		local function tableCellTouched(table, cell)
			if delegate and delegate.tableCellTouched then
				delegate:tableCellTouched(table, cell)
			end
		end

		local roundRowSize = scollerCell:getContentSize()

		local function cellSizeForTable(table, idx)
			return roundRowSize.width, roundRowSize.height
		end

		local function createCell(cell, idx)
			if delegate and delegate.createCell then
				delegate:createCell(cell, idx)
			end
		end

		local function tableCellAtIndex(table, idx)
			local cell = table:dequeueCell()

			if cell == nil then
				cell = cc.TableViewCell:new()
				local roundCell = scollerCell:clone()

				roundCell:setPosition(cc.p(0, 0))
				roundCell:setAnchorPoint(cc.p(0, 0))
				roundCell:setVisible(true)
				cell:addChild(roundCell, 11, kCellRoundTag)
				createCell(roundCell, idx + 1)
			else
				local roundCell = cell:getChildByTag(kCellRoundTag)

				createCell(roundCell, idx + 1)
			end

			return cell
		end

		local function numberOfCellsInTableView(table)
			if delegate and delegate.cellNum then
				return delegate:cellNum(cell, idx)
			end

			return 0
		end

		local size = scollViewRect:getContentSize()
		size.height = size.height - 6
		size.width = size.width - 6
		local scollerView = cc.TableView:create(size)

		scollerView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
		scollerView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
		scollerView:setPosition(scollViewRect:getPosition())
		scollerView:setPositionX(scollerView:getPositionX() + 2)
		scollerView:setDelegate()
		panel:addChild(scollerView, 9999)
		scollerView:registerScriptHandler(numberOfCellsInTableView, cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
		scollerView:registerScriptHandler(scrollViewDidScroll, cc.SCROLLVIEW_SCRIPT_SCROLL)
		scollerView:registerScriptHandler(scrollViewDidZoom, cc.SCROLLVIEW_SCRIPT_ZOOM)
		scollerView:registerScriptHandler(tableCellTouched, cc.TABLECELL_TOUCHED)
		scollerView:registerScriptHandler(cellSizeForTable, cc.TABLECELL_SIZE_FOR_INDEX)
		scollerView:registerScriptHandler(tableCellAtIndex, cc.TABLECELL_SIZE_AT_INDEX)
		scollerView:setTouchEnabled(true)
		scollerView:reloadData()
		scollerView:setTag(999991)
		scollerView:setName("scollerView")

		return scollerView
	end,
	centerAddNode = function (self, parentNode, node, zorder, tag, offset)
		if parentNode and node then
			local ps = parentNode:getContentSize()
			local cs = node:getContentSize()
			local cax = node:getAnchorPoint().x
			local cay = node:getAnchorPoint().y
			local x = ps.width * 0.5 - (0.5 - cax) * cs.width
			local y = ps.height * 0.5 - (0.5 - cay) * cs.height

			if offset then
				x = x + offset.x
				y = y + offset.y
			end

			node:setPosition(x, y)
			parentNode:addChild(node, zorder or 0, tag or 0)
		else
			pclog("warning", "parentNode or node is nil!!!")
		end
	end
}
