local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.elitestory14_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_elitestory14_1a = {
	actions = {}
}
scenes.scene_elitestory14_1a = scene_elitestory14_1a

function scene_elitestory14_1a:stage(args)
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
						image = "main_img_16.jpg",
						layoutMode = 1,
						zorder = 75,
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
								layoutMode = 1,
								type = "MovieClip",
								zorder = 10,
								visible = true,
								id = "bg11",
								scale = 1,
								actionName = "shisizhang_shisizhang",
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
				id = "Mus_Story_Playground_Confused",
				fileName = "Mus_Story_Playground_Confused",
				type = "Music"
			},
			{
				id = "Mus_Story_Home",
				fileName = "Mus_Story_Home",
				type = "Music"
			},
			{
				id = "Se_Story_Flame_Roaring",
				fileName = "Se_Story_Flame_Roaring",
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
				id = "yin_jian",
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
			}
		},
		__actions__ = self.actions
	}
end

function scene_elitestory14_1a.actions.start_elitestory14_1a(_root, args)
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
			actor = __getnode__(_root, "bg11"),
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
					duration = 1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Playground_Confused"),
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
						modelId = "Model_Story_SGHQShou01",
						id = "LX",
						rotationX = 0,
						scale = 0.62,
						zorder = 66,
						position = {
							x = 0,
							y = -320,
							refpt = {
								x = 0.25,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SGHQShou_LoLi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SGHQShou/SGHQShou01_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "SGHQShou_LoLi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 51.8,
									y = 991
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LX"),
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
						modelId = "Model_Story_SGHQShou02",
						id = "BD",
						rotationX = 0,
						scale = 0.62,
						zorder = 60,
						position = {
							x = 0,
							y = -386,
							refpt = {
								x = 0.45,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SGHQShou_ShaoNv_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SGHQShou/SGHQShou02_face_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "SGHQShou_ShaoNv_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 64,
									y = 1324
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BD"),
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
						modelId = "Model_Story_SGHQShou03",
						id = "FNS",
						rotationX = 0,
						scale = 0.62,
						zorder = 55,
						position = {
							x = 0,
							y = -307,
							refpt = {
								x = 0.65,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SGHQShou_YuJie_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SGHQShou/SGHQShou03_face_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "SGHQShou_YuJie_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 69,
									y = 1322
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "FNS"),
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
						modelId = "Model_WEDe",
						id = "WEDe",
						rotationX = 0,
						scale = 0.65,
						zorder = 50,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 0.65,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "WEDe_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "WEDe/WEDe_face_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "WEDe_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 190.5,
									y = 1380
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "WEDe"),
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
						modelId = "Model_WLSTNCi",
						id = "QTLJ",
						rotationX = 0,
						scale = 0.7,
						zorder = 100,
						position = {
							x = 0,
							y = -500,
							refpt = {
								x = 0.15,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "qtljia_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "qtljia/face_qtljia_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "qtljia_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -295.6,
									y = 1309
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "QTLJ"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "QTLJ"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FNS"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BD"
					},
					content = {
						"elitestory14_1a_1"
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
					name = "NewElite_dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BD"
					},
					content = {
						"elitestory14_1a_2"
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
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FNS"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "QTLJ"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_3"
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
					name = "NewElite_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_4"
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
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FNS"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "QTLJ"),
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
					name = "NewElite_dialog_speak_name_22",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BD"
					},
					content = {
						"elitestory14_1a_5"
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
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FNS"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "QTLJ"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "qtljia_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "qtljia/face_qtljia_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_7"
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
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FNS"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "QTLJ"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SGHQShou_LoLi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SGHQShou/SGHQShou01_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SGHQShou_ShaoNv_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SGHQShou/SGHQShou02_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SGHQShou_YuJie_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SGHQShou/SGHQShou03_face_4.png",
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
					name = "NewElite_dialog_speak_name_23",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BD",
						"FNS",
						"LX"
					},
					content = {
						"elitestory14_1a_8"
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
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FNS"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "QTLJ"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_9"
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
					name = "NewElite_dialog_speak_name_15",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_10"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "WEDe"),
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
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "qtljia_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "qtljia/face_qtljia_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_12"
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
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "qtljia_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "qtljia/face_qtljia_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "WEDe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "WEDe/WEDe_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_15"
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
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_16"
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
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "qtljia_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "qtljia/face_qtljia_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "qtljia_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "qtljia/face_qtljia_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_19"
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
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FNS"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "QTLJ"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "WEDe"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SGHQShou_LoLi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SGHQShou/SGHQShou01_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SGHQShou_ShaoNv_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SGHQShou/SGHQShou02_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SGHQShou_YuJie_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SGHQShou/SGHQShou03_face_1.png",
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
					name = "NewElite_dialog_speak_name_23",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BD",
						"FNS",
						"LX"
					},
					content = {
						"elitestory14_1a_20"
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
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FNS"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "QTLJ"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "WEDe"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_21"
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
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "WEDe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "WEDe/WEDe_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_23"
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
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "qtljia_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "qtljia/face_qtljia_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_25"
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
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FNS"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "QTLJ"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "WEDe"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SGHQShou_LoLi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SGHQShou/SGHQShou01_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SGHQShou_ShaoNv_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SGHQShou/SGHQShou02_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SGHQShou_YuJie_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SGHQShou/SGHQShou03_face_1.png",
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
					name = "NewElite_dialog_speak_name_23",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BD",
						"FNS",
						"LX"
					},
					content = {
						"elitestory14_1a_26"
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
				actor = __getnode__(_root, "LX"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BD"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FNS"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "QTLJ"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "WEDe"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_Story_Home"),
				args = function (_ctx)
					return {
						isLoop = true
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_27"
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
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "qtljia_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "qtljia/face_qtljia_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_29"
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
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_30"
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
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "WEDe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "WEDe/WEDe_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_32"
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
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "qtljia_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "qtljia/face_qtljia_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_34"
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
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_35"
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
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "qtljia_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "qtljia/face_qtljia_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_25",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"QTLJ"
					},
					content = {
						"elitestory14_1a_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "WEDe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "WEDe/WEDe_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_38"
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
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_39"
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
					name = "NewElite_dialog_speak_name_24",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe"
					},
					content = {
						"elitestory14_1a_40"
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
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Home")
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

local function elitestory14_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_elitestory14_1a",
					scene = scene_elitestory14_1a
				}
			end
		})
	})
end

stories.elitestory14_1a = elitestory14_1a

return _M
