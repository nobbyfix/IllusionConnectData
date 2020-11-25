local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.YSTLuDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_YSTLuDate01 = {
	actions = {}
}
scenes.scene_YSTLuDate01 = scene_YSTLuDate01

function scene_YSTLuDate01:stage(args)
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
				image = "bg_story_EXscene_2_1.jpg",
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
				},
				children = {
					{
						id = "bgEX_motianlun",
						layoutMode = 1,
						type = "MovieClip",
						scale = 1,
						actionName = "anim_motianlun",
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
					}
				}
			},
			{
				id = "date_music",
				fileName = "Mus_Story_Common_2",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_YSTLuDate01.actions.start_YSTLuDate01(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEX_motianlun"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "date_music"),
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
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_YSTLu",
					id = "YSTLu_speak",
					rotationX = 0,
					scale = 1.15,
					zorder = 2,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.45,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YSTLu_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YSTLu/YSTLu_face_3.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YSTLu_face",
							anchorPoint = {
								x = 0.5,
								y = 0
							},
							position = {
								x = 50,
								y = 639
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YSTLu_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YSTLu_speak"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_1"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_2"
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
						"YSTLuDate01_3",
						"YSTLuDate01_4"
					},
					actionName = {
						"start_YSTLuDate01b",
						"start_YSTLuDate01c"
					}
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_5"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_6"
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
					name = "start_YSTLuDate01d"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_8"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_9"
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
					name = "start_YSTLuDate01d"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_10"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_12"
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
						"YSTLuDate01_13",
						"YSTLuDate01_14"
					},
					actionName = {
						"start_YSTLuDate01e",
						"start_YSTLuDate01f"
					}
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_15"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_17"
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
					name = "start_YSTLuDate01g"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_18"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_19"
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
					name = "start_YSTLuDate01g"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_20"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_22"
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
						"YSTLuDate01_23",
						"YSTLuDate01_24"
					},
					actionName = {
						"start_YSTLuDate01h",
						"start_YSTLuDate01i"
					}
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_25"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_27"
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
					name = "start_YSTLuDate01j"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_28"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_30"
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
					name = "start_YSTLuDate01j"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_31"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_32"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_33"
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
						"YSTLuDate01_34",
						"YSTLuDate01_35"
					},
					actionName = {
						"start_YSTLuDate01k",
						"start_YSTLuDate01l"
					}
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_36"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_37"
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
					name = "start_YSTLuDate01m"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_38"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_39"
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
					name = "start_YSTLuDate01m"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_41"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_42"
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
						"YSTLuDate01_43",
						"YSTLuDate01_44"
					},
					actionName = {
						"start_YSTLuDate01n",
						"start_YSTLuDate01o"
					}
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01n(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_45"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_46"
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
					name = "start_YSTLuDate01p"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_47"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_48"
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
					name = "start_YSTLuDate01p"
				}
			end
		})
	})
end

function scene_YSTLuDate01.actions.start_YSTLuDate01p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_49"
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
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_50"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_219",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSTLu_speak"
					},
					content = {
						"YSTLuDate01_51"
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

local function YSTLuDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_YSTLuDate01",
					scene = scene_YSTLuDate01
				}
			end
		})
	})
end

stories.YSTLuDate01 = YSTLuDate01

return _M
