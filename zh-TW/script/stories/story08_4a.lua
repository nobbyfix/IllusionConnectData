local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story08_4a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story08_4a = {
	actions = {}
}
scenes.scene_story08_4a = scene_story08_4a

function scene_story08_4a:stage(args)
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
						name = "cg",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_5_2.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "cg",
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
								zorder = 1,
								visible = true,
								id = "bgEX_bennengsi01",
								scale = 1,
								actionName = "anim_bennengsi",
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
						resType = 0,
						name = "bg",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_5_2.jpg",
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
						children = {
							{
								layoutMode = 1,
								type = "MovieClip",
								zorder = 1,
								visible = true,
								id = "bgEX_bennengsi",
								scale = 1,
								actionName = "anim_bennengsi",
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
						resType = 0,
						name = "bg1",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_EXscene_5_1.jpg",
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
								y = 0.59
							}
						},
						children = {
							{
								layoutMode = 1,
								type = "MovieClip",
								zorder = 1,
								visible = true,
								id = "bgEX_bennengsiqihuoqian",
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
					},
					{
						resType = 0,
						name = "bg2",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_5_3.jpg",
						layoutMode = 1,
						zorder = 3,
						id = "bg2",
						scale = 1,
						anchorPoint = {
							x = 0.5,
							y = 0.5
						},
						position = {
							refpt = {
								x = 0.5,
								y = 0.59
							}
						}
					},
					{
						resType = 0,
						name = "bg3",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_08_1.jpg",
						layoutMode = 1,
						zorder = 4,
						id = "bg3",
						scale = 1,
						anchorPoint = {
							x = 0.5,
							y = 0.5
						},
						position = {
							refpt = {
								x = 0.5,
								y = 0.59
							}
						}
					},
					{
						resType = 0,
						name = "cg2",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_00_10.jpg",
						layoutMode = 1,
						zorder = 9,
						id = "cg2",
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
						name = "cg3",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_00_11.jpg",
						layoutMode = 1,
						zorder = 10,
						id = "cg3",
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
						name = "cg4",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_08_3.jpg",
						layoutMode = 1,
						zorder = 11,
						id = "cg4",
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
				id = "Mus_Story_Yehuo_2",
				fileName = "Mus_Story_Yehuo_2",
				type = "Music"
			},
			{
				id = "Mus_Story_Yehuo",
				fileName = "Mus_Story_Yehuo",
				type = "Music"
			},
			{
				id = "Mus_Story_Suspense",
				fileName = "Mus_Story_Suspense",
				type = "Music"
			},
			{
				id = "Mus_Story_Danger_2",
				fileName = "Mus_Story_Danger_2",
				type = "Music"
			},
			{
				id = "Se_Story_Fire",
				fileName = "Se_Story_Fire",
				type = "Sound"
			},
			{
				id = "Se_Story_WHZY",
				fileName = "Se_Story_WHZY",
				type = "Sound"
			},
			{
				id = "Se_Skill_Laser_7",
				fileName = "Se_Skill_Laser_7",
				type = "Sound"
			},
			{
				id = "Se_Skill_Explode_5",
				fileName = "Se_Skill_Explode_5",
				type = "Sound"
			},
			{
				id = "Se_Story_Cut_In",
				fileName = "Se_Story_Cut_In",
				type = "Sound"
			},
			{
				id = "Se_Skill_Gun",
				fileName = "Se_Skill_Gun",
				type = "Sound"
			},
			{
				id = "Se_Skill_Shield_6",
				fileName = "Se_Skill_Shield_6",
				type = "Sound"
			},
			{
				id = "Se_Story_Gunshot",
				fileName = "Se_Story_Gunshot",
				type = "Sound"
			},
			{
				id = "ZTXChangAttack_Sound",
				fileName = "Se_Skill_Cut_4",
				type = "Sound"
			},
			{
				id = "Se_Story_Collapse",
				fileName = "Se_Story_Collapse",
				type = "Sound"
			},
			{
				id = "nightmare_Sound",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 23,
				visible = false,
				id = "liqi_juqingtexiao1",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.45,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 23,
				visible = false,
				id = "liqi_juqingtexiao2",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.55,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 23,
				visible = false,
				id = "liqi_juqingtexiao3",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.65,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 23,
				visible = false,
				id = "liqi_juqingtexiao4",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.55,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 23,
				visible = false,
				id = "liqi_juqingtexiao5",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.55,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				additive = 1,
				zorder = 2,
				videoName = "story_juqixh",
				id = "story_juqixh",
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
				zorder = 200,
				visible = false,
				id = "dunqi_hit",
				scale = 1.5,
				actionName = "dunqi_juqing",
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
				zorder = 202,
				videoName = "story_baozha",
				id = "story_baozha",
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
				type = "MovieClip",
				zorder = 222,
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
				id = "flashMask",
				type = "FlashMask"
			},
			{
				id = "mask",
				type = "Mask"
			}
		},
		__actions__ = self.actions
	}
