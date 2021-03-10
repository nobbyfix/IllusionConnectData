require("dm.gameplay.surface.model.SurfaceList")

SurfaceSystem = class("SurfaceSystem", Facade, _M)

SurfaceSystem:has("_service", {
	is = "r"
}):injectWith("SurfaceService")
SurfaceSystem:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
SurfaceSystem:has("_systemKeeper", {
	is = "r"
}):injectWith("SystemKeeper")
SurfaceSystem:has("_surfaceList", {
	is = "r"
})
SurfaceSystem:has("_customDataSystem", {
	is = "rw"
}):injectWith("CustomDataSystem")
SurfaceSystem:has("_shopSystem", {
	is = "rw"
}):injectWith("ShopSystem")

SurfaceViewType = {
	kHero = "hero",
	kShop = "shop",
	kMaster = "master"
}

function SurfaceSystem:initialize()
	super.initialize(self)

	self._surfaceList = SurfaceList:new()

	self._surfaceList:initSurface()
end

function SurfaceSystem:checkEnabled(data)
	local unlock, tips = self._systemKeeper:isUnlock("Unlock_Shop_Surface")

	return unlock, tips
end

function SurfaceSystem:tryEnter(data)
	local unlock, tips = self:checkEnabled(data)

	if not unlock then
		self:dispatch(ShowTipEvent({
			tip = tips
		}))

		return
	end

	local function callback()
		local view = self:getInjector():getInstance("SurfaceView")

		self:dispatch(ViewEvent:new(EVT_PUSH_VIEW, view, nil, data))
	end

	self._shopSystem:requestGetSurfaceShop(function ()
		callback()
	end)
end

function SurfaceSystem:synchronize(data)
	if data then
		self._surfaceList:synchronize(data)
	end
end

function SurfaceSystem:getSurfaceById(id)
	return self:getSurfaces()[id]
end

function SurfaceSystem:hasHeroSkin(id)
	local surface = self:getSurfaceById(id)

	if surface then
		return surface:getUnlock()
	end

	return false
end

function SurfaceSystem:getSurfaces()
	return self._surfaceList:getSurfaces()
end

function SurfaceSystem:getSurfaceByTargetRole(roleId, viewType)
	viewType = viewType or SurfaceViewType.kHero
	local surfaces = self:getSurfaces()
	local showSurfaces = {}
	local surfaceList = ConfigReader:getDataByNameIdAndKey("HeroBase", roleId, "SurfaceList")
	surfaceList = surfaceList or ConfigReader:getDataByNameIdAndKey("MasterBase", roleId, "SurfaceList")

	if viewType == SurfaceViewType.kShop then
		if surfaceList then
			for i = 1, #surfaceList do
				local surfaceId = surfaceList[i]
				local surface = surfaces[surfaceId]

				if surface and surface:getIsVisible() and surface:getType() ~= SurfaceType.kDefault then
					showSurfaces[#showSurfaces + 1] = surface
				end
			end
		end
	elseif viewType == SurfaceViewType.kMaster or viewType == SurfaceViewType.kHero then
		for i = 1, #surfaceList do
			local surfaceId = surfaceList[i]
			local surface = surfaces[surfaceId]

			if surface and surface:getUnlock() and surface:getIsVisible() or not surface:getUnlock() and surface:getNotGetIsVisible() then
				showSurfaces[#showSurfaces + 1] = surface
			end
		end
	end

	table.sort(showSurfaces, function (a, b)
		return a:getSort() < b:getSort()
	end)

	return showSurfaces
end

function SurfaceSystem:requestBuySurface(data, callback)
	local params = {
		surfaceId = data.surfaceId
	}

	self:getService():requestBuySurface(params, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_SURFACE_BUY_SUCC, params))
		end
	end)
end

function SurfaceSystem:requestSelectSurface(data, callback)
	local params = {
		surfaceId = data.surfaceId
	}

	self:getService():requestSelectSurface(params, function (response)
		if response.resCode == GS_SUCCESS then
			if callback then
				callback()
			end

			self:dispatch(Event:new(EVT_SURFACE_SELECT_SUCC, response))
		end
	end)
end
