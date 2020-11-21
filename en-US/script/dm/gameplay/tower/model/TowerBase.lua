TowerBase = class("TowerBase", objectlua.Object)

TowerBase:has("_id", {
	is = "r"
})
TowerBase:has("_config", {
	is = "r"
})

function TowerBase:initialize(id)
	super.initialize(self)

	self._id = id
	self._config = ConfigReader:requireRecordById("TowerBase", id)
end
