ServerAnnounceMediatorNew = class("ServerAnnounceMediatorNew", DmPopupViewMediator, _M)

ServerAnnounceMediatorNew:has("_loginSystem", {
	is = "r"
}):injectWith("LoginSystem")
require("dm.downloader.Downloader")

local kBtnHandlers = {
	["main.btn_close"] = {
		clickAudio = "Se_Click_Close_2",
		func = "onClickClose"
	}
}
local redPointType = {
	KOneTime = 3,
	KNotShow = 1,
	KOneTimeEveryDay = 2
}

function ServerAnnounceMediatorNew:initialize()
	super.initialize(self)
end

function ServerAnnounceMediatorNew:dispose()
	super.dispose(self)
end

function ServerAnnounceMediatorNew:onRemove()
	super.onRemove(self)
end

function ServerAnnounceMediatorNew:mapEventListeners()
	self:mapEventListener(self:getEventDispatcher(), EVT_ANNOUNCE_REFRESH_SERVER, self, self.onRefreshAnnounceEvent)
	self:mapEventListener(self:getEventDispatcher(), EVT_PATFACE_REFRESH_SERVER, self, self.onRefreshPatfaceEvent)
end

function ServerAnnounceMediatorNew:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	self._main = self:getView():getChildByName("main")

	self._main:getChildByName("view_bg"):setTouchEnabled(true)

	self._btnUpModel = self:getView():getChildByName("btn_up")

	self._btnUpModel:setVisible(false)

	self._btnLeftModel = self:getView():getChildByName("btn_left")

	self._btnLeftModel:setVisible(false)

	self._centerType1 = self:getView():getChildByName("centerType1")

	self._centerType1:setVisible(false)

	self._centerType2 = self:getView():getChildByName("centerType2")

	self._centerType2:setVisible(false)

	self._centerType3 = self:getView():getChildByName("centerType3")

	self._centerType3:setVisible(false)

	self._activityLayout = self._main:getChildByName("activityLayout")
	self._listViewLeft = self._activityLayout:getChildByName("ListView_left")

	self._listViewLeft:setScrollBarEnabled(false)

	self._listViewCenter = self._activityLayout:getChildByName("ListView_center")

	self._listViewCenter:setScrollBarEnabled(false)

	self._listViewUp = self._main:getChildByName("ListView_up")

	self._listViewUp:setScrollBarEnabled(false)
	self._listViewUp:setVisible(false)

	self._downloader = Downloader:getInstance()
	self.btnUpTable = {}
	self.btnLeftTable = {}
	self.loadTaskTable = {}
	self.relativeFolderPath = cc.FileUtils:getInstance():getWritablePath() .. "AnnounceDir"
	self.playerRid = self:getInjector():getInstance("DevelopSystem"):getPlayer():getRid()

	self:mapEventListeners()
end

function ServerAnnounceMediatorNew:enterWithData(data)
	self._data = data

	self:setupView()
end

function ServerAnnounceMediatorNew:setupView()
	local AnnounceDate = {
		["1"] = {
			type = "activity",
			data = {}
		},
		["2"] = {
			type = "system",
			data = {}
		}
	}

	self:setUpList(AnnounceDate)
end

function ServerAnnounceMediatorNew:setUpList(AnnounceDate)
	for k, v in pairs(AnnounceDate) do
		local layout = ccui.Widget:create()
		local cell = self._btnUpModel:clone()

		cell:setVisible(true)

		if v.type == "activity" then
			cell:getChildByName("btn_up_lbl"):setString(Strings:get("LOGIN_UI_Activity"))
		elseif v.type == "system" then
			cell:getChildByName("btn_up_lbl"):setString(Strings:get("LOGIN_UI1"))
		end

		local cellSize = cell:getContentSize()

		cell:addTo(layout):posite(cellSize.width / 2, cellSize.height / 2)

		cell.data = v

		layout:setContentSize(cellSize)

		local function callFunc(sender, eventType)
			self:changBtnUp(sender, 0)
		end

		cell:setTag(tonumber(k))
		layout:setTag(tonumber(k))
		mapButtonHandlerClick(nil, cell, {
			func = callFunc
		})
		table.insert(self.btnUpTable, cell)
		self._listViewUp:pushBackCustomItem(layout)
	end

	self._listViewUp:setTouchEnabled(#self.btnUpTable > 4)
	self:changBtnUp(self.btnUpTable[1])
end

function ServerAnnounceMediatorNew:changBtnUp(sender, isDeductTime)
	if not sender then
		return
	end

	local _data = sender.data

	for k, cell in pairs(self.btnUpTable) do
		local lbl = cell:getChildByName("btn_up_lbl")

		if cell:getTag() == sender:getTag() then
			cell:setTouchEnabled(false)
			cell:loadTexture("gg_btn_s_xz.png", ccui.TextureResType.plistType)

			local lineGradiantVec2 = {
				{
					ratio = 0.3,
					color = cc.c4b(22, 22, 22, 255)
				},
				{
					ratio = 0.7,
					color = cc.c4b(88, 88, 88, 255)
				}
			}

			lbl:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
				x = 0,
				y = -1
			}))
			self._listViewCenter:removeAllChildren()
			self._listViewLeft:removeAllChildren()

			if cell.data.type == "system" then
				self:setSystemView()
			elseif cell.data.type == "activity" then
				self:setActivityView(isDeductTime)
			end
		else
			cell:setTouchEnabled(true)
			cell:loadTexture("gg_btn_s_wxz.png", ccui.TextureResType.plistType)

			local lineGradiantVec2 = {
				{
					ratio = 0.3,
					color = cc.c4b(255, 246, 255, 255)
				},
				{
					ratio = 0.7,
					color = cc.c4b(255, 246, 255, 255)
				}
			}

			lbl:enablePattern(cc.LinearGradientPattern:create(lineGradiantVec2, {
				x = 0,
				y = -1
			}))
		end
	end
