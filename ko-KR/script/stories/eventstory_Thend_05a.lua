local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Thend_05a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Thend_05a = {
	actions = {}
}
scenes.scene_eventstory_Thend_05a = scene_eventstory_Thend_05a

function scene_eventstory_Thend_05a:stage(args)
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
						name = "bg_jinianbei",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_spring_1.jpg",
						layoutMode = 1,
						zorder = 10,
						id = "bg_jinianbei",
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
						name = "bg_nengliangzhan",
						pathType = "SCENE",
						type = "Image",
						image = "ybxrdxh_fb_bg2.jpg",
						layoutMode = 1,
						zorder = 100,
						id = "bg_nengliangzhan",
						scale = 1.5,
						anchorPoint = {
							x = 1,
							y = 1
						},
						position = {
							refpt = {
								x = 1,
								y = 1
							}
						}
					},
					{
						resType = 0,
						name = "cg_monster",
						pathType = "SCENE",
						type = "Image",
						image = "bg_pve_cg_06.jpg",
						layoutMode = 1,
						zorder = 125,
						id = "cg_monster",
						scale = 1.25,
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
						name = "cg_mengyan",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_00_12.jpg",
						layoutMode = 1,
						zorder = 125,
						id = "cg_mengyan",
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
				name = "zhedang_bai",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "bm.png",
				layoutMode = 1,
				zorder = 10000,
				id = "zhedang_bai",
				scale = 1.5,
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
				name = "zhedang_hei",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 20000,
				id = "zhedang_hei",
				scale = 1.5,
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
				id = "Mus_spring",
				fileName = "Mus_Story_Spring_Main",
				type = "Music"
			},
			{
				id = "Mus_zhandou",
				fileName = "Mus_Story_Spring_Resistance",
				type = "Music"
			},
			{
				id = "yin_paoxiao",
				fileName = "Se_Story_Family_Bellow",
				type = "Sound"
			},
			{
				id = "yin_yunxing",
				fileName = "Se_Story_Collapse",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10000,
				visible = false,
				id = "xiao_huiyi",
				scale = 1.1,
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
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
				visible = false,
				id = "xiao_beiji",
				scale = 0.9,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.8
					}
				}
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 10000,
				videoName = "story_baozha",
				id = "xiao_baozha",
				scale = 1.2,
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 80,
				visible = false,
				id = "xiao_liexi",
				scale = 1.5,
				actionName = "story_spacecrack_kongjianjianxi",
				anchorPoint = {
					x = 1,
					y = 1
				},
				position = {
					refpt = {
						x = 0.9,
						y = 0.9
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100000,
				visible = false,
				id = "xiao_dunpai",
				scale = 0.2,
				actionName = "hudun_juqinghudun",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_Thend_05a.actions.start_eventstory_Thend_05a(_root, args)
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
					duration = 0.2
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_jinianbei"),
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
					bgImage = "gallery_album_01.jpg",
					printAudioOff = true,
					bgShow = false,
					center = 1,
					content = {
						"eventstory_Thend_05a_1",
						"eventstory_Thend_05a_2",
						"eventstory_Thend_05a_3",
						"eventstory_Thend_05a_4",
						"eventstory_Thend_05a_5",
						"eventstory_Thend_05a_6"
					},
					durations = {
						0.08,
						0.08,
						0.08,
						0.08,
						0.08,
						0.08,
						0.08,
						0.1
					},
					waitTimes = {
						1,
						1,
						1,
						1,
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgImage = "gallery_album_01.jpg",
					printAudioOff = true,
					bgShow = false,
					center = 1,
					content = {
						"eventstory_Thend_05a_7"
					},
					durations = {
						0.1
					},
					waitTimes = {
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
						modelId = "Model_Story_FTLEShi",
						id = "FTLEShi",
						rotationX = 0,
						scale = 0.6,
						zorder = 150,
						position = {
							x = 0,
							y = -320,
							refpt = {
								x = 0.54,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "FTLEShi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "FTLEShi/FTLEShi_face_6.png",
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
									x = -41.5,
									y = 1286.1
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "FTLEShi"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
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
			action = "play",
			actor = __getnode__(_root, "Mus_spring"),
			args = function (_ctx)
				return {
					time = -1
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
					name = "Thend_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_Thend_05a_8"
					},
					durations = {
						0.03
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
						modelId = "Model_FTLYShi_single",
						id = "agste",
						rotationX = 0,
						scale = 0.5,
						zorder = 400,
						position = {
							x = 0,
							y = -420,
							refpt = {
								x = 0,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "agste_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "agste/face_agste_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "agste_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -295,
									y = 1814.8
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "agste"),
				args = function (_ctx)
					return {
						opacity = 0
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
				actor = __getnode__(_root, "agste"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "agste"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -420,
							refpt = {
								x = 0.33,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -320,
							refpt = {
								x = 0.84,
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"agste"
					},
					content = {
						"eventstory_Thend_05a_9"
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
				actor = __getnode__(_root, "FTLEShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "FTLEShi/FTLEShi_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Thend_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FTLEShi"
						},
						content = {
							"eventstory_Thend_05a_10"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.6
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi/FTLEShi_face_1.png",
					pathType = "STORY_FACE"
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
					name = "Thend_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_Thend_05a_11"
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
					name = "Thend_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"agste"
					},
					content = {
						"eventstory_Thend_05a_12"
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
					name = "Thend_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_Thend_05a_13"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.6
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi/FTLEShi_face_7.png",
					pathType = "STORY_FACE"
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
					name = "Thend_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_Thend_05a_14"
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
					name = "Thend_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"agste"
					},
					content = {
						"eventstory_Thend_05a_15"
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
					name = "Thend_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_Thend_05a_16"
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
					name = "Thend_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"agste"
					},
					content = {
						"eventstory_Thend_05a_17"
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
					name = "Thend_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_Thend_05a_18"
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
					name = "Thend_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"agste"
					},
					content = {
						"eventstory_Thend_05a_19"
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
				actor = __getnode__(_root, "FTLEShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "FTLEShi/FTLEShi_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Thend_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FTLEShi"
						},
						content = {
							"eventstory_Thend_05a_20"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_huiyi")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "agste"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_jinianbei"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg_mengyan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_nengliangzhan"),
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
					time = -1
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
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
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
			action = "fadeOut",
			actor = __getnode__(_root, "cg_mengyan"),
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing11",
						id = "Soldier1",
						rotationX = 0,
						scale = 0.85,
						zorder = 110,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.2,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Soldier1"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "Soldier1"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "FTLEShi"),
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
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -320,
							refpt = {
								x = 0.26,
								y = 0
							}
						}
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
						modelId = "Model_LLKe_single",
						id = "blsi",
						rotationX = 0,
						scale = 0.5,
						zorder = 450,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.66,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "blsi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "blsi/face_blsi_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "blsi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 151.3,
									y = 1590.1
								}
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "FTLEShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "FTLEShi/FTLEShi_face_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "blsi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "blsi"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "Soldier1"),
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
					name = "Thend_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Soldier1"
					},
					content = {
						"eventstory_Thend_05a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0.2
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"blsi"
					},
					content = {
						"eventstory_Thend_05a_22"
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
				actor = __getnode__(_root, "blsi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Soldier1"),
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
					duration = 0.25
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "FTLEShi"),
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
					name = "Thend_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_Thend_05a_23"
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
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0.2
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"blsi"
					},
					content = {
						"eventstory_Thend_05a_24"
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
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi/FTLEShi_face_12.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					duration = 0.2
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_Thend_05a_25"
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
			actor = __getnode__(_root, "FTLEShi"),
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
						modelId = "Model_Story_JYing12",
						id = "Soldier2",
						rotationX = 0,
						scale = 0.85,
						zorder = 120,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.48,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Soldier2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Soldier2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
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
				action = "play",
				actor = __getnode__(_root, "xiao_baozha"),
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
					duration = 1
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_baozha")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_baozha")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_26"
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
					name = "Thend_dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Soldier2"
					},
					content = {
						"eventstory_Thend_05a_27"
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
			actor = __getnode__(_root, "Soldier2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Soldier1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -310,
						refpt = {
							x = -0.4,
							y = 0
						}
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
						modelId = "Model_Story_JYing13",
						id = "Soldier3",
						rotationX = 0,
						scale = 0.85,
						zorder = 130,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.03,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Soldier3"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_liexi"),
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Soldier1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Soldier1"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.3,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Soldier3"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Soldier3"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.73,
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
					duration = 0.25
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Soldier1"
					},
					content = {
						"eventstory_Thend_05a_28"
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
					name = "Thend_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Soldier3"
					},
					content = {
						"eventstory_Thend_05a_29"
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
			actor = __getnode__(_root, "blsi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "blsi/face_blsi_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Soldier1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Soldier3"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "blsi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.56,
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
					duration = 0.25
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_30"
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
					name = "Thend_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"blsi"
					},
					content = {
						"eventstory_Thend_05a_31"
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
					name = "Thend_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_32"
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
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Enemy_Story_Normal",
						id = "Monster1",
						rotationX = 0,
						scale = 0.2,
						zorder = 81,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.9,
								y = 0.7
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
						modelId = "Model_Enemy_Story_Normal",
						id = "Monster2",
						rotationX = 0,
						scale = 0.2,
						zorder = 81,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.9,
								y = 0.7
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
						modelId = "Model_Enemy_Story_Normal",
						id = "Monster3",
						rotationX = 0,
						scale = 0.2,
						zorder = 81,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.9,
								y = 0.7
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Monster3"),
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
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						scale = 0.65,
						duration = 0.3
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = 0,
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
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						scale = 0.65,
						duration = 0.4
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						scale = 0.65,
						duration = 0.4
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.8,
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_paoxiao"),
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
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_baozha"),
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
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.9,
								y = 0.7
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.9,
								y = 0.7
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.9,
								y = 0.7
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "blsi"),
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
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_paoxiao")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_baozha")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_33"
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
					name = "Thend_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"blsi"
					},
					content = {
						"eventstory_Thend_05a_34"
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
					name = "Thend_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_35"
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
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "fadeIn",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						scale = 0.65,
						duration = 0.3
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = 0,
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
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						scale = 0.65,
						duration = 0.4
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						scale = 0.65,
						duration = 0.4
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.8,
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_paoxiao"),
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
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_baozha"),
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
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.9,
								y = 0.7
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.9,
								y = 0.7
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster3"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.9,
								y = 0.7
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "blsi"),
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
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_paoxiao")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_baozha")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"blsi"
					},
					content = {
						"eventstory_Thend_05a_36"
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
				action = "play",
				actor = __getnode__(_root, "yin_yunxing"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			sequential({
				concurrent({
					act({
						action = "play",
						actor = __getnode__(_root, "xiao_dunpai"),
						args = function (_ctx)
							return {
								time = -1
							}
						end
					}),
					act({
						action = "scaleTo",
						actor = __getnode__(_root, "xiao_dunpai"),
						args = function (_ctx)
							return {
								scale = 1.5,
								duration = 0.8
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "xiao_dunpai"),
						args = function (_ctx)
							return {
								duration = 0.8,
								position = {
									refpt = {
										x = 0.5,
										y = 0.5
									}
								}
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
					actor = __getnode__(_root, "xiao_dunpai")
				}),
				act({
					action = "hide",
					actor = __getnode__(_root, "xiao_dunpai")
				})
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_37"
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
					name = "Thend_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_38"
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
					name = "Thend_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"blsi"
					},
					content = {
						"eventstory_Thend_05a_39"
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
					name = "Thend_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_40"
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
					name = "Thend_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"blsi"
					},
					content = {
						"eventstory_Thend_05a_41"
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
				action = "play",
				actor = __getnode__(_root, "xiao_beiji"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "blsi"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.56,
								y = -0.08
							}
						}
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
				action = "changeTexture",
				actor = __getnode__(_root, "blsi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "blsi/face_blsi_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Thend_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"blsi"
						},
						content = {
							"eventstory_Thend_05a_42"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Soldier3"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.53,
								y = 0
							}
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
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "Soldier3"),
			args = function (_ctx)
				return {
					duration = 0.2
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Soldier3"
					},
					content = {
						"eventstory_Thend_05a_43"
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
					name = "Thend_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Soldier3"
					},
					content = {
						"eventstory_Thend_05a_44"
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
			actor = __getnode__(_root, "Soldier3"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0.2
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"blsi"
					},
					content = {
						"eventstory_Thend_05a_45"
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
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "Soldier3"),
			args = function (_ctx)
				return {
					duration = 0.2
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Soldier3"
					},
					content = {
						"eventstory_Thend_05a_46"
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
			action = "play",
			actor = __getnode__(_root, "xiao_baozha"),
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
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 0.7
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Soldier3"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "xiao_baozha")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_baozha")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_47"
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
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0.2
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
				action = "changeTexture",
				actor = __getnode__(_root, "blsi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "blsi/face_blsi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Thend_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"blsi"
						},
						content = {
							"eventstory_Thend_05a_48"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_liexi")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_liexi")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi/FTLEShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -320,
						refpt = {
							x = 0.46,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_zhandou")
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_Thend_05a_49"
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
			actor = __getnode__(_root, "FTLEShi"),
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Thend_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_50"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "blsi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "blsi/face_blsi_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -310,
						refpt = {
							x = 0.46,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Soldier1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -310,
						refpt = {
							x = 1,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "Soldier1"),
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
					name = "Thend_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_Thend_05a_51"
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
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0.35
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
					name = "Thend_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"blsi"
					},
					content = {
						"eventstory_Thend_05a_52"
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
				actor = __getnode__(_root, "Soldier1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Soldier1"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.88,
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
						name = "Thend_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Soldier1"
						},
						content = {
							"eventstory_Thend_05a_53"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Soldier1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "blsi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = 0.56,
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "blsi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "blsi/face_blsi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Thend_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"blsi"
						},
						content = {
							"eventstory_Thend_05a_54"
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
			action = "fadeOut",
			actor = __getnode__(_root, "blsi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		})
	})
end

local function eventstory_Thend_05a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Thend_05a",
					scene = scene_eventstory_Thend_05a
				}
			end
		})
	})
end

stories.eventstory_Thend_05a = eventstory_Thend_05a

return _M
