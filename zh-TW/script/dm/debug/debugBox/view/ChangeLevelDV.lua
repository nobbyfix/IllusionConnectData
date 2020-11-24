ChangeLevelDV = class("ChangeLevelDV", DebugViewTemplate, _M)

function ChangeLevelDV:initialize()
	self._opType = 105
	self._viewConfig = {
		{
			default = 50,
			name = "level",
			title = "level",
			type = "Input"
		}
	}
end
