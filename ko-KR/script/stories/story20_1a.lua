local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story20_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story20_1a = {
	actions = {}
}
scenes.scene_story20_1a = scene_story20_1a

function scene_story20_1a:stage(args)
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
				name = "hm",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				id = "hm",
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
						resType = 0,
						name = "bg1",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_7_3.jpg",
						layoutMode = 1,
						zorder = 1,
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
						}
					},
					{
						resType = 0,
						name = "bg2",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_9_1.jpg",
						layoutMode = 1,
						zorder = 3,
						id = "bg2",
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
						}
					}
				}
			},
			{
				id = "Mus_Story_Research",
				fileName = "Mus_Story_Research",
				type = "Music"
			},
			{
				id = "Mus_Story_Intro_Chapter",
				fileName = "Mus_Story_Intro_Chapter",
				type = "Music"
			},
			{
				id = "Se_Story_Chapter_20_21",
				fileName = "Se_Story_Chapter_20_21",
				type = "Sound"
			},
			{
				id = "Mus_Story_Dongwenhui",
				fileName = "Mus_Story_Dongwenhui",
				type = "Music"
			},
			{
				id = "Mus_Story_Playground_Confused",
				fileName = "Mus_Story_Playground_Confused",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_story20_1a.actions.start_story20_1a(_root, args)
	return sequential({
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Research")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Playground")
		}),
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "chapterDialog"),
				args = function (_ctx)
					return {
						content = {
							"story20_1a_1",
							{
								"story20_1a_2",
								"story20_1a_3"
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Chapter_20_21"),
				args = function (_ctx)
					return {
						isLoop = false
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "chapterDialog")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Intro_Chapter"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					heightSpace = 12,
					content = {
						"story20_1a_4",
						"story20_1a_5",
						"story20_1a_6",
						"story20_1a_7",
						"story20_1a_8",
						"story20_1a_9",
						"story20_1a_10",
						"story20_1a_11",
						"story20_1a_12",
						"story20_1a_13",
						"story20_1a_14"
					},
					waitTimes = {
						10
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Intro_Chapter")
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg1")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Research"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "autoPlayButton")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "skipButton")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "reviewButton")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Dongwenhui"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_CZheng",
					id = "CZheng_speak",
					rotationX = 0,
					scale = 1.2,
					position = {
						x = 0,
						y = -445,
						refpt = {
							x = 0.35,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_BBLMa",
					id = "BBLMa_speak",
					rotationX = 0,
					scale = 1.155,
					zorder = 10,
					position = {
						x = 0,
						y = -450,
						refpt = {
							x = 0.7,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "BBLMa_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "BBLMa/BBLMa_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "BBLMa_face",
							scale = 1.025,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 90.3,
								y = 779.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.75
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.75
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_18",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story20_1a_15"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story20_1a_16"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story20_1a_17"
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
					name = "dialog_speak_name_18",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story20_1a_18"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story20_1a_19"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story20_1a_20"
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
					name = "dialog_speak_name_18",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story20_1a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CZheng_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BBLMa_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Dongwenhui")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Playground_Confused"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_144"
					},
					content = {
						"story20_1a_22"
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
					content = {
						"story20_1a_23"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_144"
					},
					content = {
						"story20_1a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_ZTXChang",
					id = "ZTXChang_speak",
					rotationX = 0,
					scale = 1.08,
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.55,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ZTXChang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ZTXChang/ZTXChang_face_11.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ZTXChang_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -50.8,
								y = 789
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.75
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"story20_1a_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_CLMan",
					id = "CLMan_speak",
					rotationX = 0,
					scale = 0.9,
					zorder = 5,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 0.225,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "CLMan_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "CLMan/CLMan_face_6.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "CLMan_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 60.5,
								y = 787
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.75
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CLMan_speak"
					},
					content = {
						"story20_1a_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_FTLEShi",
					id = "FTLEShi_speak",
					rotationX = 0,
					scale = 1.025,
					position = {
						x = 0,
						y = -510,
						refpt = {
							x = 0.75,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "FTLEShi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "FTLEShi/FTLEShi_face_11.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "FTLEShi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -16,
								y = 998
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.75
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"story20_1a_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_NDGEr",
					id = "NDGEr_speak",
					rotationX = 0,
					scale = 0.8,
					position = {
						x = 0,
						y = -280,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					},
					children = {
						{
							resType = 0,
							name = "NDGEr_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "NDGEr/NDGEr_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "NDGEr_face",
							scale = 1.275,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -57,
								y = 1011
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "NDGEr_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "NDGEr_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_146",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NDGEr_speak"
					},
					content = {
						"story20_1a_29"
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
					content = {
						"story20_1a_30",
						"story20_1a_31"
					},
					actionName = {
						"story20_1a1",
						"story20_1a2"
					}
				}
			end
		})
	})
end

function scene_story20_1a.actions.story20_1a1(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_146",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NDGEr_speak"
					},
					content = {
						"story20_1a_32"
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
					name = "story20_1a3"
				}
			end
		})
	})
end

function scene_story20_1a.actions.story20_1a2(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_146",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NDGEr_speak"
					},
					content = {
						"story20_1a_33"
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
					name = "story20_1a3"
				}
			end
		})
	})
