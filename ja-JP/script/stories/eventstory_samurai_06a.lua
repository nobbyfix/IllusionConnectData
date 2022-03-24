local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_samurai_06a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_samurai_06a = {
	actions = {}
}
scenes.scene_eventstory_samurai_06a = scene_eventstory_samurai_06a

function scene_eventstory_samurai_06a:stage(args)
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
				zorder = 1,
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
						name = "bg_daochang",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_samurai_2.jpg",
						layoutMode = 1,
						zorder = 100,
						id = "bg_daochang",
						scale = 1.25,
						anchorPoint = {
							x = 0.5,
							y = 0.5
						},
						position = {
							refpt = {
								x = 0.65,
								y = 0.4
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
						zorder = 110,
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
						resType = 0,
						name = "bg_podao",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_samurai.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_podao",
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
								id = "bgEx_podao",
								layoutMode = 1,
								type = "MovieClip",
								scale = 1,
								actionName = "main_wujinxiarukou",
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
					}
				}
			},
			{
				id = "Mus_daochang",
				fileName = "Mus_Active_Daochang",
				type = "Music"
			},
			{
				id = "Mus_wujinxia",
				fileName = "Mus_Story_Samurai_Main_Loop",
				type = "Music"
			},
			{
				id = "Mus_zhandou",
				fileName = "Mus_Battle_Samurai",
				type = "Music"
			},
			{
				id = "yin_azhe",
				fileName = "Se_Story_SilentNight_Shocked",
				type = "Sound"
			},
			{
				id = "yin_jian",
				fileName = "Se_Story_Impact_2",
				type = "Sound"
			},
			{
				id = "yin_diaodao",
				fileName = "Se_Story_Samurai_Drop",
				type = "Sound"
			},
			{
				id = "yin_chibei2",
				fileName = "Se_Story_Hit_Anna_Dizz",
				type = "Sound"
			},
			{
				id = "yin_qqtan",
				fileName = "Se_Story_Samurai_QQ",
				type = "Sound"
			},
			{
				id = "yin_xunlian",
				fileName = "Se_Story_Samurai_Ashram",
				type = "Sound"
			},
			{
				id = "yin_mudao",
				fileName = "Se_Skill_WTXX_Wooddrop_3",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 99444,
				visible = false,
				id = "xiao_jian3",
				scale = 1.2,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.32,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 99444,
				visible = false,
				id = "xiao_gongji",
				scale = 0.5,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.32,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 99444,
				visible = false,
				id = "xiao_jian4",
				scale = 1.2,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.32,
						y = 0.5
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_samurai_06a.actions.start_eventstory_samurai_06a(_root, args)
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SP_WTXXuan_stand",
						id = "sp_mcqdai",
						rotationX = 0,
						scale = 0.6,
						zorder = 300,
						position = {
							x = 0,
							y = -88,
							refpt = {
								x = 0.52,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "sp_mcqdai_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/mcqdai_face_1.png",
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
						modelId = "Model_BDZSheng",
						id = "BDZSheng",
						rotationX = 0,
						scale = 0.5,
						zorder = 320,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.68,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "BDZSheng_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "tyzhen/face_tyzhen_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "BDZSheng_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -433.5,
									y = 1924.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BDZSheng"),
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
						modelId = "Model_FCXJi",
						id = "dwyhui",
						rotationX = 0,
						scale = 0.55,
						zorder = 350,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 0.41,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "dwyhui_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "dwyhui/face_dwyhui_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "dwyhui_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 197,
									y = 1509
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "dwyhui"),
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
						modelId = "Model_ZTXCun",
						id = "ZTXCun",
						rotationX = 0,
						scale = 0.65,
						zorder = 260,
						position = {
							x = 0,
							y = -322,
							refpt = {
								x = 0.4,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ZTXCun_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ZTXCun/ZTXCun_face_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ZTXCun_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 177,
									y = 1146
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ZTXCun"),
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
						modelId = "Model_Story_JYing9",
						id = "tongxueA",
						rotationX = 0,
						scale = 0.85,
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
				actor = __getnode__(_root, "tongxueA"),
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
						modelId = "Model_Story_JYing9",
						id = "tongxueB",
						rotationX = 0,
						scale = 0.85,
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
				actor = __getnode__(_root, "tongxueB"),
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
						id = "chibei3",
						rotationX = 0,
						scale = 0.4,
						zorder = 420,
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
								name = "chibei3_arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "chibei3_arm",
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
				actor = __getnode__(_root, "chibei3"),
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
				actor = __getnode__(_root, "bg_zhedang"),
				args = function (_ctx)
					return {
						duration = 0.2
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
							y = -88,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
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
				actor = __getnode__(_root, "tongxueA"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.3,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "tongxueB"),
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
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 1,
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
			action = "play",
			actor = __getnode__(_root, "Mus_daochang"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "samurai_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"samurai_dialog_speak_name_1"
					},
					content = {
						"eventstory_samurai_06a_1"
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
					name = "samurai_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"samurai_dialog_speak_name_1"
					},
					content = {
						"eventstory_samurai_06a_2"
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
				actor = __getnode__(_root, "bg_zhedang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg_daochang"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
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
						name = "samurai_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_samurai_06a_3"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/face_sp_mcqdai_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_samurai_06a_4"
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
					name = "samurai_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_samurai_06a_5"
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "tongxueA"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "tongxueB"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		concurrent({
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"tongxueA",
							"tongxueB"
						},
						content = {
							"eventstory_samurai_06a_6"
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
				actor = __getnode__(_root, "tongxueA"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "tongxueB"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "samurai_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_samurai_06a_7"
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
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.89,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2
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
							y = -88,
							refpt = {
								x = 0.2,
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
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_8"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/face_sp_mcqdai_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_samurai_06a_9"
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_10"
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
					name = "samurai_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_samurai_06a_11"
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
		concurrent({
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
				action = "orbitCamera",
				actor = __getnode__(_root, "BDZSheng"),
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
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.05,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "chibei3"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.8,
								y = 0.3
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "chibei3"),
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
					duration = 0.4
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_12"
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
		sequential({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "chibei3"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.8,
								y = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "chibei3"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.8,
								y = 0.3
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "chibei3"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.8,
								y = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "chibei3"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.8,
								y = 0.3
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
				action = "play",
				actor = __getnode__(_root, "yin_qqtan"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			sequential({
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "chibei3_arm"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
							pathType = "STORY_FACE"
						}
					end
				}),
				sleep({
					args = function (_ctx)
						return {
							duration = 0.16
						}
					end
				}),
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "chibei3_arm"),
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
				})
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"chibei3"
						},
						content = {
							"eventstory_samurai_06a_13"
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
			actor = __getnode__(_root, "xiao_gongji"),
			args = function (_ctx)
				return {
					position = {
						refpt = {
							x = 0.68,
							y = 0.3
						}
					}
				}
			end
		}),
		concurrent({
			sequential({
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -550,
									refpt = {
										x = 0.1,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "chibei3"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.85,
										y = 0.3
									}
								}
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "xiao_gongji"),
						args = function (_ctx)
							return {
								time = 1
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "yin_mudao"),
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
							duration = 0.15
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_gongji"),
					args = function (_ctx)
						return {
							position = {
								refpt = {
									x = 0.95,
									y = 0.4
								}
							}
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -550,
									refpt = {
										x = 0.15,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "chibei3"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.75,
										y = 0.3
									}
								}
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "xiao_gongji"),
						args = function (_ctx)
							return {
								time = 1
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "yin_mudao"),
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
							duration = 0.15
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_gongji"),
					args = function (_ctx)
						return {
							position = {
								refpt = {
									x = 0.75,
									y = 0.2
								}
							}
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -550,
									refpt = {
										x = 0.2,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "chibei3"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.75,
										y = 0.5
									}
								}
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "xiao_gongji"),
						args = function (_ctx)
							return {
								time = 1
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "yin_mudao"),
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
							duration = 0.15
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_gongji"),
					args = function (_ctx)
						return {
							position = {
								refpt = {
									x = 0.75,
									y = 0.4
								}
							}
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -550,
									refpt = {
										x = 0.25,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "chibei3"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.85,
										y = 0.25
									}
								}
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "xiao_gongji"),
						args = function (_ctx)
							return {
								time = 1
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "yin_mudao"),
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
							duration = 0.15
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -550,
									refpt = {
										x = 0.05,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "chibei3"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.8,
										y = 0.3
									}
								}
							}
						end
					})
				})
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_xunlian"),
				args = function (_ctx)
					return {
						time = 1
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_14"
						},
						durations = {
							0.08
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
				action = "changeTexture",
				actor = __getnode__(_root, "chibei3_arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"chibei3"
						},
						content = {
							"eventstory_samurai_06a_15"
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
			actor = __getnode__(_root, "xiao_gongji"),
			args = function (_ctx)
				return {
					position = {
						refpt = {
							x = 0.68,
							y = 0.3
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			sequential({
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -550,
									refpt = {
										x = 0.1,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "chibei3"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.8,
										y = 0.5
									}
								}
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "xiao_gongji"),
						args = function (_ctx)
							return {
								time = 1
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "yin_mudao"),
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
							duration = 0.15
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_gongji"),
					args = function (_ctx)
						return {
							position = {
								refpt = {
									x = 0.8,
									y = 0.5
								}
							}
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -550,
									refpt = {
										x = 0.15,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "chibei3"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.95,
										y = 0.2
									}
								}
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "xiao_gongji"),
						args = function (_ctx)
							return {
								time = 1
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "yin_mudao"),
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
							duration = 0.15
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_gongji"),
					args = function (_ctx)
						return {
							position = {
								refpt = {
									x = 0.95,
									y = 0.2
								}
							}
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -550,
									refpt = {
										x = 0.2,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "chibei3"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.95,
										y = 0.5
									}
								}
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "xiao_gongji"),
						args = function (_ctx)
							return {
								time = 1
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "yin_mudao"),
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
							duration = 0.15
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_gongji"),
					args = function (_ctx)
						return {
							position = {
								refpt = {
									x = 0.95,
									y = 0.5
								}
							}
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -550,
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
						actor = __getnode__(_root, "chibei3"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.2,
										y = 0.4
									}
								}
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "xiao_gongji"),
						args = function (_ctx)
							return {
								time = 1
							}
						end
					}),
					act({
						action = "play",
						actor = __getnode__(_root, "yin_mudao"),
						args = function (_ctx)
							return {
								time = 1
							}
						end
					})
				})
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.15,
								y = 0
							}
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_16"
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
		sequential({
			concurrent({
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "chibei3_arm"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
							pathType = "STORY_FACE"
						}
					end
				}),
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "BDZSheng"),
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
					actor = __getnode__(_root, "BDZSheng"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -550,
								refpt = {
									x = 0.88,
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
						dialogue = 0.16
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "chibei3_arm"),
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
						duration = 0.16
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "chibei3_arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
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
				action = "play",
				actor = __getnode__(_root, "yin_chibei2"),
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
						name = "samurai_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"chibei3"
						},
						content = {
							"eventstory_samurai_06a_17"
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
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_18"
						},
						durations = {
							0.03
						}
					}
				end
			})
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
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_19"
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
				action = "stop",
				actor = __getnode__(_root, "yin_xunlian")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_diaodao"),
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
						name = "samurai_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"samurai_dialog_speak_name_1"
						},
						content = {
							"eventstory_samurai_06a_20"
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
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "chibei3_arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 0.7
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_21"
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
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -88,
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
				action = "fadeOut",
				actor = __getnode__(_root, "chibei3"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/face_sp_mcqdai_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_samurai_06a_22"
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "chibei3"),
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
				action = "rock",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 0.7
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "chibei3"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			})
		}),
		sequential({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "chibei3"),
				args = function (_ctx)
					return {
						duration = 0.08,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.1,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "chibei3"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = -0.2,
								y = 1.2
							}
						}
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "chibei3"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "moveTo",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.73,
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
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_23"
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
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "samurai_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_samurai_06a_24"
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BDZSheng"),
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
			action = "changeTexture",
			actor = __getnode__(_root, "BDZSheng_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "tyzhen/face_tyzhen_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_25"
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
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/face_sp_mcqdai_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_samurai_06a_26"
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
					name = "samurai_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_samurai_06a_27"
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -88,
							refpt = {
								x = 0,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ZTXCun"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -322,
							refpt = {
								x = 1,
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "samurai_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BDZSheng"
					},
					content = {
						"eventstory_samurai_06a_28"
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
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_4.png",
						pathType = "STORY_FACE"
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_29"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "BDZSheng"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -550,
								refpt = {
									x = 0.37,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "BDZSheng"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -550,
								refpt = {
									x = 1,
									y = 0
								}
							}
						}
					end
				})
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BDZSheng"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2
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
							y = -88,
							refpt = {
								x = 0.25,
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "samurai_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_samurai_06a_30"
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
						image = "sp_mcqdai/face_sp_mcqdai_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_samurai_06a_31"
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
			action = "changeTexture",
			actor = __getnode__(_root, "sp_mcqdai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/face_sp_mcqdai_5.png",
					pathType = "STORY_FACE"
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ZTXCun"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -322,
							refpt = {
								x = 0.68,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXCun"),
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
						name = "samurai_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXCun"
						},
						content = {
							"eventstory_samurai_06a_32"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		act({
			action = "volumeout",
			actor = __getnode__(_root, "Mus_daochang"),
			args = function (_ctx)
				return {
					duration = 2,
					type = "music"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_daochang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg_podao"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "bgEx_podao"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			})
		}),
		concurrent({
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
				actor = __getnode__(_root, "ZTXCun"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.25,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "dwyhui"),
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
				actor = __getnode__(_root, "dwyhui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 1,
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
					duration = 1.5
				}
			end
		}),
		act({
			action = "volumeoutstop",
			actor = __getnode__(_root, "Mus_daochang"),
			args = function (_ctx)
				return {
					type = "music"
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_daochang")
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
		concurrent({
			act({
				action = "volumein",
				actor = __getnode__(_root, "Mus_wujinxia"),
				args = function (_ctx)
					return {
						duration = 0.5,
						type = "music"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_wujinxia"),
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "samurai_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BDZSheng"
					},
					content = {
						"eventstory_samurai_06a_33"
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
					name = "samurai_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"samurai_dialog_speak_name_1"
					},
					content = {
						"eventstory_samurai_06a_34"
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
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.1,
								y = 0
							}
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_35"
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
				action = "fadeIn",
				actor = __getnode__(_root, "dwyhui"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "dwyhui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 0.85,
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
						name = "samurai_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"dwyhui"
						},
						content = {
							"eventstory_samurai_06a_36"
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
					name = "samurai_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dwyhui"
					},
					content = {
						"eventstory_samurai_06a_37"
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
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_38"
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
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_6.png",
						pathType = "STORY_FACE"
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_39"
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
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.15,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "dwyhui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dwyhui/face_dwyhui_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "dwyhui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 0.9,
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
				action = "moveTo",
				actor = __getnode__(_root, "dwyhui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 0.85,
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
						name = "samurai_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"dwyhui"
						},
						content = {
							"eventstory_samurai_06a_40"
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
				action = "rock",
				actor = __getnode__(_root, "dwyhui"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 0.7
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"dwyhui"
						},
						content = {
							"eventstory_samurai_06a_41"
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
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_42"
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
				actor = __getnode__(_root, "dwyhui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dwyhui/face_dwyhui_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"dwyhui"
						},
						content = {
							"eventstory_samurai_06a_43"
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
					name = "samurai_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dwyhui"
					},
					content = {
						"eventstory_samurai_06a_44"
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
				actor = __getnode__(_root, "BDZSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_06a_45"
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
				actor = __getnode__(_root, "dwyhui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "dwyhui/face_dwyhui_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "dwyhui"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 0.7
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"dwyhui"
						},
						content = {
							"eventstory_samurai_06a_46"
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
					name = "samurai_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BDZSheng"
					},
					content = {
						"eventstory_samurai_06a_47"
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
			action = "stop",
			actor = __getnode__(_root, "Mus_wujinxia")
		})
	})
end

local function eventstory_samurai_06a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_samurai_06a",
					scene = scene_eventstory_samurai_06a
				}
			end
		})
	})
end

stories.eventstory_samurai_06a = eventstory_samurai_06a

return _M
