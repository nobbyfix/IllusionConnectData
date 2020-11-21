BuildingFloorComponent = class("BuildingFloorComponent", DmBaseUI)

BuildingFloorComponent:has("_buildingMediator", {
	is = "rw"
})

function BuildingFloorComponent:initialize(view)
	super.initialize(self, view)
	self:setupView()
end

function BuildingFloorComponent:dispose()
	super.dispose(self)
end

function BuildingFloorComponent:enterWithData(data)
end

function BuildingFloorComponent:setupView()
end

function BuildingFloorComponent:adjustLayout(targetFrame)
end
