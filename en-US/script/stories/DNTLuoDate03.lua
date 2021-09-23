local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.DNTLuoDate03")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_DNTLuoDate03 = {
	actions = {}
}
scenes.scene_DNTLuoDate03 = scene_DNTLuoDate03

function scene_DNTLuoDate03:stage(args)
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
						zorder = 3,
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

function scene_DNTLuoDate03.actions.start_DNTLuoDate03(_root, args)
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
					modelId = "Model_DNTLuo",
					id = "DNTLuo_speak",
					rotationX = 0,
					scale = 0.7,
					zorder = 3,
					position = {
						x = 0,
						y = -215,
						refpt = {
							x = 0.55,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "DNTLuo_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "DNTLuo/DNTLuo_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "DNTLuo_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 13.5,
								y = 802
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "DNTLuo_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "DNTLuo_speak"),
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_1"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_3"
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
						"DNTLuoDate03_4",
						"DNTLuoDate03_5"
					},
					actionName = {
						"start_DNTLuoDate03b",
						"start_DNTLuoDate03c"
					}
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_6"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_7"
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
					name = "start_DNTLuoDate03d"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_8"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_9"
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
					name = "start_DNTLuoDate03d"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_10"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_12"
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
						"DNTLuoDate03_13",
						"DNTLuoDate03_14"
					},
					actionName = {
						"start_DNTLuoDate03e",
						"start_DNTLuoDate03f"
					}
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_15"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_16"
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
					name = "start_DNTLuoDate03g"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_17"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_18"
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
					name = "start_DNTLuoDate03g"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_19"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_20"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_23"
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
						"DNTLuoDate03_24",
						"DNTLuoDate03_25"
					},
					actionName = {
						"start_DNTLuoDate03h",
						"start_DNTLuoDate03i"
					}
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_27"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "DNTLuo_speak"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -215,
							refpt = {
								x = -0.5,
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
					name = "start_DNTLuoDate03j"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "DNTLuo_speak"),
				args = function (_ctx)
					return {
						duration = 2,
						position = {
							x = 0,
							y = -215,
							refpt = {
								x = -0.5,
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
					name = "start_DNTLuoDate03j"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03j(_root, args)
	return sequential({
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
			actor = __getnode__(_root, "bgEx_jiedao"),
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
			actor = __getnode__(_root, "DNTLuo_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "DNTLuo_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 1,
					deltaAngleZ = 180
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "DNTLuo_speak"),
			args = function (_ctx)
				return {
					duration = 2,
					position = {
						x = 0,
						y = -215,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_32"
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
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_33"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_34"
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
						"DNTLuoDate03_35",
						"DNTLuoDate03_36"
					},
					actionName = {
						"start_DNTLuoDate03k",
						"start_DNTLuoDate03l"
					}
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_37"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_38"
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
					name = "start_DNTLuoDate03m"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_40"
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
					name = "start_DNTLuoDate03m"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03m(_root, args)
	return sequential({
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
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_41"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_42"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_43"
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
				actor = __getnode__(_root, "DNTLuo_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
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
						"DNTLuoDate03_44",
						"DNTLuoDate03_45"
					},
					actionName = {
						"start_DNTLuoDate03n",
						"start_DNTLuoDate03o"
					}
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_46"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "DNTLuo_speak"),
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_48"
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
					name = "start_DNTLuoDate03p"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_49"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_50"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_51"
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
					name = "start_DNTLuoDate03p"
				}
			end
		})
	})
end

function scene_DNTLuoDate03.actions.start_DNTLuoDate03p(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "DNTLuo_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "DNTLuo/DNTLuo_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_52"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_53"
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
					name = "dialog_speak_name_115",
					dialogImage = "jq_dialogue_bg_3.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"DNTLuo_speak"
					},
					content = {
						"DNTLuoDate03_54"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "DNTLuo_speak"),
			args = function (_ctx)
				return {
					duration = 1.5,
					position = {
						x = 0,
						y = -215,
						refpt = {
							x = 1.2,
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

local function DNTLuoDate03(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_DNTLuoDate03",
					scene = scene_DNTLuoDate03
				}
			end
		})
	})
end

stories.DNTLuoDate03 = DNTLuoDate03

return _M
