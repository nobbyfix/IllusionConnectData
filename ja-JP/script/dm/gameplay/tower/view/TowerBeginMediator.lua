TowerBeginMediator = class("TowerBeginMediator", DmPopupViewMediator, _M)

TowerBeginMediator:has("_towerSystem", {
	is = "rw"
}):injectWith("TowerSystem")

local kBtnHandlers = {
	["main.describe_panel.button_rule"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickRule"
	},
	["movieClipPanel.Button_begin"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickBegin"
	}
}

function TowerBeginMediator:initialize()
	super.initialize(self)
end

function TowerBeginMediator:dispose()
	super.dispose(self)
end

function TowerBeginMediator:onRegister()
	super.onRegister(self)
	self:initData()
	self:initView()
end

function TowerBeginMediator:enterWithData()
	self:refreshData()
	self:refreshView()
end

function TowerBeginMediator:resumeWithData()
	self:refreshData()
	self:refreshView()
end

function TowerBeginMediator:initData()
	self._selectData = self._towerSystem:getTowerDataById(self._towerSystem:getCurTowerId())
	self._selectBaseData = self._selectData:getTowerBase():getConfig()
end

function TowerBeginMediator:initView()
	self._main = self:getView():getChildByFullName("main")

	self._main:addClickEventListener(function ()
		self:onClickBack()
	end)

	local kBtnHandlers = {
		["main.Button_Enter"] = {
			clickAudio = "Se_Click_Common_1",
			func = "onClickEnter"
		}
	}

	self:mapButtonHandlersClick(kBtnHandlers)

	local text1 = self._main:getChildByFullName("Text_desc1")
	local text2 = self._main:getChildByFullName("Text_desc1_0")

	text1:getVirtualRenderer():setMaxLineWidth(50)
	text2:getVirtualRenderer():setMaxLineWidth(50)
	text1:setLineSpacing(-2)
	text2:setLineSpacing(-2)
	text2:setPositionY(350)
	GameStyle:setCommonOutlineEffect(self._main:getChildByFullName("Text_desc_bie"))
	GameStyle:setCommonOutlineEffect(self._main:getChildByFullName("Text_desc_meng"))
	GameStyle:setCommonOutlineEffect(text1)
	GameStyle:setCommonOutlineEffect(text2)

	local img = self._selectBaseData.StartBanner

	self._main:getChildByFullName("Image_bg1"):loadTexture(img[1] .. ".png", ccui.TextureResType.plistType)
	self._main:getChildByFullName("Image_bg2"):loadTexture(img[2] .. ".png", ccui.TextureResType.plistType)
end

function TowerBeginMediator:refreshData()
end

function TowerBeginMediator:refreshView()
end

function TowerBeginMediator:onClickBack(sender, eventType)
	self:close()
end

function TowerBeginMediator:onClickEnter(sender, eventType)
	local towerId = self._towerSystem:getCurTowerId()
	local d = self._towerSystem:getTowerDataById(towerId)

	if d:getStatus() == kEnterFightStatus.END then
		self._towerSystem:requestEnterTower(towerId, function ()
			self._towerSystem:showTowerChooseRoleView()
			self:close()
		end)
	end
end
