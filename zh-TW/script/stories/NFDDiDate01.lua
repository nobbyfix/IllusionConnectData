local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.NFDDiDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_NFDDiDate01 = {
	actions = {}
}
scenes.scene_NFDDiDate01 = scene_NFDDiDate01

function scene_NFDDiDate01:stage(args)
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
				name = "bg3",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_EXscene_0_1.jpg",
				layoutMode = 1,
				zorder = 1,
				id = "bg3",
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
						id = "bgEx_jiedao",
						scale = 1,
						actionName = "all_jiedao",
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

function scene_NFDDiDate01.actions.start_NFDDiDate01(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg3")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_jiedao"),
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
					modelId = "Model_NFDDi",
					id = "NFDDi_speak",
					rotationX = 0,
					scale = 1.205,
					zorder = 2,
					position = {
						x = 0,
						y = -465,
						refpt = {
							x = 0.45,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "NFDDi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "NFDDi/NFDDi_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 11,
							visible = true,
							id = "NFDDi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -18,
								y = 747.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "NFDDi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "NFDDi_speak"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_1"
					},
					durations = {
						0.03
					}
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
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_3"
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
						"NFDDiDate01_4",
						"NFDDiDate01_5"
					},
					actionName = {
						"start_NFDDiDate01b",
						"start_NFDDiDate01c"
					}
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_6"
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
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_8"
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
					name = "start_NFDDiDate01d"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_10"
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
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_11"
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
					name = "start_NFDDiDate01d"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_13"
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
						"NFDDiDate01_14",
						"NFDDiDate01_15"
					},
					actionName = {
						"start_NFDDiDate01e",
						"start_NFDDiDate01f"
					}
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_17"
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
					name = "start_NFDDiDate01g"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_19"
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
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_20"
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
					name = "start_NFDDiDate01g"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_21"
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
						"NFDDiDate01_22",
						"NFDDiDate01_23"
					},
					actionName = {
						"start_NFDDiDate01h",
						"start_NFDDiDate01i"
					}
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_24"
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
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_25"
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
					name = "start_NFDDiDate01j"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_27"
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
					name = "start_NFDDiDate01j"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_28"
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
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_30"
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
						"NFDDiDate01_31",
						"NFDDiDate01_32"
					},
					actionName = {
						"start_NFDDiDate01k",
						"start_NFDDiDate01l"
					}
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_33"
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
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_35"
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
					name = "start_NFDDiDate01m"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_37"
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
					name = "start_NFDDiDate01m"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01m(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_39"
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
						"NFDDiDate01_40",
						"NFDDiDate01_41"
					},
					actionName = {
						"start_NFDDiDate01n",
						"start_NFDDiDate01o"
					}
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_42"
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
					name = "start_NFDDiDate01p"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_45"
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
					name = "start_NFDDiDate01p"
				}
			end
		})
	})
end

function scene_NFDDiDate01.actions.start_NFDDiDate01p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_46"
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
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "NFDDi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "NFDDi/NFDDi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_62",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"NFDDi_speak"
					},
					content = {
						"NFDDiDate01_48"
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

local function NFDDiDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_NFDDiDate01",
					scene = scene_NFDDiDate01
				}
			end
		})
	})
end

stories.NFDDiDate01 = NFDDiDate01

return _M
