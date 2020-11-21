local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.elitestory08_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_elitestory08_1a = {
	actions = {}
}
scenes.scene_elitestory08_1a = scene_elitestory08_1a

function scene_elitestory08_1a:stage(args)
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
						image = "bg_story_cg_09_1.jpg",
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
					},
					{
						resType = 0,
						name = "bg1",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_08_3.jpg",
						layoutMode = 1,
						zorder = 1,
						id = "bg1",
						scale = 1.15,
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
				name = "Originallens_item",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "Originallens01.png",
				layoutMode = 1,
				zorder = 100,
				id = "Originallens_item",
				scale = 0.5,
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
				id = "previously_story",
				fileName = "Mus_Story_Intro_Chapter",
				type = "Music"
			},
			{
				id = "Mus_Story_Yehuo_Determine",
				fileName = "Mus_Story_Yehuo_Determine",
				type = "Music"
			},
			{
				id = "flashMask",
				type = "FlashMask"
			}
		},
		__actions__ = self.actions
	}
end

function scene_elitestory08_1a.actions.start_elitestory08_1a(_root, args)
	return sequential({
		act({
			action = "play",
			actor = __getnode__(_root, "previously_story"),
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
			action = "activateNode",
			actor = __getnode__(_root, "hm")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "Originallens_item"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "repeatUpDownStart",
			actor = __getnode__(_root, "Originallens_item"),
			args = function (_ctx)
				return {
					height = 3,
					duration = 0.65
				}
			end
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
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
					heightSpace = 12,
					content = {
						"elitestory08_1a_1",
						"elitestory08_1a_2",
						"elitestory08_1a_3"
					},
					durations = {
						0.06,
						0.06,
						0.06
					},
					waitTimes = {
						1,
						1,
						2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Originallens_item"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						duration = 1
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
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Yehuo_Determine"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 2.5,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.5,
							y = 0.51
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						scale = 1.505,
						duration = 3.5
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
							"elitestory08_1a_4"
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
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					center = 1,
					bgShow = false,
					heightSpace = 32,
					content = {
						"elitestory08_1a_5",
						"elitestory08_1a_6",
						"elitestory08_1a_7"
					},
					durations = {
						0.06,
						0.06,
						0.06
					},
					waitTimes = {
						0.5,
						0.5,
						2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					scale = 2,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.1,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
						"elitestory08_1a_8"
					},
					durations = {
						0.03
					}
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
						"elitestory08_1a_9",
						"elitestory08_1a_10"
					},
					durations = {
						0.06,
						0.06
					},
					waitTimes = {
						0.5,
						2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					scale = 2,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.8,
							y = 0.6
						}
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
						"elitestory08_1a_11"
					},
					durations = {
						0.03
					}
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
						"elitestory08_1a_12"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
						"elitestory08_1a_13"
					},
					durations = {
						0.03
					}
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
						"elitestory08_1a_14"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					scale = 1.5,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bg"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0.5,
						y = 0.5,
						refpt = {
							x = 0.5,
							y = 0.8
						}
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
						"elitestory08_1a_15"
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
						"elitestory08_1a_16"
					},
					durations = {
						0.03
					}
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
						"elitestory08_1a_17"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
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
						"elitestory08_1a_18"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
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
						"elitestory08_1a_19"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
						"elitestory08_1a_20"
					},
					durations = {
						0.03
					}
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
						"elitestory08_1a_21"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						scale = 1,
						duration = 0.7
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						duration = 0.7,
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
						"elitestory08_1a_22"
					},
					durations = {
						0.03
					}
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
						"elitestory08_1a_23"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
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
						"elitestory08_1a_24"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
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
						"elitestory08_1a_25"
					},
					durations = {
						0.06
					},
					waitTimes = {
						2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
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
						"elitestory08_1a_26"
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
					freq = 5,
					strength = 3
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 5,
					strength = 4
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 6,
					strength = 5
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 6,
					strength = 6
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						scale = 1.1,
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						scale = 1.14,
						duration = 2.5
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_188",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"elitestory08_1a_27"
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
				action = "scaleTo",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						scale = 1.13,
						duration = 2.5
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_188",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"elitestory08_1a_28"
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
				action = "scaleTo",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						scale = 1.12,
						duration = 2.5
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_188",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"elitestory08_1a_29"
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
				action = "scaleTo",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						scale = 0.45,
						duration = 0.8
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_188",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"elitestory08_1a_30"
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_188",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							""
						},
						content = {
							"elitestory08_1a_31"
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
						strength = 3
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
					freq = 6,
					strength = 3
				}
			end
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
					strength = 5
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 6,
					strength = 6
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg1"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
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

local function elitestory08_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_elitestory08_1a",
					scene = scene_elitestory08_1a
				}
			end
		})
	})
end

stories.elitestory08_1a = elitestory08_1a

return _M
