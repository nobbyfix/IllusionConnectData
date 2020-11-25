GalleryParty = class("GalleryParty", objectlua.Object, _M)

GalleryParty:has("_id", {
	is = "rw"
})

function GalleryParty:initialize(id, owner)
	super.initialize(self)

	self._id = id
	self._config = ConfigReader:requireRecordById("GalleryParty", id)
end

function GalleryParty:getTitle()
	local titleArray = ConfigReader:getDataByNameIdAndKey("ConfigValue", "HeroPartyName", "content")

	return Strings:get(titleArray[self._config.Party]) or ""
end

function GalleryParty:getDesc()
	return Strings:get(self._config.PartyDesc)
end

function GalleryParty:getHeroIds()
	return self._config.IncludeHero
end

function GalleryParty:getOrder()
	return self._config.ShowRank
end

function GalleryParty:getRewardIds()
	return self._config.PartyReward
end

function GalleryParty:getPartyId()
	return self._config.Party
end
