local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_AnDieFerneGeliebte_08a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_AnDieFerneGeliebte_08a = {
	actions = {}
}
scenes.scene_eventstory_AnDieFerneGeliebte_08a = scene_eventstory_AnDieFerneGeliebte_08a

function scene_eventstory_AnDieFerneGeliebte_08a:stage(args)
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
				name = "bg",
				pathType = "SCENE",
				type = "Image",
				image = "musicfestival_fb_bg1.jpg",
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
				children = {}
			},
			{
				layoutMode = 1,
				name = "bg",
				type = "ColorBackGround",
				zorder = 10,
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
				id = "Mus_senlin",
				fileName = "Mus_Story_MusicFestival_1",
				type = "Music"
			},
			{
				id = "Mus_zhandou",
				fileName = "Mus_Story_MusicFestival_4",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_AnDieFerneGeliebte_08a.actions.start_eventstory_AnDieFerneGeliebte_08a(_root, args)
	return sequential({
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		concurrent({
			act({
				action = "activateNode",
				actor = __getnode__(_root, "bg")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_zhandou"),
				args = function (_ctx)
					return {
						isLoop = true
					}
				end
			})
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_CLMan",
						id = "CLMan",
						rotationX = 0,
						scale = 0.9,
						zorder = 20,
						position = {
							x = 0,
							y = -295,
							refpt = {
								x = 0.65,
								y = 0
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
									x = 60.5,
									y = 787
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
						zorder = 15,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.3,
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
									x = -52,
									y = 792
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
			}),
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
			})
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
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan"),
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_1"
						},
						durations = {
							0.03
						}
					}
				end
			})
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_2"
						},
						durations = {
							0.03
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
			})
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CLMan"),
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
					action = "moveTo",
					actor = __getnode__(_root, "CLMan"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -295,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
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
						image = "CLMan/CLMan_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_3"
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
						strength = 1
					}
				end
			})
		}),
		sequential({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CLMan"),
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
				action = "moveTo",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -350,
							refpt = {
								x = 0.3,
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
						name = "AnDieFerneGeliebte_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_4"
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
						strength = 1
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
					image = "CLMan/CLMan_face_1.png",
					pathType = "STORY_FACE"
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
						x = 0,
						y = -300,
						refpt = {
							x = 0.3,
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
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_7",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"AnDieFerneGeliebte_dialog_speak_name_7"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_5"
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
						strength = 1
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
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_2.png",
						pathType = "STORY_FACE"
					}
				end
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
				actor = __getnode__(_root, "ZTXChang"),
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
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_BDFen",
						id = "ABo",
						rotationX = 0,
						scale = 0.72,
						zorder = 20,
						position = {
							x = 0,
							y = -350,
							refpt = {
								x = 0.3,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ABo_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "abo/face_abo_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ABo_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 9.7,
									y = 1161
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ABo"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ABo"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_PGNNi",
						id = "yqing",
						rotationX = 0,
						scale = 0.73,
						zorder = 24,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.7,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "yqing_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "yqing/face_yqing_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "yqing_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -56,
									y = 1074
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "yqing"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "yqing"),
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
				actor = __getnode__(_root, "yqing"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ABo"),
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
					name = "AnDieFerneGeliebte_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ABo"
					},
					content = {
						"eventstory_AnDieFerneGeliebte_08a_6"
					},
					durations = {
						0.03
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
						name = "AnDieFerneGeliebte_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ABo"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_7"
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
					name = "AnDieFerneGeliebte_dialog_speak_name_7",
					dialogImage = "jq_dialogue_bg_6.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"AnDieFerneGeliebte_dialog_speak_name_7"
					},
					content = {
						"eventstory_AnDieFerneGeliebte_08a_8"
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
				action = "flashScreen",
				actor = __getnode__(_root, "flashMask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FFFFFF",
								fadeout = 0,
								alpha = 1,
								duration = 0.5,
								fadein = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "show",
				actor = __getnode__(_root, "colorBg"),
				args = function (_ctx)
					return {
						bgColor = "#FFFFFF"
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
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ABo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "abo/face_abo_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ABo"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_9"
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
					name = "AnDieFerneGeliebte_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ABo"
					},
					content = {
						"eventstory_AnDieFerneGeliebte_08a_10"
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
					name = "AnDieFerneGeliebte_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ABo"
					},
					content = {
						"eventstory_AnDieFerneGeliebte_08a_11"
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
					name = "AnDieFerneGeliebte_dialog_speak_name_9",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ABo"
					},
					content = {
						"eventstory_AnDieFerneGeliebte_08a_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ABo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "abo/face_abo_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					center = 1,
					content = {
						"eventstory_AnDieFerneGeliebte_08a_13"
					},
					durations = {
						0.07
					},
					waitTimes = {
						0.8
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "colorBg")
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
			action = "play",
			actor = __getnode__(_root, "Mus_senlin"),
			args = function (_ctx)
				return {
					isLoop = true
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
				action = "changeTexture",
				actor = __getnode__(_root, "yqing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "yqing/face_yqing_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"yqing"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_14"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "yqing"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -420,
						refpt = {
							x = 0.7,
							y = 0
						}
					}
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
					name = "AnDieFerneGeliebte_dialog_speak_name_8",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"yqing"
					},
					content = {
						"eventstory_AnDieFerneGeliebte_08a_15"
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
				actor = __getnode__(_root, "ABo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "abo/face_abo_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ABo"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_16"
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
				actor = __getnode__(_root, "yqing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "yqing/face_yqing_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"yqing"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_17"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "yqing_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "yqing/face_yqing_2.png",
					pathType = "STORY_FACE"
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
				action = "changeTexture",
				actor = __getnode__(_root, "yqing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "yqing/face_yqing_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"yqing"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_18"
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
				actor = __getnode__(_root, "ABo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "abo/face_abo_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ABo"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_19"
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
				actor = __getnode__(_root, "ABo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "abo/face_abo_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ABo"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_20"
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
				actor = __getnode__(_root, "yqing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "yqing/face_yqing_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"yqing"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_21"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		sequential({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ABo"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "ABo"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -350,
								refpt = {
									x = 0.4,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "yqing"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -340,
								refpt = {
									x = 0.6,
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
					duration = 0.5
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ABo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "abo/face_abo_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ABo"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_22"
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
				actor = __getnode__(_root, "ABo_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "abo/face_abo_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_9",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ABo"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_23"
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
				actor = __getnode__(_root, "yqing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "yqing/face_yqing_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"yqing"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_24"
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
				actor = __getnode__(_root, "yqing_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "yqing/face_yqing_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_8",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"yqing"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_25"
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
					duration = 0.8
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "yqing"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ABo"),
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_BLTu1",
						id = "BLTu",
						rotationX = 0,
						scale = 0.75,
						zorder = 10,
						position = {
							x = 0,
							y = -400,
							refpt = {
								x = 0.6,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "BLTu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "BLTu/BLTu_face_3.png",
								scaleX = 1.3,
								scaleY = 1.3,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "BLTu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 50.3,
									y = 1218.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BLTu"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BLTu"),
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
					name = "AnDieFerneGeliebte_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BLTu"
					},
					content = {
						"eventstory_AnDieFerneGeliebte_08a_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BLTu"),
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -295,
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
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.2,
								y = 0
							}
						}
					}
				end
			}),
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
				action = "orbitCamera",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_1.png",
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
						image = "ZTXChang/ZTXChang_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_FTLEShi",
						id = "FTLEShi",
						rotationX = 0,
						scale = 0.9,
						zorder = 10,
						position = {
							x = 0,
							y = -400,
							refpt = {
								x = 0.75,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "FTLEShi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "FTLEShi/FTLEShi_face_13.png",
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
									y = 998
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
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0.3
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_27"
						},
						durations = {
							0.03
						}
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
					image = "CLMan/CLMan_face_13.png",
					pathType = "STORY_FACE"
				}
			end
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
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_28"
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
						image = "CLMan/CLMan_face_2.png",
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
						image = "FTLEShi/FTLEShi_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_29"
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
						"eventstory_AnDieFerneGeliebte_08a_30"
					},
					storyLove = {}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ZTXChang_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXChang/ZTXChang_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_31"
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
				actor = __getnode__(_root, "ZTXChang_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXChang/ZTXChang_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_32"
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
					action = "moveTo",
					actor = __getnode__(_root, "CLMan"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.45,
									y = 0.1
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
							duration = 0.2,
							position = {
								x = 0,
								y = -330,
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
					actor = __getnode__(_root, "CLMan"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.45,
									y = 0.1
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
							duration = 0.2,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.45,
									y = 0
								}
							}
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
						image = "CLMan/CLMan_face_13.png",
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "AnDieFerneGeliebte_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_33"
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
						"eventstory_AnDieFerneGeliebte_08a_34"
					},
					storyLove = {}
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
						image = "CLMan/CLMan_face_1.png",
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
						name = "AnDieFerneGeliebte_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"eventstory_AnDieFerneGeliebte_08a_35"
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
				action = "show",
				actor = __getnode__(_root, "dialogueChoose"),
				args = function (_ctx)
					return {
						content = {
							"eventstory_AnDieFerneGeliebte_08a_36"
						},
						storyLove = {}
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
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
							y = -300,
							refpt = {
								x = 0.4,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			})
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						brightness = 0
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ZTXChang_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXChang/ZTXChang_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.2
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
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
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		})
	})
end

local function eventstory_AnDieFerneGeliebte_08a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_AnDieFerneGeliebte_08a",
					scene = scene_eventstory_AnDieFerneGeliebte_08a
				}
			end
		})
	})
end

stories.eventstory_AnDieFerneGeliebte_08a = eventstory_AnDieFerneGeliebte_08a

return _M
