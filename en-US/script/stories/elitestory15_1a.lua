local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.elitestory15_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_elitestory15_1a = {
	actions = {}
}
scenes.scene_elitestory15_1a = scene_elitestory15_1a

function scene_elitestory15_1a:stage(args)
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
						image = "bg_story_scene_9_3.jpg",
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
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 53,
				visible = false,
				id = "liqi_EX",
				scale = 1,
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
				zorder = 3,
				visible = false,
				id = "huiyib_EX",
				scale = 1.05,
				actionName = "huiyib_juqingtexiao",
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
				id = "Se_Story_Impact_2",
				fileName = "Se_Story_Impact_2",
				type = "Sound"
			},
			{
				id = "Mus_Story_Memory",
				fileName = "Mus_Story_Memory",
				type = "Music"
			},
			{
				id = "Mus_Story_Anna_Concert",
				fileName = "Mus_Story_Anna_Concert",
				type = "Music"
			},
			{
				id = "mask",
				type = "Mask"
			},
			{
				id = "flashMask",
				type = "FlashMask"
			}
		},
		__actions__ = self.actions
	}
end

function scene_elitestory15_1a.actions.start_elitestory15_1a(_root, args)
	return sequential({
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
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1.5
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Anna_Concert"),
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
					duration = 3
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Enemy_Story_Normal",
					id = "Monster_1_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 21,
					position = {
						x = 0,
						y = -80,
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
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 1.5
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_43",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory15_1a_1"
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
						name = "dialog_speak_name_43",
						speakings = {
							"Monster_1_speak"
						},
						content = {
							"elitestory15_1a_2"
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"elitestory15_1a_3"
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_43",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory15_1a_4"
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
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_EX")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Impact_2")
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
			action = "flashScreen",
			actor = __getnode__(_root, "flashMask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#ffffff",
							fadeout = 0.5,
							alpha = 0.8,
							duration = 0.5,
							fadein = 0.5
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
						"elitestory15_1a_5"
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "Monster_1_speak"),
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
					name = "dialog_speak_name_43",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory15_1a_6"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_43",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory15_1a_7"
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
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.6,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = -0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"elitestory15_1a_8"
					}
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
							fadeout = 1,
							alpha = 1,
							duration = 1.5,
							fadein = 1
						}
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "huiyib_EX"),
			args = function (_ctx)
				return {
					time = -1
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_MLYTLSha",
					id = "MLYTLSha_speak",
					rotationX = 0,
					scale = 1,
					position = {
						x = 0,
						y = -355,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "MLYTLSha_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "MLYTLSha/MLYTLSha_face_2.png",
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
								x = -29,
								y = 829
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MLYTLSha_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "MLYTLSha_face"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MLYTLSha_speak"),
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
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_9"
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "MLYTLSha_face"),
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
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_10"
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
						"elitestory15_1a_11"
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MLYTLSha_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -80,
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
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_43",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory15_1a_12"
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
						"elitestory15_1a_13"
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
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
			action = "fadeIn",
			actor = __getnode__(_root, "MLYTLSha_speak"),
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_14"
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MLYTLSha_speak"),
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
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 0.9,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -80,
							refpt = {
								x = 0.8,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 0.4,
							y = 0
						}
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
			action = "orbitCamera",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
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
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -80,
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
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
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
			action = "orbitCamera",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_43",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory15_1a_15"
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
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 0.6,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_43",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory15_1a_16"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_43",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory15_1a_17"
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Research")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Memory"),
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
					speakings = {
						""
					},
					content = {
						"elitestory15_1a_18"
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -80,
							refpt = {
								x = 0.58,
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
						name = "dialog_speak_name_43",
						speakings = {
							"Monster_1_speak"
						},
						content = {
							"elitestory15_1a_19"
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -80,
							refpt = {
								x = 0.54,
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
						name = "dialog_speak_name_43",
						speakings = {
							"Monster_1_speak"
						},
						content = {
							"elitestory15_1a_20"
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -80,
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
						name = "dialog_speak_name_43",
						speakings = {
							"Monster_1_speak"
						},
						content = {
							"elitestory15_1a_21"
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
					name = "dialog_speak_name_43",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory15_1a_22"
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
						"elitestory15_1a_23"
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
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 1
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
								fadeout = 1,
								alpha = 1,
								duration = 1.5,
								fadein = 1
							}
						}
					}
				end
			})
		}),
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
			action = "fadeIn",
			actor = __getnode__(_root, "MLYTLSha_speak"),
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
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_24"
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
						"elitestory15_1a_25"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_26"
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MLYTLSha_face"),
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
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_27"
					}
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "MLYTLSha_speak"),
				args = function (_ctx)
					return {
						scale = 1.35,
						duration = 1.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "MLYTLSha_speak"),
				args = function (_ctx)
					return {
						duration = 1.5,
						position = {
							x = 0,
							y = -355,
							refpt = {
								x = 0.5,
								y = -0.5
							}
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
						"elitestory15_1a_28",
						"elitestory15_1a_29"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_30"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_31"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_32"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_33"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_34"
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
						"elitestory15_1a_35"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_36"
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MLYTLSha_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MLYTLSha/MLYTLSha_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "MLYTLSha_face"),
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
					name = "dialog_speak_name_7",
					speakings = {
						"MLYTLSha_speak"
					},
					content = {
						"elitestory15_1a_37"
					}
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

local function elitestory15_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_elitestory15_1a",
					scene = scene_elitestory15_1a
				}
			end
		})
	})
end

stories.elitestory15_1a = elitestory15_1a

return _M
