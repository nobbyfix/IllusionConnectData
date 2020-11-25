local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Halloween_03a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Halloween_03a = {
	actions = {}
}
scenes.scene_eventstory_Halloween_03a = scene_eventstory_Halloween_03a

function scene_eventstory_Halloween_03a:stage(args)
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
				zorder = 1,
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
						image = "Main_Halloween_Event_01.jpg",
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
				resType = 0,
				name = "hm1",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm1.png",
				layoutMode = 1,
				zorder = 3,
				id = "hm1",
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
						name = "bg2",
						pathType = "SCENE",
						type = "Image",
						image = "wsj_zhujiemian_bg.jpg",
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
					}
				}
			},
			{
				id = "Mus_Main_Scene",
				fileName = "Mus_Main_Scene",
				type = "Music"
			},
			{
				id = "Mus_Active_Halloween",
				fileName = "Mus_Active_Halloween",
				type = "Music"
			},
			{
				id = "Mus_Story_Halloween_1",
				fileName = "Mus_Story_Halloween_1",
				type = "Music"
			},
			{
				id = "Se_Story_Knock_Door",
				fileName = "Se_Story_Knock_Door",
				type = "Sound"
			},
			{
				id = "Se_Story_Laugh",
				fileName = "Se_Story_Laugh",
				type = "Sound"
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_Halloween_03a.actions.start_eventstory_Halloween_03a(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg2")
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
					duration = 3
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Halloween_1"),
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
					modelId = "Model_BHTZi_WSJie",
					id = "BHTZi_WSJie_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 50,
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
		concurrent({
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
				action = "fadeIn",
				actor = __getnode__(_root, "BHTZi_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_ALPo_WSJie",
					id = "ALPo_WSJie_speak",
					rotationX = 0,
					scale = 0.95,
					zorder = 5,
					position = {
						x = 120,
						y = -310,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "ALPo_WSJie_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "ALPo_WSJie/ALPo_WSJie_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "ALPo_WSJie_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 101.2,
								y = 837.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ALPo_WSJie_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
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
						"eventstory_Halloween_03a_1"
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
						"eventstory_Halloween_03a_2"
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
						"eventstory_Halloween_03a_3"
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
						"eventstory_Halloween_03a_4"
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
					image = "BHTZi_WSJie/BHTZi_WSJie_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
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
							"eventstory_Halloween_03a_5"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Knock_Door")
			})
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "hm1"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ALPo_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ALPo_WSJie_speak"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALPo_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 240,
							y = -310,
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ALPo_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 150,
						y = -290,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "ALPo_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 150,
							y = -310,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "ALPo_WSJie_speak"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 360
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_7"
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
						"eventstory_Halloween_03a_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_1.png",
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
						"eventstory_Halloween_03a_10"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_12"
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
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_14"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_15"
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
						"eventstory_Halloween_03a_16"
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
						"eventstory_Halloween_03a_17"
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
			action = "changeTexture",
			actor = __getnode__(_root, "BHTZi_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "BHTZi_WSJie/BHTZi_WSJie_face_2.png",
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
						"eventstory_Halloween_03a_18"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_19"
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
						"eventstory_Halloween_03a_20"
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
						"eventstory_Halloween_03a_21"
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
			action = "orbitCamera",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
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
							"BHTZi_WSJie_speak"
						},
						content = {
							"eventstory_Halloween_03a_23"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Laugh")
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing6",
					id = "JYing6_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 175,
						y = -380,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JYing6_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing6_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing6_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing6_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing5",
					id = "JYing5_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 1025,
						y = -330,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JYing5_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing5_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing5_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing5_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
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
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_24"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_25"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_26"
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
						"eventstory_Halloween_03a_27"
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_28"
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
					modelId = "Model_Story_JYing6",
					id = "JYing6_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 175,
						y = -380,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JYing6_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing6_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing6_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing6_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing5",
					id = "JYing5_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 1025,
						y = -330,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JYing5_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing5_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing5_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing5_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		concurrent({
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
							"BHTZi_WSJie_speak"
						},
						content = {
							"eventstory_Halloween_03a_29"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Laugh")
			})
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
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
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_30"
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
						"eventstory_Halloween_03a_31"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_32"
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
						"eventstory_Halloween_03a_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_34"
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
						"eventstory_Halloween_03a_35"
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
						"eventstory_Halloween_03a_36"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_37"
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
					image = "BHTZi_WSJie/BHTZi_WSJie_face_2.png",
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
						"eventstory_Halloween_03a_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_39"
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
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_40"
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
						"eventstory_Halloween_03a_41"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_42"
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
						"eventstory_Halloween_03a_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ALPo_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ALPo_WSJie/ALPo_WSJie_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_14",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ALPo_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_03a_44"
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
			actor = __getnode__(_root, "Mus_Story_Halloween_1")
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

local function eventstory_Halloween_03a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Halloween_03a",
					scene = scene_eventstory_Halloween_03a
				}
			end
		})
	})
end

stories.eventstory_Halloween_03a = eventstory_Halloween_03a

return _M
