local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_deepSea_07a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_deepSea_07a = {
	actions = {}
}
scenes.scene_eventstory_deepSea_07a = scene_eventstory_deepSea_07a

function scene_eventstory_deepSea_07a:stage(args)
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
						pathType = "STORY_ROOT",
						type = "Image",
						image = "hm.png",
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
						name = "bg_lalaiye",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_deepsea_9.jpg",
						layoutMode = 1,
						zorder = 4,
						id = "bg_lalaiye",
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
						name = "bg_suo",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_deepsea_2.jpg",
						scaleX = 1,
						zorder = 4,
						layoutMode = 1,
						id = "bg_suo",
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
						name = "bg_fengping",
						pathType = "SCENE",
						type = "Image",
						image = "scene_story_deepsea_1.jpg",
						scaleX = -1,
						zorder = 5,
						layoutMode = 1,
						id = "bg_fengping",
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
						name = "bg_haishou",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_deepsea_1.jpg",
						layoutMode = 1,
						zorder = 5,
						id = "bg_haishou",
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
						name = "bg_fanchuan",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_13_2.jpg",
						layoutMode = 1,
						zorder = 6,
						id = "bg_fanchuan",
						scale = 1,
						anchorPoint = {
							x = 0.5,
							y = 1
						},
						position = {
							refpt = {
								x = 0.5,
								y = 1
							}
						}
					}
				}
			},
			{
				resType = 0,
				name = "bg_yuzhao2",
				pathType = "SCENE",
				type = "Image",
				image = "scene_main_deepsea_9.jpg",
				layoutMode = 1,
				zorder = 1000,
				id = "bg_yuzhao2",
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
				name = "bg_yuzhao1",
				pathType = "SCENE",
				type = "Image",
				image = "scene_main_deepsea_0.jpg",
				layoutMode = 1,
				zorder = 900,
				id = "bg_yuzhao1",
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
				name = "bg_huiyi",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "bm.png",
				layoutMode = 1,
				zorder = 15,
				id = "bg_huiyi",
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
				id = "Mus_zhandou",
				fileName = "Mus_Battle_DeepSea_Ship",
				type = "Music"
			},
			{
				id = "yin_shuidi",
				fileName = "Se_Story_Water_Drop",
				type = "Sound"
			},
			{
				id = "yin_fenglang",
				fileName = "Se_Story_Surf_Storm",
				type = "Sound"
			},
			{
				id = "yin_mingjiao",
				fileName = "Se_Story_Whale",
				type = "Sound"
			},
			{
				id = "yin_dagun",
				fileName = "Se_Story_Whale",
				type = "Sound"
			},
			{
				id = "yin_jiaobu",
				fileName = "Se_Story_Marble",
				type = "Sound"
			},
			{
				id = "yin_yangguang",
				fileName = "Se_Amb_Seagull",
				type = "Sound"
			},
			{
				id = "yin_kuaimen",
				fileName = "Se_Story_Shutter",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
				visible = false,
				id = "xiao_mofa",
				scale = 1,
				actionName = "mofa_gongji_juqing",
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
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 12000,
				videoName = "story_huiyi",
				id = "xiao_huiyi",
				scale = 1.05,
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

function scene_eventstory_deepSea_07a.actions.start_eventstory_deepSea_07a(_root, args)
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
			action = "activateNode",
			actor = __getnode__(_root, "bg_fengping")
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
						"eventstory_deepSea_07a_1",
						"eventstory_deepSea_07a_2"
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_LFKLFTe_story",
						id = "snya",
						rotationX = 0,
						scale = 0.7,
						zorder = 120,
						position = {
							x = 0,
							y = -170,
							refpt = {
								x = 0.77,
								y = -0.2
							}
						},
						children = {
							{
								resType = 0,
								name = "snya_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "snya/face_snya_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "snya_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -58.5,
									y = 945
								}
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "snya_face"),
				args = function (_ctx)
					return {
						deltaAngle = 4.5,
						duration = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "snya"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "snya"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_ALPo",
						id = "zuitianshi",
						rotationX = 0,
						scale = 0.68,
						zorder = 100,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.8,
								y = 0.2
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "zuitianshi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_GLFo_S",
						id = "swfte_s",
						rotationX = 0,
						scale = 0.63,
						zorder = 130,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.43,
								y = -0.1
							}
						},
						children = {
							{
								resType = 0,
								name = "swfte_s_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "swfte_s/face_swfte_s_7.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "swfte_s_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 147,
									y = 887.1
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "swfte_s"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "swfte_s"),
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
		concurrent({
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
				actor = __getnode__(_root, "swfte_s_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "swfte_s/face_swfte_s_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"swfte_s"
						},
						content = {
							"eventstory_deepSea_07a_3"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "swfte_s"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.43,
									y = 0.2
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "swfte_s"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.43,
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
						name = "deepSea_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_07a_4"
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
				actor = __getnode__(_root, "swfte_s_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "swfte_s/face_swfte_s_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"swfte_s"
						},
						content = {
							"eventstory_deepSea_07a_5"
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
				actor = __getnode__(_root, "swfte_s"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.13,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "snya"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_07a_6"
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
				actor = __getnode__(_root, "swfte_s_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "swfte_s/face_swfte_s_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"swfte_s"
						},
						content = {
							"eventstory_deepSea_07a_7"
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
					name = "deepSea_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"snya"
					},
					content = {
						"eventstory_deepSea_07a_8"
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
					name = "deepSea_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_07a_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "swfte_s_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "swfte_s/face_swfte_s_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"swfte_s"
						},
						content = {
							"eventstory_deepSea_07a_10"
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
				actor = __getnode__(_root, "swfte_s_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "swfte_s/face_swfte_s_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"swfte_s"
						},
						content = {
							"eventstory_deepSea_07a_11"
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
				actor = __getnode__(_root, "swfte_s"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 1.3,
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
						name = "deepSea_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"snya"
						},
						content = {
							"eventstory_deepSea_07a_12"
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
			action = "fadeOut",
			actor = __getnode__(_root, "snya"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "swfte_s"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "swfte_s"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -250,
						refpt = {
							x = -0.3,
							y = 0
						}
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.15
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "swfte_s"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "swfte_s"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.13,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "zuitianshi"),
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
				action = "changeTexture",
				actor = __getnode__(_root, "swfte_s_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "swfte_s/face_swfte_s_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"swfte_s"
						},
						content = {
							"eventstory_deepSea_07a_13"
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
			action = "fadeOut",
			actor = __getnode__(_root, "swfte_s"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "zuitianshi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "snya"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -170,
						refpt = {
							x = 0.47,
							y = 0
						}
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.15
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "snya"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.15
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
						"snya"
					},
					content = {
						"eventstory_deepSea_07a_14"
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
					name = "deepSea_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_07a_15"
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
			action = "changeTexture",
			actor = __getnode__(_root, "swfte_s_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "swfte_s/face_swfte_s_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "snya_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "snya/face_snya_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "snya"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.15
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "swfte_s"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "zuitianshi"),
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
					duration = 0.15
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"swfte_s"
						},
						content = {
							"eventstory_deepSea_07a_16"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_fenglang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			})
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "swfte_s"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = -0.4,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "zuitianshi"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 1.4,
									y = 0.4
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
						name = "deepSea_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_07a_17"
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
			actor = __getnode__(_root, "snya"),
			args = function (_ctx)
				return {
					duration = 0.6
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
						"snya"
					},
					content = {
						"eventstory_deepSea_07a_18"
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
			action = "fadeOut",
			actor = __getnode__(_root, "snya"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_fenglang")
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Enemy_SKong",
						id = "chuansong",
						rotationX = 0,
						scale = 0.5,
						zorder = 10000,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "chuansong"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "chuansong"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_fengping"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_lalaiye"),
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
					duration = 0.8
				}
			end
		}),
		concurrent({
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
				action = "scaleTo",
				actor = __getnode__(_root, "chuansong"),
				args = function (_ctx)
					return {
						scale = 3,
						duration = 2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "chuansong"),
				args = function (_ctx)
					return {
						duration = 2,
						position = {
							x = 0,
							y = -2747.5,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "chuansong"),
				args = function (_ctx)
					return {
						duration = 2
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0.4
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
			action = "play",
			actor = __getnode__(_root, "Mus_lizhi"),
			args = function (_ctx)
				return {
					isLoop = true
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
								x = -0.76,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ahui_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ahui/face_ahui_6.png",
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_ALPo",
						id = "ALPo",
						rotationX = 0,
						scale = 0.63,
						zorder = 90,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = -0.3,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ALPo_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ALPo/ALPo_face_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ALPo_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 7,
									y = 1020
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.75,
								y = 0
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
						duration = 0.6,
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
			})
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
					name = "deepSea_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_deepSea_07a_19"
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
					name = "deepSea_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo"
					},
					content = {
						"eventstory_deepSea_07a_20"
					},
					durations = {
						0.03
					}
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
							"eventstory_deepSea_07a_21"
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
						name = "deepSea_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_07a_22"
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
					actor = __getnode__(_root, "ALPo"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.8,
									y = 0
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
							duration = 0.2,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.34,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "ALPo"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "ahui"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				})
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
					duration = 0.15
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.15
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.7,
								y = 0
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
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.24,
								y = 0
							}
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
					duration = 0.15
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.35
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.75,
								y = 0
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
								x = 0.29,
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
					duration = 0.1
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
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_shuidi"),
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
							"eventstory_deepSea_07a_23"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "ahui"),
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
					name = "deepSea_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_07a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_shuidi")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ALPo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALPo/ALPo_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALPo"
						},
						content = {
							"eventstory_deepSea_07a_25"
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
				action = "moveTo",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.75,
								y = 0.1
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
						name = "deepSea_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_07a_26"
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
				action = "play",
				actor = __getnode__(_root, "yin_mingjiao"),
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
						name = "deepSea_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"deepSea_dialog_speak_name_2"
						},
						content = {
							"eventstory_deepSea_07a_27"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_mingjiao")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.75,
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
							"eventstory_deepSea_07a_28"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ALPo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALPo/ALPo_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALPo"
						},
						content = {
							"eventstory_deepSea_07a_29"
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
							"eventstory_deepSea_07a_30"
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
							"eventstory_deepSea_07a_31"
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
					name = "deepSea_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo"
					},
					content = {
						"eventstory_deepSea_07a_32"
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
					name = "deepSea_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo"
					},
					content = {
						"eventstory_deepSea_07a_33"
					},
					durations = {
						0.03
					}
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
							"eventstory_deepSea_07a_34"
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
						name = "deepSea_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALPo"
						},
						content = {
							"eventstory_deepSea_07a_35"
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
				action = "moveTo",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.34,
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
							"eventstory_deepSea_07a_36"
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
							"eventstory_deepSea_07a_37"
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
						"eventstory_deepSea_07a_38"
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
						"eventstory_deepSea_07a_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ALPo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALPo/ALPo_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALPo"
						},
						content = {
							"eventstory_deepSea_07a_40"
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
							"eventstory_deepSea_07a_41"
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
						"eventstory_deepSea_07a_42"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ALPo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALPo/ALPo_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALPo"
						},
						content = {
							"eventstory_deepSea_07a_43"
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
							"eventstory_deepSea_07a_44"
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
						"eventstory_deepSea_07a_45"
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
						"eventstory_deepSea_07a_46"
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
						"eventstory_deepSea_07a_47"
					},
					durations = {
						0.03
					}
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
							"eventstory_deepSea_07a_48"
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
					name = "deepSea_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo"
					},
					content = {
						"eventstory_deepSea_07a_49"
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
									x = 0.34,
									y = 0.07
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
									x = 0.34,
									y = 0
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
									x = 0.34,
									y = 0.07
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
									x = 0.34,
									y = 0
								}
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
							"eventstory_deepSea_07a_50"
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
			action = "orbitCamera",
			actor = __getnode__(_root, "ALPo"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
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
					duration = 0.2
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
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALPo"),
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "bg_lalaiye"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "scene_story_deepsea_3.jpg",
					pathType = "SCENE"
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
			action = "fadeOut",
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "deepSea_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"deepSea_dialog_speak_name_2"
					},
					content = {
						"eventstory_deepSea_07a_51"
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
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALPo"),
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
				action = "changeTexture",
				actor = __getnode__(_root, "ALPo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALPo/ALPo_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALPo"
						},
						content = {
							"eventstory_deepSea_07a_52"
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
				actor = __getnode__(_root, "ALPo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ALPo/ALPo_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ALPo"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "deepSea_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALPo"
						},
						content = {
							"eventstory_deepSea_07a_53"
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
						image = "ahui/face_ahui_6.png",
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
						"eventstory_deepSea_07a_54"
					},
					durations = {
						0.03
					}
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
						name = "deepSea_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALPo"
						},
						content = {
							"eventstory_deepSea_07a_55"
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
						name = "deepSea_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALPo"
						},
						content = {
							"eventstory_deepSea_07a_56"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "fadeIn",
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
					duration = 0.8
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ALPo"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
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
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_hunluan")
		})
	})
end

local function eventstory_deepSea_07a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_deepSea_07a",
					scene = scene_eventstory_deepSea_07a
				}
			end
		})
	})
end

stories.eventstory_deepSea_07a = eventstory_deepSea_07a

return _M
