local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.DCJKangDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_DCJKangDate01 = {
	actions = {}
}
scenes.scene_DCJKangDate01 = scene_DCJKangDate01

function scene_DCJKangDate01:stage(args)
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
				image = "bg_story_scene_7_4.jpg",
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
				fileName = "Mus_Story_Dongwenhui",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_DCJKangDate01.actions.start_DCJKangDate01(_root, args)
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
						"DCJKangDate01_1"
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
						"DCJKangDate01_2"
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
						"DCJKangDate01_3",
						"DCJKangDate01_4"
					},
					actionName = {
						"start_DCJKangDate01a",
						"start_DCJKangDate01b"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01a(_root, args)
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
						"DCJKangDate01_5"
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
						"DCJKangDate01_6"
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
					name = "start_DCJKangDate01c"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01b(_root, args)
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
						"DCJKangDate01_7"
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
					name = "start_DCJKangDate01c"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01c(_root, args)
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
						"DCJKangDate01_8"
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
						"DCJKangDate01_9"
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
						"DCJKangDate01_10"
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
						"DCJKangDate01_11",
						"DCJKangDate01_12"
					},
					actionName = {
						"start_DCJKangDate01d",
						"start_DCJKangDate01e"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01d(_root, args)
	return sequential({
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
						"DCJKangDate01_13"
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
						"DCJKangDate01_14"
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
						"DCJKangDate01_15"
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
					name = "start_DCJKangDate01f"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01e(_root, args)
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
						"DCJKangDate01_16"
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
						"DCJKangDate01_17"
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
					name = "start_DCJKangDate01f"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01f(_root, args)
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
						"DCJKangDate01_18"
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
						"DCJKangDate01_19"
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
						"DCJKangDate01_20",
						"DCJKangDate01_21"
					},
					actionName = {
						"start_DCJKangDate01g",
						"start_DCJKangDate01h"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01g(_root, args)
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
						"DCJKangDate01_22"
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
					name = "start_DCJKangDate01i"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01h(_root, args)
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
						"DCJKangDate01_23"
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
						"DCJKangDate01_24"
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
					name = "start_DCJKangDate01i"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01i(_root, args)
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
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate01_25"
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
						"DCJKangDate01_26"
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
						"DCJKangDate01_27"
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
						"DCJKangDate01_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "DCJKang"),
			args = function (_ctx)
				return {
					duration = 0.5
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
						"DCJKangDate01_29",
						"DCJKangDate01_30"
					},
					actionName = {
						"start_DCJKangDate01j",
						"start_DCJKangDate01k"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01j(_root, args)
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
						"DCJKangDate01_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "DCJKang"),
			args = function (_ctx)
				return {
					duration = 0.5
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
						"DCJKangDate01_32"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "DCJKang"),
			args = function (_ctx)
				return {
					duration = 0.5
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
						"DCJKangDate01_33"
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
					name = "start_DCJKangDate01l"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01k(_root, args)
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
						"DCJKangDate01_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "DCJKang"),
			args = function (_ctx)
				return {
					duration = 0.5
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
						"DCJKangDate01_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "DCJKang"),
			args = function (_ctx)
				return {
					duration = 0.5
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
						"DCJKangDate01_36"
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
					name = "start_DCJKangDate01l"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01l(_root, args)
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
						"DCJKangDate01_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "DCJKang"),
			args = function (_ctx)
				return {
					duration = 0.5
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
						"DCJKangDate01_38"
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
						"DCJKangDate01_39"
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
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate01_40"
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
						"DCJKangDate01_41"
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
					name = "DCJKangDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DCJKang"
					},
					content = {
						"DCJKangDate01_42"
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
						"DCJKangDate01_43"
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
						"DCJKangDate01_44"
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
						"DCJKangDate01_45"
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
						"DCJKangDate01_46"
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
						"DCJKangDate01_47"
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
						"DCJKangDate01_48",
						"DCJKangDate01_49"
					},
					actionName = {
						"start_DCJKangDate01m",
						"start_DCJKangDate01n"
					}
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01m(_root, args)
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
						"DCJKangDate01_50"
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
					name = "start_DCJKangDate01o"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01n(_root, args)
	return sequential({
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
						"DCJKangDate01_51"
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
					name = "start_DCJKangDate01o"
				}
			end
		})
	})
end

function scene_DCJKangDate01.actions.start_DCJKangDate01o(_root, args)
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
						"DCJKangDate01_52"
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
						"DCJKangDate01_53"
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
						"DCJKangDate01_54"
					},
					durations = {
						0.03
					}
				}
			end
		}),
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

local function DCJKangDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_DCJKangDate01",
					scene = scene_DCJKangDate01
				}
			end
		})
	})
end

stories.DCJKangDate01 = DCJKangDate01

return _M
