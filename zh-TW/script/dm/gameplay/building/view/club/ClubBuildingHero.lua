ClubBuildingHero = class("ClubBuildingHero", BuildingHero)

function ClubBuildingHero:initialize(view)
	super.initialize(self, view)
end

function ClubBuildingHero:dispose()
	super.dispose(self)
end

function BuildingHero:updateOnlineTime()
	print("updateOnlineTime do nothing")
end
