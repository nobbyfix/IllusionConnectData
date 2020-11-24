local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.ATShengDate03")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_ATShengDate03 = {
	actions = {}
}
scenes.scene_ATShengDate03 = scene_ATShengDate03

function scene_ATShengDate03:stage(args)
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
				image = "bg_story_EXscene_7_1.jpg",
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
						zorder = 1100,
						visible = true,
						id = "bgEx_yinghuashu",
						scale = 1,
						actionName = "all_yinghuashu",
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
			},
			{
				id = "Voice_ATSheng_06",
				fileName = "Voice_ATSheng_06",
				type = "Sound"
			},
			{
				id = "Voice_ATSheng_22_1",
				fileName = "Voice_ATSheng_22_1",
				type = "Sound"
			},
			{
				id = "Voice_ATSheng_22_2",
				fileName = "Voice_ATSheng_22_2",
				type = "Sound"
			},
			{
				id = "Voice_ATSheng_22_3",
				fileName = "Voice_ATSheng_22_3",
				type = "Sound"
			},
			{
				id = "Voice_ATSheng_22_4",
				fileName = "Voice_ATSheng_22_4",
				type = "Sound"
			},
			{
				id = "Voice_ATSheng_22_5",
				fileName = "Voice_ATSheng_22_5",
				type = "Sound"
			}
		},
		__actions__ = self.actions
	}
end

function scene_ATShengDate03.actions.start_ATShengDate03(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_yinghuashu"),
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
					modelId = "Model_ATSheng",
					id = "ATSheng_speak",
					rotationX = 0,
					scale = 1,
					zorder = 11,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ATSheng_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ATSheng/ATSheng_face_5.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ATSheng_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -31,
								y = 683
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ATSheng_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ATSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_4")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.25,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.55,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.25,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.25,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.55,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.25,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
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
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_1")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_3"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.25,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.45,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.25,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.25,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.45,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.25,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
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
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_4"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_2")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_5"
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
						"ATShengDate03_6",
						"ATShengDate03_7"
					},
					actionName = {
						"start_ATShengDate03b",
						"start_ATShengDate03c"
					}
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_06")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_4")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_10"
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
					name = "start_ATShengDate03d"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_1")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_12"
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
					name = "start_ATShengDate03d"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_4")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_13"
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
						"ATShengDate03_14",
						"ATShengDate03_15"
					},
					actionName = {
						"start_ATShengDate03e",
						"start_ATShengDate03f"
					}
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03e(_root, args)
	return sequential({
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ATSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -240,
							refpt = {
								x = 0.5,
								y = -0.2
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ATSheng_speak"),
				args = function (_ctx)
					return {
						scale = 1.2,
						duration = 0.3
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ATSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -240,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ATSheng_speak"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0.5
					}
				end
			})
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_ATShengDate03g"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_3")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_4")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_19"
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
					name = "start_ATShengDate03g"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_20"
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
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_5")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_23"
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
						"ATShengDate03_24",
						"ATShengDate03_25"
					},
					actionName = {
						"start_ATShengDate03h",
						"start_ATShengDate03i"
					}
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_4")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_28"
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
					name = "start_ATShengDate03j"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03i(_root, args)
	return sequential({
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_1")
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_4")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_31"
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
					name = "start_ATShengDate03j"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_32"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_4")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_33"
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
						"ATShengDate03_34",
						"ATShengDate03_35"
					},
					actionName = {
						"start_ATShengDate03k",
						"start_ATShengDate03l"
					}
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_3")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_36"
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
					name = "start_ATShengDate03m"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_5")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_37"
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
					name = "start_ATShengDate03m"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_39"
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
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_40"
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
						"ATShengDate03_41",
						"ATShengDate03_42"
					},
					actionName = {
						"start_ATShengDate03o",
						"start_ATShengDate03p"
					}
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_1")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_5")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_44"
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
					name = "start_ATShengDate03q"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_3")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_45"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_46"
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
					name = "start_ATShengDate03q"
				}
			end
		})
	})
end

function scene_ATShengDate03.actions.start_ATShengDate03q(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_1")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_48"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_50"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_51"
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
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
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
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_4.png",
					pathType = "STORY_FACE"
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
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_1")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_52"
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
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
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
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_5.png",
					pathType = "STORY_FACE"
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_53"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_3")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_54"
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
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ATSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
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
			action = "changeTexture",
			actor = __getnode__(_root, "ATSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ATSheng/ATSheng_face_3.png",
					pathType = "STORY_FACE"
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_55"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_ATSheng_22_3")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ATSheng_speak"
					},
					content = {
						"ATShengDate03_56"
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

local function ATShengDate03(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_ATShengDate03",
					scene = scene_ATShengDate03
				}
			end
		})
	})
end

stories.ATShengDate03 = ATShengDate03

return _M
