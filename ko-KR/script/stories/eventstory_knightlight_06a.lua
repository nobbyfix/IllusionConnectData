local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_knightlight_06a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_knightlight_06a = {
	actions = {}
}
scenes.scene_eventstory_knightlight_06a = scene_eventstory_knightlight_06a

function scene_eventstory_knightlight_06a:stage(args)
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
						name = "bg_mori",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_knight_2.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg_mori",
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
						name = "bg_chongfeng",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_11_1.jpg",
						layoutMode = 1,
						zorder = 5,
						id = "bg_chongfeng",
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
						name = "bg_ketang",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_00_3.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_ketang",
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
				zorder = 10,
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
				id = "Mus_xisheng",
				fileName = "Mus_Story_Knight_Fall",
				type = "Music"
			},
			{
				brightness = 255,
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10,
				visible = false,
				id = "xiao_guang",
				scale = 0.3,
				actionName = "daojju_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.3,
						y = 0.3
					}
				}
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 100,
				videoName = "story_baozha",
				id = "xiao_baozha",
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
				id = "mask",
				type = "Mask"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_knightlight_06a.actions.start_eventstory_knightlight_06a(_root, args)
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
			actor = __getnode__(_root, "bg_mori")
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
						modelId = "Model_HGEr",
						id = "GLTe",
						rotationX = 0,
						scale = 0.72,
						zorder = 35,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.48,
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
		sequential({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = 255,
						modelId = "Model_Story_FGao_shield_l",
						id = "Guang",
						rotationX = 0,
						scale = 0.17,
						zorder = 200,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.2,
								y = 0.2
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Guang"),
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "GLTe"),
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
							"eventstory_knightlight_06a_1"
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
						"eventstory_knightlight_06a_2"
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
						"eventstory_knightlight_06a_3"
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
						"eventstory_knightlight_06a_4"
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
						"eventstory_knightlight_06a_5"
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
						"eventstory_knightlight_06a_6"
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
					name = "Knight_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_7"
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
					name = "Knight_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_8"
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
						name = "Knight_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"eventstory_knightlight_06a_9"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_10"
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
						""
					},
					content = {
						"eventstory_knightlight_06a_11"
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
						name = "Knight_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"eventstory_knightlight_06a_12"
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_13"
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
						""
					},
					content = {
						"eventstory_knightlight_06a_14"
					},
					durations = {
						0.03
					}
				}
			end
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
						zorder = 30,
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
					duration = 0.4
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_chongfeng"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_knightlight_06a_15"
					},
					storyLove = {}
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
							"eventstory_knightlight_06a_16"
						},
						durations = {
							0.03
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
						"eventstory_knightlight_06a_17"
					},
					storyLove = {}
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
						"eventstory_knightlight_06a_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_knightlight_06a_19"
					},
					storyLove = {}
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
							"eventstory_knightlight_06a_20"
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
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_xisheng"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_chongfeng"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_21"
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
						""
					},
					content = {
						"eventstory_knightlight_06a_22"
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
						""
					},
					content = {
						"eventstory_knightlight_06a_23"
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
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 0.62,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.2,
								y = -0.05
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.2,
								y = -0.26
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Guang"),
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
					duration = 0.7
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					scale = 0.15,
					duration = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_24"
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
					name = "Knight_dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_25"
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
					name = "Knight_dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = 0,
						refpt = {
							x = 0.8,
							y = 0.6
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.8,
								y = 0.3
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.8,
								y = 0.12
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Guang"),
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
					duration = 0.7
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					scale = 0.17,
					duration = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_27"
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
					name = "Knight_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = 0,
						refpt = {
							x = 0.3,
							y = 0.5
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 0.45,
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.3,
								y = 0.34
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0.6
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.3,
								y = 0.02
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.6
					}
				end
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
			action = "scaleTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					scale = 0.17,
					duration = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_29"
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
					name = "Knight_dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = 0,
						refpt = {
							x = 0.7,
							y = 0.5
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 0.67,
						duration = 0.12
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.12,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.7,
								y = 0.21
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 1.05,
						duration = 0.6
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.7,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.6
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.72
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					scale = 0.17,
					duration = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = 0,
						refpt = {
							x = 0.35,
							y = 0.6
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 0.88,
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.35,
								y = 0.2
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 1.14,
						duration = 0.65
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.65,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.35,
								y = 0.05
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.65
					}
				end
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
			action = "scaleTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					scale = 0.17,
					duration = 0
				}
			end
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Knight_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_knightlight_06a_32"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = 0,
						refpt = {
							x = 0.5,
							y = 0.3
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						scale = 114,
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Guang"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = -0.25
							}
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
					duration = 0.75
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "colorBg")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Guang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_ketang"),
			args = function (_ctx)
				return {
					duration = 0
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
							x = 0.88,
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
					image = "glte/face_glte_6.png",
					pathType = "STORY_FACE"
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
								x = 0.3,
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
			actor = __getnode__(_root, "GLTe"),
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
						"eventstory_knightlight_06a_33"
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
					name = "Knight_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KLSTing"
					},
					content = {
						"eventstory_knightlight_06a_34"
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
						"eventstory_knightlight_06a_35"
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
					name = "Knight_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KLSTing"
					},
					content = {
						"eventstory_knightlight_06a_36"
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
						"eventstory_knightlight_06a_37"
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
					name = "Knight_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KLSTing"
					},
					content = {
						"eventstory_knightlight_06a_38"
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
						"eventstory_knightlight_06a_39"
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_ketang"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "moveTo",
			actor = __getnode__(_root, "GLTe"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.48,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_huiyi")
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
					name = "Knight_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"GLTe"
					},
					content = {
						"eventstory_knightlight_06a_40"
					},
					durations = {
						0.03
					}
				}
			end
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
								x = 0.54,
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
						image = "glte/face_glte_5.png",
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
							"eventstory_knightlight_06a_41"
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
						"eventstory_knightlight_06a_42"
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
				action = "moveTo",
				actor = __getnode__(_root, "GLTe"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.48,
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
			action = "moveTo",
			actor = __getnode__(_root, "GLTe"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 1.5,
							y = 0.1
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_chongfeng"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_knightlight_06a_43"
					},
					storyLove = {}
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
							"eventstory_knightlight_06a_44"
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
							"eventstory_knightlight_06a_45"
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
			actor = __getnode__(_root, "AEn"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_chongfeng"),
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
					duration = 0.5,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.48,
							y = 0
						}
					}
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
						"eventstory_knightlight_06a_46"
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
						"eventstory_knightlight_06a_47"
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
						"eventstory_knightlight_06a_48"
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
						"eventstory_knightlight_06a_49"
					},
					durations = {
						0.03
					}
				}
			end
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
						"eventstory_knightlight_06a_50"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "GLTe"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0.4
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.7
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
					duration = 0.1
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
			actor = __getnode__(_root, "Mus_xisheng")
		})
	})
end

local function eventstory_knightlight_06a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_knightlight_06a",
					scene = scene_eventstory_knightlight_06a
				}
			end
		})
	})
end

stories.eventstory_knightlight_06a = eventstory_knightlight_06a

return _M
