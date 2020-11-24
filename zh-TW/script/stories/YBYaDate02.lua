local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.YBYaDate02")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_YBYaDate02 = {
	actions = {}
}
scenes.scene_YBYaDate02 = scene_YBYaDate02

function scene_YBYaDate02:stage(args)
	return {
		name = "root",
		type = "Stage",
		id = "root",
		position = {
			x = 0,
			y = 0
		},
		size = {
			width = 1126,
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

function scene_YBYaDate02.actions.start_YBYaDate02(_root, args)
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
					modelId = "Model_YBYa",
					id = "YBYa_speak",
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
							name = "YBYa_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YBYa/YBYa_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 11,
							visible = true,
							id = "YBYa_face",
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
				actor = __getnode__(_root, "YBYa_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YBYa_speak"),
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
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_1"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_2"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_3"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YBYa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YBYa/YBYa_face_1.png",
					pathType = "STORY_FACE"
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
						"YBYaDate02_4",
						"YBYaDate02_5"
					},
					actionName = {
						"start_YBYaDate02b",
						"start_YBYaDate02c"
					}
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02b(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_6"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_7"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_8"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02d"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02c(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_9"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_10"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02d"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02d(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_11"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_12"
					},
					durations = {
						0.02
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
						"YBYaDate02_13",
						"YBYaDate02_14"
					},
					actionName = {
						"start_YBYaDate02e",
						"start_YBYaDate02f"
					}
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02e(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_15"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_16"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_17"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02g"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02f(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_18"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_19"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_20"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02g"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02g(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_21"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_22"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_23"
					},
					durations = {
						0.02
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
						"YBYaDate02_24",
						"YBYaDate02_25"
					},
					actionName = {
						"start_YBYaDate02h",
						"start_YBYaDate02i"
					}
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02h(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_26"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_27"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02j"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02i(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_28"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_29"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02j"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02j(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_30"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_31"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_32"
					},
					durations = {
						0.02
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
						"YBYaDate02_33",
						"YBYaDate02_34"
					},
					actionName = {
						"start_YBYaDate02k",
						"start_YBYaDate02l"
					}
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02k(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_35"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_36"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02m"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02l(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_37"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_38"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02m"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02m(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_39"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_40"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_41"
					},
					durations = {
						0.02
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
						"YBYaDate02_42",
						"YBYaDate02_43"
					},
					actionName = {
						"start_YBYaDate02n",
						"start_YBYaDate02o"
					}
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02n(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_44"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_45"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02p"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02o(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_46"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_47"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_YBYaDate02p"
				}
			end
		})
	})
end

function scene_YBYaDate02.actions.start_YBYaDate02p(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_48"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_49"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_50"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_170",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YBYa_speak"
					},
					content = {
						"YBYaDate02_51"
					},
					durations = {
						0.02
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YBYa_speak"),
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

local function YBYaDate02(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_YBYaDate02",
					scene = scene_YBYaDate02
				}
			end
		})
	})
end

stories.YBYaDate02 = YBYaDate02

return _M
