local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.PanStoryPoint_01_17")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_PanStoryPoint_01_17 = {
	actions = {}
}
scenes.scene_PanStoryPoint_01_17 = scene_PanStoryPoint_01_17

function scene_PanStoryPoint_01_17:stage(args)
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
						image = "bg_story_scene_1_4.jpg",
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

function scene_PanStoryPoint_01_17.actions.start_PanStoryPoint_01_17(_root, args)
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
					modelId = "Model_WEDe",
					id = "WEDe_speak",
					rotationX = 0,
					scale = 1.225,
					position = {
						x = 0,
						y = -460,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "WEDe_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "WEDe_speak"),
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
					name = "dialog_speak_name_82",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe_speak"
					},
					content = {
						"PanStoryPoint_01_17_1"
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
						"PanStoryPoint_01_17_2",
						"PanStoryPoint_01_17_3"
					},
					actionName = {
						"start_clue_84",
						"start_clue_85"
					},
					mazeClue = {
						"BSNCT_01_C84",
						"BSNCT_01_C85"
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_17.actions.start_clue_84(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_82",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe_speak"
					},
					content = {
						"PanStoryPoint_01_17_4"
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
					name = "start_PanStoryPoint_01_17b"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_17.actions.start_clue_85(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_82",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe_speak"
					},
					content = {
						"PanStoryPoint_01_17_5"
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
					name = "start_PanStoryPoint_01_17b"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_17.actions.start_PanStoryPoint_01_17b(_root, args)
	return sequential({
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"PanStoryPoint_01_17_6",
						"PanStoryPoint_01_17_7"
					},
					actionName = {
						"start_clue_86",
						"start_clue_87"
					},
					mazeClue = {
						"BSNCT_01_C86",
						"BSNCT_01_C87"
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_17.actions.start_clue_86(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_82",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe_speak"
					},
					content = {
						"PanStoryPoint_01_17_8"
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
					name = "start_PanStoryPoint_01_17c"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_17.actions.start_clue_87(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_82",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe_speak"
					},
					content = {
						"PanStoryPoint_01_17_9"
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
					name = "start_PanStoryPoint_01_17c"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_17.actions.start_PanStoryPoint_01_17c(_root, args)
	return sequential({
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"PanStoryPoint_01_17_10"
					},
					mazeClue = {
						"BSNCT_01_C88"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_82",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe_speak"
					},
					content = {
						"PanStoryPoint_01_17_11"
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
						"PanStoryPoint_01_17_12"
					},
					mazeClue = {
						"BSNCT_01_C89"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_82",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WEDe_speak"
					},
					content = {
						"PanStoryPoint_01_17_13"
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
						"PanStoryPoint_01_17_14"
					},
					mazeClue = {
						"BSNCT_01_C90"
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "WEDe_speak"),
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
					name = "dialog_speak_name_28",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FEMSi_speak"
					},
					content = {
						"PanStoryPoint_01_17_15"
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

local function PanStoryPoint_01_17(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_PanStoryPoint_01_17",
					scene = scene_PanStoryPoint_01_17
				}
			end
		})
	})
end

stories.PanStoryPoint_01_17 = PanStoryPoint_01_17

return _M
