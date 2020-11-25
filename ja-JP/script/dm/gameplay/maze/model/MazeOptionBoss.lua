local MazeBaseOption = require("dm.gameplay.maze.model.MazeBaseOption")
local MazeOptionBoss = class("MazeOptionBoss", MazeBaseOption)

MazeOptionBoss:has("_level", {
	is = "rw"
})
MazeOptionBoss:has("_rewardId", {
	is = "rw"
})
MazeOptionBoss:has("_pointId", {
	is = "rw"
})

function MazeOptionBoss:initialize()
	super.initialize(self)
end

function MazeOptionBoss:syncData(data)
	if data.optionId then
		self._optionId = data.optionId
	end

	if data.rewardId then
		self._rewardId = data.rewardId
	end

	if data.pointId then
		self._pointId = data.pointId
	end
end

function MazeOptionBoss:onClickOptionBtn(index)
	print("第" .. index .. "个页签" .. "MazeOptionBoss..Boss")
end

function MazeOptionBoss:haveSuspect()
	return false
end

function MazeOptionBoss:getClueSet()
	local clues = {}

	return clues
end

function MazeOptionBoss:getClueSetIds()
	return self._clueSet
end

function MazeOptionBoss:getSuspectEff(chapterId)
	local bq = ConfigReader:getDataByNameIdAndKey("PansLabChapter", chapterId, "BossQuestion")
	local result = Strings:get(bq[2])

	return result
end

function MazeOptionBoss:getSuspectQuestion(chapterId)
	local bq = ConfigReader:getDataByNameIdAndKey("PansLabChapter", chapterId, "BossQuestion")
	local result = Strings:get(bq[1])

	return result
end

return MazeOptionBoss
