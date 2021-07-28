local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_Lover_07a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_Lover_07a = {
	actions = {}
}
scenes.scene_eventstory_Lover_07a = scene_eventstory_Lover_07a

function scene_eventstory_Lover_07a:stage(args)
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
						name = "bg_jia",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_4_2.jpg",
						layoutMode = 1,
						zorder = 10,
						id = "bg_jia",
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
						name = "bg_juyuan_po",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_terror_3.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_juyuan_po",
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
						name = "bg_juyuan",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_terror_1.jpg",
						layoutMode = 1,
						zorder = 16,
						id = "bg_juyuan",
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
						name = "yan_bankai",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "story_eye_2.png",
						layoutMode = 1,
						zorder = 100,
						id = "yan_bankai",
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
						name = "yan_weikai",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "story_eye_3.png",
						layoutMode = 1,
						zorder = 100,
						id = "yan_weikai",
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
						name = "bg_zhedang",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "hm.png",
						layoutMode = 1,
						zorder = 50,
						id = "bg_zhedang",
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
				name = "cg_shijian",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "story_eye_3.png",
				layoutMode = 1,
				zorder = 100,
				id = "cg_shijian",
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
				id = "Mus_yewan",
				fileName = "Mus_Story_Terror_Amb",
				type = "Music"
			},
			{
				id = "mying_gesheng",
				fileName = "Mus_Story_Terror",
				type = "Music"
			},
			{
				id = "wsli_gesheng",
				fileName = "Mus_Story_Terror_Singing_1",
				type = "Music"
			},
			{
				id = "Mus_gangqin",
				fileName = "Se_Story_Piano",
				type = "Music"
			},
			{
				id = "Mus_huiyi",
				fileName = "Mus_Story_Memory",
				type = "Music"
			},
			{
				id = "yin_zhongwu",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				id = "yin_shache",
				fileName = "Se_Skill_Gun",
				type = "sound"
			},
			{
				id = "yin_nishui",
				fileName = "Se_Skill_Gun_2",
				type = "Sound"
			},
			{
				id = "yin_xintiao_up",
				fileName = "Se_Skill_Gun_2",
				type = "Sound"
			},
			{
				id = "yin_xintiao",
				fileName = "Se_Skill_Gun_2",
				type = "Sound"
			},
			{
				id = "yin_xintiao_stop",
				fileName = "Se_Skill_Gun_2",
				type = "Sound"
			},
			{
				id = "yin_huxi",
				fileName = "Se_Skill_Gun_2",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
				visible = false,
				id = "shandian",
				scale = 1,
				actionName = "qiangpao_gongji_juqing",
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
				zorder = 1000,
				visible = false,
				id = "zhongbai",
				scale = 0.9,
				actionName = "shuijing_zhongjian_cuimianshuijing",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.6
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_Lover_07a.actions.start_eventstory_Lover_07a(_root, args)
	return sequential({
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "show",
			actor = __getnode__(_root, "hideButton")
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
			actor = __getnode__(_root, "mying_gesheng"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_Lover_07a_1",
						"eventstory_Lover_07a_2",
						"eventstory_Lover_07a_3",
						"eventstory_Lover_07a_4"
					},
					durations = {
						0.08,
						0.08,
						0.08,
						0.08
					},
					waitTimes = {
						1,
						1,
						1,
						1.2
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_Lover_07a_5",
						"eventstory_Lover_07a_6"
					},
					durations = {
						0.08,
						0.08
					},
					waitTimes = {
						1,
						1.2
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_Lover_07a_7"
					},
					durations = {
						0.08
					},
					waitTimes = {
						1.2
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "printerEffect")
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = -150,
						modelId = "Model_Master_LieSha",
						id = "Master",
						rotationX = 0,
						scale = 1,
						zorder = 145,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_WSLi",
						id = "aflya",
						rotationX = 0,
						scale = 0.75,
						zorder = 130,
						position = {
							x = 0,
							y = -466,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "aflya_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "aflya/face_aflya_11.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "aflya_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 9,
									y = 1262
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "aflya"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_jia"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "zhongbai"),
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
					duration = 0.3
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Lover08_dialog_speak_name_4"
					},
					content = {
						"eventstory_Lover_07a_8"
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
					name = "Lover08_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Lover08_dialog_speak_name_4"
					},
					content = {
						"eventstory_Lover_07a_9"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_huiyi"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "aflya"),
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
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_10"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_zhedang"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "zhongbai")
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "Master"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "Master"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Master"
						},
						content = {
							"eventstory_Lover_07a_11"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "aflya"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -466,
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_12"
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"eventstory_Lover_07a_13"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_14"
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"eventstory_Lover_07a_15"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_16"
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"eventstory_Lover_07a_17"
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_18"
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"eventstory_Lover_07a_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_20"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_21"
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"eventstory_Lover_07a_22"
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_23"
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_24"
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"eventstory_Lover_07a_25"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_26"
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_27"
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"eventstory_Lover_07a_28"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_29"
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_30"
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_31"
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
						name = "Lover08_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Master"
						},
						content = {
							"eventstory_Lover_07a_32"
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
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Master"
						},
						content = {
							"eventstory_Lover_07a_33"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -430,
							refpt = {
								x = -0.5,
								y = 0
							}
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
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "Master"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sleep({
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_34"
					},
					durations = {
						0.1
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_35"
						},
						durations = {
							0.1
						}
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "aflya"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.4
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
			actor = __getnode__(_root, "Master"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -430,
						refpt = {
							x = 0.25,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "Master"),
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
						name = "Lover08_dialog_speak_name_3",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"Master"
						},
						content = {
							"eventstory_Lover_07a_36"
						},
						durations = {
							0.08
						}
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sleep({
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
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_37"
						},
						durations = {
							0.1
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_10.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "aflya"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sleep({
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"eventstory_Lover_07a_38"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "aflya_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "aflya/face_aflya_11.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_39"
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_40"
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
					name = "Lover08_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"Master"
					},
					content = {
						"eventstory_Lover_07a_41"
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "Master"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "aflya"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_juyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_juyuan_po"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "aflya"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -466,
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
					duration = 1
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
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_42"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "aflya"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			})
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_43"
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_44"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "aflya"),
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
				action = "fadeOut",
				actor = __getnode__(_root, "bg_juyuan"),
				args = function (_ctx)
					return {
						duration = 2
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "wsli_gesheng"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "volume",
			actor = __getnode__(_root, "wsli_gesheng"),
			args = function (_ctx)
				return {
					volumeend = 0.8,
					duration = 5,
					volumebegin = 0,
					type = "music"
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "aflya"),
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 5
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_45"
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
					name = "Lover08_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"aflya"
					},
					content = {
						"eventstory_Lover_07a_46"
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
						name = "Lover08_dialog_speak_name_5",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"aflya"
						},
						content = {
							"eventstory_Lover_07a_47"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "aflya_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "aflya/face_aflya_8.png",
						pathType = "STORY_FACE"
					}
				end
			})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "wsli_gesheng")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "aflya"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		})
	})
end

local function eventstory_Lover_07a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_Lover_07a",
					scene = scene_eventstory_Lover_07a
				}
			end
		})
	})
end

stories.eventstory_Lover_07a = eventstory_Lover_07a

return _M
