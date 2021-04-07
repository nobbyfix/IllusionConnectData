DebugAddLeadStageLevel = class("DebugAddLeadStageLevel", DebugViewTemplate, _M)

function DebugAddLeadStageLevel:initialize()
	self._opType = 303
	self._viewConfig = {
		{
			default = "Master_XueZhan",
			name = "masterId",
			title = "角色id ",
			type = "Input"
		},
		{
			default = 1,
			name = "level",
			title = "增加等级",
			type = "Input"
		}
	}
end
