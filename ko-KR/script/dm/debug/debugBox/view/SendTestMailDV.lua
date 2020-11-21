SendTestMailDV = class("SendTestMailDV", DebugViewTemplate, _M)

function SendTestMailDV:initialize()
	self._opType = 106
	self._viewConfig = {
		{
			default = 1001,
			name = "mailId",
			title = "邮件ID",
			type = "Input"
		},
		{
			title = "道具id",
			name = "rewardId",
			type = "Input"
		}
	}
end
