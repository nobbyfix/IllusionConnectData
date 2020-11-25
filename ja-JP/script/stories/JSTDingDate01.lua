local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.JSTDingDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_JSTDingDate01 = {
	actions = {}
}
scenes.scene_JSTDingDate01 = scene_JSTDingDate01

function scene_JSTDingDate01:stage(args)
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
				brightness = 0,
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
			},
			{
				id = "date_music",
				fileName = "Mus_Story_Common_2",
				type = "Music"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 3,
				visible = false,
				id = "dunqi_juqingtexiao",
				scale = 1.05,
				actionName = "dunqi_juqingtexiao",
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
		},
		__actions__ = self.actions
	}
end

function scene_JSTDingDate01.actions.start_JSTDingDate01(_root, args)
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
					brightness = 0,
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
						"JSTDingDate01_1"
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
						"JSTDingDate01_2"
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
						"JSTDingDate01_3"
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
						"JSTDingDate01_4",
						"JSTDingDate01_5"
					},
					actionName = {
						"start_JSTDingDate01b",
						"start_JSTDingDate01c"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01b(_root, args)
	return sequential({
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
						"JSTDingDate01_6"
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
						"JSTDingDate01_7"
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
						"JSTDingDate01_8"
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
					name = "start_JSTDingDate01d"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01c(_root, args)
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
						"JSTDingDate01_9"
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
						"JSTDingDate01_10"
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
						"JSTDingDate01_11"
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
					name = "start_JSTDingDate01d"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01d(_root, args)
	return sequential({
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
						"JSTDingDate01_12"
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
						"JSTDingDate01_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "bgEx_xuzhangmengyan"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					brightness = -255,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "bgEx_xuzhangmengyan"),
			args = function (_ctx)
				return {
					brightness = -255,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JSTDing_speak"),
			args = function (_ctx)
				return {
					brightness = -255,
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "dunqi_juqingtexiao"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.6,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "dunqi_juqingtexiao"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "dunqi_juqingtexiao")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "CLManAttack_Sound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "dunqi_juqingtexiao"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.3,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "dunqi_juqingtexiao"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 1,
					deltaAngleZ = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "dunqi_juqingtexiao")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "CLManAttack_Sound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "dunqi_juqingtexiao"),
			args = function (_ctx)
				return {
					duration = 2,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.5,
							y = 0.8
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "dunqi_juqingtexiao"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 1,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "dunqi_juqingtexiao")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "CLManAttack_Sound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			})
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "bgEx_xuzhangmengyan"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JSTDing_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
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
					name = "dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_6.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JSTDing_speak"
					},
					content = {
						"JSTDingDate01_14"
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
						"JSTDingDate01_15"
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
						"JSTDingDate01_16"
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
						"JSTDingDate01_17",
						"JSTDingDate01_18"
					},
					actionName = {
						"start_JSTDingDate01e",
						"start_JSTDingDate01f"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01e(_root, args)
	return sequential({
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
						"JSTDingDate01_19"
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
					name = "start_JSTDingDate01g"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01f(_root, args)
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
						"JSTDingDate01_20"
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
					name = "start_JSTDingDate01g"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01g(_root, args)
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
						"JSTDingDate01_21"
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
						"JSTDingDate01_22"
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
						"JSTDingDate01_23"
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
						"JSTDingDate01_24",
						"JSTDingDate01_25"
					},
					actionName = {
						"start_JSTDingDate01h",
						"start_JSTDingDate01i"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01h(_root, args)
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
						"JSTDingDate01_26"
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
						"JSTDingDate01_27"
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
					name = "start_JSTDingDate01j"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01i(_root, args)
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
						"JSTDingDate01_28"
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
						"JSTDingDate01_29"
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
						"JSTDingDate01_30"
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
					name = "start_JSTDingDate01j"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01j(_root, args)
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
						"JSTDingDate01_31"
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
						"JSTDingDate01_32"
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
						"JSTDingDate01_33",
						"JSTDingDate01_34"
					},
					actionName = {
						"start_JSTDingDate01k",
						"start_JSTDingDate01l"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01k(_root, args)
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
						"JSTDingDate01_35"
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
						"JSTDingDate01_36"
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
					name = "start_JSTDingDate01m"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01l(_root, args)
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
						"JSTDingDate01_37"
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
						"JSTDingDate01_38"
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
						"JSTDingDate01_39"
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
						"JSTDingDate01_40"
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
						"JSTDingDate01_41"
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
						"JSTDingDate01_42"
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
					name = "start_JSTDingDate01m"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01m(_root, args)
	return sequential({
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
						"JSTDingDate01_43"
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
						"JSTDingDate01_44"
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
						"JSTDingDate01_45"
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
						"JSTDingDate01_46",
						"JSTDingDate01_47"
					},
					actionName = {
						"start_JSTDingDate01n",
						"start_JSTDingDate01o"
					}
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01n(_root, args)
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
						"JSTDingDate01_48"
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
					name = "start_JSTDingDate01p"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01o(_root, args)
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
						"JSTDingDate01_49"
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
						"JSTDingDate01_50"
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
					name = "start_JSTDingDate01p"
				}
			end
		})
	})
end

function scene_JSTDingDate01.actions.start_JSTDingDate01p(_root, args)
	return sequential({
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
						"JSTDingDate01_51"
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
						"JSTDingDate01_52"
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

local function JSTDingDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_JSTDingDate01",
					scene = scene_JSTDingDate01
				}
			end
		})
	})
end

stories.JSTDingDate01 = JSTDingDate01

return _M