end

function ServerAnnounceMediatorNew:onRefreshAnnounceEvent()
	local _data = self._loginSystem:getAnnounceSaveData()

	if _data then
		self.btnLeftTable = {}

		if not _data.data then
			return
		end

		self._listViewLeft:pushBackCustomItem(self:getLeftListCell(_data.data, 1))
		self._listViewCenter:setTouchEnabled(true)
		self._listViewCenter:pushBackCustomItem(self:getCenterType3Cell(_data.data))
	end
end

function ServerAnnounceMediatorNew:setSystemView()
	if self._loginSystem:getLoginUrl() then
		if self._data.isDeductTime == 1 then
			self:onRefreshAnnounceEvent()
		else
			local params = {}

			self._loginSystem:getAnnounceData(params, function (errorCode, responseData)
			end)
		end
	end
end

function ServerAnnounceMediatorNew:onRefreshPatfaceEvent()
	local response = self._loginSystem:getPatFaceSaveData()

	self._listViewUp:setVisible(true)

	if response.data then
		table.sort(response.data, function (a, b)
			return a.priority < b.priority
		end)

		if #response.data == 0 then
			self._listViewUp:removeChildByTag(1, true)
			table.remove(self.btnUpTable, 1)
			self:changBtnUp(self.btnUpTable[1])

			return
		end

		self.btnLeftTable = {}

		for k, v in pairs(response.data) do
			local redPointType = v.redDot or redPointType.KOneTimeEveryDay
			local layout = self:getLeftListCell(v.mainbody, k, v, redPointType)

			self._listViewLeft:pushBackCustomItem(layout)
		end

		self:selectLifeCell(1)
	end
end

function ServerAnnounceMediatorNew:setActivityView(isDeductTime)
	if self._data.isDeductTime == 1 then
		self:onRefreshPatfaceEvent()
	else
		local params = {
			isDeductTime = isDeductTime and isDeductTime or self._data.isDeductTime
		}

		self._loginSystem:getPatFaceData(params, function (response)
		end)
	end
end

function ServerAnnounceMediatorNew:addRedPoint(curRedPointType, redPointAnnounceKey, cell)
	redPointAnnounceKey = tonumber(redPointAnnounceKey) and tonumber(redPointAnnounceKey) or 0

	if curRedPointType == redPointType.KNotShow then
		return
	end

	if curRedPointType == redPointType.KOneTimeEveryDay then
		local curDayTime = TimeUtil:getTimeByDateForTargetTimeInToday({
			sec = 0,
			min = 0,
			hour = 5
		})

		if curDayTime < redPointAnnounceKey then
			return
		end
	end

	if redPointAnnounceKey > 0 and curRedPointType == redPointType.KOneTime then
		return
	end

	local redPoint = RedPoint:createDefaultNode()

	redPoint:addTo(cell):posite(193, 72)
	redPoint:setLocalZOrder(99900)

	cell.redPoint = redPoint
end