end

function scene_story08_4a.actions.start_story08_4a(_root, args)
	return sequential({
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
			action = "activateNode",
			actor = __getnode__(_root, "bg1")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEX_bennengsiqihuoqian"),
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
					duration = 3
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
					zorder = 13,
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
							image = "SGHQShou/SGHQShou01_face_2.png",
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
						"story08_4a_1"
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
					modelId = "Model_Story_SGHQShou02",
					id = "SGHQShou2_speak",
					rotationX = 0,
					scale = 1.3,
					zorder = 12,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SGHQShou02_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SGHQShou/SGHQShou02_face_3.png",
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
						"story08_4a_2"
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
					zorder = 11,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.75,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SGHQShou03_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SGHQShou/SGHQShou03_face_5.png",
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story08_4a_3"
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
						"story08_4a_4"
					}
				}
			end
		}),
		concurrent({
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
			})
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
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "CLMan_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "CLMan/CLMan_face_10.png",
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
						"story08_4a_5"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 0.75,
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
					modelId = "Model_Story_FTLEShi",
					id = "FTLEShi_speak",
					rotationX = 0,
					scale = 1.025,
					position = {
						x = 0,
						y = -510,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "FTLEShi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "FTLEShi/FTLEShi_face_6.png",
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
								y = 1000
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
						"story08_4a_6"
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
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou1_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou3_speak"),
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
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story08_4a_7"
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
						"story08_4a_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -265,
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
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -265,
						refpt = {
							x = 0.4,
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
					name = "dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story08_4a_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.755,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.76,
							y = 0
						}
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
						name = "dialog_speak_name_10",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SGHQShou3_speak"
						},
						content = {
							"story08_4a_10"
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
						strength = 2
					}
				end
			})
		}),
		concurrent({
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
				actor = __getnode__(_root, "SGHQShou3_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -510,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
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
						"story08_4a_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
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
					modelId = "Model_Story_SGHQShou02",
					id = "SGHQShou2_speak",
					rotationX = 0,
					scale = 1.3,
					zorder = 12,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.5,
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
						"story08_4a_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -265,
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
			actor = __getnode__(_root, "SGHQShou1_speak"),
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
					name = "dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story08_4a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.15,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SGHQShou3_speak"),
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story08_4a_14"
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
						"story08_4a_15"
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
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story08_4a_16"
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
						"story08_4a_17"
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
						"story08_4a_18"
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
						"story08_4a_19"
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
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story08_4a_20"
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
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Yehuo")
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		concurrent({
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
				action = "fadeIn",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						duration = 3
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_Story_Yehuo_2"),
				args = function (_ctx)
					return {
						isLoop = true
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Fire"),
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
					duration = 1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SGHQShou01_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SGHQShou/SGHQShou01_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SGHQShou03_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SGHQShou/SGHQShou03_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SGHQShou02_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SGHQShou/SGHQShou02_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					zorder = 11
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -330,
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
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -265,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou1_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
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
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou3_speak"),
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story08_4a_21"
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
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story08_4a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SGHQShou03_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SGHQShou/SGHQShou03_face_4.png",
					pathType = "STORY_FACE"
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
						"story08_4a_23"
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
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CLMan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "CLMan/CLMan_face_9.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi/FTLEShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -510,
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
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
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
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi_speak"),
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
						"story08_4a_24"
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
					image = "FTLEShi/FTLEShi_face_12.png",
					pathType = "STORY_FACE"
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
						"story08_4a_25"
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
				actor = __getnode__(_root, "CLMan_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"story08_4a_26"
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Fire")
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg"),
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					center = 1,
					bgShow = false,
					heightSpace = 32,
					content = {
						"story08_4a_27"
					},
					durations = {
						0.06
					},
					waitTimes = {
						1.5
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
					name = "dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"story08_4a_28"
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
						""
					},
					content = {
						"story08_4a_29"
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
					zorder = 20,
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.6,
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
							zorder = 900,
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
						},
						{
							resType = 0,
							name = "ZTXChang_face3",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ZTXChang/ZTXChang_face_16.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ZTXChang_face3",
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
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang_face3"),
				args = function (_ctx)
					return {
						duration = 0
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
						"story08_4a_30"
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
						"story08_4a_31"
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
					duration = 1.5
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					center = 1,
					bgShow = false,
					heightSpace = 32,
					content = {
						"story08_4a_32"
					},
					durations = {
						0.06
					},
					waitTimes = {
						1.5
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_9.png",
					pathType = "STORY_FACE"
				}
			end
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
		concurrent({
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "mask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FF6A6A",
								fadeout = 0.15,
								alpha = 0.8,
								duration = 0.05,
								fadein = 0.15
							}
						}
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
						"story08_4a_33"
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
						"story08_4a_34"
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
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_16.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					scale = 0.7,
					duration = 0
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
							x = 0.4,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "ZTXChang_speak"),
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
			actor = __getnode__(_root, "bg2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "ZTXChang_speak"),
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
					duration = 1
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"story08_4a_35"
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
			actor = __getnode__(_root, "bg2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg"),
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Story_Fire"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CLMan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "CLMan/CLMan_face_12.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
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
						"story08_4a_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 0.75,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -510,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
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
						"story08_4a_37"
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
						"story08_4a_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = -0.1,
							y = 0
						}
					}
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
			action = "moveTo",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 0.5,
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
					image = "CLMan/CLMan_face_12.png",
					pathType = "STORY_FACE"
				}
			end
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
						"story08_4a_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
						"story08_4a_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Fire")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_16.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "ZTXChang_speak"),
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
					duration = 1
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -368,
							refpt = {
								x = 0.7,
								y = 0.2
							}
						}
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
			action = "moveTo",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.4,
							y = 0.2
						}
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
			action = "rock",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_ZTXChang",
					id = "ZTXChang_shadow",
					rotationX = 0,
					scale = 0.7,
					zorder = 8,
					position = {
						x = 0,
						y = -368,
						refpt = {
							x = 0.4,
							y = 0.2
						}
					},
					children = {
						{
							resType = 0,
							name = "ZTXChang_face1",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ZTXChang/ZTXChang_face_13.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ZTXChang_face1",
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
				actor = __getnode__(_root, "ZTXChang_shadow"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ZTXChang_shadow"),
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
				actor = __getnode__(_root, "ZTXChang_shadow"),
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
				actor = __getnode__(_root, "ZTXChang_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -368,
							refpt = {
								x = 0.15,
								y = 0.2
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ZTXChang_shadow"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -368,
							refpt = {
								x = 0.4,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang_shadow"),
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
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Story_WHZY")
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "liqi_juqingtexiao1"),
			args = function (_ctx)
				return {
					deltaAngle = -60,
					duration = 0
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "liqi_juqingtexiao2"),
			args = function (_ctx)
				return {
					deltaAngle = 90,
					duration = 0
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "liqi_juqingtexiao3"),
			args = function (_ctx)
				return {
					deltaAngle = -135,
					duration = 0
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "liqi_juqingtexiao4"),
			args = function (_ctx)
				return {
					deltaAngle = 165,
					duration = 0
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "liqi_juqingtexiao5"),
			args = function (_ctx)
				return {
					deltaAngle = -30,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "liqi_juqingtexiao1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.45,
							y = 0.45
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "liqi_juqingtexiao2"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.55,
							y = 0.45
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "liqi_juqingtexiao3"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.65,
							y = 0.45
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "liqi_juqingtexiao4"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.75,
							y = 0.45
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "liqi_juqingtexiao5"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.5,
							y = 0.65
						}
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "hitSound_story")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "liqi_juqingtexiao1"),
			args = function (_ctx)
				return {
					time = 1
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
			action = "hide",
			actor = __getnode__(_root, "liqi_juqingtexiao1")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "hitSound_story")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "liqi_juqingtexiao2"),
			args = function (_ctx)
				return {
					time = 1
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
			action = "hide",
			actor = __getnode__(_root, "liqi_juqingtexiao2")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "hitSound_story")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "liqi_juqingtexiao3"),
			args = function (_ctx)
				return {
					time = 1
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
			action = "hide",
			actor = __getnode__(_root, "liqi_juqingtexiao3")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "hitSound_story")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "liqi_juqingtexiao4"),
			args = function (_ctx)
				return {
					time = 1
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
			action = "play",
			actor = __getnode__(_root, "hitSound_story")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "liqi_juqingtexiao4")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "liqi_juqingtexiao5"),
			args = function (_ctx)
				return {
					time = 1
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
			action = "hide",
			actor = __getnode__(_root, "liqi_juqingtexiao5")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "liqi_juqingtexiao1"),
			args = function (_ctx)
				return {
					deltaAngle = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "liqi_juqingtexiao1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.45,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "hitSound_story")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "liqi_juqingtexiao1")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "flashScreen",
			actor = __getnode__(_root, "mask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#FFFFFF",
							fadeout = 0.1,
							alpha = 1,
							duration = 0.5,
							fadein = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "liqi_juqingtexiao1")
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
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
			actor = __getnode__(_root, "bg2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg"),
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					height = 2,
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "repeatUpDownStart",
				actor = __getnode__(_root, "SGHQShou2_speak"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
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
			actor = __getnode__(_root, "Se_Story_Fire"),
			args = function (_ctx)
				return {
					isLoop = false
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
						"story08_4a_41"
					},
					durations = {
						0.03
					}
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
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -330,
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
				action = "repeatUpDownStart",
				actor = __getnode__(_root, "SGHQShou3_speak"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SGHQShou3_speak"),
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story08_4a_42"
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
						"story08_4a_43"
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
					modelId = "Model_Enemy_CSZhe",
					id = "Enemy_CSZhe_speak",
					rotationX = 0,
					scale = 1,
					zorder = 15,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.15,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Enemy_CFZhe",
					id = "Enemy_CFZhe_speak",
					rotationX = 0,
					scale = 1,
					zorder = 16,
					position = {
						x = 0,
						y = -360,
						refpt = {
							x = 0.85,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Enemy_XXZhe",
					id = "Enemy_XXZhe_speak",
					rotationX = 0,
					scale = 1,
					zorder = 14,
					position = {
						x = 0,
						y = -390,
						refpt = {
							x = 0.6,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
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
						name = "dialog_speak_name_32",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Enemy_XXZhe_speak"
						},
						content = {
							"story08_4a_44"
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						freq = 4,
						strength = 2
					}
				end
			})
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -265,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					height = 2,
					duration = 0.1
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
						"story08_4a_45"
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
			action = "fadeIn",
			actor = __getnode__(_root, "SGHQShou2_speak"),
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story08_4a_46"
					},
					durations = {
						0.03
					}
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
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					height = 2,
					duration = 0.1
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
						"story08_4a_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CLMan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "CLMan/CLMan_face_9.png",
					pathType = "STORY_FACE"
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
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					height = 2,
					duration = 0.1
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
						"story08_4a_48"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
						"story08_4a_49"
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
						"story08_4a_50"
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
						"story08_4a_51"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			action = "play",
			actor = __getnode__(_root, "story_juqixh"),
			args = function (_ctx)
				return {
					time = -1
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
						"story08_4a_52"
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
						"story08_4a_53"
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
			action = "play",
			actor = __getnode__(_root, "Se_Skill_Laser_7")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "story_juqixh")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_XXZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Skill_Explode_5")
		}),
		act({
			action = "flashScreen",
			actor = __getnode__(_root, "mask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#ffffff",
							fadeout = 0.2,
							alpha = 1,
							duration = 0.2,
							fadein = 0.2
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
				action = "rock",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
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
				action = "play",
				actor = __getnode__(_root, "Se_Story_Cut_In")
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
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
						"story08_4a_54"
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
			actor = __getnode__(_root, "SGHQShou2_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -430,
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
			actor = __getnode__(_root, "SGHQShou2_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SGHQShou3_speak"),
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story08_4a_55"
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
			action = "fadeOut",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 2
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Fire")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Story_Collapse")
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "cg"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "bgEX_bennengsi01"),
				args = function (_ctx)
					return {
						time = -1
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
				action = "fadeOut",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.3
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0
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
				action = "fadeOut",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.3
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
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Yehuo_2")
		}),
		act({
			action = "flashScreen",
			actor = __getnode__(_root, "mask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#ffffff",
							fadeout = 0.3,
							alpha = 1,
							duration = 0.3,
							fadein = 0.3
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "bg3"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg3"),
				args = function (_ctx)
					return {
						duration = 2.5
					}
				end
			})
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 3
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
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
			action = "fadeOut",
			actor = __getnode__(_root, "cg"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"story08_4a_56"
					}
				}
			end
		}),
		act({
			action = "repeatUpDownEnd",
			actor = __getnode__(_root, "FTLEShi_speak")
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
						"story08_4a_57"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "repeatUpDownEnd",
			actor = __getnode__(_root, "CLMan_speak")
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
						"story08_4a_58"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "nightmare_Sound")
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "cg2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "cg2"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 2
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
		concurrent({
			rockScreen({
				args = function (_ctx)
					return {
						freq = 2,
						strength = 1
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "cg3"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "cg3"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "cg2"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"story08_4a_59"
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
					name = "",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"story08_4a_60"
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
					name = "",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"story08_4a_61"
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "cg3"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SGHQShou01_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SGHQShou/SGHQShou01_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "repeatUpDownEnd",
			actor = __getnode__(_root, "SGHQShou1_speak")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SGHQShou1_speak"),
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
					name = "dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story08_4a_62"
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
			action = "changeTexture",
			actor = __getnode__(_root, "SGHQShou03_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SGHQShou/SGHQShou03_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "repeatUpDownEnd",
			actor = __getnode__(_root, "SGHQShou3_speak")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SGHQShou3_speak"),
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story08_4a_63"
					},
					durations = {
						0.03
					}
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
			action = "changeTexture",
			actor = __getnode__(_root, "SGHQShou02_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SGHQShou/SGHQShou02_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou2_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "repeatUpDownEnd",
			actor = __getnode__(_root, "SGHQShou2_speak")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SGHQShou2_speak"),
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
					name = "dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou2_speak"
					},
					content = {
						"story08_4a_64"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -265,
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
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -330,
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
			actor = __getnode__(_root, "SGHQShou1_speak"),
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
					name = "dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou1_speak"
					},
					content = {
						"story08_4a_65"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SGHQShou3_speak"),
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story08_4a_66"
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
				actor = __getnode__(_root, "SGHQShou1_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -265,
							refpt = {
								x = -0.25,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SGHQShou3_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 1.75,
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
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_XXZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Enemy_XXZhe_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"story08_4a_67"
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Skill_Gun")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "dunqi_hit")
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "Enemy_XXZhe_speak"),
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Enemy_XXZhe_speak"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -360,
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
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -510,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dunqi_hit")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Skill_Shield_6")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "beiji_juqingtexiao")
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 3,
						strength = 2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "FTLEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -510,
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
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -360,
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
			action = "rock",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
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
					name = "dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi_speak"
					},
					content = {
						"story08_4a_68"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -360,
						refpt = {
							x = 0.85,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_CSZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_XXZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Enemy_CSZhe_speak"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Enemy_XXZhe_speak"),
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
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
						"story08_4a_69"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
						"story08_4a_70"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
						"story08_4a_71"
					},
					durations = {
						0.03
					}
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
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -265,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
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
						"story08_4a_72"
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
						"story08_4a_73"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou1_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -265,
						refpt = {
							x = 1.5,
							y = 0
						}
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_CSZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_XXZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Story_Gunshot")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "story_baozha")
		}),
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
					duration = 2
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = -0.1,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -330,
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
					name = "dialog_speak_name_10",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SGHQShou3_speak"
					},
					content = {
						"story08_4a_74"
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
						"story08_4a_75"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0.25,
					position = {
						x = 0,
						y = -330,
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
			actor = __getnode__(_root, "SGHQShou3_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_CFZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_CSZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "Enemy_XXZhe_speak"),
			args = function (_ctx)
				return {
					brightness = 0,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Story_Gunshot")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "story_baozha")
		}),
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
					duration = 2
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CFZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_CSZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Enemy_XXZhe_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CLMan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "CLMan/CLMan_face_12.png",
					pathType = "STORY_FACE"
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
						"story08_4a_76"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -295,
						refpt = {
							x = 1.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
						"story08_4a_77"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.8,
					position = {
						x = 0,
						y = -510,
						refpt = {
							x = 1.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"story08_4a_78"
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Suspense")
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					scale = 1.08,
					duration = 0
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
							x = 0.4,
							y = 0
						}
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
					image = "ZTXChang/ZTXChang_face_16.png",
					pathType = "STORY_FACE"
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
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Danger_2"),
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
					name = "dialog_speak_name_105",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"story08_4a_79"
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
					image = "ZTXChang/ZTXChang_face_13.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_105",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang_speak"
						},
						content = {
							"story08_4a_80"
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
						strength = 2
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
						name = "dialog_speak_name_105",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang_speak"
						},
						content = {
							"story08_4a_81"
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
						strength = 2
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_105",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang_speak"
					},
					content = {
						"story08_4a_82"
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
			action = "fadeOut",
			actor = __getnode__(_root, "ZTXChang_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg4"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "cg4"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "cg4"),
			args = function (_ctx)
				return {
					scale = 1,
					duration = 0
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "cg4"),
				args = function (_ctx)
					return {
						duration = 3,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.01,
								y = 0.01
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "cg4"),
				args = function (_ctx)
					return {
						scale = 0.95,
						duration = 3
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_105",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"story08_4a_83"
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
					name = "dialog_speak_name_105",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"story08_4a_84"
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
				actor = __getnode__(_root, "cg4"),
				args = function (_ctx)
					return {
						duration = 3,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.02,
								y = 0.02
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "cg4"),
				args = function (_ctx)
					return {
						scale = 0.9,
						duration = 3
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_105",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"story08_4a_85"
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
					name = "dialog_speak_name_105",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"story08_4a_86"
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
				actor = __getnode__(_root, "cg4"),
				args = function (_ctx)
					return {
						duration = 3,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.03,
								y = 0.03
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "cg4"),
				args = function (_ctx)
					return {
						scale = 0.85,
						duration = 3
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_105",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"story08_4a_87"
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
					name = "dialog_speak_name_105",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"story08_4a_88"
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
				action = "moveTo",
				actor = __getnode__(_root, "cg4"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.5,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "cg4"),
				args = function (_ctx)
					return {
						scale = 0.45,
						duration = 1
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_105",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"story08_4a_89"
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
						strength = 2
					}
				end
			})
		}),
		act({
			action = "block",
			actor = __getnode__(_root, "Mus_Story_Danger_2"),
			args = function (_ctx)
				return {
					blockId = "Mus_Story_Danger_2_Block_1"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		})
	})
end

local function story08_4a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story08_4a",
					scene = scene_story08_4a
				}
			end
		})
	})
end

stories.story08_4a = story08_4a

return _M
