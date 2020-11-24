OneKeyStrengthenEquip = class("OneKeyStrengthenEquip", DebugViewTemplate, _M)

function OneKeyStrengthenEquip:initialize()
	self._opType = 272
	self._viewConfig = {
		{
			default = "Weapon_11001",
			name = "equipId",
			title = "装备ID",
			type = "Input"
		},
		{
			default = 1,
			name = "amount",
			title = "新建顶级装备数量",
			type = "Input"
		}
	}
end
