local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.elitestory11_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_elitestory11_1a = {
	actions = {}
}
scenes.scene_elitestory11_1a = scene_elitestory11_1a

function scene_elitestory11_1a:stage(args)
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
						image = "bg_story_scene_1_9.jpg",
						layoutMode = 1,
						zorder = 4,
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
				resType = 0,
				name = "story_eye_1",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "story_eye_1.png",
				layoutMode = 1,
				zorder = 501,
				id = "story_eye_1",
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
				name = "story_eye_2",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "story_eye_2.png",
				layoutMode = 1,
				zorder = 502,
				id = "story_eye_2",
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
				name = "story_eye_3",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "story_eye_3.png",
				layoutMode = 1,
				zorder = 503,
				id = "story_eye_3",
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
				zorder = 255,
				visible = false,
				id = "EX_liqi",
				scale = 1.05,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.35,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 255,
				visible = false,
				id = "EX_liqi2",
				scale = 1.05,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 1,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 255,
				visible = false,
				id = "EX_liqi3",
				scale = 1.05,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.85,
						y = 0.5
					}
				}
			},
			{
				id = "previously_story",
				fileName = "Mus_Story_Intro_Chapter",
				type = "Music"
			},
			{
				id = "Mus_Story_Undead_Bird",
				fileName = "Mus_Story_Undead_Bird",
				type = "Music"
			},
			{
				id = "photograph_sound",
				fileName = "Se_Story_Shutter",
				type = "Sound"
			},
			{
				id = "hitSound_story",
				fileName = "Se_Skill_Cut_4",
				type = "Sound"
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

function scene_elitestory11_1a.actions.start_elitestory11_1a(_root, args)
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
					duration = 1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Undead_Bird"),
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
					modelId = "Model_HSheng",
					scale = 1.05,
					id = "HSheng_speak",
					rotation = 0,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.5,
							y = -1
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.8,
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
				action = "rock",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 3
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
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.5,
							y = -0.05
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_1"
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
				action = "rock",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						freq = 6,
						strength = 1
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
								color = "#FF0000",
								fadeout = 0.3,
								alpha = 1,
								duration = 0.3,
								fadein = 0.3
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_2"
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_3"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HSheng_speak"),
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
					modelId = "Model_Enemy_Story_Normal",
					id = "Monster_1_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 13,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 0.45,
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
						duration = 0.5
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory11_1a_4"
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
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -80,
							refpt = {
								x = 0.5,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						scale = 0.85,
						duration = 0.15
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
						duration = 0.15,
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
				action = "scaleTo",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						scale = 0.8,
						duration = 0.15
					}
				end
			})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "EX_liqi")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "hitSound_story")
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.45,
								y = -0.05
							}
						}
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
				action = "moveTo",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.5,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						scale = 1.1,
						duration = 0.15
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "photograph_sound")
		}),
		act({
			action = "flashScreen",
			actor = __getnode__(_root, "mask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#FFFFFF",
							fadeout = 0.5,
							alpha = 1,
							duration = 0.5,
							fadein = 0.5
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
			action = "fadeIn",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					freq = 5,
					strength = 3
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.15,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					scale = 1.05,
					duration = 0.15
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "HSheng_speak"),
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_5"
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
				action = "rock",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						freq = 6,
						strength = 1
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
								color = "#FF0000",
								fadeout = 0.3,
								alpha = 1,
								duration = 0.3,
								fadein = 0.3
							}
						}
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			actor = __getnode__(_root, "Monster_1_speak"),
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
					name = "dialog_speak_name_43",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Monster_1_speak"
					},
					content = {
						"elitestory11_1a_6"
					},
					durations = {
						0.03
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
			action = "fadeIn",
			actor = __getnode__(_root, "HSheng_speak"),
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HSheng_speak"),
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
			action = "play",
			actor = __getnode__(_root, "photograph_sound")
		}),
		act({
			action = "flashScreen",
			actor = __getnode__(_root, "mask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#FFFFFF",
							fadeout = 0.5,
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
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "Monster_1_speak"),
			args = function (_ctx)
				return {
					freq = 4,
					strength = 2
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
			action = "fadeOut",
			actor = __getnode__(_root, "Monster_1_speak"),
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
			actor = __getnode__(_root, "HSheng_speak"),
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_8"
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"elitestory11_1a_10"
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
						freq = 4,
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0.1,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.15,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.65,
							y = -0.05
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HSheng_speak"),
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
		rockScreen({
			args = function (_ctx)
				return {
					freq = 6,
					strength = 4
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 6,
					strength = 3
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 2
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 1
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
			actor = __getnode__(_root, "Monster_1_speak"),
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
					modelId = "Model_Enemy_Story_Normal",
					id = "Monster_2_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 12,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 0.75,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Monster_2_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_2_speak"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Enemy_Story_Normal",
					id = "Monster_3_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 11,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 0.2,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Monster_3_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_3_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Monster_1_speak",
						"Monster_2_speak",
						"Monster_3_speak"
					},
					content = {
						"elitestory11_1a_13"
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
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster_2_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster_3_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "HSheng_speak"),
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HSheng_speak"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_2_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_3_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
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
						duration = 0.15,
						position = {
							x = 0,
							y = -80,
							refpt = {
								x = 0.5,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						scale = 0.85,
						duration = 0.15
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
						duration = 0.15,
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
				action = "scaleTo",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						scale = 0.8,
						duration = 0.15
					}
				end
			})
		}),
		concurrent({
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
				action = "fadeOut",
				actor = __getnode__(_root, "Monster_2_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster_3_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "EX_liqi")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "hitSound_story")
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.5,
								y = -0.05
							}
						}
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
				actor = __getnode__(_root, "EX_liqi")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "hitSound_story")
			})
		}),
		concurrent({
			act({
				action = "rock",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						freq = 4,
						strength = 2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.5,
								y = -0.1
							}
						}
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
				action = "moveTo",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.5,
								y = -0.05
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "HSheng_speak"),
				args = function (_ctx)
					return {
						scale = 1.1,
						duration = 0.15
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_2_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Monster_3_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "photograph_sound")
		}),
		act({
			action = "flashScreen",
			actor = __getnode__(_root, "mask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#FFFFFF",
							fadeout = 0.5,
							alpha = 1,
							duration = 0.5,
							fadein = 0.5
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster_1_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster_2_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Monster_3_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.15,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.5,
							y = -0.05
						}
					}
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					scale = 1.05,
					duration = 0.15
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "HSheng_speak"),
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
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.75,
							y = -0.05
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"elitestory11_1a_15"
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "EX_liqi"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0.5,
						y = 0.5,
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
				actor = __getnode__(_root, "hitSound_story")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "EX_liqi")
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "EX_liqi2"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "hitSound_story")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "EX_liqi2")
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
				actor = __getnode__(_root, "hitSound_story")
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "EX_liqi3")
			})
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					freq = 5,
					strength = 3
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
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.75,
							y = -1
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "HSheng_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					height = 3,
					duration = 0.65
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "story_eye_2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "story_eye_3"),
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
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "story_eye_3"),
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_16"
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_17"
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
				actor = __getnode__(_root, "story_eye_3"),
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
						name = "dialog_speak_name_80",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"elitestory11_1a_18"
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
						freq = 4,
						strength = 4
					}
				end
			})
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
					duration = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_19"
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_20"
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_21"
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
					name = "dialog_speak_name_32",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_22"
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
			action = "flashScreen",
			actor = __getnode__(_root, "mask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#FFFFFF",
							fadeout = 1,
							alpha = 1,
							duration = 1,
							fadein = 1
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "story_eye_1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg"),
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
					modelId = "Model_FEMSi",
					id = "FEMSi_speak",
					rotationX = 0,
					scale = 1.125,
					position = {
						x = 0,
						y = -380,
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
				actor = __getnode__(_root, "FEMSi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FEMSi_speak"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "story_eye_1"),
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_23"
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"elitestory11_1a_24"
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.5,
							y = 0.501
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "FEMSi_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -380,
						refpt = {
							x = 0.5,
							y = 0.1
						}
					}
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 2
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
			actor = __getnode__(_root, "FEMSi_speak"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_26"
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"elitestory11_1a_27"
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

local function elitestory11_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_elitestory11_1a",
					scene = scene_elitestory11_1a
				}
			end
		})
	})
end

stories.elitestory11_1a = elitestory11_1a

return _M
