local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.PanStoryPoint_01_19")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_PanStoryPoint_01_19 = {
	actions = {}
}
scenes.scene_PanStoryPoint_01_19 = scene_PanStoryPoint_01_19

function scene_PanStoryPoint_01_19:stage(args)
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
						name = "bg",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_1_8.jpg",
						layoutMode = 1,
						id = "bg",
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
		},
		__actions__ = self.actions
	}
end

function scene_PanStoryPoint_01_19.actions.start_PanStoryPoint_01_19(_root, args)
	return sequential({
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_YSuo",
					id = "YSuo_speak",
					rotationX = 0,
					scale = 1.03,
					position = {
						x = 0,
						y = -635,
						refpt = {
							x = 0.65,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YSuo_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YSuo/YSuo_face_3.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = -1,
							visible = true,
							id = "YSuo_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -166,
								y = 1064
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YSuo_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YSuo_speak"),
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
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"PanStoryPoint_01_19_1"
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
						"PanStoryPoint_01_19_2",
						"PanStoryPoint_01_19_3"
					},
					actionName = {
						"start_clue_99",
						"start_clue_100"
					},
					mazeClue = {
						"BSNCT_01_C99",
						"BSNCT_01_C100"
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_19.actions.start_clue_99(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"PanStoryPoint_01_19_4"
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
						"PanStoryPoint_01_19_5"
					},
					mazeClue = {
						"BSNCT_01_C102"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"PanStoryPoint_01_19_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_PanStoryPoint_01_19b"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_19.actions.start_clue_100(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"PanStoryPoint_01_19_7"
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
						"PanStoryPoint_01_19_8"
					},
					mazeClue = {
						"BSNCT_01_C101"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"PanStoryPoint_01_19_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_PanStoryPoint_01_19b"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_19.actions.start_PanStoryPoint_01_19b(_root, args)
	return sequential({
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"PanStoryPoint_01_19_10",
						"PanStoryPoint_01_19_11",
						"PanStoryPoint_01_19_12"
					},
					actionName = {
						"start_clue_103",
						"start_clue_104",
						"start_clue_104"
					},
					mazeClue = {
						"BSNCT_01_C103",
						"BSNCT_01_C104",
						"BSNCT_01_C105"
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_19.actions.start_clue_103(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"PanStoryPoint_01_19_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_PanStoryPoint_01_19c"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_19.actions.start_clue_104(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"PanStoryPoint_01_19_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_PanStoryPoint_01_19c"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_19.actions.start_clue_105(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"PanStoryPoint_01_19_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_PanStoryPoint_01_19c"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_19.actions.start_PanStoryPoint_01_19c(_root, args)
	return sequential({
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"PanStoryPoint_01_19_16"
					},
					mazeClue = {
						"BSNCT_01_C106"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_54",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSuo_speak"
					},
					content = {
						"PanStoryPoint_01_19_17"
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

local function PanStoryPoint_01_19(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_PanStoryPoint_01_19",
					scene = scene_PanStoryPoint_01_19
				}
			end
		})
	})
end

stories.PanStoryPoint_01_19 = PanStoryPoint_01_19

return _M
