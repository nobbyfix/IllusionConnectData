local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_wish_02b")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_wish_02b = {
	actions = {}
}
scenes.scene_eventstory_wish_02b = scene_eventstory_wish_02b

function scene_eventstory_wish_02b:stage(args)
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
						name = "bg_vns",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_0_2.jpg",
						layoutMode = 1,
						zorder = 75,
						id = "bg_vns",
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
								zorder = 10,
								visible = true,
								id = "bgEx_wns",
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
						name = "bg_shuaisui",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_0_3.jpg",
						layoutMode = 1,
						zorder = 75,
						id = "bg_shuaisui",
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
								id = "bgEx_shuaisui",
								scale = 1,
								actionName = "all_wnsxjsnTwo",
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
				resType = 0,
				name = "zhuanchang",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 10000,
				id = "zhuanchang",
				scale = 1,
				anchorPoint = {
					x = 1,
					y = 0.5
				},
				position = {
					refpt = {
						x = 1,
						y = 0.5
					}
				}
			},
			{
				resType = 0,
				name = "zuoyan",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "bm.png",
				scaleX = 0.08,
				scaleY = 0.1,
				zorder = 10001,
				layoutMode = 1,
				id = "zuoyan",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.45,
						y = 0.7
					}
				},
				children = {
					{
						resType = 0,
						name = "zuoyankuang",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "story_eye_4.png",
						scaleX = 0.85,
						scaleY = 0.78,
						zorder = 50,
						layoutMode = 1,
						id = "zuoyankuang",
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
				name = "youyan",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "bm.png",
				scaleX = 0.08,
				scaleY = 0.1,
				zorder = 10001,
				layoutMode = 1,
				id = "youyan",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.55,
						y = 0.7
					}
				},
				children = {
					{
						resType = 0,
						name = "youyankuang",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "story_eye_4.png",
						scaleX = 0.85,
						scaleY = 0.78,
						zorder = 50,
						layoutMode = 1,
						id = "youyankuang",
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
				id = "Mus_meihao",
				fileName = "Mus_Story_NewYear",
				type = "Music"
			},
			{
				id = "Mus_nengli",
				fileName = "Mus_Story_Girl_Main_Precipitano",
				type = "Music"
			},
			{
				id = "yin_posui",
				fileName = "Se_Story_SilentNight_Smash",
				type = "Sound"
			},
			{
				id = "yin_yanpaoxiao",
				fileName = "Se_Story_ZSHHun_Monster",
				type = "Sound"
			},
			{
				id = "yin_beilierzou",
				fileName = "Se_Story_Step",
				type = "Sound"
			},
			{
				id = "yin_mowanou",
				fileName = "Voice_Story_CLMan_04",
				type = "Sound"
			},
			{
				id = "yin_tongyi",
				fileName = "Voice_Story_CLMan_03",
				type = "Sound"
			},
			{
				id = "yin_ninataopao",
				fileName = "Se_Story_SilentNight_Running",
				type = "Sound"
			},
			{
				id = "yin_ludaofuxingfen",
				fileName = "Se_Story_SilentNight_Happy",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_nina",
				scale = 2.5,
				actionName = "qiangpao_gongji_juqing",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.4,
						y = 0.6
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_guangmang1",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.7,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_guangmang2",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.6,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_guangmang3",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.8,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_guangmang4",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.7,
						y = 0.6
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_wish_02b.actions.start_eventstory_wish_02b(_root, args)
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
			actor = __getnode__(_root, "hm"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_vns"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_wns"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_meihao"),
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SNGLSi_single",
						id = "bni",
						rotationX = 0,
						scale = 0.75,
						zorder = 250,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.85,
								y = -0.3
							}
						},
						children = {
							{
								resType = 0,
								name = "bni_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/face_bni_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "bni_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 0,
									y = 898
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "bni"),
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
						modelId = "Model_SNGLSi_Rudolph",
						id = "xunlu",
						rotationX = 0,
						scale = 0.4,
						zorder = 300,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.5,
								y = -0.3
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xunlu"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "xunlu"),
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
						modelId = "Model_Story_SNGLSi_Elk2",
						id = "mengchong",
						rotationX = 0,
						scale = 0.4,
						zorder = 300,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.3,
								y = -0.3
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "mengchong"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "mengchong"),
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
						modelId = "Model_Story_SNGLSi_Elk3",
						id = "wuzhe",
						rotationX = 0,
						scale = 0.4,
						zorder = 300,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.1,
								y = -0.3
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "wuzhe"),
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
						modelId = "Model_Story_CLMan",
						id = "CLMan",
						rotationX = 0,
						scale = 0.63,
						zorder = 350,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CLMan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "CLMan/CLMan_face_2.png",
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
									x = 77.5,
									y = 1045.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "CLMan"),
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
				actor = __getnode__(_root, "CLMan"),
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_BLTu1",
						id = "BLTu",
						rotationX = 0,
						scale = 0.75,
						zorder = 100,
						position = {
							x = 0,
							y = -400,
							refpt = {
								x = 1,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "BLTu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "BLTu/BLTu_face_2.png",
								scaleX = 1.3,
								scaleY = 1.3,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "BLTu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 50.3,
									y = 1218.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BLTu"),
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
						modelId = "Model_SNGLSi_Rudolph",
						id = "ldfu",
						rotationX = 0,
						scale = 0.4,
						zorder = 300,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 1.2,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ldfu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/face_bni_rudolph_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1000,
								visible = true,
								id = "ldfu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -84.7,
									y = 384.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_11.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "BLTu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "BLTu/BLTu_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BLTu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = 0.44,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -250,
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
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					scale = 0.4,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = 180,
						refpt = {
							x = 0.7,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BLTu"),
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
		concurrent({
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
				action = "moveTo",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.77,
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
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_02_43"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
					name = "MyWish_dialog_speak_name_15",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BLTu"
					},
					content = {
						"eventstory_wish_02_44"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
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
						image = "CLMan/CLMan_face_13.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_02_45"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
					name = "MyWish_dialog_speak_name_15",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BLTu"
					},
					content = {
						"eventstory_wish_02_46"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
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
						image = "CLMan/CLMan_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_02_47"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
			actor = __getnode__(_root, "bni"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -280,
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BLTu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ldfu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_rudolph_4.png",
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
			action = "play",
			actor = __getnode__(_root, "Mus_meihao"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
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
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "CLMan"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldfu"),
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
					name = "MyWish_dialog_speak_name_1",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"bni",
						"ldfu"
					},
					content = {
						"eventstory_wish_02_48"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ldfu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_rudolph_4.png",
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
						image = "CLMan/CLMan_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_1",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"bni",
							"ldfu"
						},
						content = {
							"eventstory_wish_02_49"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.23,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_02_50"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ldfu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_rudolph_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_1",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"bni",
							"ldfu"
						},
						content = {
							"eventstory_wish_02_51"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_13.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_02_52"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_wish_02_53"
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_tongyi"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_02_54"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
			actor = __getnode__(_root, "Mus_meihao")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_tongyi")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "bgEx_shuaisui")
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
			actor = __getnode__(_root, "bni"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		})
	})
end

local function eventstory_wish_02b(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_wish_02b",
					scene = scene_eventstory_wish_02b
				}
			end
		})
	})
end

stories.eventstory_wish_02b = eventstory_wish_02b

return _M
