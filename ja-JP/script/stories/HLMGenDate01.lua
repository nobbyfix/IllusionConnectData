local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.HLMGenDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_HLMGenDate01 = {
	actions = {}
}
scenes.scene_HLMGenDate01 = scene_HLMGenDate01

function scene_HLMGenDate01:stage(args)
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
				image = "bg_story_scene_1_8.jpg",
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
						id = "lun",
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

function scene_HLMGenDate01.actions.start_HLMGenDate01(_root, args)
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
					modelId = "Model_HLMGen",
					id = "HLMGen_speak",
					rotationX = 0,
					scale = 0.94,
					zorder = 2,
					position = {
						x = 275,
						y = -243,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "HLMGen_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "HLMGen/HLMGen_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "HLMGen_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -35.3,
								y = 716.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_1"
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
						"HLMGenDate01_2",
						"HLMGenDate01_3"
					},
					actionName = {
						"start_HLMGenDate01b",
						"start_HLMGenDate01c"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_4"
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
						"HLMGenDate01_5"
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_8"
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
					name = "start_HLMGenDate01d"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_9"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_10"
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
						"HLMGenDate01_11"
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_13"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_14"
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
					name = "start_HLMGenDate01d"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_15"
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
						"HLMGenDate01_16",
						"HLMGenDate01_17"
					},
					actionName = {
						"start_HLMGenDate01e",
						"start_HLMGenDate01f"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_20"
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
					name = "start_HLMGenDate01g"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_22"
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
						"HLMGenDate01_23"
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_HLMGenDate01g"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_24"
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
						"HLMGenDate01_25",
						"HLMGenDate01_26"
					},
					actionName = {
						"start_HLMGenDate01h",
						"start_HLMGenDate01i"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_28"
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
					name = "start_HLMGenDate01j"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_31"
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
					name = "start_HLMGenDate01j"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_32"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_34"
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
						"HLMGenDate01_35",
						"HLMGenDate01_36"
					},
					actionName = {
						"start_HLMGenDate01k",
						"start_HLMGenDate01l"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_40"
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
					name = "start_HLMGenDate01m"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_41"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_42"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_44"
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
					name = "start_HLMGenDate01m"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_45"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_46"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_48"
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
						"HLMGenDate01_49",
						"HLMGenDate01_50"
					},
					actionName = {
						"start_HLMGenDate01n",
						"start_HLMGenDate01o"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_51"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_52"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_53"
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
					name = "start_HLMGenDate01p"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_54"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_55"
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
					name = "start_HLMGenDate01p"
				}
			end
		})
	})
end

function scene_HLMGenDate01.actions.start_HLMGenDate01p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_56"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_57"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_58"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate01_59"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 1.5,
					position = {
						x = 0,
						y = 0,
						refpt = {
							x = -1.5,
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

local function HLMGenDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_HLMGenDate01",
					scene = scene_HLMGenDate01
				}
			end
		})
	})
end

stories.HLMGenDate01 = HLMGenDate01

return _M
