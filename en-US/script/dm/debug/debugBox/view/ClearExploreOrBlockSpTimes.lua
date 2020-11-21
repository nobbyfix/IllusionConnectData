ExploreAddTimes = class("ClearExploreOrBlockSpTimes", DebugViewTemplate, _M)

function ExploreAddTimes:initialize()
	self._opType = 294
	self._viewConfig = {
		{
			default = 0,
			name = "t",
			title = "清空类型(0探索1资源本)",
			type = "Input"
		},
		{
			default = "gold",
			name = "spId",
			title = "资源本ID(探索不必填)",
			type = "Input"
		}
	}
end