function ServerAnnounceMediatorNew:getLeftListCell(_data, k, activityData, curRedPointType)
	local layout = ccui.Widget:create()
	local cell = self._btnLeftModel:clone()

	cell:setVisible(true)

	local lbl = cell:getChildByName("btn_left_lbl")
	_data.tag = _data.tag and _data.tag or ""

	lbl:setString(_data.tag)

	local redPointAnnounceKey = self.playerRid and cc.UserDefault:getInstance():getStringForKey(self.playerRid .. "redPointAnnounce" .. _data.tag) or 0

	if activityData and redPointAnnounceKey ~= 0 then
		self:addRedPoint(curRedPointType, redPointAnnounceKey, cell)
	end

	local cellSize = cell:getContentSize()

	layout:setContentSize(cc.size(cellSize.width, cellSize.height - 10))
	cell:addTo(layout):posite(cellSize.width / 2, cellSize.height / 2)

	cell.data = activityData and activityData or _data

	local function callFunc(sender, eventType)
		self:changBtnLeft(sender)
	end

	mapButtonHandlerClick(nil, cell, {
		func = callFunc
	})
	cell:setTouchEnabled(activityData ~= nil)
	cell:setTag(tonumber(k))
	table.insert(self.btnLeftTable, cell)

	return layout
end

function ServerAnnounceMediatorNew:getCenterType3Cell(_data)
	local layout = ccui.Widget:create()
	local cell = self._centerType3:clone()
	local title_lbl1 = cell:getChildByName("title_lbl1")

	title_lbl1:setString(_data.title)

	local title_lbl2 = cell:getChildByName("title_lbl2")

	title_lbl2:setString("")

	local announce = _data.content
	local kWidth = cell:getContentSize().width
	local t = TextTemplate:new(announce)
	local params = {
		fontName = TTF_FONT_FZYH_R
	}
	announce = t:stringify(params)
	local contentText = ccui.RichText:createWithXML(announce, {})

	contentText:setAnchorPoint(cc.p(0, 1))
	contentText:renderContent(kWidth, 0)
	contentText:setTouchEnabled(true)

	local size = contentText:getContentSize()
	local height = size.height + 42

	contentText:addTo(cell):posite(title_lbl2:getPosition())
	layout:setContentSize(cc.size(kWidth, height))
	cell:setAnchorPoint(cc.p(0, 1))
	cell:addTo(layout):posite(0, height)
	cell:setVisible(true)
	contentText:setOpenUrlHandler(function (url)
		if url and string.find(url, "http") then
			cc.Application:getInstance():openURL(url)
		end
	end)

	return layout
end

function ServerAnnounceMediatorNew:selectLifeCell(index)
	if #self.btnLeftTable > 0 then
		self:changBtnLeft(self.btnLeftTable[index])
	end
end

function ServerAnnounceMediatorNew:changBtnLeft(sender)
	for k, cell in pairs(self.btnLeftTable) do
		if cell:getTag() == sender:getTag() then
			local data = sender.data

			cell:setTouchEnabled(false)
			cell:loadTexture("gg_btn_z_xz.png", ccui.TextureResType.plistType)

			self.loadTaskTable = {}

			self._listViewCenter:removeAllChildren()
			self:setCenterList(data)

			if cell.redPoint and cell.redPoint:isVisible() then
				cell.redPoint:setVisible(false)

				local curTime = self:getInjector():getInstance("GameServerAgent"):remoteTimestamp()

				cc.UserDefault:getInstance():setStringForKey(self.playerRid .. "redPointAnnounce" .. data.mainbody.tag, tostring(curTime))
			end
		else
			cell:setTouchEnabled(true)
			cell:loadTexture("gg_btn_z_wxz.png", ccui.TextureResType.plistType)
		end
	end
end

function ServerAnnounceMediatorNew:setCenterList(data)
	if data.tpl == "1" then
		self:setCenterType1(data)
	elseif data.tpl == "2" then
		self:setCenterType2(data)
	end

	self:announceDownloadImg()
end

function ServerAnnounceMediatorNew:setCenterType1(data)
	self._listViewCenter:setTouchEnabled(false)

	local cell = self._centerType1:clone()
	local btn_img = cell:getChildByName("btn_img")

	btn_img:setVisible(true)
	cell:setVisible(true)

	local function callFunc(sender, eventType)
		self._loginSystem:setIsShowAnnounce(false)

		local url = data.link

		if not url then
			return
		end

		if string.find(url, "http") then
			cc.Application:getInstance():openURL(url)
		else
			local param = {}

			self:getEventDispatcher():dispatchEvent(Event:new(EVT_OPENURL, {
				url = url,
				extParams = param
			}))
		end
	end

	mapButtonHandlerClick(nil, cell, {
		func = callFunc
	})
	self._listViewCenter:pushBackCustomItem(cell)

	local fileUtils = cc.FileUtils:getInstance()

	if not fileUtils:isDirectoryExist(self.relativeFolderPath) then
		fileUtils:createDirectory(self.relativeFolderPath)
	end

	local storagePath = self.relativeFolderPath .. data.mainbody.images[1]

	if fileUtils:isFileExist(storagePath) then
		btn_img:loadTexture(storagePath, ccui.TextureResType.localType)

		return
	end

	local function loadEnd(isSuccess, storagePath)
		if isSuccess and not tolua.isnull(btn_img) and fileUtils:isFileExist(storagePath) then
			btn_img:loadTexture(storagePath, ccui.TextureResType.localType)
		end
	end

	local params = {
		loadEnd = loadEnd,
		urlPath = data.baseUrl .. data.mainbody.images[1]
	}

	self:addDownLoadTask(storagePath, params)
