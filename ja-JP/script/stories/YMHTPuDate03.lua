local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.YMHTPuDate03")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_YMHTPuDate03 = {
	actions = {}
}
scenes.scene_YMHTPuDate03 = scene_YMHTPuDate03

function scene_YMHTPuDate03:stage(args)
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
				image = "bg_story_EXscene_1_4.jpg",
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
						id = "bgEx_xuzhangmengyan",
						layoutMode = 1,
						type = "MovieClip",
						scale = 1,
						actionName = "mengyan_xuzhangmengyan",
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
			}
		},
		__actions__ = self.actions
	}
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_xuzhangmengyan"),
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
					modelId = "Model_YMHTPu",
					id = "YMHTPu_speak",
					rotationX = 0,
					scale = 1.1,
					zorder = 2,
					position = {
						x = 100,
						y = -400,
						refpt = {
							x = 0.45,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YMHTPu_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YMHTPu/YMHTPu_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YMHTPu_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -2,
								y = 755
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YMHTPu_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YMHTPu_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_1"
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
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_3"
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
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_4"
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
						"YMHTPuDate03_5",
						"YMHTPuDate03_6"
					},
					actionName = {
						"start_YMHTPuDate03b",
						"start_YMHTPuDate03c"
					}
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_8"
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
					name = "start_YMHTPuDate03d"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_10"
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
					name = "start_YMHTPuDate03d"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "YMHTPu_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_12"
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
						"YMHTPuDate03_13",
						"YMHTPuDate03_14"
					},
					actionName = {
						"start_YMHTPuDate03e",
						"start_YMHTPuDate03f"
					}
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_16"
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
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_17"
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
					name = "start_YMHTPuDate03g"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_20"
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
					name = "start_YMHTPuDate03g"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_21"
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
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_22"
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
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YMHTPu_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			action = "fadeIn",
			actor = __getnode__(_root, "YMHTPu_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
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
						"YMHTPuDate03_23",
						"YMHTPuDate03_24"
					},
					actionName = {
						"start_YMHTPuDate03h",
						"start_YMHTPuDate03i"
					}
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_26"
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
					name = "start_YMHTPuDate03j"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_28"
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
					name = "start_YMHTPuDate03j"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_63",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu_speak"
						},
						content = {
							"YMHTPuDate03_30"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_31"
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
						"YMHTPuDate03_32",
						"YMHTPuDate03_33"
					},
					actionName = {
						"start_YMHTPuDate03k",
						"start_YMHTPuDate03l"
					}
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_55.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_34"
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
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_36"
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
					name = "start_YMHTPuDate03m"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_37"
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
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "rock",
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			})
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YMHTPuDate03m"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_41"
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
					name = "dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_42"
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
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YMHTPu_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			action = "fadeIn",
			actor = __getnode__(_root, "YMHTPu_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
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
						"YMHTPuDate03_43",
						"YMHTPuDate03_44"
					},
					actionName = {
						"start_YMHTPuDate03n",
						"start_YMHTPuDate03o"
					}
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_45"
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
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_46"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_47"
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
					name = "start_YMHTPuDate03p"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_48"
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
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_50"
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
					name = "start_YMHTPuDate03p"
				}
			end
		})
	})
end

function scene_YMHTPuDate03.actions.start_YMHTPuDate03p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_51"
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
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_52"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_53"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YMHTPu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YMHTPu/YMHTPu_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_63",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu_speak"
					},
					content = {
						"YMHTPuDate03_54"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YMHTPu_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 100,
						y = -400,
						refpt = {
							x = -0.5,
							y = 0
						}
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

local function YMHTPuDate03(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_YMHTPuDate03",
					scene = scene_YMHTPuDate03
				}
			end
		})
	})
end

stories.YMHTPuDate03 = YMHTPuDate03

return _M
