local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story_choose")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story_choose = {
	actions = {}
}
scenes.scene_story_choose = scene_story_choose

function scene_story_choose:stage(args)
	return {
		name = "root",
		type = "Stage",
		id = "root",
		position = {
			x = 0,
			y = 0
		},
		size = {
			width = 1386,
			height = 852
		},
		touchEvents = {
			moved = "evt_bg_touch_moved",
			began = "evt_bg_touch_began",
			ended = "evt_bg_touch_ended"
		},
		__actions__ = self.actions
	}
end

function scene_story_choose.actions.start_story_choose(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "curtain")
		}),
		storyChooseDialogShowAction({})
	})
end

local function story_choose(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story_choose",
					scene = scene_story_choose
				}
			end
		})
	})
end

stories.story_choose = story_choose

return _M
