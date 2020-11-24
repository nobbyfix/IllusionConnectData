local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_zuohe_04a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_zuohe_04a = {
	actions = {}
}
scenes.scene_eventstory_zuohe_04a = scene_eventstory_zuohe_04a

function scene_eventstory_zuohe_04a:stage(args)
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
			},
			{
				id = "Mus_Story_Common_2",
				fileName = "Mus_Story_Common_2",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_zuohe_04a.actions.start_eventstory_zuohe_04a(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg1")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_baitian"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
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
					zorder = 12,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YYing_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YYing/YYing_face_1.png",
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
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_SYAi",
					id = "SYAi_speak",
					rotationX = 0,
					scale = 1.1,
					zorder = 8,
					position = {
						x = 0,
						y = -370,
						refpt = {
							x = 0.8,
							y = -0.05
						}
					},
					children = {
						{
							resType = 0,
							name = "SYAi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SYAi/SYAi_face_1.png",
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
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_GYCZi",
					id = "GYCZi_speak",
					rotationX = 0,
					scale = 1,
					zorder = 4,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "GYCZi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "GYCZi/GYCZi_face_4.png",
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
			}),
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
			}),
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
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Common_2"),
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
						"eventstory_zuohe_04a_1"
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
						"eventstory_zuohe_04a_2"
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
						"eventstory_zuohe_04a_3"
					},
					durations = {
						0.03
					}
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
						"eventstory_zuohe_04a_4"
					},
					durations = {
						0.03
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
					image = "GYCZi/GYCZi_face_5.png",
					pathType = "STORY_FACE"
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
						"eventstory_zuohe_04a_5"
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
						"eventstory_zuohe_04a_6"
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
				actor = __getnode__(_root, "GYCZi_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "SYAi_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "YYing_speak"),
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_zuohe_04a_7"
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
					modelId = "Model_Story_DNTLuo_YDXGuang",
					id = "DNTLuo_speak",
					rotationX = 0,
					scale = 1.15,
					zorder = 7,
					position = {
						x = 0,
						y = -540,
						refpt = {
							x = 0.75,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "DNTLuo_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "DNTLuo_YDXGuang/DNTLuo_YDXGuang_face_1.png",
							scaleX = 1.04,
							scaleY = 1.04,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "DNTLuo_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 31,
								y = 800
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "DNTLuo_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DNTLuo_speak"),
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"eventstory_zuohe_04a_8"
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
					modelId = "Model_Story_MKLJLuo_HBXLv",
					id = "MKLJLuo_speak",
					rotationX = 0,
					scale = 0.95,
					zorder = 6,
					position = {
						x = 0,
						y = -325,
						refpt = {
							x = 0.2,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "MKLJLuo_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "MKLJLuo_HBXLv/MKLJLuo_HBXLv_face_1.png",
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
								x = 66,
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"eventstory_zuohe_04a_9"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"eventstory_zuohe_04a_10"
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
					modelId = "Model_Story_SDTZi_DYMEr",
					id = "SDTZi_speak",
					rotationX = 0,
					scale = 1,
					zorder = 7.5,
					position = {
						x = 0,
						y = -420,
						refpt = {
							x = 0.425,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SDTZi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SDTZi_DYMEr/SDTZi_DYMEr_face_4.png",
							scaleX = 1.01,
							scaleY = 1.01,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SDTZi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 56.5,
								y = 749
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SDTZi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SDTZi_speak"),
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
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak"
					},
					content = {
						"eventstory_zuohe_04a_11"
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
					modelId = "Model_Story_LFEr_LHJPai",
					id = "LFEr_speak",
					rotationX = 0,
					scale = 1.15,
					zorder = 5,
					position = {
						x = 0,
						y = -470,
						refpt = {
							x = 0.275,
							y = -0.1
						}
					},
					children = {
						{
							resType = 0,
							name = "LFEr_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "LFEr_LHJPai/LFEr_LHJPai_face_5.png",
							scaleX = 1.14,
							scaleY = 1.14,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "LFEr_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -44,
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
				actor = __getnode__(_root, "LFEr_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LFEr_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "MKLJLuo_speak"),
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"eventstory_zuohe_04a_12"
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
					modelId = "Model_Story_DFQi_MNGJi",
					id = "DFQi_speak",
					rotationX = 0,
					scale = 0.95,
					zorder = 16,
					position = {
						x = 0,
						y = -265,
						refpt = {
							x = 0.475,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "DFQi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "DFQi_MNGJi/DFQi_MNGJi_face_3.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "DFQi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 48,
								y = 638
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "DFQi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DFQi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "SDTZi_speak"),
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
					name = "dialog_speak_name_53",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DFQi_speak"
					},
					content = {
						"eventstory_zuohe_04a_13"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"eventstory_zuohe_04a_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YYing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YYing/YYing_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr_LHJPai/LFEr_LHJPai_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DFQi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
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
						"eventstory_zuohe_04a_15"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"eventstory_zuohe_04a_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YYing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YYing/YYing_face_5.png",
					pathType = "STORY_FACE"
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
						"eventstory_zuohe_04a_17"
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
					image = "SYAi/SYAi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
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
				action = "fadeOut",
				actor = __getnode__(_root, "DNTLuo_speak"),
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
						"eventstory_zuohe_04a_18"
					},
					durations = {
						0.03
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
					image = "GYCZi/GYCZi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
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
				actor = __getnode__(_root, "LFEr_speak"),
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
						"eventstory_zuohe_04a_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YYing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YYing/YYing_face_5.png",
					pathType = "STORY_FACE"
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
						"eventstory_zuohe_04a_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo_YDXGuang/DNTLuo_YDXGuang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
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
				action = "fadeIn",
				actor = __getnode__(_root, "DNTLuo_speak"),
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"eventstory_zuohe_04a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YYing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YYing/YYing_face_1.png",
					pathType = "STORY_FACE"
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
						"eventstory_zuohe_04a_22"
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
				actor = __getnode__(_root, "DNTLuo_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "GYCZi_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YYing_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = 0.65,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "DFQi_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -265,
						refpt = {
							x = 0.35,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DFQi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DFQi_MNGJi/DFQi_MNGJi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DFQi_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LFEr_speak"),
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
					name = "dialog_speak_name_53",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DFQi_speak"
					},
					content = {
						"eventstory_zuohe_04a_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SDTZi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SDTZi_DYMEr/SDTZi_DYMEr_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SDTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -420,
						refpt = {
							x = 0.125,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SDTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak"
					},
					content = {
						"eventstory_zuohe_04a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YYing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YYing/YYing_face_5.png",
					pathType = "STORY_FACE"
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
						"eventstory_zuohe_04a_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "DNTLuo_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -540,
						refpt = {
							x = 0.35,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo_YDXGuang/DNTLuo_YDXGuang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "DNTLuo_speak"),
			args = function (_ctx)
				return {
					zorder = 8
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DNTLuo_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DFQi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DFQi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DFQi_speak"),
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"eventstory_zuohe_04a_26"
					},
					durations = {
						0.03
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
							x = 0.85,
							y = 0.05
						}
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
					image = "SYAi/SYAi_face_3.png",
					pathType = "STORY_FACE"
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
						"eventstory_zuohe_04a_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LFEr_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -470,
						refpt = {
							x = 0.225,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LFEr_LHJPai/LFEr_LHJPai_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LFEr_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "SDTZi_speak"),
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
					name = "dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LFEr_speak"
					},
					content = {
						"eventstory_zuohe_04a_28"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"eventstory_zuohe_04a_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YYing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YYing/YYing_face_3.png",
					pathType = "STORY_FACE"
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
						"eventstory_zuohe_04a_30"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"eventstory_zuohe_04a_31"
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

local function eventstory_zuohe_04a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_zuohe_04a",
					scene = scene_eventstory_zuohe_04a
				}
			end
		})
	})
end

stories.eventstory_zuohe_04a = eventstory_zuohe_04a

return _M
