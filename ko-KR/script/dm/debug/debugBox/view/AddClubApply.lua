AddClubApply = class("AddClubApply", DebugViewTemplate, _M)

function AddClubApply:initialize()
	self._opType = 204
	self._viewConfig = {
		{
			default = 10,
			name = "count",
			title = "社团申请数量",
			type = "Input"
		}
	}
end
