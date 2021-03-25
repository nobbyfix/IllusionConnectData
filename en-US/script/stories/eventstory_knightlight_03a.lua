local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_knightlight_03a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_knightlight_03a = {
	actions = {}
}
scenes.scene_eventstory_knightlight_03a = scene_eventstory_knightlight_03a

function scene_eventstory_knightlight_03a:stage(args)
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
						name = "bg_yuanzhuo",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_knight.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg_yuanzhuo",
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
						name = "bg_jiedao1",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_11_2.jpg",
						layoutMode = 1,
						zorder = 5,
						id = "bg_jiedao1",
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
						name = "bg_jiedao2",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_11_1.jpg",
						layoutMode = 1,
						zorder = 10,
						id = "bg_jiedao2",
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
						name = "bg_tianxia",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_knight_1.jpg",
						layoutMode = 1,
						zorder = 14,
						id = "bg_tianxia",
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
				layoutMode = 1,
				name = "bg",
				type = "ColorBackGround",
				zorder = 100,
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
				id = "Mus_yuanzhuo",
				fileName = "Mus_Story_Knight_War",
				type = "Music"
			},
			{
				id = "Mus_jizhan",
				fileName = "Mus_Story_Danger",
				type = "Music"
			},
			{
				id = "yin_jian",
				fileName = "Se_Skill_Cut_5",
				type = "Sound"
			},
			{
				id = "yin_paoxiao",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 12,
				videoName = "story_huiyi",
				id = "xiao_huiyi",
				scale = 1.05,
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
				id = "xiao_jian",
				scale = 1.5,
				actionName = "liqi_juqingtexiao",
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
				id = "xiao_jian2",
				scale = 1.5,
				actionName = "liqi_juqingtexiao",
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
				visible = false,
				type = "VideoSprite",
				zorder = 20,
				videoName = "story_juqixh",
				id = "xiao_ltna",
				scale = 1.15,
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.41,
						y = 0.63
					}
				}
			},
			{
				id = "mask",
				type = "Mask"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_knightlight_03a.actions.start_eventstory_knightlight_03a(_root, args)
	return sequential({
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
			actor = __getnode__(_root, "bg_yuanzhuo")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_yuanzhuo"),
			args = function (_ctx)
				return {
					isLoop = true
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_KEDGong",
						id = "KLSTing",
						rotationX = 0,
						scale = 0.85,
						zorder = 30,
						position = {
							x = 0,
							y = -500,
							refpt = {
								x = 0.4,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "KLSTing_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "klsting/face_klsting_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "KLSTing_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 214,
									y = 1123.9
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "KLSTing"),
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
				actor = __getnode__(_root, "KLSTing"),
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
						modelId = "Model_FEMSi",
						id = "XLTe",
						rotationX = 0,
						scale = 0.72,
						zorder = 35,
						position = {
							x = 0,
							y = -370,
							refpt = {
								x = 0.78,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "XLTe_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "xlte/face_xlte_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "XLTe_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -42.5,
									y = 1096
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "XLTe"),
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
				actor = __getnode__(_root, "KLSTing"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "XLTe"),
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
				actor = __getnode__(_root, "KLSTing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "klsting/face_klsting_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_12",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"KLSTing"
						},
						content = {
							"eventstory_knightlight_03a_1"
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
				actor = __getnode__(_root, "XLTe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xlte/face_xlte_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_13",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"XLTe"
						},
						content = {
							"eventstory_knightlight_03a_2"
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
					name = "Knight_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLTe"
					},
					content = {
						"eventstory_knightlight_03a_3"
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
					name = "Knight_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLTe"
					},
					content = {
						"eventstory_knightlight_03a_4"
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
				actor = __getnode__(_root, "KLSTing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "klsting/face_klsting_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_12",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"KLSTing"
						},
						content = {
							"eventstory_knightlight_03a_5"
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
					name = "Knight_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KLSTing"
					},
					content = {
						"eventstory_knightlight_03a_6"
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
				actor = __getnode__(_root, "XLTe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xlte/face_xlte_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_13",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"XLTe"
						},
						content = {
							"eventstory_knightlight_03a_7"
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
					name = "Knight_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KLSTing"
					},
					content = {
						"eventstory_knightlight_03a_8"
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
				actor = __getnode__(_root, "KLSTing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "klsting/face_klsting_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_12",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"KLSTing"
						},
						content = {
							"eventstory_knightlight_03a_9"
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
				actor = __getnode__(_root, "XLTe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xlte/face_xlte_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_13",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"XLTe"
						},
						content = {
							"eventstory_knightlight_03a_10"
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
			action = "fadeOut",
			actor = __getnode__(_root, "KLSTing"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "XLTe"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_huiyi")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_jiedao1"),
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
						modelId = "Model_HGEr",
						id = "GLTe",
						rotationX = 0,
						scale = 0.72,
						zorder = 30,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.45,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "GLTe_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "glte/face_glte_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "GLTe_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -44.6,
									y = 1465
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "GLTe"),
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
				actor = __getnode__(_root, "GLTe"),
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
						modelId = "Model_LSLTe",
						id = "AEn",
						rotationX = 0,
						scale = 0.66,
						zorder = 70,
						position = {
							x = 0,
							y = -390,
							refpt = {
								x = -0.45,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "AEn_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "aen/face_aen_6.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "AEn_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 11.3,
									y = 1235
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "AEn"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "GLTe"),
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
			action = "play",
			actor = __getnode__(_root, "Mus_jizhan"),
			args = function (_ctx)
				return {
					isLoop = true
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "GLTe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "glte/face_glte_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"GLTe"
						},
						content = {
							"eventstory_knightlight_03a_11"
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
					name = "Knight_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_12"
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
					name = "Knight_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_13"
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
				actor = __getnode__(_root, "GLTe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "glte/face_glte_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"GLTe"
						},
						content = {
							"eventstory_knightlight_03a_14"
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
				actor = __getnode__(_root, "AEn"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "AEn"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -390,
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
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.78,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "AEn_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aen/face_aen_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"AEn"
						},
						content = {
							"eventstory_knightlight_03a_15"
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
				actor = __getnode__(_root, "GLTe"),
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
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.84,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "GLTe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "glte/face_glte_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"GLTe"
						},
						content = {
							"eventstory_knightlight_03a_16"
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
				actor = __getnode__(_root, "AEn_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aen/face_aen_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"AEn"
						},
						content = {
							"eventstory_knightlight_03a_17"
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
				actor = __getnode__(_root, "AEn_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aen/face_aen_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"AEn"
						},
						content = {
							"eventstory_knightlight_03a_18"
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
				actor = __getnode__(_root, "AEn"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -390,
							refpt = {
								x = -0.45,
								y = 0
							}
						}
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
			action = "changeTexture",
			actor = __getnode__(_root, "AEn_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "aen/face_aen_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "GLTe"),
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_19"
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_20"
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_21"
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_22"
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_23"
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_24"
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
					name = "Knight_dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_25"
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
					name = "Knight_dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_26"
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
						name = "Knight_dialog_speak_name_21",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Knight_dialog_speak_name_20"
						},
						content = {
							"eventstory_knightlight_03a_27"
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
						strength = 1
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 1.5,
							y = 0
						}
					}
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
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_jiedao2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = -0.5,
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
						modelId = "Model_Enemy_Story_Normal",
						id = "BMonster1",
						rotationX = 0,
						scale = 0.85,
						zorder = 40,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 1.55,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BMonster1"),
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
						modelId = "Model_Enemy_Story_Normal",
						id = "BMonster2",
						rotationX = 0,
						scale = 0.85,
						zorder = 40,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 1.55,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BMonster2"),
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
						modelId = "Model_Enemy_Story_Normal",
						id = "BMonster3",
						rotationX = 0,
						scale = 0.85,
						zorder = 40,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 1.55,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BMonster3"),
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
						id = "LMonster1",
						rotationX = 0,
						scale = 0.6,
						zorder = 50,
						position = {
							x = 0,
							y = -100,
							refpt = {
								x = 1.35,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LMonster1"),
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
						id = "LMonster2",
						rotationX = 0,
						scale = 0.6,
						zorder = 50,
						position = {
							x = 0,
							y = -100,
							refpt = {
								x = 1.35,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LMonster2"),
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
						id = "LMonster3",
						rotationX = 0,
						scale = 0.6,
						zorder = 50,
						position = {
							x = 0,
							y = -100,
							refpt = {
								x = 1.35,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LMonster3"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BMonster1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.48,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LMonster1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -100,
						refpt = {
							x = 0.21,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LMonster2"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -100,
						refpt = {
							x = 0.81,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BMonster1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "LMonster1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "LMonster2"),
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
		concurrent({
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = -20,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.5,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = -35,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.4,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = -10,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
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
				action = "moveTo",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.48,
								y = -0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -100,
							refpt = {
								x = 0.21,
								y = -0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -100,
							refpt = {
								x = 0.81,
								y = -0.4
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LMonster2"),
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
					duration = 0.4
				}
			end
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "BMonster1")
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "LMonster1")
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "LMonster2")
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = 60,
					duration = 0
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "BMonster1"),
			args = function (_ctx)
				return {
					zorder = 50
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BMonster1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 1.48,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BMonster2"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 1.48,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BMonster3"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 1.48,
							y = 0.1
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
					name = "Knight_dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_28"
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
			actor = __getnode__(_root, "BMonster1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BMonster2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BMonster3"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BMonster2"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.2,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BMonster1"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.48,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BMonster3"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.8,
							y = 0.1
						}
					}
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
					strength = 1
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
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.3,
							y = 0.3
						}
					}
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = -25,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.7,
							y = 0.1
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = 120,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.3,
							y = 0.6
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = -60,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
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
				action = "moveTo",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.48,
								y = -0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.2,
								y = -0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.8,
								y = -0.4
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster3"),
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
					duration = 0.4
				}
			end
		}),
		concurrent({
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster1")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster2")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster3")
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						zorder = 45
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -75,
							refpt = {
								x = 0.48,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -140,
							refpt = {
								x = 0.18,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -140,
							refpt = {
								x = 0.78,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -150,
							refpt = {
								x = 0.51,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -150,
							refpt = {
								x = 0.21,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LMonster3"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -150,
							refpt = {
								x = 0.81,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "AEn"),
				args = function (_ctx)
					return {
						zorder = 65
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_30"
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
				actor = __getnode__(_root, "yin_paoxiao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LMonster3"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_paoxiao")
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
			action = "fadeIn",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 1.5,
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
			action = "fadeOut",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.3,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = -70,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.5,
								y = 0.9
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = 130,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = -10,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.5,
								y = 0.9
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = 30,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.3,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = -90,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LMonster3"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
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
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LMonster3"),
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
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster1")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster2")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster3")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "LMonster1")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "LMonster2")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "LMonster3")
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "AEn"),
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
				actor = __getnode__(_root, "AEn_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aen/face_aen_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"AEn"
						},
						content = {
							"eventstory_knightlight_03a_31"
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
				actor = __getnode__(_root, "AEn_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aen/face_aen_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"AEn"
						},
						content = {
							"eventstory_knightlight_03a_32"
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
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 1.5,
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
			action = "fadeOut",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = -0.5,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						zorder = 40
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.11,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.81,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = 130,
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
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = 130,
							refpt = {
								x = 0.63,
								y = 0
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_paoxiao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_paoxiao")
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
			action = "fadeIn",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 1.5,
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
			action = "fadeOut",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.1,
							y = 0.8
						}
					}
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = 60,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.6,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = -105,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.35,
								y = 0.3
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = -45,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.35,
								y = -0.15
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
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
		act({
			action = "updateNode",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					zorder = 30
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0.1
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
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster1")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster2")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "LMonster1")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "LMonster2")
			})
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						zorder = 55
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						zorder = 52
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						zorder = 53
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -90,
							refpt = {
								x = -0.5,
								y = 1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -380,
							refpt = {
								x = -0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -380,
							refpt = {
								x = 1.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -40,
							refpt = {
								x = -0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -40,
							refpt = {
								x = 1.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "BMonster2"),
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
				actor = __getnode__(_root, "LMonster1"),
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
			action = "updateNode",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					zorder = 30
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "AEn"),
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_33"
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
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -40,
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
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -40,
							refpt = {
								x = 0.63,
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_34"
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
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.4,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
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
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LMonster1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LMonster2"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -380,
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
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -380,
							refpt = {
								x = 0.63,
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
					name = "Knight_dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -90,
							refpt = {
								x = 0.5,
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_36"
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
			action = "show",
			actor = __getnode__(_root, "colorBg"),
			args = function (_ctx)
				return {
					bgColor = "#000000"
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.3,
								y = 0.6
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian2"),
				args = function (_ctx)
					return {
						deltaAngle = 40,
						duration = 0
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.3,
							y = 0.1
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
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
				actor = __getnode__(_root, "yin_jian"),
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jian2")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
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
			action = "hide",
			actor = __getnode__(_root, "colorBg")
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
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
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
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster2"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BMonster3"),
				args = function (_ctx)
					return {
						duration = 0.1
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
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster1")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster2")
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "BMonster3")
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_37"
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
					name = "Knight_dialog_speak_name_23",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_38"
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
					name = "Knight_dialog_speak_name_23",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_39"
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_40"
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
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 1.5,
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -390,
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
			actor = __getnode__(_root, "AEn"),
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
						"eventstory_knightlight_03a_41"
					},
					durations = {
						0.08
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
				actor = __getnode__(_root, "AEn_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aen/face_aen_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"AEn"
						},
						content = {
							"eventstory_knightlight_03a_42"
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
					name = "Knight_dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_03a_43"
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
				actor = __getnode__(_root, "AEn_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aen/face_aen_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Knight_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"AEn"
						},
						content = {
							"eventstory_knightlight_03a_44"
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
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 1.5,
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = -0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tianxia"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 0.5,
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
					name = "Knight_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AEn"
					},
					content = {
						"eventstory_knightlight_03a_45"
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
			action = "show",
			actor = __getnode__(_root, "colorBg"),
			args = function (_ctx)
				return {
					bgColor = "#FFFFFF"
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
					duration = 0.4
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
			action = "stop",
			actor = __getnode__(_root, "Mus_jizhan")
		})
	})
end

local function eventstory_knightlight_03a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_knightlight_03a",
					scene = scene_eventstory_knightlight_03a
				}
			end
		})
	})
end

stories.eventstory_knightlight_03a = eventstory_knightlight_03a

return _M
