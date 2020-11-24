AddGoodsDV = class("AddGoodsDV", DebugViewTemplate, _M)

function AddGoodsDV:initialize()
	self._opType = 100
	self._viewConfig = {
		{
			name = "itemId",
			title = "道具ID",
			type = "Input",
			default = CurrencyIdKind.kGold
		},
		{
			default = 100000,
			name = "count",
			title = "道具数量",
			type = "Input"
		}
	}
end
