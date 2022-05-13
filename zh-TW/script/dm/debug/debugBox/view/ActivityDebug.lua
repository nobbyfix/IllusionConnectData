DrawCardFeedback = class("DrawCardFeedback", DebugViewTemplate, _M)

function DrawCardFeedback:initialize()
	self._opType = 297
	self._viewConfig = {
		{
			default = 666,
			name = "score",
			title = "梦境回馈抽卡积分",
			type = "Input"
		}
	}
end

ActivityBlockReset = class("ActivityBlockReset", DebugViewTemplate, _M)

function ActivityBlockReset:initialize()
	self._opType = 425
	self._viewConfig = {}
end
