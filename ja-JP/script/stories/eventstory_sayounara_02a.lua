local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_sayounara_02a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_sayounara_02a = {
	actions = {}
}
scenes.scene_eventstory_sayounara_02a = scene_eventstory_sayounara_02a

function scene_eventstory_sayounara_02a:stage(args)
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
						name = "bg_zhanchang",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_fireworks_1.jpg",
						layoutMode = 1,
						zorder = 10,
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
						name = "bg_shiji",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_7_4.jpg",
						layoutMode = 1,
						zorder = 15,
						id = "bg_shiji",
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
						name = "bg_zhuanchang",
						pathType = "SCENE",
						type = "Image",
						image = "bg_story_scene_7_4.jpg",
						layoutMode = 1,
						zorder = 13,
						id = "bg_zhuanchang",
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
						name = "bg_di",
						pathType = "STORY_ROOT",
						type = "Image",
						image = "hm.png",
						layoutMode = 1,
						zorder = 1,
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
				fileName = "Mus_Story_After_Battle",
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
				id = "xiao_bianshen1",
				scale = 3,
				actionName = "Summon_buff",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.05,
						y = 0.4
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 500,
				visible = false,
				id = "xiao_bianshen2",
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
				zorder = 500,
				visible = false,
				id = "xiao_bianshen3",
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
				zorder = 500,
				visible = false,
				id = "xiao_bianshen4",
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
				zorder = 500,
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
				zorder = 999,
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
				zorder = 9999,
				visible = false,
				id = "xiao_pengzhuang",
				scale = 0.7,
				actionName = "beiji_juqingtexiao",
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
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_sayounara_02a.actions.start_eventstory_sayounara_02a(_root, args)
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.1
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
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
						0,
						0,
						255
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
						"eventstory_sayounara_02a_1"
					},
					durations = {
						0.07
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
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.05
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.05
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
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "yin_siyao"),
			args = function (_ctx)
				return {
					time = 1
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
				action = "play",
				actor = __getnode__(_root, "yin_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_siyao"),
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
					duration = 0.8
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_siyao"),
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
					duration = 0.6
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SSQXin",
						id = "SSQXin",
						rotationX = 0,
						scale = 1.11,
						zorder = 135,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.69,
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
									x = 25,
									y = 678
								}
							}
						}
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_WTXXuan",
						id = "WTXXuan",
						rotationX = 0,
						scale = 0.915,
						zorder = 140,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 0.29,
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
									x = -31.9,
									y = 650
								}
							}
						}
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
			})
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
			action = "fadeIn",
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
					duration = 0.2
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
					name = "Sayounara_dialog_speak_name_2",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SSQXin"
					},
					content = {
						"eventstory_sayounara_02a_2"
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
						"eventstory_sayounara_02a_3"
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
						"SSQXin"
					},
					content = {
						"eventstory_sayounara_02a_4"
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
						"eventstory_sayounara_02a_5"
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
						"SSQXin"
					},
					content = {
						"eventstory_sayounara_02a_6"
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
				actor = __getnode__(_root, "WTXXuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "WTXXuan/WTXXuan_face_4.png",
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
							"WTXXuan"
						},
						content = {
							"eventstory_sayounara_02a_7"
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
				actor = __getnode__(_root, "WTXXuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "WTXXuan/WTXXuan_face_1.png",
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
							"WTXXuan"
						},
						content = {
							"eventstory_sayounara_02a_8"
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
				action = "moveTo",
				actor = __getnode__(_root, "WTXXuan"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							x = 0,
							y = -200,
							refpt = {
								x = 1.3,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "WTXXuan"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "SSQXin"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.69,
									y = 0
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
					action = "moveTo",
					actor = __getnode__(_root, "SSQXin"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								x = 0,
								y = -330,
								refpt = {
									x = 0.71,
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
					duration = 0.8
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
						"eventstory_sayounara_02a_9"
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
			actor = __getnode__(_root, "xiao_baozha"),
			args = function (_ctx)
				return {
					time = 1
				}
			end
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
				action = "updateNode",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						opacity = 0
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
			})
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SP_WTXXuan",
						id = "JunShen",
						rotationX = 0,
						scale = 0.5,
						zorder = 135,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.49,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "JunShen_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/mcqdai_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "JunShen_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 34.5,
									y = 1344
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "JunShen"),
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
						modelId = "Model_MYan_2",
						id = "CB_Yuan",
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
								name = "CB_Yuan_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
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
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
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
						scale = 0.65,
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
								name = "CB_Xiong_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
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
								name = "CB_Mu_Arm",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sp_mcqdai/sp_mcqdai_myan_arm1.png",
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
						zorder = 135,
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_shiji"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_zhuanchang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_huiyi")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_baozha")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_huiyi")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_baozha")
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
							"eventstory_sayounara_02a_10"
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
						"eventstory_sayounara_02a_11"
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
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_02a_12"
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
							"eventstory_sayounara_02a_13"
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
							"eventstory_sayounara_02a_14"
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
							"eventstory_sayounara_02a_15"
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
							"eventstory_sayounara_02a_16"
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
				action = "rock",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						freq = 6,
						strength = 2
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
							"eventstory_sayounara_02a_17"
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
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "sp_xmlhui_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_xmlhui/face_sp_xmlhui_2.png",
					pathType = "STORY_FACE"
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
							"eventstory_sayounara_02a_18"
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
						"eventstory_sayounara_02a_19"
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
						"eventstory_sayounara_02a_20"
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
							"eventstory_sayounara_02a_21"
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
						"eventstory_sayounara_02a_22"
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
				actor = __getnode__(_root, "sp_xmlhui"),
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
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.63,
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
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_02a_23"
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
							"eventstory_sayounara_02a_24"
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
			action = "moveTo",
			actor = __getnode__(_root, "CB_Xiong"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
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
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
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
			actor = __getnode__(_root, "CB_Mu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
						refpt = {
							x = 1,
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
					duration = 0,
					position = {
						x = 0,
						y = -15,
						refpt = {
							x = 1,
							y = 0
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
					zorder = 120
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					zorder = 120
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CB_Mu"),
			args = function (_ctx)
				return {
					zorder = 120
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "CB_Dai"),
			args = function (_ctx)
				return {
					zorder = 120
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_shiji"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							refpt = {
								x = 0,
								y = 0.5
							}
						}
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bg_shiji"),
				args = function (_ctx)
					return {
						duration = 0.5
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
			action = "fadeIn",
			actor = __getnode__(_root, "CB_Xiong"),
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.18
				}
			end
		}),
		concurrent({
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
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Xiong_Arm"),
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
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		concurrent({
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
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		concurrent({
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
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.16
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
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.25,
									y = 0.05
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
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.25,
									y = 0.05
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
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.25,
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
					duration = 0.32
				}
			end
		}),
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
								x = 0.55,
								y = 0
							}
						}
					}
				end
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
					action = "play",
					actor = __getnode__(_root, "yin_pengzhuang"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 1.2,
									y = 0
								}
							}
						}
					end
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
										x = 0.35,
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
										x = 0.25,
										y = 0
									}
								}
							}
						end
					})
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "CB_Yuan"),
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
					duration = 0.4
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_pengzhuang")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_pengzhuang")
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.75,
								y = 0
							}
						}
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
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
			}),
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
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Xiong_Arm"),
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
				actor = __getnode__(_root, "CB_Mu_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		concurrent({
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
			}),
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
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
				}
			end
		}),
		concurrent({
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
			}),
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
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.16
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
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.25,
									y = 0.08
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
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
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
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.25,
									y = 0.08
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
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.25,
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
					duration = 0.32
				}
			end
		}),
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
								x = 0.55,
								y = 0
							}
						}
					}
				end
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
					action = "play",
					actor = __getnode__(_root, "yin_pengzhuang"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Mu"),
					args = function (_ctx)
						return {
							duration = 0.2,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 1.2,
									y = 0
								}
							}
						}
					end
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
										x = 0.35,
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
										x = 0.25,
										y = 0
									}
								}
							}
						end
					})
				}),
				act({
					action = "fadeOut",
					actor = __getnode__(_root, "CB_Mu"),
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
					duration = 0.4
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_pengzhuang")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_pengzhuang")
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.75,
								y = 0
							}
						}
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		concurrent({
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
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.07
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Xiong_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
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
			action = "changeTexture",
			actor = __getnode__(_root, "CB_Dai_Arm"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.07
				}
			end
		}),
		concurrent({
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
			}),
			concurrent({
				sequential({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "CB_Xiong"),
						args = function (_ctx)
							return {
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.07
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "CB_Xiong_Arm"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/sp_mcqdai_myan_arm2.png",
						pathType = "STORY_FACE"
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
										y = 0.08
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
								duration = 0.08,
								position = {
									x = 0,
									y = -15,
									refpt = {
										x = 0.25,
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
										x = 0.75,
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
										x = 0.75,
										y = 0
									}
								}
							}
						end
					})
				})
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.16
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
							duration = 0.06,
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
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.06,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.17,
									y = 0
								}
							}
						}
					end
				})
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_pengzhuang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.3,
							y = 0.4
						}
					}
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
			action = "orbitCamera",
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.12
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Yuan"),
					args = function (_ctx)
						return {
							duration = 0.3,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.45,
									y = 0
								}
							}
						}
					end
				}),
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
					action = "play",
					actor = __getnode__(_root, "yin_zhuangfei"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "CB_Xiong"),
					args = function (_ctx)
						return {
							duration = 0.15,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = -0.3,
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
					duration = 0.45
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_pengzhuang")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_zhuangfei")
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "CB_Yuan"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.05
				}
			end
		}),
		concurrent({
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
									x = 0.45,
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
									x = 0.45,
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
									x = 0.45,
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
									x = 0.45,
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
					duration = 0.4
				}
			end
		}),
		concurrent({
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
					actor = __getnode__(_root, "CB_Dai"),
					args = function (_ctx)
						return {
							duration = 0.08,
							position = {
								x = 0,
								y = -15,
								refpt = {
									x = 0.75,
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
									x = 0.75,
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
									x = 0.75,
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
									x = 0.75,
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
					duration = 0.32
				}
			end
		}),
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
		concurrent({
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
				actor = __getnode__(_root, "CB_Yuan"),
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
						"eventstory_sayounara_02a_25"
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
				actor = __getnode__(_root, "sp_xmlhui"),
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
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.77,
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
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_02a_26"
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
						"eventstory_sayounara_02a_27"
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
						"eventstory_sayounara_02a_28"
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
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_02a_29"
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
						name = "Sayounara_dialog_speak_name_2",
						dialogImage = "jq_dialogue_bg_1.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"sp_xmlhui"
						},
						content = {
							"eventstory_sayounara_02a_30"
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_02a_31"
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
							"eventstory_sayounara_02a_32"
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
							"eventstory_sayounara_02a_33"
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
						image = "sp_mcqdai/mcqdai_face_1.png",
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
							"eventstory_sayounara_02a_34"
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
					name = "Sayounara_dialog_speak_name_1",
					dialogImage = "jq_dialogue_bg_1.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"sp_mcqdai"
					},
					content = {
						"eventstory_sayounara_02a_35"
					},
					durations = {
						0.03
					}
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
			action = "moveTo",
			actor = __getnode__(_root, "CB_Dai"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -15,
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
			actor = __getnode__(_root, "CB_Dai"),
			args = function (_ctx)
				return {
					zorder = 150
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
							"eventstory_sayounara_02a_36"
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
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0
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
								x = 0.05,
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
						duration = 0.1,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.1,
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
						duration = 0.1,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.05,
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0
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
								x = 0.8,
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
						duration = 0,
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
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.4,
								y = -0.2
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						zorder = 150
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						zorder = 155
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						zorder = 145
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						zorder = 140
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_bianshen1"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.12,
								y = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_bianshen2"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.2,
								y = 0.4
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_bianshen3"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.4,
								y = 0.3
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiao_bianshen4"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							refpt = {
								x = 0.8,
								y = 0.6
							}
						}
					}
				end
			})
		}),
		concurrent({
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
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -15,
							refpt = {
								x = 0.12,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sp_mcqdai"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.52,
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
				action = "play",
				actor = __getnode__(_root, "xiao_bianshen1"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Dai"),
				args = function (_ctx)
					return {
						duration = 0.3
					}
				end
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
			action = "hide",
			actor = __getnode__(_root, "xiao_bianshen1")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_bianshen1")
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.25
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.25
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
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Mu"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Xiong"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CB_Yuan"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_bianshen2"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_bianshen3"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_bianshen4"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.7
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
			action = "fadeOut",
			actor = __getnode__(_root, "sp_mcqdai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "JunShen"),
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
			action = "hide",
			actor = __getnode__(_root, "xiao_bianshen1")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_bianshen2")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_bianshen3")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_bianshen4")
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "JunShen_face"),
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
							"JunShen"
						},
						content = {
							"eventstory_sayounara_02a_37"
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
				actor = __getnode__(_root, "JunShen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sp_mcqdai/mcqdai_face_6.png",
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
							"JunShen"
						},
						content = {
							"eventstory_sayounara_02a_38"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sp_xmlhui"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -340,
						refpt = {
							x = 1,
							y = 0
						}
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
				action = "moveTo",
				actor = __getnode__(_root, "JunShen"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -160,
							refpt = {
								x = 0.3,
								y = -0.2
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "JunShen"),
				args = function (_ctx)
					return {
						scale = 0.58,
						duration = 0.3
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "JunShen"),
				args = function (_ctx)
					return {
						duration = 0.3
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
				action = "moveTo",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -340,
							refpt = {
								x = 0.57,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "sp_xmlhui"),
				args = function (_ctx)
					return {
						duration = 0.1
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
							"eventstory_sayounara_02a_39"
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
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "sp_xmlhui_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sp_xmlhui/face_sp_xmlhui_2.png",
					pathType = "STORY_FACE"
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
							"eventstory_sayounara_02a_40"
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
			action = "stop",
			actor = __getnode__(_root, "Mus_shiji")
		})
	})
end

local function eventstory_sayounara_02a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_sayounara_02a",
					scene = scene_eventstory_sayounara_02a
				}
			end
		})
	})
end

stories.eventstory_sayounara_02a = eventstory_sayounara_02a

return _M
