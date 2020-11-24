local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.mapstory_Japan_3_palace_01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_mapstory_Japan_3_palace_01 = {
	actions = {}
}
scenes.scene_mapstory_Japan_3_palace_01 = scene_mapstory_Japan_3_palace_01

function scene_mapstory_Japan_3_palace_01:stage(args)
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
		__actions__ = self.actions
	}
end

function scene_mapstory_Japan_3_palace_01.actions.start_mapstory_Japan_3_palace_01(_root, args)
	return sequential({
		act({
			action = "show",
			actor = __getnode__(_root, "skipButton")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "reviewButton")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "autoPlayButton")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_138",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"mapstory_Japan_3_palace_01_1"
					},
					durations = {
						0.03
					}
				}
			end
		})
	})
end

local function mapstory_Japan_3_palace_01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_mapstory_Japan_3_palace_01",
					scene = scene_mapstory_Japan_3_palace_01
				}
			end
		})
	})
end

stories.mapstory_Japan_3_palace_01 = mapstory_Japan_3_palace_01

return _M
