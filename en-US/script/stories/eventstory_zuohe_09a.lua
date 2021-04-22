local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_zuohe_09a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_zuohe_09a = {
	actions = {}
}
scenes.scene_eventstory_zuohe_09a = scene_eventstory_zuohe_09a

function scene_eventstory_zuohe_09a:stage(args)
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
						image = "main_event_04.jpg",
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
						image = "main_event_03.jpg",
						layoutMode = 1,
						zorder = 1,
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
				id = "Mus_Main_Scene",
				fileName = "Mus_Main_Scene",
				type = "Music"
			},
			{
				id = "Mus_Zuohe_1",
				fileName = "Mus_Zuohe_1",
				type = "Music"
			},
			{
				id = "Mus_Story_Anna_Concert",
				fileName = "Mus_Story_Anna_Concert",
				type = "Music"
			},
			{
				id = "Mus_Zuohe_2",
				fileName = "Mus_Zuohe_2",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_zuohe_09a.actions.start_eventstory_zuohe_09a(_root, args)
	return sequential({
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
			action = "show",
			actor = __getnode__(_root, "skipButton")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "reviewButton")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "autoPlayButton")
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_YYing",
					id = "YYing_speak",
					rotationX = 0,
					scale = 0.94,
					zorder = 16,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = 0.6,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YYing_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YYing/YYing_face_3.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YYing_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 0,
								y = 915
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YYing_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YYing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Anna_Concert"),
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
					name = "dialog_speak_name_233",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YYing_speak"
					},
					content = {
						"eventstory_zuohe_09a_1"
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
					zorder = 17,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 0.375,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "CLMan_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "CLMan/CLMan_face_3.png",
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
					name = "dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CLMan_speak"
					},
					content = {
						"eventstory_zuohe_09a_2"
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
					modelId = "Model_Story_SYAi",
					id = "SYAi_speak",
					rotationX = 0,
					scale = 1.1,
					zorder = 15,
					position = {
						x = 0,
						y = -370,
						refpt = {
							x = 0.9,
							y = -0.05
						}
					},
					children = {
						{
							resType = 0,
							name = "SYAi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SYAi/SYAi_face_2.png",
							scaleX = 1.03,
							scaleY = 1.03,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SYAi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -14,
								y = 792
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SYAi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SYAi_speak"),
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
					name = "dialog_speak_name_234",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SYAi_speak"
					},
					content = {
						"eventstory_zuohe_09a_3"
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
					modelId = "Model_Story_GYCZi",
					id = "GYCZi_speak",
					rotationX = 0,
					scale = 1,
					zorder = 15.5,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = 0.6,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "GYCZi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "GYCZi/GYCZi_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "GYCZi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 13,
								y = 830
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "GYCZi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "GYCZi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "YYing_speak"),
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
					name = "dialog_speak_name_235",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GYCZi_speak"
					},
					content = {
						"eventstory_zuohe_09a_4"
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
					name = "dialog_speak_name_234",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SYAi_speak"
					},
					content = {
						"eventstory_zuohe_09a_5"
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
					zorder = 13,
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.275,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ZTXChang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ZTXChang/ZTXChang_face_3.png",
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"eventstory_zuohe_09a_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SYAi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SYAi/SYAi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_234",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SYAi_speak"
					},
					content = {
						"eventstory_zuohe_09a_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_1.png",
					pathType = "STORY_FACE"
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
						"ZTXChang_speak"
					},
					content = {
						"eventstory_zuohe_09a_8"
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
					zorder = 11,
					position = {
						x = 0,
						y = -510,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "FTLEShi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "FTLEShi/FTLEShi_face_1.png",
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
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan_speak"),
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
					name = "dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_zuohe_09a_9"
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
					content = {
						"eventstory_zuohe_09a_10"
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
					modelId = "Model_MLYTLSha",
					id = "MLYTLSha_speak",
					rotationX = 0,
					scale = 1,
					position = {
						x = 0,
						y = -355,
						refpt = {
							x = 0.75,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "MLYTLSha_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "MLYTLSha/MLYTLSha_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "MLYTLSha_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -29,
								y = 829
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MLYTLSha_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MLYTLSha_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "SYAi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "GYCZi_speak"),
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
					name = "dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"eventstory_zuohe_09a_11"
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
					name = "dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_zuohe_09a_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MLYTLSha_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MLYTLSha/MLYTLSha_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"eventstory_zuohe_09a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CLMan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "CLMan/CLMan_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
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
						"eventstory_zuohe_09a_14"
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
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "MLYTLSha_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
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
						"eventstory_zuohe_09a_15"
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
						"eventstory_zuohe_09a_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YYing_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -400,
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
			actor = __getnode__(_root, "SYAi_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -370,
						refpt = {
							x = 0.8,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "GYCZi_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "GYCZi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "GYCZi/GYCZi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YYing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YYing/YYing_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SYAi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SYAi/SYAi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "YYing_speak"),
			args = function (_ctx)
				return {
					zorder = 17
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YYing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SYAi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "GYCZi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan_speak"),
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
					name = "dialog_speak_name_233",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YYing_speak"
					},
					content = {
						"eventstory_zuohe_09a_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BBLMa_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -450,
						refpt = {
							x = 0.45,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "YYing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "SYAi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "GYCZi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"eventstory_zuohe_09a_18"
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
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -368,
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
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -295,
							refpt = {
								x = 0.225,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -510,
							refpt = {
								x = 0.75,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CLMan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "CLMan/CLMan_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_zuohe_09a_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang_speak"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"eventstory_zuohe_09a_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YYing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SYAi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "GYCZi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SYAi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SYAi/SYAi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_234",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SYAi_speak"
					},
					content = {
						"eventstory_zuohe_09a_21"
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
					name = "dialog_speak_name_235",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GYCZi_speak"
					},
					content = {
						"eventstory_zuohe_09a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "YYing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "SYAi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "GYCZi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"eventstory_zuohe_09a_23"
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
			action = "fadeOut",
			actor = __getnode__(_root, "BBLMa_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Anna_Concert")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Zuohe_2"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SYAi_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_234",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SYAi_speak"
					},
					content = {
						"eventstory_zuohe_09a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "GYCZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_235",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GYCZi_speak"
					},
					content = {
						"eventstory_zuohe_09a_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "YYing_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_233",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YYing_speak"
					},
					content = {
						"eventstory_zuohe_09a_26"
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
					name = "dialog_speak_name_234",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SYAi_speak"
					},
					content = {
						"eventstory_zuohe_09a_27"
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
					name = "dialog_speak_name_233",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YYing_speak"
					},
					content = {
						"eventstory_zuohe_09a_28"
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
					name = "dialog_speak_name_236",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YYing_speak",
						"SYAi_speak",
						"GYCZi_speak"
					},
					content = {
						"eventstory_zuohe_09a_29"
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
			actor = __getnode__(_root, "Mus_Zuohe_1"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		})
	})
end

local function eventstory_zuohe_09a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_zuohe_09a",
					scene = scene_eventstory_zuohe_09a
				}
			end
		})
	})
end

stories.eventstory_zuohe_09a = eventstory_zuohe_09a

return _M
