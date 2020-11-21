AddTowerBuffToPlayer = class("AddTowerBuffToPlayer", DebugViewTemplate, _M)

function AddTowerBuffToPlayer:initialize()
	self._opType = 283
	self._viewConfig = {
		{
			default = "Tower_1_Buff_7",
			name = "buff",
			title = "BUFF",
			type = "Input"
		}
	}
end
