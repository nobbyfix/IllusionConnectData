local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story17_2a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story17_2a = {
	actions = {}
}
scenes.scene_story17_2a = scene_story17_2a

function scene_story17_2a:stage(args)
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
						name = "bg_di",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "hm.png",
						layoutMode = 1,
						zorder = 5,
						id = "bg_di",
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
						name = "bg_shiyan",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_8_3.jpg",
						layoutMode = 1,
						zorder = 10,
						id = "bg_shiyan",
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
						name = "bg_waijing",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_1_5.jpg",
						layoutMode = 1,
						zorder = 50,
						id = "bg_waijing",
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
						name = "cg_nvzhu",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_01_1.jpg",
						layoutMode = 1,
						zorder = 48,
						id = "cg_nvzhu",
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
				id = "Mus_weixian",
				fileName = "Mus_Story_Danger",
				type = "Music"
			},
			{
				id = "Mus_ruqin",
				fileName = "Mus_Story_Danger",
				type = "Music"
			},
			{
				id = "Mus_mengxing",
				fileName = "Mus_Story_Chaos",
				type = "Music"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_yanwu",
				scale = 2,
				actionName = "Summon_buff",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.25,
						y = 0.8
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_story17_2a.actions.start_story17_2a(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg_shiyan")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_di"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_weixian"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_BLTu4",
						id = "BadGuy",
						rotationX = 0,
						scale = 1.02,
						zorder = 160,
						position = {
							x = 0,
							y = -470,
							refpt = {
								x = 0.64,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BadGuy"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Master_XueZhan",
						id = "Master",
						rotationX = 0,
						scale = 1,
						zorder = 145,
						position = {
							x = 0,
							y = -450,
							refpt = {
								x = 0.28,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			})
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_MLYTLSha",
						id = "MLYTLSha",
						rotationX = 0,
						scale = 0.7,
						zorder = 30,
						position = {
							x = 0,
							y = -320,
							refpt = {
								x = 0.53,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "MLYTLSha_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "MLYTLSha/MLYTLSha_face_5.png",
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
									x = -34.5,
									y = 1096
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MLYTLSha"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Master"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BadGuy"),
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
					duration = 3
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "hideButton")
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NS16_19_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BadGuy"
					},
					content = {
						"story17_2a_1"
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
					name = "NS16_19_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"story17_2a_2"
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
					name = "NS16_19_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BadGuy"
					},
					content = {
						"story17_2a_3"
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
					name = "NS16_19_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BadGuy"
					},
					content = {
						"story17_2a_4"
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
					name = "NS16_19_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"story17_2a_5"
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
						"story17_2a_6"
					},
					storyLove = {}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NS16_19_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"story17_2a_7"
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
					name = "NS16_19_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"story17_2a_8"
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
				action = "fadeOut",
				actor = __getnode__(_root, "BadGuy"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Master"),
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
					duration = 0.15
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "MLYTLSha"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
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
					name = "NS16_19_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYTLSha"
					},
					content = {
						"story17_2a_9"
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
					duration = 0.15
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MLYTLSha"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.15
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BadGuy"),
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
					duration = 0.15
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NS16_19_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"story17_2a_10"
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
					name = "NS16_19_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BadGuy"
					},
					content = {
						"story17_2a_11"
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
					name = "NS16_19_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BadGuy"
					},
					content = {
						"story17_2a_12"
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
						"story17_2a_13"
					},
					storyLove = {}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_yanwu"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "NS16_19_dialog_speak_name_12",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Master"
						},
						content = {
							"story17_2a_14"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = -450,
							refpt = {
								x = 0.28,
								y = -0.3
							}
						}
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_yanwu")
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Master"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -450,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "Master"),
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
			actor = __getnode__(_root, "BadGuy"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -470,
						refpt = {
							x = 0.39,
							y = 0
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
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
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
			action = "scaleTo",
			actor = __getnode__(_root, "BadGuy"),
			args = function (_ctx)
				return {
					scale = 1.2,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BadGuy"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -641.5,
						refpt = {
							x = 0.39,
							y = 0
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"story17_2a_15"
					},
					storyLove = {}
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_shiyan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_waijing"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_ruqin"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg_nvzhu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "cg_nvzhu"),
			args = function (_ctx)
				return {
					zorder = 48
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BadGuy"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_ZTXChang",
						id = "ZTXChang",
						rotationX = 0,
						scale = 0.6,
						zorder = 135,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.57,
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
									x = -51.3,
									y = 977.5
								}
							}
						}
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_CLMan",
						id = "CLMan",
						rotationX = 0,
						scale = 0.63,
						zorder = 125,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.46,
								y = 0.5
							}
						},
						children = {
							{
								resType = 0,
								name = "CLMan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "CLMan/CLMan_face_1.png",
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
									x = 77.5,
									y = 1045.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_FTLEShi",
						id = "FTLEShi",
						rotationX = 0,
						scale = 0.6,
						zorder = 110,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.54,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "FTLEShi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "FTLEShi/FTLEShi_face_11.png",
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
									x = -41.5,
									y = 1286.1
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"story17_2a_16"
					},
					storyLove = {}
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
		sleep({
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
					name = "NS16_19_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"story17_2a_17"
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
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_waijing"),
				args = function (_ctx)
					return {
						duration = 0.4
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
			action = "updateNode",
			actor = __getnode__(_root, "bg_waijing"),
			args = function (_ctx)
				return {
					zorder = 45
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NS16_19_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NS16_19_dialog_speak_name_7"
					},
					content = {
						"story17_2a_18"
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
					image = "ZTXChang/ZTXChang_face_9.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_waijing"),
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
			actor = __getnode__(_root, "cg_nvzhu"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "ZTXChang"),
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
					name = "NS16_19_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"story17_2a_19"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.15
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
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg_nvzhu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "cg_nvzhu"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "bg_story_cg_01_3.jpg",
					pathType = "SCENE"
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
		sleep({
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
					name = "NS16_19_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NS16_19_dialog_speak_name_7"
					},
					content = {
						"story17_2a_20"
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
			actor = __getnode__(_root, "cg_nvzhu"),
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CLMan"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.46,
									y = -0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CLMan"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -250,
								refpt = {
									x = 0.46,
									y = 0
								}
							}
						}
					end
				})
			})
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
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_13.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "NS16_19_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"story17_2a_21"
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.46,
								y = 0.3
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.15
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
					duration = 0.15
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg_nvzhu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "cg_nvzhu"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "bg_story_cg_01_2.jpg",
					pathType = "SCENE"
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
		sleep({
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
					name = "NS16_19_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NS16_19_dialog_speak_name_7"
					},
					content = {
						"story17_2a_22"
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
			actor = __getnode__(_root, "cg_nvzhu"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "Master"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NS16_19_dialog_speak_name_12",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"story17_2a_23"
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
						"story17_2a_24"
					},
					storyLove = {}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"story17_2a_25"
					},
					storyLove = {}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Master"),
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
				action = "fadeOut",
				actor = __getnode__(_root, "bg_waijing"),
				args = function (_ctx)
					return {
						duration = 0.8
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_JNLong",
						id = "JNLong",
						rotationX = 0,
						scale = 0.65,
						zorder = 130,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.38,
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
									x = 268.5,
									y = 1184
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
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JNLong"),
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
			action = "moveTo",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -250,
						refpt = {
							x = 0.46,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ZTXChang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -270,
						refpt = {
							x = 0.77,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -280,
						refpt = {
							x = 0.26,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CLMan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "CLMan/CLMan_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_11.png",
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
					image = "FTLEShi/FTLEShi_face_13.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					zorder = 150
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "ZTXChang"),
			args = function (_ctx)
				return {
					zorder = 145
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					zorder = 140
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NS16_19_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JNLong"
					},
					content = {
						"story17_2a_26"
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
					name = "NS16_19_dialog_speak_name_6",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NS16_19_dialog_speak_name_7"
					},
					content = {
						"story17_2a_27"
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
					name = "NS16_19_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"JNLong"
					},
					content = {
						"story17_2a_28"
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
						"story17_2a_29"
					},
					storyLove = {}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_mengxing"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
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
					name = "NS16_19_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CLMan"
					},
					content = {
						"story17_2a_30"
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
			actor = __getnode__(_root, "ZTXChang"),
			args = function (_ctx)
				return {
					duration = 0
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
					name = "NS16_19_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"story17_2a_31"
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
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					duration = 0
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ZTXChang_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXChang/ZTXChang_face_12.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "NS16_19_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FTLEShi"
						},
						content = {
							"story17_2a_32"
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
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_11.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ZTXChang_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXChang/ZTXChang_face_6.png",
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
						image = "FTLEShi/FTLEShi_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "show",
				actor = __getnode__(_root, "dialogueChoose"),
				args = function (_ctx)
					return {
						content = {
							"story17_2a_33"
						},
						storyLove = {}
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
						"story17_2a_34"
					},
					storyLove = {}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "FTLEShi"),
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
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_mengxing")
		})
	})
end

local function story17_2a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story17_2a",
					scene = scene_story17_2a
				}
			end
		})
	})
end

stories.story17_2a = story17_2a

return _M
