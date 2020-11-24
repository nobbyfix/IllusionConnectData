local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Halloween_01a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Halloween_01a = {
	actions = {}
}
scenes.scene_eventstory_Halloween_01a = scene_eventstory_Halloween_01a

function scene_eventstory_Halloween_01a:stage(args)
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
				name = "hm",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				id = "hm",
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
						resType = 0,
						name = "bg1",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_1_5.jpg",
						layoutMode = 1,
						zorder = 1,
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
					}
				}
			},
			{
				id = "Mus_Main_Scene",
				fileName = "Mus_Main_Scene",
				type = "Music"
			},
			{
				id = "Mus_Story_Whale",
				fileName = "Mus_Story_Whale",
				type = "Music"
			},
			{
				id = "Mus_Active_Halloween",
				fileName = "Mus_Active_Halloween",
				type = "Music"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_Halloween_01a.actions.start_eventstory_Halloween_01a(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg1")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Whale"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "skipButton")
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_BHTZi",
					id = "BHTZi_speak",
					rotationX = 0,
					scale = 0.725,
					position = {
						x = 225,
						y = -170,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "BHTZi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "BHTZi/BHTZi_face_1.png",
							layoutMode = 1,
							scaleY = 0.99,
							zorder = 1000,
							visible = true,
							id = "BHTZi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 52.75,
								y = 858.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BHTZi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BHTZi_speak"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi/BHTZi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_1"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi/BHTZi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_2"
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_3"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi/BHTZi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_4"
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_5"
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_6"
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_7"
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_8"
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi/BHTZi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_10"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi/BHTZi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi/BHTZi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_speak"
					},
					content = {
						"eventstory_Halloween_01a_12"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_BHTZi_WSJie",
					id = "BHTZi_WSJie_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 6,
					position = {
						x = 0,
						y = -210,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "BHTZi_WSJie_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "BHTZi_WSJie/BHTZi_WSJie_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "BHTZi_WSJie_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -6,
								y = 800.5
							}
						}
					}
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "BHTZi_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BHTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BHTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BHTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BHTZi_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					brightness = -50,
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi_WSJie/BHTZi_WSJie_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_01a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi_WSJie/BHTZi_WSJie_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_01a_14"
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_01a_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -25,
						y = -190,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -125,
						y = -170,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -225,
						y = -190,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -300,
						y = -220,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -325,
						y = -190,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -425,
						y = -170,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -525,
						y = -190,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -600,
						y = -220,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -625,
						y = -190,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -725,
						y = -170,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -825,
						y = -190,
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -900,
						y = -220,
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
					name = "dialog_speak_name_281",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_01a_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_MTZMEShi",
					id = "MTZMEShi_speak",
					rotationX = 0,
					scale = 0.9,
					zorder = 5,
					position = {
						x = 50,
						y = -310,
						refpt = {
							x = 0.65,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "MTZMEShi_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "MTZMEShi/MTZMEShi_face_1.png",
							scaleX = 1.15,
							scaleY = 1.15,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "MTZMEShi_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -6,
								y = 872.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MTZMEShi_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MTZMEShi_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BHTZi_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = -125,
							y = -220,
							refpt = {
								x = 0.5,
								y = -0.1
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "BHTZi_WSJie_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "BHTZi_WSJie/BHTZi_WSJie_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "MTZMEShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "MTZMEShi/MTZMEShi_face_3.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_01a_17"
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
					name = "dialog_speak_name_233",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MTZMEShi_speak"
					},
					content = {
						"eventstory_Halloween_01a_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MTZMEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MTZMEShi/MTZMEShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_233",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MTZMEShi_speak"
					},
					content = {
						"eventstory_Halloween_01a_19"
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_01a_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MTZMEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MTZMEShi/MTZMEShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MTZMEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MTZMEShi/MTZMEShi_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi_WSJie/BHTZi_WSJie_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_01a_21"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi_WSJie/BHTZi_WSJie_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MTZMEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MTZMEShi/MTZMEShi_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_01a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi_WSJie/BHTZi_WSJie_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -150,
						y = -190,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -250,
						y = -170,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -350,
						y = -190,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -425,
						y = -220,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -450,
						y = -190,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -550,
						y = -170,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -650,
						y = -190,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -725,
						y = -220,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -750,
						y = -190,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -850,
						y = -170,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -950,
						y = -190,
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = -1025,
						y = -220,
						refpt = {
							x = 0.5,
							y = -0.1
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_01a_23"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MTZMEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MTZMEShi/MTZMEShi_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_233",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MTZMEShi_speak"
					},
					content = {
						"eventstory_Halloween_01a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Whale")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Active_Halloween"),
			args = function (_ctx)
				return {
					isloop = true
				}
			end
		})
	})
end

local function eventstory_Halloween_01a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Halloween_01a",
					scene = scene_eventstory_Halloween_01a
				}
			end
		})
	})
end

stories.eventstory_Halloween_01a = eventstory_Halloween_01a

return _M
