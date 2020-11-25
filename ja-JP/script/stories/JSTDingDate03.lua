local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.JSTDingDate03")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_JSTDingDate03 = {
	actions = {}
}
scenes.scene_JSTDingDate03 = scene_JSTDingDate03

function scene_JSTDingDate03:stage(args)
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
				image = "bg_story_EXscene_3_1.jpg",
				layoutMode = 1,
				zorder = 2,
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
						id = "bgEx_jingyubeishang",
						scale = 1,
						actionName = "anim_jingyubeishang",
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

function scene_JSTDingDate03.actions.start_JSTDingDate03(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_jingyubeishang"),
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
					modelId = "Model_JSTDing",
					id = "JSTDing_speak",
					rotationX = 0,
					scale = 0.94,
					zorder = 2,
					position = {
						x = 350,
						y = -213,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "JSTDing_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "JSTDing/JSTDing_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "JSTDing_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -76.7,
								y = 732.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JSTDing_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JSTDing_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_1"
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
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_2"
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
						"JSTDingDate03_3",
						"JSTDingDate03_4"
					},
					actionName = {
						"start_JSTDingDate03b",
						"start_JSTDingDate03c"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_5"
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
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_7"
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
					name = "start_JSTDingDate03d"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_10"
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
					name = "start_JSTDingDate03d"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_11"
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
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_12"
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
						"JSTDingDate03_13",
						"JSTDingDate03_14"
					},
					actionName = {
						"start_JSTDingDate03e",
						"start_JSTDingDate03f"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_15"
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
					name = "start_JSTDingDate03g"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_16"
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
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_17"
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
					name = "start_JSTDingDate03g"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_19"
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
						"JSTDingDate03_20",
						"JSTDingDate03_21"
					},
					actionName = {
						"start_JSTDingDate03h",
						"start_JSTDingDate03i"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_22"
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
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_JSTDingDate03j"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_26"
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
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_28"
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
					name = "start_JSTDingDate03j"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_29"
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
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_30"
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
						"JSTDingDate03_31",
						"JSTDingDate03_32"
					},
					actionName = {
						"start_JSTDingDate03k",
						"start_JSTDingDate03l"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_34"
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
					name = "start_JSTDingDate03m"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_36"
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
					name = "start_JSTDingDate03m"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_38"
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
						"JSTDingDate03_39",
						"JSTDingDate03_40"
					},
					actionName = {
						"start_JSTDingDate03n",
						"start_JSTDingDate03o"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_41"
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
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_42"
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
					name = "start_JSTDingDate03p"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_45"
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
					name = "start_JSTDingDate03p"
				}
			end
		})
	})
end

function scene_JSTDingDate03.actions.start_JSTDingDate03p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_46"
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
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_48"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JSTDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JSTDing/JSTDing_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_46",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate03_49"
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

local function JSTDingDate03(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_JSTDingDate03",
					scene = scene_JSTDingDate03
				}
			end
		})
	})
end

stories.JSTDingDate03 = JSTDingDate03

return _M
