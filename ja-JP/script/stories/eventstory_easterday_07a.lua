local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_easterday_07a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_easterday_07a = {
	actions = {}
}
scenes.scene_eventstory_easterday_07a = scene_eventstory_easterday_07a

function scene_eventstory_easterday_07a:stage(args)
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
						image = "main_event_02.jpg",
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
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 21,
				visible = false,
				id = "Hit_texiao",
				scale = 1.05,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.25,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 11,
				visible = false,
				id = "liqi_Hit",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.25,
						y = 0.5
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
					x = 0.75,
					y = 0.5
				},
				position = {
					x = 0.75,
					y = 0.5
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 3,
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
						x = 0.75,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1300,
				visible = false,
				id = "panB",
				scale = 1.05,
				actionName = "zhuanchangb_juqingtexiao",
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
				id = "TV_flash",
				layoutMode = 1,
				visible = false,
				type = "MessageNode",
				scale = 0.85,
				zorder = 10000,
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.6
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 3,
				visible = false,
				id = "tongxun_all",
				scale = 3.5,
				actionName = "tongxun_juqingtexiao",
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
				id = "ZTXChangAttack_Sound",
				fileName = "Se_Skill_Cut_4",
				type = "Sound"
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
				id = "Mus_Story_Common_1_1",
				fileName = "Mus_Story_Common_1_1",
				type = "Music"
			},
			{
				id = "Mus_Story_Whale",
				fileName = "Mus_Story_Whale",
				type = "Music"
			},
			{
				id = "Mus_Story_Playground_Confused",
				fileName = "Mus_Story_Playground_Confused",
				type = "Music"
			},
			{
				id = "Mus_Story_Playground_Confused_Block_1",
				fileName = "Mus_Story_Playground_Confused_Block_1",
				type = "Music"
			},
			{
				id = "Mus_Story_Home",
				fileName = "Mus_Story_Home",
				type = "Music"
			},
			{
				id = "Mus_Story_Home_Block_1",
				fileName = "Mus_Story_Home_Block_1",
				type = "Music"
			},
			{
				id = "Mus_Story_Common_2",
				fileName = "Mus_Story_Common_2",
				type = "Music"
			},
			{
				id = "Mus_Story_Playground_Confused",
				fileName = "Mus_Story_Playground_Confused",
				type = "Music"
			},
			{
				id = "ID：Mus_Story_Suspense_Block_1",
				fileName = "ID：Mus_Story_Suspense_Block_1",
				type = "Music"
			},
			{
				id = "Mus_Story_Suspense",
				fileName = "Mus_Story_Suspense",
				type = "Music"
			},
			{
				id = "Se_Story_Chapter_14_15",
				fileName = "Se_Story_Chapter_14_15",
				type = "Sound"
			},
			{
				id = "Se_Story_Nightmare_Single_Small",
				fileName = "Se_Story_Nightmare_Single_Small",
				type = "Sound"
			},
			{
				id = "Se_Story_Nightmare_Many",
				fileName = "Se_Story_Nightmare_Many",
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
			},
			{
				id = "mask",
				type = "Mask"
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 230,
				videoName = "story_huiyi",
				id = "effects_oldfilm",
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
				id = "Mail_Sound",
				fileName = "Se_Story_Communicate",
				type = "Sound"
			},
			{
				id = "Mus_Story_Common_2",
				fileName = "Mus_Story_Common_2",
				type = "Music"
			},
			{
				id = "Mus_Main_Scene",
				fileName = "Mus_Main_Scene",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_easterday_07a.actions.start_eventstory_easterday_07a(_root, args)
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
			actor = __getnode__(_root, "bg1")
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
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Playground_Confused"),
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
					modelId = "Model_Story_DDing_TNLang",
					id = "DDing_speak",
					rotationX = 0,
					scale = 1.15,
					position = {
						x = 0,
						y = -250,
						refpt = {
							x = 0.55,
							y = -0.1
						}
					},
					children = {
						{
							resType = 0,
							name = "DDing_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "DDing_TNLang/DDing_TNLang_face_story_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "DDing_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -14.5,
								y = 661.5
							}
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "DDing_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DDing_speak"),
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
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "DDing_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_CLMan",
					id = "CLMan_speak",
					rotationX = 0,
					scale = 0.9,
					zorder = 5,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 0.225,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "CLMan_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "CLMan/CLMan_face_5.png",
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
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan_speak"),
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
					name = "dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CLMan_speak"
					},
					content = {
						"eventstory_easterday_07a_2"
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
					modelId = "Model_Story_ZTXChang",
					id = "ZTXChang_speak",
					rotationX = 0,
					scale = 1.08,
					zorder = 4,
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.8,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ZTXChang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ZTXChang/ZTXChang_face_5.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ZTXChang_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -50.8,
								y = 789
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"eventstory_easterday_07a_3"
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
					name = "dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CLMan_speak"
					},
					content = {
						"eventstory_easterday_07a_4"
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"eventstory_easterday_07a_5"
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
					duration = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "effects_oldfilm"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan_speak"),
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "DDing_speak"),
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
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_6"
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
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_7"
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
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_8"
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
					modelId = "Model_Enemy_Story_Normal",
					id = "Dayanguai",
					rotationX = 0,
					scale = 0.8,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 1.6,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Dayanguai"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Dayanguai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Enemy_Story_Normal",
					id = "Dayanguai2",
					rotationX = 0,
					scale = 0.8,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 1.7,
							y = -0.1
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Dayanguai2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Dayanguai2"),
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
				actor = __getnode__(_root, "Se_Story_Nightmare_Single_Small")
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_43",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Dayanguai"
						},
						content = {
							"eventstory_easterday_07a_9"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Dayanguai"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -80,
							refpt = {
								x = 1.2,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Dayanguai2"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -80,
							refpt = {
								x = 1.3,
								y = -0.1
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_43",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Dayanguai"
						},
						content = {
							"eventstory_easterday_07a_10"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "DDing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "DDing_TNLang/DDing_TNLang_face_story_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Dayanguai"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -80,
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
				actor = __getnode__(_root, "Dayanguai2"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -80,
							refpt = {
								x = 0.85,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "DDing_speak"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.25,
								y = -0.1
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
			action = "play",
			actor = __getnode__(_root, "Hit_texiao")
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
			actor = __getnode__(_root, "DDing_speak"),
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
			actor = __getnode__(_root, "Dayanguai"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "Dayanguai2"),
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
			action = "play",
			actor = __getnode__(_root, "liqi_Hit")
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
			actor = __getnode__(_root, "DDing_speak"),
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
			action = "play",
			actor = __getnode__(_root, "dunqi_juqingtexiao")
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
			actor = __getnode__(_root, "Dayanguai"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "Dayanguai2"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_11"
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
					name = "dialog_speak_name_43",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Dayanguai"
					},
					content = {
						"eventstory_easterday_07a_12"
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
					name = "dialog_speak_name_43",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Dayanguai"
					},
					content = {
						"eventstory_easterday_07a_13"
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
					name = "dialog_speak_name_43",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Dayanguai"
					},
					content = {
						"eventstory_easterday_07a_14"
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
					name = "dialog_speak_name_43",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Dayanguai"
					},
					content = {
						"eventstory_easterday_07a_15"
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
					name = "dialog_speak_name_43",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Dayanguai"
					},
					content = {
						"eventstory_easterday_07a_16"
					},
					durations = {
						0.03
					}
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
			actor = __getnode__(_root, "DDing_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -250,
						refpt = {
							x = -0.5,
							y = -0.1
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
			action = "moveTo",
			actor = __getnode__(_root, "Dayanguai"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = -0.5,
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
			action = "moveTo",
			actor = __getnode__(_root, "Dayanguai2"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = -0.4,
							y = -0.1
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
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "effects_oldfilm")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "DDing_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -250,
						refpt = {
							x = 0.5,
							y = -0.1
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
					duration = 2
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_18"
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
					modelId = "Model_LYSi",
					id = "LYSi_speak",
					rotationX = 0,
					scale = 1.075,
					zorder = 2,
					position = {
						x = 0,
						y = -305,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "LYSi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "LYSi/LYSi_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "LYSi_face",
							anchorPoint = {
								x = 0.5,
								y = 0
							},
							position = {
								x = -5,
								y = 622
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LYSi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LYSi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DDing_speak"),
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
					name = "dialog_speak_name_215",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYSi_speak"
					},
					content = {
						"eventstory_easterday_07a_19"
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
						"eventstory_easterday_07a_20"
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LYSi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DDing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CLMan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "CLMan/CLMan_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DDing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan_speak"),
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"eventstory_easterday_07a_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DDing_speak"),
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
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_24"
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
						"eventstory_easterday_07a_25"
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_26"
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
						"eventstory_easterday_07a_27"
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DDing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan_speak"),
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"eventstory_easterday_07a_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DDing_speak"),
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
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_5.png",
					pathType = "STORY_FACE"
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DDing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan_speak"),
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"eventstory_easterday_07a_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DDing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_32"
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
						"eventstory_easterday_07a_33"
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_FTLEShi",
					id = "FTLEShi_speak",
					rotationX = 0,
					scale = 1.025,
					zorder = 3,
					position = {
						x = 0,
						y = -510,
						refpt = {
							x = 0.75,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "FTLEShi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "FTLEShi/FTLEShi_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "FTLEShi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -16,
								y = 998
							}
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.55,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DDing_speak"),
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
					name = "dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_easterday_07a_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"eventstory_easterday_07a_35"
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
						"eventstory_easterday_07a_36"
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LYSi_speak"),
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
				actor = __getnode__(_root, "LYSi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LYSi/LYSi_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_215",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LYSi_speak"
						},
						content = {
							"eventstory_easterday_07a_37"
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
			actor = __getnode__(_root, "LYSi_speak"),
			args = function (_ctx)
				return {
					duration = 0.75,
					position = {
						x = 0,
						y = -305,
						refpt = {
							x = 0.7,
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
					modelId = "Model_Story_ALSi_TGWu",
					id = "ALSi_speak",
					rotationX = 0,
					scale = 1,
					position = {
						x = 0,
						y = -133,
						refpt = {
							x = 0.275,
							y = -0.1
						}
					},
					children = {
						{
							resType = 0,
							name = "ALSi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ALSi_TGWu/ALSi_TGWu_face_story_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ALSi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -24,
								y = 572
							}
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALSi_TGWu/ALSi_TGWu_face_story_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALSi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSi_speak"),
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
					name = "dialog_speak_name_121",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALSi_speak"
					},
					content = {
						"eventstory_easterday_07a_38"
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
					name = "dialog_speak_name_121",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALSi_speak"
					},
					content = {
						"eventstory_easterday_07a_39"
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
					name = "dialog_speak_name_121",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALSi_speak"
					},
					content = {
						"eventstory_easterday_07a_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYSi/LYSi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_215",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYSi_speak"
					},
					content = {
						"eventstory_easterday_07a_41"
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
					name = "dialog_speak_name_121",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALSi_speak"
					},
					content = {
						"eventstory_easterday_07a_42"
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
					name = "dialog_speak_name_215",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYSi_speak"
					},
					content = {
						"eventstory_easterday_07a_43"
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
					name = "dialog_speak_name_215",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYSi_speak"
					},
					content = {
						"eventstory_easterday_07a_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYSi/LYSi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_215",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYSi_speak"
					},
					content = {
						"eventstory_easterday_07a_45"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALSi_TGWu/ALSi_TGWu_face_story_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_121",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALSi_speak"
					},
					content = {
						"eventstory_easterday_07a_46"
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
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LYSi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALSi_speak"),
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"eventstory_easterday_07a_47"
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
						"eventstory_easterday_07a_48"
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYSi/LYSi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALSi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALSi_TGWu/ALSi_TGWu_face_story_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LYSi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALSi_speak"),
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
					name = "dialog_speak_name_215",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYSi_speak"
					},
					content = {
						"eventstory_easterday_07a_49"
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
					name = "dialog_speak_name_121",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALSi_speak"
					},
					content = {
						"eventstory_easterday_07a_50"
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
					name = "dialog_speak_name_215",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYSi_speak"
					},
					content = {
						"eventstory_easterday_07a_51"
					},
					durations = {
						0.03
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
			action = "play",
			actor = __getnode__(_root, "dunqi_juqingtexiao")
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
				actor = __getnode__(_root, "LYSi_speak"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -305,
							refpt = {
								x = 0.75,
								y = -1
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "LYSi_speak"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DDing_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALSi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DDing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DDing_TNLang/DDing_TNLang_face_story_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_19",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DDing_speak"
					},
					content = {
						"eventstory_easterday_07a_52"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DDing_speak"),
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"eventstory_easterday_07a_53"
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
					name = "dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_easterday_07a_54"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "block",
				actor = __getnode__(_root, "Mus_Story_Playground_Confused"),
				args = function (_ctx)
					return {
						blockId = "Mus_Story_Playground_Confused_Block_1"
					}
				end
			}),
			act({
				action = "show",
				actor = __getnode__(_root, "dialogueChoose"),
				args = function (_ctx)
					return {
						content = {
							"eventstory_easterday_07a_55"
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
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		})
	})
end

local function eventstory_easterday_07a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_easterday_07a",
					scene = scene_eventstory_easterday_07a
				}
			end
		})
	})
end

stories.eventstory_easterday_07a = eventstory_easterday_07a

return _M
