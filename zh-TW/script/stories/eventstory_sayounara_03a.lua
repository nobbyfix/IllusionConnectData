local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_sayounara_03a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_sayounara_03a = {
	actions = {}
}
scenes.scene_eventstory_sayounara_03a = scene_eventstory_sayounara_03a

function scene_eventstory_sayounara_03a:stage(args)
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
						name = "bg_di",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "hm.png",
						layoutMode = 1,
						zorder = 20,
						id = "bg_di",
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
						name = "bg_zhanchang",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_fireworks_1.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_zhanchang",
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
						name = "bg_juguai",
						pathType = "SCENE",
						type = "Image",
						image = "bg_pve_cg_06.jpg",
						layoutMode = 1,
						zorder = 10,
						id = "bg_juguai",
						scale = 1.4,
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
						name = "bg_haitan",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_7_4.jpg",
						layoutMode = 1,
						zorder = 25,
						id = "bg_haitan",
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
					}
				}
			},
			{
				id = "Mus_zhandou",
				fileName = "Mus_Story_Yehuo_Determine",
				type = "Music"
			},
			{
				id = "Mus_shiji",
				fileName = "Mus_Story_Dongwenhui",
				type = "Music"
			},
			{
				id = "Mus_zhansi",
				fileName = "Mus_Story_Fireworks_2",
				type = "Music"
			},
			{
				id = "yin_juhou",
				fileName = "Se_Story_Nightmare_Single_Big",
				type = "Sound"
			},
			{
				id = "yin_siyao",
				fileName = "Se_Story_Muou_Attack",
				type = "Sound"
			},
			{
				id = "yin_gedang",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				id = "yin_pengzhuang",
				fileName = "Se_Story_Impact_1",
				type = "Sound"
			},
			{
				resType = 0,
				name = "bg_zhedang",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 2000,
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
			},
			{
				id = "yin_zhuangfei",
				fileName = "Se_Skill_Coffin_Hits",
				type = "Sound"
			},
			{
				id = "yin_jian",
				fileName = "Se_Story_Impact_2",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 500,
				visible = false,
				id = "xiao_jian",
				scale = 1.3,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.32,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_yanwu",
				scale = 3,
				actionName = "Summon_buff",
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
				zorder = 1500,
				visible = false,
				id = "xiao_huiyi",
				scale = 1,
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
				zorder = 1999,
				videoName = "story_baozha",
				id = "xiao_baozha",
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
				layoutMode = 1,
				type = "MovieClip",
				zorder = 50,
				visible = false,
				id = "xiao_pengzhuang",
				scale = 2,
				actionName = "beiji_juqingtexiao",
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
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_sayounara_03a.actions.start_eventstory_sayounara_03a(_root, args)
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
			action = "activateNode",
			actor = __getnode__(_root, "bg_di")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_zhanchang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_juguai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_huiyi"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_zhandou"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
				args = function (_ctx)
					return {
						time = 1
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
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_jian"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.68,
							y = 0.5
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "xiao_jian"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
				args = function (_ctx)
					return {
						time = 1
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
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_WTXXuan",
						id = "WTXXuan",
						rotationX = 0,
						scale = 0.76,
						zorder = 135,
						position = {
							x = 0,
							y = -240,
							refpt = {
								x = 0.49,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "WTXXuan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "WTXXuan/WTXXuan_face_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "WTXXuan_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -32.5,
									y = 763
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "WTXXuan"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "WTXXuan"),
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
						modelId = "Model_SSQXin",
						id = "SSQXin",
						rotationX = 0,
						scale = 0.66,
						zorder = 135,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SSQXin_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SSXQian/SSXQian_face_4.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "SSQXin_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 28.5,
									y = 922
								}
							},
							{
								resType = 0,
								name = "SSQXin_biyan",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SSXQian/SSXQian_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1000,
								visible = false,
								id = "SSQXin_biyan",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 28.5,
									y = 922
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "SSQXin"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SSQXin"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_di"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "WTXXuan"),
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
					duration = 0.1
				}
			end
		}),
		sleep({
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WTXXuan"
					},
					content = {
						"eventstory_sayounara_03a_1"
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WTXXuan"
					},
					content = {
						"eventstory_sayounara_03a_2"
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "WTXXuan"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "WTXXuan"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -240,
							refpt = {
								x = 1.2,
								y = 0
							}
						}
					}
				end
			})
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
				actor = __getnode__(_root, "SSQXin"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SSQXin"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.51,
								y = 0
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
		act({
			action = "moveTo",
			actor = __getnode__(_root, "WTXXuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.51,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "WTXXuan"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SSQXin"
					},
					content = {
						"eventstory_sayounara_03a_3"
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
			action = "fadeOut",
			actor = __getnode__(_root, "SSQXin"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "WTXXuan"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WTXXuan"
					},
					content = {
						"eventstory_sayounara_03a_4"
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_YDZZong",
						id = "BoyYing",
						rotationX = 0,
						scale = 0.95,
						zorder = 135,
						position = {
							x = 0,
							y = -420,
							refpt = {
								x = 0.51,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BoyYing"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "WTXXuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BoyYing"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"BoyYing"
					},
					content = {
						"eventstory_sayounara_03a_5"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "WTXXuan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "WTXXuan/WTXXuan_face_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BoyYing"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "WTXXuan"),
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WTXXuan"
					},
					content = {
						"eventstory_sayounara_03a_6"
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"WTXXuan"
					},
					content = {
						"eventstory_sayounara_03a_7"
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhanchang"),
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "bg_zhanchang"),
			args = function (_ctx)
				return {
					zorder = 5
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_sayounara_03a_8"
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
			actor = __getnode__(_root, "bg_zhanchang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_juhou"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "bg_juguai"),
				args = function (_ctx)
					return {
						scale = 1.2,
						duration = 0.2
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
					}
				end
			}),
			rockScreen({
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
					}
				end
			})
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
			actor = __getnode__(_root, "yin_juhou")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_pengzhuang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "WTXXuan"),
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "WTXXuan"),
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "WTXXuan"),
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_pengzhuang")
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
					duration = 0.3
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "WTXXuan"),
			args = function (_ctx)
				return {
					duration = 0.3,
					position = {
						x = 0,
						y = -240,
						refpt = {
							x = 0.51,
							y = -0.25
						}
					}
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
			action = "fadeOut",
			actor = __getnode__(_root, "WTXXuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_juguai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "bg_zhanchang"),
			args = function (_ctx)
				return {
					zorder = 10
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "yan_bankai"),
			args = function (_ctx)
				return {
					zorder = 11
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					zorder = 12
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "yan_bankai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "yan_weikai"),
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
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_bankai"),
			args = function (_ctx)
				return {
					duration = 0.2
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
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_bankai"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_weikai"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
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
			action = "fadeOut",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_bankai"),
			args = function (_ctx)
				return {
					duration = 0.2
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
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_bankai"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_weikai"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
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
			action = "fadeOut",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_bankai"),
			args = function (_ctx)
				return {
					duration = 0.2
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_sayounara_03a_9"
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_bankai"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_weikai"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_YDZZong",
						id = "ChiBei1",
						rotationX = 0,
						scale = 0.95,
						zorder = 135,
						position = {
							x = 0,
							y = -420,
							refpt = {
								x = 0.31,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ChiBei1"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_YDZZong",
						id = "ChiBei2",
						rotationX = 0,
						scale = 0.95,
						zorder = 135,
						position = {
							x = 0,
							y = -420,
							refpt = {
								x = 0.71,
								y = 0
							}
						},
						children = {}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ChiBei2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ChiBei1"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ChiBei2"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		sleep({
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
					name = "Sayounara_dialog_speak_name_3",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_sayounara_03a_10"
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
					name = "Sayounara_dialog_speak_name_4",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_sayounara_03a_11"
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
			action = "play",
			actor = __getnode__(_root, "Mus_zhansi"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_bankai"),
			args = function (_ctx)
				return {
					duration = 0.2
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_sayounara_03a_12"
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			}),
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_bankai"),
					args = function (_ctx)
						return {
							duration = 0.1
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "yan_weikai"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ChiBei1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ChiBei2"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.005
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.005
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_sayounara_03a_13"
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0.5
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_sayounara_03a_14"
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_sayounara_03a_15"
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
			actor = __getnode__(_root, "yan_bankai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "yan_weikai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "SSQXin"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -280,
						refpt = {
							x = 0,
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
					duration = 0.2
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "SSQXin"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SSQXin"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.51,
								y = 0
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SSQXin"
					},
					content = {
						"eventstory_sayounara_03a_16"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "SSQXin_biyan"),
			args = function (_ctx)
				return {
					visible = true
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "opacityTo",
				actor = __getnode__(_root, "SSQXin_face"),
				args = function (_ctx)
					return {
						valend = 0,
						duration = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 1.5
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.5
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.0005
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.0005
				}
			end
		}),
		act({
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						255,
						255,
						255,
						255
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SSQXin"
					},
					content = {
						"eventstory_sayounara_03a_17"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.4
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhanchang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_haitan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SP_WTXXuan_stand",
						id = "sp_mcqdai",
						rotationX = 0,
						scale = 0.65,
						zorder = 135,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.28,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "sp_mcqdai_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/mcqdai_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "sp_mcqdai_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -55,
									y = 845
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_mcqdai"),
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
						modelId = "Model_SP_SSQXin_single",
						id = "sp_xmlhui",
						rotationX = 0,
						scale = 0.65,
						zorder = 130,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.77,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "sp_xmlhui_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_xmlhui/face_sp_xmlhui_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "sp_xmlhui_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -119.5,
									y = 1236
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_xmlhui"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_shiji"),
			args = function (_ctx)
				return {
					isLoop = true
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_huiyi")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_huiyi")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SSQXin"),
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
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_18"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "updateColor",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					color = {
						0,
						0,
						0,
						255
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_xmlhui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_xmlhui/face_sp_xmlhui_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_03a_19"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_20"
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
				actor = __getnode__(_root, "sp_xmlhui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_xmlhui/face_sp_xmlhui_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_03a_21"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_22"
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
				actor = __getnode__(_root, "sp_xmlhui_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_xmlhui/face_sp_xmlhui_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_03a_23"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_24"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_25"
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_MYan_2",
						id = "CB_Yuan",
						rotationX = 0,
						scale = 0.6,
						zorder = 130,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Yuan_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Yuan_Arm",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Yuan"),
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
						modelId = "Model_MYan_4",
						id = "CB_Dai",
						rotationX = 0,
						scale = 0.6,
						zorder = 135,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Dai_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Dai_Arm",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 2.5,
									y = 358
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Dai"),
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
						modelId = "Model_MYan_1",
						id = "CB_Xiong",
						rotationX = 0,
						scale = 0.6,
						zorder = 125,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Xiong_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Xiong_Arm",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 1.5,
									y = 358
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong"),
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
						modelId = "Model_MYan_3",
						id = "CB_Mu",
						rotationX = 0,
						scale = 0.6,
						zorder = 120,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CB_Mu_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CB_Mu_Arm",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -0.5,
									y = 359
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CB_Dai"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
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
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
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
			actor = __getnode__(_root, "CB_Mu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
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
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.32,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_26"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			})
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
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Mu_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Yuan_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Dai_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			})
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
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Mu_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Yuan_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Dai_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			})
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
			actor = __getnode__(_root, "sp_mcqdai_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/mcqdai_face_6.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_03a_27"
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
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
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Mu_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Yuan_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Dai_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.4
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.5
				}
			end
		}),
		concurrent({
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.35,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.2,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.65,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.8,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
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
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Mu_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Yuan_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Dai_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.2,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.2,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.2,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.2,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.8,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.8,
									y = 0
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.8,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.8,
									y = 0
								}
							}
						}
					end
				})
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0.08
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.5,
									y = 0
								}
							}
						}
					end
				})
			})
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
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_03a_28"
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_03a_29"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CB_Xiong"),
			args = function (_ctx)
				return {
					zorder = 150
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CB_Dai"),
			args = function (_ctx)
				return {
					zorder = 145
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					zorder = 140
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CB_Mu"),
			args = function (_ctx)
				return {
					zorder = 135
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "CB_Xiong"),
			args = function (_ctx)
				return {
					scale = 0.7,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "CB_Xiong"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
						refpt = {
							x = 0.5,
							y = -0.3
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Mu_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Yuan_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Dai_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Xiong_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
						pathType = "STORY_FACE"
					}
				end
			})
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		sequential({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.2,
								position = {
									x = 0,
									y = -15,
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
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.1,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.5,
										y = -0.1
									}
								}
							}
						end
					})
				}),
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.1,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.5,
										y = 0.45
									}
								}
							}
						end
					}),
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Dai"),
						args = function (_ctx)
							return {
								duration = 0.1,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.5,
										y = 0.35
									}
								}
							}
						end
					})
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.25,
									y = 0.1
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.75,
									y = 0.1
								}
							}
						}
					end
				})
			})
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
				actor = __getnode__(_root, "CB_Mu_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Yuan_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Dai_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Xiong_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm3.png",
						pathType = "STORY_FACE"
					}
				end
			})
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
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.18
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_03a_30"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_mcqdai"),
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
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.28,
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
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_31"
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_03a_32"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_33"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_34"
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
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_35"
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_xmlhui"
					},
					content = {
						"eventstory_sayounara_03a_36"
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
					duration = 0.6
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "Sayounara_dialog_speak_name_5",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						""
					},
					content = {
						"eventstory_sayounara_03a_37"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.32,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sp_mcqdai_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "Sayounara_dialog_speak_name_1",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_mcqdai"
						},
						content = {
							"eventstory_sayounara_03a_38"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.8
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
			action = "fadeOut",
			actor = __getnode__(_root, "sp_xmlhui"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_shiji")
		})
	})
end

local function eventstory_sayounara_03a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_sayounara_03a",
					scene = scene_eventstory_sayounara_03a
				}
			end
		})
	})
end

stories.eventstory_sayounara_03a = eventstory_sayounara_03a

return _M
