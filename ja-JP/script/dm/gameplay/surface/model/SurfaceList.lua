require("dm.gameplay.surface.model.Surface")

SurfaceList = class("SurfaceList", objectlua.Object, _M)

SurfaceList:has("_hero", {
	is = "r"
})
SurfaceList:has("_surfaces", {
	is = "r"
})

function SurfaceList:initialize()
	self._surfaces = {}
end

function SurfaceList:initSurface()
	local config = ConfigReader:getDataTable("Surface")

	for surfaceId, value in pairs(config) do
		if not self._surfaces[surfaceId] then
			local surface = Surface:new(surfaceId)
			self._surfaces[surfaceId] = surface
		end
	end
end

function SurfaceList:synchronize(unlockSurface)
	for i, id in pairs(unlockSurface) do
		if self._surfaces[id] then
			self._surfaces[id]:setUnlock(true)
		end
	end
end

function SurfaceList:getSurfaceById(id)
	return self._surfaces[id]
end
