local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.mapstory_Egypt_1_camp_03")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_mapstory_Egypt_1_camp_03 = {
	actions = {}
}
scenes.scene_mapstory_Egypt_1_camp_03 = scene_mapstory_Egypt_1_camp_03

function scene_mapstory_Egypt_1_camp_03:stage(args)
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

function scene_mapstory_Egypt_1_camp_03.actions.start_mapstory_Egypt_1_camp_03(_root, args)
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_65",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"mapstory_Egypt_1_camp_03_1"
					},
					durations = {
						0.03
					}
				}
			end
		})
	})
end

local function mapstory_Egypt_1_camp_03(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_mapstory_Egypt_1_camp_03",
					scene = scene_mapstory_Egypt_1_camp_03
				}
			end
		})
	})
end

stories.mapstory_Egypt_1_camp_03 = mapstory_Egypt_1_camp_03

return _M
