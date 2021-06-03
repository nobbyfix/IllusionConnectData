local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.LYXiDate02")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_LYXiDate02 = {
	actions = {}
}
scenes.scene_LYXiDate02 = scene_LYXiDate02

function scene_LYXiDate02:stage(args)
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
				resType = 0,
				name = "bg1",
				pathType = "SCENE",
				type = "Image",
				image = "gallery_album_03.jpg",
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
				resType = 0,
				name = "bg2",
				pathType = "SCENE",
				type = "Image",
				image = "bg_build_cg_03.jpg",
				layoutMode = 1,
				zorder = 3,
				id = "bg2",
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

function scene_LYXiDate02.actions.start_LYXiDate02(_root, args)
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
						modelId = "Model_LYXi",
						id = "LYXi",
						rotationX = 0,
						scale = 0.71,
						zorder = 200,
						position = {
							x = 0,
							y = -227,
							refpt = {
								x = 0.51,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "LYXi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "LYXi/LYXi_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "LYXi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -21.6,
									y = 882.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "LYXi"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "LYXi"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_1"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_2"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_1.png",
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
						"LYXiDate02_3",
						"LYXiDate02_4"
					},
					actionName = {
						"start_LYXiDate02a",
						"start_LYXiDate02b"
					}
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02a(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_5"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_7"
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
					name = "start_LYXiDate02c"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02b(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_8"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_9"
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
					name = "start_LYXiDate02c"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02c(_root, args)
	return sequential({
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LYXi"),
			args = function (_ctx)
				return {
					duration = 0.7,
					position = {
						x = 0,
						y = -227,
						refpt = {
							x = -0.3,
							y = 0
						}
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.7
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
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
					duration = 0.2
				}
			end
		}),
		sleep({
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
					name = "LYXiDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_10"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LYXi"),
			args = function (_ctx)
				return {
					duration = 0.7,
					position = {
						x = 0,
						y = -227,
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
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_14"
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
						"LYXiDate02_15",
						"LYXiDate02_16"
					},
					actionName = {
						"start_LYXiDate02d",
						"start_LYXiDate02e"
					}
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_17"
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
					name = "start_LYXiDate02f"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_18"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_19"
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
					name = "start_LYXiDate02f"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_22"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_24"
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
						"LYXiDate02_25",
						"LYXiDate02_26"
					},
					actionName = {
						"start_LYXiDate02g",
						"start_LYXiDate02h"
					}
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_27"
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
					name = "start_LYXiDate02i"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_29"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_30"
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
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_LYXiDate02i"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02i(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_32"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "LYXi"),
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_34"
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
					name = "LYXiDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_37"
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
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LYXi"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -227,
						refpt = {
							x = -0.3,
							y = 0
						}
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.7
				}
			end
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg2")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "LYXi"),
			args = function (_ctx)
				return {
					duration = 0.7,
					position = {
						x = 0,
						y = -227,
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
					name = "LYXiDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_38"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "LYXi"),
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
					name = "LYXiDate_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_41"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_42"
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
						"LYXiDate02_43",
						"LYXiDate02_44"
					},
					actionName = {
						"start_LYXiDate02j",
						"start_LYXiDate02k"
					}
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_45"
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
					name = "start_LYXiDate02l"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_46"
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
					name = "start_LYXiDate02l"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02l(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_47"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_48"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_50"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_51"
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
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_52"
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
						"LYXiDate02_53",
						"LYXiDate02_54"
					},
					actionName = {
						"start_LYXiDate02m",
						"start_LYXiDate02n"
					}
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_55"
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
					name = "start_LYXiDate02o"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_56"
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
					name = "start_LYXiDate02o"
				}
			end
		})
	})
end

function scene_LYXiDate02.actions.start_LYXiDate02o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_57"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "LYXi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "LYXi/LYXi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "LYXiDate_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"LYXi"
					},
					content = {
						"LYXiDate02_58"
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

local function LYXiDate02(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_LYXiDate02",
					scene = scene_LYXiDate02
				}
			end
		})
	})
end

stories.LYXiDate02 = LYXiDate02

return _M
