local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.MKLJLuoDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_MKLJLuoDate01 = {
	actions = {}
}
scenes.scene_MKLJLuoDate01 = scene_MKLJLuoDate01

function scene_MKLJLuoDate01:stage(args)
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
				image = "bg_story_EXscene_6_1.jpg",
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
						id = "bgEX_businiaoyanhui",
						layoutMode = 1,
						type = "MovieClip",
						scale = 1,
						actionName = "anim_businiaoyanhui",
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

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEX_businiaoyanhui"),
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
					modelId = "Model_MKLJLuo",
					id = "MKLJLuo_speak",
					rotationX = 0,
					scale = 0.875,
					zorder = 2,
					position = {
						x = 0,
						y = -210,
						refpt = {
							x = 0.6,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "MKLJLuo_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "MKLJLuo/MKLJLuo_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "MKLJLuo_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 0,
								y = 690.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MKLJLuo_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MKLJLuo_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_1"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_3"
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
						"MKLJLuoDate01_4",
						"MKLJLuoDate01_5"
					},
					actionName = {
						"start_MKLJLuoDate01b",
						"start_MKLJLuoDate01c"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01b(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_6"
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
					name = "start_MKLJLuoDate01d"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01c(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_7"
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
					name = "start_MKLJLuoDate01d"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_8"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_9"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_10"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_11"
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
						"MKLJLuoDate01_12",
						"MKLJLuoDate01_13"
					},
					actionName = {
						"start_MKLJLuoDate01e",
						"start_MKLJLuoDate01f"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_14"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_15"
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
					name = "start_MKLJLuoDate01g"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_16"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_18"
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
					name = "start_MKLJLuoDate01g"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_21"
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
						"MKLJLuoDate01_22",
						"MKLJLuoDate01_23"
					},
					actionName = {
						"start_MKLJLuoDate01h",
						"start_MKLJLuoDate01i"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_24"
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
					name = "start_MKLJLuoDate01j"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_26"
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
					name = "start_MKLJLuoDate01j"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_27"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_28"
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
						"MKLJLuoDate01_29",
						"MKLJLuoDate01_30"
					},
					actionName = {
						"start_MKLJLuoDate01k",
						"start_MKLJLuoDate01l"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_32"
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
					name = "start_MKLJLuoDate01m"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_34"
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
					name = "start_MKLJLuoDate01m"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_35"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_37"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_38"
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
						"MKLJLuoDate01_39",
						"MKLJLuoDate01_40"
					},
					actionName = {
						"start_MKLJLuoDate01n",
						"start_MKLJLuoDate01o"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_41"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_42"
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
					name = "start_MKLJLuoDate01p"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_43"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_45"
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
					name = "start_MKLJLuoDate01p"
				}
			end
		})
	})
end

function scene_MKLJLuoDate01.actions.start_MKLJLuoDate01p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_46"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_47"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate01_48"
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

local function MKLJLuoDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_MKLJLuoDate01",
					scene = scene_MKLJLuoDate01
				}
			end
		})
	})
end

stories.MKLJLuoDate01 = MKLJLuoDate01

return _M
