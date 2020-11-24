local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_siren_002a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_siren_002a = {
	actions = {}
}
scenes.scene_eventstory_siren_002a = scene_eventstory_siren_002a

function scene_eventstory_siren_002a:stage(args)
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
						name = "bg1",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_13_1.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg1",
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
						name = "bg2",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_13_2.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg2",
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
				type = "MovieClip",
				zorder = 1100,
				visible = false,
				id = "mofa_gongji_juqing",
				scale = 1.5,
				actionName = "mofa_gongji_juqing",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					x = 400,
					y = 100
				}
			},
			{
				id = "Mus_Story_Research",
				fileName = "Mus_Story_Research",
				type = "Music"
			},
			{
				id = "Mus_Story_Intro_Chapter",
				fileName = "Mus_Story_Intro_Chapter",
				type = "Music"
			},
			{
				id = "Se_Story_Chapter_14_15",
				fileName = "Se_Story_Chapter_14_15",
				type = "Sound"
			},
			{
				id = "Mus_Story_Summer",
				fileName = "Mus_Story_Summer",
				type = "Music"
			},
			{
				id = "Mus_Story_Suspense",
				fileName = "Mus_Story_Suspense",
				type = "Music"
			},
			{
				id = "Mus_Main_Scene",
				fileName = "Mus_Main_Scene",
				type = "Music"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 20,
				visible = false,
				id = "dunqi_juqingtexiao",
				scale = 1.05,
				actionName = "dunqi_juqingtexiao",
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
				id = "Se_Story_Impact_1",
				fileName = "Se_Story_Impact_1",
				type = "Sound"
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 2,
				videoName = "stroy_chuxian",
				id = "stroy_chuxian",
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

function scene_eventstory_siren_002a.actions.start_eventstory_siren_002a(_root, args)
	return sequential({
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Research")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Playground")
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg2")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Research"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "autoPlayButton")
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
			actor = __getnode__(_root, "hideButton")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Suspense"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_AJTa",
					id = "AJTa_speak",
					rotationX = 0,
					scale = 0.6,
					zorder = 6,
					position = {
						x = 0,
						y = -130,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "AJTa_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "AJTa/AJTa_face_5.png",
							scaleX = 0.975,
							scaleY = 0.975,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "AJTa_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 143.5,
								y = 845
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_1"
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_2"
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_3"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_SRen",
					id = "SRen_speak1",
					rotationX = 0,
					scale = 0.8,
					zorder = 5,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 1.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SRen_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SRen/SRen_face_7.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SRen_face1",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -7,
								y = 673
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SRen_speak1"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SRen_speak1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SRen_speak1"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -200,
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_4"
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
				actor = __getnode__(_root, "SRen_speak1"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
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
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -130,
							refpt = {
								x = 0.75,
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
					name = "dialog_speak_name_240",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak1"
					},
					content = {
						"eventstory_siren_002a_5"
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_6"
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
					name = "dialog_speak_name_240",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak1"
					},
					content = {
						"eventstory_siren_002a_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_SRen",
					id = "SRen_speak2",
					rotationX = 0,
					scale = 0.8,
					zorder = 5,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 1.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SRen_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SRen/SRen_face_6.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SRen_face2",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -7,
								y = 673
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SRen_speak2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SRen_speak2"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SRen_speak1"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -130,
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
				actor = __getnode__(_root, "SRen_speak2"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.75,
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
					name = "dialog_speak_name_242",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak2"
					},
					content = {
						"eventstory_siren_002a_8"
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_9"
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
					name = "dialog_speak_name_242",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak2"
					},
					content = {
						"eventstory_siren_002a_10"
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_11"
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
				actor = __getnode__(_root, "SRen_speak1"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
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
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -130,
							refpt = {
								x = 0.75,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SRen_speak2"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 1.35,
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
					name = "dialog_speak_name_240",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak1"
					},
					content = {
						"eventstory_siren_002a_12"
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
					name = "dialog_speak_name_240",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak1"
					},
					content = {
						"eventstory_siren_002a_13"
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
					name = "dialog_speak_name_240",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak1"
					},
					content = {
						"eventstory_siren_002a_14"
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_15"
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
				actor = __getnode__(_root, "SRen_speak1"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -130,
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
				actor = __getnode__(_root, "SRen_speak2"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.75,
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
					name = "dialog_speak_name_242",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak2"
					},
					content = {
						"eventstory_siren_002a_16"
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_17"
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
					name = "dialog_speak_name_242",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak2"
					},
					content = {
						"eventstory_siren_002a_18"
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
						name = "dialog_speak_name_238",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"AJTa_speak"
						},
						content = {
							"eventstory_siren_002a_19"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			})
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "AJTa_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SRen_speak1"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
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
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -130,
							refpt = {
								x = 0.75,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SRen_speak2"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 1.35,
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
					name = "dialog_speak_name_240",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak1"
					},
					content = {
						"eventstory_siren_002a_20"
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_21"
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
				actor = __getnode__(_root, "SRen_speak1"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = -0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -130,
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
				actor = __getnode__(_root, "SRen_speak2"),
				args = function (_ctx)
					return {
						duration = 0.75,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.75,
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
					name = "dialog_speak_name_242",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak2"
					},
					content = {
						"eventstory_siren_002a_22"
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_002a_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "mofa_gongji_juqing")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "SRen_speak2"),
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
					duration = 0.1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SRen_speak2"),
			args = function (_ctx)
				return {
					duration = 0.75,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 1.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					brightness = 0,
					modelId = "Model_Story_SRen",
					id = "SRen_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 5,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.75,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SRen_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SRen/SRen_face_4.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SRen_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -7,
								y = 673
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SRen_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SRen_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_239",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_002a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "block",
			actor = __getnode__(_root, "Mus_Story_Suspense"),
			args = function (_ctx)
				return {
					blockId = "Mus_Story_Suspense_Block_1"
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
					duration = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Summer"),
			args = function (_ctx)
				return {
					isloop = true
				}
			end
		})
	})
end

local function eventstory_siren_002a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_siren_002a",
					scene = scene_eventstory_siren_002a
				}
			end
		})
	})
end

stories.eventstory_siren_002a = eventstory_siren_002a

return _M
