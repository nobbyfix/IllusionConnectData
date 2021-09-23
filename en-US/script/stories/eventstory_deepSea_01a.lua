local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_deepSea_01a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_deepSea_01a = {
	actions = {}
}
scenes.scene_eventstory_deepSea_01a = scene_eventstory_deepSea_01a

function scene_eventstory_deepSea_01a:stage(args)
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
						name = "bg_di",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_deepsea_6.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg_di",
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
						name = "bg_fengpinglangjing",
						pathType = "SCENE",
						type = "Image",
						image = "bg_zhujiemianbeijingtu.jpg",
						layoutMode = 1,
						zorder = 3,
						id = "bg_fengpinglangjing",
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
						name = "bg_chuhai",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_13_2.jpg",
						layoutMode = 1,
						zorder = 4,
						id = "bg_chuhai",
						scale = 2,
						anchorPoint = {
							x = 0.5,
							y = 0.5
						},
						position = {
							refpt = {
								x = 0.67,
								y = 0.7
							}
						}
					},
					{
						resType = 0,
						name = "bg_kezongyingzi",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_deepsea_0.jpg",
						layoutMode = 1,
						zorder = 5,
						id = "bg_kezongyingzi",
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
						name = "bg_xinwen",
						pathType = "SCENE",
						type = "Image",
						image = "scene_story_deepsea_1.jpg",
						layoutMode = 1,
						zorder = 6,
						id = "bg_xinwen",
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
				resType = 0,
				name = "bg_zhedang",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 1000,
				id = "bg_zhedang",
				scale = 1,
				anchorPoint = {
					x = 0.5,
					y = 0
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0
					}
				}
			},
			{
				resType = 0,
				name = "bg_vlog",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 1000,
				id = "bg_vlog",
				scale = 1,
				anchorPoint = {
					x = 0.5,
					y = 1
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.5
					}
				}
			},
			{
				id = "Mus_lizhi",
				fileName = "Mus_Story_DeepSea_Ballad",
				type = "Music"
			},
			{
				id = "Mus_vlog",
				fileName = "Mus_Story_Mystery",
				type = "Music"
			},
			{
				id = "Mus_hunluan",
				fileName = "Mus_Story_DeepSea_Main",
				type = "Music"
			},
			{
				id = "yin_duanlu",
				fileName = "Se_Story_No_Signal",
				type = "Sound"
			},
			{
				id = "yin_piantou",
				fileName = "Se_Story_Hit_Anna_Dizz",
				type = "Sound"
			},
			{
				id = "yin_fenglang",
				fileName = "Se_Story_Surf_Storm",
				type = "Sound"
			},
			{
				id = "yin_huhuan",
				fileName = "Se_Story_Whale",
				type = "Sound"
			},
			{
				id = "yin_shandian1",
				fileName = "Se_Skill_Explode_3",
				type = "Sound"
			},
			{
				id = "yin_shandian2",
				fileName = "Se_Skill_Explode_6",
				type = "Sound"
			},
			{
				id = "yin_kuaimen",
				fileName = "Se_Story_Shutter",
				type = "Sound"
			},
			{
				id = "yin_shouji",
				fileName = "Mus_Anna_Song",
				type = "Sound"
			},
			{
				id = "xiao_dianhua",
				layoutMode = 1,
				visible = false,
				type = "MessageNode",
				scale = 0.85,
				zorder = 10000,
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.6
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_deepSea_01a.actions.start_eventstory_deepSea_01a(_root, args)
	return sequential({
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "hideButton")
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_deepSea_01a_1",
						"eventstory_deepSea_01a_2",
						"eventstory_deepSea_01a_3",
						"eventstory_deepSea_01a_4"
					},
					durations = {
						0.07,
						0.07,
						0.07,
						0.07
					},
					waitTimes = {
						1,
						1,
						1,
						1.2
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_deepSea_01a_5",
						"eventstory_deepSea_01a_6",
						"eventstory_deepSea_01a_7",
						"eventstory_deepSea_01a_8"
					},
					durations = {
						0.07,
						0.07,
						0.07,
						0.07
					},
					waitTimes = {
						1,
						1,
						1,
						1.2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg_zhedang")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_chuhai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_di"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_hunluan"),
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
					bgImage = "jq_bg.jpg",
					printAudioOff = true,
					center = 2,
					bgShow = true,
					content = {
						"eventstory_deepSea_01a_9",
						"eventstory_deepSea_01a_10"
					},
					durations = {
						0.07,
						0.07
					},
					waitTimes = {
						1,
						1.2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "deepSea_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_01a_11"
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
					name = "deepSea_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_01a_12"
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
					name = "deepSea_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_01a_13"
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
					name = "deepSea_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_01a_14"
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
					name = "deepSea_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_01a_15"
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
					name = "deepSea_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_01a_16"
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_fenglang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_01a_17"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_chuhai"),
				args = function (_ctx)
					return {
						duration = 3,
						position = {
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_chuhai"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 3
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_01a_18"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.8
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_huhuan"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_huhuan")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_fenglang")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_kezongyingzi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_shandian1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "updateColor",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						color = {
							255,
							255,
							255,
							255
						}
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_shandian1")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_shandian1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_shandian1")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_shandian1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_kezongyingzi"),
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
					duration = 0.1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_shandian1")
		}),
		act({
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						0,
						0,
						0,
						255
					}
				}
			end
		}),
		concurrent({
			act({
				action = "stop",
				actor = __getnode__(_root, "Mus_hunluan")
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_chuhai"),
				args = function (_ctx)
					return {
						duration = 0.8
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "newsNode"),
			args = function (_ctx)
				return {
					city = "News_deepSea_Fitz01",
					img = "scene_story_deepsea_1.jpg",
					time = "10:30",
					title = "News_deepSea_Fitz02",
					content = {
						"eventstory_deepSea_01a_19",
						"eventstory_deepSea_01a_20",
						"eventstory_deepSea_01a_21",
						"eventstory_deepSea_01a_22",
						"eventstory_deepSea_01a_23"
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "newsNode")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_fengpinglangjing"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_deepSea_01a_24"
					},
					durations = {
						0.04
					},
					waitTimes = {
						2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.5,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_vlog"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_FLBDSi",
						id = "ahui",
						rotationX = 0,
						scale = 0.75,
						zorder = 100,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 1.36,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ahui_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ahui/face_ahui_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ahui_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 49,
									y = 921
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_vlog"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.36,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_zhedang"),
				args = function (_ctx)
					return {
						duration = 1.2,
						position = {
							refpt = {
								x = 0.5,
								y = 1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_vlog"),
				args = function (_ctx)
					return {
						duration = 1.2,
						position = {
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.2
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ahui"),
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
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.44,
								y = 0
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						scale = 1.15,
						duration = 0.45
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.45,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.54,
								y = -0.5
							}
						}
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.45
				}
			end
		}),
		act({
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						255,
						255,
						255,
						255
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ahui_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ahui/face_ahui_5.png",
					pathType = "STORY_FACE"
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_kuaimen"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						scale = 0.75,
						duration = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.46,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgImage = "bg_yhkin_bg.jpg",
					printAudioOff = true,
					center = 1,
					bgShow = true,
					content = {
						"eventstory_deepSea_01a_25",
						"eventstory_deepSea_01a_26"
					},
					durations = {
						0.02,
						0.02
					},
					waitTimes = {
						0.05,
						1.2
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ahui_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ahui/face_ahui_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_kuaimen")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_lizhi"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		act({
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						0,
						0,
						0,
						255
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_01a_27"
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
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_01a_28"
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
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						scale = 1.15,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.46,
								y = -0.56
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_29"
						},
						durations = {
							0.03
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
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_01a_30"
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
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						scale = 0.75,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.46,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_31"
						},
						durations = {
							0.03
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
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_01a_32"
					},
					durations = {
						0.01
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_01a_33"
					},
					durations = {
						0.01
					}
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						scale = 1.15,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.46,
								y = -0.56
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_34"
						},
						durations = {
							0.04
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						scale = 0.75,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.46,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_35"
						},
						durations = {
							0.01
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ahui_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ahui/face_ahui_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_01a_36"
					},
					durations = {
						0.01
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ahui"),
			args = function (_ctx)
				return {
					duration = 0
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
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "xiao_dianhua"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing4",
						modelScale = 1.1,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.5,
								y = 0.6
							}
						},
						modelOffset = {
							x = 50,
							y = 0
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_shouji"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_6.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_shouji")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_dianhua")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "ahui"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
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
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_01a_37"
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
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "xiao_dianhua"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing4",
						modelScale = 1.1,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.25,
								y = 0.6
							}
						},
						modelOffset = {
							x = 50,
							y = 0
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.71,
								y = 0
							}
						}
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_38"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_01a_39"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_4.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_01a_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_01a_41"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "xiao_dianhua"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 3
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_1.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_01a_42"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_01a_43"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "xiao_dianhua"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 3
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_6.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_01a_44"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_dianhua")
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_45"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_2.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.46,
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
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_46"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_47"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_huhuan"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_6.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_huhuan")
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_48"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_49"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_50"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ahui"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = -0.4,
							y = 0
						}
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ahui_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ahui/face_ahui_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			action = "moveTo",
			actor = __getnode__(_root, "ahui"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 1.4,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			action = "moveTo",
			actor = __getnode__(_root, "ahui"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.46,
							y = 0
						}
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.46,
								y = -0.1
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
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_51"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ahui"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.46,
									y = 0.2
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ahui"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.46,
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
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_52"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ahui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ahui/face_ahui_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ahui"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.21,
									y = 0
								}
							}
						}
					end
				}),
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "ahui"),
						args = function (_ctx)
							return {
								duration = 0,
								position = {
									x = 0,
									y = -300,
									refpt = {
										x = 0.29,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "orbitCamera",
						actor = __getnode__(_root, "ahui"),
						args = function (_ctx)
							return {
								angleZ = 0,
								time = 0,
								deltaAngleZ = 180
							}
						end
					})
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ahui"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.79,
									y = 0
								}
							}
						}
					end
				}),
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "ahui"),
						args = function (_ctx)
							return {
								duration = 0,
								position = {
									x = 0,
									y = -300,
									refpt = {
										x = 0.71,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "orbitCamera",
						actor = __getnode__(_root, "ahui"),
						args = function (_ctx)
							return {
								angleZ = 0,
								time = 0,
								deltaAngleZ = 0
							}
						end
					})
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ahui"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.46,
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
						name = "deepSea_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ahui"
						},
						content = {
							"eventstory_deepSea_01a_53"
						},
						durations = {
							0.03
						}
					}
				end
			})
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
					duration = 0.4
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_lizhi")
		})
	})
end

local function eventstory_deepSea_01a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_deepSea_01a",
					scene = scene_eventstory_deepSea_01a
				}
			end
		})
	})
end

stories.eventstory_deepSea_01a = eventstory_deepSea_01a

return _M
