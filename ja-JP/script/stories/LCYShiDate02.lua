local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.LCYShiDate02")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_LCYShiDate02 = {
	actions = {}
}
scenes.scene_LCYShiDate02 = scene_LCYShiDate02

function scene_LCYShiDate02:stage(args)
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

function scene_LCYShiDate02.actions.start_LCYShiDate02(_root, args)
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
					modelId = "Model_LCYShi",
					id = "LCYShi_speak",
					rotationX = 0,
					scale = 0.9,
					zorder = 3,
					position = {
						x = 0,
						y = -350,
						refpt = {
							x = 0.2,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "LCYShi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "LCYShi/LCYShi_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "LCYShi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 44.4,
								y = 744.2
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LCYShi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LCYShi_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_1"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_2"
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
				actor = __getnode__(_root, "LCYShi_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_3"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_4"
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
						"LCYShiDate02_5",
						"LCYShiDate02_6"
					},
					actionName = {
						"start_LCYShiDate02b",
						"start_LCYShiDate02c"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02b(_root, args)
	return sequential({
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LCYShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -350,
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
				actor = __getnode__(_root, "LCYShi_speak"),
				args = function (_ctx)
					return {
						scale = 1.155,
						duration = 0.6
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_7"
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
				actor = __getnode__(_root, "LCYShi_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_8"
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
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_10"
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
					name = "start_LCYShiDate02d"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02c(_root, args)
	return sequential({
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LCYShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -350,
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
				actor = __getnode__(_root, "LCYShi_speak"),
				args = function (_ctx)
					return {
						scale = 1.155,
						duration = 0.6
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_12"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_13"
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
					name = "start_LCYShiDate02d"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_15"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_17"
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
						"LCYShiDate02_18",
						"LCYShiDate02_19"
					},
					actionName = {
						"start_LCYShiDate02e",
						"start_LCYShiDate02f"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_22"
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
					name = "start_LCYShiDate02g"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_24"
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
					name = "start_LCYShiDate02g"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_25"
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
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_28"
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
						"LCYShiDate02_29",
						"LCYShiDate02_30"
					},
					actionName = {
						"start_LCYShiDate02h",
						"start_LCYShiDate02i"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_31"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_32"
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
					name = "start_LCYShiDate02j"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_34"
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
					name = "start_LCYShiDate02j"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_36"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_37"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_39"
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
						"LCYShiDate02_40",
						"LCYShiDate02_41"
					},
					actionName = {
						"start_LCYShiDate02k",
						"start_LCYShiDate02l"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_42"
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
					name = "start_LCYShiDate02m"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_45"
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
					name = "start_LCYShiDate02m"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_46"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_47"
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
						"LCYShiDate02_48",
						"LCYShiDate02_49"
					},
					actionName = {
						"start_LCYShiDate02n",
						"start_LCYShiDate02o"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_50"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_51"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_52"
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
					name = "start_LCYShiDate02p"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_53"
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
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_54"
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
					name = "start_LCYShiDate02p"
				}
			end
		})
	})
end

function scene_LCYShiDate02.actions.start_LCYShiDate02p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_55"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_56"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_40",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate02_57"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LCYShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -350,
						refpt = {
							x = 1.5,
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

local function LCYShiDate02(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_LCYShiDate02",
					scene = scene_LCYShiDate02
				}
			end
		})
	})
end

stories.LCYShiDate02 = LCYShiDate02

return _M
