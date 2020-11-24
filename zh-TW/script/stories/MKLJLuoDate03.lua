local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.MKLJLuoDate03")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_MKLJLuoDate03 = {
	actions = {}
}
scenes.scene_MKLJLuoDate03 = scene_MKLJLuoDate03

function scene_MKLJLuoDate03:stage(args)
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

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03(_root, args)
	return sequential({
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
					modelId = "Model_MKLJLuo",
					id = "MKLJLuo_speak",
					rotationX = 0,
					scale = 0.875,
					zorder = 2,
					position = {
						x = 0,
						y = -210,
						refpt = {
							x = 0.6,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "MKLJLuo_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "MKLJLuo/MKLJLuo_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "MKLJLuo_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 0,
								y = 690.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MKLJLuo_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MKLJLuo_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_1"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_2"
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
						"MKLJLuoDate03_3",
						"MKLJLuoDate03_4"
					},
					actionName = {
						"start_MKLJLuoDate03b",
						"start_MKLJLuoDate03c"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_5"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_6"
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
					name = "start_MKLJLuoDate03d"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_7"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_8"
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
					name = "start_MKLJLuoDate03d"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_9"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_10"
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
						"MKLJLuoDate03_11",
						"MKLJLuoDate03_12"
					},
					actionName = {
						"start_MKLJLuoDate03e",
						"start_MKLJLuoDate03f"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_13"
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
					name = "start_MKLJLuoDate03g"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_15"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_16"
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
					name = "start_MKLJLuoDate03g"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_18"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_19"
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
						"MKLJLuoDate03_20",
						"MKLJLuoDate03_21"
					},
					actionName = {
						"start_MKLJLuoDate03h",
						"start_MKLJLuoDate03i"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_23"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_24"
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
					name = "start_MKLJLuoDate03j"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_26"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_27"
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
					name = "start_MKLJLuoDate03j"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_28"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_30"
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
						"MKLJLuoDate03_31",
						"MKLJLuoDate03_32"
					},
					actionName = {
						"start_MKLJLuoDate03k",
						"start_MKLJLuoDate03l"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_33"
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
					name = "start_MKLJLuoDate03m"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_36"
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
					name = "start_MKLJLuoDate03m"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_37"
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
					name = "dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_6.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_38"
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
					name = "dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_6.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MKLJLuo_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "MKLJLuo_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
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
						"MKLJLuoDate03_40",
						"MKLJLuoDate03_41"
					},
					actionName = {
						"start_MKLJLuoDate03n",
						"start_MKLJLuoDate03o"
					}
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_42"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_43"
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
					name = "start_MKLJLuoDate03p"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MKLJLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MKLJLuo/MKLJLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_45"
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
					name = "start_MKLJLuoDate03p"
				}
			end
		})
	})
end

function scene_MKLJLuoDate03.actions.start_MKLJLuoDate03p(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_46"
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
					name = "dialog_speak_name_114",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MKLJLuo_speak"
					},
					content = {
						"MKLJLuoDate03_47"
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

local function MKLJLuoDate03(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_MKLJLuoDate03",
					scene = scene_MKLJLuoDate03
				}
			end
		})
	})
end

stories.MKLJLuoDate03 = MKLJLuoDate03

return _M
