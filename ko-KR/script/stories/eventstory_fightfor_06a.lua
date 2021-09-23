local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_fightfor_06a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_fightfor_06a = {
	actions = {}
}
scenes.scene_eventstory_fightfor_06a = scene_eventstory_fightfor_06a

function scene_eventstory_fightfor_06a:stage(args)
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
				children = {}
			},
			{
				resType = 0,
				name = "bg_shiyanshi",
				pathType = "SCENE",
				type = "Image",
				image = "scene_story_animal_1.jpg",
				layoutMode = 1,
				zorder = 15,
				id = "bg_shiyanshi",
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
				zorder = 100,
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
				resType = 0,
				name = "cg_baohu",
				pathType = "SCENE",
				type = "Image",
				image = "scene_cg_animal_1.jpg",
				layoutMode = 1,
				zorder = 20,
				id = "cg_baohu",
				scale = 1.5,
				anchorPoint = {
					x = 0.5,
					y = 0
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0
					}
				}
			},
			{
				resType = 0,
				name = "bg_xunhuan",
				pathType = "SCENE",
				type = "Image",
				image = "scene_cg_animal_1_bg.jpg",
				layoutMode = 1,
				zorder = 10,
				id = "bg_xunhuan",
				scale = 1,
				anchorPoint = {
					x = 0.5,
					y = 0
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0
					}
				}
			},
			{
				id = "Mus_weixian",
				fileName = "Mus_Story_Danger",
				type = "Music"
			},
			{
				id = "Mus_Boss",
				fileName = "Mus_Battle_Animal_Boss_2",
				type = "Music"
			},
			{
				id = "yin_dasheng",
				fileName = "Se_Story_Animal_Appear",
				type = "Sound"
			},
			{
				id = "yin_xintiao",
				fileName = "Se_Story_Animal_Heart_Slow",
				type = "Music"
			},
			{
				id = "yin_baohu",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				id = "yin_mowangliqi",
				fileName = "Voice_SLMen_27",
				type = "Sound"
			},
			{
				id = "yin_jian",
				fileName = "Se_Story_Impact_2",
				type = "Sound"
			},
			{
				id = "yin_maobeida",
				fileName = "Voice_XDE_29",
				type = "Sound"
			},
			{
				id = "yin_nvxixi",
				fileName = "Voice_YSTLu_22_1",
				type = "Sound"
			},
			{
				id = "yin_maopingdan",
				fileName = "Se_Story_Animal_Cat_Ordinary",
				type = "Sound"
			},
			{
				id = "yin_maoyiwen",
				fileName = "Se_Story_Animal_Cat_Doubt",
				type = "Sound"
			},
			{
				id = "yin_maojingya",
				fileName = "Se_Story_Animal_Cat_Amazed",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 2000,
				visible = false,
				id = "qiqing_you",
				scale = 0.3,
				actionName = "daojju_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.4,
						y = 0.4
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 2000,
				visible = false,
				id = "qiqing_si",
				scale = 0.3,
				actionName = "daojju_juqingtexiao",
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
				zorder = 2000,
				visible = false,
				id = "qiqing_bei",
				scale = 0.3,
				actionName = "daojju_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.35,
						y = 0.6
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 2000,
				visible = false,
				id = "qiqing_xi",
				scale = 0.3,
				actionName = "daojju_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.65,
						y = 0.6
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 2000,
				visible = false,
				id = "qiqing_jing",
				scale = 0.3,
				actionName = "daojju_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.45,
						y = 0.8
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 2000,
				visible = false,
				id = "qiqing_nu",
				scale = 0.3,
				actionName = "daojju_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.55,
						y = 0.8
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 111180,
				visible = false,
				id = "qiqing_ju",
				scale = 0.8,
				actionName = "Burning_buff",
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
			},
			{
				scaleX = 4,
				zorder = 210,
				type = "MovieClip",
				scaleY = 5,
				visible = false,
				id = "xiao_kuangbao",
				layoutMode = 1,
				actionName = "kuangbao_bufftexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.2
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 200,
				visible = false,
				id = "xiao_rumeng",
				scale = 0.1,
				actionName = "mengjingy_juqingtexiao",
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
				zorder = 13500,
				visible = false,
				id = "xiao_jian",
				scale = 1.1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.53,
						y = 0.4
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_fightfor_06a.actions.start_eventstory_fightfor_06a(_root, args)
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_shiyanshi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "hm"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_weixian"),
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
						modelId = "Model_YSTLu",
						id = "YSTLu",
						rotationX = 0,
						scale = 1,
						zorder = 260,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = 0.21,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "YSTLu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "YSTLu/YSTLu_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "YSTLu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 50,
									y = 679
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "YSTLu"),
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
						modelId = "Model_BEr",
						id = "BEr",
						rotationX = 0,
						scale = 0.65,
						zorder = 250,
						position = {
							x = 0,
							y = -400,
							refpt = {
								x = 0.63,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "BEr_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "BEr/BEr_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "BEr_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 207,
									y = 1406
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "BEr"),
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
						modelId = "Model_SLMen",
						id = "SLMen",
						rotationX = 0,
						scale = 0.7,
						zorder = 113100,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.52,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SLMen_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SLMen/SLMen_face_5.png",
								scaleX = 0.97,
								scaleY = 0.97,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "SLMen_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -45.5,
									y = 1156
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "SLMen"),
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
						modelId = "Model_XDE",
						id = "sfei",
						rotationX = 0,
						scale = 0.5,
						zorder = 260,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.41,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "what_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sfei/face_sfei_what_4.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1000,
								visible = true,
								id = "what_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -359.3,
									y = 1769.8
								}
							},
							{
								resType = 0,
								name = "sfei_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "sfei/face_sfei_8.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1200,
								visible = true,
								id = "sfei_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -205.4,
									y = 1711.8
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "sfei"),
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
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BEr"),
			args = function (_ctx)
				return {
					duration = 0
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_06a_1"
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
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "BEr"),
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sfei"),
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_06a_2"
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
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "SLMen"),
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
					name = "FightFor_dialog_speak_name_2",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"SLMen"
					},
					content = {
						"eventstory_fightfor_06a_3"
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
				actor = __getnode__(_root, "SLMen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SLMen/SLMen_face_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_2",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"SLMen"
						},
						content = {
							"eventstory_fightfor_06a_4"
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
			action = "fadeIn",
			actor = __getnode__(_root, "bg_xunhuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SLMen"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "sfei"),
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
				action = "changeTexture",
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_06a_5"
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_06a_6"
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
				action = "play",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0.8,
						duration = 0.3
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
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.5,
								y = 1.2
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.3
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.3
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
			action = "hide",
			actor = __getnode__(_root, "xiao_rumeng")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SLMen"),
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
				actor = __getnode__(_root, "yin_mowangliqi"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_2",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"SLMen"
						},
						content = {
							"eventstory_fightfor_06a_7"
						},
						durations = {
							0.03
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
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SLMen"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "stop",
			actor = __getnode__(_root, "yin_mowangliqi")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0.8,
						duration = 0.3
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
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.41,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						scale = 0.5,
						duration = 0.3
					}
				end
			})
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.3
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
			action = "hide",
			actor = __getnode__(_root, "xiao_rumeng")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_8.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_06a_8"
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_shiyanshi"),
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "BEr"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.2
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_14",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"BEr"
					},
					content = {
						"eventstory_fightfor_06a_9"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "sfei_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sfei/face_sfei_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "what_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "sfei/face_sfei_what_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_06a_10"
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
			actor = __getnode__(_root, "BEr"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "SLMen"),
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
					name = "FightFor_dialog_speak_name_2",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"SLMen"
					},
					content = {
						"eventstory_fightfor_06a_11"
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
			actor = __getnode__(_root, "SLMen"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "fadeIn",
				actor = __getnode__(_root, "BEr"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.2
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_12",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"YSTLu"
						},
						content = {
							"eventstory_fightfor_06a_12"
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
			action = "fadeOut",
			actor = __getnode__(_root, "BEr"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "SLMen"),
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
					name = "FightFor_dialog_speak_name_2",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"SLMen"
					},
					content = {
						"eventstory_fightfor_06a_13"
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
			actor = __getnode__(_root, "SLMen"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "fadeIn",
				actor = __getnode__(_root, "BEr"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.2
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
				action = "play",
				actor = __getnode__(_root, "yin_nvxixi"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_12",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"YSTLu"
						},
						content = {
							"eventstory_fightfor_06a_14"
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
				action = "moveTo",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = -0.2,
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_nvxixi")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "BEr"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -285,
						refpt = {
							x = 1.2,
							y = 0
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_LEMHou",
						id = "kxyuan",
						rotationX = 0,
						scale = 0.66,
						zorder = 140,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.09,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "kxyuan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "kxyuan/face_kxyuan_8.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "kxyuan_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -27.4,
									y = 1370.3
								}
							},
							{
								resType = 0,
								name = "dasheng_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "kxyuan/face_kxyuan_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1000,
								visible = true,
								id = "dasheng_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -27.4,
									y = 1370.3
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "kxyuan"),
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
			actor = __getnode__(_root, "kxyuan"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = 0.85,
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
					duration = 0.25
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0.31,
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
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_06a_15"
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
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "kxyuan"),
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sfei"),
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_06a_16"
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_06a_17"
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
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0
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
			actor = __getnode__(_root, "SLMen"),
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
					name = "FightFor_dialog_speak_name_2",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"SLMen"
					},
					content = {
						"eventstory_fightfor_06a_18"
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
			actor = __getnode__(_root, "SLMen"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "fadeIn",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.2
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_06a_19"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0.25,
						position = {
							x = 0,
							y = -285,
							refpt = {
								x = 0.7,
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
					duration = 0.1
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0.24,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		concurrent({
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
				actor = __getnode__(_root, "yin_jian"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian"),
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
			action = "stop",
			actor = __getnode__(_root, "yin_jian")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jian")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_maobeida"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.24,
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
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_06a_20"
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.24,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "YSTLu"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -285,
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
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_06a_21"
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_06a_22"
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
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "kxyuan"),
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "YSTLu"),
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
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_06a_23"
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
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "fadeIn",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.2
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_06a_24"
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
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "kxyuan"),
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
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "YSTLu"),
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
					name = "FightFor_dialog_speak_name_12",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"YSTLu"
					},
					content = {
						"eventstory_fightfor_06a_25"
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
			actor = __getnode__(_root, "YSTLu"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "fadeIn",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.2
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
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_06a_26"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "cg_baohu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "qiqing_ju"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_weixian")
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
			action = "play",
			actor = __getnode__(_root, "yin_xintiao"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "volume",
			actor = __getnode__(_root, "yin_xintiao"),
			args = function (_ctx)
				return {
					volumeend = 0.6,
					duration = 0.01,
					volumebegin = 0,
					type = "music"
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.01
				}
			end
		}),
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_15",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"FightFor_dialog_speak_name_3"
						},
						content = {
							"eventstory_fightfor_06a_27"
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
					name = "FightFor_dialog_speak_name_15",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_28"
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
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 1.4,
						duration = 0.8
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
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 0.6,
						duration = 0.8
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_16",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_29"
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
				actor = __getnode__(_root, "SLMen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SLMen/SLMen_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_16",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"FightFor_dialog_speak_name_3"
						},
						content = {
							"eventstory_fightfor_06a_30"
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
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 1.2,
						duration = 0.6
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
			action = "fadeIn",
			actor = __getnode__(_root, "SLMen"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_17",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"SLMen"
					},
					content = {
						"eventstory_fightfor_06a_31"
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
			actor = __getnode__(_root, "SLMen"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 0.2,
						duration = 0.8
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_18",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_32"
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
					name = "FightFor_dialog_speak_name_18",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_33"
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
						name = "FightFor_dialog_speak_name_18",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"FightFor_dialog_speak_name_3"
						},
						content = {
							"eventstory_fightfor_06a_34"
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
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 1.5,
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
			action = "fadeIn",
			actor = __getnode__(_root, "SLMen"),
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
					name = "FightFor_dialog_speak_name_17",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"SLMen"
					},
					content = {
						"eventstory_fightfor_06a_35"
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
			actor = __getnode__(_root, "SLMen"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "stop",
				actor = __getnode__(_root, "yin_xintiao")
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.8
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_19",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_36"
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
					name = "FightFor_dialog_speak_name_19",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_37"
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
					name = "FightFor_dialog_speak_name_19",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_38"
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
					duration = 0.5
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
			action = "play",
			actor = __getnode__(_root, "yin_xintiao"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		act({
			action = "volume",
			actor = __getnode__(_root, "yin_xintiao"),
			args = function (_ctx)
				return {
					volumeend = 0.6,
					duration = 0.01,
					volumebegin = 0,
					type = "music"
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.01
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
						"eventstory_fightfor_06a_39"
					},
					durations = {
						0.09
					},
					waitTimes = {
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
						"eventstory_fightfor_06a_40"
					},
					durations = {
						0.09
					},
					waitTimes = {
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
						"eventstory_fightfor_06a_41",
						"eventstory_fightfor_06a_42"
					},
					durations = {
						0.09,
						0.09
					},
					waitTimes = {
						1.2,
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0.49,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					zorder = 111160
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = -255,
						modelId = "Model_LEMHou",
						id = "kxyuan_hei",
						rotationX = 0,
						scale = 0.66,
						zorder = 111130,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.49,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "kxyuan_hei"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "kxyuan_hei"),
				args = function (_ctx)
					return {
						angleZ = 0,
						time = 0,
						deltaAngleZ = 180
					}
				end
			}),
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = 255,
						modelId = "Model_LEMHou",
						id = "kxyuan_bai",
						rotationX = 0,
						scale = 0.66,
						zorder = 111140,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.49,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "kxyuan_bai"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "kxyuan_bai"),
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
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 1.5,
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "qiqing_you"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_you"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.8
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
				actor = __getnode__(_root, "qiqing_si"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_si"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.8
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
				actor = __getnode__(_root, "qiqing_bei"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_bei"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.8
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
				actor = __getnode__(_root, "qiqing_xi"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_xi"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.8
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
				actor = __getnode__(_root, "qiqing_jing"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_jing"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.8
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
				actor = __getnode__(_root, "qiqing_nu"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_nu"),
				args = function (_ctx)
					return {
						scale = 1.5,
						duration = 0.8
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
				action = "moveTo",
				actor = __getnode__(_root, "qiqing_you"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							refpt = {
								x = 0.5,
								y = 0.6
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_you"),
				args = function (_ctx)
					return {
						scale = 0.1,
						duration = 0.3
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "qiqing_si"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							refpt = {
								x = 0.5,
								y = 0.6
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_si"),
				args = function (_ctx)
					return {
						scale = 0.1,
						duration = 0.3
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "qiqing_bei"),
				args = function (_ctx)
					return {
						duration = 0.3,
						position = {
							refpt = {
								x = 0.5,
								y = 0.6
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_bei"),
				args = function (_ctx)
					return {
						scale = 0.1,
						duration = 0.3
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 2,
						duration = 0.4
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
				action = "moveTo",
				actor = __getnode__(_root, "qiqing_xi"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							refpt = {
								x = 0.5,
								y = 0.6
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_xi"),
				args = function (_ctx)
					return {
						scale = 0.1,
						duration = 0.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "qiqing_jing"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							refpt = {
								x = 0.5,
								y = 0.6
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_jing"),
				args = function (_ctx)
					return {
						scale = 0.1,
						duration = 0.5
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 2.5,
						duration = 0.6
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
				action = "moveTo",
				actor = __getnode__(_root, "qiqing_nu"),
				args = function (_ctx)
					return {
						duration = 0.7,
						position = {
							refpt = {
								x = 0.5,
								y = 0.6
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_nu"),
				args = function (_ctx)
					return {
						scale = 0.1,
						duration = 0.7
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 4,
						duration = 0.7
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
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan"),
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
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan_bai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan_hei"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "opacityTo",
			actor = __getnode__(_root, "kxyuan_face"),
			args = function (_ctx)
				return {
					valend = 0,
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						duration = 0.6,
						position = {
							refpt = {
								x = 0.5,
								y = 0.78
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "qiqing_ju"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.6
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 1.2
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "dasheng_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_kuangbao"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "kxyuan_hei"),
				args = function (_ctx)
					return {
						height = 0.5,
						duration = 0.02
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "kxyuan_bai"),
				args = function (_ctx)
					return {
						height = 1,
						duration = 0.02
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
			action = "stop",
			actor = __getnode__(_root, "yin_xintiao")
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "kxyuan_hei")
		}),
		act({
			action = "repeatRockEnd",
			actor = __getnode__(_root, "kxyuan_bai")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan_bai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan_hei"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_kuangbao")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "qiqing_ju")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "qiqing_nu")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "qiqing_jing")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "qiqing_xi")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "qiqing_bei")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "qiqing_si")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "qiqing_you")
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
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_3",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"FightFor_dialog_speak_name_3"
						},
						content = {
							"eventstory_fightfor_06a_43"
						},
						durations = {
							0.03
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_baohu"),
				args = function (_ctx)
					return {
						time = 1
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
			action = "play",
			actor = __getnode__(_root, "yin_dasheng"),
			args = function (_ctx)
				return {
					time = 1
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_baohu")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_zhedang"),
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 3
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_Boss"),
			args = function (_ctx)
				return {
					isLoop = true
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_44"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_45"
					},
					durations = {
						0.03
					}
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_baohu")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_46"
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
				actor = __getnode__(_root, "yin_maoyiwen"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_5",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"FightFor_dialog_speak_name_3"
						},
						content = {
							"eventstory_fightfor_06a_47"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_maojingya")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_48"
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
				actor = __getnode__(_root, "yin_maopingdan"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_5",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"FightFor_dialog_speak_name_3"
						},
						content = {
							"eventstory_fightfor_06a_49"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_maopingdan")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_50"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_51"
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_06a_52"
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_06a_53"
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
				action = "scaleTo",
				actor = __getnode__(_root, "cg_baohu"),
				args = function (_ctx)
					return {
						scale = 0.85,
						duration = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "cg_baohu"),
				args = function (_ctx)
					return {
						duration = 1,
						position = {
							refpt = {
								x = 0.5,
								y = -0.07
							}
						}
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
		concurrent({
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_06a_54"
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
		sleep({
			args = function (_ctx)
				return {
					duration = 2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "curtain"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan_bai"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan_hei"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_kuangbao")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_Boss")
		})
	})
end

local function eventstory_fightfor_06a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_fightfor_06a",
					scene = scene_eventstory_fightfor_06a
				}
			end
		})
	})
end

stories.eventstory_fightfor_06a = eventstory_fightfor_06a

return _M
