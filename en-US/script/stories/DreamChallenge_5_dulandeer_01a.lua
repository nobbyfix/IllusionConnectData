local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.DreamChallenge_5_dulandeer_01a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_DreamChallenge_5_dulandeer_01a = {
	actions = {}
}
scenes.scene_DreamChallenge_5_dulandeer_01a = scene_DreamChallenge_5_dulandeer_01a

function scene_DreamChallenge_5_dulandeer_01a:stage(args)
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
				name = "bg1",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_scene_1_7.jpg",
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
				image = "mjt_img_dlde_bg.jpg",
				layoutMode = 1,
				zorder = 30,
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
			},
			{
				layoutMode = 1,
				name = "bg",
				type = "ColorBackGround",
				zorder = 25,
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
				id = "Mus_zaijia",
				fileName = "Mus_Story_Common_1_1",
				type = "Music"
			},
			{
				id = "Mus_huiyi",
				fileName = "Mus_Story_Memory",
				type = "Music"
			},
			{
				id = "Mus_qishi",
				fileName = "Mus_Story_Yehuo_2",
				type = "Music"
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
			}
		},
		__actions__ = self.actions
	}
end

function scene_DreamChallenge_5_dulandeer_01a.actions.start_DreamChallenge_5_dulandeer_01a(_root, args)
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
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					center = 1,
					content = {
						"DreamChallenge_5_dulandeer_01a_1",
						"DreamChallenge_5_dulandeer_01a_2",
						"DreamChallenge_5_dulandeer_01a_3",
						"DreamChallenge_5_dulandeer_01a_4"
					},
					durations = {
						0.07,
						0.07,
						0.07,
						0.07
					},
					waitTimes = {
						1,
						1,
						1,
						1.2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg1")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_huiyi"),
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
					modelId = "Model_LLan",
					id = "LLan",
					rotationX = 0,
					scale = 1.05,
					zorder = 20,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "LLan_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "LLan/LLan_face_5.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "LLan_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -9.5,
								y = 770.8
							}
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "LLan"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					brightness = 255,
					modelId = "Model_Story_Sword",
					id = "Sword0",
					rotationX = 0,
					scale = 0.9,
					zorder = 15,
					position = {
						x = -418,
						y = 278,
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
			action = "rotateBy",
			actor = __getnode__(_root, "Sword0"),
			args = function (_ctx)
				return {
					deltaAngle = 121.61,
					duration = 0
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "Sword0"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_JNLong",
					id = "JNLong",
					rotationX = 0,
					scale = 1.02,
					zorder = 15,
					position = {
						x = -160,
						y = -335,
						refpt = {
							x = 0.7,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "JNLong_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "JNLong/JNLong_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "JNLong_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 177.5,
								y = 806.5
							}
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JNLong"),
			args = function (_ctx)
				return {
					opacity = 0
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "LLan"),
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_5"
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
			action = "changeTexture",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ybxrdxh_fb_Snowflake_bg.jpg",
					pathType = "SCENE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LLan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LLan/Llan_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LLan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.3,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JNLong"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			actor = __getnode__(_root, "effects_oldfilm"),
			args = function (_ctx)
				return {
					time = -1
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
				actor = __getnode__(_root, "JNLong_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "JNLong/JNLong_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"JNLong"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_6"
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_7"
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/Llan_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_8"
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/Llan_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_9"
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
				actor = __getnode__(_root, "JNLong_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "JNLong/JNLong_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"JNLong"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_10"
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
			action = "changeTexture",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "bg_story_scene_1_7.jpg",
					pathType = "SCENE"
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "effects_oldfilm")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LLan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -345,
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
			actor = __getnode__(_root, "JNLong"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LLan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LLan/LLan_face_5.png",
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
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_zaijia"),
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_11"
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_12"
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_13"
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_14"
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_15"
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
			actor = __getnode__(_root, "Sword0"),
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
			actor = __getnode__(_root, "Sword0"),
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_16"
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
			actor = __getnode__(_root, "Sword0"),
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
			actor = __getnode__(_root, "Sword0"),
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_17"
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
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Sword0"),
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
		sequential({
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
				actor = __getnode__(_root, "LLan"),
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
					duration = 1.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Sword0"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "LLan"),
			args = function (_ctx)
				return {
					zorder = 40
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "LLan"),
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
					modelId = "Model_Story_Sword",
					id = "DLDEr",
					rotationX = 0,
					scale = 0.6,
					zorder = 42,
					position = {
						x = 0,
						y = -66,
						refpt = {
							x = 0.7,
							y = 0
						}
					},
					children = {}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "DLDEr"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_18"
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
					name = "DC5_dulandeer_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_19"
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		sequential({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -345,
							refpt = {
								x = 0.3,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DLDEr"),
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DC5_dulandeer_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DLDEr"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_21"
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_22"
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_23"
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
					name = "DC5_dulandeer_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DLDEr"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_24"
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
					name = "DC5_dulandeer_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DLDEr"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_25"
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_26"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		sequential({
			act({
				action = "hide",
				actor = __getnode__(_root, "dialogue")
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
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg2"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
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
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing2",
						id = "ALWei",
						rotationX = 0,
						scale = 1.05,
						zorder = 35,
						position = {
							x = 0,
							y = -440,
							refpt = {
								x = 0.9,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ALWei"),
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
				actor = __getnode__(_root, "ALWei"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "DLDEr"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "colorBg")
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "ALWei"),
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
					name = "DC5_dulandeer_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALWei"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_27"
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
					name = "DC5_dulandeer_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALWei"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_28"
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
					name = "DC5_dulandeer_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALWei"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_29"
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_30"
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
					name = "DC5_dulandeer_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALWei"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_31"
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
					name = "DC5_dulandeer_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALWei"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_32"
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_33"
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_34"
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
					name = "DC5_dulandeer_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALWei"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_35"
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
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "DC5_dulandeer_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALWei"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_36"
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
					name = "DC5_dulandeer_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALWei"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_37"
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_38"
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
					action = "moveTo",
					actor = __getnode__(_root, "ALWei"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -440,
								refpt = {
									x = 0.9,
									y = -0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ALWei"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -440,
								refpt = {
									x = 0.9,
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
						name = "DC5_dulandeer_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALWei"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_39"
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
					duration = 0.1
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "ALWei"),
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
			actor = __getnode__(_root, "ALWei"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -440,
						refpt = {
							x = 1.35,
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
				action = "moveTo",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -345,
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
				actor = __getnode__(_root, "ALWei"),
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
						name = "DC5_dulandeer_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LLan"
						},
						content = {
							"DreamChallenge_5_dulandeer_01a_40"
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
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_41"
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
			actor = __getnode__(_root, "LLan"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 1.35,
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DC5_dulandeer_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LLan"
					},
					content = {
						"DreamChallenge_5_dulandeer_01a_42"
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "LLan"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "Mus_qishi")
		})
	})
end

local function DreamChallenge_5_dulandeer_01a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_DreamChallenge_5_dulandeer_01a",
					scene = scene_DreamChallenge_5_dulandeer_01a
				}
			end
		})
	})
end

stories.DreamChallenge_5_dulandeer_01a = DreamChallenge_5_dulandeer_01a

return _M
