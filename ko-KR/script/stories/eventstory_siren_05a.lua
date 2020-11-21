local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_siren_05a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_siren_05a = {
	actions = {}
}
scenes.scene_eventstory_siren_05a = scene_eventstory_siren_05a

function scene_eventstory_siren_05a:stage(args)
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
						brightness = 0,
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
				id = "Mus_Story_Summer",
				fileName = "Mus_Story_Summer",
				type = "Music"
			},
			{
				id = "Se_Amb_Storm",
				fileName = "Se_Amb_Storm",
				type = "Sound"
			},
			{
				id = "Se_Effect_Wave",
				fileName = "Se_Effect_Wave",
				type = "Sound"
			},
			{
				id = "Se_Story_Chapter_14_15",
				fileName = "Se_Story_Chapter_14_15",
				type = "Sound"
			},
			{
				id = "Mus_Main_Scene",
				fileName = "Mus_Main_Scene",
				type = "Music"
			},
			{
				id = "Mus_Story_Whale",
				fileName = "Mus_Story_Whale",
				type = "Music"
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 2,
				videoName = "story_huiyi",
				id = "story_huiyi",
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
				type = "MovieClip",
				zorder = 3,
				visible = false,
				id = "huiyib_juqingtexiao",
				scale = 1.05,
				actionName = "huiyib_juqingtexiao",
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
				id = "Se_Effect_Wave",
				fileName = "Se_Effect_Wave",
				type = "Sound"
			},
			{
				id = "Se_Effect_Rain",
				fileName = "Se_Effect_Rain",
				type = "Sound"
			},
			{
				id = "Se_Effect_Thunder_1",
				fileName = "Se_Effect_Thunder_1",
				type = "Sound"
			},
			{
				id = "Se_Effect_Thunder_2",
				fileName = "Se_Effect_Thunder_2",
				type = "Sound"
			},
			{
				id = "Se_Effect_Thunder_3",
				fileName = "Se_Effect_Thunder_3",
				type = "Sound"
			},
			{
				id = "Se_Effect_Thunder_4",
				fileName = "Se_Effect_Thunder_4",
				type = "Sound"
			},
			{
				id = "Se_Story_Nightmare_Many",
				fileName = "Se_Story_Nightmare_Many",
				type = "Sound"
			},
			{
				id = "Se_Story_Nightmare_Single_Small",
				fileName = "Se_Story_Nightmare_Single_Small",
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

function scene_eventstory_siren_05a.actions.start_eventstory_siren_05a(_root, args)
	return sequential({
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Research")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Playground")
		}),
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "chapterDialog"),
				args = function (_ctx)
					return {
						content = {
							"eventstory_siren_05a_1",
							{
								"eventstory_siren_05a_2",
								"eventstory_siren_05a_3",
								"eventstory_siren_05a_4",
								"eventstory_siren_05a_5"
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Chapter_14_15"),
				args = function (_ctx)
					return {
						isLoop = false
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "chapterDialog")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Intro_Chapter"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = true,
					heightSpace = 12,
					content = {
						"eventstory_siren_05a_6",
						"eventstory_siren_05a_7",
						"eventstory_siren_05a_8",
						"eventstory_siren_05a_9"
					},
					waitTimes = {
						5
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Intro_Chapter")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "story_huiyi"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
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
			actor = __getnode__(_root, "Mus_Story_Whale"),
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
					modelId = "Model_Story_SRen",
					id = "SRen_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 5,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SRen_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SRen/SRen_face_1.png",
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
					name = "dialog_speak_name_243",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_10"
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
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_243",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SRen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					brightness = 0,
					modelId = "Model_JDCZhang",
					id = "JDCZhang_speak",
					rotationX = 0,
					scale = 1.05,
					zorder = 6,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.35,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "JDCZhang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "JDCZhang/JDCZhang_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "JDCZhang_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -46,
								y = 750.7
							}
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
					modelId = "Model_HLMGen",
					id = "HLMGen_speak",
					rotationX = 0,
					scale = 1.05,
					zorder = 6,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.75,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "HLMGen_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "HLMGen/HLMGen_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "HLMGen_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -35,
								y = 718
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JDCZhang_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JDCZhang_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "HLMGen_speak"),
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
					name = "dialog_speak_name_244",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_siren_05a_12"
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
					name = "dialog_speak_name_245",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_siren_05a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JDCZhang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JDCZhang/JDCZhang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_244",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_siren_05a_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_245",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_siren_05a_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JDCZhang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JDCZhang/JDCZhang_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_244",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_siren_05a_16"
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
					duration = 0.25
				}
			end
		}),
		concurrent({
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						brightness = -100,
						duration = 0.75
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "stroy_chuxian"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Amb_Storm"),
				args = function (_ctx)
					return {
						isLoop = true
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
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_245",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_siren_05a_17"
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
						name = "dialog_speak_name_245",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"HLMGen_speak"
						},
						content = {
							"eventstory_siren_05a_18"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "JDCZhang_speak"),
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
				action = "fadeOut",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						duration = 1.5
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg2"),
				args = function (_ctx)
					return {
						duration = 1.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JDCZhang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JDCZhang/JDCZhang_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_244",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_siren_05a_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_245",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_siren_05a_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
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
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JDCZhang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JDCZhang/JDCZhang_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_244",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_siren_05a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_245",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_siren_05a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_244",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_siren_05a_23"
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
					name = "dialog_speak_name_245",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_siren_05a_24"
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
						name = "dialog_speak_name_244",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"JDCZhang_speak"
						},
						content = {
							"eventstory_siren_05a_25"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.4,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.45,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.5,
							y = 0.3
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.55,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.6,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.65,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.7,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.75,
							y = -0.2
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.8,
							y = -0.3
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 1.8,
							y = -1.3
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
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.7,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.65,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.6,
							y = 0.3
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.55,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.5,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
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
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.4,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.35,
							y = -0.2
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.3,
							y = -0.3
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = -0.7,
							y = -1.3
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SRen_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		concurrent({
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 2
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_243",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SRen_speak"
						},
						content = {
							"eventstory_siren_05a_26"
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
					name = "dialog_speak_name_243",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_27"
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
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_243",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SRen_speak"
						},
						content = {
							"eventstory_siren_05a_28"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "stroy_chuxian")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "Se_Amb_Storm")
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						duration = 1.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg2"),
				args = function (_ctx)
					return {
						duration = 1.5
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						brightness = 0,
						duration = 1
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.35,
							y = -1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.75,
							y = -1
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.8,
							y = -1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 1.5,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.8,
							y = -0.3
						}
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					height = 10,
					duration = 1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_245",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_siren_05a_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JDCZhang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JDCZhang/JDCZhang_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.3,
							y = -1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 1.5,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.3,
							y = -0.3
						}
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					height = 10,
					duration = 1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_244",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_siren_05a_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "JDCZhang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JDCZhang/JDCZhang_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_244",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_siren_05a_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_245",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_siren_05a_32"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_243",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "repeatUpDownEnd",
			actor = __getnode__(_root, "JDCZhang_speak")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_244",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_siren_05a_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = -0.5,
							y = -0.3
						}
					}
				}
			end
		}),
		act({
			action = "repeatUpDownEnd",
			actor = __getnode__(_root, "HLMGen_speak")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_245",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_siren_05a_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 1.5,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = -0.5,
							y = -0.3
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_243",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_36"
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SRen_speak"),
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
					duration = 1.5
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_siren_05a_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SRen_speak"),
			args = function (_ctx)
				return {
					duration = 0.15
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_243",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SRen_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					brightness = -255,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					brightness = -255,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JDCZhang_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 0.35,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.75,
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
					name = "dialog_speak_name_246",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_siren_05a_39"
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
					name = "dialog_speak_name_247",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_siren_05a_40"
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
					name = "dialog_speak_name_246",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_siren_05a_41"
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
					name = "dialog_speak_name_247",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_siren_05a_42"
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
				actor = __getnode__(_root, "JDCZhang_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SRen_speak"),
			args = function (_ctx)
				return {
					duration = 0.15
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_243",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_43"
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
					id = "ALNa_speak1",
					rotationX = 0,
					scale = 0.8,
					zorder = 4,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.5,
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
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak1"),
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
					modelId = "Model_Story_SRen",
					id = "ALNa_speak2",
					rotationX = 0,
					scale = 0.8,
					zorder = 3,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.5,
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
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak1"),
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
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "paly",
				actor = __getnode__(_root, "Se_Story_Nightmare_Many")
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.3,
								y = 0.05
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.7,
								y = 0.05
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.35,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.65,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak2"),
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
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.4,
								y = 0.15
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.6,
								y = 0.15
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.45,
								y = 0.2
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.55,
								y = 0.2
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "paly",
				actor = __getnode__(_root, "Se_Story_Nightmare_Single_Small")
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.5,
								y = 0.25
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.5,
								y = 0.25
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.55,
								y = 0.2
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.45,
								y = 0.2
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak2"),
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
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.6,
								y = 0.15
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.4,
								y = 0.15
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.65,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.35,
								y = 0.1
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "paly",
				actor = __getnode__(_root, "Se_Story_Nightmare_Many")
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.7,
								y = 0.05
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.3,
								y = 0.05
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_6.png",
					pathType = "STORY_FACE"
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
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_7.png",
					pathType = "STORY_FACE"
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
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_45"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_243",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_46"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_7.png",
					pathType = "STORY_FACE"
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
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_6.png",
					pathType = "STORY_FACE"
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
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_48"
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
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_7.png",
					pathType = "STORY_FACE"
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
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_50"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.5,
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
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.5,
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
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 1,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_243",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_51"
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SRen_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "story_huiyi")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1.5
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
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SRen_speak"),
			args = function (_ctx)
				return {
					duration = 0,
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_BBLMa_YZhuang",
					id = "BBLMa_speak",
					rotationX = 0,
					scale = 1,
					zorder = 10,
					position = {
						x = 0,
						y = -355,
						refpt = {
							x = 0.8,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "BBLMa_YZhuang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "BBLMa_YZhuang/BBLMa_YZhuang_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "BBLMa_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 0,
								y = 820
							}
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"eventstory_siren_05a_52"
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
					modelId = "Model_Story_MLYTLSha_YZhuang",
					id = "MLYTLSha_speak",
					rotationX = 0,
					scale = 1.1,
					zorder = 8,
					position = {
						x = 0,
						y = -270,
						refpt = {
							x = 0.6,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "MLYTLSha_YZhuang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "MLYTLSha_YZhuang/MLYTLSha_YZhuang_face_4.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "MLYTLSha_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -29,
								y = 609
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MLYTLSha_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MLYTLSha_speak"),
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
					name = "dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"eventstory_siren_05a_53"
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
					modelId = "Model_Story_CZheng_YZhuang",
					id = "CZheng_speak",
					rotationX = 0,
					scale = 0.95,
					zorder = 9,
					position = {
						x = 0,
						y = -315,
						refpt = {
							x = 0.6,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "CZheng_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "CZheng_YZhuang/CZheng_YZhuang_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "CZheng_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 6.5,
								y = 794
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "MLYTLSha_speak"),
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
					name = "dialog_speak_name_18",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"eventstory_siren_05a_54"
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
					name = "dialog_speak_name_239",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_55"
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
					modelId = "Model_Story_WEDe_YZhuang",
					id = "WEDe_speak",
					rotationX = 0,
					scale = 0.9,
					zorder = 11,
					position = {
						x = 0,
						y = -360,
						refpt = {
							x = 0.8,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "WEDe_YZhuang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "WEDe_YZhuang/WEDe_YZhuang_face_2.png",
							scaleX = 0.9875,
							scaleY = 0.9875,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "WEDe_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -41.5,
								y = 946
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "WEDe_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "WEDe_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_82",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe_speak"
					},
					content = {
						"eventstory_siren_05a_56"
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
					name = "dialog_speak_name_239",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_57"
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
				actor = __getnode__(_root, "WEDe_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"eventstory_siren_05a_58"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MLYTLSha_speak"),
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
					name = "dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"eventstory_siren_05a_59"
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
					name = "dialog_speak_name_239",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen_speak"
					},
					content = {
						"eventstory_siren_05a_60"
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
				actor = __getnode__(_root, "WEDe_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_82",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe_speak"
					},
					content = {
						"eventstory_siren_05a_61"
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
				actor = __getnode__(_root, "WEDe_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"eventstory_siren_05a_62"
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
					modelId = "Model_Story_AJTa",
					id = "AJTa_speak",
					rotationX = 0,
					scale = 0.6,
					zorder = 9,
					position = {
						x = 0,
						y = -130,
						refpt = {
							x = 0.75,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "AJTa_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "AJTa/AJTa_face_1.png",
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
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "WEDe_speak"),
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
					name = "dialog_speak_name_238",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AJTa_speak"
					},
					content = {
						"eventstory_siren_05a_63"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MLYTLSha_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MLYTLSha_YZhuang/MLYTLSha_YZhuang_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "AJTa_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYTLSha_speak"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -270,
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
					name = "dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"eventstory_siren_05a_64"
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
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Whale")
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

local function eventstory_siren_05a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_siren_05a",
					scene = scene_eventstory_siren_05a
				}
			end
		})
	})
end

stories.eventstory_siren_05a = eventstory_siren_05a

return _M
