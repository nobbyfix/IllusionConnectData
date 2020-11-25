ClearAllClubExceptMine = class("ClearAllClubExceptMine", DebugViewTemplate, _M)

function ClearAllClubExceptMine:initialize()
	self._opType = 203
	self._viewConfig = {
		{
			title = "清理所有非自己的社团",
			name = "",
			type = ""
		}
	}
end
