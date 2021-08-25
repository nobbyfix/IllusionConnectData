local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_404_06a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_404_06a = {
	actions = {}
}
scenes.scene_eventstory_404_06a = scene_eventstory_404_06a

function scene_eventstory_404_06a:stage(args)
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
						name = "bg_diandao",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_riddle_2.jpg",
						scaleX = 1,
						scaleY = -1,
						zorder = 20,
						layoutMode = 1,
						id = "bg_diandao",
						anchorPoint = {
							x = 0.5,
							y = 1
						},
						position = {
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					},
					{
						resType = 0,
						name = "bg_zhedang",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "hm.png",
						layoutMode = 1,
						zorder = 80,
						id = "bg_zhedang",
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
						name = "bg_zheng",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_riddle_2.jpg",
						layoutMode = 1,
						zorder = 20,
						id = "bg_zheng",
						scale = 1,
						anchorPoint = {
							x = 0.5,
							y = 1
						},
						position = {
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					},
					{
						resType = 0,
						name = "bg_louding",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_riddle_2.jpg",
						layoutMode = 1,
						zorder = 150,
						id = "bg_louding",
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
						name = "bg_keting",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_0_2.jpg",
						layoutMode = 1,
						zorder = 5,
						id = "bg_keting",
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
						name = "CG_tiaolou",
						pathType = "SCENE",
						type = "Image",
						image = "scene_cg_riddle_3.jpg",
						layoutMode = 1,
						zorder = 100,
						id = "CG_tiaolou",
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
				id = "Mus_tuili",
				fileName = "Mus_Story_Detective_2",
				type = "Music"
			},
			{
				id = "yin_qiaomen",
				fileName = "Se_Story_Knock_Door",
				type = "Sound"
			},
			{
				id = "yin_fengsheng",
				fileName = "Se_Story_Wind_Jumping",
				type = "Sound"
			},
			{
				id = "yin_dong",
				fileName = "Se_Story_Smash_Body",
				type = "Sound"
			},
			{
				id = "yin_jiaobu_up",
				fileName = "Se_Story_Steps_Shoes_a",
				type = "Sound"
			},
			{
				id = "yin_nizhuan",
				fileName = "Se_Story_Collapse",
				type = "Sound"
			},
			{
				id = "yin_jiaobu_down",
				fileName = "Se_Story_Steps_Shoes_a",
				type = "Sound"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_404_06a.actions.start_eventstory_404_06a(_root, args)
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_FEMSi",
						id = "FEMSi",
						rotationX = 0,
						scale = 0.75,
						zorder = 50,
						position = {
							x = 0,
							y = -365,
							refpt = {
								x = 0.53,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "FEMSi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "xlte/face_xlte_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "FEMSi_face",
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
				actor = __getnode__(_root, "FEMSi"),
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
						modelId = "Model_HSheng",
						id = "HSheng",
						rotationX = 0,
						scale = 0.75,
						zorder = 50,
						position = {
							x = 0,
							y = -260,
							refpt = {
								x = 0.51,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "HSheng_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "alin/face_alin_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "HSheng_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 49,
									y = 908
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "HSheng"),
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
						modelId = "Model_Story_JYing4",
						id = "DaGongRen",
						rotationX = 0,
						scale = 0.9,
						zorder = 250,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "DaGongRen"),
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
						modelId = "Model_MLYDi",
						id = "MLYDi",
						rotationX = 0,
						scale = 0.7,
						zorder = 50,
						position = {
							x = 0,
							y = -520,
							refpt = {
								x = 0.45,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "MLYDi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "jni/face_jni_4.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "MLYDi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 92,
									y = 1382
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MLYDi"),
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
						scale = 0.9,
						zorder = 50,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.47,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CLMan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "CLMan/CLMan_face_1.png",
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
									x = 60.5,
									y = 787
								}
							}
						}
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_keting"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -280,
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
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "DaGongRen"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -365,
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
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_tuili"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_qiaomen"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"404Riddle_dialog_speak_name_7"
						},
						content = {
							"eventstory_404_06a_1"
						},
						durations = {
							0.03
						}
					}
				end
			})
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_404_06a_2"
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
				actor = __getnode__(_root, "DaGongRen"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"DaGongRen"
						},
						content = {
							"eventstory_404_06a_3"
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.47,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_404_06a_4"
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
				action = "moveTo",
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -365,
							refpt = {
								x = 0.73,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "HSheng"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -260,
							refpt = {
								x = 0.31,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "HSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "alin/face_alin_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DaGongRen"),
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
						duration = 0,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.27,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "UpDown",
				actor = __getnode__(_root, "CLMan"),
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
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jiaobu_up"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_5"
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
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "HSheng"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"HSheng"
						},
						content = {
							"eventstory_404_06a_6"
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
				actor = __getnode__(_root, "FEMSi_face"),
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
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_7"
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
			action = "orbitCamera",
			actor = __getnode__(_root, "FEMSi"),
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
				actor = __getnode__(_root, "yin_jiaobu_down"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -365,
							refpt = {
								x = 1.5,
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
					duration = 0.3
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "HSheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "alin/face_alin_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "HSheng"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -260,
							refpt = {
								x = 0.51,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FEMSi"),
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "404Riddle_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng"
					},
					content = {
						"eventstory_404_06a_8"
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
						"eventstory_404_06a_9"
					},
					storyLove = {}
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "HSheng"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_keting"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg_louding"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -520,
							refpt = {
								x = 0.2,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						brightness = -255,
						duration = 0.3
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -365,
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
				actor = __getnode__(_root, "FEMSi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xlte/face_xlte_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"404Riddle_dialog_speak_name_7"
						},
						content = {
							"eventstory_404_06a_10"
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
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_11"
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
					name = "404Riddle_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi"
					},
					content = {
						"eventstory_404_06a_12"
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
				actor = __getnode__(_root, "FEMSi_face"),
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
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_13"
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
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -520,
							refpt = {
								x = 0.45,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						brightness = 0,
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MLYDi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "jni/face_jni_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_14"
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
				action = "scaleTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						scale = 0.75,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -520,
							refpt = {
								x = 0.45,
								y = -0.12
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
						name = "404Riddle_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_15"
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
				action = "scaleTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -520,
							refpt = {
								x = 0.2,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FEMSi"),
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
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "FEMSi_face"),
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
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_16"
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
					name = "404Riddle_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYDi"
					},
					content = {
						"eventstory_404_06a_17"
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
				actor = __getnode__(_root, "FEMSi_face"),
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
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_18"
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
				action = "rock",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "FEMSi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xlte/face_xlte_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_19"
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
				action = "play",
				actor = __getnode__(_root, "yin_jiaobu_up"),
				args = function (_ctx)
					return {
						tim = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MLYDi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "jni/face_jni_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -520,
							refpt = {
								x = 0.25,
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
						name = "404Riddle_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_20"
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
				action = "rock",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -365,
							refpt = {
								x = 0.83,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "FEMSi_face"),
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
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_21"
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
				actor = __getnode__(_root, "MLYDi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "jni/face_jni_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_22"
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
					name = "404Riddle_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi"
					},
					content = {
						"eventstory_404_06a_23"
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
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						scale = 0.75,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -520,
							refpt = {
								x = 0.45,
								y = -0.15
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jiaobu_up"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "404Riddle_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYDi"
					},
					content = {
						"eventstory_404_06a_24"
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
				actor = __getnode__(_root, "MLYDi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "jni/face_jni_1.png",
						pathType = "STORY_FACE"
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_25"
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
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "MLYDi"),
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
					duration = 0.15
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
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_louding"),
				args = function (_ctx)
					return {
						scale = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_nizhuan"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CG_tiaolou"),
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
					duration = 0.1
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "bg_louding"),
			args = function (_ctx)
				return {
					deltaAngle = 180,
					duration = 4
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
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_louding"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_louding"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 2.5
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -520,
							refpt = {
								x = 0.2,
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
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_26"
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
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_27"
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
					name = "404Riddle_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYDi"
					},
					content = {
						"eventstory_404_06a_28"
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
				actor = __getnode__(_root, "bg_diandao"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "FEMSi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -365,
							refpt = {
								x = 0.78,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg_diandao"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg_zheng"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MLYDi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "jni/face_jni_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_29"
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
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
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
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_30"
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
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_31"
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
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MLYDi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "jni/face_jni_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_32"
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
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "FEMSi_face"),
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
						name = "404Riddle_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FEMSi"
						},
						content = {
							"eventstory_404_06a_33"
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
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MLYDi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "jni/face_jni_2.png",
						pathType = "STORY_FACE"
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
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_34"
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
				actor = __getnode__(_root, "bg_zhedang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg_diandao"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYDi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -520,
							refpt = {
								x = 0.45,
								y = 0
							}
						}
					}
				end
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
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYDi"
						},
						content = {
							"eventstory_404_06a_35"
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
				actor = __getnode__(_root, "CG_tiaolou"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_fengsheng"),
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
					duration = 0.4
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_dong"),
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
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "404Riddle_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"404Riddle_dialog_speak_name_7"
						},
						content = {
							"eventstory_404_06a_36"
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
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_diandao"),
				args = function (_ctx)
					return {
						duration = 0.8,
						position = {
							refpt = {
								x = 0.5,
								y = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_zheng"),
				args = function (_ctx)
					return {
						duration = 0.8,
						position = {
							refpt = {
								x = 0.5,
								y = 0.4
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_diandao"),
				args = function (_ctx)
					return {
						duration = 1.6,
						position = {
							refpt = {
								x = 0.5,
								y = 1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_zheng"),
				args = function (_ctx)
					return {
						duration = 1.6,
						position = {
							refpt = {
								x = 0.5,
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
					duration = 2.4
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zheng"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_diandao"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "404Riddle_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"404Riddle_dialog_speak_name_7"
					},
					content = {
						"eventstory_404_06a_37"
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
					duration = 0.2
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
			action = "stop",
			actor = __getnode__(_root, "Mus_tuili")
		})
	})
end

local function eventstory_404_06a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_404_06a",
					scene = scene_eventstory_404_06a
				}
			end
		})
	})
end

stories.eventstory_404_06a = eventstory_404_06a

return _M
