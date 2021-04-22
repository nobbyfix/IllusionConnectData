local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.DCJKangDate03")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_DCJKangDate03 = {
	actions = {}
}
scenes.scene_DCJKangDate03 = scene_DCJKangDate03

function scene_DCJKangDate03:stage(args)
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
				name = "bg",
				pathType = "SCENE",
				type = "Image",
				image = "anualshop_scene_main_christmas.jpg",
				layoutMode = 1,
				zorder = 1,
				id = "bg",
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
				id = "Mus_Date",
				fileName = "Mus_Story_Playground",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_DCJKangDate03.actions.start_DCJKangDate03(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Date"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_DCJKang",
						id = "DCJKang",
						rotationX = 0,
						scale = 1.15,
						zorder = 40,
						position = {
							x = 0,
							y = -485,
							refpt = {
								x = 0.54,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "DCJKang_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "DCJKang/DCJKang_face_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "DCJKang_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -40.2,
									y = 873.2
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "DCJKang"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DCJKang_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					date = true,
					content = {
						"DCJKangDate03_2",
						"DCJKangDate03_3"
					},
					actionName = {
						"start_DCJKangDate03a",
						"start_DCJKangDate03b"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03a(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_4"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_5"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03c"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_7"
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
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03c"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_10"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					date = true,
					content = {
						"DCJKangDate03_11",
						"DCJKangDate03_12"
					},
					actionName = {
						"start_DCJKangDate03d",
						"start_DCJKangDate03e"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_13"
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
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03f"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03f"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_17"
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
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_19"
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
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_24"
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
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					date = true,
					content = {
						"DCJKangDate03_27",
						"DCJKangDate03_28"
					},
					actionName = {
						"start_DCJKangDate03g",
						"start_DCJKangDate03h"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03i"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03i"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_32"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_33"
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
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					date = true,
					content = {
						"DCJKangDate03_35",
						"DCJKangDate03_36"
					},
					actionName = {
						"start_DCJKangDate03j",
						"start_DCJKangDate03k"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03l"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03l"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03l(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_40"
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
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_41"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_42"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_44"
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
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_45"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_46"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_48"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					date = true,
					content = {
						"DCJKangDate03_49",
						"DCJKangDate03_50"
					},
					actionName = {
						"start_DCJKangDate03m",
						"start_DCJKangDate03n"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_51"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03o"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DCJKang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DCJKang/DCJKang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate03_52"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_DCJKangDate03o"
				}
			end
		})
	})
end

function scene_DCJKangDate03.actions.start_DCJKangDate03o(_root, args)
	return sequential({
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		})
	})
end

local function DCJKangDate03(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_DCJKangDate03",
					scene = scene_DCJKangDate03
				}
			end
		})
	})
end

stories.DCJKangDate03 = DCJKangDate03

return _M
