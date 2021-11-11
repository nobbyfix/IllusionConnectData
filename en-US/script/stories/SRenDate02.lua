local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.SRenDate02")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_SRenDate02 = {
	actions = {}
}
scenes.scene_SRenDate02 = scene_SRenDate02

function scene_SRenDate02:stage(args)
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
				name = "bg1",
				pathType = "SCENE",
				type = "Image",
				image = "bg_story_EXscene_0_2.jpg",
				layoutMode = 1,
				zorder = 10,
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
				fileName = "Mus_Main_House",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_SRenDate02.actions.start_SRenDate02(_root, args)
	return sequential({
		act({
			action = "fadeOut",
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
			actor = __getnode__(_root, "bg1")
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_SRen",
						id = "SRen",
						rotationX = 0,
						scale = 0.75,
						zorder = 60,
						position = {
							x = 0,
							y = -80,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SRen_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SRen/SRen_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "SRen_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -7,
									y = 673
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SRen"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SRen"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SRen"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_2"
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
						"SRenDate02_3",
						"SRenDate02_4"
					},
					actionName = {
						"start_SRenDate02a",
						"start_SRenDate02b"
					}
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02a(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_5"
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
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_7"
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
					name = "start_SRenDate02c"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02b(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_9"
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
					name = "start_SRenDate02c"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02c(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_10"
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
						"SRenDate02_11",
						"SRenDate02_12"
					},
					actionName = {
						"start_SRenDate02d",
						"start_SRenDate02e"
					}
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02d(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_13"
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
					name = "start_SRenDate02f"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02e(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_14"
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
					name = "start_SRenDate02f"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02f(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_16"
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
						"SRenDate02_17",
						"SRenDate02_18"
					},
					actionName = {
						"start_SRenDate02g",
						"start_SRenDate02h"
					}
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02g(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_20"
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
					name = "start_SRenDate02i"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02h(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_22"
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
					name = "start_SRenDate02i"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02i(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_25"
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
						"SRenDate02_26",
						"SRenDate02_27"
					},
					actionName = {
						"start_SRenDate02j",
						"start_SRenDate02k"
					}
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02j(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_29"
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
					name = "start_SRenDate02l"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02k(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SRen"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_31"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SRen"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_32"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_33"
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
					name = "start_SRenDate02l"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02l(_root, args)
	return sequential({
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_34"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_35"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_36"
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
						"SRenDate02_37",
						"SRenDate02_38"
					},
					actionName = {
						"start_SRenDate02m",
						"start_SRenDate02n"
					}
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02m(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_39"
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
					name = "start_SRenDate02o"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02n(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_40"
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
					name = "start_SRenDate02o"
				}
			end
		})
	})
end

function scene_SRenDate02.actions.start_SRenDate02o(_root, args)
	return sequential({
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_41"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "SRen_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "SRen/SRen_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "SRen_Date_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SRen"
					},
					content = {
						"SRenDate02_42"
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
					name = "SRen_Date_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {},
					content = {
						"SRenDate02_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SRen"),
			args = function (_ctx)
				return {
					duration = 0
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
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Date")
		})
	})
end

local function SRenDate02(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_SRenDate02",
					scene = scene_SRenDate02
				}
			end
		})
	})
end

stories.SRenDate02 = SRenDate02

return _M
