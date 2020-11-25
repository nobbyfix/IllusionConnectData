AddAllHeroLove = class("AddAllHeroLove", DebugViewTemplate, _M)

function AddAllHeroLove:initialize()
	self._opType = 296
	self._viewConfig = {
		{
			default = 100,
			name = "count",
			title = "好感度经验",
			type = "Input"
		}
	}
end
