ClubBuildingDecorate = class("ClubBuildingDecorate", BuildingDecorate)

function ClubBuildingDecorate:initialize(view)
	super.initialize(self, view)
end

function ClubBuildingDecorate:dispose()
	super.dispose(self)
end

function ClubBuildingDecorate:refreshLvUpImg()
	self:hideLvUpImg()
end
