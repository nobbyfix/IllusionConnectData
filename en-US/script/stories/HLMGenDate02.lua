local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.HLMGenDate02")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_HLMGenDate02 = {
	actions = {}
}
scenes.scene_HLMGenDate02 = scene_HLMGenDate02

function scene_HLMGenDate02:stage(args)
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
				image = "bg_story_EXscene_2_1.jpg",
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
						id = "bgEX_motianlun",
						layoutMode = 1,
						type = "MovieClip",
						scale = 1,
						actionName = "anim_motianlun",
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
				fileName = "Mus_Story_Common_2",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_HLMGenDate02.actions.start_HLMGenDate02(_root, args)
	return sequential({
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "hideButton")
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "skipButton"),
			args = function (_ctx)
				return {
					date = true
				}
			end
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
			action = "play",
			actor = __getnode__(_root, "bgEX_motianlun"),
			args = function (_ctx)
				return {
					time = -1
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
					modelId = "Model_HLMGen",
					id = "HLMGen_speak",
					rotationX = 0,
					scale = 0.7,
					zorder = 2,
					position = {
						x = 275,
						y = -390,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "HLMGen_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "HLMGen/HLMGen_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "HLMGen_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -49,
								y = 1130
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 275,
						y = -390,
						refpt = {
							x = 0.25,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 275,
						y = -390,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 275,
						y = -390,
						refpt = {
							x = 0.25,
							y = 0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 275,
						y = -390,
						refpt = {
							x = 0.25,
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_2"
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
						"HLMGenDate02_3",
						"HLMGenDate02_4"
					},
					actionName = {
						"start_HLMGenDate02b",
						"start_HLMGenDate02c"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_5"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_7"
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
					name = "start_HLMGenDate02d"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_8"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_9"
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
					name = "start_HLMGenDate02d"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "HLMGen_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 275,
						y = -390,
						refpt = {
							x = 0.25,
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
					name = "dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_10"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_11"
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
						"HLMGenDate02_12",
						"HLMGenDate02_13"
					},
					actionName = {
						"start_HLMGenDate02e",
						"start_HLMGenDate02f"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_14"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_15"
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
					name = "start_HLMGenDate02g"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						scale = 1.4,
						duration = 1.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						duration = 1.2,
						position = {
							x = 800,
							y = -1020,
							refpt = {
								x = 0,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_18"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_19"
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
					name = "start_HLMGenDate02g"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_22"
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
						"HLMGenDate02_23",
						"HLMGenDate02_24"
					},
					actionName = {
						"start_HLMGenDate02h",
						"start_HLMGenDate02i"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02h(_root, args)
	return sequential({
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 1.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						duration = 1.2,
						position = {
							x = 275,
							y = -390,
							refpt = {
								x = 0.25,
								y = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_26"
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
					name = "start_HLMGenDate02j"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 1.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "HLMGen_speak"),
				args = function (_ctx)
					return {
						duration = 1.2,
						position = {
							x = 275,
							y = -390,
							refpt = {
								x = 0.25,
								y = 0
							}
						}
					}
				end
			})
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_HLMGenDate02j"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_32"
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
						"HLMGenDate02_33",
						"HLMGenDate02_34"
					},
					actionName = {
						"start_HLMGenDate02k",
						"start_HLMGenDate02l"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_37"
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
					name = "start_HLMGenDate02m"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_39"
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
					name = "start_HLMGenDate02m"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_41"
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
						"HLMGenDate02_42",
						"HLMGenDate02_43"
					},
					actionName = {
						"start_HLMGenDate02n",
						"start_HLMGenDate02o"
					}
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_44"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_45"
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
					name = "start_HLMGenDate02p"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_46"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_47"
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
					name = "start_HLMGenDate02p"
				}
			end
		})
	})
end

function scene_HLMGenDate02.actions.start_HLMGenDate02p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_48"
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
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "HLMGen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "HLMGen/HLMGen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_254",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"HLMGen_speak"
					},
					content = {
						"HLMGenDate02_50"
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

local function HLMGenDate02(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_HLMGenDate02",
					scene = scene_HLMGenDate02
				}
			end
		})
	})
end

stories.HLMGenDate02 = HLMGenDate02

return _M
