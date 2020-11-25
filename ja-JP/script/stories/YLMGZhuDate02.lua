local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.YLMGZhuDate02")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_YLMGZhuDate02 = {
	actions = {}
}
scenes.scene_YLMGZhuDate02 = scene_YLMGZhuDate02

function scene_YLMGZhuDate02:stage(args)
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
				image = "bg_story_EXscene_1_4.jpg",
				layoutMode = 1,
				zorder = 2,
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
						id = "bgEx_xuzhangmengyan",
						layoutMode = 1,
						type = "MovieClip",
						scale = 1,
						actionName = "mengyan_xuzhangmengyan",
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

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_xuzhangmengyan"),
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
					modelId = "Model_YLMGZhu",
					id = "YLMGZhu_speak",
					rotationX = 0,
					scale = 1.205,
					zorder = 3,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YLMGZhu_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YLMGZhu/YLMGZhu_face_2.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YLMGZhu_face",
							anchorPoint = {
								x = 0.7,
								y = 0.1
							},
							position = {
								x = 88,
								y = 663
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YLMGZhu_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YLMGZhu_speak"),
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_1"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_3"
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
						"YLMGZhuDate02_4",
						"YLMGZhuDate02_5"
					},
					actionName = {
						"start_YLMGZhuDate02b",
						"start_YLMGZhuDate02c"
					}
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_6"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_7"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_8"
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
					name = "start_YLMGZhuDate02d"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_9"
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
					name = "start_YLMGZhuDate02d"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_10"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_12"
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
						"YLMGZhuDate02_13",
						"YLMGZhuDate02_14"
					},
					actionName = {
						"start_YLMGZhuDate02e",
						"start_YLMGZhuDate02f"
					}
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_15"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_16"
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
					name = "start_YLMGZhuDate02g"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_18"
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
					name = "start_YLMGZhuDate02g"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_19"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_20"
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
						"YLMGZhuDate02_21",
						"YLMGZhuDate02_22"
					},
					actionName = {
						"start_YLMGZhuDate02h",
						"start_YLMGZhuDate02i"
					}
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_24"
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
					name = "start_YLMGZhuDate02j"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_25"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_27"
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
					name = "start_YLMGZhuDate02j"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_28"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_30"
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
						"YLMGZhuDate02_31",
						"YLMGZhuDate02_32"
					},
					actionName = {
						"start_YLMGZhuDate02k",
						"start_YLMGZhuDate02l"
					}
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_33"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_34"
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
					name = "start_YLMGZhuDate02m"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_36"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_37"
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
					name = "start_YLMGZhuDate02m"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_39"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_40"
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
						"YLMGZhuDate02_41",
						"YLMGZhuDate02_42"
					},
					actionName = {
						"start_YLMGZhuDate02n",
						"start_YLMGZhuDate02o"
					}
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_43"
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
					name = "start_YLMGZhuDate02p"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_44"
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_45"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_46"
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
					name = "start_YLMGZhuDate02p"
				}
			end
		})
	})
end

function scene_YLMGZhuDate02.actions.start_YLMGZhuDate02p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_48"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu/YLMGZhu_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_speak"
					},
					content = {
						"YLMGZhuDate02_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YLMGZhu_speak"),
			args = function (_ctx)
				return {
					duration = 1.5,
					position = {
						x = 0,
						y = -465,
						refpt = {
							x = -0.5,
							y = 0
						}
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

local function YLMGZhuDate02(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_YLMGZhuDate02",
					scene = scene_YLMGZhuDate02
				}
			end
		})
	})
end

stories.YLMGZhuDate02 = YLMGZhuDate02

return _M
