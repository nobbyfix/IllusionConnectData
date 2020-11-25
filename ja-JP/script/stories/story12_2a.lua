local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story12_2a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story12_2a = {
	actions = {}
}
scenes.scene_story12_2a = scene_story12_2a

function scene_story12_2a:stage(args)
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
						image = "main_img_10.jpg",
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
						image = "battle_scene_22.jpg",
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
					},
					{
						resType = 0,
						name = "bg3",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_5_1.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg3",
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
				zorder = 522,
				visible = false,
				id = "Pan_A",
				scale = 1.05,
				actionName = "zhuanchanga_juqingtexiao",
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
				id = "Hit_texiao",
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
				id = "startingSound_story",
				fileName = "Se_Story_Chapter",
				type = "Music"
			},
			{
				id = "backGround_story",
				fileName = "Mus_Story_Whale",
				type = "Music"
			},
			{
				id = "backGround_main",
				fileName = "Mus_Main_Scene",
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

function scene_story12_2a.actions.start_story12_2a(_root, args)
	return sequential({
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
			actor = __getnode__(_root, "bg1")
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_SDTZi",
					id = "SDTZi_speak_Daily",
					rotationX = 0,
					scale = 1.145,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SDTZi_speak_Daily"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SDTZi_speak_Daily"),
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
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak_Daily"
					},
					content = {
						"story12_2a_1"
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
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak_Daily"
					},
					content = {
						"story12_2a_2"
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
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak_Daily"
					},
					content = {
						"story12_2a_3"
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "SDTZi_speak_Daily"),
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
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "effects_oldfilm")
			})
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_ZTXCun",
					id = "ZTXCun_speak",
					rotationX = 0,
					scale = 1.235,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ZTXCun_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXCun_speak"),
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
					name = "dialog_speak_name_33",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun_speak"
					},
					content = {
						"story12_2a_4"
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
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.55,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ZTXChang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ZTXChang/ZTXChang_face_1.png",
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
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXCun_speak"),
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
						"story12_2a_5"
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
						"story12_2a_6"
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
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXCun_speak"),
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
					name = "dialog_speak_name_33",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun_speak"
					},
					content = {
						"story12_2a_7"
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
					modelId = "Model_YFZZhu",
					id = "YFZZhu_speak",
					rotationX = 0,
					scale = 1,
					zorder = 10,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 1.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YFZZhu_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YFZZhu/YFZZhu_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YFZZhu_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -39.5,
								y = 624
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = -2,
							y = 0
						}
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
						"story12_2a_8"
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXCun_speak"),
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
						"story12_2a_9"
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
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXCun_speak"),
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
					name = "dialog_speak_name_33",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun_speak"
					},
					content = {
						"story12_2a_10"
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
					name = "dialog_speak_name_33",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun_speak"
					},
					content = {
						"story12_2a_11"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story12_2a_12"
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
					name = "dialog_speak_name_33",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXCun_speak"
					},
					content = {
						"story12_2a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ZTXCun_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -400,
						refpt = {
							x = -2,
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
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg2"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg3"),
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
				action = "play",
				actor = __getnode__(_root, "bgEx_bennengsiqihuoqian"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			})
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_CZheng",
					id = "CZheng_speak",
					rotationX = 0,
					scale = 1.1,
					position = {
						x = 0,
						y = -445,
						refpt = {
							x = 0.35,
							y = 0.1
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
					name = "dialog_speak_name_191",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story12_2a_14"
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
					modelId = "Model_BBLMa",
					id = "BBLMa_speak",
					rotationX = 0,
					scale = 1.155,
					zorder = 10,
					position = {
						x = 0,
						y = -450,
						refpt = {
							x = 0.7,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "BBLMa_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "BBLMa/BBLMa_face_5.png",
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "BBLMa_face",
							scale = 1.025,
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 90.3,
								y = 779.5
							}
						}
					}
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
						duration = 1
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
						"story12_2a_15"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_16"
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
					name = "dialog_speak_name_191",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story12_2a_17"
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
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story12_2a_18"
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
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.25,
							y = 0.15
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -255,
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
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.25,
							y = 0.07
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -255,
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
					name = "dialog_speak_name_192",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu"
					},
					content = {
						"story12_2a_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_2.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_20"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_1.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = -0.5,
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_3.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_2.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_25"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "CZheng_speak"),
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
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story12_2a_27"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_28"
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
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story12_2a_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_3.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_5.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_31"
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
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story12_2a_32"
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg3"),
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
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "bgEX_bennengsiqihuoqian")
			})
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story12_2a_33"
					},
					durations = {
						0.03
					}
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
						"story12_2a_34"
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
						"story12_2a_35"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story12_2a_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_2.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_37"
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
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story12_2a_38"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_39"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_40"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ZTXChang_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXChang/ZTXChangface_5.png",
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"story12_2a_41"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_42"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_5.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_43"
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
						"story12_2a_44"
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
						"story12_2a_45"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
						"story12_2a_46"
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
					name = "dialog_speak_name_144",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story12_2a_47"
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
				actor = __getnode__(_root, "BBLMa_speak"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_48"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
							y = -0.7
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 2,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
							y = -0.45
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YFZZhu_speak"),
			args = function (_ctx)
				return {
					duration = 2,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
							y = -0.75
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_49"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
						"story12_2a_50"
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
						"story12_2a_51"
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
						"story12_2a_52"
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
						"story12_2a_53"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_54"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
						"story12_2a_55"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_1.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_56"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_57"
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
					image = "ZTXChang/ZTXChang_5.png",
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
				action = "fadeOut",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
						"story12_2a_58"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_2.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_59"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_60"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
						"story12_2a_61"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_62"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_5.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_63"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
						"story12_2a_64"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story12_2a_65"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
						"story12_2a_66"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_67"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
						"story12_2a_68"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_69"
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
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BBLMa_speak"),
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
						"story12_2a_70"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CZheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BBLMa_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_4.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_71"
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
					name = "dialog_speak_name_16",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BBLMa_speak"
					},
					content = {
						"story12_2a_72"
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
					name = "dialog_speak_name_29",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CZheng_speak"
					},
					content = {
						"story12_2a_73"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BBLMa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BBLMa/BBLMa_face_2.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story12_2a_74"
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
		})
	})
end

local function story12_2a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story12_2a",
					scene = scene_story12_2a
				}
			end
		})
	})
end

stories.story12_2a = story12_2a

return _M
