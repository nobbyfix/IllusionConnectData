require("dm.gameplay.develop.model.bag.item.Item")
require("dm.gameplay.develop.model.bag.item.ItemPrototype")

Equipment = class("Equipment", Item, _M)

function Equipment:initialize(itemPrototype)
	super.initialize(self, itemPrototype)
end

function Equipment:getRarity()
	return self._prototype:getQuality() + 9
end

EquipPrototype = class("EquipPrototype", ItemPrototype, _M)

function EquipPrototype:initialize(tag)
	super.initialize(self, tag)
end
