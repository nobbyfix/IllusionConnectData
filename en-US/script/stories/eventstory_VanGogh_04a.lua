local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_VanGogh_04a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_VanGogh_04a = {
	actions = {}
}
scenes.scene_eventstory_VanGogh_04a = scene_eventstory_VanGogh_04a

function scene_eventstory_VanGogh_04a:stage(args)
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
						name = "bg",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_sunflower_1.jpg",
						layoutMode = 1,
						zorder = 2,
						id = "bg",
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
				resType = 0,
				name = "cg1",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_cg_21gletter_1.jpg",
				layoutMode = 1,
				zorder = 30,
				id = "cg1",
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
				name = "cg2",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_cg_21gletter_2.jpg",
				layoutMode = 1,
				zorder = 20,
				id = "cg2",
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
				name = "cg3",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_cg_21gletter_3.jpg",
				layoutMode = 1,
				zorder = 15,
				id = "cg3",
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
				id = "Mus_shenmiao",
				fileName = "Mus_Story_VanGogh_Disappear",
				type = "Music"
			},
			{
				id = "Mus_beishang",
				fileName = "Mus_Story_VanGogh_Disappear",
				type = "Music"
			},
			{
				id = "Mus_meihao",
				fileName = "Mus_Story_VanGogh_Disappear",
				type = "Music"
			},
			{
				id = "yin_fengsheng",
				fileName = "Se_Skill_Wind",
				type = "Sound"
			},
			{
				id = "yin_maojiao",
				fileName = "Voice_SDTZi_44",
				type = "Sound"
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				additive = 1,
				zorder = 15,
				videoName = "story_juqixh",
				id = "xiao_linhunshou",
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
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_VanGogh_04a.actions.start_eventstory_VanGogh_04a(_root, args)
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_shenmiao"),
				args = function (_ctx)
					return {
						isLoop = true
					}
				end
			}),
			act({
				action = "activateNode",
				actor = __getnode__(_root, "bg")
			})
		}),
		act({
			action = "fadeOut",
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
					duration = 0.8
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					brightness = 25,
					modelId = "Model_Story_FGao_shield_l",
					id = "shenqi",
					rotationX = 0,
					scale = 0.3,
					zorder = 420,
					position = {
						x = 0,
						y = 400,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "shenqi"),
			args = function (_ctx)
				return {
					opacity = 0
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_NCai",
						id = "LDWXi",
						rotationX = 0,
						scale = 0.67,
						zorder = 150,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.14,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "LDWXi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ldwxi/face_ldwxi_10.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "LDWXi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -103.5,
									y = 1033.4
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "LDWXi"),
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
				actor = __getnode__(_root, "LDWXi"),
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
						modelId = "Model_YMHTPu",
						id = "YMHTPu",
						rotationX = 0,
						scale = 0.7,
						zorder = 120,
						position = {
							x = 0,
							y = -485,
							refpt = {
								x = 0.8,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "YMHTPu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "YMHTPu/YMHTPu_face_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "YMHTPu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -5,
									y = 1258
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "YMHTPu"),
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
				actor = __getnode__(_root, "YMHTPu"),
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
				actor = __getnode__(_root, "LDWXi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YMHTPu"),
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_1"
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
				actor = __getnode__(_root, "YMHTPu"),
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_2"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_3"
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
					duration = 1
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi",
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_4"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_5"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_6"
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
					name = "VanGogh_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LDWXi"
					},
					content = {
						"eventstory_VanGogh_04a_7"
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
			actor = __getnode__(_root, "LDWXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ldwxi/face_ldwxi_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.14,
							y = 0.2
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
					duration = 0.2
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
			actor = __getnode__(_root, "DMSe"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YMHTPu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.42,
							y = 0.25
						}
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "colorBg"),
			args = function (_ctx)
				return {
					bgColor = "#ffffff"
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
			action = "play",
			actor = __getnode__(_root, "xiao_linhunshou"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					brightness = 250,
					duration = 0.9
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.9
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_linhunshou")
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LDWXi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "flashMask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FFFFFF",
								fadeout = 0,
								alpha = 1,
								duration = 0.5,
								fadein = 0.3
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
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "colorBg")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "DMSe"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "YMHTPu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					brightness = -50,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.14,
							y = 0.2
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
			action = "moveTo",
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					duration = 0.6,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.14,
							y = 0
						}
					}
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_8"
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
				action = "fadeIn",
				actor = __getnode__(_root, "shenqi"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_9.png",
						pathType = "STORY_FACE"
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
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_9"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_10"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_11"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_12"
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
					name = "VanGogh_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LDWXi"
					},
					content = {
						"eventstory_VanGogh_04a_13"
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
					name = "VanGogh_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu"
					},
					content = {
						"eventstory_VanGogh_04a_14"
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
					name = "VanGogh_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LDWXi"
					},
					content = {
						"eventstory_VanGogh_04a_15"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi",
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_16"
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
					name = "VanGogh_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu"
					},
					content = {
						"eventstory_VanGogh_04a_17"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_18"
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
				actor = __getnode__(_root, "LDWXi"),
				args = function (_ctx)
					return {
						zorder = 550
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						zorder = 500
					}
				end
			}),
			sequential({
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "YMHTPu"),
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
				action = "orbitCamera",
				actor = __getnode__(_root, "YMHTPu"),
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_19"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_20"
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
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -485,
								refpt = {
									x = 0.8,
									y = -0.2
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -485,
								refpt = {
									x = 0.8,
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
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_21"
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
					name = "VanGogh_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LDWXi"
					},
					content = {
						"eventstory_VanGogh_04a_22"
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
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -485,
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
				actor = __getnode__(_root, "LDWXi"),
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
			})
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -485,
								refpt = {
									x = 0.2,
									y = 0.15
								}
							}
						}
					end
				}),
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "YMHTPu"),
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
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -485,
								refpt = {
									x = 0.2,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "LDWXi"),
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
					actor = __getnode__(_root, "LDWXi"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.72,
									y = 0
								}
							}
						}
					end
				})
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_23"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LDWXi"),
				args = function (_ctx)
					return {
						zorder = 500
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						zorder = 550
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "VanGogh_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LDWXi"
					},
					content = {
						"eventstory_VanGogh_04a_24"
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
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -485,
							refpt = {
								x = 0.8,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LDWXi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.27,
								y = 0
							}
						}
					}
				end
			})
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -485,
								refpt = {
									x = 0.8,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "YMHTPu"),
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
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -485,
								refpt = {
									x = 0.8,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "LDWXi"),
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
					actor = __getnode__(_root, "LDWXi"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -300,
								refpt = {
									x = 0.14,
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
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_25"
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
					name = "VanGogh_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LDWXi"
					},
					content = {
						"eventstory_VanGogh_04a_26"
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
					name = "VanGogh_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YMHTPu"
					},
					content = {
						"eventstory_VanGogh_04a_27"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_28"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_29"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_30"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_31"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_32"
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
			action = "play",
			actor = __getnode__(_root, "yin_fengsheng"),
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
			action = "stop",
			actor = __getnode__(_root, "yin_fengsheng")
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_33"
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
				actor = __getnode__(_root, "YMHTPu"),
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_34"
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
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -485,
								refpt = {
									x = 0.9,
									y = 0.2
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "YMHTPu"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -485,
								refpt = {
									x = 0.8,
									y = 0
								}
							}
						}
					end
				})
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "YMHTPu"),
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_35"
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
				action = "moveTo",
				actor = __getnode__(_root, "LDWXi"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.48,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LDWXi"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.14,
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
				action = "changeTexture",
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_36"
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
				actor = __getnode__(_root, "LDWXi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ldwxi/face_ldwxi_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LDWXi"
						},
						content = {
							"eventstory_VanGogh_04a_37"
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
				actor = __getnode__(_root, "YMHTPu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "YMHTPu/YMHTPu_face_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_38"
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
					name = "VanGogh_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LDWXi"
					},
					content = {
						"eventstory_VanGogh_04a_39"
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
				actor = __getnode__(_root, "YMHTPu"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -485,
							refpt = {
								x = 0.5,
								y = -0.1
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
						name = "VanGogh_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"YMHTPu"
						},
						content = {
							"eventstory_VanGogh_04a_40"
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
					duration = 0.1
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YMHTPu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "LDWXi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "shenqi"),
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
					bgImage = "bg_story_cg_21gletter_4.jpg",
					printAudioOff = true,
					bgShow = true,
					center = 2,
					content = {
						"eventstory_VanGogh_04a_41",
						"eventstory_VanGogh_04a_42",
						"eventstory_VanGogh_04a_43",
						"eventstory_VanGogh_04a_44",
						"eventstory_VanGogh_04a_45",
						"eventstory_VanGogh_04a_46",
						"eventstory_VanGogh_04a_47"
					},
					durations = {
						0.08,
						0.08,
						0.08,
						0.08,
						0.08,
						0.08,
						0.03
					},
					waitTimes = {
						0.9,
						0.9,
						0.9,
						0.9,
						0.9,
						0.9,
						2
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg3"),
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
					bgColor = "#ffffff"
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
			action = "fadeOut",
			actor = __getnode__(_root, "cg1"),
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "cg2"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "cg3"),
			args = function (_ctx)
				return {
					duration = 0.6
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_shenmiao")
		})
	})
end

local function eventstory_VanGogh_04a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_VanGogh_04a",
					scene = scene_eventstory_VanGogh_04a
				}
			end
		})
	})
end

stories.eventstory_VanGogh_04a = eventstory_VanGogh_04a

return _M
