local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.mapstory_Alice_3_chess_02")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_mapstory_Alice_3_chess_02 = {
	actions = {}
}
scenes.scene_mapstory_Alice_3_chess_02 = scene_mapstory_Alice_3_chess_02

function scene_mapstory_Alice_3_chess_02:stage(args)
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

function scene_mapstory_Alice_3_chess_02.actions.start_mapstory_Alice_3_chess_02(_root, args)
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
					modelId = "Model_ALSi",
					id = "ALSi_speak",
					rotationX = 0,
					scale = 1,
					position = {
						x = 0,
						y = -120,
						refpt = {
							x = 0.3,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ALSi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ALSi/ALSi_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ALSi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 13.3,
								y = 525.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSi_speak"),
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
					name = "dialog_speak_name_121",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALSi_speak"
					},
					content = {
						"mapstory_Alice_3_chess_02_1"
					},
					durations = {
						0.04
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ALSi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"mapstory_Alice_3_chess_02_2"
					}
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
						y = -250,
						refpt = {
							x = 0.3,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ATSheng_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ATSheng/ATSheng_face_4.png",
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
		concurrent({
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
				action = "fadeIn",
				actor = __getnode__(_root, "ATSheng_speak"),
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
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"mapstory_Alice_3_chess_02_3"
					},
					durations = {
						0.04
					}
				}
			end
		})
	})
end

local function mapstory_Alice_3_chess_02(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_mapstory_Alice_3_chess_02",
					scene = scene_mapstory_Alice_3_chess_02
				}
			end
		})
	})
end

stories.mapstory_Alice_3_chess_02 = mapstory_Alice_3_chess_02

return _M
