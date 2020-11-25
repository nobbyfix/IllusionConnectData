local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.YSuoDate03")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_YSuoDate03 = {
	actions = {}
}
scenes.scene_YSuoDate03 = scene_YSuoDate03

function scene_YSuoDate03:stage(args)
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
				name = "bg3",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_EXscene_0_1.jpg",
				layoutMode = 1,
				zorder = 1,
				id = "bg3",
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
						id = "bgEx_jiedao",
						scale = 1,
						actionName = "all_jiedao",
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

function scene_YSuoDate03.actions.start_YSuoDate03(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg3")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_jiedao"),
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
					modelId = "Model_YSuo",
					id = "YSuo_speak",
					rotationX = 0,
					scale = 1.03,
					zorder = 2,
					position = {
						x = 0,
						y = -635,
						refpt = {
							x = 0.65,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YSuo_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YSuo/YSuo_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YSuo_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -161.5,
								y = 1068.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YSuo_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YSuo_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_1"
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
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_2"
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
						"YSuoDate03_3",
						"YSuoDate03_4"
					},
					actionName = {
						"start_YSuoDate03b",
						"start_YSuoDate03c"
					}
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_5"
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
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_6"
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
					name = "start_YSuoDate03d"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_7"
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
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_9"
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
					name = "start_YSuoDate03d"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_10"
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
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_12"
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
						"YSuoDate03_13",
						"YSuoDate03_14"
					},
					actionName = {
						"start_YSuoDate03e",
						"start_YSuoDate03f"
					}
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_16"
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
					name = "start_YSuoDate03g"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_19"
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
					name = "start_YSuoDate03g"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03g(_root, args)
	return sequential({
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "YSuo_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YSuo_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -635,
						refpt = {
							x = 0.3,
							y = 0
						}
					}
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_20"
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
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_22"
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
						"YSuoDate03_23",
						"YSuoDate03_24"
					},
					actionName = {
						"start_YSuoDate03h",
						"start_YSuoDate03i"
					}
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_27"
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
					name = "start_YSuoDate03j"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_29"
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
					name = "start_YSuoDate03j"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_30"
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
						"YSuoDate03_31",
						"YSuoDate03_32"
					},
					actionName = {
						"start_YSuoDate03k",
						"start_YSuoDate03l"
					}
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_33"
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
					name = "start_YSuoDate03m"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_34"
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
					name = "start_YSuoDate03m"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_35"
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
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_36"
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
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_38"
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
						"YSuoDate03_39",
						"YSuoDate03_40"
					},
					actionName = {
						"start_YSuoDate03n",
						"start_YSuoDate03o"
					}
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_41"
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
					name = "start_YSuoDate03p"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_42"
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
					name = "start_YSuoDate03p"
				}
			end
		})
	})
end

function scene_YSuoDate03.actions.start_YSuoDate03p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSuo/YSuo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_45"
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
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"YSuoDate03_46"
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

local function YSuoDate03(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_YSuoDate03",
					scene = scene_YSuoDate03
				}
			end
		})
	})
end

stories.YSuoDate03 = YSuoDate03

return _M
