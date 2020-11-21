local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.guide_ToTeamOption")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_guide_ToTeamOption = {
	actions = {}
}
scenes.scene_guide_ToTeamOption = scene_guide_ToTeamOption

function scene_guide_ToTeamOption:stage(args)
	return {
		name = "root",
		type = "Stage",
		id = "root",
		position = {
			x = 0,
			y = 0
		},
		size = {
			width = 1136,
			height = 640
		},
		__actions__ = self.actions
	}
end

function scene_guide_ToTeamOption.actions.action_guide_ToTeamOption(_root, args)
	return sequential({
		click({
			args = function (_ctx)
				return {
					id = "home.cardsGroup_btn",
					statisticPoint = "guide_ToTeamOption_1",
					mask = {
						touchMask = true,
						opacity = 0
					},
					offset = {
						x = 0,
						y = 0
					}
				}
			end
		})
	})
end

local function guide_ToTeamOption(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "action_guide_ToTeamOption",
					scene = scene_guide_ToTeamOption
				}
			end
		})
	})
end

stories.guide_ToTeamOption = guide_ToTeamOption

return _M
