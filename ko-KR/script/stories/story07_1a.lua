local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.story07_1a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_story07_1a = {
	actions = {}
}
scenes.scene_story07_1a = scene_story07_1a

function scene_story07_1a:stage(args)
	return {
		name = "root",
		type = "Stage",
		id = "root",
		position = {
			x = 0,
			y = 0
		},
		size = {
			width = 1386,
			height = 852
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
						image = "bg_story_scene_4_1.jpg",
						brightness = -50,
						zorder = 1,
						layoutMode = 1,
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
						resType = 0,
						name = "bg2",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_1_8.jpg",
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
						resType = 0,
						name = "bg4",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_4_2.jpg",
						layoutMode = 1,
						zorder = 3,
						id = "bg4",
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
						name = "cg",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_cg_06_1.jpg",
						layoutMode = 1,
						zorder = 3,
						id = "cg",
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
				name = "item",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "jingpian01.png",
				layoutMode = 1,
				zorder = 1100,
				visible = true,
				id = "item",
				scale = 1,
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.15,
						y = 0.5
					}
				}
			},
			{
				id = "Mus_Story_Sad_Amb",
				fileName = "Mus_Story_Sad_Amb",
				type = "Music"
			},
			{
				id = "Mus_Story_London",
				fileName = "Mus_Story_London",
				type = "Music"
			},
			{
				id = "Mus_Story_Danger_2",
				fileName = "Mus_Story_Danger_2",
				type = "Music"
			},
			{
				id = "Se_Story_Chapter_6_7",
				fileName = "Se_Story_Chapter_6_7",
				type = "Music"
			},
			{
				id = "Mus_Story_Whale",
				fileName = "Mus_Story_Whale",
				type = "Music"
			},
			{
				id = "Mus_Story_Intro_Chapter",
				fileName = "Mus_Story_Intro_Chapter",
				type = "Music"
			},
			{
				id = "Se_Story_Impact_3",
				fileName = "Se_Story_Impact_3",
				type = "Sound"
			},
			{
				id = "Se_Story_Nightmare_Single_Small",
				fileName = "Se_Story_Nightmare_Single_Small",
				type = "Sound"
			},
			{
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 230,
				videoName = "story_huiyi",
				id = "effects_oldfilm",
				scale = 1.05,
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 520,
				visible = false,
				id = "daojju_juqingtexiao",
				scale = 1.05,
				actionName = "daojju_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.25,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 250,
				visible = false,
				id = "huiyib_juqingtexiao",
				scale = 1.05,
				actionName = "huiyib_juqingtexiao",
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
				layoutMode = 1,
				visible = false,
				type = "VideoSprite",
				zorder = 250,
				videoName = "stroy_chuxian",
				id = "stroy_chuxian",
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 200,
				visible = false,
				id = "liqi_juqingtexiao1",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.6,
						y = 0.4
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 201,
				visible = false,
				id = "liqi_juqingtexiao2",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.52,
						y = 0.4
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 202,
				visible = false,
				id = "liqi_juqingtexiao3",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.68,
						y = 0.4
					}
				}
			},
			{
				id = "mask",
				type = "Mask"
			},
			{
				id = "flashMask",
				type = "FlashMask"
			},
			{
				id = "Voice_Story_MGNa_03",
				fileName = "Voice_Story_MGNa_03",
				type = "Sound"
			},
			{
				id = "Voice_Story_KTSJKe_01",
				fileName = "Voice_Story_KTSJKe_01",
				type = "Sound"
			},
			{
				id = "Voice_Story_KTSJKe_02",
				fileName = "Voice_Story_KTSJKe_02",
				type = "Sound"
			},
			{
				id = "Voice_Story_KTSJKe_03",
				fileName = "Voice_Story_KTSJKe_03",
				type = "Sound"
			}
		},
		__actions__ = self.actions
	}
end

