SkipMazeChapter = class("SkipMazeChapter", DebugViewTemplate, _M)

function SkipMazeChapter:initialize()
	self._opType = 253
	self._viewConfig = {
		{
			default = "BSNCT_01",
			name = "eventId",
			title = "事件ID",
			type = "Input"
		}
	}
end
