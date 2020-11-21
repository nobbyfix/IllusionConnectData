GalleryService = class("GalleryService", Service, _M)
local opType = {
	requestGalleryPartyReward = 27001,
	requestGalleryAlbumSave = 27002,
	requestGalleryAlbumDelete = 27003,
	requestSendGift = 27004,
	requestHeroDate = 27005,
	requestUpdateAfkList = 27006,
	requestDoAfkEvent = 27007,
	requestGalleryHeroReward = 27009
}

function GalleryService:initialize()
	super.initialize(self)
end

function GalleryService:dispose()
	super.dispose(self)
end

function GalleryService:requestGalleryPartyReward(params, callback, notShowWaiting)
	local request = self:newRequest(opType.requestGalleryPartyReward, params, callback)

	self:sendRequest(request, not notShowWaiting)
end

function GalleryService:requestGalleryAlbumSave(params, callback, notShowWaiting)
	local request = self:newRequest(opType.requestGalleryAlbumSave, params, callback)

	self:sendRequest(request, not notShowWaiting)
end

function GalleryService:requestGalleryAlbumDelete(params, callback, notShowWaiting)
	local request = self:newRequest(opType.requestGalleryAlbumDelete, params, callback)

	self:sendRequest(request, not notShowWaiting)
end

function GalleryService:requestSendGift(params, callback, notShowWaiting)
	local request = self:newRequest(opType.requestSendGift, params, callback)

	self:sendRequest(request, not notShowWaiting)
end

function GalleryService:requestHeroDate(params, callback, notShowWaiting)
	local request = self:newRequest(opType.requestHeroDate, params, callback)

	self:sendRequest(request, not notShowWaiting)
end

function GalleryService:requestUpdateAfkList(params, callback, notShowWaiting)
	local request = self:newRequest(opType.requestUpdateAfkList, params, callback)

	self:sendRequest(request, not notShowWaiting)
end

function GalleryService:requestDoAfkEvent(params, callback, notShowWaiting)
	local request = self:newRequest(opType.requestDoAfkEvent, params, callback)

	self:sendRequest(request, not notShowWaiting)
end

function GalleryService:requestGalleryHeroReward(params, callback, notShowWaiting)
	local request = self:newRequest(opType.requestGalleryHeroReward, params, callback)

	self:sendRequest(request, not notShowWaiting)
end
