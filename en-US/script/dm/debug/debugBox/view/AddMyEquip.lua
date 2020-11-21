AddMyEquip = class("AddMyEquip", DebugViewTemplate, _M)

function AddMyEquip:initialize()
	self._opType = 274
	self._viewConfig = {
		{
			title = "添加所有装备",
			name = "AddMyEquip",
			type = "Label"
		}
	}
end
