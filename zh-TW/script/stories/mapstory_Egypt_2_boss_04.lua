local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.mapstory_Egypt_2_boss_04")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_mapstory_Egypt_2_boss_04 = {
	actions = {}
}
scenes.scene_mapstory_Egypt_2_boss_04 = scene_mapstory_Egypt_2_boss_04

function scene_mapstory_Egypt_2_boss_04:stage(args)
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

function scene_mapstory_Egypt_2_boss_04.actions.start_mapstory_Egypt_2_boss_04(_root, args)
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
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_KXuan",
					id = "KXuan_speak",
					rotationX = 0,
					scale = 1.175,
					position = {
						x = 0,
						y = -470,
						refpt = {
							x = 0.1,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "KXuan_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "KXuan/KXuan_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "KXuan_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 130,
								y = 797
							}
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "KXuan_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "KXuan_speak"),
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
					name = "dialog_speak_name_72",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KXuan_speak"
					},
					content = {
						"mapstory_Egypt_2_boss_04_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KXuan_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_FTLEShi",
					id = "FTLEShi_speak",
					rotationX = 0,
					scale = 1.025,
					position = {
						x = 0,
						y = -510,
						refpt = {
							x = 0.3,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "FTLEShi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "FTLEShi/FTLEShi_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "FTLEShi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -16,
								y = 998
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"mapstory_Egypt_2_boss_04_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "KXuan_speak"),
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
					name = "dialog_speak_name_72",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KXuan_speak"
					},
					content = {
						"mapstory_Egypt_2_boss_04_3"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_72",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KXuan_speak"
					},
					content = {
						"mapstory_Egypt_2_boss_04_4"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_72",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KXuan_speak"
					},
					content = {
						"mapstory_Egypt_2_boss_04_5"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_72",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KXuan_speak"
					},
					content = {
						"mapstory_Egypt_2_boss_04_6"
					},
					durations = {
						0.03
					}
				}
			end
		})
	})
end

local function mapstory_Egypt_2_boss_04(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_mapstory_Egypt_2_boss_04",
					scene = scene_mapstory_Egypt_2_boss_04
				}
			end
		})
	})
end

stories.mapstory_Egypt_2_boss_04 = mapstory_Egypt_2_boss_04

return _M
