local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story09_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story09_1a = {
	actions = {}
}
scenes.scene_story09_1a = scene_story09_1a

function scene_story09_1a:stage(args)
	return {
		name = "root",
		type = "Stage",
		id = "root",
		position = {
			x = 0,
			y = 0
		},
		size = {
			width = 1386,
			height = 852
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
						image = "bg_story_cg_00_7.jpg",
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
						name = "bg2",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_5_1.jpg",
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
						},
						children = {
							{
								layoutMode = 1,
								type = "MovieClip",
								zorder = 3,
								visible = true,
								id = "bgEx_bennengsiqihuoqian",
								scale = 1,
								actionName = "all_bennengsiqihuoqian",
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 115,
				visible = false,
				id = "beiji_juqingtexiao",
				scale = 1.05,
				actionName = "beiji_juqingtexiao",
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
				zorder = 2,
				videoName = "story_juqi",
				id = "story_juqi",
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
				zorder = 111,
				visible = false,
				id = "liqi_juqingtexiao",
				scale = 1.05,
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
				id = "startingSound_story",
				fileName = "Se_Story_Chapter_8_9",
				type = "Music"
			},
			{
				id = "previously_story",
				fileName = "Mus_Story_Intro_Chapter",
				type = "Music"
			},
			{
				id = "backGround_story",
				fileName = "Mus_Story_Common_2",
				type = "Music"
			},
			{
				id = "News_Music",
				fileName = "Mus_Story_Suspense",
				type = "Music"
			},
			{
				id = "backGround2_story",
				fileName = "Mus_Story_Mystery",
				type = "Music"
			},
			{
				id = "ZTXChangAttack_Sound",
				fileName = "Se_Skill_Cut_4",
				type = "Sound"
			},
			{
				id = "ZTXChangSkill_Sound",
				fileName = "Se_Skill_Sword_Chaos",
				type = "Sound"
			},
			{
				id = "FTLEShiAttack_Sound",
				fileName = "Se_Skill_Coffin_Hits",
				type = "Sound"
			},
			{
				id = "mask",
				type = "Mask"
			},
			{
				id = "Voice_Story_SGHQShou_01",
				fileName = "Voice_Story_SGHQShou_01",
				type = "Sound"
			},
			{
				id = "Voice_Story_SGHQShou_02",
				fileName = "Voice_Story_SGHQShou_02",
				type = "Sound"
			},
			{
				id = "Voice_Story_SGHQShou_03",
				fileName = "Voice_Story_SGHQShou_03",
				type = "Sound"
			},
			{
				id = "Voice_Story_SGHQShou_04",
				fileName = "Voice_Story_SGHQShou_04",
				type = "Sound"
			}
		},
		__actions__ = self.actions
	}
end

function scene_story09_1a.actions.start_story09_1a(_root, args)
	return sequential({
		act({
			action = "stop",
			actor = __getnode__(_root, "backGround_story")
		}),
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "chapterDialog"),
				args = function (_ctx)
					return {
						content = {
							"story09_1a_1",
							{
								"story09_1a_2",
								"story09_1a_3"
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "startingSound_story")
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "chapterDialog")
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
			actor = __getnode__(_root, "previously_story"),
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
						"story09_1a_4",
						"story09_1a_5",
						"story09_1a_6",
						"story09_1a_7",
						"story09_1a_8",
						"story09_1a_9",
						"story09_1a_10",
						"story09_1a_11",
						"story09_1a_12"
					},
					waitTimes = {
						7
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
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEX_bennengsi"),
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
					duration = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "backGround_story"),
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
					modelId = "Model_Story_SGHQShou02",
					id = "SGHQShou2_speak",
					rotationX = 0,
					scale = 1.3,
					zorder = 2,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.45,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SGHQShou02_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SGHQShou/SGHQShou02_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SGHQShou02_face",
							scale = 1,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 33.6,
								y = 674.8
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SGHQShou2_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou2_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_SGHQShou_01")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_13"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_14"
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
					modelId = "Model_Story_SGHQShou01",
					id = "SGHQShou1_speak",
					rotationX = 0,
					scale = 1.175,
					zorder = 6,
					position = {
						x = 0,
						y = -265,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SGHQShou01_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SGHQShou/SGHQShou01_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SGHQShou01_face",
							scale = 1,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 28.5,
								y = 515
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SGHQShou1_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou1_speak"),
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
					name = "dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story09_1a_15"
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
					name = "dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story09_1a_16"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_17"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_18"
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
					modelId = "Model_Story_SGHQShou03",
					id = "SGHQShou3_speak",
					rotationX = 0,
					scale = 1.23,
					zorder = 1,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.65,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SGHQShou03_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SGHQShou/SGHQShou03_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SGHQShou03_face",
							scale = 1,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 33.6,
								y = 681.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SGHQShou3_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou3_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_SGHQShou_02")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story09_1a_19"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_20"
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story09_1a_21"
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
					name = "dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story09_1a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "SGHQShou2_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		act({
			action = "UpDown",
			actor = __getnode__(_root, "SGHQShou2_speak"),
			args = function (_ctx)
				return {
					height = 2,
					duration = 0.1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_23"
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story09_1a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_SGHQShou_03")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_25"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_26"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_27"
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
					name = "dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story09_1a_28"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_29"
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
					name = "dialog_speak_name_149",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story09_1a_30"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_31"
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story09_1a_32"
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
					name = "dialog_speak_name_150",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story09_1a_33"
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story09_1a_34"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_35"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_36"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_37"
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
					name = "dialog_speak_name_151",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story09_1a_38"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_39"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_40"
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
					name = "dialog_speak_name_151",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story09_1a_41"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_42"
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
					name = "dialog_speak_name_151",
					dialogImage = "jq_dialogue_bg_5.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story09_1a_43"
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story09_1a_44"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_45"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "chapterDialog")
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
			action = "play",
			actor = __getnode__(_root, "News_Music"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "newsNode"),
			args = function (_ctx)
				return {
					city = "news_city_01",
					img = "bg_story_cg_09_1.jpg",
					time = "15:22",
					title = "news_title_03",
					content = {
						"story09_1a_46",
						"story09_1a_47",
						"story09_1a_48"
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "newsNode")
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_49"
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story09_1a_50"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_51"
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story09_1a_52"
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story09_1a_53"
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
					name = "dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story09_1a_54"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SGHQShou2_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_SGHQShou",
					id = "SGHQShou_speak",
					rotationX = 0,
					scale = 1.275,
					position = {
						x = 0,
						y = -420,
						refpt = {
							x = 0.45,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SGHQShou_face01",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SGHQShou/SGHQShou01_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SGHQShou_face01",
							scale = 1,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -122.8,
								y = 541.2
							}
						},
						{
							resType = 0,
							name = "SGHQShou_face02",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SGHQShou/SGHQShou02_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SGHQShou_face02",
							scale = 1,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 17.25,
								y = 685.8
							}
						},
						{
							resType = 0,
							name = "SGHQShou_face03",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SGHQShou/SGHQShou03_face_1.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SGHQShou_face03",
							scale = 1,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 141.2,
								y = 756.8
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SGHQShou_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_SGHQShou_04")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_104",
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou_speak"
					},
					content = {
						"story09_1a_55"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "block",
			actor = __getnode__(_root, "News_Music"),
			args = function (_ctx)
				return {
					blockId = "Mus_Story_Suspense_Block_1"
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
		})
	})
end

local function story09_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story09_1a",
					scene = scene_story09_1a
				}
			end
		})
	})
end

stories.story09_1a = story09_1a

return _M
