local function UpdateTable(dest, src)
	if src == nil then
		return dest
	end

	if dest == nil then
		dest = {}
	end

	for k, v in pairs(src) do
		dest[k] = v
	end

	return dest
end

UrlEntry = class("UrlEntry", objectlua.Object, _M)
_SceneName = {
	mainScene = "mainUIScene",
	battleScene = "battleScene",
	crossDefense = "crossdefenseScene"
}
_SceneType = {
	push = "push",
	switch = "switch",
	popup = "popup"
}

function UrlEntry:initialize()
	super.initialize(self)
end

function UrlEntry:checkEnabled(context, params)
	return true
end

function UrlEntry:newEvent(urlParams, extraData)
	assert(false, "override me")
end

ViewAreaEntry = class("ViewAreaEntry", UrlEntry, _M)

function ViewAreaEntry:initialize(viewName, data)
	super.initialize(self)

	self.viewName = viewName
	self._need_run_at_scene = nil
	self._path = nil
	self.data = data
end

local kExtResponseMap = {
	shopView = {
		instanceName = "ShopSystem",
		entry = ViewAreaEntry:new("shopView")
	},
	BagView = {
		instanceName = "BagSystem",
		entry = ViewAreaEntry:new("BagView")
	},
	arenaView = {
		instanceName = "ArenaSystem",
		entry = ViewAreaEntry:new("arenaView")
	},
	ClubView = {
		instanceName = "ClubSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("ClubView")
	},
	FriendMainView = {
		instanceName = "FriendSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("FriendMainView")
	},
	relationInfo = {
		targetInstance = "HeroSystem",
		instanceName = "DevelopSystem",
		funcName = "requestHeroRelation",
		entry = ViewAreaEntry:new("relationInfo")
	},
	HeroShowMainView = {
		funcCheck = "checkEnabledMain",
		instanceName = "DevelopSystem",
		funcName = "tryEnterShowMain",
		targetInstance = "HeroSystem",
		entry = ViewAreaEntry:new("HeroShowMainView")
	},
	MasterMainView = {
		targetInstance = "MasterSystem",
		instanceName = "DevelopSystem",
		entry = ViewAreaEntry:new("MasterMainView")
	},
	HeroStrengthLevelView = {
		funcCheck = "checkEnabledLevel",
		instanceName = "DevelopSystem",
		funcName = "tryEnterLevel",
		targetInstance = "HeroSystem",
		entry = ViewAreaEntry:new("HeroStrengthLevelView")
	},
	HeroStrengthQualityView = {
		funcCheck = "checkEnabledQuality",
		instanceName = "DevelopSystem",
		funcName = "tryEnterQuality",
		targetInstance = "HeroSystem",
		entry = ViewAreaEntry:new("HeroStrengthQualityView")
	},
	equipMainView = {
		targetInstance = "EquipSystem",
		instanceName = "DevelopSystem",
		entry = ViewAreaEntry:new("equipMainView")
	},
	ActivityView = {
		instanceName = "ActivitySystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("ActivityView")
	},
	CarnivalView = {
		funcName = "tryEnterCarnival",
		instanceName = "ActivitySystem",
		funcCheck = "checkCarnival",
		entry = ViewAreaEntry:new("CarnivalView")
	},
	ActivityBlockView = {
		funcName = "complexActivityTryEnter",
		instanceName = "ActivitySystem",
		funcCheck = "checkComplexActivity",
		entry = ViewAreaEntry:new("ActivityBlockView")
	},
	ActivityBlockSupportView = {
		funcName = "complexActivityTryEnter",
		instanceName = "ActivitySystem",
		funcCheck = "checkComplexActivity",
		entry = ViewAreaEntry:new("ActivityBlockSupportView")
	},
	ActivityBlockHalloweenView = {
		funcName = "complexActivityTryEnter",
		instanceName = "ActivitySystem",
		funcCheck = "checkComplexActivity",
		entry = ViewAreaEntry:new("ActivityBlockHalloweenView")
	},
	ActivityBlockMonsterShopView = {
		funcName = "tryEnterBlockMonsterShopView",
		instanceName = "ActivitySystem",
		funcCheck = "checkComplexActivity",
		entry = ViewAreaEntry:new("ActivityBlockMonsterShopView")
	},
	ActivityBlockSummerView = {
		funcName = "complexActivityTryEnter",
		instanceName = "ActivitySystem",
		funcCheck = "checkComplexActivity",
		entry = ViewAreaEntry:new("ActivityBlockSummerView")
	},
	ExploreView = {
		instanceName = "ExploreSystem",
		entry = ViewAreaEntry:new("ExploreView")
	},
	GalleryMainView = {
		instanceName = "GallerySystem",
		entry = ViewAreaEntry:new("GalleryMainView")
	},
	RecruitView = {
		instanceName = "RecruitSystem",
		entry = ViewAreaEntry:new("RecruitView")
	},
	PetRaceView = {
		instanceName = "PetRaceSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("PetRaceView")
	},
	TaskView = {
		instanceName = "TaskSystem",
		entry = ViewAreaEntry:new("TaskView")
	},
	StagePracticeEnterView = {
		instanceName = "StagePracticeSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("StagePracticeEnterView")
	},
	SpStageMainView = {
		instanceName = "SpStageSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("SpStageMainView")
	},
	SpStageMainViewWithTimes = {
		funcName = "tryEnter",
		instanceName = "SpStageSystem",
		funcCheck = "checkEnabledWithTimes",
		entry = ViewAreaEntry:new("SpStageMainViewWithTimes")
	},
	CommonStageMainView = {
		instanceName = "StageSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("CommonStageMainView")
	},
	CommonStageChapterView = {
		funcName = "enterChapterViewAndPoint",
		instanceName = "StageSystem",
		funcCheck = "checkChapterViewAndPointEnable",
		entry = ViewAreaEntry:new("CommonStageChapterView")
	},
	MazeEventMainView = {
		instanceName = "MazeSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("MazeEventMainView")
	},
	chatMainView = {
		instanceName = "ChatSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("chatMainView")
	},
	HeroStoryEnterView = {
		funcName = "tryEnterHeroStory",
		instanceName = "StageSystem",
		funcCheck = "checkHeroStoryEnable",
		entry = ViewAreaEntry:new("HeroStoryEnterView")
	},
	BuildingView = {
		instanceName = "BuildingSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("BuildingView")
	},
	BuildingBuyDecorateView = {
		instanceName = "BuildingSystem",
		funcName = "tryEnterBuyDecorate",
		entry = ViewAreaEntry:new("BuildingBuyDecorateView")
	},
	BuildingOverviewView = {
		instanceName = "BuildingSystem",
		funcName = "tryEnterOverview",
		entry = ViewAreaEntry:new("BuildingOverviewView")
	},
	CrusadeView = {
		instanceName = "CrusadeSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("CrusadeView")
	},
	TowerView = {
		instanceName = "TowerSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("TowerView")
	},
	NewCurrencyBuyView = {
		instanceName = "CurrencySystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("NewCurrencyBuyView")
	},
	BuildingGetResView = {
		funcCheck = "checkGetExpEnable",
		instanceName = "BuildingSystem",
		funcName = "tryEnterGetResView",
		entry = ViewAreaEntry:new("BuildingGetResView")
	},
	PassMainView = {
		instanceName = "PassSystem",
		funcName = "tryEnter",
		entry = ViewAreaEntry:new("PassMainView")
	},
	ActivityBlockHolidayView = {
		funcName = "complexActivityTryEnter",
		instanceName = "ActivitySystem",
		funcCheck = "checkComplexActivity",
		entry = ViewAreaEntry:new("ActivityBlockHolidayView")
	}
}

