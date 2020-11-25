BaseTeamMediator = class("BaseTeamMediator", DmAreaViewMediator, _M)

BaseTeamMediator:has("_stageSystem", {
	is = "r"
}):injectWith("StageSystem")
BaseTeamMediator:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
BaseTeamMediator:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
BaseTeamMediator:has("_buildingSystem", {
	is = "r"
}):injectWith("BuildingSystem")

local costType = ConfigReader:getDataByNameIdAndKey("ConfigValue", "Player_Init_Cost_Type", "content")
local kHeroRarityBgAnim = {
	[15.0] = "ssrzong_yingxiongxuanze",
	[13.0] = "srzong_yingxiongxuanze",
	[14.0] = "ssrzong_yingxiongxuanze"
}
local kSortBtnHandlers = {}

function BaseTeamMediator:initialize()
	super.initialize(self)
end

function BaseTeamMediator:dispose()
	super.dispose(self)
end

function BaseTeamMediator:onRegister()
	self:mapButtonHandlersClick(kSortBtnHandlers)
end

function BaseTeamMediator:resumeWithData()
end

function BaseTeamMediator:setupTopInfoWidget()
	local topInfoNode = self:getView():getChildByFullName("main.topinfo_node")
	local currencyInfoWidget = self._systemKeeper:getResourceBannerIds("Hero_Group")
	local currencyInfo = {}

	for i = #currencyInfoWidget, 1, -1 do
		currencyInfo[#currencyInfoWidget - i + 1] = currencyInfoWidget[i]
	end

	local config = {
		style = 1,
		currencyInfo = currencyInfo,
		btnHandler = {
			clickAudio = "Se_Click_Close_1",
			func = bind1(self.onClickBack, self)
		},
		title = Strings:get("Stage_Team_UI5")
	}
	local injector = self:getInjector()
	self._topInfoWidget = self:autoManageObject(injector:injectInto(TopInfoWidget:new(topInfoNode)))

	self._topInfoWidget:updateView(config)
end

function BaseTeamMediator:onClickBack()
	self:saveTeam()
	self:dismissWithOptions({
		transition = ViewTransitionFactory:create(ViewTransitionType.kCommonAreaView)
	})
end
