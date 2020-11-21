AddAllItems = class("AddAllItems", DebugViewTemplate, _M)

function AddAllItems:initialize()
	self._opType = 113
	self._viewConfig = {
		{
			default = 100,
			name = "count",
			title = "道具数量",
			type = "Input"
		}
	}
end
