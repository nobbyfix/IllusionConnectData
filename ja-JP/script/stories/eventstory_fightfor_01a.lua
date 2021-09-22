local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_fightfor_01a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_fightfor_01a = {
	actions = {}
}
scenes.scene_eventstory_fightfor_01a = scene_eventstory_fightfor_01a

function scene_eventstory_fightfor_01a:stage(args)
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
						name = "bg_tiantai",
						pathType = "SCENE",
						type = "Image",
						image = "bga_zhujiemianyunimage.jpg",
						layoutMode = 1,
						zorder = 30,
						id = "bg_tiantai",
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
						name = "bg_xide",
						pathType = "SCENE",
						type = "Image",
						image = "main_img_16.jpg",
						layoutMode = 1,
						zorder = 28,
						id = "bg_xide",
						scale = 1.3,
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
						name = "bg_weinasi",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_0_2.jpg",
						layoutMode = 1,
						zorder = 20,
						id = "bg_weinasi",
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
								layoutMode = 1,
								type = "MovieClip",
								zorder = 3,
								visible = true,
								id = "Ex_weinasi",
								scale = 1,
								actionName = "all_wnsxjsnOne",
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
						name = "bg_jiedao",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_0_1.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_jiedao",
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
								id = "EX_jiedao",
								zorder = 3,
								layoutMode = 1,
								type = "MovieClip",
								scale = 1,
								actionName = "all_jiedao",
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
						name = "bg_yuxu",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_3_2.jpg",
						layoutMode = 1,
						zorder = 10,
						id = "bg_yuxu",
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
								id = "EX_yuxu",
								zorder = 3,
								layoutMode = 1,
								type = "MovieClip",
								scale = 1,
								actionName = "all_jingyubeishangxin",
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
				id = "Mus_kaichang",
				fileName = "Mus_Battle_Halloween",
				type = "Music"
			},
			{
				id = "Mus_weixian",
				fileName = "Mus_Story_Danger",
				type = "Music"
			},
			{
				id = "Mus_dasheng",
				fileName = "Mus_Story_Animal_Main",
				type = "Music"
			},
			{
				id = "Mus_yuxu",
				fileName = "Mus_Story_VanGogh_Disappear",
				type = "Music"
			},
			{
				id = "yin_maopingdan",
				fileName = "Se_Story_Animal_Cat_Ordinary",
				type = "Sound"
			},
			{
				id = "yin_maojingya",
				fileName = "Se_Story_Animal_Cat_Amazed",
				type = "Sound"
			},
			{
				id = "yin_maobeida",
				fileName = "Voice_XDE_29",
				type = "Sound"
			},
			{
				id = "yin_juxiang",
				fileName = "Se_Story_Fire_2",
				type = "Sound"
			},
			{
				id = "yin_gedang",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				id = "yin_gun",
				fileName = "Se_Story_Impact_1",
				type = "Sound"
			},
			{
				id = "yin_nvchaoxiao",
				fileName = "Voice_YSTLu_22_1",
				type = "Sound"
			},
			{
				id = "yin_xiaozhang",
				fileName = "Voice_LEMHou_31",
				type = "Sound"
			},
			{
				id = "yin_nvgongji",
				fileName = "Voice_YSTLu_27",
				type = "Sound"
			},
			{
				id = "yin_nvshouji",
				fileName = "Voice_YSTLu_29",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1350,
				visible = false,
				id = "xiao_gedang",
				scale = 1.05,
				actionName = "beiji_juqingtexiao",
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
				type = "MovieClip",
				zorder = 1350,
				visible = false,
				id = "xiao_jian1",
				scale = 1.05,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.4,
						y = 0.7
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1350,
				visible = false,
				id = "xiao_jian2",
				scale = 1.05,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.6,
						y = 0.7
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10000,
				visible = false,
				id = "xiao_huiyi",
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

function scene_eventstory_fightfor_01a.actions.start_eventstory_fightfor_01a(_root, args)
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
			action = "fadeIn",
			actor = __getnode__(_root, "hm"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tiantai"),
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
						modelId = "Model_LEMHou",
						id = "kxyuan",
						rotationX = 0,
						scale = 0.66,
						zorder = 60,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.51,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "kxyuan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "kxyuan/face_kxyuan_6.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "kxyuan_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -27.4,
									y = 1370.3
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "kxyuan"),
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
						brightness = -255,
						modelId = "Model_LEMHou",
						id = "yingzi",
						rotationX = 0,
						scale = 0.66,
						zorder = 61,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.51,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "yingzi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
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
						"eventstory_fightfor_01a_1",
						"eventstory_fightfor_01a_2",
						"eventstory_fightfor_01a_3",
						"eventstory_fightfor_01a_4"
					},
					durations = {
						0.08,
						0.08,
						0.08,
						0.08
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
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "yingzi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_kaichang"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "yingzi"),
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
			action = "orbitCamera",
			actor = __getnode__(_root, "xiao_jian2"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_5"
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
						freq = 2,
						strength = 1
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_6"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_7"
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_tiantai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_xide"),
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
						modelId = "Model_JSTDing",
						id = "JSTDing",
						rotationX = 0,
						scale = 0.75,
						zorder = 50,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.76,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "JSTDing_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "JSTDing/JSTDing_face_2.png",
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
									x = -112,
									y = 923
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JSTDing"),
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
						modelId = "Model_LCYShi",
						id = "LCYShi",
						rotationX = 0,
						scale = 0.68,
						zorder = 50,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.27,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "LCYShi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "LCYShi/LCYShi_face_4.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "LCYShi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 64.2,
									y = 1144
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LCYShi"),
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
				action = "rock",
				actor = __getnode__(_root, "bg_xide"),
				args = function (_ctx)
					return {
						freq = 2,
						strength = 10
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"FightFor_dialog_speak_name_3"
						},
						content = {
							"eventstory_fightfor_01a_8"
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
						strength = 3
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
				actor = __getnode__(_root, "JSTDing"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LCYShi"),
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
					name = "FightFor_dialog_speak_name_8",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"JSTDing"
					},
					content = {
						"eventstory_fightfor_01a_9"
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
					name = "FightFor_dialog_speak_name_9",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"LCYShi"
					},
					content = {
						"eventstory_fightfor_01a_10"
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
			actor = __getnode__(_root, "JSTDing"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "LCYShi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_xide"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tiantai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_11"
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_CLMan",
						id = "CLMan",
						rotationX = 0,
						scale = 0.63,
						zorder = 52,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.67,
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
								scaleX = 1.08,
								scaleY = 1.08,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CLMan_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 77.5,
									y = 1045.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CLMan"),
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
						modelId = "Model_XLai",
						id = "XLai",
						rotationX = 0,
						scale = 0.76,
						zorder = 50,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.3,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "XLai_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "XLai/XLai_face_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "XLai_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 0.5,
									y = 899
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "XLai"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_weinasi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Ex_weinasi"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_tiantai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "XLai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan"),
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
		concurrent({
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
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_10",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"XLai"
						},
						content = {
							"eventstory_fightfor_01a_12"
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
					name = "FightFor_dialog_speak_name_11",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"CLMan"
					},
					content = {
						"eventstory_fightfor_01a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "XLai"),
				args = function (_ctx)
					return {
						duration = 0
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
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -250,
						refpt = {
							x = 0.47,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_11",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_fightfor_01a_14"
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_weinasi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "Ex_weinasi")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tiantai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_jiedao"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "EX_jiedao"),
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
		concurrent({
			rockScreen({
				args = function (_ctx)
					return {
						freq = 5,
						strength = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_juxiang"),
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
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_15"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_3.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		concurrent({
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_juxiang")
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_16"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_17"
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_XDE",
						id = "sfei",
						rotationX = 0,
						scale = 0.5,
						zorder = 70,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 1.29,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "what_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sfei/face_sfei_what_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1000,
								visible = true,
								id = "what_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -359.3,
									y = 1769.8
								}
							},
							{
								resType = 0,
								name = "sfei_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sfei/face_sfei_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1200,
								visible = true,
								id = "sfei_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -205.4,
									y = 1711.8
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sfei"),
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
						modelId = "Model_YSTLu",
						id = "YSTLu",
						rotationX = 0,
						scale = 1,
						zorder = 50,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = -0.6,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "YSTLu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "YSTLu/YSTLu_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "YSTLu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 50,
									y = 679
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YSTLu"),
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
		act({
			action = "moveTo",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0.51,
							y = 0.1
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						scale = 0.3,
						duration = 0.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.51,
								y = -0.4
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.5
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_tiantai"),
				args = function (_ctx)
					return {
						duration = 0.8,
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
				action = "scaleTo",
				actor = __getnode__(_root, "bg_tiantai"),
				args = function (_ctx)
					return {
						scale = 2,
						duration = 0.8
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_tiantai"),
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
			action = "moveTo",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0.51,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_weixian"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.59,
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
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_18"
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
			actor = __getnode__(_root, "xiao_gedang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = -0.1,
							y = 0.5
						}
					}
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "sfei"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -425,
								refpt = {
									x = 0.2,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_gedang"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "yin_maobeida"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "sfei"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -425,
								refpt = {
									x = 0.9,
									y = -0.1
								}
							}
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_19"
						},
						durations = {
							0.03
						}
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
			action = "hide",
			actor = __getnode__(_root, "xiao_gedang")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_maobeida")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_nvchaoxiao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = 0.15,
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_12",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"YSTLu"
						},
						content = {
							"eventstory_fightfor_01a_20"
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
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_21"
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
				actor = __getnode__(_root, "YSTLu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YSTLu/YSTLu_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_12",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"YSTLu"
						},
						content = {
							"eventstory_fightfor_01a_22"
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
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_01a_23"
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
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_dasheng"),
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
				action = "moveTo",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = 0.25,
								y = 0
							}
						}
					}
				end
			}),
			sequential({
				concurrent({
					act({
						action = "fadeIn",
						actor = __getnode__(_root, "kxyuan"),
						args = function (_ctx)
							return {
								duration = 0.15
							}
						end
					}),
					act({
						action = "scaleTo",
						actor = __getnode__(_root, "kxyuan"),
						args = function (_ctx)
							return {
								scale = 0.66,
								duration = 0.15
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "kxyuan"),
						args = function (_ctx)
							return {
								duration = 0.15,
								position = {
									x = 0,
									y = -425,
									refpt = {
										x = 0.51,
										y = 0
									}
								}
							}
						end
					})
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "YSTLu"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -285,
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
						actor = __getnode__(_root, "sfei"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -425,
									refpt = {
										x = 1,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "changeTexture",
						actor = __getnode__(_root, "what_face"),
						args = function (_ctx)
							return {
								resType = 0,
								image = "sfei/face_sfei_what_4.png",
								pathType = "STORY_FACE"
							}
						end
					}),
					act({
						action = "changeTexture",
						actor = __getnode__(_root, "sfei_face"),
						args = function (_ctx)
							return {
								resType = 0,
								image = "sfei/face_sfei_8.png",
								pathType = "STORY_FACE"
							}
						end
					})
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -285,
						refpt = {
							x = 0.18,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_24"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_25"
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
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sfei"),
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "YSTLu"),
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
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_01a_26"
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
			actor = __getnode__(_root, "YSTLu"),
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
			actor = __getnode__(_root, "kxyuan"),
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_27"
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
			actor = __getnode__(_root, "kxyuan"),
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
			actor = __getnode__(_root, "YSTLu"),
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
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_01a_28"
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
				actor = __getnode__(_root, "YSTLu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YSTLu/YSTLu_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_12",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"YSTLu"
						},
						content = {
							"eventstory_fightfor_01a_29"
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
			actor = __getnode__(_root, "YSTLu"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan"),
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_30"
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
			actor = __getnode__(_root, "kxyuan"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "YSTLu"),
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
				action = "play",
				actor = __getnode__(_root, "yin_nvgongji"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = 0.45,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_12",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"YSTLu"
						},
						content = {
							"eventstory_fightfor_01a_31"
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
			action = "stop",
			actor = __getnode__(_root, "yin_nvgongji")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YSTLu"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_jian1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian2"),
				args = function (_ctx)
					return {
						time = 1
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian1")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jian2")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.4,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian2"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.6,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_gedang")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian2"),
				args = function (_ctx)
					return {
						time = 1
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian1")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jian2")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.4,
							y = 0.3
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian2"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.6,
							y = 0.3
						}
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_gedang")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian2"),
				args = function (_ctx)
					return {
						time = 1
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian1")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jian2")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_gedang")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_gedang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.6,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSTLu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSTLu/YSTLu_face_3.png",
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "YSTLu"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_gun"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = -0.2,
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
					duration = 0.15
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "kxyuan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "kxyuan/face_kxyuan_2.png",
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
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0.15,
					position = {
						x = 0,
						y = -285,
						refpt = {
							x = 0.15,
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
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_01a_32"
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
			actor = __getnode__(_root, "YSTLu"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan"),
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_33"
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
			actor = __getnode__(_root, "kxyuan"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "YSTLu"),
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
			action = "changeTexture",
			actor = __getnode__(_root, "kxyuan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "kxyuan/face_kxyuan_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_01a_34"
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
			actor = __getnode__(_root, "YSTLu"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan"),
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_35"
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
			actor = __getnode__(_root, "kxyuan"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "YSTLu"),
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
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_01a_36"
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
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_01a_37"
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
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 1.2,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = -0.25,
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
				action = "fadeIn",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.35,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.51,
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
					duration = 0.35
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0.6,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_38"
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
			actor = __getnode__(_root, "kxyuan"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "sfei"),
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_01a_39"
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
				actor = __getnode__(_root, "yin_maopingdan"),
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
						name = "FightFor_dialog_speak_name_5",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_40"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0.26,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_maopingdan")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_41"
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
				action = "changeTexture",
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = -0.3,
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
					duration = 0.4
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 1.2,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "what_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sfei/face_sfei_what_5.png",
					pathType = "STORY_FACE"
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
				action = "fadeIn",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.85,
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_01a_42"
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
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.24,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
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
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_43"
						},
						durations = {
							0.03
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_44"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_45"
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_46"
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
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_maojingya"),
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
						name = "FightFor_dialog_speak_name_5",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_47"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_48"
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_49"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_maojingya"),
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
						name = "FightFor_dialog_speak_name_13",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan",
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_50"
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_51"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_52"
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_maopingdan"),
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
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_53"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_01a_54"
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_55"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_56"
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_01a_57"
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
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0.81,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing8",
						id = "GCZi",
						rotationX = 0,
						scale = 1,
						zorder = 80,
						position = {
							x = 0,
							y = -100,
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "GCZi"),
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
				actor = __getnode__(_root, "GCZi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "GCZi"),
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
			actor = __getnode__(_root, "bg_jiedao"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "EX_jiedao")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_yuxu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "EX_yuxu"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_yuxu"),
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
					name = "FightFor_dialog_speak_name_7",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"GCZi"
					},
					content = {
						"eventstory_fightfor_01a_58"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_59"
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
					name = "FightFor_dialog_speak_name_7",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"GCZi"
					},
					content = {
						"eventstory_fightfor_01a_60"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_61"
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
						name = "FightFor_dialog_speak_name_7",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"GCZi"
						},
						content = {
							"eventstory_fightfor_01a_62"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_01a_63"
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
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "GCZi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "EX_yuxu")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_yuxu")
		})
	})
end

local function eventstory_fightfor_01a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_fightfor_01a",
					scene = scene_eventstory_fightfor_01a
				}
			end
		})
	})
end

stories.eventstory_fightfor_01a = eventstory_fightfor_01a

return _M
