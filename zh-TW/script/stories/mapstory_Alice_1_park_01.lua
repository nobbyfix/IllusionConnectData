local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.mapstory_Alice_1_park_01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_mapstory_Alice_1_park_01 = {
	actions = {}
}
scenes.scene_mapstory_Alice_1_park_01 = scene_mapstory_Alice_1_park_01

function scene_mapstory_Alice_1_park_01:stage(args)
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

function scene_mapstory_Alice_1_park_01.actions.start_mapstory_Alice_1_park_01(_root, args)
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_XLai",
					id = "XLai_speak",
					rotationX = 0,
					scale = 1,
					position = {
						x = 0,
						y = -305,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "XLai_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "XLai/XLai_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "XLai_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 0,
								y = 709.5
							}
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_ATSheng",
					id = "ATSheng_speak",
					rotationX = 0,
					scale = 1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ATSheng_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ATSheng/ATSheng_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ATSheng_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -31,
								y = 683
							}
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"mapstory_Alice_1_park_01_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"mapstory_Alice_1_park_01_3"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"mapstory_Alice_1_park_01_4"
					},
					durations = {
						0.04
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"mapstory_Alice_1_park_01_5"
					},
					durations = {
						0.04
					}
				}
			end
		})
	})
end

local function mapstory_Alice_1_park_01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_mapstory_Alice_1_park_01",
					scene = scene_mapstory_Alice_1_park_01
				}
			end
		})
	})
end

stories.mapstory_Alice_1_park_01 = mapstory_Alice_1_park_01

return _M
