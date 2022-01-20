local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_gohome_03b")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_gohome_03b = {
	actions = {}
}
scenes.scene_eventstory_gohome_03b = scene_eventstory_gohome_03b

function scene_eventstory_gohome_03b:stage(args)
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
						name = "bg_guanchouhai",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_family.jpg",
						layoutMode = 1,
						zorder = 150,
						id = "bg_guanchouhai",
						scale = 2.15,
						anchorPoint = {
							x = 0.5,
							y = 0.5
						},
						position = {
							refpt = {
								x = -0.05,
								y = 0.5
							}
						}
					},
					{
						resType = 0,
						name = "bg_nianshou",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_family.jpg",
						layoutMode = 1,
						zorder = 145,
						id = "bg_nianshou",
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
				name = "g_zhedang",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 20000,
				id = "g_zhedang",
				scale = 3,
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
				name = "g_yin",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 15000,
				id = "g_yin",
				scale = 3,
				anchorPoint = {
					x = 1,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0,
						y = 0.5
					}
				}
			},
			{
				resType = 0,
				name = "g_yang",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "bm.png",
				layoutMode = 1,
				zorder = 15000,
				id = "g_yang",
				scale = 3,
				anchorPoint = {
					x = 0,
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
				name = "g_yanda",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "story_eye_2.png",
				layoutMode = 1,
				zorder = 25,
				id = "g_yanda",
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
				name = "g_yanxiao",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "story_eye_3.png",
				layoutMode = 1,
				zorder = 30,
				id = "g_yanxiao",
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
				id = "Mus_zhandou",
				fileName = "Mus_Battle_Family",
				type = "Music"
			},
			{
				id = "Mus_guiyi",
				fileName = "Mus_Story_Halloween_1",
				type = "Music"
			},
			{
				id = "yin_posui",
				fileName = "Se_Story_Glass_Broken",
				type = "Sound"
			},
			{
				id = "yin_nianshou",
				fileName = "Se_Story_Family_Bellow",
				type = "Sound"
			},
			{
				id = "yin_chuqiao",
				fileName = "Se_Story_Family_Sword",
				type = "Sound"
			},
			{
				id = "yin_gedang",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				id = "yin_bingyu",
				fileName = "Se_Story_SilentNight_Happy",
				type = "Sound"
			},
			{
				id = "yin_zhenfa",
				fileName = "Se_Story_Family_Magic",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 8000,
				visible = false,
				id = "xiao_nianshou",
				scale = 1.6,
				actionName = "skill3_SLMen",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = -0.8,
						y = 0
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1350,
				visible = false,
				id = "xiao_hudun",
				scale = 0.3,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.1,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 4000,
				visible = false,
				id = "xiao_yanlei",
				scale = 0.5,
				actionName = "shiguang_juqingshiguang",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					x = 0.5,
					y = 0.5
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_gohome_03b.actions.start_eventstory_gohome_03b(_root, args)
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
			actor = __getnode__(_root, "bg_guanchouhai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_nianshou"),
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
						modelId = "Model_LDYu",
						id = "hdu",
						rotationX = 0,
						scale = 0.55,
						zorder = 210,
						position = {
							x = 0,
							y = -370,
							refpt = {
								x = 0.52,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "hdu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "hdu/face_hdu_8.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "hdu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 57,
									y = 1465
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "hdu"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "hdu"),
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
			action = "play",
			actor = __getnode__(_root, "Mus_zhandou"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_BYu_single",
						id = "byu",
						rotationX = 0,
						scale = 0.5,
						zorder = 200,
						position = {
							x = 0,
							y = -290,
							refpt = {
								x = 0.49,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "byu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "byu/face_byu_4.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "byu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 25.5,
									y = 1372
								}
							},
							{
								resType = 0,
								name = "byu_face2",
								pathType = "STORY_FACE",
								type = "Image",
								image = "byu/face_byu_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1000,
								visible = true,
								id = "byu_face2",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 25.5,
									y = 1372
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "byu"),
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
						modelId = "Model_XHe_single",
						id = "xhe",
						rotationX = 0,
						scale = 0.5,
						zorder = 220,
						position = {
							x = 0,
							y = -385,
							refpt = {
								x = 0.23,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "xhe_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "xhe/face_xhe_4.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "xhe_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -56.2,
									y = 1665
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xhe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xhe/face_xhe_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "hdu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -370,
						refpt = {
							x = 0.72,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xhe"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -385,
						refpt = {
							x = 0.32,
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "hdu"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.25
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xhe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xhe/face_xhe_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xhe"
						},
						content = {
							"eventstory_gohome_03_29"
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
					name = "GoHome_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xhe"
					},
					content = {
						"eventstory_gohome_03_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_nianshou"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_nianshou"),
			args = function (_ctx)
				return {
					time = 1
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
					duration = 0.8
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
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 0.7
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
			actor = __getnode__(_root, "yin_gedang"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 0.7
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
			actor = __getnode__(_root, "yin_gedang"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 0.7
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
			action = "changeTexture",
			actor = __getnode__(_root, "xhe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xhe/face_xhe_10.png",
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
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_nianshou")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_nianshou")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "GoHome_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xhe"
					},
					content = {
						"eventstory_gohome_03_31"
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
					name = "GoHome_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_03_32"
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
				actor = __getnode__(_root, "hdu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_guanchouhai"),
				args = function (_ctx)
					return {
						duration = 0.25
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
			action = "play",
			actor = __getnode__(_root, "yin_nianshou"),
			args = function (_ctx)
				return {
					time = 1
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
			actor = __getnode__(_root, "yin_zhenfa"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 0.7
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 0.7
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
		sleep({
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "xhe"),
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
			actor = __getnode__(_root, "xhe"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -385,
						refpt = {
							x = 0.28,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					zorder = 100
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "xhe"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "hdu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xhe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xhe/face_xhe_10.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "byu_face2"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "byu/face_byu_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_nianshou"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_guanchouhai"),
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
					name = "GoHome_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_03_33"
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
					name = "GoHome_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xhe"
					},
					content = {
						"eventstory_gohome_03_34"
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
					name = "GoHome_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_03_35"
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
					name = "GoHome_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xhe"
					},
					content = {
						"eventstory_gohome_03_36"
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
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -385,
							refpt = {
								x = 0.13,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "hdu"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -370,
							refpt = {
								x = 0.77,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "byu"),
				args = function (_ctx)
					return {
						duration = 0.3
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
					name = "GoHome_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"byu"
					},
					content = {
						"eventstory_gohome_03_37"
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
					name = "GoHome_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xhe"
					},
					content = {
						"eventstory_gohome_03_38"
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
				actor = __getnode__(_root, "byu_face2"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "byu/face_byu_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"byu"
						},
						content = {
							"eventstory_gohome_03_39"
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
					duration = 0.25
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
			action = "moveTo",
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -290,
						refpt = {
							x = 0.24,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "hdu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -370,
						refpt = {
							x = 0.77,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "xhe"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "byu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "byu/face_byu_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_zhanhou"),
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
					duration = 0.25
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
					name = "GoHome_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"byu"
					},
					content = {
						"eventstory_gohome_03_40"
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
					name = "GoHome_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_03_41"
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
				actor = __getnode__(_root, "byu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "byu/face_byu_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"byu"
						},
						content = {
							"eventstory_gohome_03_42"
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
					name = "GoHome_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_03_43"
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
					name = "GoHome_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"byu"
					},
					content = {
						"eventstory_gohome_03_44"
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
					duration = 0.25
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgImage = "gallery_album_01.jpg",
					printAudioOff = true,
					bgShow = false,
					center = 1,
					content = {
						"eventstory_gohome_03_45"
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
			action = "changeTexture",
			actor = __getnode__(_root, "byu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "byu/face_byu_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -290,
						refpt = {
							x = 0.49,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "hdu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -370,
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
			actor = __getnode__(_root, "hdu"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "hdu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "g_yanxiao"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "g_yanda"),
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yanxiao"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yanda"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.7
				}
			end
		}),
		sequential({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.6
					}
				end
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "g_yanda"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "g_yanxiao"),
					args = function (_ctx)
						return {
							duration = 0.3
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yanxiao"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yanda"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.7
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "GoHome_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_gohome_03_46"
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
			action = "stop",
			actor = __getnode__(_root, "Mus_zhanhou")
		}),
		concurrent({
			act({
				action = "opacityTo",
				actor = __getnode__(_root, "hdu"),
				args = function (_ctx)
					return {
						valend = 0,
						duration = 0.8
					}
				end
			}),
			act({
				action = "opacityTo",
				actor = __getnode__(_root, "hdu_face"),
				args = function (_ctx)
					return {
						valend = 0,
						duration = 0.6
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
			actor = __getnode__(_root, "xiao_yanlei"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "GoHome_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_gohome_03_47"
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
			actor = __getnode__(_root, "Mus_guiyi"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		sequential({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "g_yanda"),
					args = function (_ctx)
						return {
							duration = 0.05
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "g_yanxiao"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				})
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yanxiao"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yanda"),
			args = function (_ctx)
				return {
					duration = 0.07
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
		sequential({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "g_yanda"),
					args = function (_ctx)
						return {
							duration = 0.05
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "g_yanxiao"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				})
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
			action = "updateNode",
			actor = __getnode__(_root, "hdu"),
			args = function (_ctx)
				return {
					opacity = 1
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "hdu_face"),
			args = function (_ctx)
				return {
					opacity = 1
				}
			end
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yanxiao"),
			args = function (_ctx)
				return {
					duration = 0.15
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yanda"),
			args = function (_ctx)
				return {
					duration = 0.1
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
					name = "GoHome_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_gohome_03_48"
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
			actor = __getnode__(_root, "byu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "byu/face_byu_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			sequential({
				concurrent({
					act({
						action = "opacityTo",
						actor = __getnode__(_root, "hdu"),
						args = function (_ctx)
							return {
								valend = 0,
								duration = 0.8
							}
						end
					}),
					act({
						action = "opacityTo",
						actor = __getnode__(_root, "hdu_face"),
						args = function (_ctx)
							return {
								valend = 0,
								duration = 0.6
							}
						end
					})
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_yanlei"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				})
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_11",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {},
						content = {
							"eventstory_gohome_03_49"
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
			actor = __getnode__(_root, "xiao_yanlei")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "hdu"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "Mus_guiyi")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		})
	})
end

local function eventstory_gohome_03b(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_gohome_03b",
					scene = scene_eventstory_gohome_03b
				}
			end
		})
	})
end

stories.eventstory_gohome_03b = eventstory_gohome_03b

return _M
