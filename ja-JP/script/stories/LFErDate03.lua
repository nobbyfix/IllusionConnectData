local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.LFErDate03")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_LFErDate03 = {
	actions = {}
}
scenes.scene_LFErDate03 = scene_LFErDate03

function scene_LFErDate03:stage(args)
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
				image = "bg_story_EXscene_0_2.jpg",
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
						layoutMode = 1,
						type = "MovieClip",
						zorder = 3,
						visible = true,
						id = "bgEx_wnsxjsnOne",
						scale = 1,
						actionName = "all_wnsxjsnOne",
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

function scene_LFErDate03.actions.start_LFErDate03(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_wnsxjsnOne"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.5
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_LFEr",
					id = "LFEr_speak",
					rotationX = 0,
					scale = 1,
					zorder = 11,
					position = {
						x = 0,
						y = -290,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "LFEr_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "LFEr/LFEr_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "LFEr_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -15.5,
								y = 700.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LFEr_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LFEr_speak"),
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_3"
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
						"LFErDate03_4",
						"LFErDate03_5"
					},
					actionName = {
						"start_LFErDate03b",
						"start_LFErDate03c"
					}
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_6"
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_7"
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_LFErDate03d"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_10"
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
					name = "start_LFErDate03d"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_12"
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_13"
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_14"
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
						"LFErDate03_15",
						"LFErDate03_16"
					},
					actionName = {
						"start_LFErDate03e",
						"start_LFErDate03f"
					}
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_17"
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_18"
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
					name = "start_LFErDate03g"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_20"
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_21"
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
					name = "start_LFErDate03g"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_24"
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
						"LFErDate03_25",
						"LFErDate03_26"
					},
					actionName = {
						"start_LFErDate03h",
						"start_LFErDate03i"
					}
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_28"
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
					name = "start_LFErDate03j"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_30"
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
					name = "start_LFErDate03j"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_31"
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
						"LFErDate03_32",
						"LFErDate03_33"
					},
					actionName = {
						"start_LFErDate03k",
						"start_LFErDate03l"
					}
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_35"
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
					name = "start_LFErDate03m"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_37"
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
					name = "start_LFErDate03m"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_39"
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_17"
					},
					content = {
						"LFErDate03_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_41"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_42"
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
						"LFErDate03_43",
						"LFErDate03_44"
					},
					actionName = {
						"start_LFErDate03o",
						"start_LFErDate03p"
					}
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_45"
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_46"
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
					name = "start_LFErDate03q"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_48"
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
					name = "start_LFErDate03q"
				}
			end
		})
	})
end

function scene_LFErDate03.actions.start_LFErDate03q(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr/LFEr_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"LFErDate03_49"
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

local function LFErDate03(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_LFErDate03",
					scene = scene_LFErDate03
				}
			end
		})
	})
end

stories.LFErDate03 = LFErDate03

return _M
