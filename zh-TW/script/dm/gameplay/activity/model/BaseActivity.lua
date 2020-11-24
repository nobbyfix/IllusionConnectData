require("dm.gameplay.activity.model.ActivityTask")

BaseActivity = class("BaseActivity", objectlua.Object, _M)

BaseActivity:has("_id", {
	is = "r"
})
BaseActivity:has("_startTime", {
	is = "r"
})
BaseActivity:has("_endTime", {
	is = "r"
})
BaseActivity:has("_config", {
	is = "r"
})
BaseActivity:has("_isTodayOpen", {
	is = "r"
})
BaseActivity:has("_dailyReset", {
	is = "r"
})
BaseActivity:has("_activitySystem", {
	is = "rw"
}):injectWith("ActivitySystem")
BaseActivity:has("_developSystem", {
	is = "r"
}):injectWith("DevelopSystem")
BaseActivity:has("_foreverGot", {
	is = "rw"
})

function BaseActivity:initialize()
	super.initialize(self)

	self._id = nil
	self._config = nil
	self._startTime = -1
	self._endTime = -1
	self._isTodayOpen = false
	self._dailyReset = false
	self._foreverGot = {}
end

function BaseActivity:dispose()
	super.dispose(self)
end

function BaseActivity:synchronize(data)
	if not data then
		return
	end

	if data.activityId then
		self._id = data.activityId
		self._config = ConfigReader:getRecordById("Activity", self._id)
	end

	if data.timeStamp then
		if data.timeStamp.openTs then
			self._startTime = data.timeStamp.openTs
		end

		if data.timeStamp.finishTs then
			self._endTime = data.timeStamp.finishTs
		end

		if data.timeStamp.dailyReset then
			self._dailyReset = data.timeStamp.dailyReset
		end
	end

	if data.todayOpen ~= nil then
		self._isTodayOpen = data.todayOpen
	end

	if data.foreverGot then
		self._foreverGot = data.foreverGot
	end
end

function BaseActivity:reset()
	self._id = nil
	self._config = nil
	self._startTime = -1
	self._endTime = -1
	self._isTodayOpen = false
	self._dailyReset = false
	self._foreverGot = {}
end

function BaseActivity:hasRewardToGet()
	return false
end

function BaseActivity:hasRedPoint()
	return false
end

function BaseActivity:getClientCondition()
	return self._config.ClientCondition
end

function BaseActivity:getType()
	return self._config.Type
end

function BaseActivity:getUI()
	return self._config.UI
end

function BaseActivity:getTitle()
	return self._config.Title
end

function BaseActivity:getDesc()
	return self._config.Desc
end

function BaseActivity:getActivityConfig()
	return self._config.ActivityConfig
end

function BaseActivity:getShowTab()
	return self._config.ShowTab
end

function BaseActivity:getShowIndex()
	return self._config.ShowIndex or 0
end

function BaseActivity:getIcon()
	return self._config.Icon
end

function BaseActivity:getTag()
	return self._config.Tag
end

function BaseActivity:getLeftBanner()
	return self._config.LeftBanner
end

function BaseActivity:getTimeFactor()
	return self._config.TimeFactor
end

function BaseActivity:getBubleDesc()
	return self._config.ActivityConfig.BubleDesc
end

function BaseActivity:getBgm()
	return self._config.ActivityConfig.bgm
end