function scene_story07_1a.actions.start_story07_1a(_root, args)
	return sequential({
		concurrent({
			act({
				action = "show",
				actor = __getnode__(_root, "chapterDialog"),
				args = function (_ctx)
					return {
						content = {
							"story07_1a_1",
							{
								"story07_1a_2",
								"story07_1a_3"
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Chapter_6_7"),
				args = function (_ctx)
					return {
						isLoop = false
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "chapterDialog")
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
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Intro_Chapter"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					heightSpace = 12,
					content = {
						"story07_1a_4",
						"story07_1a_5",
						"story07_1a_6",
						"story07_1a_7",
						"story07_1a_8",
						"story07_1a_9",
						"story07_1a_10",
						"story07_1a_11",
						"story07_1a_12"
					},
					waitTimes = {
						11
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "item"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "activateNode",
			actor = __getnode__(_root, "bg")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "Mus_Story_London"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Enemy_Story_Normal",
					id = "Enemy",
					rotationX = 0,
					scale = 0.8,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 0.75,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Enemy"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Enemy"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			})
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Se_Story_Nightmare_Single_Small")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_43",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Enemy"
					},
					content = {
						"story07_1a_13"
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
			actor = __getnode__(_root, "Enemy"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -80,
						refpt = {
							x = 0.45,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "Se_Story_Impact_3")
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "liqi_juqingtexiao1"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "liqi_juqingtexiao2"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "liqi_juqingtexiao3"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_juqingtexiao1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_juqingtexiao2"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "liqi_juqingtexiao3"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			})
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "Enemy"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Enemy"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "liqi_juqingtexiao1")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "liqi_juqingtexiao2")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "liqi_juqingtexiao3")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_KTSJKe",
					id = "KTSJKe_speak",
					rotationX = 0,
					scale = 1.035,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 1.5,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "KTSJKe_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "KTSJKe/KTSJKe_face_4.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "KTSJKe_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -54.5,
								y = 988.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.4,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.55,
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
					name = "dialog_speak_name_101",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_14"
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
			action = "flashScreen",
			actor = __getnode__(_root, "flashMask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#DC143C",
							fadeout = 0.2,
							alpha = 0.8,
							duration = 0.3,
							fadein = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					freq = 4,
					strength = 3
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_101",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_15"
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
			action = "flashScreen",
			actor = __getnode__(_root, "flashMask"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#DC143C",
							fadeout = 0.2,
							alpha = 0.8,
							duration = 0.3,
							fadein = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					freq = 4,
					strength = 3
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_101",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_London")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "effects_oldfilm"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.5
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
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_MGNa",
					id = "MGNa_speak",
					rotationX = 0,
					scale = 1.115,
					position = {
						x = 0,
						y = -375,
						refpt = {
							x = 0.65,
							y = 0
						}
					},
					children = {
						{
							resType = 0,
							name = "MGNa_face",
							pathType = "STORY_FACE",
							type = "Image",
							image = "MGNa/MGNa_face_1.png",
							scaleX = 1,
							scaleY = 1,
							layoutMode = 1,
							zorder = 1100,
							visible = true,
							id = "MGNa_face",
							anchorPoint = {
								x = 0.5,
								y = 0.5
							},
							position = {
								x = -214,
								y = 748.5
							}
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MGNa_speak"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "MGNa_speak"),
				args = function (_ctx)
					return {
						duration = 0.8
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"story07_1a_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "MGNa_speak"),
				args = function (_ctx)
					return {
						zorder = 12
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						zorder = 15
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "MGNa_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -375,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.75,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "KTSJKe_speak"),
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_18"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MGNa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MGNa/MGNa_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"story07_1a_19"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_20"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MGNa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MGNa/MGNa_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"story07_1a_21"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_22"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "MGNa_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "MGNa/MGNa_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"story07_1a_23"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_24"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "MGNa_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -375,
						refpt = {
							x = 0.65,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_MGNa_03")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_49",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MGNa_speak"
					},
					content = {
						"story07_1a_25"
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "MGNa_speak"),
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
			action = "hide",
			actor = __getnode__(_root, "effects_oldfilm")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bg3"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "bgEx_jiedao"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			})
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
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -550,
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
			actor = __getnode__(_root, "KTSJKe_speak"),
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_26"
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
					name = "dialog_speak_name_102",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story07_1a_27"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.7,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "daojju_juqingtexiao"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "KTSJKe_speak"),
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_28"
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
					name = "dialog_speak_name_102",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story07_1a_29"
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
					name = "dialog_speak_name_102",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					content = {
						"story07_1a_30"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKeface_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_31"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_32"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_33"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "daojju_juqingtexiao")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_3.png",
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
						name = "dialog_speak_name_21",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"KTSJKe_speak"
						},
						content = {
							"story07_1a_34"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						freq = 4,
						strength = 3
					}
				end
			})
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Whale")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "mask"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "mask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FFFFFF",
								fadeout = 0,
								alpha = 1,
								duration = 0.5,
								fadein = 0
							}
						}
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "mask"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
			}),
			act({
				action = "flashScreen",
				actor = __getnode__(_root, "mask"),
				args = function (_ctx)
					return {
						arr = {
							{
								color = "#FFFFFF",
								fadeout = 0,
								alpha = 1,
								duration = 0.5,
								fadein = 0
							}
						}
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "rock",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					freq = 4,
					strength = 1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.5,
							y = -1
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Danger_2"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.5,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "stroy_chuxian"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			})
		}),
		act({
			action = "blendFlashScreen",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					arr = {
						{
							color = "#DC143C",
							fadeout = 0.2,
							alpha = 0.8,
							duration = 0.3,
							fadein = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_101",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"KTSJKe_speak"
						},
						content = {
							"story07_1a_35"
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
						freq = 4,
						strength = 3
					}
				end
			})
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_KTSJKe_01")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_101",
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_36"
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
					name = "dialog_speak_name_101",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "block",
			actor = __getnode__(_root, "Mus_Story_Danger_2"),
			args = function (_ctx)
				return {
					blockId = "Mus_Story_Danger_2_Block_1"
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
		act({
			action = "hide",
			actor = __getnode__(_root, "stroy_chuxian")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg4"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg3"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "huiyib_juqingtexiao"),
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
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -550,
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
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.45,
							y = -0.02
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.4,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0.1,
					deltaAngleZ = 180
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.45,
							y = -0.02
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -550,
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_39"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "addPortrait",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					modelId = "Model_Story_KTSJKe",
					id = "KTSJKe_speak2",
					rotationX = 0,
					scale = 1,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 1,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "updateNode",
				actor = __getnode__(_root, "KTSJKe_speak2"),
				args = function (_ctx)
					return {
						opacity = 0.5
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "KTSJKe_speak2"),
				args = function (_ctx)
					return {
						duration = 0.5
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.95,
							y = -0.02
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.9,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.85,
							y = -0.02
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.8,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Story_Sad_Amb"),
			args = function (_ctx)
				return {
					isLoop = false
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_4.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_40"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "dialog_speak_name_42",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"KTSJKe_speak"
						},
						content = {
							"story07_1a_41"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_42"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_43"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.05,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.8,
							y = 0.02
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.05,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.8,
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_44"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_45"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_46"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_47"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.05,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.8,
							y = 0.02
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.05,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.8,
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_48"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_49"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_50"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_51"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_52"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_53"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_54"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_55"
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
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.4,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "KTSJKe_speak2"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = -550,
							refpt = {
								x = 0.65,
								y = -0.05
							}
						}
					}
				end
			})
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_KTSJKe_02")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_56"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_57"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_58"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_59"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_60"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Voice_Story_KTSJKe_03")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_61"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_62"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_63"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_64"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_65"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_66"
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
		rockScreen({
			args = function (_ctx)
				return {
					freq = 4,
					strength = 3
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 3,
					strength = 2
				}
			end
		}),
		rockScreen({
			args = function (_ctx)
				return {
					freq = 2,
					strength = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.8,
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_67"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_68"
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
						name = "dialog_speak_name_21",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"KTSJKe_speak2"
						},
						content = {
							"story07_1a_69"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "KTSJKe_speak2"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0.1,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.3,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_70"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.08,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.8,
							y = 0.02
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "KTSJKe_speak2"),
			args = function (_ctx)
				return {
					duration = 0.08,
					position = {
						x = 0,
						y = -550,
						refpt = {
							x = 0.8,
							y = 0
						}
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
						name = "dialog_speak_name_21",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"KTSJKe_speak2"
						},
						content = {
							"story07_1a_71"
						},
						durations = {
							0.03
						}
					}
				end
			}),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_2.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_72"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_3.png",
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
						name = "dialog_speak_name_42",
						dialogImage = "jq_dialogue_bg_2.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"KTSJKe_speak"
						},
						content = {
							"story07_1a_73"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "KTSJKe_speak"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
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
			actor = __getnode__(_root, "KTSJKe_speak"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "KTSJKe_speak2"),
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
			actor = __getnode__(_root, "cg"),
			args = function (_ctx)
				return {
					duration = 0.5
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_74"
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
					name = "dialog_speak_name_21",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak2"
					},
					content = {
						"story07_1a_75"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "KTSJKe_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "KTSJKe/KTSJKe_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_76"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_77"
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
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_78"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Story_Sad_Amb")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "dialog_speak_name_42",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"KTSJKe_speak"
					},
					content = {
						"story07_1a_79"
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
					duration = 3
				}
			end
		})
	})
end

local function story07_1a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_story07_1a",
					scene = scene_story07_1a
				}
			end
		})
	})
end

stories.story07_1a = story07_1a

return _M
