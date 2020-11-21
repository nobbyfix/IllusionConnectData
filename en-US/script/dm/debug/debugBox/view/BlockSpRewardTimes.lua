BlockSpRewardTimes = class("BlockSpRewardTimes", DebugViewTemplate, _M)

function BlockSpRewardTimes:initialize()
	self._opType = 128
	self._viewConfig = {
		{
			default = "exp",
			name = "spType",
			title = "exp、gold、crystal",
			type = "Input"
		}
	}
end