end

function ServerAnnounceMediatorNew:addDownLoadTask(storagePath, params)
	if not self.loadTaskTable[storagePath] then
		self.loadTaskTable[storagePath] = {}
	end

	table.insert(self.loadTaskTable[storagePath], params)
end

function ServerAnnounceMediatorNew:setCenterType2(data)
	self._listViewCenter:setTouchEnabled(true)

	local cell = self._centerType2:clone()

	cell:setAnchorPoint(cc.p(0, 1))
	cell:setVisible(true)

	local btn_img = cell:getChildByName("bg_img")

	self._listViewCenter:pushBackCustomItem(cell)

	local titleLabel = cell:getChildByName("title_lbl1")

	titleLabel:setString(data.mainbody.title)

	local descLabel = cell:getChildByName("title_lbl2")

	descLabel:setString("")

	local announce = data.mainbody.content

	if announce then
		local t = TextTemplate:new(announce)
		local params = {
			fontName = TTF_FONT_FZYH_R
		}
		announce = t:stringify(params)
		local richText = ccui.RichText:createWithXML(announce, {})

		richText:setAnchorPoint(descLabel:getAnchorPoint())
		richText:setPosition(cc.p(descLabel:getPosition()))
		richText:addTo(descLabel:getParent())
		richText:renderContent(700, 0, true)
		richText:setTouchEnabled(true)
		richText:setOpenUrlHandler(function (url)
			if url and string.find(url, "http") then
				cc.Application:getInstance():openURL(url)
			end
		end)

		local addHeight = richText:getContentSize().height - richText:getPositionY()

		if self.btnLeftTable[#self.btnLeftTable].data ~= data then
			addHeight = addHeight + 50
		end

		local layout = ccui.Widget:create()

		layout:setContentSize(cc.size(cell:getContentSize().width, addHeight))
		self._listViewCenter:pushBackCustomItem(layout)
	end

	local fileUtils = cc.FileUtils:getInstance()

	if not fileUtils:isDirectoryExist(self.relativeFolderPath) then
		fileUtils:createDirectory(self.relativeFolderPath)
	end

	local storagePath = self.relativeFolderPath .. data.mainbody.images[1]

	if fileUtils:isFileExist(storagePath) then
		btn_img:loadTexture(storagePath, ccui.TextureResType.localType)

		return
	end

	local function loadEnd(isSuccess, storagePath)
		if isSuccess and not tolua.isnull(btn_img) and fileUtils:isFileExist(storagePath) then
			btn_img:loadTexture(storagePath, ccui.TextureResType.localType)
		end
	end

	local params = {
		loadEnd = loadEnd,
		urlPath = data.baseUrl .. data.mainbody.images[1]
	}

	self:addDownLoadTask(storagePath, params)
end

function ServerAnnounceMediatorNew:announceDownloadImg()
	if self._downloader then
		for storagePath, params in pairs(self.loadTaskTable) do
			local function onFileTaskSuccess(task)
				for k, v in pairs(params) do
					if v.loadEnd then
						v.loadEnd(true, storagePath)
					end
				end
			end

			local function onTaskError(task, errorCode, errorCodeInternal, errorStr)
				for k, v in pairs(params) do
					if v.loadEnd then
						v.loadEnd(false)
					end
				end
			end

			local taskInfo = {
				type = "file",
				identifier = storagePath,
				srcUrl = params[1].urlPath,
				storagePath = storagePath,
				onTaskError = onTaskError,
				onFileTaskSuccess = onFileTaskSuccess
			}

			self._downloader:addDownloadTask(taskInfo)
		end
	end
end

function ServerAnnounceMediatorNew:resetData()
	cc.FileUtils:getInstance():removeDirectory(self.relativeFolderPath)
	self._loginSystem:setIsShowAnnounce(false)
end

function ServerAnnounceMediatorNew:onClickClose(sender, eventType)
	self:resetData()
	self:close()
end
