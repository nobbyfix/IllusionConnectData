EquipStarItemSelectMediator = class("EquipStarItemSelectMediator", DmPopupViewMediator, _M)

EquipStarItemSelectMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")

local kBtnHandlers = {
	["main.nNode.button"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickN"
	},
	["main.rNode.button"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickR"
	},
	["main.srNode.button"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickSR"
	},
	["main.ssrNode.button"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickSSR"
	},
	["main.starNode.button"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickStar"
	},
	["main.stiveNode.button"] = {
		clickAudio = "Se_Click_Common_1",
		func = "onClickStive"
	}
}

function EquipStarItemSelectMediator:initialize()
	super.initialize(self)
end

function EquipStarItemSelectMediator:dispose()
	super.dispose(self)
end

function EquipStarItemSelectMediator:onRegister()
	super.onRegister(self)

	self._equipSystem = self._developSystem:getEquipSystem()

	self:mapButtonHandlersClick(kBtnHandlers)

	self._bgWidget = bindWidget(self, "main.bgNode", PopupNormalWidget, {
		btnHandler = {
			clickAudio = "Se_Click_Close_2",
			func = bind1(self.onOkClicked, self)
		},
		title = Strings:get("Equip_UI75"),
		title1 = Strings:get("Equip_UI85"),
		bgSize = {
			width = 757,
			height = 473
		}
	})
	self._sureWidget = self:bindWidget("main.okBtn", TwoLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Confirm",
			func = bind1(self.onClickSure, self)
		}
	})
	self._quickWidget = self:bindWidget("main.cancelBtn", TwoLevelViceButton, {
		handler = {
			clickAudio = "Se_Click_Confirm",
			func = bind1(self.onOkClicked, self)
		}
	})
end

function EquipStarItemSelectMediator:enterWithData()
	self:initData()
	self:initView()
	self:refreshView()
end

function EquipStarItemSelectMediator:initData()
	self._selectData = {}
	local value = cc.UserDefault:getInstance():getStringForKey(UserDefaultKey.kEquipQuickSelectKey)

	if value ~= "" then
		local valueTemp = string.split(value, "&")

		for i = 1, #valueTemp do
			local keys = string.split(valueTemp[i], "_")
			self._selectData[keys[1]] = keys[2]
		end
	end
end

function EquipStarItemSelectMediator:initView()
	self._main = self:getView():getChildByFullName("main")
	self._nNode = self._main:getChildByFullName("nNode")
	self._rNode = self._main:getChildByFullName("rNode")
	self._srNode = self._main:getChildByFullName("srNode")
	self._ssrNode = self._main:getChildByFullName("ssrNode")
	self._starNode = self._main:getChildByFullName("starNode")
	self._stiveNode = self._main:getChildByFullName("stiveNode")
end

function EquipStarItemSelectMediator:refreshView()
	self:resetSelectView(self._nNode, self._selectData["11"])
	self:resetSelectView(self._rNode, self._selectData["12"])
	self:resetSelectView(self._srNode, self._selectData["13"])
	self:resetSelectView(self._ssrNode, self._selectData["14"])
	self:resetSelectView(self._starNode, self._selectData.onlyOneStar)
	self:resetSelectView(self._stiveNode, self._selectData.canUseStive)
end

function EquipStarItemSelectMediator:resetSelectView(node, state)
	local show = state == "1"

	node:getChildByFullName("btnImage"):setVisible(show)
end

function EquipStarItemSelectMediator:onClickN()
	self:dispatch(ShowTipEvent({
		tip = Strings:get("Equip_UI78")
	}))

	return

	if self._selectData["11"] == "0" then
		self._selectData["11"] = "1"
	else
		self._selectData["11"] = "0"
	end

	self:resetSelectView(self._nNode, self._selectData["11"])
end

function EquipStarItemSelectMediator:onClickR()
	if self._selectData["12"] == "0" then
		self._selectData["12"] = "1"
	else
		self._selectData["12"] = "0"
	end

	self:resetSelectView(self._rNode, self._selectData["12"])
end

function EquipStarItemSelectMediator:onClickSR()
	if self._selectData["13"] == "0" then
		self._selectData["13"] = "1"
	else
		self._selectData["13"] = "0"
	end

	self:resetSelectView(self._srNode, self._selectData["13"])
end

function EquipStarItemSelectMediator:onClickSSR()
	if self._selectData["14"] == "0" then
		self._selectData["14"] = "1"
	else
		self._selectData["14"] = "0"
	end

	self:resetSelectView(self._ssrNode, self._selectData["14"])
end

function EquipStarItemSelectMediator:onClickStar()
	if self._selectData.onlyOneStar == "0" then
		self._selectData.onlyOneStar = "1"
	else
		self._selectData.onlyOneStar = "0"
	end

	self:resetSelectView(self._starNode, self._selectData.onlyOneStar)
end

function EquipStarItemSelectMediator:onClickStive()
	if self._selectData.canUseStive == "0" then
		self._selectData.canUseStive = "1"
	else
		self._selectData.canUseStive = "0"
	end

	self:resetSelectView(self._stiveNode, self._selectData.canUseStive)
end

function EquipStarItemSelectMediator:onClickSure()
	self:dispatch(ShowTipEvent({
		tip = Strings:get("Equip_UI74")
	}))

	local str = ""

	for key, value in pairs(self._selectData) do
		if str == "" then
			str = key .. "_" .. value
		else
			str = str .. "&" .. key .. "_" .. value
		end
	end

	cc.UserDefault:getInstance():setStringForKey(UserDefaultKey.kEquipQuickSelectKey, str)
	self._equipSystem:resetEquipQuickSelect()
	self:close()
end

function EquipStarItemSelectMediator:onOkClicked()
	self:close()
end
