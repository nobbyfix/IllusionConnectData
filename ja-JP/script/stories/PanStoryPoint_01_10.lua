local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.PanStoryPoint_01_10")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_PanStoryPoint_01_10 = {
	actions = {}
}
scenes.scene_PanStoryPoint_01_10 = scene_PanStoryPoint_01_10

function scene_PanStoryPoint_01_10:stage(args)
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
						image = "bg_story_EXscene_5_1.jpg",
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
						},
						children = {
							{
								layoutMode = 1,
								type = "MovieClip",
								zorder = 2,
								visible = true,
								id = "bgEx_bennengsiqihuoqian",
								scale = 1,
								actionName = "all_bennengsiqihuoqian",
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
				id = "TV_flash",
				layoutMode = 1,
				visible = false,
				type = "MessageNode",
				scale = 0.85,
				zorder = 10000,
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.6
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_PanStoryPoint_01_10.actions.start_PanStoryPoint_01_10(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_bennengsiqihuoqian"),
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
					duration = 1.5
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"PanStoryPoint_01_10_1"
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_YFZZhu",
					id = "YFZZhu_speak",
					rotationX = 0,
					scale = 1.05,
					position = {
						x = 0,
						y = -255,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YFZZhu_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YFZZhu/YFZZhu_face_4.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YFZZhu_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -39.5,
								y = 624
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YFZZhu_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YFZZhu_speak"),
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_2"
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
						"PanStoryPoint_01_10_3"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_4"
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
						"PanStoryPoint_01_10_5",
						"PanStoryPoint_01_10_6"
					},
					actionName = {
						"start_clue_50",
						"start_clue_51"
					},
					mazeClue = {
						"BSNCT_01_C50",
						"BSNCT_01_C51"
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_10.actions.start_clue_50(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_7"
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
					name = "start_PanStoryPoint_01_10b"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_10.actions.start_clue_51(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_8"
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
					name = "start_PanStoryPoint_01_10b"
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_10.actions.start_PanStoryPoint_01_10b(_root, args)
	return sequential({
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"PanStoryPoint_01_10_9",
						"PanStoryPoint_01_10_10"
					},
					actionName = {
						"start_clue_52",
						"start_clue_53"
					},
					mazeClue = {
						"BSNCT_01_C52",
						"BSNCT_01_C53"
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_10.actions.start_clue_52(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_11"
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
						"PanStoryPoint_01_10_12"
					},
					actionName = {
						"start_PanStoryPoint_01_10c"
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_10.actions.start_clue_53(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_13"
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
						"PanStoryPoint_01_10_14"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_15"
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
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_16"
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
						"PanStoryPoint_01_10_17"
					},
					actionName = {
						"start_PanStoryPoint_01_10c"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_18"
					},
					durations = {
						0.03
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_10.actions.start_PanStoryPoint_01_10c(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_19"
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
						"PanStoryPoint_01_10_20"
					},
					mazeClue = {
						"BSNCT_01_C49"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_81",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YFZZhu_speak"
					},
					content = {
						"PanStoryPoint_01_10_21"
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

local function PanStoryPoint_01_10(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_PanStoryPoint_01_10",
					scene = scene_PanStoryPoint_01_10
				}
			end
		})
	})
end

stories.PanStoryPoint_01_10 = PanStoryPoint_01_10

return _M
