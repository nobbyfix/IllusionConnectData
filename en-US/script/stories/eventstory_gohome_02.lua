local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_gohome_02")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_gohome_02 = {
	actions = {}
}
scenes.scene_eventstory_gohome_02 = scene_eventstory_gohome_02

function scene_eventstory_gohome_02:stage(args)
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
						name = "bg_daguanyuan",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_family_1_bg.jpg",
						layoutMode = 1,
						zorder = 75,
						id = "bg_daguanyuan",
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
								id = "bgEx_daguanyuan",
								scale = 1,
								actionName = "main_huijiadeluyunchangjing",
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
					}
				}
			},
			{
				id = "Mus_xianshi",
				fileName = "Mus_Story_Family_Aloof",
				type = "Music"
			},
			{
				id = "Mus_doubi",
				fileName = "Mus_Story_Family_Happy",
				type = "Music"
			},
			{
				id = "Mus_miwuhai",
				fileName = "Mus_Story_Collapsed",
				type = "Music"
			},
			{
				id = "Mus_weiji",
				fileName = "Mus_Battle_Family",
				type = "Music"
			},
			{
				id = "yin_zhongsheng",
				fileName = "Se_Story_Family_Ring",
				type = "Sound"
			},
			{
				id = "yin_luosuo",
				fileName = "Se_Story_Family_Chatterbox",
				type = "Sound"
			},
			{
				id = "yin_kaiyan",
				fileName = "Se_Story_Vortex",
				type = "Sound"
			},
			{
				id = "yin_nianshou",
				fileName = "Se_Story_Family_Bellow",
				type = "Sound"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_gohome_02.actions.start_eventstory_gohome_02(_root, args)
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
			actor = __getnode__(_root, "bg_daguanyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_daguanyuan"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_xianshi"),
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
						modelId = "Model_LDYu",
						id = "hdu",
						rotationX = 0,
						scale = 0.55,
						zorder = 250,
						position = {
							x = 0,
							y = -370,
							refpt = {
								x = 0.28,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "hdu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "hdu/face_hdu_1.png",
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
			})
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_TPGZhu",
						id = "TPGZhu",
						rotationX = 0,
						scale = 0.85,
						zorder = 100,
						position = {
							x = 0,
							y = -115,
							refpt = {
								x = 0.79,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "TPGZhu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "TPGZhu/TPGZhu_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "TPGZhu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 13.9,
									y = 592.2
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "TPGZhu"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "TPGZhu"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "hdu"),
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
					duration = 0.25
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "GoHome_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu"
					},
					content = {
						"eventstory_gohome_02_1"
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
				actor = __getnode__(_root, "hdu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "hdu/face_hdu_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"hdu"
						},
						content = {
							"eventstory_gohome_02_2"
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
				actor = __getnode__(_root, "hdu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "hdu/face_hdu_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"TPGZhu"
						},
						content = {
							"eventstory_gohome_02_3"
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
					name = "GoHome_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"TPGZhu"
					},
					content = {
						"eventstory_gohome_02_4"
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
					name = "GoHome_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_02_5"
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
						name = "GoHome_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"hdu"
						},
						content = {
							"eventstory_gohome_02_6"
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
						modelId = "Model_SDTZi",
						id = "SDTZi",
						rotationX = 0,
						scale = 0.65,
						zorder = 120,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 1.05,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SDTZi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SDTZi/SDTZi_face_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "SDTZi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -112,
									y = 1026
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SDTZi"),
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
				actor = __getnode__(_root, "hdu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "hdu/face_hdu_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {},
						content = {
							"eventstory_gohome_02_7"
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
			actor = __getnode__(_root, "TPGZhu"),
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
				actor = __getnode__(_root, "SDTZi"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SDTZi"),
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
				action = "changeTexture",
				actor = __getnode__(_root, "hdu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "hdu/face_hdu_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"hdu"
						},
						content = {
							"eventstory_gohome_02_8"
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
				action = "play",
				actor = __getnode__(_root, "yin_zhongsheng"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "hdu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "hdu/face_hdu_5.png",
						pathType = "STORY_FACE"
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "GoHome_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_02_9"
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
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_gohome_02_10"
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
				actor = __getnode__(_root, "hdu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "hdu/face_hdu_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_zhongsheng")
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"hdu"
						},
						content = {
							"eventstory_gohome_02_11"
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
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_gohome_02_12"
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
				actor = __getnode__(_root, "hdu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "hdu/face_hdu_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"hdu"
						},
						content = {
							"eventstory_gohome_02_13"
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
				actor = __getnode__(_root, "SDTZi"),
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
			action = "stop",
			actor = __getnode__(_root, "Mus_xianshi")
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
			action = "changeTexture",
			actor = __getnode__(_root, "hdu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "hdu/face_hdu_8.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 1.5
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_miwuhai"),
				args = function (_ctx)
					return {
						isLoop = true
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_guanchouhai"),
				args = function (_ctx)
					return {
						duration = 2,
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
					duration = 1.5
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
						zorder = 210,
						position = {
							x = 0,
							y = -385,
							refpt = {
								x = -0.06,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "xhe_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "xhe/face_xhe_2.png",
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "GoHome_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_02_14"
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
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -385,
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
						duration = 0.3,
						position = {
							x = 0,
							y = -370,
							refpt = {
								x = 0.82,
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
							"eventstory_gohome_02_15"
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
					name = "GoHome_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_02_16"
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
						image = "xhe/face_xhe_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_doubi"),
				args = function (_ctx)
					return {
						isLoop = true
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
							"eventstory_gohome_02_17"
						},
						durations = {
							0.02
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
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0
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
								image = "byu/face_byu_6.png",
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
								image = "byu/face_byu_7.png",
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "byu"),
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
				action = "play",
				actor = __getnode__(_root, "yin_luosuo"),
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
						name = "GoHome_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {},
						content = {
							"eventstory_gohome_02_18"
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
					duration = 1
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
						image = "byu/face_byu_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
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
						speakings = {},
						content = {
							"eventstory_gohome_02_19"
						},
						durations = {
							0.03
						}
					}
				end
			})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
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
				actor = __getnode__(_root, "hdu"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_luosuo")
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
					name = "GoHome_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xhe"
					},
					content = {
						"eventstory_gohome_02_20"
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
					name = "GoHome_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_02_21"
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
							"eventstory_gohome_02_22"
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
						"eventstory_gohome_02_23"
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
						"eventstory_gohome_02_24"
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
						"eventstory_gohome_02_25"
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
						"eventstory_gohome_02_26"
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
							"eventstory_gohome_02_27"
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
						"eventstory_gohome_02_28"
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
							"eventstory_gohome_02_29"
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
						"eventstory_gohome_02_30"
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
				action = "moveTo",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -385,
							refpt = {
								x = 0.48,
								y = 0
							}
						}
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
							"eventstory_gohome_02_31"
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
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -290,
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
						"eventstory_gohome_02_32"
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
				actor = __getnode__(_root, "byu"),
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
								x = 0.24,
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
				action = "moveTo",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
						name = "GoHome_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"byu"
						},
						content = {
							"eventstory_gohome_02_33"
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
							"eventstory_gohome_02_34"
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
							"eventstory_gohome_02_35"
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xhe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xhe/face_xhe_5.png",
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
						name = "GoHome_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xhe"
						},
						content = {
							"eventstory_gohome_02_36"
						},
						durations = {
							0.03
						}
					}
				end
			})
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
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "dialogue")
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
				actor = __getnode__(_root, "byu"),
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
			actor = __getnode__(_root, "hdu"),
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
					name = "GoHome_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"hdu"
					},
					content = {
						"eventstory_gohome_02_37"
					},
					durations = {
						0.03
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
							x = 0.57,
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
					image = "xhe/face_xhe_7.png",
					pathType = "STORY_FACE"
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "xhe"),
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
							"eventstory_gohome_02_38"
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
			action = "moveTo",
			actor = __getnode__(_root, "xhe"),
			args = function (_ctx)
				return {
					duration = 0,
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
					image = "byu/face_byu_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xhe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xhe/face_xhe_5.png",
					pathType = "STORY_FACE"
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
					name = "GoHome_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xhe"
					},
					content = {
						"eventstory_gohome_02_39"
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
			actor = __getnode__(_root, "xhe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xhe/face_xhe_2.png",
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
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
							"eventstory_gohome_02_40"
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
							"eventstory_gohome_02_41"
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
							"eventstory_gohome_02_42"
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
							"eventstory_gohome_02_43"
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
							"eventstory_gohome_02_44"
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
				action = "play",
				actor = __getnode__(_root, "yin_zhongsheng"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xhe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xhe/face_xhe_5.png",
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
						image = "byu/face_byu_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_weiji"),
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
					duration = 1
				}
			end
		}),
		concurrent({
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
						"eventstory_gohome_02_45"
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
						"eventstory_gohome_02_46"
					},
					durations = {
						0.03
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
					image = "byu/face_byu_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
			action = "moveTo",
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -290,
						refpt = {
							x = 0.26,
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
							x = 0.73,
							y = 0
						}
					}
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
					duration = 0.25
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "byu"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_zhongsheng")
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "GoHome_dialog_speak_name_10",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xhe",
							"byu"
						},
						content = {
							"eventstory_gohome_02_47"
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
				actor = __getnode__(_root, "byu"),
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
				action = "moveTo",
				actor = __getnode__(_root, "xhe"),
				args = function (_ctx)
					return {
						duration = 0,
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
						name = "GoHome_dialog_speak_name_10",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xhe",
							"byu"
						},
						content = {
							"eventstory_gohome_02_48"
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
				actor = __getnode__(_root, "byu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "byu/face_byu_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
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
						name = "GoHome_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xhe"
						},
						content = {
							"eventstory_gohome_02_49"
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
								x = 0.49,
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
					duration = 1
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
						"eventstory_gohome_02_50"
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
			actor = __getnode__(_root, "byu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_weiji")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_zhongsheng")
		})
	})
end

local function eventstory_gohome_02(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_gohome_02",
					scene = scene_eventstory_gohome_02
				}
			end
		})
	})
end

stories.eventstory_gohome_02 = eventstory_gohome_02

return _M