end

function scene_story20_1a.actions.story20_1a3(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_146",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NDGEr_speak"
					},
					content = {
						"story20_1a_34"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_35"
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
					name = "dialog_speak_name_146",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NDGEr_speak"
					},
					content = {
						"story20_1a_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
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
			action = "fadeOut",
			actor = __getnode__(_root, "NDGEr_speak"),
			args = function (_ctx)
				return {
					duration = 0
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
					modelId = "Model_FEMSi",
					id = "FEMSi_speak",
					rotationX = 0,
					scale = 0.72,
					position = {
						x = 0,
						y = -305,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "FEMSi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FEMSi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_37"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_38"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_39"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_40"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_41"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_42"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_43"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_44"
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
					content = {
						"story20_1a_45"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_46"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_47"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_48"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_49"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_50"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_51"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_52"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_53"
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
					content = {
						"story20_1a_54",
						"story20_1a_55"
					},
					actionName = {
						"story20_1a4",
						"story20_1a5"
					}
				}
			end
		})
	})
end

function scene_story20_1a.actions.story20_1a4(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_56"
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
					name = "story20_1a6"
				}
			end
		})
	})
end

function scene_story20_1a.actions.story20_1a5(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_57"
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
					name = "story20_1a6"
				}
			end
		})
	})
end

function scene_story20_1a.actions.story20_1a6(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_58"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_59"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_60"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_61"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_62"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_63"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					brightness = -255,
					modelId = "Model_JNLong",
					id = "JNLong_speak",
					rotationX = 0,
					scale = 1.125,
					position = {
						x = 0,
						y = -395,
						refpt = {
							x = 1.55,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "JNLong_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "JNLong/JNLong_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = -1,
							visible = true,
							id = "JNLong_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 177.5,
								y = 806.4
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JNLong_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JNLong_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "FEMSi_speak"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -368,
							refpt = {
								x = 0.25,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JNLong_speak"),
			args = function (_ctx)
				return {
					duration = 0.75,
					position = {
						x = 0,
						y = -395,
						refpt = {
							x = 0.55,
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
					name = "dialog_speak_name_32",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_5"
					},
					content = {
						"story20_1a_64"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"story20_1a_65"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "block",
			actor = __getnode__(_root, "Mus_Story_Playground_Confused"),
			args = function (_ctx)
				return {
					blockId = "Mus_Story_Playground_Confused_Block_1"
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Main_Scene"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		})
	})
end

local function story20_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story20_1a",
					scene = scene_story20_1a
				}
			end
		})
	})
end

stories.story20_1a = story20_1a

return _M
