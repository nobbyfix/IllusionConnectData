ExploreResetDailyTimes = class("ExploreResetDailyTimes", DebugViewTemplate, _M)

function ExploreResetDailyTimes:initialize()
	self._opType = 221
	self._viewConfig = {
		{
			title = "恢复大地图每日推荐次数",
			name = "ExploreResetDailyTimes",
			type = "Label"
		}
	}
end
