local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.DreamChallenge_5_dulandeer_03a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_DreamChallenge_5_dulandeer_03a = {
	actions = {}
}
scenes.scene_DreamChallenge_5_dulandeer_03a = scene_DreamChallenge_5_dulandeer_03a

function scene_DreamChallenge_5_dulandeer_03a:stage(args)
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
				image = "mjt_img_dlde_bg.jpg",
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
				name = "hm",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 36,
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
				}
			},
			{
				resType = 0,
				name = "bg2",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_scene_14.jpg",
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
				id = "Mus_qishi",
				fileName = "Mus_Story_Knight_War",
				type = "Music"
			},
			{
				id = "Mus_siwang",
				fileName = "Mus_Story_Knight_Fall",
				type = "Music"
			},
			{
				id = "yin_gedang",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				id = "yin_duanzao",
				fileName = "Se_Effect_Sword_Cast",
				type = "Sound"
			},
			{
				id = "yin_daoguang",
				fileName = "Se_Skill_Cut_5",
				type = "Sound"
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 350,
				visible = false,
				id = "xiao_daoguang0",
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
				id = "xiao_daoguang1",
				scale = 1.05,
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
				zorder = 350,
				visible = false,
				id = "xiao_daoguang2",
				scale = 1.05,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.38,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 350,
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
						y = 0.6
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_DreamChallenge_5_dulandeer_03a.actions.start_DreamChallenge_5_dulandeer_03a(_root, args)
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
						"DreamChallenge_5_dulandeer_03a_1",
						"DreamChallenge_5_dulandeer_03a_2",
						"DreamChallenge_5_dulandeer_03a_3",
						"DreamChallenge_5_dulandeer_03a_4"
					},
					durations = {
						0.07,
						0.07,
						0.07,
						0.07
					},
					waitTimes = {
						1,
						0.5,
						1,
						0.8
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
					modelId = "Model_LLan",
					id = "LLan",
					rotationX = 0,
					scale = 1.05,
					zorder = 32,
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
							image = "LLan/LLan_face_3.png",
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
					brightness = 50,
					modelId = "Model_Story_Sword",
					id = "DLDEr",
					rotationX = 0,
					scale = 0.6,
					zorder = 337,
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_Sword_Broken",
					id = "Broken_DLDE",
					rotationX = 0,
					scale = 0.6,
					zorder = 332,
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
			actor = __getnode__(_root, "Broken_DLDE"),
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
					modelId = "Model_Story_JYing2",
					id = "ALWei",
					rotationX = 0,
					scale = 1.05,
					zorder = 35,
					position = {
						x = 0,
						y = -440,
						refpt = {
							x = 1.35,
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
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
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
				action = "fadeIn",
				actor = __getnode__(_root, "ALWei"),
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_daoguang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_daoguang0"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						duration = 0,
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
			})
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_gedang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						height = 0.5,
						duration = 0.1
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
								x = 0.45,
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "LLan")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_daoguang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_daoguang2"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.45,
								y = 0.5
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_gedang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						height = 0.5,
						duration = 0.1
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
								x = 0.38,
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "LLan")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_daoguang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_daoguang0"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.38,
								y = 0.5
							}
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_gedang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						height = 0.5,
						duration = 0.1
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
								x = 0.25,
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
					duration = 0.5
				}
			end
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
			action = "repeatRockEnd",
			actor = __getnode__(_root, "LLan")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_3.png",
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
							"DreamChallenge_5_dulandeer_03a_5"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "xiao_daoguang1"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 30
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_daoguang1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.85,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_daoguang0"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.3,
								y = 0.5
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
								x = 0.95,
								y = -0.1
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
						name = "DC5_dulandeer_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ALWei"
						},
						content = {
							"DreamChallenge_5_dulandeer_03a_6"
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
						image = "LLan/LLan_face_3.png",
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
							"DreamChallenge_5_dulandeer_03a_7"
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
				action = "play",
				actor = __getnode__(_root, "yin_daoguang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_daoguang0"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_daoguang1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.32,
								y = 0.5
							}
						}
					}
				end
			})
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "hm"),
			args = function (_ctx)
				return {
					opacity = 0.1
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALWei"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = -440,
							refpt = {
								x = 0.8,
								y = -0.4
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
						duration = 0.2
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_gedang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						height = 1.5,
						duration = 0.1
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "LLan")
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
						"DreamChallenge_5_dulandeer_03a_8"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
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
				action = "changeTexture",
				actor = __getnode__(_root, "LLan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "LLan/LLan_face_3.png",
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
				action = "updateNode",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						zorder = 40
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
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_siwang"),
			args = function (_ctx)
				return {
					isLoop = true
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
			actor = __getnode__(_root, "Broken_DLDE"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "LLan"),
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
						"Broken_DLDE"
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_9"
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
							"DreamChallenge_5_dulandeer_03a_10"
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
						"DreamChallenge_5_dulandeer_03a_11"
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
						"Broken_DLDE"
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_12"
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
						"DreamChallenge_5_dulandeer_03a_13"
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
						"Broken_DLDE"
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_14"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 1
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
							"DreamChallenge_5_dulandeer_03a_15"
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
					name = "DC5_dulandeer_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Broken_DLDE"
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_16"
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
						image = "LLan/LLan_face_2.png",
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
							"DreamChallenge_5_dulandeer_03a_17"
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
						"DreamChallenge_5_dulandeer_03a_18"
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
						image = "LLan/LLan_face_3.png",
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
							"DreamChallenge_5_dulandeer_03a_19"
						},
						durations = {
							0.03
						}
					}
				end
			})
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Broken_DLDE"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Broken_DLDE"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -66,
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
			actor = __getnode__(_root, "DLDEr"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -66,
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
			actor = __getnode__(_root, "bg2"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "effects_oldfilm"),
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DC5_dulandeer_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_20"
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
					name = "DC5_dulandeer_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Broken_DLDE"),
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
					image = "LLan/LLan_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					brightness = 0,
					modelId = "Model_Story_Sword_Broken",
					id = "Broken_DLDE_0",
					rotationX = 0,
					scale = 0.6,
					zorder = 33,
					position = {
						x = 0,
						y = -66,
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
			action = "updateNode",
			actor = __getnode__(_root, "Broken_DLDE_0"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_duanzao")
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "Broken_DLDE"),
				args = function (_ctx)
					return {
						brightness = 100,
						duration = 0.2
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "Broken_DLDE"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "Broken_DLDE")
		}),
		concurrent({
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "Broken_DLDE"),
				args = function (_ctx)
					return {
						brightness = 0,
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Broken_DLDE_0"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Broken_DLDE"),
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
					duration = 0.7
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DC5_dulandeer_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_22"
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
					brightness = 100,
					modelId = "Model_Story_Sword_Broken",
					id = "Broken_DLDE_100",
					rotationX = 0,
					scale = 0.6,
					zorder = 33,
					position = {
						x = 0,
						y = -66,
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
			action = "updateNode",
			actor = __getnode__(_root, "Broken_DLDE_100"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_duanzao")
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "Broken_DLDE_0"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0.2
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "Broken_DLDE_0"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "Broken_DLDE_0")
		}),
		concurrent({
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "Broken_DLDE_0"),
				args = function (_ctx)
					return {
						brightness = 100,
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Broken_DLDE_100"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Broken_DLDE_0"),
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
					duration = 0.7
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "DC5_dulandeer_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_duanzao")
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "Broken_DLDE_100"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0.4
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "Broken_DLDE_100"),
				args = function (_ctx)
					return {
						height = 2,
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "Broken_DLDE_100")
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DLDEr"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "DLDEr"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "DLDEr"),
				args = function (_ctx)
					return {
						brightness = 50,
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Broken_DLDE_100"),
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
					duration = 0.4
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "DLDEr"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0.2
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
				actor = __getnode__(_root, "yin_daoguang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "flashMask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FFFFFF",
								fadeout = 0.3,
								alpha = 1,
								duration = 0.5,
								fadein = 0.3
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg2"),
				args = function (_ctx)
					return {
						duration = 0.3
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
				action = "stop",
				actor = __getnode__(_root, "effects_oldfilm")
			})
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
					modelId = "Model_Story_Sword",
					id = "DLDEr0",
					rotationX = 0,
					scale = 0.6,
					zorder = 337,
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
			actor = __getnode__(_root, "DLDEr0"),
			args = function (_ctx)
				return {
					opacity = 0
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
			action = "fadeIn",
			actor = __getnode__(_root, "DLDEr0"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "LLan"),
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
					name = "DC5_dulandeer_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_24"
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
						"DreamChallenge_5_dulandeer_03a_25"
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
					name = "DC5_dulandeer_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_26"
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
					name = "DC5_dulandeer_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"DreamChallenge_5_dulandeer_03a_27"
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
							"DreamChallenge_5_dulandeer_03a_28"
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "colorBg")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "DLDEr0"),
			args = function (_ctx)
				return {
					duration = 0
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
							x = 0.15,
							y = 0
						}
					}
				}
			end
		}),
		sequential({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "xiao_daoguang0"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "xiao_daoguang1"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "xiao_daoguang2"),
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
				actor = __getnode__(_root, "xiao_daoguang0"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.3,
								y = 0.45
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.3,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_daoguang1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.5,
								y = 0.45
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_daoguang2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0.5,
							y = 0.5,
							refpt = {
								x = 0.85,
								y = 0.45
							}
						}
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sequential({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
				action = "play",
				actor = __getnode__(_root, "xiao_daoguang0"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_daoguang")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
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
		sequential({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
			concurrent({
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_daoguang1"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "yin_daoguang")
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_gedang"),
					args = function (_ctx)
						return {
							duration = 0,
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
				})
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
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
		sequential({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "LLan"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -345,
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
					action = "play",
					actor = __getnode__(_root, "xiao_daoguang2"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "yin_daoguang")
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_gedang"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0.5,
								y = 0.5,
								refpt = {
									x = 0.85,
									y = 0.5
								}
							}
						}
					end
				})
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
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
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LLan"),
			args = function (_ctx)
				return {
					duration = 0.6,
					position = {
						x = 0,
						y = -345,
						refpt = {
							x = 1.4,
							y = 0
						}
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
					duration = 0.5
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_qishi")
		})
	})
end

local function DreamChallenge_5_dulandeer_03a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_DreamChallenge_5_dulandeer_03a",
					scene = scene_DreamChallenge_5_dulandeer_03a
				}
			end
		})
	})
end

stories.DreamChallenge_5_dulandeer_03a = DreamChallenge_5_dulandeer_03a

return _M
