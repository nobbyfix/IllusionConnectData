local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.LCYShiDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_LCYShiDate01 = {
	actions = {}
}
scenes.scene_LCYShiDate01 = scene_LCYShiDate01

function scene_LCYShiDate01:stage(args)
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
				}
			},
			{
				id = "Mus_Date",
				fileName = "Mus_Story_Playground",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_LCYShiDate01.actions.start_LCYShiDate01(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Date"),
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
						modelId = "Model_LCYShi",
						id = "LCYShi_speak",
						rotationX = 0,
						scale = 1.155,
						zorder = 3,
						position = {
							x = 0,
							y = -350,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "LCYShi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "LCYShi/LCYShi_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "LCYShi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 44.4,
									y = 744.2
								}
							}
						}
					}
				end
			}),
			concurrent({
				act({
					action = "updateNode",
					actor = __getnode__(_root, "LCYShi_speak"),
					args = function (_ctx)
						return {
							opacity = 0
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "LCYShi_speak"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				})
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_1"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_2"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_3"
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
					date = true,
					content = {
						"LCYShiDate01_4",
						"LCYShiDate01_5"
					},
					actionName = {
						"start_LCYShiDate01a",
						"start_LCYShiDate01b"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01a(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_6"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_7"
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
					name = "start_LCYShiDate01c"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_9"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_10"
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
					name = "start_LCYShiDate01c"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "LCYShi_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LCYShi_speak"
						},
						content = {
							"LCYShiDate01_13"
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
					date = true,
					content = {
						"LCYShiDate01_14",
						"LCYShiDate01_15"
					},
					actionName = {
						"start_LCYShiDate01d",
						"start_LCYShiDate01e"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_16"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_17"
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
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_18"
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
					name = "start_LCYShiDate01f"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_19"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_20"
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
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_21"
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
					name = "start_LCYShiDate01f"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01f(_root, args)
	return sequential({
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					date = true,
					content = {
						"LCYShiDate01_22",
						"LCYShiDate01_23"
					},
					actionName = {
						"start_LCYShiDate01g",
						"start_LCYShiDate01h"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_24"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_25"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_26"
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
					name = "start_LCYShiDate01i"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_27"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_28"
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
					name = "start_LCYShiDate01i"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01i(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_29"
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
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_30"
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
					date = true,
					content = {
						"LCYShiDate01_31",
						"LCYShiDate01_32"
					},
					actionName = {
						"start_LCYShiDate01p",
						"start_LCYShiDate01q"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01p(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_33"
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
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_34"
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
					name = "start_LCYShiDate01j"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01q(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "LCYShi_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"LCYShi_speak"
						},
						content = {
							"LCYShiDate01_36"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_LCYShiDate01j"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01j(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_37"
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
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_39"
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
					name = "LCYShi_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"LCYShiDate01_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_41"
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
					name = "start_LCYShiDate01l"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01l(_root, args)
	return sequential({
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					date = true,
					content = {
						"LCYShiDate01_42",
						"LCYShiDate01_43"
					},
					actionName = {
						"start_LCYShiDate01m",
						"start_LCYShiDate01n"
					}
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_44"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_45"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_46"
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
					name = "start_LCYShiDate01o"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_48"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_50"
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
					name = "start_LCYShiDate01o"
				}
			end
		})
	})
end

function scene_LCYShiDate01.actions.start_LCYShiDate01o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_51"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_52"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LCYShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LCYShi/LCYShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_53"
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
					name = "LCYShi_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LCYShi_speak"
					},
					content = {
						"LCYShiDate01_54"
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

local function LCYShiDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_LCYShiDate01",
					scene = scene_LCYShiDate01
				}
			end
		})
	})
end

stories.LCYShiDate01 = LCYShiDate01

return _M
