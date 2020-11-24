AddEquip = class("AddEquip", DebugViewTemplate, _M)

function AddEquip:initialize()
	self._opType = 271
	self._viewConfig = {
		{
			default = "Weapon_11001",
			name = "equipId",
			title = "装备ID",
			type = "Input"
		},
		{
			default = 5,
			name = "amount",
			title = "装备数量",
			type = "Input"
		}
	}
end
