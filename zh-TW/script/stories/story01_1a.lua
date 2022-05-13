local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story01_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story01_1a = {
	actions = {}
}
scenes.scene_story01_1a = scene_story01_1a

function scene_story01_1a:stage(args)
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
		touchEvents = {
			moved = "evt_bg_touch_moved",
			began = "evt_bg_touch_began",
			ended = "evt_bg_touch_ended"
		},
		children = {
			{
				resType = 0,
				name = "hm",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				id = "hm",
				scale = 1,
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 2,
				videoName = "stroy_xuzhang",
				id = "stroy_xuzhang",
				scale = 1,
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.5
					}
				}
			},
			{
				id = "Mus_Story_1",
				fileName = "Mus_Story_1",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_story01_1a.actions.start_story01_1a(_root, args)
	return sequential({
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_1")
		}),
		act({
			action = "elide",
			actor = __getnode__(_root, "Mus_Story_1")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "skipButton")
		}),
		act({
			action = "playEnd",
			actor = __getnode__(_root, "stroy_xuzhang")
		}),
		act({
			action = "notElide",
			actor = __getnode__(_root, "Mus_Story_1")
		})
	})
end

local function story01_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story01_1a",
					scene = scene_story01_1a
				}
			end
		})
	})
end

stories.story01_1a = story01_1a

return _M
