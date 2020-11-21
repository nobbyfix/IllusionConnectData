SetClubLevel = class("SetClubLevel", DebugViewTemplate, _M)

function SetClubLevel:initialize()
	self._opType = 207
	self._viewConfig = {
		{
			default = 10,
			name = "level",
			title = "社团等级",
			type = "Input"
		}
	}
end
