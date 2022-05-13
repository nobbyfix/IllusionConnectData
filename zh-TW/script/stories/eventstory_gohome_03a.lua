local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_gohome_03a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_gohome_03a = {
	actions = {}
}
scenes.scene_eventstory_gohome_03a = scene_eventstory_gohome_03a

function scene_eventstory_gohome_03a:stage(args)
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
								y = 0.1
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

function scene_eventstory_gohome_03a.actions.start_eventstory_gohome_03a(_root, args)
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
				action = "fadeOut",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.8
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_guanchouhai"),
				args = function (_ctx)
					return {
						duration = 0.9,
						position = {
							refpt = {
								x = -0.05,
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
			action = "fadeIn",
			actor = __getnode__(_root, "hdu"),
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
					name = "GoHome_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_03_1"
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
						modelId = "Model_BYu_single",
						id = "byu",
						rotationX = 0,
						scale = 0.5,
						zorder = 200,
						position = {
							x = 0,
							y = -290,
							refpt = {
								x = 0.76,
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
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "byu"),
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
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "byu"),
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
						"eventstory_gohome_03_2"
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
						"eventstory_gohome_03_3"
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
						image = "byu/face_byu_5.png",
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
							"eventstory_gohome_03_4"
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
				action = "changeTexture",
				actor = __getnode__(_root, "byu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "byu/face_byu_1.png",
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
							"eventstory_gohome_03_5"
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
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -385,
							refpt = {
								x = 0.27,
								y = 0
							}
						}
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
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xhe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xhe/face_xhe_8.png",
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
							"eventstory_gohome_03_6"
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
				actor = __getnode__(_root, "byu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "byu/face_byu_4.png",
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
							"eventstory_gohome_03_7"
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
			actor = __getnode__(_root, "byu"),
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
					name = "GoHome_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_03_8"
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
						name = "GoHome_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"hdu"
						},
						content = {
							"eventstory_gohome_03_9"
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
			actor = __getnode__(_root, "hdu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "bg_guanchouhai"),
			args = function (_ctx)
				return {
					zorder = 140
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_posui"),
			args = function (_ctx)
				return {
					time = 1
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
				action = "scaleTo",
				actor = __getnode__(_root, "bg_nianshou"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 1.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_nianshou"),
				args = function (_ctx)
					return {
						duration = 1.5,
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
					duration = 1.5
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_nianshou"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 0.8
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 0.8
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_22",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {},
						content = {
							"eventstory_gohome_03_10"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 0.8
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 0.8
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
			actor = __getnode__(_root, "bg_nianshou"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "hdu"),
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
		sequential({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "Mus_zhandou")
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
				actor = __getnode__(_root, "g_zhedang"),
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
						duration = 0.5
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
							"eventstory_gohome_03_11"
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "GoHome_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_gohome_03_12"
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
						modelId = "Model_XHe_Sword",
						id = "xianjian1",
						rotationX = 0,
						scale = 0.45,
						zorder = 300,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.3,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xianjian1"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xianjian1"),
				args = function (_ctx)
					return {
						deltaAngle = -15,
						duration = 0
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
						modelId = "Model_XHe_Sword",
						id = "xianjian2",
						rotationX = 0,
						scale = 0.45,
						zorder = 300,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.35,
								y = 0.15
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xianjian2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xianjian2"),
				args = function (_ctx)
					return {
						deltaAngle = -7,
						duration = 0
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
						modelId = "Model_XHe_Sword",
						id = "xianjian3",
						rotationX = 0,
						scale = 0.45,
						zorder = 300,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.7,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xianjian3"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xianjian3"),
				args = function (_ctx)
					return {
						deltaAngle = 15,
						duration = 0
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
						modelId = "Model_XHe_Sword",
						id = "xianjian4",
						rotationX = 0,
						scale = 0.45,
						zorder = 300,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.65,
								y = 0.15
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xianjian4"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xianjian4"),
				args = function (_ctx)
					return {
						deltaAngle = 7,
						duration = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "xianjian1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "xianjian2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "xianjian3"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "xianjian4"),
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
			action = "play",
			actor = __getnode__(_root, "yin_chuqiao"),
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
			actor = __getnode__(_root, "yin_chuqiao"),
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
			actor = __getnode__(_root, "yin_chuqiao"),
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
			actor = __getnode__(_root, "yin_chuqiao"),
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
			actor = __getnode__(_root, "xhe"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -385,
						refpt = {
							x = 1,
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
			action = "opacityTo",
			actor = __getnode__(_root, "g_zhedang"),
			args = function (_ctx)
				return {
					valend = 0,
					duration = 0.8
				}
			end
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "xianjian1"),
			args = function (_ctx)
				return {
					height = 5,
					duration = 0.5
				}
			end
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "xianjian2"),
			args = function (_ctx)
				return {
					height = 5,
					duration = 0.5
				}
			end
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "xianjian3"),
			args = function (_ctx)
				return {
					height = 5,
					duration = 0.5
				}
			end
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "xianjian4"),
			args = function (_ctx)
				return {
					height = 5,
					duration = 0.5
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
			action = "changeTexture",
			actor = __getnode__(_root, "xhe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xhe/face_xhe_8.png",
					pathType = "STORY_FACE"
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
					deltaAngleZ = 0
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
						"eventstory_gohome_03_13"
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
				actor = __getnode__(_root, "yin_chuqiao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "repeatUpDownEnd",
				actor = __getnode__(_root, "xianjian1")
			}),
			act({
				action = "repeatUpDownEnd",
				actor = __getnode__(_root, "xianjian2")
			}),
			act({
				action = "repeatUpDownEnd",
				actor = __getnode__(_root, "xianjian3")
			}),
			act({
				action = "repeatUpDownEnd",
				actor = __getnode__(_root, "xianjian4")
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xianjian1"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							refpt = {
								x = 0.15,
								y = 1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xianjian2"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							refpt = {
								x = 0.3,
								y = 1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xianjian3"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							refpt = {
								x = 0.85,
								y = 1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xianjian4"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							refpt = {
								x = 0.7,
								y = 1
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
			action = "fadeOut",
			actor = __getnode__(_root, "xianjian1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "xianjian2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "xianjian3"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "xianjian4"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
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
				action = "moveTo",
				actor = __getnode__(_root, "hdu"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -370,
							refpt = {
								x = 0.33,
								y = 0
							}
						}
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
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -385,
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
						name = "GoHome_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xhe"
						},
						content = {
							"eventstory_gohome_03_14"
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
						"eventstory_gohome_03_15"
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
							"eventstory_gohome_03_16"
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_GCZi",
						id = "jianxian",
						rotationX = 0,
						scale = 0.5,
						zorder = 210,
						position = {
							x = 0,
							y = -385,
							refpt = {
								x = 0.51,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "jianxian_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "xhe/face_xhe_7.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "jianxian_face",
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
				actor = __getnode__(_root, "jianxian"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
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
							x = 0.51,
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
				actor = __getnode__(_root, "xhe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xhe/face_xhe_7.png",
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
							"eventstory_gohome_03_17"
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
			actor = __getnode__(_root, "jianxian"),
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_chuqiao"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.11
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_chuqiao"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.11
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_chuqiao"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.11
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_chuqiao"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.11
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_chuqiao"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.11
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_chuqiao"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.11
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_chuqiao"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.11
				}
			end
		}),
		sequential({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "g_yin"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "g_yang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "g_yin"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							refpt = {
								x = 0.2,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "g_yang"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							refpt = {
								x = 0.8,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "g_yin"),
				args = function (_ctx)
					return {
						duration = 0.05,
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
				actor = __getnode__(_root, "g_yang"),
				args = function (_ctx)
					return {
						duration = 0.05,
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
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			rockScreen({
				args = function (_ctx)
					return {
						freq = 7,
						strength = 0.5
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yin"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "g_yang"),
			args = function (_ctx)
				return {
					duration = 0
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
							x = 0.22,
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
					deltaAngleZ = 180
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
							x = 0.52,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "jianxian"),
			args = function (_ctx)
				return {
					duration = 0
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
							x = 0.81,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "byu"),
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
					image = "byu/face_byu_3.png",
					pathType = "STORY_FACE"
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
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.35
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
						"eventstory_gohome_03_18"
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
				actor = __getnode__(_root, "xhe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xhe/face_xhe_9.png",
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
							"eventstory_gohome_03_19"
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
				actor = __getnode__(_root, "xhe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xhe/face_xhe_4.png",
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
							"eventstory_gohome_03_20"
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
						"eventstory_gohome_03_21"
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
							"eventstory_gohome_03_22"
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
							"eventstory_gohome_03_23"
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
				action = "moveTo",
				actor = __getnode__(_root, "byu"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -290,
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "opacityTo",
			actor = __getnode__(_root, "byu_face"),
			args = function (_ctx)
				return {
					valend = 0,
					duration = 0.6
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "bg_nianshou"),
			args = function (_ctx)
				return {
					zorder = 120
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
				action = "changeTexture",
				actor = __getnode__(_root, "byu_face2"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "byu/face_byu_5.png",
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
							"eventstory_gohome_03_24"
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
					name = "GoHome_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"byu"
					},
					content = {
						"eventstory_gohome_03_25"
					},
					durations = {
						0.03
					}
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_guanchouhai"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "buy"),
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
			action = "updateNode",
			actor = __getnode__(_root, "bg_guanchouhai"),
			args = function (_ctx)
				return {
					zorder = 115
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
			action = "changeTexture",
			actor = __getnode__(_root, "byu_face2"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "byu/face_byu_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"eventstory_gohome_03_26"
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
			actor = __getnode__(_root, "Mus_zhandou")
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

local function eventstory_gohome_03a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_gohome_03a",
					scene = scene_eventstory_gohome_03a
				}
			end
		})
	})
end

stories.eventstory_gohome_03a = eventstory_gohome_03a

return _M
