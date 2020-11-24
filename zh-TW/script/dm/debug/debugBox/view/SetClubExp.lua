SetClubExp = class("SetClubExp", DebugViewTemplate, _M)

function SetClubExp:initialize()
	self._opType = 210
	self._viewConfig = {
		{
			default = 10,
			name = "exp",
			title = "社团经验",
			type = "Input"
		}
	}
end
