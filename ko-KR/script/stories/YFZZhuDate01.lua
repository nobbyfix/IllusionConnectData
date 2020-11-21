local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.YFZZhuDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_YFZZhuDate01 = {
	actions = {}
}
scenes.scene_YFZZhuDate01 = scene_YFZZhuDate01

function scene_YFZZhuDate01:stage(args)
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

function scene_YFZZhuDate01.actions.start_YFZZhuDate01(_root, args)
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
					modelId = "Model_YFZZhu",
					id = "YFZZhu_speak",
					rotationX = 0,
					scale = 1.05,
					zorder = 10,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 1.1,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YFZZhu_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YFZZhu/YFZZhu_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YFZZhu_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -39.5,
								y = 624
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					brightness = -225,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 0.7,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = -0.5,
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
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_1"
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					date = true,
					content = {
						"YFZZhuDate01_2",
						"YFZZhuDate01_3"
					},
					actionName = {
						"start_YFZZhuDate01b",
						"start_YFZZhuDate01c"
					}
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01b(_root, args)
	return sequential({
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					brightness = -50,
					duration = 0
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "YFZZhu_speak"),
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
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_4"
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
					name = "start_YFZZhuDate01d"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01c(_root, args)
	return sequential({
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					brightness = -50,
					duration = 0
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "YFZZhu_speak"),
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
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_5"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_6"
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
					name = "start_YFZZhuDate01d"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
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
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						scale = 0.75,
						duration = 0.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -150,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						scale = 1.05,
						duration = 0.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -255,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_9"
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
						"YFZZhuDate01_10",
						"YFZZhuDate01_11"
					},
					actionName = {
						"start_YFZZhuDate01e",
						"start_YFZZhuDate01f"
					}
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_12"
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_14"
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
					name = "start_YFZZhuDate01g"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_15"
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_16"
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
					name = "start_YFZZhuDate01g"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_18"
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
						"YFZZhuDate01_19",
						"YFZZhuDate01_20"
					},
					actionName = {
						"start_YFZZhuDate01h",
						"start_YFZZhuDate01i"
					}
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_21"
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_23"
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
					name = "start_YFZZhuDate01j"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_24"
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_26"
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
					name = "start_YFZZhuDate01j"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_27"
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_29"
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
						"YFZZhuDate01_30",
						"YFZZhuDate01_31"
					},
					actionName = {
						"start_YFZZhuDate01k",
						"start_YFZZhuDate01l"
					}
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_32"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_34"
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
					name = "start_YFZZhuDate01m"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "rock",
				actor = __getnode__(_root, "YFZZhu_speak"),
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_35"
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_37"
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
					name = "start_YFZZhuDate01m"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_39"
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
						"YFZZhuDate01_40",
						"YFZZhuDate01_41"
					},
					actionName = {
						"start_YFZZhuDate01n",
						"start_YFZZhuDate01o"
					}
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_42"
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_44"
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
					name = "start_YFZZhuDate01p"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_45"
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_46"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_47"
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
					name = "start_YFZZhuDate01p"
				}
			end
		})
	})
end

function scene_YFZZhuDate01.actions.start_YFZZhuDate01p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_48"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YFZZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YFZZhu/YFZZhu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"YFZZhuDate01_50"
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

local function YFZZhuDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_YFZZhuDate01",
					scene = scene_YFZZhuDate01
				}
			end
		})
	})
end

stories.YFZZhuDate01 = YFZZhuDate01

return _M
