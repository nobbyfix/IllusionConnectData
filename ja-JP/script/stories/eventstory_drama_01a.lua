local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_drama_01a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_drama_01a = {
	actions = {}
}
scenes.scene_eventstory_drama_01a = scene_eventstory_drama_01a

function scene_eventstory_drama_01a:stage(args)
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
						name = "bg_yuanjing",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_drama.jpg",
						layoutMode = 1,
						zorder = 130,
						id = "bg_yuanjing",
						scale = 1.2,
						anchorPoint = {
							x = 0.5,
							y = 0.5
						},
						position = {
							refpt = {
								x = 0.35,
								y = 0.5
							}
						},
						children = {
							{
								layoutMode = 1,
								type = "MovieClip",
								zorder = 10,
								visible = true,
								id = "bgEx_drama",
								scale = 1,
								actionName = "bg_gudianxijuchangjing",
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
						zorder = 200,
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
						name = "bg_juyuan",
						pathType = "SCENE",
						type = "Image",
						image = "img_story_drama_3.jpg",
						layoutMode = 1,
						zorder = 100,
						id = "bg_juyuan",
						scale = 1,
						anchorPoint = {
							x = 0.5,
							y = 0.5
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
				name = "zuomubu",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 999999,
				id = "zuomubu",
				scale = 1,
				anchorPoint = {
					x = 1,
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
				name = "youmubu",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 999999,
				id = "youmubu",
				scale = 1,
				anchorPoint = {
					x = 0,
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
				id = "Mus_zhutiyinyue",
				fileName = "Mus_Story_Drama_Main",
				type = "Music"
			},
			{
				id = "Mus_chuyu",
				fileName = "Mus_Story_Drama_Farewell",
				type = "Music"
			},
			{
				id = "yin_zhangsheng",
				fileName = "Se_Story_Drama_applause",
				type = "Sound"
			},
			{
				id = "yin_shanliangdengchang",
				fileName = "Se_Story_Hit_Anna_Dizz",
				type = "Sound"
			},
			{
				id = "yin_pailian",
				fileName = "Se_Story_Drama_rehearsal",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_shanliangdengchangzuo",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.3,
						y = 0.7
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_shanliangdengchangyou",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.7,
						y = 0.7
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_shanliangdengchangzhong1",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.4,
						y = 0.4
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_shanliangdengchangzhong2",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.6,
						y = 0.6
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_drama_01a.actions.start_eventstory_drama_01a(_root, args)
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
						"eventstory_drama_01a_1",
						"eventstory_drama_01a_2",
						"eventstory_drama_01a_3",
						"eventstory_drama_01a_4"
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SSBYa",
						id = "kptwei",
						rotationX = 0,
						scale = 0.5,
						zorder = 150,
						position = {
							x = 0,
							y = -220,
							refpt = {
								x = 0.6,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "kptwei_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "kptwei/face_kptwei_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "kptwei_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -193,
									y = 1385
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "kptwei"),
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
						modelId = "Model_CKFSJi",
						id = "mke",
						rotationX = 0,
						scale = 0.5,
						zorder = 120,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.51,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "mke_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "mke/face_mke_7.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "mke_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -27,
									y = 1589
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "mke"),
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
						id = "JYing1",
						rotationX = 0,
						scale = 1,
						zorder = 100,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.52,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JYing1"),
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
						id = "JYing6",
						rotationX = 0,
						scale = 0.75,
						zorder = 100,
						position = {
							x = 0,
							y = -270,
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
				actor = __getnode__(_root, "JYing6"),
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
						modelId = "Model_Story_JYing2",
						id = "JYing2",
						rotationX = 0,
						scale = 0.88,
						zorder = 100,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.37,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JYing2"),
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
						modelId = "Model_Enemy_MYKSi",
						id = "mengyan",
						rotationX = 0,
						scale = 0.4,
						zorder = 100,
						position = {
							x = 0,
							y = 75,
							refpt = {
								x = 0.52,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "mengyan"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_yuanjing"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_drama"),
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
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "kptwei"),
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
				actor = __getnode__(_root, "JYing1"),
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
				action = "moveTo",
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -340,
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
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "JYing1"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -280,
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
				actor = __getnode__(_root, "JYing6"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 1,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -220,
							refpt = {
								x = 0,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_zhutiyinyue"),
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
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg_yuanjing"),
			args = function (_ctx)
				return {
					duration = 3.5,
					position = {
						refpt = {
							x = 0.65,
							y = 0.5
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
					name = "IrisL_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"IrisL_dialog_speak_name_1"
					},
					content = {
						"eventstory_drama_01a_5"
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
					duration = 2
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_yuanjing"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_yuanjing"),
				args = function (_ctx)
					return {
						duration = 2,
						position = {
							refpt = {
								x = 0.35,
								y = 0.6
							}
						}
					}
				end
			})
		}),
		sequential({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"IrisL_dialog_speak_name_1"
						},
						content = {
							"eventstory_drama_01a_6"
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
			actor = __getnode__(_root, "bg_juyuan"),
			args = function (_ctx)
				return {
					duration = 0
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_yuanjing"),
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
		concurrent({
			act({
				action = "stop",
				actor = __getnode__(_root, "Mus_zhutiyinyue")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_pailian"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.75,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "mke"),
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
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_01a_7"
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
					name = "IrisL_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mke"
					},
					content = {
						"eventstory_drama_01a_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "mke"),
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
				actor = __getnode__(_root, "JYing1"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -280,
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
				actor = __getnode__(_root, "JYing1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "JYing6"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.75,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing6"),
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
						name = "IrisL_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"JYing1",
							"JYing6"
						},
						content = {
							"eventstory_drama_01a_9"
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
				actor = __getnode__(_root, "JYing1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "JYing6"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "mke"),
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
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -220,
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
						name = "IrisL_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_01a_10"
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
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_01a_11"
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
					name = "IrisL_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"kptwei"
					},
					content = {
						"eventstory_drama_01a_12"
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
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_01a_13"
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
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "kptwei"),
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing6"),
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
					name = "IrisL_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JYing1",
						"JYing6"
					},
					content = {
						"eventstory_drama_01a_14"
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
				actor = __getnode__(_root, "JYing1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "JYing6"),
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "mke"),
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
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_01a_15"
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
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "mke"),
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing6"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -220,
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
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -340,
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
					name = "IrisL_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JYing1",
						"JYing6"
					},
					content = {
						"eventstory_drama_01a_16"
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
				actor = __getnode__(_root, "JYing1"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -280,
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
				actor = __getnode__(_root, "JYing6"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "JYing1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "JYing6"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_juyuan"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_juyuan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.85,
								y = 0.55
							}
						}
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "zuomubu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "youmubu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "JYing2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
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
				actor = __getnode__(_root, "JYing2"),
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
						modelId = "Model_GJMYan",
						id = "lamuzuo",
						rotationX = 0,
						scale = 0.4,
						zorder = 9999999,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.52,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lamuzuo"),
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
						modelId = "Model_GJMYan",
						id = "lamuyou",
						rotationX = 0,
						scale = 0.4,
						zorder = 9999999,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.52,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "lamuyou"),
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
						modelId = "Model_GJMYan",
						id = "yanyuanyan",
						rotationX = 0,
						scale = 0.4,
						zorder = 9999999,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "yanyuanyan"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "lamuzuo"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "lamuyou"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lamuzuo"),
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
				actor = __getnode__(_root, "lamuzuo"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = -0.1,
								y = 0.8
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lamuyou"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 1.1,
								y = 0.8
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lamuzuo"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lamuyou"),
				args = function (_ctx)
					return {
						duration = 0
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
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_pailian")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_zhutiyinyue"),
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
					name = "IrisL_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"IrisL_dialog_speak_name_1"
					},
					content = {
						"eventstory_drama_01a_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.08,
									y = 0.5
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.26,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.44,
									y = 0.05
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.62,
									y = 0.24
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.8,
									y = 0.5
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.24,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.28,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.32,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.36,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.4,
							duration = 0.18
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.92,
									y = 0.5
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.74,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.56,
									y = 0.05
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.38,
									y = 0.24
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.2,
									y = 0.5
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.24,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.28,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.32,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.36,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.4,
							duration = 0.18
						}
					end
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.75
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lamuzuo"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lamuyou"),
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
					duration = 0.25
				}
			end
		}),
		sequential({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.3,
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
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								refpt = {
									x = 0.4,
									y = 0.5
								}
							}
						}
					end
				})
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.6,
							position = {
								refpt = {
									x = 1.1,
									y = 0.5
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.6,
							position = {
								refpt = {
									x = -0.1,
									y = 0.5
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "zuomubu"),
					args = function (_ctx)
						return {
							duration = 0.6,
							position = {
								refpt = {
									x = 0,
									y = 0.5
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "youmubu"),
					args = function (_ctx)
						return {
							duration = 0.6,
							position = {
								refpt = {
									x = 1,
									y = 0.5
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
					duration = 0.8
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "IrisL_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"IrisL_dialog_speak_name_1"
					},
					content = {
						"eventstory_drama_01a_18"
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
					name = "IrisL_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"IrisL_dialog_speak_name_1"
					},
					content = {
						"eventstory_drama_01a_19"
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
				actor = __getnode__(_root, "JYing2"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing2"),
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
					name = "IrisL_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JYing2"
					},
					content = {
						"eventstory_drama_01a_20"
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
					name = "IrisL_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JYing2"
					},
					content = {
						"eventstory_drama_01a_21"
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
			actor = __getnode__(_root, "JYing2"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -300,
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
			actor = __getnode__(_root, "JYing2"),
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
					name = "IrisL_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"IrisL_dialog_speak_name_1"
					},
					content = {
						"eventstory_drama_01a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		sequential({
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 1,
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
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 1,
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
					actor = __getnode__(_root, "zuomubu"),
					args = function (_ctx)
						return {
							duration = 1,
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
					action = "moveTo",
					actor = __getnode__(_root, "youmubu"),
					args = function (_ctx)
						return {
							duration = 1,
							position = {
								refpt = {
									x = 0.5,
									y = 0.5
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
					duration = 1
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
			actor = __getnode__(_root, "zuomubu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "youmubu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "lamuyou"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "lamuzuo"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_juyuan"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_juyuan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.5,
								y = 1
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.78,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -220,
							refpt = {
								x = 0.2,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "mengyan"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = 75,
						refpt = {
							x = 0.5,
							y = -0.2
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
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_01a_23"
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
						name = "IrisL_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_01a_24"
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
				actor = __getnode__(_root, "mke"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.75,
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
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_01a_25"
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
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_01a_26"
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
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_01a_27"
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
					name = "IrisL_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"kptwei"
					},
					content = {
						"eventstory_drama_01a_28"
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
					name = "IrisL_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"kptwei"
					},
					content = {
						"eventstory_drama_01a_29"
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
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_01a_30"
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
				action = "scaleTo",
				actor = __getnode__(_root, "lamuzuo"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "lamuyou"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lamuzuo"),
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
				actor = __getnode__(_root, "lamuyou"),
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
				actor = __getnode__(_root, "lamuzuo"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = -0.1,
								y = 0.8
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "lamuyou"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 1.1,
								y = 0.8
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lamuzuo"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "lamuyou"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "yanyuanyan"),
				args = function (_ctx)
					return {
						scale = 0.45,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "yanyuanyan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.5,
								y = -0.1
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_01a_31"
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
				actor = __getnode__(_root, "kptwei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kptwei/face_kptwei_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"kptwei"
						},
						content = {
							"eventstory_drama_01a_32"
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
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "mke"),
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
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.08,
									y = 0.5
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.26,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.44,
									y = 0.05
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.62,
									y = 0.24
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.8,
									y = 0.5
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.24,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.28,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.32,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.36,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							scale = 0.4,
							duration = 0.18
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.92,
									y = 0.5
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.74,
									y = 0.25
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.56,
									y = 0.05
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.38,
									y = 0.24
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							duration = 0.18,
							position = {
								refpt = {
									x = 0.2,
									y = 0.5
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.24,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.28,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.32,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.36,
							duration = 0.18
						}
					end
				}),
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							scale = 0.4,
							duration = 0.18
						}
					end
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.9
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lamuzuo"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "lamuyou"),
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
					duration = 0.2
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							deltaAngle = 5,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							deltaAngle = 0,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							deltaAngle = -5,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							deltaAngle = 0,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							deltaAngle = 5,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							deltaAngle = 0,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							deltaAngle = -5,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuzuo"),
					args = function (_ctx)
						return {
							deltaAngle = 0,
							duration = 0.1
						}
					end
				})
			}),
			sequential({
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							deltaAngle = -5,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							deltaAngle = 0,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							deltaAngle = 5,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							deltaAngle = 0,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							deltaAngle = -5,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							deltaAngle = 0,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							deltaAngle = 5,
							duration = 0.1
						}
					end
				}),
				act({
					action = "rotateBy",
					actor = __getnode__(_root, "lamuyou"),
					args = function (_ctx)
						return {
							deltaAngle = 0,
							duration = 0.1
						}
					end
				})
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "yanyuanyan"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			sequential({
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "yanyuanyan"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									refpt = {
										x = 0.5,
										y = 0.6
									}
								}
							}
						end
					}),
					act({
						action = "scaleTo",
						actor = __getnode__(_root, "yanyuanyan"),
						args = function (_ctx)
							return {
								scale = 0.5,
								duration = 0.2
							}
						end
					})
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "yanyuanyan"),
						args = function (_ctx)
							return {
								duration = 0.1,
								position = {
									refpt = {
										x = 0.5,
										y = 0.3
									}
								}
							}
						end
					}),
					act({
						action = "scaleTo",
						actor = __getnode__(_root, "yanyuanyan"),
						args = function (_ctx)
							return {
								scale = 0.45,
								duration = 0.1
							}
						end
					})
				})
			})
		}),
		concurrent({
			act({
				action = "rock",
				actor = __getnode__(_root, "yanyuanyan"),
				args = function (_ctx)
					return {
						freq = 4,
						strength = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_shanliangdengchangzhong1"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_shanliangdengchangzhong2"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_shanliangdengchang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_shanliangdengchangzuo"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_shanliangdengchangyou"),
				args = function (_ctx)
					return {
						time = -1
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
				action = "hide",
				actor = __getnode__(_root, "xiao_shanliangdengchangzhong2")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_shanliangdengchangzhong1")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_shanliangdengchangzuo")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_shanliangdengchangyou")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_shanliangdengchang")
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "yanyuanyan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "lamuzuo"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "lamuyou"),
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "kptwei"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "mke"),
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
				actor = __getnode__(_root, "mke_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "mke/face_mke_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "IrisL_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mke"
						},
						content = {
							"eventstory_drama_01a_33"
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
					name = "IrisL_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mke"
					},
					content = {
						"eventstory_drama_01a_34"
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
					name = "IrisL_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"kptwei"
					},
					content = {
						"eventstory_drama_01a_35"
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
					name = "IrisL_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"mke"
					},
					content = {
						"eventstory_drama_01a_36"
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
			actor = __getnode__(_root, "Mus_zhutiyinyue")
		})
	})
end

local function eventstory_drama_01a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_drama_01a",
					scene = scene_eventstory_drama_01a
				}
			end
		})
	})
end

stories.eventstory_drama_01a = eventstory_drama_01a

return _M
