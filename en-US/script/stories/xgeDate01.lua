local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.xgeDate01")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_xgeDate01 = {
	actions = {}
}
scenes.scene_xgeDate01 = scene_xgeDate01

function scene_xgeDate01:stage(args)
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
				image = "bg_story_scene_1_4.jpg",
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
				resType = 0,
				name = "bg1",
				pathType = "SCENE",
				type = "Image",
				image = "scene_block_sunflower_2.jpg",
				layoutMode = 1,
				zorder = 2,
				id = "bg1",
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

function scene_xgeDate01.actions.start_xgeDate01(_root, args)
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
						modelId = "Model_FLYDe",
						id = "xge",
						rotationX = 0,
						scale = 1,
						zorder = 200,
						position = {
							x = -17,
							y = -700,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "xge_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "xge/face_xge_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "xge_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 17,
									y = 1181.9
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xge"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "xge"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_1"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_1.png",
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
						"xgeDate01_3",
						"xgeDate01_4"
					},
					actionName = {
						"start_xgeDate01a",
						"start_xgeDate01b"
					}
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01a(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_5"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_6"
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
					name = "start_xgeDate01c"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_7"
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
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_xgeDate01c"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01c(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_9"
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
						"xgeDate01_10",
						"xgeDate01_11"
					},
					actionName = {
						"start_xgeDate01d",
						"start_xgeDate01e"
					}
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_12"
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
					name = "start_xgeDate01f"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_13"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_14"
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
					name = "start_xgeDate01f"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_15"
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
			action = "moveTo",
			actor = __getnode__(_root, "xge"),
			args = function (_ctx)
				return {
					duration = 0.7,
					position = {
						x = 0,
						y = -700,
						refpt = {
							x = -0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg1")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xge"),
			args = function (_ctx)
				return {
					duration = 0.7,
					position = {
						x = 0,
						y = -700,
						refpt = {
							x = 0.5,
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
					name = "xgedate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_16"
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
						"xgeDate01_17",
						"xgeDate01_18"
					},
					actionName = {
						"start_xgeDate01g",
						"start_xgeDate01h"
					}
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_19"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_20"
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
					name = "start_xgeDate01i"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_21"
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
					name = "start_xgeDate01i"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_22"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_23"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_24"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_25"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_26"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xge"),
			args = function (_ctx)
				return {
					duration = 0.7,
					position = {
						x = 0,
						y = -700,
						refpt = {
							x = 0.5,
							y = 0
						}
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
						"xgeDate01_27",
						"xgeDate01_28"
					},
					actionName = {
						"start_xgeDate01j",
						"start_xgeDate01k"
					}
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_29"
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
					name = "start_xgeDate01l"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_30"
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
					name = "start_xgeDate01l"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_32"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_34"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_35"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_37"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_38"
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
						"xgeDate01_39",
						"xgeDate01_40"
					},
					actionName = {
						"start_xgeDate01m",
						"start_xgeDate01n"
					}
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_41"
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
					name = "start_xgeDate01o"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_42"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_43"
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
					name = "start_xgeDate01o"
				}
			end
		})
	})
end

function scene_xgeDate01.actions.start_xgeDate01o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xge_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xge/face_xge_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "xgedate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_44"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_45"
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
					name = "xgedate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xge"
					},
					content = {
						"xgeDate01_46"
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

local function xgeDate01(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_xgeDate01",
					scene = scene_xgeDate01
				}
			end
		})
	})
end

stories.xgeDate01 = xgeDate01

return _M
