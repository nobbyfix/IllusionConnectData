local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_dreamtowersd_06a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_dreamtowersd_06a = {
	actions = {}
}
scenes.scene_eventstory_dreamtowersd_06a = scene_eventstory_dreamtowersd_06a

function scene_eventstory_dreamtowersd_06a:stage(args)
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
				name = "bg",
				pathType = "SCENE",
				type = "Image",
				image = "anualshop_scene_stagenewyear.jpg",
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
				},
				children = {}
			},
			{
				id = "Mus_Story_Stage",
				fileName = "Mus_Story_Stage",
				type = "Music"
			},
			{
				id = "Mus_Story_Danger_2",
				fileName = "Mus_Story_Danger_2",
				type = "Music"
			},
			{
				id = "qiangpao_hitSound",
				fileName = "Se_Story_Muou_Attack",
				type = "Sound"
			},
			{
				id = "liqi_hitSound",
				fileName = "Se_Skill_Cut_5",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 99999,
				visible = false,
				id = "liqi_hit",
				scale = 1,
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
				zorder = 99999,
				visible = false,
				id = "qiangpao_hit",
				scale = 1.5,
				actionName = "qiangpao_gongji_juqing",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.35
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_dreamtowersd_06a.actions.start_eventstory_dreamtowersd_06a(_root, args)
	return sequential({
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_Story_Stage"),
				args = function (_ctx)
					return {
						isLoop = true
					}
				end
			})
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1.2
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_PDLa",
					id = "PDLa",
					rotationX = 0,
					scale = 1.18,
					zorder = 18,
					position = {
						x = 0,
						y = -270,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "PDLa_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "PDLa/PDLa_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "PDLa_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -28,
								y = 567.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PDLa"
						},
						content = {
							"eventstory_dreamtowersd_06a_1"
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
					name = "DTshuangdan_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"PDLa"
					},
					content = {
						"eventstory_dreamtowersd_06a_2"
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
						"eventstory_dreamtowersd_06a_3"
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
					name = "DTshuangdan_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"PDLa"
					},
					content = {
						"eventstory_dreamtowersd_06a_4"
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
					name = "DTshuangdan_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"PDLa"
					},
					content = {
						"eventstory_dreamtowersd_06a_5"
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
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PDLa"
						},
						content = {
							"eventstory_dreamtowersd_06a_6"
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
						"eventstory_dreamtowersd_06a_7",
						"eventstory_dreamtowersd_06a_8"
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
					name = "DTshuangdan_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"PDLa"
					},
					content = {
						"eventstory_dreamtowersd_06a_9"
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
					name = "DTshuangdan_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"PDLa"
					},
					content = {
						"eventstory_dreamtowersd_06a_10"
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
					name = "DTshuangdan_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"PDLa"
					},
					content = {
						"eventstory_dreamtowersd_06a_11"
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
				actor = __getnode__(_root, "liqi_hitSound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.45,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.2,
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "liqi_hit")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PDLa"
						},
						content = {
							"eventstory_dreamtowersd_06a_12"
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
			actor = __getnode__(_root, "liqi_hit"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.45,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "liqi_hit"),
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
				action = "play",
				actor = __getnode__(_root, "liqi_hitSound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.6,
								y = -0.1
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.2,
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "liqi_hit")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "liqi_hit"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.55,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "liqi_hit"),
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
				action = "play",
				actor = __getnode__(_root, "liqi_hitSound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.4,
								y = -0.1
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.2,
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "liqi_hit")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "liqi_hit"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.55,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "liqi_hit"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "liqi_hit"),
			args = function (_ctx)
				return {
					deltaAngle = 45,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_hitSound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						scale = 0.9,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.5,
								y = 0.1
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						scale = 1.18,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
			action = "hide",
			actor = __getnode__(_root, "liqi_hit")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PDLa"
						},
						content = {
							"eventstory_dreamtowersd_06a_13"
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
					name = "DTshuangdan_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"PDLa"
					},
					content = {
						"eventstory_dreamtowersd_06a_14"
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
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PDLa"
						},
						content = {
							"eventstory_dreamtowersd_06a_15"
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
						"eventstory_dreamtowersd_06a_16"
					},
					storyLove = {}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_Story_Danger_2"),
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
						name = "DTshuangdan_dialog_speak_name_21",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DTshuangdan_dialog_speak_name_21"
						},
						content = {
							"eventstory_dreamtowersd_06a_17"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SGHQShou_sd",
						id = "SGHQShou",
						rotationX = 0,
						scale = 0.66,
						zorder = 5,
						position = {
							x = 0,
							y = -155,
							refpt = {
								x = -0.45,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SGHQShou"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou"),
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
					duration = 0.5
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SGHQShou"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -155,
							refpt = {
								x = 0.2,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SGHQShou"),
				args = function (_ctx)
					return {
						zorder = 20
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.8,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DTshuangdan_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou"
					},
					content = {
						"eventstory_dreamtowersd_06a_18"
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
					name = "DTshuangdan_dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou"
					},
					content = {
						"eventstory_dreamtowersd_06a_19"
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
					name = "DTshuangdan_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou"
					},
					content = {
						"eventstory_dreamtowersd_06a_20"
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
					name = "DTshuangdan_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou"
					},
					content = {
						"eventstory_dreamtowersd_06a_21"
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
						"eventstory_dreamtowersd_06a_22",
						"eventstory_dreamtowersd_06a_23"
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
					name = "DTshuangdan_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou"
					},
					content = {
						"eventstory_dreamtowersd_06a_24"
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
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PDLa"
						},
						content = {
							"eventstory_dreamtowersd_06a_25"
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
			actor = __getnode__(_root, "qiangpao_hit"),
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "qiangpao_hitSound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "qiangpao_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.85,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -270,
						refpt = {
							x = 0.8,
							y = 0
						}
					}
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
			action = "hide",
			actor = __getnode__(_root, "qiangpao_hit")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DTshuangdan_dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou"
					},
					content = {
						"eventstory_dreamtowersd_06a_26"
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
					name = "DTshuangdan_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou"
					},
					content = {
						"eventstory_dreamtowersd_06a_27"
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
					name = "DTshuangdan_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou"
					},
					content = {
						"eventstory_dreamtowersd_06a_28"
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
			actor = __getnode__(_root, "PDLa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "PDLa/PDLa_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "qiangpao_hit"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.6,
							y = 0.6
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "qiangpao_hitSound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "qiangpao_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.85,
								y = -0.1
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -270,
						refpt = {
							x = 0.8,
							y = 0
						}
					}
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
			action = "hide",
			actor = __getnode__(_root, "qiangpao_hit")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "qiangpao_hit"),
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "qiangpao_hitSound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "qiangpao_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.85,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -270,
						refpt = {
							x = 0.8,
							y = 0
						}
					}
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
			action = "hide",
			actor = __getnode__(_root, "qiangpao_hit")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "qiangpao_hit"),
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "qiangpao_hitSound")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "qiangpao_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.85,
								y = 0.1
							}
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -270,
						refpt = {
							x = 0.8,
							y = 0
						}
					}
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
			action = "hide",
			actor = __getnode__(_root, "qiangpao_hit")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PDLa"
						},
						content = {
							"eventstory_dreamtowersd_06a_29"
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
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PDLa"
						},
						content = {
							"eventstory_dreamtowersd_06a_30"
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
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.3,
								y = 0
							}
						}
					}
				end
			}),
			concurrent({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "SGHQShou"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -155,
								refpt = {
									x = -0.45,
									y = 0
								}
							}
						}
					end
				}),
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "PDLa"),
						args = function (_ctx)
							return {
								duration = 0.1,
								position = {
									x = 0,
									y = -270,
									refpt = {
										x = 0.45,
										y = 0
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "PDLa"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -270,
									refpt = {
										x = 0.55,
										y = 0
									}
								}
							}
						end
					})
				})
			})
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
				actor = __getnode__(_root, "PDLa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "PDLa/PDLa_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"PDLa"
						},
						content = {
							"eventstory_dreamtowersd_06a_31"
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
						"eventstory_dreamtowersd_06a_32"
					},
					storyLove = {}
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
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SGHQShou"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		})
	})
end

local function eventstory_dreamtowersd_06a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_dreamtowersd_06a",
					scene = scene_eventstory_dreamtowersd_06a
				}
			end
		})
	})
end

stories.eventstory_dreamtowersd_06a = eventstory_dreamtowersd_06a

return _M
