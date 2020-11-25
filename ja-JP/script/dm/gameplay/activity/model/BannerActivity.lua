BannerActivity = class("BannerActivity", BaseActivity, _M)

function BannerActivity:initialize()
	super.initialize(self)

	self._bannerList = {}
end

function BannerActivity:dispose()
	super.dispose(self)
end

function BannerActivity:synchronize(data)
	if not data then
		return
	end

	super.synchronize(self, data)
	self:initBannerList()
end

function BannerActivity:getBannerList()
	return self._bannerList
end

function BannerActivity:initBannerList()
	if #self._bannerList == 0 then
		local actConfig = self:getActivityConfig()

		if actConfig and actConfig.banner then
			for i, id in pairs(actConfig.banner) do
				local bannerData = {}
				local bannerConfig = ConfigReader:getRecordById("ActivityBanner", id)
				bannerData.id = id
				bannerData.config = bannerConfig
				self._bannerList[#self._bannerList + 1] = bannerData
			end
		end
	end
end
