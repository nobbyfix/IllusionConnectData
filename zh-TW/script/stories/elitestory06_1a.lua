local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.elitestory06_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_elitestory06_1a = {
	actions = {}
}
scenes.scene_elitestory06_1a = scene_elitestory06_1a

function scene_elitestory06_1a:stage(args)
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
						image = "bg_story_scene_1_8.jpg",
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
					},
					{
						resType = 0,
						name = "cg",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_07_1.jpg",
						layoutMode = 1,
						zorder = 20,
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
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 2,
				videoName = "story_huiyi",
				id = "story_huiyi",
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
				additive = 1,
				zorder = 222,
				videoName = "story_juqi",
				id = "story_juqi",
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
				id = "startingSound_story",
				fileName = "Se_Story_Chapter",
				type = "Sound"
			},
			{
				id = "backGround_main",
				fileName = "Mus_Story_London",
				type = "Music"
			},
			{
				id = "previously_story",
				fileName = "Mus_Story_Intro_Chapter",
				type = "Music"
			},
			{
				id = "Mus_Story_Suspense",
				fileName = "Mus_Story_Suspense",
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

function scene_elitestory06_1a.actions.start_elitestory06_1a(_root, args)
	return sequential({
		act({
			action = "stop",
			actor = __getnode__(_root, "backGround_main")
		}),
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
					duration = 2
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
						"elitestory06_1a_1",
						"elitestory06_1a_2",
						"elitestory06_1a_3",
						"elitestory06_1a_4",
						"elitestory06_1a_5",
						"elitestory06_1a_6"
					},
					durations = {
						0.06,
						0.06,
						0.06,
						0.06,
						0.06,
						0.06
					},
					waitTimes = {
						0.5,
						0.5,
						0.5,
						0.5,
						0.5,
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
				actor = __getnode__(_root, "cg"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "story_huiyi"),
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
			actor = __getnode__(_root, "Mus_Story_Suspense"),
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_17"
					},
					content = {
						"elitestory06_1a_7"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_17"
					},
					content = {
						"elitestory06_1a_8"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_17"
					},
					content = {
						"elitestory06_1a_9"
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
							fadeout = 0.2,
							alpha = 1,
							duration = 0.5,
							fadein = 0.2
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"dialog_speak_name_17"
					},
					content = {
						"elitestory06_1a_10"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "cg"),
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
			action = "hide",
			actor = __getnode__(_root, "story_huiyi")
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_KTSJKe",
					id = "KTSJKe_speak",
					rotationX = 0,
					scale = 1.035,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "KTSJKe_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "KTSJKe/KTSJKe_face_5.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "KTSJKe_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -54.5,
								y = 988.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "KTSJKe_speak"),
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"elitestory06_1a_11"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"elitestory06_1a_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak"),
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
					modelId = "Model_MGNa",
					id = "MGNa_speak",
					rotationX = 0,
					scale = 1.115,
					position = {
						x = 0,
						y = -375,
						refpt = {
							x = 0.65,
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
								x = -214,
								y = 748.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MGNa_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MGNa_speak"),
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
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"elitestory06_1a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MGNa_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "KTSJKe_speak"),
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"elitestory06_1a_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "MGNa_speak"),
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
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"elitestory06_1a_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MGNa_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "KTSJKe_speak"),
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"elitestory06_1a_16"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"elitestory06_1a_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "MGNa_speak"),
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
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"elitestory06_1a_18"
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
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"elitestory06_1a_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MGNa_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "KTSJKe_speak"),
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"elitestory06_1a_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "MGNa_speak"),
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
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"elitestory06_1a_21"
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
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"elitestory06_1a_22"
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
			actor = __getnode__(_root, "story_juqi"),
			args = function (_ctx)
				return {
					time = -1,
					additive = 1
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
				action = "flashScreen",
				actor = __getnode__(_root, "flashMask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FFFFFF",
								fadeout = 0.3,
								alpha = 1,
								duration = 0.1,
								fadein = 0.3
							}
						}
					}
				end
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "story_juqi")
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

local function elitestory06_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_elitestory06_1a",
					scene = scene_elitestory06_1a
				}
			end
		})
	})
end

stories.elitestory06_1a = elitestory06_1a

return _M
