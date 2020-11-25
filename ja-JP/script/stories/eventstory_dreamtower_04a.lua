local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_dreamtower_04a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_dreamtower_04a = {
	actions = {}
}
scenes.scene_eventstory_dreamtower_04a = scene_eventstory_dreamtower_04a

function scene_eventstory_dreamtower_04a:stage(args)
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
						image = "bg_story_scene_13_2.jpg",
						layoutMode = 1,
						id = "bg1",
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
						image = "battle_scene_12.jpg",
						layoutMode = 1,
						id = "bg2",
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
				id = "Se_Story_Chapter_14_15",
				fileName = "Se_Story_Chapter_14_15",
				type = "Sound"
			},
			{
				id = "Mus_Story_Mystery",
				fileName = "Mus_Story_Mystery",
				type = "Music"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100,
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
						x = 0.75,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100,
				visible = false,
				id = "beiji_juqingtexiao2",
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
				id = "Se_Story_Impact_1",
				fileName = "Se_Story_Impact_1",
				type = "Sound"
			},
			{
				id = "Se_Amb_Song",
				fileName = "Se_Amb_Song",
				type = "Sound"
			},
			{
				id = "Se_Effect_Wave",
				fileName = "Se_Effect_Wave",
				type = "Sound"
			},
			{
				id = "Se_Amb_Seagull",
				fileName = "Se_Amb_Seagull",
				type = "Sound"
			},
			{
				id = "Se_Amb_Storm",
				fileName = "Se_Amb_Storm",
				type = "Sound"
			},
			{
				id = "Mus_Story_Summer_Suspense",
				fileName = "Mus_Story_Summer_Suspense",
				type = "Music"
			},
			{
				id = "Mus_Story_Whale",
				fileName = "Mus_Story_Whale",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_dreamtower_04a.actions.start_eventstory_dreamtower_04a(_root, args)
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
			actor = __getnode__(_root, "Mus_Story_Summer_Suspense"),
			args = function (_ctx)
				return {
					isLoop = true
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
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_FTLEShi_WZi",
					id = "FTLEShi_speak",
					rotationX = 0,
					scale = 1.15,
					zorder = 5,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.225,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "FTLEShi_WZi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "FTLEShi_WZi/FTLEShi_WZi_face_3.png",
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
								x = 66,
								y = 770
							}
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
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_1"
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
							x = 0.8,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "JDCZhang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "JDCZhang/JDCZhang_face_3.png",
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
					zorder = 7,
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
							name = "HLMGen_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "HLMGen/HLMGen_face_4.png",
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
					name = "dialog_speak_name_264",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_dreamtower_04a_2"
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
					modelId = "Model_SDTZi",
					id = "SDTZi_speak",
					rotationX = 0,
					scale = 1.145,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.275,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SDTZi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SDTZi/SDTZi_face_4.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SDTZi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -79,
								y = 679.8
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SDTZi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SDTZi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi_speak"),
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
					name = "dialog_speak_name_145",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_3"
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
				actor = __getnode__(_root, "SDTZi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi_speak"),
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
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_4"
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
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_5"
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
					name = "dialog_speak_name_264",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_dreamtower_04a_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi_WZi/FTLEShi_WZi_face_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Amb_Song")
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
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_8"
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
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_SRen",
					id = "ALNa_speak1",
					rotationX = 0,
					scale = 0.8,
					zorder = 5,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.25,
							y = -1
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
					zorder = 5,
					position = {
						x = 0,
						y = -200,
						refpt = {
							x = 0.75,
							y = -1
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
				action = "moveTo",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 1,
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
						duration = 1,
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
						"ALNa_speak1"
					},
					content = {
						"eventstory_dreamtower_04a_9"
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
						"ALNa_speak2"
					},
					content = {
						"eventstory_dreamtower_04a_10"
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
						"ALNa_speak1"
					},
					content = {
						"eventstory_dreamtower_04a_11"
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
						"ALNa_speak2"
					},
					content = {
						"eventstory_dreamtower_04a_12"
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
						"ALNa_speak1"
					},
					content = {
						"eventstory_dreamtower_04a_13"
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
						"ALNa_speak2"
					},
					content = {
						"eventstory_dreamtower_04a_14"
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
						"ALNa_speak1"
					},
					content = {
						"eventstory_dreamtower_04a_15"
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
						"ALNa_speak2"
					},
					content = {
						"eventstory_dreamtower_04a_16"
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
						"ALNa_speak1"
					},
					content = {
						"eventstory_dreamtower_04a_17"
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
						"ALNa_speak2"
					},
					content = {
						"eventstory_dreamtower_04a_18"
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
						"ALNa_speak1"
					},
					content = {
						"eventstory_dreamtower_04a_19"
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
						"ALNa_speak2"
					},
					content = {
						"eventstory_dreamtower_04a_20"
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
					duration = 1
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak2"),
				args = function (_ctx)
					return {
						duration = 0.25
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
			action = "changeTexture",
			actor = __getnode__(_root, "JDCZhang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "JDCZhang/JDCZhang_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
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
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi_WZi/FTLEShi_WZi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_21"
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
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_22"
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
					name = "dialog_speak_name_264",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JDCZhang_speak"
					},
					content = {
						"eventstory_dreamtower_04a_23"
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
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -430,
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
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -315,
							refpt = {
								x = 0.65,
								y = 0.05
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
						duration = 0.25,
						position = {
							x = 0,
							y = -345,
							refpt = {
								x = 0.85,
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
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -430,
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
						duration = 0.25,
						position = {
							x = 0,
							y = -315,
							refpt = {
								x = 0.7,
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
						duration = 0.25,
						position = {
							x = 0,
							y = -345,
							refpt = {
								x = 0.9,
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
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 0.4,
								y = 0.05
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
						duration = 0.25,
						position = {
							x = 0,
							y = -315,
							refpt = {
								x = 0.75,
								y = 0.05
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
						duration = 0.25,
						position = {
							x = 0,
							y = -345,
							refpt = {
								x = 0.95,
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
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -430,
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
						duration = 0.25,
						position = {
							x = 0,
							y = -315,
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
				actor = __getnode__(_root, "JDCZhang_speak"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -345,
							refpt = {
								x = 1,
								y = 0
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
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
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALNa_speak2"),
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
					name = "dialog_speak_name_242",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALNa_speak1"
					},
					content = {
						"eventstory_dreamtower_04a_24"
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
						"ALNa_speak2"
					},
					content = {
						"eventstory_dreamtower_04a_25"
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
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -430,
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
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -315,
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
				actor = __getnode__(_root, "JDCZhang_speak"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -345,
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
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
				action = "fadeIn",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak1"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ALNa_speak2"),
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
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_26"
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
					name = "dialog_speak_name_266",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_dreamtower_04a_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi_WZi/FTLEShi_WZi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_28"
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
					duration = 1
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
			actor = __getnode__(_root, "Mus_Story_Summer_Suspense")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Amb_Storm")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JDCZhang_speak"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
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
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi_WZi/FTLEShi_WZi_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "FTLEShi_speak"),
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
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi_WZi/FTLEShi_WZi_face_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_30"
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
			action = "fadeIn",
			actor = __getnode__(_root, "HLMGen_speak"),
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
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_31"
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
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_32"
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
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_33"
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
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_34"
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
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_35"
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_dreamtower_04a_36"
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_dreamtower_04a_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi_WZi/FTLEShi_WZi_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi_WZi/FTLEShi_WZi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_39"
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
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_40"
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
					name = "dialog_speak_name_260",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"eventstory_dreamtower_04a_41"
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
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_42"
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
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_265",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"eventstory_dreamtower_04a_43"
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
			actor = __getnode__(_root, "Mus_Story_Mystery"),
			args = function (_ctx)
				return {
					isloop = true
				}
			end
		})
	})
end

local function eventstory_dreamtower_04a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_dreamtower_04a",
					scene = scene_eventstory_dreamtower_04a
				}
			end
		})
	})
end

stories.eventstory_dreamtower_04a = eventstory_dreamtower_04a

return _M