function ViewAreaEntry:response(context, params)
	local data = self.data ~= nil and table.deepcopy(self.data) or nil

	if params ~= nil and next(params) ~= nil then
		data = UpdateTable(data, params)
	end

	if self._need_run_at_scene ~= nil then
		if self.__need_run_at_scene ~= context:getInjector():getInstance("currentSceneMediator"):getViewName() then
			if data == nil then
				data = {}
			end

			data.params = params
			data.sceneName = self._need_run_at_scene
			data.viewName = self.viewName
			data.viewType = params.viewType
			local sceneEvent = SceneEvent:new(EVT_SWITCH_SCENE, data)

			context:dispatch(sceneEvent)
		end
	elseif kExtResponseMap[self.viewName] then
		local config = kExtResponseMap[self.viewName]

		if config then
			local instance = context:getInjector():getInstance(config.instanceName)
			local funcName = config.funcName or "tryEnter"

			if instance and funcName then
				if config.targetInstance then
					local name = "get" .. config.targetInstance
					instance = instance[name](instance)
				end

				instance[funcName](instance, data)
			end
		end
	else
		local view = context:getInjector():getInstance(self.viewName)

		if params.viewType ~= nil then
			local viewEvent = nil

			if params.viewType == "switch" then
				viewEvent = ViewEvent:new(EVT_SWITCH_VIEW, view, nil, data)

				if self.viewName == "homeView" then
					viewEvent = Event:new(EVT_POP_TO_TARGETVIEW, {
						viewName = "homeView",
						viewData = data
					})
				end
			elseif params.viewType == "push" then
				viewEvent = ViewEvent:new(EVT_PUSH_VIEW, view, nil, data)
			elseif params.viewType == "popup" then
				viewEvent = ViewEvent:new(EVT_SHOW_POPUP, view, nil, data)
			end

			if viewEvent then
				context:dispatch(viewEvent)
			end
		end
	end
