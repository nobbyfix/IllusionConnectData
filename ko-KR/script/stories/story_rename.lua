local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story_rename")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story_rename = {
	actions = {}
}
scenes.scene_story_rename = scene_story_rename

function scene_story_rename:stage(args)
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

function scene_story_rename.actions.start_story_rename(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "curtain")
		}),
		renameDialogShowAction({})
	})
end

local function story_rename(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story_rename",
					scene = scene_story_rename
				}
			end
		})
	})
end

stories.story_rename = story_rename

return _M
