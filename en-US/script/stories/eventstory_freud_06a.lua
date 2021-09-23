local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_freud_06a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_freud_06a = {
	actions = {}
}
scenes.scene_eventstory_freud_06a = scene_eventstory_freud_06a

function scene_eventstory_freud_06a:stage(args)
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
						name = "bg_vns",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_1_5.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg_vns",
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
						name = "bg_freud",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_collapsed_3.jpg",
						layoutMode = 1,
						zorder = 5,
						id = "bg_freud",
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
				id = "Mus_xige",
				fileName = "Mus_Story_Collapsed",
				type = "Music"
			},
			{
				id = "Mus_weixian",
				fileName = "Mus_Battle_Danger",
				type = "Music"
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 10,
				videoName = "story_bossd",
				id = "xiao_zhiliao",
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
				id = "mask",
				type = "Mask"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_freud_06a.actions.start_eventstory_freud_06a(_root, args)
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
			actor = __getnode__(_root, "bg_vns")
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
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_freud_06a_1",
						"eventstory_freud_06a_2",
						"eventstory_freud_06a_3",
						"eventstory_freud_06a_4"
					},
					durations = {
						0.07,
						0.07,
						0.07,
						0.07
					},
					waitTimes = {
						1,
						1,
						1,
						1.2
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_freud_06a_5",
						"eventstory_freud_06a_6"
					},
					durations = {
						0.07,
						0.08
					},
					waitTimes = {
						1,
						1.2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
							x = -60,
							y = -250,
							refpt = {
								x = 0.4,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CLMan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "CLMan/CLMan_face_6.png",
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
				action = "orbitCamera",
				actor = __getnode__(_root, "CLMan"),
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
						zorder = 115,
						position = {
							x = 16,
							y = -280,
							refpt = {
								x = 0.6,
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
						zorder = 130,
						position = {
							x = 30,
							y = -320,
							refpt = {
								x = -0.3,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "MLYTLSha_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "MLYTLSha/MLYTLSha_face_4.png",
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.8
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0.2
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_freud_06a_7"
						},
						durations = {
							0.03
						}
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_12",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FTLEShi"
						},
						content = {
							"eventstory_freud_06a_8"
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
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CLMan"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = -60,
								y = -250,
								refpt = {
									x = 0.3,
									y = -0.15
								}
							}
						}
					end
				}),
				act({
					action = "brightnessTo",
					actor = __getnode__(_root, "CLMan"),
					args = function (_ctx)
						return {
							brightness = -25,
							duration = 0.3
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "FTLEShi"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 16,
								y = -280,
								refpt = {
									x = 0.7,
									y = -0.15
								}
							}
						}
					end
				}),
				act({
					action = "brightnessTo",
					actor = __getnode__(_root, "FTLEShi"),
					args = function (_ctx)
						return {
							brightness = -25,
							duration = 0.3
						}
					end
				})
			})
		}),
		concurrent({
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
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.6
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
						zorder = 120,
						position = {
							x = 50,
							y = -270,
							refpt = {
								x = -0.3,
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "MLYTLSha"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "MLYTLSha"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 30,
						y = -320,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
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
					name = "freud_dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYTLSha"
					},
					content = {
						"eventstory_freud_06a_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_zhiliao"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_freud_06a_10"
					},
					storyLove = {}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
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
				action = "moveTo",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 50,
							y = -270,
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
				actor = __getnode__(_root, "MLYTLSha"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 30,
							y = -320,
							refpt = {
								x = 0.65,
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "freud_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_freud_06a_11"
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
					name = "freud_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_freud_06a_12"
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
						"eventstory_freud_06a_13"
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
					name = "freud_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_freud_06a_14"
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
					name = "freud_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_freud_06a_15"
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
					name = "freud_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_freud_06a_16"
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
						"eventstory_freud_06a_17"
					},
					storyLove = {}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MLYTLSha_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "MLYTLSha/MLYTLSha_face_5.png",
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
						image = "ZTXChang/ZTXChang_face_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_11",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYTLSha"
						},
						content = {
							"eventstory_freud_06a_18"
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
					name = "freud_dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYTLSha"
					},
					content = {
						"eventstory_freud_06a_19"
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
						"eventstory_freud_06a_20"
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
					name = "freud_dialog_speak_name_11",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MLYTLSha"
					},
					content = {
						"eventstory_freud_06a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_MGNa",
						id = "MGNa",
						rotationX = 0,
						scale = 0.7,
						zorder = 150,
						position = {
							x = 214,
							y = -440,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "MGNa_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "MGNa/MGNa_face_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "MGNa_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -369.5,
									y = 1262
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MGNa"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
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
						name = "freud_dialog_speak_name_4",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"eventstory_freud_06a_22"
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
			actor = __getnode__(_root, "xiao_zhiliao")
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 50,
							y = -270,
							refpt = {
								x = 0.15,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYTLSha"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 30,
							y = -320,
							refpt = {
								x = 0.85,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MGNa"),
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
						name = "freud_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MGNa"
						},
						content = {
							"eventstory_freud_06a_23"
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
			action = "flashScreen",
			actor = __getnode__(_root, "mask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#FFFFFF",
							fadeout = 0,
							alpha = 1,
							duration = 0.5,
							fadein = 0.5
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
			action = "fadeOut",
			actor = __getnode__(_root, "MLYTLSha"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MGNa"),
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
			action = "moveTo",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = -60,
						y = -250,
						refpt = {
							x = 0.3,
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
					duration = 0.3,
					position = {
						x = 16,
						y = -280,
						refpt = {
							x = 0.7,
							y = 0
						}
					}
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
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
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
						170
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
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						0,
						0,
						0,
						85
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
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						255,
						255,
						255,
						85
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
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						255,
						255,
						255,
						170
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
						170
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
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						0,
						0,
						0,
						85
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_freud_06a_24"
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_12",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"FTLEShi"
						},
						content = {
							"eventstory_freud_06a_25"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_freud_06a_26",
						"eventstory_freud_06a_27"
					},
					storyLove = {}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CLMan"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = -60,
								y = -250,
								refpt = {
									x = 0.3,
									y = -0.15
								}
							}
						}
					end
				}),
				act({
					action = "brightnessTo",
					actor = __getnode__(_root, "CLMan"),
					args = function (_ctx)
						return {
							brightness = -25,
							duration = 0.4
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "FTLEShi"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = 16,
								y = -280,
								refpt = {
									x = 0.7,
									y = -0.15
								}
							}
						}
					end
				}),
				act({
					action = "brightnessTo",
					actor = __getnode__(_root, "FTLEShi"),
					args = function (_ctx)
						return {
							brightness = -25,
							duration = 0.4
						}
					end
				})
			})
		}),
		concurrent({
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
			actor = __getnode__(_root, "MGNa"),
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
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MGNa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "MGNa/MGNa_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MGNa"
						},
						content = {
							"eventstory_freud_06a_28"
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_FEMSi",
						id = "XLTe",
						rotationX = 0,
						scale = 0.72,
						zorder = 30,
						position = {
							x = 42,
							y = -305,
							refpt = {
								x = 1.4,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "XLTe_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "xlte/face_xlte_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "XLTe_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -42.5,
									y = 1096
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "XLTe"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MGNa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "MGNa/MGNa_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MGNa"
						},
						content = {
							"eventstory_freud_06a_29"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "XLTe"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "XLTe"),
					args = function (_ctx)
						return {
							duration = 0.4,
							position = {
								x = 42,
								y = -305,
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
				action = "moveTo",
				actor = __getnode__(_root, "MGNa"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 214,
							y = -440,
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
				action = "changeTexture",
				actor = __getnode__(_root, "XLTe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xlte/face_xlte_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"XLTe"
						},
						content = {
							"eventstory_freud_06a_30"
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
			action = "changeTexture",
			actor = __getnode__(_root, "MGNa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MGNa/MGNa_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.5
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MGNa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "MGNa/MGNa_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MGNa"
						},
						content = {
							"eventstory_freud_06a_31"
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
				actor = __getnode__(_root, "MGNa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "MGNa/MGNa_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MGNa"
						},
						content = {
							"eventstory_freud_06a_32"
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
				actor = __getnode__(_root, "XLTe_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xlte/face_xlte_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"XLTe"
						},
						content = {
							"eventstory_freud_06a_33"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "XLTe"),
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
				actor = __getnode__(_root, "XLTe"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 42,
							y = -305,
							refpt = {
								x = 1.4,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "XLTe"),
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MGNa"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 214,
							y = -440,
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
				actor = __getnode__(_root, "MGNa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "MGNa/MGNa_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MGNa"
						},
						content = {
							"eventstory_freud_06a_34"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_freud_06a_35"
					},
					storyLove = {}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "MLYTLSha"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 30,
						y = -320,
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
				action = "changeTexture",
				actor = __getnode__(_root, "MGNa_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "MGNa/MGNa_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_6",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MGNa"
						},
						content = {
							"eventstory_freud_06a_36"
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
		concurrent({
			sequential({
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
				action = "fadeOut",
				actor = __getnode__(_root, "MGNa"),
				args = function (_ctx)
					return {
						duration = 0
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
								color = "#36057E",
								fadeout = 0.1,
								alpha = 1,
								duration = 0.5,
								fadein = 0.5
							}
						}
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_xige"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.1
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
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MLYTLSha_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "MLYTLSha/MLYTLSha_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "freud_dialog_speak_name_11",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MLYTLSha"
						},
						content = {
							"eventstory_freud_06a_37"
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "freud_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"freud_dialog_speak_name_8"
					},
					content = {
						"eventstory_freud_06a_38"
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_freud"),
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_FLYDe",
						id = "xge",
						rotationX = 0,
						scale = 1,
						zorder = 200,
						position = {
							x = -17,
							y = -700,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "xge_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "xge/face_xge_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "xge_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 17,
									y = 1181.9
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xge"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "freud_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"freud_dialog_speak_name_8"
					},
					content = {
						"eventstory_freud_06a_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			sequential({
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
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "mask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#36057E",
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
				action = "fadeIn",
				actor = __getnode__(_root, "xge"),
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
					duration = 1.1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "freud_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"eventstory_freud_06a_40"
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
					name = "freud_dialog_speak_name_13",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"eventstory_freud_06a_41"
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
					duration = 0.8
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
			action = "fadeOut",
			actor = __getnode__(_root, "xge"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_xige")
		})
	})
end

local function eventstory_freud_06a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_freud_06a",
					scene = scene_eventstory_freud_06a
				}
			end
		})
	})
end

stories.eventstory_freud_06a = eventstory_freud_06a

return _M
