local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_dreamtowersd_05a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_dreamtowersd_05a = {
	actions = {}
}
scenes.scene_eventstory_dreamtowersd_05a = scene_eventstory_dreamtowersd_05a

function scene_eventstory_dreamtowersd_05a:stage(args)
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
				id = "Mus_Story_Playground_Fear",
				fileName = "Mus_Story_Playground_Fear",
				type = "Music"
			},
			{
				id = "Se_Story_Vortex",
				fileName = "Se_Story_Vortex",
				type = "Sound"
			},
			{
				id = "Se_Skill_Magic_Spark_1",
				fileName = "Se_Skill_Magic_Spark_1",
				type = "Sound"
			},
			{
				id = "jiaobusheng2",
				fileName = "Se_Story_Marble",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1100,
				visible = false,
				id = "mofa_hit",
				scale = 2,
				actionName = "mofa_gongji_juqing",
				anchorPoint = {
					x = 0.5,
					y = 0.45
				},
				position = {
					x = 600,
					y = 500
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 3,
				visible = false,
				id = "mengjinga_juqingtexiao",
				scale = 1.05,
				actionName = "mengjinga_juqingtexiao",
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

function scene_eventstory_dreamtowersd_05a.actions.start_eventstory_dreamtowersd_05a(_root, args)
	return sequential({
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Playground_Fear"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "mengjinga_juqingtexiao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Vortex")
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
					duration = 0.8
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
					duration = 1
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
					zorder = 10,
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
						duration = 0.2
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
						image = "PDLa/PDLa_face_5.png",
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
							"eventstory_dreamtowersd_05a_1"
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
						"eventstory_dreamtowersd_05a_2"
					},
					storyLove = {}
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
							"eventstory_dreamtowersd_05a_3"
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
						image = "PDLa/PDLa_face_4.png",
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
							"eventstory_dreamtowersd_05a_4"
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
						"eventstory_dreamtowersd_05a_5",
						"eventstory_dreamtowersd_05a_6",
						"eventstory_dreamtowersd_05a_7"
					},
					storyLove = {}
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
							"eventstory_dreamtowersd_05a_8"
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
						"eventstory_dreamtowersd_05a_9"
					},
					storyLove = {}
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
							"eventstory_dreamtowersd_05a_10"
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
						"eventstory_dreamtowersd_05a_11"
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
						"eventstory_dreamtowersd_05a_12"
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
						image = "PDLa/PDLa_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"eventstory_dreamtowersd_05a_13"
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
				action = "show",
				actor = __getnode__(_root, "dialogueChoose"),
				args = function (_ctx)
					return {
						content = {
							"eventstory_dreamtowersd_05a_14"
						},
						storyLove = {}
					}
				end
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_ADHWShi_sd",
						id = "ADHWShi",
						rotationX = 0,
						scale = 0.92,
						zorder = 5,
						position = {
							x = 0,
							y = -325,
							refpt = {
								x = -0.35,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ADHWShi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "nnli_sd/nnli_sd_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ADHWShi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 48,
									y = 805.5
								}
							}
						}
					}
				end
			}),
			concurrent({
				act({
					action = "updateNode",
					actor = __getnode__(_root, "ADHWShi"),
					args = function (_ctx)
						return {
							opacity = 0
						}
					end
				}),
				act({
					action = "orbitCamera",
					actor = __getnode__(_root, "ADHWShi"),
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
					actor = __getnode__(_root, "ADHWShi"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				})
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ADHWShi"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -325,
							refpt = {
								x = 0.25,
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
						duration = 0.4,
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
				actor = __getnode__(_root, "ADHWShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nnli_sd/nnli_sd_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ADHWShi"
						},
						content = {
							"eventstory_dreamtowersd_05a_15"
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
					name = "DTshuangdan_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ADHWShi"
					},
					content = {
						"eventstory_dreamtowersd_05a_16"
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
							"eventstory_dreamtowersd_05a_17"
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
				actor = __getnode__(_root, "ADHWShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nnli_sd/nnli_sd_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ADHWShi"
						},
						content = {
							"eventstory_dreamtowersd_05a_18"
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
				actor = __getnode__(_root, "ADHWShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nnli_sd/nnli_sd_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ADHWShi"
						},
						content = {
							"eventstory_dreamtowersd_05a_19"
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
					name = "DTshuangdan_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ADHWShi"
					},
					content = {
						"eventstory_dreamtowersd_05a_20"
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
					name = "DTshuangdan_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ADHWShi"
					},
					content = {
						"eventstory_dreamtowersd_05a_21"
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
						image = "PDLa/PDLa_face_4.png",
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
							"eventstory_dreamtowersd_05a_22"
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
				actor = __getnode__(_root, "ADHWShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nnli_sd/nnli_sd_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ADHWShi"
						},
						content = {
							"eventstory_dreamtowersd_05a_23"
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
				actor = __getnode__(_root, "ADHWShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nnli_sd/nnli_sd_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ADHWShi"
						},
						content = {
							"eventstory_dreamtowersd_05a_24"
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
						"eventstory_dreamtowersd_05a_25"
					},
					storyLove = {}
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
							"eventstory_dreamtowersd_05a_26"
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
					name = "DTshuangdan_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ADHWShi"
					},
					content = {
						"eventstory_dreamtowersd_05a_27"
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
						"eventstory_dreamtowersd_05a_28"
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
							"eventstory_dreamtowersd_05a_29"
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
				actor = __getnode__(_root, "ADHWShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nnli_sd/nnli_sd_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ADHWShi"
						},
						content = {
							"eventstory_dreamtowersd_05a_30"
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
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "mofa_hit"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Skill_Magic_Spark_1")
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_NFEr",
						id = "NFEr",
						rotationX = 0,
						scale = 0.8,
						zorder = 5,
						position = {
							x = 0,
							y = -580,
							refpt = {
								x = -0.35,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "NFEr_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "nfer/nfe_face_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "NFEr_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -38.8,
									y = 1324.4
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "NFEr"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "NFEr"),
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
				actor = __getnode__(_root, "NFEr"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -270,
						refpt = {
							x = 1.45,
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ADHWShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nnli_sd/nnli_sd_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "jiaobusheng2")
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "NFEr"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = -580,
							refpt = {
								x = 0.8,
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
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "NFEr"),
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
						name = "DTshuangdan_dialog_speak_name_10",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"NFEr"
						},
						content = {
							"eventstory_dreamtowersd_05a_31"
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
					name = "DTshuangdan_dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFEr"
					},
					content = {
						"eventstory_dreamtowersd_05a_32"
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
				actor = __getnode__(_root, "ADHWShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nnli_sd/nnli_sd_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ADHWShi"
						},
						content = {
							"eventstory_dreamtowersd_05a_33"
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
				actor = __getnode__(_root, "NFEr_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nfer/nfe_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_10",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"NFEr"
						},
						content = {
							"eventstory_dreamtowersd_05a_34"
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
					name = "DTshuangdan_dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFEr"
					},
					content = {
						"eventstory_dreamtowersd_05a_35"
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
				actor = __getnode__(_root, "NFEr"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ADHWShi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "PDLa"),
			args = function (_ctx)
				return {
					duration = 0.4,
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
					duration = 0.4
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
				action = "changeTexture",
				actor = __getnode__(_root, "ADHWShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nnli_sd/nnli_sd_face_5.png",
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
							"eventstory_dreamtowersd_05a_36"
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
				actor = __getnode__(_root, "PDLa"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "NFEr"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ADHWShi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFEr_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "nfer/nfe_face_2.png",
					pathType = "STORY_FACE"
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
				actor = __getnode__(_root, "NFEr_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "nfer/nfe_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DTshuangdan_dialog_speak_name_10",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"NFEr"
						},
						content = {
							"eventstory_dreamtowersd_05a_37"
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		})
	})
end

local function eventstory_dreamtowersd_05a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_dreamtowersd_05a",
					scene = scene_eventstory_dreamtowersd_05a
				}
			end
		})
	})
end

stories.eventstory_dreamtowersd_05a = eventstory_dreamtowersd_05a

return _M