end

local URLMappingEntries = nil

local function getURLMappingEntries()
	if URLMappingEntries ~= nil then
		return URLMappingEntries
	end

	local t = {
		["view://HeroShowListView"] = ViewAreaEntry:new("HeroShowListView"),
		["view://buyCurrencyView"] = ViewAreaEntry:new("CurrencyBuyPopView"),
		["view://newBuyCurrencyView"] = ViewAreaEntry:new("NewCurrencyBuyPopView"),
		["view://homeView"] = ViewAreaEntry:new("homeView")
	}
	URLMappingEntries = t

	return URLMappingEntries
end

UrlEntryManage = {
	processNextParam = function (params, paramString)
		local p = "^[%?&]([^=]+)=([^&]+)"
		local mr = {
			string.find(paramString, p)
		}

		if #mr < 2 then
			return nil
		end

		local key = mr[3]
		local value = mr[4]

		if string.find(value, "^%d+$") ~= nil or string.find(value, "^%d+%.%d+$") ~= nil then
			value = tonumber(value)
		end

		params[key] = value

		if mr[2] >= #paramString then
			return nil
		else
			return string.sub(paramString, mr[2] + 1)
		end
	end
}

function UrlEntryManage.resolveUrlWithUserData(urlString)
	if not urlString then
		return nil
	end

	if type(urlString) == "table" and urlString.param then
		urlString = urlString.param
	end

	local pattern = "^(view://([%w_-%./]+))(.*)$"
	urlString = string.gsub(urlString, "^%s*(.-)%s*$", "%1")
	local matchResult = {
		string.find(urlString, pattern)
	}

	if #matchResult < 2 then
		return nil
	end

	local page = matchResult[3]
	local mapping = getURLMappingEntries()
	local entry = mapping[page]

	if not entry then
		local viewName = string.gsub(page, "view://", "")
		entry = kExtResponseMap[viewName].entry
	end

	assert(entry, string.format(" URL %s not found", page))

	local urlParams = {}
	local paramString = matchResult[5]

	while paramString ~= nil do
		paramString = UrlEntryManage.processNextParam(urlParams, paramString)
	end

	return entry, urlParams
end

function UrlEntryManage.checkEnabledWithUserData(urlString)
	if urlString == nil then
		return nil
	end

	local pattern = "^(view://([%w_-%./]+))(.*)$"
	urlString = string.gsub(urlString, "^%s*(.-)%s*$", "%1")
	local matchResult = {
		string.find(urlString, pattern)
	}

	if #matchResult < 2 then
		return nil
	end

	local page = matchResult[3]
	local urlParams = {}
	local paramString = matchResult[5]

	while paramString ~= nil do
		paramString = UrlEntryManage.processNextParam(urlParams, paramString)
	end

	local viewName = string.gsub(page, "view://", "")
	local config = kExtResponseMap[viewName]

	if config then
		local instance = DmGame:getInstance()._injector:getInstance(config.instanceName)

		if instance then
			if config.targetInstance then
				local name = "get" .. config.targetInstance
				instance = instance[name](instance)
			end

			local funcCheck = config.funcCheck or "checkEnabled"

			if instance[funcCheck] then
				local unlock, tip = instance[funcCheck](instance, urlParams)

				if not unlock then
					return false, tip
				end
			end
		end
	end

	return true
end

function UrlEntryManage.checkLeftTimesWithUserData(urlString)
	if urlString == nil then
		return nil
	end

	local pattern = "^(view://([%w_-%./]+))(.*)$"
	urlString = string.gsub(urlString, "^%s*(.-)%s*$", "%1")
	local matchResult = {
		string.find(urlString, pattern)
	}

	if #matchResult < 2 then
		return nil
	end

	local page = matchResult[3]
	local urlParams = {}
	local paramString = matchResult[5]

	while paramString ~= nil do
		paramString = UrlEntryManage.processNextParam(urlParams, paramString)
	end

	local viewName = string.gsub(page, "view://", "")
	local config = kExtResponseMap[viewName]

	if config then
		local instance = DmGame:getInstance()._injector:getInstance(config.instanceName)

		if instance then
			if config.targetInstance then
				local name = "get" .. config.targetInstance
				instance = instance[name](instance)
			end

			local funcCheck = config.funcCheckleftTime or "checkLeftCount"

			if instance[funcCheck] then
				local leftCount, tip = instance[funcCheck](instance, urlParams)

				return leftCount, tip
			end
		end
	end

	return nil, viewName
end
