local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.ALPoDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_ALPoDate01 = {
	actions = {}
}
scenes.scene_ALPoDate01 = scene_ALPoDate01

function scene_ALPoDate01:stage(args)
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
				image = "bg_story_EXscene_0_2.jpg",
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
						zorder = 3,
						visible = true,
						id = "bgEx_wnsxjsnOne",
						scale = 1,
						actionName = "all_wnsxjsnOne",
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
				id = "date_music",
				fileName = "Mus_Story_London",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_ALPoDate01.actions.start_ALPoDate01(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_wnsxjsnOne"),
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
			actor = __getnode__(_root, "date_music"),
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
					modelId = "Model_ALPo",
					id = "ALPo_speak",
					rotationX = 0,
					scale = 1.03,
					zorder = 11,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ALPo_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ALPo/ALPo_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ALPo_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -1.5,
								y = 781
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALPo_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALPo_speak"),
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_1"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_2"
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
						"ALPoDate01_3",
						"ALPoDate01_4"
					},
					actionName = {
						"start_ALPoDate01b",
						"start_ALPoDate01c"
					}
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_5"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_6"
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
					name = "start_ALPoDate01d"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01c(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_9"
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
					name = "start_ALPoDate01d"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_10"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_11"
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
						"ALPoDate01_12",
						"ALPoDate01_13"
					},
					actionName = {
						"start_ALPoDate01e",
						"start_ALPoDate01f"
					}
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01e(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_15"
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
					name = "start_ALPoDate01g"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_17"
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
					name = "start_ALPoDate01g"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_18"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_19"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_20"
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
						"ALPoDate01_21",
						"ALPoDate01_22"
					},
					actionName = {
						"start_ALPoDate01h",
						"start_ALPoDate01i"
					}
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_24"
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
					name = "start_ALPoDate01j"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_26"
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
					name = "start_ALPoDate01j"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_27"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ALPo_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.55,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ALPo_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
			action = "moveTo",
			actor = __getnode__(_root, "ALPo_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.55,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ALPo_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ALPo_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.55,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ALPo_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
			action = "moveTo",
			actor = __getnode__(_root, "ALPo_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.55,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ALPo_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_29"
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
						"ALPoDate01_30",
						"ALPoDate01_31"
					},
					actionName = {
						"start_ALPoDate01k",
						"start_ALPoDate01l"
					}
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_32"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_33"
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
					name = "start_ALPoDate01m"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_35"
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
					name = "start_ALPoDate01m"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_37"
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
						"ALPoDate01_38",
						"ALPoDate01_39"
					},
					actionName = {
						"start_ALPoDate01o",
						"start_ALPoDate01p"
					}
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_40"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_41"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_42"
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
					name = "start_ALPoDate01q"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_45"
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
					name = "start_ALPoDate01q"
				}
			end
		})
	})
end

function scene_ALPoDate01.actions.start_ALPoDate01q(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_46"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo/ALPo_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_speak"
					},
					content = {
						"ALPoDate01_47"
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

local function ALPoDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_ALPoDate01",
					scene = scene_ALPoDate01
				}
			end
		})
	})
end

stories.ALPoDate01 = ALPoDate01

return _M
