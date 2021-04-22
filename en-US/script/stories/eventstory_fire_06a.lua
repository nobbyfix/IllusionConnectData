local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_fire_06a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_fire_06a = {
	actions = {}
}
scenes.scene_eventstory_fire_06a = scene_eventstory_fire_06a

function scene_eventstory_fire_06a:stage(args)
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
						image = "scene_main_fire.jpg",
						layoutMode = 1,
						zorder = 2,
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
						image = "bg_enter_cg_04.jpg",
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
						image = "scene_block_fire_1.jpg",
						layoutMode = 1,
						zorder = 14,
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
						}
					}
				}
			},
			{
				id = "Mus_Story_Memory",
				fileName = "Mus_Story_Memory",
				type = "Music"
			},
			{
				id = "Mus_Story_Yehuo_Determine",
				fileName = "Mus_Story_Yehuo_Determine",
				type = "Music"
			},
			{
				id = "Mus_Story_Yehuo_Normal",
				fileName = "Mus_Story_Yehuo_Normal",
				type = "Music"
			},
			{
				id = "Mus_Story_Yewang_Main",
				fileName = "Mus_Story_Yewang_Main",
				type = "Music"
			},
			{
				id = "Mus_Story_Yewang_Sorrow",
				fileName = "Mus_Story_Yewang_Sorrow",
				type = "Music"
			},
			{
				id = "Mus_Battle_Yewang",
				fileName = "Mus_Battle_Yewang",
				type = "Music"
			},
			{
				id = "Se_Amb_Fire_Distance",
				fileName = "Se_Amb_Fire_Distance",
				type = "Music"
			},
			{
				id = "Se_Amb_Fire_Close",
				fileName = "Se_Amb_Fire_Close",
				type = "Music"
			},
			{
				id = "Se_Amb_Fire_Close_Mass",
				fileName = "Se_Amb_Fire_Close_Mass",
				type = "Music"
			},
			{
				id = "Se_Amb_Rain_Shilter",
				fileName = "Se_Amb_Rain_Shilter",
				type = "Music"
			},
			{
				id = "Se_Amb_Rain_Heavy",
				fileName = "Se_Amb_Rain_Heavy",
				type = "Music"
			},
			{
				id = "Se_Story_Shutter",
				fileName = "Se_Story_Shutter",
				type = "Sound"
			},
			{
				layoutMode = 1,
				name = "bg",
				type = "ColorBackGround",
				zorder = 100,
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
				id = "Se_Story_Katana",
				fileName = "Se_Skill_Cut_5",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
				visible = false,
				id = "xiao_jian",
				scale = 1.5,
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
				visible = false,
				id = "xiao_jian2",
				scale = 1.5,
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
				layoutMode = 1,
				name = "bg",
				type = "ColorBackGround",
				zorder = 15,
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
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 20,
				videoName = "story_bossd",
				id = "xiao_bilibili",
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
				visible = false,
				type = "VideoSprite",
				zorder = 100,
				videoName = "story_baozha",
				id = "xiao_baozha",
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
				zorder = 350,
				visible = false,
				id = "xiao_jian101",
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 350,
				visible = false,
				id = "xiao_jian102",
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 340,
				visible = false,
				id = "xiao_gedang",
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
				id = "yin_gedang",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				id = "Se_Story_Katana",
				fileName = "Se_Skill_Cut_5",
				type = "Sound"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_fire_06a.actions.start_eventstory_fire_06a(_root, args)
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
			action = "activateNode",
			actor = __getnode__(_root, "bg1")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Battle_Yewang"),
			args = function (_ctx)
				return {
					isloop = true
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_ZTXChang",
					id = "ZTXChang",
					rotationX = 0,
					scale = 0.98,
					zorder = 10,
					position = {
						x = 0,
						y = -300,
						refpt = {
							x = 0.22,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ZTXChang_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ZTXChang/ZTXChang_face_3.png",
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
				action = "orbitCamera",
				actor = __getnode__(_root, "ZTXChang"),
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
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_SLWan",
					id = "SLWan",
					rotationX = 0,
					scale = 0.62,
					zorder = 4,
					position = {
						x = 0,
						y = -222,
						refpt = {
							x = 0.78,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "yzchun_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "yzchun/face_yzchun_3.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "yzchun_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 8,
								y = 927.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SLWan"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_MZGXiu",
					id = "MZGXiu",
					rotationX = -1,
					scale = 0.72,
					zorder = 16,
					position = {
						x = 0,
						y = -445,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "cxgdie_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "cxgdie/face_cxgdie_3.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "cxgdie_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 22.5,
								y = 1245.5
							}
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "MZGXiu"),
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
					modelId = "Model_Story_MZGXiu",
					id = "MZGXiu1",
					rotationX = -1,
					scale = 0.72,
					zorder = 5,
					position = {
						x = 0,
						y = -445,
						refpt = {
							x = 0.75,
							y = 0
						}
					},
					children = {}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "MZGXiu1"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "ZTXChang"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SLWan"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.3,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = -70,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Katana"),
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Katana")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.5,
								y = 0.9
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = 130,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Katana"),
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Katana")
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = -10,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.5,
								y = 0.9
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = 30,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Katana"),
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Katana")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.3,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = -90,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Katana"),
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Katana")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SLWan"
					},
					content = {
						"eventstory_fire_06a_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "yzchun_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "yzchun/face_yzchun_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SLWan"
					},
					content = {
						"eventstory_fire_06a_2"
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
					name = "fire_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_fire_06a_3"
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
					name = "fire_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SLWan"
					},
					content = {
						"eventstory_fire_06a_4"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "yzchun_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "yzchun/face_yzchun_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SLWan"
					},
					content = {
						"eventstory_fire_06a_5"
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
						"eventstory_fire_06a_6"
					},
					storyLove = {}
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_fire_06a_7"
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
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SLWan"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -222,
							refpt = {
								x = 0.5,
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
					duration = 1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SLWan"
					},
					content = {
						"eventstory_fire_06a_8"
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
					name = "fire_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SLWan"
					},
					content = {
						"eventstory_fire_06a_9"
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
					name = "fire_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SLWan"
					},
					content = {
						"eventstory_fire_06a_10"
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
			action = "show",
			actor = __getnode__(_root, "colorBg"),
			args = function (_ctx)
				return {
					bgColor = "#000000"
				}
			end
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
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.3,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = -70,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Katana"),
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Katana")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.5,
								y = 0.9
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = 130,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Katana"),
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Katana")
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					deltaAngle = -10,
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.5,
								y = 0.9
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = 30,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Katana"),
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Katana")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.3,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						deltaAngle = -90,
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Katana"),
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
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Katana")
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
				actor = __getnode__(_root, "SLWan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MZGXiu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Yehuo_Normal"),
			args = function (_ctx)
				return {
					isloop = true
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu"
					},
					content = {
						"eventstory_fire_06a_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "cxgdie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "cxgdie/face_cxgdie_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu"
					},
					content = {
						"eventstory_fire_06a_12"
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
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu"
					},
					content = {
						"eventstory_fire_06a_13"
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
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu"
					},
					content = {
						"eventstory_fire_06a_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_bilibili"),
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
					name = "fire_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"fire_dialog_speak_name_4"
					},
					content = {
						"eventstory_fire_06a_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "cxgdie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "cxgdie/face_cxgdie_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu"
					},
					content = {
						"eventstory_fire_06a_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MZGXiu"),
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
					name = "fire_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"fire_dialog_speak_name_4"
					},
					content = {
						"eventstory_fire_06a_17"
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
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu"
					},
					content = {
						"eventstory_fire_06a_18"
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
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu"
					},
					content = {
						"eventstory_fire_06a_19"
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
					name = "fire_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"fire_dialog_speak_name_4"
					},
					content = {
						"eventstory_fire_06a_20"
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
					name = "fire_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"fire_dialog_speak_name_4"
					},
					content = {
						"eventstory_fire_06a_21"
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
					name = "fire_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"fire_dialog_speak_name_4"
					},
					content = {
						"eventstory_fire_06a_22"
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
					duration = 0.5
				}
			end
		}),
		concurrent({
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_bilibili")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_Story_Yehuo_Determine"),
				args = function (_ctx)
					return {
						isloop = true
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "scene_story_fire_2.jpg",
						pathType = "SCENE"
					}
				end
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "colorBg")
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
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
					name = "fire_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"fire_dialog_speak_name_4"
					},
					content = {
						"eventstory_fire_06a_23"
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
			actor = __getnode__(_root, "xiao_baozha"),
			args = function (_ctx)
				return {
					time = 1
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "scene_block_fire_1.jpg",
					pathType = "SCENE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "MZGXiu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0
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
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_baozha")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_fire_06a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "MZGXiu1"),
			args = function (_ctx)
				return {
					duration = 0
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
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu1"
					},
					content = {
						"eventstory_fire_06a_25"
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
			actor = __getnode__(_root, "xiao_baozha"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Story_Flame_Roaring"),
			args = function (_ctx)
				return {
					time = 1
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
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "scene_story_fire_1.jpg",
					pathType = "SCENE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "MZGXiu1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_baozha")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Se_Story_Flame_Roaring")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_fire_06a_26"
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
					name = "fire_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_fire_06a_27"
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
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu1"
					},
					content = {
						"eventstory_fire_06a_28"
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
				action = "play",
				actor = __getnode__(_root, "xiao_jian101")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_gedang")
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
				action = "stop",
				actor = __getnode__(_root, "xiao_jian101")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_gedang")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_gedang")
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_fire_06a_29"
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
					name = "fire_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_fire_06a_30"
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
				action = "play",
				actor = __getnode__(_root, "xiao_jian101")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_gedang")
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
				action = "stop",
				actor = __getnode__(_root, "xiao_jian101")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_gedang")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_gedang")
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_fire_06a_31"
					},
					durations = {
						0.03
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
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "fire_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MZGXiu1"
					},
					content = {
						"eventstory_fire_06a_32"
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
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Yehuo_Determine")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		})
	})
end

local function eventstory_fire_06a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_fire_06a",
					scene = scene_eventstory_fire_06a
				}
			end
		})
	})
end

stories.eventstory_fire_06a = eventstory_fire_06a

return _M
