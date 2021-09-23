local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story03_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story03_1a = {
	actions = {}
}
scenes.scene_story03_1a = scene_story03_1a

function scene_story03_1a:stage(args)
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
						image = "bg_story_scene_1_7.jpg",
						layoutMode = 1,
						zorder = 1,
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
					},
					{
						resType = 0,
						name = "bg1",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_2_1.jpg",
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
						},
						children = {
							{
								id = "bgEX_motianlun",
								layoutMode = 1,
								type = "MovieClip",
								scale = 1,
								actionName = "anim_motianlun",
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
					}
				}
			},
			{
				id = "Se_Story_Chapter_2_3",
				fileName = "Se_Story_Chapter_2_3",
				type = "Music"
			},
			{
				id = "Ring_Sound",
				fileName = "Se_Story_Ring",
				type = "Sound"
			},
			{
				id = "Mus_Story_Intro_Chapter",
				fileName = "Mus_Story_Intro_Chapter",
				type = "Music"
			},
			{
				id = "Mus_Story_Memory",
				fileName = "Mus_Story_Memory",
				type = "Music"
			},
			{
				id = "Mus_Story_Playground",
				fileName = "Mus_Story_Playground",
				type = "Music"
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 99999,
				videoName = "story_huiyi",
				id = "effects_oldfilm",
				scale = 1.2,
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
				id = "Voice_Story_XLai_04",
				fileName = "Voice_Story_XLai_04",
				type = "Sound"
			},
			{
				id = "Voice_Story_XLai_05",
				fileName = "Voice_Story_XLai_05",
				type = "Sound"
			},
			{
				id = "Voice_Story_CLMan_04",
				fileName = "Voice_Story_CLMan_04",
				type = "Sound"
			}
		},
		__actions__ = self.actions
	}
end

function scene_story03_1a.actions.start_story03_1a(_root, args)
	return sequential({
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "chapterDialog"),
				args = function (_ctx)
					return {
						content = {
							"story03_1a_1",
							{
								"story03_1a_2",
								"story03_1a_3"
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Chapter_2_3"),
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
					heightSpace = 12,
					content = {
						"story03_1a_4",
						"story03_1a_5",
						"story03_1a_6",
						"story03_1a_7",
						"story03_1a_8",
						"story03_1a_9",
						"story03_1a_10",
						"story03_1a_11"
					},
					waitTimes = {
						10
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
			actor = __getnode__(_root, "effects_oldfilm"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
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
					duration = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Memory"),
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
					modelId = "Model_XLai",
					id = "XLai_speak",
					rotationX = 0,
					scale = 0.76,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.6,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "XLai_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "XLai/XLai_face_3.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "XLai_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 0.5,
								y = 899
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "XLai_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "XLai_speak"),
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
					name = "dialog_speak_name_88",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"story03_1a_12"
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
					name = "dialog_speak_name_88",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"story03_1a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					freq = 4,
					strength = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_XLai_04")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_14"
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
					duration = 0.5
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_89",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"story03_1a_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "XLai_speak"),
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
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_16"
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
					duration = 0.5
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_90",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"story03_1a_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					freq = 4,
					strength = 1
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "XLai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "XLai/XLai_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_19"
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
					duration = 1
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
					duration = 1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Ring_Sound")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_91",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"story03_1a_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "XLai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "XLai/XLai_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.6,
							y = 0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.6,
							y = 0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "XLai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "XLai/XLai_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.6,
							y = 0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.6,
							y = 0.05
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_XLai_05")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_22"
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
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "XLai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "XLai/XLai_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_24"
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
					duration = 1
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					visible = false
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "effects_oldfilm")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "XLai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "XLai/XLai_face_4.png",
					pathType = "STORY_FACE"
				}
			end
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_25"
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
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_26"
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
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "block",
			actor = __getnode__(_root, "Mus_Story_Memory"),
			args = function (_ctx)
				return {
					blockId = "Mus_Story_Memory_Block_1"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_CLMan_04")
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
					speakings = {},
					content = {
						"story03_1a_29"
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
		act({
			action = "updateNode",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					visible = true
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEX_motianlun"),
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
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.75,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Playground"),
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
					modelId = "Model_Story_CLMan",
					id = "CLMan_speak",
					rotationX = 0,
					scale = 0.63,
					position = {
						x = 0,
						y = -250,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "CLMan_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "CLMan/CLMan_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 3,
							visible = true,
							id = "CLMan_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 77.5,
								y = 1045.5
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
				action = "orbitCamera",
				actor = __getnode__(_root, "CLMan_speak"),
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
						"story03_1a_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "XLai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "XLai/XLai_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_31"
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
			action = "orbitCamera",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0.1,
					deltaAngleZ = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.8,
					position = {
						x = 0,
						y = -250,
						refpt = {
							x = -1.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "XLai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "XLai/XLai_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
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
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_79",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"XLai_speak"
					},
					content = {
						"story03_1a_32"
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
			actor = __getnode__(_root, "XLai_speak"),
			args = function (_ctx)
				return {
					duration = 0.8,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = -1.5,
							y = 0
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
					duration = 2
				}
			end
		})
	})
end

local function story03_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story03_1a",
					scene = scene_story03_1a
				}
			end
		})
	})
end

stories.story03_1a = story03_1a

return _M
