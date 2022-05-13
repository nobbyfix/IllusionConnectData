local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_samurai_04a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_samurai_04a = {
	actions = {}
}
scenes.scene_eventstory_samurai_04a = scene_eventstory_samurai_04a

function scene_eventstory_samurai_04a:stage(args)
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
						name = "bg_tengyuanjia",
						pathType = "SCENE",
						type = "Image",
						image = "scene_story_samurai_1.jpg",
						layoutMode = 1,
						zorder = 100,
						id = "bg_tengyuanjia",
						scale = 1.25,
						anchorPoint = {
							x = 0.5,
							y = 0.5
						},
						position = {
							refpt = {
								x = 0.67,
								y = 0.75
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
				id = "Mus_jiemei",
				fileName = "Mus_Story_Girl_Clumsy",
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
				id = "yin_gedang",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				id = "yin_diaodao",
				fileName = "Se_Story_Samurai_Drop",
				type = "Sound"
			},
			{
				id = "yin_zhufei",
				fileName = "Se_Story_Samurai_Boiling",
				type = "Sound"
			},
			{
				id = "yin_xunlian",
				fileName = "Se_Story_Samurai_Ashram",
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
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 3,
				visible = false,
				id = "huiyib_juqingtexiao",
				scale = 1.05,
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

function scene_eventstory_samurai_04a.actions.start_eventstory_samurai_04a(_root, args)
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
				actor = __getnode__(_root, "gongjuren2"),
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
						modelId = "Model_TYZhen_NoArmor",
						id = "tyzhen",
						rotationX = 0,
						scale = 0.5,
						zorder = 400,
						position = {
							x = 0,
							y = -487,
							refpt = {
								x = 0.55,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "tyzhen_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "tyzhen/face_tyzhen_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "tyzhen_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -170.7,
									y = 1798.2
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "tyzhen"),
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
		act({
			action = "play",
			actor = __getnode__(_root, "huiyib_juqingtexiao"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		concurrent({
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
				action = "moveTo",
				actor = __getnode__(_root, "tongxueA"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				action = "moveTo",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.9,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_daochang"),
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
					name = "samurai_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"tongxueA"
					},
					content = {
						"eventstory_samurai_04a_1"
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
						image = "tyzhen/face_tyzhen_3.png",
						pathType = "STORY_FACE"
					}
				end
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
							"eventstory_samurai_04a_2"
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
							"eventstory_samurai_04a_3"
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
					name = "samurai_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"tongxueA"
					},
					content = {
						"eventstory_samurai_04a_4"
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
				action = "stop",
				actor = __getnode__(_root, "yin_xunlian")
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
							"eventstory_samurai_04a_5"
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
					duration = 1.5,
					type = "music"
				}
			end
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
				actor = __getnode__(_root, "BDZSheng"),
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
				actor = __getnode__(_root, "tyzhen"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -487,
							refpt = {
								x = 0.48,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "tyzhen"),
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
				actor = __getnode__(_root, "tyzhen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_4.png",
						pathType = "STORY_FACE"
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
				actor = __getnode__(_root, "bg_tengyuanjia"),
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
					duration = 1
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
		concurrent({
			act({
				action = "stop",
				actor = __getnode__(_root, "huiyib_juqingtexiao")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "huiyib_juqingtexiao")
			})
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "tyzhen"),
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
							"tyzhen"
						},
						content = {
							"eventstory_samurai_04a_6"
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
						"tyzhen"
					},
					content = {
						"eventstory_samurai_04a_7"
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
				actor = __getnode__(_root, "yin_zhufei"),
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
							"eventstory_samurai_04a_8"
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
				actor = __getnode__(_root, "tyzhen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_5.png",
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
							"tyzhen"
						},
						content = {
							"eventstory_samurai_04a_9"
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
				actor = __getnode__(_root, "tyzhen"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -487,
							refpt = {
								x = 0.2,
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
					name = "samurai_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun"
					},
					content = {
						"eventstory_samurai_04a_10"
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
				actor = __getnode__(_root, "tyzhen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "tyzhen"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -487,
							refpt = {
								x = 0.22,
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
							"tyzhen"
						},
						content = {
							"eventstory_samurai_04a_11"
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
					name = "samurai_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun"
					},
					content = {
						"eventstory_samurai_04a_12"
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
				actor = __getnode__(_root, "tyzhen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_5.png",
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
							"tyzhen"
						},
						content = {
							"eventstory_samurai_04a_13"
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
				actor = __getnode__(_root, "ZTXCun_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXCun/ZTXCun_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_zhufei")
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
							"eventstory_samurai_04a_14"
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
			action = "moveTo",
			actor = __getnode__(_root, "tyzhen"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -487,
						refpt = {
							x = 0.2,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ZTXCun_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXCun/ZTXCun_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "tyzhen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_3.png",
						pathType = "STORY_FACE"
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
							"tyzhen"
						},
						content = {
							"eventstory_samurai_04a_15"
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
					name = "samurai_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun"
					},
					content = {
						"eventstory_samurai_04a_16"
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
				actor = __getnode__(_root, "tyzhen_face"),
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
							"tyzhen"
						},
						content = {
							"eventstory_samurai_04a_17"
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
					name = "samurai_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun"
					},
					content = {
						"eventstory_samurai_04a_18"
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
				actor = __getnode__(_root, "tyzhen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "tyzhen/face_tyzhen_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "tyzhen"),
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
							"tyzhen"
						},
						content = {
							"eventstory_samurai_04a_19"
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
						"tyzhen"
					},
					content = {
						"eventstory_samurai_04a_20"
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
				actor = __getnode__(_root, "ZTXCun_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXCun/ZTXCun_face_2.png",
						pathType = "STORY_FACE"
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
							"eventstory_samurai_04a_21"
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
						"tyzhen"
					},
					content = {
						"eventstory_samurai_04a_22"
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
				actor = __getnode__(_root, "tyzhen"),
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
							"tyzhen"
						},
						content = {
							"eventstory_samurai_04a_23"
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
			actor = __getnode__(_root, "Mus_wujinxia"),
			args = function (_ctx)
				return {
					duration = 1.5,
					type = "music"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg_tengyuanjia"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.35,
							y = 0.7
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "tyzhen"),
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
								x = 0.1,
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
								x = 0.7,
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
					duration = 1
				}
			end
		}),
		act({
			action = "volumeoutstop",
			actor = __getnode__(_root, "Mus_wujinxia"),
			args = function (_ctx)
				return {
					type = "music"
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_wujinxia")
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
				actor = __getnode__(_root, "Mus_jiemei"),
				args = function (_ctx)
					return {
						duration = 0.5,
						type = "music"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_jiemei"),
				args = function (_ctx)
					return {
						isLoop = true
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
							"eventstory_samurai_04a_24"
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
				action = "play",
				actor = __getnode__(_root, "yin_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "BDZSheng"),
					args = function (_ctx)
						return {
							duration = 0.3,
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
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ZTXCun"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -322,
								refpt = {
									x = 0.8,
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
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_04a_25"
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
				actor = __getnode__(_root, "ZTXCun"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -322,
							refpt = {
								x = 0.7,
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
						name = "samurai_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXCun"
						},
						content = {
							"eventstory_samurai_04a_26"
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
			sequential({
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
								"BDZSheng"
							},
							content = {
								"eventstory_samurai_04a_27"
							},
							durations = {
								0.03
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "yin_gedang"),
					args = function (_ctx)
						return {
							time = 1
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
									x = 0.15,
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
									x = 0.65,
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
							duration = 0.1,
							position = {
								x = 0,
								y = -550,
								refpt = {
									x = 0,
									y = 0
								}
							}
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
				})
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ZTXCun_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXCun/ZTXCun_face_4.png",
						pathType = "STORY_FACE"
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
								x = 0.1,
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
						name = "samurai_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXCun"
						},
						content = {
							"eventstory_samurai_04a_28"
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
						"eventstory_samurai_04a_29"
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
			action = "rock",
			actor = __getnode__(_root, "BDZSheng"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
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
							"eventstory_samurai_04a_30"
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
				actor = __getnode__(_root, "ZTXCun_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXCun/ZTXCun_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "samurai_dialog_speak_name_10",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng",
							"ZTXCun"
						},
						content = {
							"eventstory_samurai_04a_31"
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
				actor = __getnode__(_root, "yin_azhe"),
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
						name = "samurai_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"BDZSheng"
						},
						content = {
							"eventstory_samurai_04a_32"
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
							"eventstory_samurai_04a_33"
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
				actor = __getnode__(_root, "ZTXCun"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -322,
							refpt = {
								x = 0.66,
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
						name = "samurai_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXCun"
						},
						content = {
							"eventstory_samurai_04a_34"
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
					name = "samurai_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun"
					},
					content = {
						"eventstory_samurai_04a_35"
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
							"eventstory_samurai_04a_36"
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
				actor = __getnode__(_root, "ZTXCun_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXCun/ZTXCun_face_2.png",
						pathType = "STORY_FACE"
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
							"eventstory_samurai_04a_37"
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
							"eventstory_samurai_04a_38"
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
						"eventstory_samurai_04a_39"
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
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.08,
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
							"eventstory_samurai_04a_40"
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
				actor = __getnode__(_root, "ZTXCun_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXCun/ZTXCun_face_5.png",
						pathType = "STORY_FACE"
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
							"eventstory_samurai_04a_41"
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
			rockScreen({
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
							"eventstory_samurai_04a_42"
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
						"eventstory_samurai_04a_43"
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
								x = 0.46,
								y = 0
							}
						}
					}
				end
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
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BDZSheng"),
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
			actor = __getnode__(_root, "Mus_jiemei"),
			args = function (_ctx)
				return {
					duration = 1.5,
					type = "music"
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
				actor = __getnode__(_root, "bg_tengyuanjia"),
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
				actor = __getnode__(_root, "ZTXCun"),
				args = function (_ctx)
					return {
						duration = 0
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
								x = 0,
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
						image = "dwyhui/face_dwyhui_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
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
			action = "volumeoutstop",
			actor = __getnode__(_root, "Mus_jiemei"),
			args = function (_ctx)
				return {
					type = "music"
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_jiemei")
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
						"eventstory_samurai_04a_44"
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
									x = 0.7,
									y = 0
								}
							}
						}
					end
				}),
				concurrent({
					act({
						action = "fadeOut",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.5
							}
						end
					}),
					act({
						action = "rock",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								freq = 3,
								strength = 1
							}
						end
					}),
					act({
						action = "rotateBy",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								deltaAngle = -90,
								duration = 0.3
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "BDZSheng"),
						args = function (_ctx)
							return {
								duration = 0.3,
								position = {
									x = 0,
									y = -550,
									refpt = {
										x = 0.85,
										y = -0.2
									}
								}
							}
						end
					})
				}),
				rockScreen({
					args = function (_ctx)
						return {
							freq = 3,
							strength = 2
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
							"eventstory_samurai_04a_45"
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
			action = "rock",
			actor = __getnode__(_root, "BDZSheng"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
		}),
		concurrent({
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						deltaAngle = 90,
						duration = 0
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
								x = 0.9,
								y = -0.4
							}
						}
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
								x = 0.15,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "dwyhui"),
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
					name = "samurai_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dwyhui"
					},
					content = {
						"eventstory_samurai_04a_46"
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
							"eventstory_samurai_04a_47"
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
				actor = __getnode__(_root, "BDZSheng"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.9,
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
						duration = 0.25
					}
				end
			}),
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
							"eventstory_samurai_04a_48"
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
							"eventstory_samurai_04a_49"
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
				actor = __getnode__(_root, "dwyhui"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 0.2,
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
							"eventstory_samurai_04a_50"
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
						image = "dwyhui/face_dwyhui_8.png",
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
							"eventstory_samurai_04a_51"
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
						image = "dwyhui/face_dwyhui_5.png",
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
							"eventstory_samurai_04a_52"
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
						image = "tyzhen/face_tyzhen_3.png",
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
							"eventstory_samurai_04a_53"
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
							"eventstory_samurai_04a_54"
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
							"eventstory_samurai_04a_55"
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
						"eventstory_samurai_04a_56"
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

local function eventstory_samurai_04a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_samurai_04a",
					scene = scene_eventstory_samurai_04a
				}
			end
		})
	})
end

stories.eventstory_samurai_04a = eventstory_samurai_04a

return _M
