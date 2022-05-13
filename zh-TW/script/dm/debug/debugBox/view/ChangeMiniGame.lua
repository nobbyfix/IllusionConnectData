ChangeDartsLevel = class("ChangeDartsLevel", DebugViewTemplate, _M)

function ChangeDartsLevel:initialize()
	self._opType = 999999
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

addMiniGameTimes = class("addMiniGameTimes", DebugViewTemplate, _M)

function addMiniGameTimes:initialize()
	self._opType = 420
	self._viewConfig = {
		{
			default = "Activity_Jump",
			name = "actId",
			title = "活动ID",
			type = "Input"
		},
		{
			default = 50,
			name = "times",
			title = "次数",
			type = "Input"
		}
	}
end

ChangeJumpStage = class("ChangeJumpStage", DebugViewTemplate, _M)

function ChangeJumpStage:initialize()
	self._opType = 999999
	self._viewConfig = {
		{
			default = 1,
			name = "stage",
			title = "跳台层数",
			type = "Input"
		}
	}
end

function ChangeJumpStage:onClick(data)
	local mText = self._viewConfig[1].mtext
	local jumpSystem = self:getInjector():getInstance(MiniGameSystem):getJumpSystem()

	jumpSystem:setBeginStage(tonumber(mText))
end
