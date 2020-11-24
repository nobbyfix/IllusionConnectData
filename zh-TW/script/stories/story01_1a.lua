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
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					center = 1,
					bgShow = false,
					heightSpace = 12,
					content = {
						"<font size='36' face='${fontName_FZYH_R}' color='#e7e6e6'>這時我們尚未意識到，這一天所經歷的一切。</font>"
					},
					waitTimes = {
						3
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					center = 1,
					bgShow = false,
					heightSpace = 12,
					content = {
						"<font size='36' face='${fontName_FZYH_R}' color='#e7e6e6'>即將成為「末日」再度降臨的開端。</font>"
					},
					waitTimes = {
						3
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
