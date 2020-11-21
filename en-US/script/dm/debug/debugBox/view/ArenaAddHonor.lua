ArenaAddHonor = class("ArenaAddHonor", DebugViewTemplate, _M)

function ArenaAddHonor:initialize()
	self._opType = 130
	self._viewConfig = {
		{
			default = "100",
			name = "count",
			title = "荣誉值",
			type = "Input"
		}
	}
end
