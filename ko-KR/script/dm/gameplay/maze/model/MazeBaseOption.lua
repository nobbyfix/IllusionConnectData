local MazeOptionType = require("dm.gameplay.maze.model.MazeOptionType")
local MazeBaseOption = class("MazeBaseOption", objectlua.Object)

MazeBaseOption:has("_type", {
	is = "rw"
})
MazeBaseOption:has("_optionId", {
	is = "rw"
})

function MazeBaseOption:initialize()
	super.initialize(self)
end

function MazeBaseOption:syncData(data)
end

function MazeBaseOption:initType(_type)
	self._type = _type

	self:emunToClassFunction(self, MazeOptionType, _type)
end

function MazeBaseOption:isType(_type)
	return self._type == _type
end

function MazeBaseOption:emunToClassFunction(_cls, _emun, _type)
	for k, v in pairs(_emun) do
		local fn = nil

		if v == _type then
			function fn()
				return true
			end
		else
			function fn()
				return false
			end
		end

		_cls["isType" .. k] = fn
	end
end

function MazeBaseOption:getDebugInfo()
	return self._type
end

return MazeBaseOption
