CrusadeReset = class("CrusadeReset", DebugViewTemplate, _M)

function CrusadeReset:initialize()
	self._opType = 292
	self._viewConfig = {
		{
			title = "重置远征到下一周",
			name = "CrusadeReset",
			type = "Label"
		}
	}
end
