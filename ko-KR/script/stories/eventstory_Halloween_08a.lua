local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Halloween_08a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Halloween_08a = {
	actions = {}
}
scenes.scene_eventstory_Halloween_08a = scene_eventstory_Halloween_08a

function scene_eventstory_Halloween_08a:stage(args)
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
						image = "wsj_zhujiemian_bg.jpg",
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
				id = "mask",
				type = "Mask"
			},
			{
				id = "Mus_Main_Scene",
				fileName = "Mus_Main_Scene",
				type = "Music"
			},
			{
				id = "Mus_Story_Halloween_1",
				fileName = "Mus_Story_Halloween_1",
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

function scene_eventstory_Halloween_08a.actions.start_eventstory_Halloween_08a(_root, args)
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
						x = -200,
						y = -220,
						refpt = {
							x = 0.5,
							y = -0.1
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
					modelId = "Model_Story_YSLBin_WSJie",
					id = "YSLBin_WSJie_speak",
					rotationX = 0,
					scale = 1.1,
					zorder = 5,
					position = {
						x = 275,
						y = -480,
						refpt = {
							x = 0.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "YSLBin_WSJie_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "YSLBin_WSJie/YSLBin_WSJie_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "YSLBin_WSJie_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = 2.8,
								y = 834
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YSLBin_WSJie_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YSLBin_WSJie_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSLBin_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSLBin_WSJie/YSLBin_WSJie_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_280",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSLBin_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_08a_1"
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
						"eventstory_Halloween_08a_2"
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
					name = "dialog_speak_name_280",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSLBin_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_08a_3"
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
					name = "dialog_speak_name_280",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSLBin_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_08a_4"
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
					name = "dialog_speak_name_280",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSLBin_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_08a_5"
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
					name = "dialog_speak_name_280",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSLBin_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_08a_6"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSLBin_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSLBin_WSJie/YSLBin_WSJie_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_280",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSLBin_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_08a_7"
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
					name = "dialog_speak_name_280",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSLBin_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_08a_8"
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
						"eventstory_Halloween_08a_9"
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
					freq = 5,
					strength = 3
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
						"eventstory_Halloween_08a_10"
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
						"YSLBin_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_08a_11"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YSLBin_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "fadeIn",
				actor = __getnode__(_root, "JYing6_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
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
			})
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
						y = -360,
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
				action = "fadeIn",
				actor = __getnode__(_root, "JYing5_speak"),
				args = function (_ctx)
					return {
						duration = 0.5
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
			})
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing5",
					id = "JYing51_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 725,
						y = -380,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing51_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing51_speak"),
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing51_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing5",
					id = "JYing52_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 305,
						y = -330,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing52_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing52_speak"),
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing52_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing6",
					id = "JYing61_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 875,
						y = -380,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing61_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing61_speak"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing61_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing6",
					id = "JYing62_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 1675,
						y = 580,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing62_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "JYing62_speak"),
			args = function (_ctx)
				return {
					deltaAngle = 285,
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing62_speak"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing62_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing5",
					id = "JYing54_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = -600,
						y = 430,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing54_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "rotateBy",
			actor = __getnode__(_root, "JYing54_speak"),
			args = function (_ctx)
				return {
					deltaAngle = 75,
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing54_speak"),
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing54_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing6",
					id = "JYing63_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 625,
						y = -430,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing63_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing63_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing63_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing6",
					id = "JYing66_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 425,
						y = -430,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing66_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing66_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing66_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing5",
					id = "JYing53_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 625,
						y = -430,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing53_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing53_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing53_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing5",
					id = "JYing55_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 625,
						y = -430,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing55_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing55_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing55_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_JYing6",
					id = "JYing64_speak",
					rotationX = 0,
					scale = 0.8,
					zorder = 1,
					position = {
						x = 625,
						y = -430,
						refpt = {
							x = 0,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "JYing64_speak"),
			args = function (_ctx)
				return {
					opacity = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JYing64_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "JYing64_speak"),
			args = function (_ctx)
				return {
					brightness = 255,
					duration = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_12"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_13"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_14"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_15"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing61_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing62_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing6_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing5_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing51_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing52_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing66_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing63_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing53_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing54_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing55_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing64_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "YSLBin_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSLBin_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSLBin_WSJie/YSLBin_WSJie_face_3.png",
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
						"eventstory_Halloween_08a_17"
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
						"eventstory_Halloween_08a_18"
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
						"eventstory_Halloween_08a_19"
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
						"eventstory_Halloween_08a_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "YSLBin_WSJie_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "YSLBin_WSJie/YSLBin_WSJie_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_280",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"YSLBin_WSJie_speak"
					},
					content = {
						"eventstory_Halloween_08a_21"
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
						"eventstory_Halloween_08a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "YSLBin_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 175,
						y = -480,
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
						"eventstory_Halloween_08a_23"
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
						"eventstory_Halloween_08a_24"
					},
					durations = {
						0.03
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
			actor = __getnode__(_root, "YSLBin_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 9500,
						y = -600,
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
						"eventstory_Halloween_08a_25"
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
						"eventstory_Halloween_08a_26"
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
						"eventstory_Halloween_08a_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
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
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing61_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing62_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing66_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
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
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing51_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing52_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing53_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing54_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing63_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing64_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "brightnessTo",
				actor = __getnode__(_root, "JYing55_speak"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing61_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing62_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing66_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing6_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing5_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing51_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing52_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing55_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing63_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing53_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing54_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "JYing64_speak"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "flashScreen",
			actor = __getnode__(_root, "mask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#FFF68F",
							fadeout = 1,
							alpha = 1,
							duration = 0.2,
							fadein = 1
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing61_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing62_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing6_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing51_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing55_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing66_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing52_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing63_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing53_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing54_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "JYing64_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
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
					content = {
						"eventstory_Halloween_08a_28"
					},
					durations = {
						0.03
					}
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_29"
					},
					durations = {
						0.03
					}
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_30"
					},
					durations = {
						0.03
					}
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
					content = {
						"eventstory_Halloween_08a_31"
					},
					durations = {
						0.03
					}
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
					content = {
						"eventstory_Halloween_08a_32"
					},
					durations = {
						0.03
					}
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JYing5_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 825,
						y = -360,
						refpt = {
							x = 0,
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
					content = {
						"eventstory_Halloween_08a_34"
					},
					durations = {
						0.03
					}
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_256",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_35"
					},
					durations = {
						0.03
					}
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_36"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_37"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_38"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_39"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_40"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_41"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_42"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_43"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_44"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_45"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_46"
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
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JYing5_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 625,
						y = -360,
						refpt = {
							x = 0,
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
					content = {
						"eventstory_Halloween_08a_48"
					},
					durations = {
						0.03
					}
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_283",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"eventstory_Halloween_08a_49"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "JYing5_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 575,
						y = -360,
						refpt = {
							x = 0,
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
					content = {
						"eventstory_Halloween_08a_50"
					},
					durations = {
						0.03
					}
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
			action = "moveTo",
			actor = __getnode__(_root, "BHTZi_WSJie_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 1025,
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

local function eventstory_Halloween_08a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Halloween_08a",
					scene = scene_eventstory_Halloween_08a
				}
			end
		})
	})
end

stories.eventstory_Halloween_08a = eventstory_Halloween_08a

return _M
