SetDonationCount = class("SetDonationCount", DebugViewTemplate, _M)

function SetDonationCount:initialize()
	self._opType = 209
	self._viewConfig = {
		{
			default = 10,
			name = "count",
			title = "捐献次数",
			type = "Input"
		}
	}
end
