local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_sayounara_04a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_sayounara_04a = {
	actions = {}
}
scenes.scene_eventstory_sayounara_04a = scene_eventstory_sayounara_04a

function scene_eventstory_sayounara_04a:stage(args)
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
						name = "bg_zhanchang",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_fireworks_1.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_zhanchang",
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
						name = "bg_shiji",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_7_4.jpg",
						layoutMode = 1,
						zorder = 25,
						id = "bg_shiji",
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
						name = "bg_haitan",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_fireworks.jpg",
						layoutMode = 1,
						zorder = 35,
						id = "bg_haitan",
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
					},
					{
						resType = 0,
						name = "yan_bankai",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "story_eye_2.png",
						layoutMode = 1,
						zorder = 100,
						id = "yan_bankai",
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
						name = "yan_weikai",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "story_eye_3.png",
						layoutMode = 1,
						zorder = 110,
						id = "yan_weikai",
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
						name = "bg_huahuo",
						pathType = "SCENE",
						type = "Image",
						image = "scene_cg_fireworks_1.jpg",
						layoutMode = 1,
						zorder = 33,
						id = "bg_huahuo",
						scale = 1.8,
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
				id = "Mus_zhandou",
				fileName = "Mus_Story_Yehuo_Determine",
				type = "Music"
			},
			{
				id = "Mus_shiji",
				fileName = "Mus_Story_Fireworks_Main",
				type = "Music"
			},
			{
				id = "Mus_huahuo",
				fileName = "Mus_Story_Fireworks_2",
				type = "Music"
			},
			{
				id = "Mus_zhansi",
				fileName = "Mus_Story_Fireworks_2",
				type = "Music"
			},
			{
				id = "yin_juhou",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				id = "yin_yanhua",
				fileName = "Se_Skill_Firework",
				type = "Sound"
			},
			{
				id = "yin_huahuo",
				fileName = "Se_Story_Fireworks",
				type = "Sound"
			},
			{
				id = "yin_jian",
				fileName = "Se_Story_Impact_2",
				type = "Sound"
			},
			{
				resType = 0,
				name = "bg_zhedang",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 2000,
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
				id = "yin_zhuangfei",
				fileName = "Se_Skill_Coffin_Hits",
				type = "Sound"
			},
			{
				id = "yin_jian",
				fileName = "Se_Story_Impact_2",
				type = "Sound"
			},
			{
				layoutMode = 1,
				name = "bg",
				type = "ColorBackGround",
				zorder = 200,
				id = "colorBg",
				scale = 1,
				anchorPoint = {
					x = 0,
					y = 0
				},
				position = {
					refpt = {
						x = 0,
						y = 0
					}
				},
				touchEvents = {
					moved = "evt_bg_touch_moved",
					began = "evt_bg_touch_began",
					ended = "evt_bg_touch_ended"
				},
				children = {}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1500,
				visible = false,
				id = "xiao_huiyi",
				scale = 1,
				actionName = "huiyib_juqingtexiao",
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

function scene_eventstory_sayounara_04a.actions.start_eventstory_sayounara_04a(_root, args)
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
			actor = __getnode__(_root, "bg_di")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_shiji"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_huahuo"),
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
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_sayounara_04a_1",
						"eventstory_sayounara_04a_2"
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing7",
						id = "YeYe",
						rotationX = 0,
						scale = 0.9,
						zorder = 250,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.57,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YeYe"),
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
						modelId = "Model_Story_JYing6",
						id = "NvEr",
						rotationX = 0,
						scale = 0.82,
						zorder = 250,
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
				actor = __getnode__(_root, "NvEr"),
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
						modelId = "Model_Story_JYing1",
						id = "MeiMei",
						rotationX = 0,
						scale = 1.15,
						zorder = 250,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.57,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MeiMei"),
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
						modelId = "Model_Story_JYing4",
						id = "GeGe",
						rotationX = 0,
						scale = 0.9,
						zorder = 250,
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
				actor = __getnode__(_root, "GeGe"),
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
						modelId = "Model_MYan_2",
						id = "CB_Yuan",
						rotationX = 0,
						scale = 0.6,
						zorder = 130,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Yuan_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Yuan_Arm",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Yuan"),
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
						modelId = "Model_MYan_4",
						id = "CB_Dai",
						rotationX = 0,
						scale = 0.6,
						zorder = 135,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Dai_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Dai_Arm",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 2.5,
									y = 358
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Dai"),
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
						modelId = "Model_MYan_1",
						id = "CB_Xiong",
						rotationX = 0,
						scale = 0.6,
						zorder = 125,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Xiong_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Xiong_Arm",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong"),
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
						modelId = "Model_MYan_3",
						id = "CB_Mu",
						rotationX = 0,
						scale = 0.6,
						zorder = 120,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.8,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Mu_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Mu_Arm",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -0.5,
									y = 359
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
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
						modelId = "Model_SP_WTXXuan_stand",
						id = "sp_mcqdai",
						rotationX = 0,
						scale = 0.65,
						zorder = 135,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.48,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "sp_mcqdai_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/mcqdai_face_7.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "sp_mcqdai_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -55,
									y = 845
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_mcqdai"),
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
						modelId = "Model_SP_SSQXin_single",
						id = "sp_xmlhui",
						rotationX = 0,
						scale = 0.65,
						zorder = 130,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.77,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "sp_xmlhui_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_xmlhui/face_sp_xmlhui_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "sp_xmlhui_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -119.5,
									y = 1236
								}
							},
							{
								resType = 0,
								name = "sp_xmlhui_biyan",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_xmlhui/face_sp_xmlhui_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1000,
								visible = false,
								id = "sp_xmlhui_biyan",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -119.5,
									y = 1236
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "NvEr"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "NvEr"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NvEr"
					},
					content = {
						"eventstory_sayounara_04a_3"
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
			actor = __getnode__(_root, "NvEr"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_04a_4"
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
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "NvEr"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"NvEr"
						},
						content = {
							"eventstory_sayounara_04a_5"
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
					name = "Sayounara_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NvEr"
					},
					content = {
						"eventstory_sayounara_04a_6"
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
			actor = __getnode__(_root, "CB_Mu"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -15,
						refpt = {
							x = 0.71,
							y = 0
						}
					}
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
			action = "changeTexture",
			actor = __getnode__(_root, "CB_Mu_Arm"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
					pathType = "STORY_FACE"
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
				action = "fadeOut",
				actor = __getnode__(_root, "NvEr"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
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
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_04a_7"
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
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "NvEr"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NvEr"
					},
					content = {
						"eventstory_sayounara_04a_8"
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
			actor = __getnode__(_root, "YeYe"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CB_Dai"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
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
			actor = __getnode__(_root, "CB_Dai_Arm"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "NvEr"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
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
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YeYe"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YeYe"
					},
					content = {
						"eventstory_sayounara_04a_9"
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
		sequential({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.75,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.75,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.75,
									y = 0
								}
							}
						}
					end
				})
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
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "YeYe"),
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
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_04a_10"
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
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YeYe"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YeYe"
					},
					content = {
						"eventstory_sayounara_04a_11"
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
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "YeYe"),
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
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_04a_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "MeiMei"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.65,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CB_Xiong_Arm"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CB_Xiong"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
						refpt = {
							x = 0.35,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "GeGe"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "GeGe"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CB_Yuan_Arm"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
						refpt = {
							x = 0.7,
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
			action = "fadeOut",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MeiMei"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MeiMei"
					},
					content = {
						"eventstory_sayounara_04a_13"
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
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "MeiMei"),
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
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "GeGe"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GeGe"
					},
					content = {
						"eventstory_sayounara_04a_14"
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
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "GeGe"),
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
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YeYe"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.07,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "NvEr"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.4,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MeiMei"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.64,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "GeGe"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.92,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "GeGe"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YeYe"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "NvEr"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MeiMei"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "GeGe"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YeYe"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.07,
									y = -0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YeYe"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.07,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "NvEr"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.4,
									y = -0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "NvEr"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.4,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "MeiMei"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.64,
									y = -0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "MeiMei"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.64,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "GeGe"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.92,
									y = -0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "GeGe"),
					args = function (_ctx)
						return {
							duration = 0.25,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.92,
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
						name = "Sayounara_dialog_speak_name_11",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YeYe",
							"NvEr",
							"MeiMei",
							"GeGe"
						},
						content = {
							"eventstory_sayounara_04a_15"
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
				action = "fadeOut",
				actor = __getnode__(_root, "YeYe"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "NvEr"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "MeiMei"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "GeGe"),
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
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_04a_16"
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_04a_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sp_xmlhui"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -340,
						refpt = {
							x = 0.97,
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_04a_18"
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
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.77,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.32,
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
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_04a_19"
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
				actor = __getnode__(_root, "sp_mcqdai"),
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.28,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_04a_20"
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
			action = "fadeOut",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sp_xmlhui"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "sp_mcqdai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/mcqdai_face_6.png",
					pathType = "STORY_FACE"
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_shiji"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_haitan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "bg_haitan"),
			args = function (_ctx)
				return {
					scale = 1.5,
					duration = 0
				}
			end
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_yanhua"),
			args = function (_ctx)
				return {
					time = 1
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
			action = "stop",
			actor = __getnode__(_root, "yin_yanhua")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_huahuo"),
				args = function (_ctx)
					return {
						time = 1
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
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_shiji"),
				args = function (_ctx)
					return {
						isLoop = true
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
			action = "scaleTo",
			actor = __getnode__(_root, "bg_haitan"),
			args = function (_ctx)
				return {
					scale = 1,
					duration = 1.5
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.5
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_04a_21"
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_04a_22"
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_04a_23"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_04a_24"
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
				action = "fadeOut",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.48,
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_04a_25"
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
			actor = __getnode__(_root, "GeGe"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "GeGe"),
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
			actor = __getnode__(_root, "MeiMei"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
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
			actor = __getnode__(_root, "YeYe"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "NvEr"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "NvEr"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NvEr"
					},
					content = {
						"eventstory_sayounara_04a_26"
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
				action = "fadeOut",
				actor = __getnode__(_root, "NvEr"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
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
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "GeGe"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GeGe"
					},
					content = {
						"eventstory_sayounara_04a_27"
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
				action = "fadeOut",
				actor = __getnode__(_root, "GeGe"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Yuan"),
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
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MeiMei"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MeiMei"
					},
					content = {
						"eventstory_sayounara_04a_28"
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
				action = "fadeOut",
				actor = __getnode__(_root, "MeiMei"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Xiong"),
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
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YeYe"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YeYe"
					},
					content = {
						"eventstory_sayounara_04a_29"
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
				action = "fadeOut",
				actor = __getnode__(_root, "YeYe"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
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
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 3
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_haitan"),
				args = function (_ctx)
					return {
						scale = 1.5,
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
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "bg_haitan"),
			args = function (_ctx)
				return {
					scale = 1,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sp_xmlhui"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -340,
						refpt = {
							x = 0.57,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_xmlhui"),
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
					duration = 0.3
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_04a_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "sp_xmlhui_biyan"),
			args = function (_ctx)
				return {
					visible = true
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_04a_31"
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
				action = "opacityTo",
				actor = __getnode__(_root, "sp_xmlhui_face"),
				args = function (_ctx)
					return {
						valend = 0,
						duration = 1
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
			actor = __getnode__(_root, "yin_huahuo")
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
			actor = __getnode__(_root, "bg_zhanchang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_haitan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_huiyi"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sp_xmlhui"),
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
						modelId = "Model_SSQXin",
						id = "SSQXin",
						rotationX = 0,
						scale = 0.66,
						zorder = 13500,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.51,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SSQXin_biyan",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SSXQian/SSXQian_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1000,
								visible = true,
								id = "SSQXin_biyan",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 28.5,
									y = 922
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "SSQXin"),
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
				actor = __getnode__(_root, "SSQXin"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SSQXin"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_zhandou"),
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
					duration = 0.005
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.005
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SSQXin"
					},
					content = {
						"eventstory_sayounara_04a_32"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
						duration = 0.4
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SSQXin"),
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SP_SSQXin",
						id = "sp_SSQXin",
						rotationX = 0,
						scale = 0.65,
						zorder = 135,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.56,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "sp_SSQXin_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_xmlhui/face_sp_xmlhui_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "sp_SSQXin_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -7,
									y = 1236
								}
							},
							{
								resType = 0,
								name = "sp_SSQXin_biyan",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_xmlhui/face_sp_xmlhui_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 100,
								visible = false,
								id = "sp_SSQXin_biyan",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -7,
									y = 1236
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_SSQXin"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_SSQXin"),
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
						"eventstory_sayounara_04a_33",
						"eventstory_sayounara_04a_34"
					},
					durations = {
						0.07,
						0.1
					},
					waitTimes = {
						1,
						1.5
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
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "sp_SSQXin_biyan"),
			args = function (_ctx)
				return {
					visible = true
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_SSQXin"
					},
					content = {
						"eventstory_sayounara_04a_35"
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
				action = "moveTo",
				actor = __getnode__(_root, "sp_SSQXin"),
				args = function (_ctx)
					return {
						duration = 0.8,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.56,
								y = -0.25
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_SSQXin"),
				args = function (_ctx)
					return {
						duration = 0.8
					}
				end
			}),
			act({
				action = "opacityTo",
				actor = __getnode__(_root, "sp_SSQXin_face"),
				args = function (_ctx)
					return {
						valend = 0,
						duration = 0.6
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_zhedang"),
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
					duration = 0.005
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.005
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_SSQXin"
					},
					content = {
						"eventstory_sayounara_04a_36"
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
		sleep({
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
					name = "Sayounara_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Sayounara_dialog_speak_name_7"
					},
					content = {
						"eventstory_sayounara_04a_37"
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
					name = "Sayounara_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Sayounara_dialog_speak_name_7"
					},
					content = {
						"eventstory_sayounara_04a_38"
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_sayounara_04a_39",
						"eventstory_sayounara_04a_40"
					},
					durations = {
						0.15,
						0.2
					},
					waitTimes = {
						1.2,
						1.5
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_huiyi")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_huahuo"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhanchang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_huahuo"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_huahuo"),
			args = function (_ctx)
				return {
					time = 1
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
						"eventstory_sayounara_04a_41",
						"eventstory_sayounara_04a_42"
					},
					durations = {
						0.1,
						0.1
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "bg_huahuo"),
			args = function (_ctx)
				return {
					scale = 1,
					duration = 2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Sayounara_dialog_speak_name_7"
					},
					content = {
						"eventstory_sayounara_04a_43"
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Sayounara_dialog_speak_name_7"
					},
					content = {
						"eventstory_sayounara_04a_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1.5
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_huahuo")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_huahuo")
		})
	})
end

local function eventstory_sayounara_04a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_sayounara_04a",
					scene = scene_eventstory_sayounara_04a
				}
			end
		})
	})
end

stories.eventstory_sayounara_04a = eventstory_sayounara_04a

return _M
