StagePracticeHero = class("StagePracticeHero", objectlua.Object, _M)

StagePracticeHero:has("_id", {
	is = "r"
})
StagePracticeHero:has("_config", {
	is = "r"
})

function StagePracticeHero:initialize(id)
	super.initialize(self)

	self._id = id
	self._config = ConfigReader:getRecordById("StageEnemy", tostring(id))
end

function StagePracticeHero:sync(data)
end
