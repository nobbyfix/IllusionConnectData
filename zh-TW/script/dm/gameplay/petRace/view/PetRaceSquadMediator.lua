PetRaceSquadMediator = class("PetRaceSquadMediator", DmPopupViewMediator)

PetRaceSquadMediator:has("_petRaceSystem", {
	is = "r"
}):injectWith("PetRaceSystem")

local kBtnHandlers = {
	["Panel_base.btn_close"] = {
		clickAudio = "Se_Click_Close_2",
		func = "onBackClicked"
	}
}

function PetRaceSquadMediator:initialize()
	super.initialize(self)
end

function PetRaceSquadMediator:dispose()
	super.dispose(self)
end

function PetRaceSquadMediator:onRegister()
	super.onRegister(self)
	self:mapButtonHandlersClick(kBtnHandlers)

	for i = 1, 3 do
		local index = i
		local node_team = self:getView():getChildByFullName("Panel_base.Node_team_" .. i)
		local image_bg = node_team:getChildByFullName("Panel_base.Image_bg")

		image_bg:setTouchEnabled(true)
		self:mapButtonHandlerClick(image_bg, function ()
			self:onClickedIndex(index)
		end, node_team)
	end
end

function PetRaceSquadMediator:enterWithData(data)
	self._raceData = data.dataInfo
	self._clickIndex = data.clickIndex
	self._index = 1
	self._showFinalEmbattles = {}
	local finalEmbattles = self._raceData.finalEmbattle or {}

	if self._clickIndex <= 8 then
		self._showFinalEmbattles[1] = finalEmbattles[1]
		self._showFinalEmbattles[2] = finalEmbattles[2]
		self._showFinalEmbattles[3] = finalEmbattles[3]
	elseif self._clickIndex <= 12 then
		self._showFinalEmbattles[1] = finalEmbattles[4]
		self._showFinalEmbattles[2] = finalEmbattles[5]
		self._showFinalEmbattles[3] = finalEmbattles[6]
	else
		self._showFinalEmbattles[1] = finalEmbattles[7]
		self._showFinalEmbattles[2] = finalEmbattles[8]
		self._showFinalEmbattles[3] = finalEmbattles[9]
	end

	self:setupView()
	self:initWigetInfo()
end

function PetRaceSquadMediator:setupView()
	self._mainPanel = self:getView():getChildByFullName("Panel_base")
	local node_name = self._mainPanel:getChildByFullName("title_node")

	bindWidget(self, node_name, PopupNormalTitle, {
		title = Strings:get("Petrace_Text_88"),
		title1 = Strings:get("UITitle_EN_Wanjiazhenrong")
	})
end

function PetRaceSquadMediator:refreshView()
	local text_cost = self:getView():getChildByFullName("Panel_base.Node_info_l.Text_cost")
	local text_first = self:getView():getChildByFullName("Panel_base.Node_info_l.Text_first")
	local text_power = self:getView():getChildByFullName("Panel_base.Node_info_l.Text_power")
	local embattleInfo = self._showFinalEmbattles[self._index] or {}

	self._petRaceSystem:refreshNineEmbattle(embattleInfo.embattle, self._node_9frame)

	local embattle = embattleInfo.embattle or {}
	local cost = 0
	local speed = 0
	cost = self._petRaceSystem:getTeamCostByEmbattle(embattle)
	speed = self._petRaceSystem:getTeamSpeedByEmbattle(embattle)

	text_cost:setString(tostring(cost))
	text_first:setString(tostring(speed))
	text_power:setString(embattleInfo.combat or 0)
end

function PetRaceSquadMediator:initWigetInfo()
	local text_name = self:getView():getChildByFullName("Panel_base.Text_name")
	local text_des = self:getView():getChildByFullName("Panel_base.Text_des")
	local text_level = self:getView():getChildByFullName("Panel_base.Text_level")
	self._node_9frame = self:getView():getChildByFullName("Panel_base.Node_frame9")

	text_name:setString(self._raceData.nickname)

	if self._clickIndex <= 8 then
		text_des:setString(Strings:get("Petrace_Text_19"))
	elseif self._clickIndex <= 12 then
		text_des:setString(Strings:get("Petrace_Text_20"))
	else
		text_des:setString(Strings:get("Petrace_Text_21"))
	end

	text_level:setString("Lv." .. self._raceData.level)
	self:refreshView()
	self:refreshTeamNode()
	self:refreshTeamSelect()
end

function PetRaceSquadMediator:onBackClicked(sender, eventType)
	self:close()
end

function PetRaceSquadMediator:onClickedIndex(index)
	if index ~= self._index then
		self._index = index

		self:refreshView()
		self:refreshTeamSelect()
	end
end

function PetRaceSquadMediator:refreshTeamNode()
	for i = 1, 3 do
		local node_team = self:getView():getChildByFullName("Panel_base.Node_team_" .. i)
		local text_num = node_team:getChildByFullName("Panel_base.Text_num")
		local node_role = node_team:getChildByFullName("Panel_base.Node_role")

		text_num:setString(i)

		local embattleInfo = self._showFinalEmbattles[i] or {}

		self._petRaceSystem:refreshIconEmbattle(embattleInfo.embattle or {}, node_role)
	end
end

function PetRaceSquadMediator:refreshTeamSelect()
	for i = 1, 3 do
		local node_team = self:getView():getChildByFullName("Panel_base.Node_team_" .. i)
		local image_select = node_team:getChildByFullName("Panel_base.Image_select")

		if i == self._index then
			image_select:setVisible(true)
		else
			image_select:setVisible(false)
		end
	end
end
