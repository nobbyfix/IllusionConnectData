ArenaReportCell = class("ArenaReportCell", DisposableObject, _M)
local kPicUp = "asset/common/st_img_up.png"
local kPicDown = "st_img_down.png"

function ArenaReportCell:initialize(info)
	super.initialize(self)

	local resFile = "asset/ui/ArenaReportCell.csb"
	self._view = cc.CSLoader:createNode(resFile)
	self._mediator = info.mediator

	self:setupView()
end

function ArenaReportCell:dispose()
	super.dispose()
end

function ArenaReportCell:getView()
	return self._view
end

function ArenaReportCell:setupView()
	self:initWidgetInfo()
end

function ArenaReportCell:initWidgetInfo()
	local bg = self:getView():getChildByName("bg")
	self._video = bg:getChildByName("button_video")
	self._share = bg:getChildByName("button_share")
	self._iconBg = bg:getChildByName("icon_bg")
	self._iconBg_r = bg:getChildByName("icon_bg1")
	local panel = bg:getChildByFullName("panel1")
	self._name = panel:getChildByName("role_name")
	self._level = panel:getChildByName("level")
	self._name_r = panel:getChildByName("role_name1")
	self._level_r = panel:getChildByName("level1")
	self._changeBg = panel:getChildByFullName("changeBg")
	self._sign = panel:getChildByFullName("changeBg.sign")
	self._increase = panel:getChildByFullName("changeBg.increase")
	self._imgResult = panel:getChildByName("result")

	GameStyle:setCommonOutlineEffect(self._level)
	GameStyle:setCommonOutlineEffect(self._level_r)
end

function ArenaReportCell:refreshReportData(data)
	local attackerData = data:getAttacker()
	local defenseData = data:getDefender()
	local showData, showMyData = nil
	local raise = data:getRankChange()
	local isAttacker = nil

	if self._mediator:getDevelopSystem():getRid() == attackerData:getId() then
		showData = defenseData
		showMyData = attackerData
		isAttacker = true
	else
		isAttacker = false
		showMyData = defenseData
		showData = attackerData
	end

	self:setupMyInfo(showMyData)

	local headId = showData:getHeadImg() or "Master_XueZhan"
	local level = showData:getLevel()
	local nickName = showData:getNickname()

	self._iconBg_r:removeAllChildren()

	local headicon = IconFactory:createPlayerIcon({
		frameStyle = 3,
		id = headId
	})

	headicon:addTo(self._iconBg_r):center(self._iconBg_r:getContentSize())
	self._name_r:setString(nickName)
	self._level_r:setString(Strings:get("CUSTOM_FIGHT_LEVEL") .. level)

	if raise <= 0 then
		self._changeBg:setVisible(false)
	else
		self._changeBg:setVisible(true)
		self._sign:loadTexture(kPicUp)
		self._increase:setString(Strings:get("RANK_UI13", {
			num = raise
		}))
	end

	local result = isAttacker and data:getAttackerWin()

	if result then
		self._imgResult:getChildByName("text"):setString(Strings:get("Arena_Victory"))
		self._imgResult:setGray(false)
	else
		self._imgResult:getChildByName("text"):setString(Strings:get("Arena_Defeat"))
		self._imgResult:setGray(true)
	end
end

function ArenaReportCell:setupMyInfo(showData)
	local headId = showData:getHeadImg() or "YFZZhu"
	local level = showData:getLevel()
	local nickName = showData:getNickname()

	self._iconBg:removeAllChildren()

	local headicon = IconFactory:createPlayerIcon({
		frameStyle = 3,
		id = headId
	})

	headicon:addTo(self._iconBg):center(self._iconBg:getContentSize())
	self._name:setString(nickName)
	self._level:setString(Strings:get("CUSTOM_FIGHT_LEVEL") .. level)
end
