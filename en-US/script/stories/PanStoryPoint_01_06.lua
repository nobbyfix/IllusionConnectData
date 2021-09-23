local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.PanStoryPoint_01_06")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_PanStoryPoint_01_06 = {
	actions = {}
}
scenes.scene_PanStoryPoint_01_06 = scene_PanStoryPoint_01_06

function scene_PanStoryPoint_01_06:stage(args)
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
						image = "bg_story_EXscene_6_1.jpg",
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
						},
						children = {
							{
								id = "bgEX_businiaoyanhui",
								layoutMode = 1,
								type = "MovieClip",
								scale = 1,
								actionName = "anim_businiaoyanhui",
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
			}
		},
		__actions__ = self.actions
	}
end

function scene_PanStoryPoint_01_06.actions.start_PanStoryPoint_01_06(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEX_businiaoyanhui"),
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_HSheng",
					scale = 0.75,
					id = "HSheng_speak",
					rotation = 0,
					position = {
						x = 0,
						y = -260,
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
					name = "dialog_speak_name_80",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HSheng_speak"
					},
					content = {
						"PanStoryPoint_01_06_1"
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
						"PanStoryPoint_01_06_2"
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
						"PanStoryPoint_01_06_3"
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
						"PanStoryPoint_01_06_4",
						"PanStoryPoint_01_06_5"
					},
					actionName = {
						"start_clue_25",
						"start_clue_26"
					},
					mazeClue = {
						"BSNCT_01_C25",
						"BSNCT_01_C26"
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_06.actions.start_clue_25(_root, args)
	return sequential({
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
						"PanStoryPoint_01_06_6"
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
						"PanStoryPoint_01_06_7"
					},
					actionName = {
						"start_PanStoryPoint_01_06b"
					}
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_06.actions.start_clue_26(_root, args)
	return sequential({
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
					modelId = "Model_SDTZi",
					id = "SDTZi_speak",
					rotationX = 0,
					scale = 0.75,
					position = {
						x = 0,
						y = -375,
						refpt = {
							x = 0.6,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SDTZi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SDTZi/SDTZi_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SDTZi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -112,
								y = 1026
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SDTZi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SDTZi_speak"),
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
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak"
					},
					content = {
						"PanStoryPoint_01_06_8"
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
						"PanStoryPoint_01_06_9"
					},
					actionName = {
						"start_PanStoryPoint_01_06b"
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SDTZi_speak"),
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
		})
	})
end

function scene_PanStoryPoint_01_06.actions.start_PanStoryPoint_01_06b(_root, args)
	return sequential({
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
						"PanStoryPoint_01_06_10"
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
						"PanStoryPoint_01_06_11"
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
					modelId = "Model_SDTZi",
					id = "SDTZi_speak",
					rotationX = 0,
					scale = 0.75,
					position = {
						x = 0,
						y = -375,
						refpt = {
							x = 0.6,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "SDTZi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "SDTZi/SDTZi_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "SDTZi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -112,
								y = 1026
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SDTZi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SDTZi_speak"),
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
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak"
					},
					content = {
						"PanStoryPoint_01_06_12"
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
						"PanStoryPoint_01_06_13"
					},
					mazeClue = {
						"BSNCT_01_C27"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak"
					},
					content = {
						"PanStoryPoint_01_06_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SDTZi_speak"),
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"PanStoryPoint_01_06_15"
					},
					mazeClue = {
						"BSNCT_01_C28"
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
						"PanStoryPoint_01_06_16"
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
						"PanStoryPoint_01_06_17",
						"PanStoryPoint_01_06_18"
					},
					actionName = {
						"start_clue_29",
						"start_clue_30"
					},
					mazeClue = {
						"BSNCT_01_C29",
						"BSNCT_01_C30"
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
			action = "fadeIn",
			actor = __getnode__(_root, "SDTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		})
	})
end

function scene_PanStoryPoint_01_06.actions.start_clue_29(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak"
					},
					content = {
						"PanStoryPoint_01_06_19"
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

function scene_PanStoryPoint_01_06.actions.start_clue_30(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_35",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi_speak"
					},
					content = {
						"PanStoryPoint_01_06_20"
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

local function PanStoryPoint_01_06(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_PanStoryPoint_01_06",
					scene = scene_PanStoryPoint_01_06
				}
			end
		})
	})
end

stories.PanStoryPoint_01_06 = PanStoryPoint_01_06

return _M
