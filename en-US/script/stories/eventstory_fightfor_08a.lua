local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_fightfor_08a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_fightfor_08a = {
	actions = {}
}
scenes.scene_eventstory_fightfor_08a = scene_eventstory_fightfor_08a

function scene_eventstory_fightfor_08a:stage(args)
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
						name = "bg_shiyanshi",
						pathType = "SCENE",
						type = "Image",
						image = "scene_story_animal_1.jpg",
						layoutMode = 1,
						zorder = 50,
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
						name = "bg_liangzi",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_animal_2.jpg",
						layoutMode = 1,
						zorder = 45,
						id = "bg_liangzi",
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
						name = "bg_tiangong",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_animal_1.jpg",
						layoutMode = 1,
						zorder = 40,
						id = "bg_tiangong",
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
						name = "cg_wennuan",
						pathType = "SCENE",
						type = "Image",
						image = "scene_cg_animal_2.jpg",
						layoutMode = 1,
						zorder = 35,
						id = "cg_wennuan",
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
				id = "Mus_jieju",
				fileName = "Mus_Story_After_Battle",
				type = "Music"
			},
			{
				id = "Mus_liangzi",
				fileName = "Mus_Story_DeepSea_Main",
				type = "Music"
			},
			{
				id = "Mus_endfihgt",
				fileName = "Mus_Battle_Animal_Boss_2",
				type = "Music"
			},
			{
				id = "yin_posui",
				fileName = "Se_Story_Glass_Broken",
				type = "Sound"
			},
			{
				id = "yin_mowangbeida",
				fileName = "Voice_SLMen_29",
				type = "Sound"
			},
			{
				id = "yin_dazhong",
				fileName = "Se_Story_Impact_1",
				type = "Sound"
			},
			{
				id = "yin_luodi",
				fileName = "Se_Story_Smash_Body",
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
				scaleX = 4,
				zorder = 20,
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
				zorder = 100,
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
						x = 0.7,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1350,
				visible = false,
				id = "xiao_beida",
				scale = 0.7,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.4,
						y = 0.6
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_fightfor_08a.actions.start_eventstory_fightfor_08a(_root, args)
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
						zorder = 160,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.49,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "kxyuan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "kxyuan/face_kxyuan_1.png",
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
			}),
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
						zorder = 130,
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
						zorder = 140,
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_shiyanshi"),
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
						modelId = "Model_SLMen",
						id = "SLMen",
						rotationX = 0,
						scale = 0.7,
						zorder = 160,
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
								image = "SLMen/SLMen_face_3.png",
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
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_endfihgt"),
			args = function (_ctx)
				return {
					isLoop = true
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
				action = "play",
				actor = __getnode__(_root, "yin_dazhong"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_beida"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "SLMen"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
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
			actor = __getnode__(_root, "yin_dazhong")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_beida")
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_mowangbeida"),
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
							"eventstory_fightfor_08a_1"
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_BEr",
						id = "BEr",
						rotationX = 0,
						scale = 0.65,
						zorder = 150,
						position = {
							x = 0,
							y = -400,
							refpt = {
								x = 0.73,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "BEr_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "BEr/BEr_face_6.png",
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BEr"),
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
					name = "FightFor_dialog_speak_name_14",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"BEr"
					},
					content = {
						"eventstory_fightfor_08a_2"
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
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0
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
				action = "repeatUpDownStart",
				actor = __getnode__(_root, "kxyuan_hei"),
				args = function (_ctx)
					return {
						height = 1,
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
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_kuangbao"),
				args = function (_ctx)
					return {
						time = -1
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_2.png",
						pathType = "STORY_FACE"
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
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_08a_3"
						},
						durations = {
							0.1
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_08a_4"
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
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0
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
				action = "hide",
				actor = __getnode__(_root, "xiao_kuangbao")
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
						"eventstory_fightfor_08a_5"
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "BEr"),
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
					name = "FightFor_dialog_speak_name_14",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"BEr"
					},
					content = {
						"eventstory_fightfor_08a_6"
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
						"eventstory_fightfor_08a_7"
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
					name = "FightFor_dialog_speak_name_2",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"SLMen"
					},
					content = {
						"eventstory_fightfor_08a_8"
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0
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
				action = "play",
				actor = __getnode__(_root, "xiao_kuangbao"),
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
				action = "fadeOut",
				actor = __getnode__(_root, "kxyuan_bai"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "kxyuan_hei"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_kuangbao"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.2
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_5.png",
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
				action = "play",
				actor = __getnode__(_root, "yin_luodi"),
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
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_08a_9"
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_XDE",
						id = "sfei",
						rotationX = 0,
						scale = 0.5,
						zorder = 180,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.79,
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
			})
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
							x = 0.7,
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
					duration = 0
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.29,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0.8,
						duration = 0.2
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						time = -1
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
				action = "fadeIn",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.79,
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0,
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_08a_10"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_3.png",
						pathType = "STORY_FACE"
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
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_08a_11"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
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
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_08a_12"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_6.png",
						pathType = "STORY_FACE"
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
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_08a_13"
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
			actor = __getnode__(_root, "xiao_rumeng"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.5,
							y = 0.5
						}
					}
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
						image = "sfei/face_sfei_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
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
							"eventstory_fightfor_08a_14"
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
			actor = __getnode__(_root, "bg_liangzi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_tiangong"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg_wennuan"),
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
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0.8,
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
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.15,
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
						duration = 0.15
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.15,
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
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.15
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0,
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_shiyanshi"),
			args = function (_ctx)
				return {
					duration = 0.8
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_liangzi"),
			args = function (_ctx)
				return {
					isLoop = true
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0.8,
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
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.79,
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
						duration = 0.15
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.29,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						scale = 0.66,
						duration = 0.15
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0,
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_08a_15"
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
				action = "changeTexture",
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_6.png",
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
						image = "sfei/face_sfei_what_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_3.png",
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
							"eventstory_fightfor_08a_16"
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
						image = "sfei/face_sfei_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
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
							"eventstory_fightfor_08a_17"
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
						image = "sfei/face_sfei_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
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
							"eventstory_fightfor_08a_18"
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
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0.8,
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
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.55,
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
						duration = 0.15
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.55,
								y = 1.2
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.15
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0,
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
			action = "changeTexture",
			actor = __getnode__(_root, "kxyuan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "kxyuan/face_kxyuan_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
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
					image = "sfei/face_sfei_what_3.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_liangzi"),
			args = function (_ctx)
				return {
					duration = 0.9
				}
			end
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.9
				}
			end
		}),
		concurrent({
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0.8,
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
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.79,
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
						duration = 0.15
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.15,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.29,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						scale = 0.66,
						duration = 0.15
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0,
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
			action = "updateNode",
			actor = __getnode__(_root, "bg_liangzi"),
			args = function (_ctx)
				return {
					zorder = 38
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
						"eventstory_fightfor_08a_19"
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
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_08a_20"
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
						"eventstory_fightfor_08a_21"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
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
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_08a_22"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_2.png",
						pathType = "STORY_FACE"
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
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_08a_23"
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
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_1.png",
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
							"eventstory_fightfor_08a_24"
						},
						durations = {
							0.03
						}
					}
				end
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_liangzi"),
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_08a_25"
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
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0.8,
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
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.15,
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
						duration = 0.15
					}
				end
			})
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.15,
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
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						scale = 0,
						duration = 0.15
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
				action = "scaleTo",
				actor = __getnode__(_root, "xiao_rumeng"),
				args = function (_ctx)
					return {
						scale = 0,
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
					duration = 0.4
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_rumeng")
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_tiangong"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_jieju"),
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
						"eventstory_fightfor_08a_26"
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
						"eventstory_fightfor_08a_27"
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
					duration = 1
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "FightFor_dialog_speak_name_20",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_08a_28"
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
						"eventstory_fightfor_08a_29"
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
						"eventstory_fightfor_08a_30"
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
						"eventstory_fightfor_08a_31"
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
						"eventstory_fightfor_08a_32"
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
						"eventstory_fightfor_08a_33"
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
						"eventstory_fightfor_08a_34"
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
							"eventstory_fightfor_08a_35"
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
						"eventstory_fightfor_08a_36"
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
					name = "FightFor_dialog_speak_name_13",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"FightFor_dialog_speak_name_3"
					},
					content = {
						"eventstory_fightfor_08a_37"
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
						"eventstory_fightfor_08a_38"
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
							"eventstory_fightfor_08a_39"
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
						"eventstory_fightfor_08a_40"
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
			action = "stop",
			actor = __getnode__(_root, "Mus_jieju")
		})
	})
end

local function eventstory_fightfor_08a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_fightfor_08a",
					scene = scene_eventstory_fightfor_08a
				}
			end
		})
	})
end

stories.eventstory_fightfor_08a = eventstory_fightfor_08a

return _M
