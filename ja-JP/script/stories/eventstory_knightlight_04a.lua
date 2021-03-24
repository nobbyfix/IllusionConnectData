local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_knightlight_04a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_knightlight_04a = {
	actions = {}
}
scenes.scene_eventstory_knightlight_04a = scene_eventstory_knightlight_04a

function scene_eventstory_knightlight_04a:stage(args)
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
						name = "bg_tianxia",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_knight_1.jpg",
						layoutMode = 1,
						zorder = 10,
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
					},
					{
						resType = 0,
						name = "bg_benghuai",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_knight_2.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_benghuai",
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
				id = "Mus_qishi",
				fileName = "Mus_Story_Knight_War",
				type = "Music"
			},
			{
				id = "Mus_weixian",
				fileName = "Mus_Story_Danger",
				type = "Music"
			},
			{
				id = "yin_posui",
				fileName = "Se_Story_Fire_2",
				type = "Sound"
			},
			{
				id = "yin_gedang",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
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
						x = 0.6,
						y = 0.5
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

function scene_eventstory_knightlight_04a.actions.start_eventstory_knightlight_04a(_root, args)
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
			actor = __getnode__(_root, "Mus_qishi"),
			args = function (_ctx)
				return {
					isLoop = true
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
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "XLTe"),
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
							"eventstory_knightlight_04a_1"
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
							"eventstory_knightlight_04a_2"
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
						image = "xlte/face_xlte_2.png",
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
							"eventstory_knightlight_04a_3"
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
						"eventstory_knightlight_04a_4"
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
							"eventstory_knightlight_04a_5"
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
							"eventstory_knightlight_04a_6"
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tianxia"),
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
								x = -0.6,
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
						zorder = 32,
						position = {
							x = 0,
							y = -390,
							refpt = {
								x = 0.5,
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
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
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
			sequential({
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
									x = 0.74,
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
							duration = 0.2,
							position = {
								x = 0,
								y = -550,
								refpt = {
									x = 0.22,
									y = 0
								}
							}
						}
					end
				})
			}),
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
							"eventstory_knightlight_04a_7"
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
							"eventstory_knightlight_04a_8"
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
					name = "Knight_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GLTe"
					},
					content = {
						"eventstory_knightlight_04a_9"
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
						"eventstory_knightlight_04a_10"
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
						"eventstory_knightlight_04a_11"
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
					name = "Knight_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GLTe"
					},
					content = {
						"eventstory_knightlight_04a_12"
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
							"eventstory_knightlight_04a_13"
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
						"eventstory_knightlight_04a_14"
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
						"eventstory_knightlight_04a_15"
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
					name = "Knight_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GLTe"
					},
					content = {
						"eventstory_knightlight_04a_16"
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
					freq = 3,
					strength = 1
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
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
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
							"eventstory_knightlight_04a_17"
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
							"eventstory_knightlight_04a_18"
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
							"eventstory_knightlight_04a_19"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
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
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_benghuai"),
			args = function (_ctx)
				return {
					duration = 0.5
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "updateNode",
					actor = __getnode__(_root, "GLTe"),
					args = function (_ctx)
						return {
							zorder = 35
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "GLTe"),
					args = function (_ctx)
						return {
							duration = 0.2,
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
					action = "moveTo",
					actor = __getnode__(_root, "AEn"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -390,
								refpt = {
									x = 0.24,
									y = 0
								}
							}
						}
					end
				})
			}),
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
							"eventstory_knightlight_04a_20"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			sequential({
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
					actor = __getnode__(_root, "GLTe"),
					args = function (_ctx)
						return {
							duration = 0.2,
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
							"eventstory_knightlight_04a_21"
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
					name = "Knight_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GLTe"
					},
					content = {
						"eventstory_knightlight_04a_22"
					},
					durations = {
						0.03
					}
				}
			end
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
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
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
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
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
				actor = __getnode__(_root, "yin_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = -0.66,
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_18",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_04a_23"
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
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
							"eventstory_knightlight_04a_24"
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
						"eventstory_knightlight_04a_25"
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
					name = "Knight_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GLTe"
					},
					content = {
						"eventstory_knightlight_04a_26"
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
				actor = __getnode__(_root, "xiao_gedang"),
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
			act({
				action = "moveTo",
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.4,
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
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
							"eventstory_knightlight_04a_27"
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
					name = "Knight_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_04a_28"
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
					action = "updateNode",
					actor = __getnode__(_root, "GLTe"),
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
							duration = 0.1
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "GLTe"),
					args = function (_ctx)
						return {
							duration = 0.2,
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
				})
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
							"eventstory_knightlight_04a_29"
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
				action = "updateNode",
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						zorder = 35
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
							"eventstory_knightlight_04a_30"
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
				action = "updateNode",
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						zorder = 30
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
							"eventstory_knightlight_04a_31"
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
				action = "updateNode",
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						zorder = 35
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
							"eventstory_knightlight_04a_32"
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
				action = "changeTexture",
				actor = __getnode__(_root, "AEn_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aen/face_glte_3.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
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
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		concurrent({
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
				actor = __getnode__(_root, "AEn"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_04a_33"
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
					name = "Knight_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_04a_34"
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
					name = "Knight_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_04a_35"
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
						"eventstory_knightlight_04a_36"
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
					name = "Knight_dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_04a_37"
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
					name = "Knight_dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_04a_38"
					},
					durations = {
						0.03
					}
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
					name = "Knight_dialog_speak_name_20",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Knight_dialog_speak_name_20"
					},
					content = {
						"eventstory_knightlight_04a_39"
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
					duration = 0.8
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_weixian")
		})
	})
end

local function eventstory_knightlight_04a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_knightlight_04a",
					scene = scene_eventstory_knightlight_04a
				}
			end
		})
	})
end

stories.eventstory_knightlight_04a = eventstory_knightlight_04a

return _M
