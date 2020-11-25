local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Halloween_06a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Halloween_06a = {
	actions = {}
}
scenes.scene_eventstory_Halloween_06a = scene_eventstory_Halloween_06a

function scene_eventstory_Halloween_06a:stage(args)
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
						image = "Main_Halloween_Event_02.jpg",
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
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 2,
				videoName = "stroy_chuxian",
				id = "stroy_chuxian",
				scale = 1.5,
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

function scene_eventstory_Halloween_06a.actions.start_eventstory_Halloween_06a(_root, args)
	return sequential({
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg1")
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "stroy_chuxian"),
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
					modelId = "Model_BHTZi_WSJie",
					id = "BHTZi_WSJie_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 5,
					position = {
						x = 0,
						y = -235,
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
				action = "brightnessTo",
				actor = __getnode__(_root, "hm"),
				args = function (_ctx)
					return {
						brightness = -173,
						duration = 0.3
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
					modelId = "Model_Story_YLMGZhu_WSJie",
					id = "YLMGZhu_WSJie_speak",
					rotationX = 0,
					scale = 1,
					zorder = 5,
					position = {
						x = 0,
						y = -310,
						refpt = {
							x = 0.25,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YLMGZhu_WSJie_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YLMGZhu_WSJie/YLMGZhu_WSJie_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YLMGZhu_WSJie_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -18.5,
								y = 721.5
							}
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "YLMGZhu_WSJie_speak"),
			args = function (_ctx)
				return {
					opacity = 0
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
						"eventstory_Halloween_06a_1"
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
						"eventstory_Halloween_06a_2"
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
						"eventstory_Halloween_06a_3"
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
						"eventstory_Halloween_06a_4"
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
						"BHTZi_WSJie/BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_06a_5"
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
						"eventstory_Halloween_06a_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		rockScreen({
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_06a_7"
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
						"eventstory_Halloween_06a_8"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "stroy_chuxian"),
			args = function (_ctx)
				return {
					duration = 0.75
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "hm"),
			args = function (_ctx)
				return {
					brightness = -50,
					duration = 0.3
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
						"eventstory_Halloween_06a_9"
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
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YLMGZhu_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BHTZi_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -235,
							refpt = {
								x = 0.75,
								y = 0
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
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu_WSJie/YLMGZhu_WSJie_face_4.png",
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
						"YLMGZhu_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_06a_10"
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
						"eventstory_Halloween_06a_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu_WSJie/YLMGZhu_WSJie_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YLMGZhu_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -310,
						refpt = {
							x = 0.25,
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
					duration = 0,
					position = {
						x = 0,
						y = -235,
						refpt = {
							x = 0.75,
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
					duration = 0.3,
					position = {
						x = 0,
						y = -235,
						refpt = {
							x = 0.75,
							y = 0.4
						}
					}
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					deltaAngle = 20,
					duration = 0.3
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
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -235,
						refpt = {
							x = 0.35,
							y = 0.2
						}
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "YLMGZhu_WSJie_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 1
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "BHTZi_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -235,
							refpt = {
								x = 0.35,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "BHTZi_WSJie_speak"),
				args = function (_ctx)
					return {
						deltaAngle = -20,
						duration = 0.15
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -235,
						refpt = {
							x = 0.75,
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
					name = "dialog_speak_name_37",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YLMGZhu_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_06a_12"
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
					name = "dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_06a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YLMGZhu_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YLMGZhu_WSJie/YLMGZhu_WSJie_face_1.png",
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
						"eventstory_Halloween_06a_14"
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
						"eventstory_Halloween_06a_15"
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
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_06a_16"
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
					duration = 0.4,
					position = {
						x = 0,
						y = -235,
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
				actor = __getnode__(_root, "BHTZi_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -235,
							refpt = {
								x = 0.25,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "BHTZi_WSJie_speak"),
				args = function (_ctx)
					return {
						deltaAngle = 20,
						duration = 0.4
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YLMGZhu_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -310,
							refpt = {
								x = -0.5,
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
						duration = 0.4,
						position = {
							x = 0,
							y = -235,
							refpt = {
								x = 0.375,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "rotateBy",
				actor = __getnode__(_root, "BHTZi_WSJie_speak"),
				args = function (_ctx)
					return {
						deltaAngle = -20,
						duration = 0.4
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -235,
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
						"eventstory_Halloween_06a_17"
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
						"eventstory_Halloween_06a_18"
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
					duration = 0.75,
					position = {
						x = 0,
						y = -255,
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
					duration = 0.75,
					position = {
						x = 0,
						y = -210,
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
					name = "dialog_speak_name_17",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_06a_19"
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
						"eventstory_Halloween_06a_20"
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
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.75,
					position = {
						x = 0,
						y = -245,
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
					duration = 0.75,
					position = {
						x = 0,
						y = -210,
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
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BHTZi_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_06a_21"
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
						"eventstory_Halloween_06a_22"
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
						"eventstory_Halloween_06a_23"
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
						"eventstory_Halloween_06a_24"
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
						"eventstory_Halloween_06a_25"
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
						"eventstory_Halloween_06a_26"
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

local function eventstory_Halloween_06a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Halloween_06a",
					scene = scene_eventstory_Halloween_06a
				}
			end
		})
	})
end

stories.eventstory_Halloween_06a = eventstory_Halloween_06a

return _M
