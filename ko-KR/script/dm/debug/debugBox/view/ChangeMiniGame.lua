ChangeDartsLevel = class("ChangeDartsLevel", DebugViewTemplate, _M)

function ChangeDartsLevel:initialize()
	self._opType = 105
	self._viewConfig = {
		{
			default = 1,
			name = "level",
			title = "level",
			type = "Input"
		}
	}
end

function ChangeDartsLevel:onClick(data)
	local mText = self._viewConfig[1].mtext
	local dartsSystem = self:getInjector():getInstance(MiniGameSystem):getDartsSystem()

	dartsSystem:setCurLevel(tonumber(mText))
end
