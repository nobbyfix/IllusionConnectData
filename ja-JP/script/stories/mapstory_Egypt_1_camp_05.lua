local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.mapstory_Egypt_1_camp_05")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_mapstory_Egypt_1_camp_05 = {
	actions = {}
}
scenes.scene_mapstory_Egypt_1_camp_05 = scene_mapstory_Egypt_1_camp_05

function scene_mapstory_Egypt_1_camp_05:stage(args)
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

function scene_mapstory_Egypt_1_camp_05.actions.start_mapstory_Egypt_1_camp_05(_root, args)
	return sequential({
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "skipButton")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "autoPlayButton")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "reviewButton")
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_69",
						dialogImage = "jq_dialogue_bg_4.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MOGJiang_speak"
						},
						content = {
							"mapstory_Egypt_1_camp_05_1"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						freq = 4,
						strength = 2
					}
				end
			})
		})
	})
end

local function mapstory_Egypt_1_camp_05(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_mapstory_Egypt_1_camp_05",
					scene = scene_mapstory_Egypt_1_camp_05
				}
			end
		})
	})
end

stories.mapstory_Egypt_1_camp_05 = mapstory_Egypt_1_camp_05

return _M
