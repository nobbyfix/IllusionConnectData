local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.TLMiDate02")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_TLMiDate02 = {
	actions = {}
}
scenes.scene_TLMiDate02 = scene_TLMiDate02

function scene_TLMiDate02:stage(args)
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
				name = "bg1",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_EXscene_3_1.jpg",
				layoutMode = 1,
				zorder = 2,
				id = "bg1",
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

function scene_TLMiDate02.actions.start_TLMiDate02(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg1")
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
					modelId = "Model_TLMi",
					id = "TLMi_speak",
					rotationX = 0,
					scale = 1,
					zorder = 5,
					position = {
						x = 0,
						y = -283,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "TLMi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "TLMi/TLMi_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "TLMi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 19.3,
								y = 719.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "TLMi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "TLMi_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_2"
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
						"TLMiDate02_3",
						"TLMiDate02_4"
					},
					actionName = {
						"start_TLMiDate02b",
						"start_TLMiDate02c"
					}
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_5"
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
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_6"
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
					name = "start_TLMiDate02d"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_8"
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
					name = "start_TLMiDate02d"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_10"
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
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_11"
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
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_13"
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
						"TLMiDate02_14",
						"TLMiDate02_15"
					},
					actionName = {
						"start_TLMiDate02e",
						"start_TLMiDate02f"
					}
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_17"
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
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_18"
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
					name = "start_TLMiDate02g"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_19"
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
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_20"
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
					name = "start_TLMiDate02g"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_21"
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
						"TLMiDate02_22",
						"TLMiDate02_23"
					},
					actionName = {
						"start_TLMiDate02h",
						"start_TLMiDate02i"
					}
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_26"
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
					name = "start_TLMiDate02j"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_28"
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
					name = "start_TLMiDate02j"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_30"
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
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_31"
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
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_32"
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
						"TLMiDate02_33",
						"TLMiDate02_34"
					},
					actionName = {
						"start_TLMiDate02k",
						"start_TLMiDate02l"
					}
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_37"
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
					name = "start_TLMiDate02m"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_39"
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
					name = "start_TLMiDate02m"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_41"
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
						"TLMiDate02_42",
						"TLMiDate02_43"
					},
					actionName = {
						"start_TLMiDate02n",
						"start_TLMiDate02o"
					}
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_45"
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
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_46"
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
					name = "start_TLMiDate02p"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_47"
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
					name = "start_TLMiDate02p"
				}
			end
		})
	})
end

function scene_TLMiDate02.actions.start_TLMiDate02p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_48"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "TLMi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "TLMi/TLMi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TLMi_speak"
					},
					content = {
						"TLMiDate02_50"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "TLMi_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -283,
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

local function TLMiDate02(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_TLMiDate02",
					scene = scene_TLMiDate02
				}
			end
		})
	})
end

stories.TLMiDate02 = TLMiDate02

return _M
