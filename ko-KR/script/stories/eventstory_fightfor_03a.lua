local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_fightfor_03a")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_fightfor_03a = {
	actions = {}
}
scenes.scene_eventstory_fightfor_03a = scene_eventstory_fightfor_03a

function scene_eventstory_fightfor_03a:stage(args)
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
						name = "bg_tiangong",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_animal.jpg",
						layoutMode = 1,
						zorder = 15,
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
						},
						children = {
							{
								id = "bgEx_tiangong",
								layoutMode = 1,
								type = "MovieClip",
								scale = 1,
								actionName = "eff_cj_xinyuanyimiaochangjing",
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
					}
				}
			},
			{
				resType = 0,
				name = "zhedang",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 1000,
				id = "zhedang",
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
				id = "Mus_dasheng",
				fileName = "Mus_Battle_Animal_Normal",
				type = "Music"
			},
			{
				id = "Mus_zhandou",
				fileName = "Mus_Battle_Animal_Boss_1",
				type = "Music"
			},
			{
				id = "yin_dun",
				fileName = "Se_Story_Block_1",
				type = "Sound"
			},
			{
				id = "yin_lingya",
				fileName = "Se_Story_Animal_Tinnitus",
				type = "Sound"
			},
			{
				id = "yin_houzaizhan",
				fileName = "Voice_LEMHou_32",
				type = "Sound"
			},
			{
				id = "yin_mowangliqi",
				fileName = "Voice_SLMen_27",
				type = "Sound"
			},
			{
				id = "yin_maoyiwen",
				fileName = "Se_Story_Animal_Cat_Doubt",
				type = "Sound"
			},
			{
				id = "yin_mowangyihuo",
				fileName = "Voice_SLMen_44",
				type = "Sound"
			},
			{
				id = "yin_mowangdazhao",
				fileName = "Se_Skill_SLMen_Laser_7",
				type = "Sound"
			},
			{
				id = "yin_nvxixi",
				fileName = "Voice_YSTLu_22_1",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1350,
				visible = false,
				id = "xiao_gedang",
				scale = 0.45,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.45,
						y = 0.7
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 1000,
				visible = false,
				id = "xiao_hudun",
				scale = 4.5,
				actionName = "Shield_buff",
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
				scaleX = -1.5,
				zorder = 1000,
				type = "MovieClip",
				scaleY = 0.6,
				visible = false,
				id = "xiao_1mowanag",
				layoutMode = 1,
				actionName = "skill3_SLMen",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 1.65,
						y = 0.4
					}
				}
			},
			{
				scaleX = -1.5,
				zorder = 1000,
				type = "MovieClip",
				scaleY = 0.8,
				visible = false,
				id = "xiao_2mowanag",
				layoutMode = 1,
				actionName = "skill3_SLMen",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 1.65,
						y = 0.3
					}
				}
			},
			{
				scaleX = -1.5,
				zorder = 1000,
				type = "MovieClip",
				scaleY = 1,
				visible = false,
				id = "xiao_3mowanag",
				layoutMode = 1,
				actionName = "skill3_SLMen",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 1.65,
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
						x = 0.2,
						y = 0.5
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_fightfor_03a.actions.start_eventstory_fightfor_03a(_root, args)
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
			actor = __getnode__(_root, "hm"),
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
						modelId = "Model_XDE",
						id = "sfei",
						rotationX = 0,
						scale = 0.5,
						zorder = 170,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.84,
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
								x = 0.24,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "face_kongju",
								pathType = "STORY_FACE",
								type = "Image",
								image = "kxyuan/face_kxyuan_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 100,
								visible = true,
								id = "face_kongju",
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
			action = "play",
			actor = __getnode__(_root, "Mus_dasheng"),
			args = function (_ctx)
				return {
					isLoop = true
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
			action = "play",
			actor = __getnode__(_root, "bgEx_tiangong"),
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_03a_1"
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
						"eventstory_fightfor_03a_2"
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
							"sfei"
						},
						content = {
							"eventstory_fightfor_03a_3"
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
				action = "stop",
				actor = __getnode__(_root, "yin_maoyiwen")
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_5.png",
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
							"eventstory_fightfor_03a_4"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_03a_5"
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
							"eventstory_fightfor_03a_6"
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
						image = "sfei/face_sfei_6.png",
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
							"eventstory_fightfor_03a_7"
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_03a_8"
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
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_03a_9"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_03a_10"
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
						image = "sfei/face_sfei_what_5.png",
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
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_03a_11"
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
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_03a_12"
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
							"eventstory_fightfor_03a_13"
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
							"eventstory_fightfor_03a_14"
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
							"eventstory_fightfor_03a_15"
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
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_03a_16"
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
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_03a_17"
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
							"eventstory_fightfor_03a_18"
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_03a_19"
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
						"eventstory_fightfor_03a_20"
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
			action = "moveTo",
			actor = __getnode__(_root, "sfei"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0,
							y = 0
						}
					}
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgShow = false,
					printAudioOff = true,
					center = 1,
					content = {
						"eventstory_fightfor_03a_21"
					},
					durations = {
						0.1
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
				actor = __getnode__(_root, "yin_lingya"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "repeatRockStart",
				actor = __getnode__(_root, "bg_tiangong"),
				args = function (_ctx)
					return {
						height = 0.5,
						duration = 0.05
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_03a_22"
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
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.1
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
								x = 0.16,
								y = 0
							}
						}
					}
				end
			}),
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
								x = 0.74,
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
							"eventstory_fightfor_03a_23"
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
				action = "orbitCamera",
				actor = __getnode__(_root, "kxyuan"),
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
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.76,
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
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_03a_24"
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
							"eventstory_fightfor_03a_25"
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
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.74,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "repeatRockEnd",
				actor = __getnode__(_root, "bg_tiangong")
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
							"eventstory_fightfor_03a_26"
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
					name = "FightFor_dialog_speak_name_4",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"sfei"
					},
					content = {
						"eventstory_fightfor_03a_27"
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
						image = "sfei/face_sfei_what_5.png",
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
							"eventstory_fightfor_03a_28"
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
						image = "sfei/face_sfei_what_3.png",
						pathType = "STORY_FACE"
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
						deltaAngleZ = 0
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
								x = 0.34,
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
							"eventstory_fightfor_03a_29"
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
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.45,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = -0.4,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.45,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 1.4,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_lingya")
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
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
			action = "moveTo",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = 0,
							y = 0
						}
					}
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
			actor = __getnode__(_root, "kxyuan"),
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
					duration = 0.3
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
					name = "FightFor_dialog_speak_name_1",
					dialogImage = "animal_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					capInsets = "[550,128,2,1]",
					speakings = {
						"kxyuan"
					},
					content = {
						"eventstory_fightfor_03a_30"
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
			actor = __getnode__(_root, "kxyuan"),
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
						modelId = "Model_SLMen",
						id = "SLMen",
						rotationX = 0,
						scale = 0.7,
						zorder = 60,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.66,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SLMen_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SLMen/SLMen_face_1.png",
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
						"eventstory_fightfor_03a_31"
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
						"eventstory_fightfor_03a_32"
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
				action = "opacityTo",
				actor = __getnode__(_root, "kxyuan_face"),
				args = function (_ctx)
					return {
						valend = 0,
						duration = 0.9
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 0.9
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 0.9
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "zhedang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "kxyuan_face"),
			args = function (_ctx)
				return {
					visible = false
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "face_kongju"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "kxyuan/face_kxyuan_9.png",
					pathType = "STORY_FACE"
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
						id = "baoyuan",
						rotationX = 0,
						scale = 0.66,
						zorder = 10060,
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
								name = "huotong",
								pathType = "STORY_FACE",
								type = "Image",
								image = "kxyuan/face_kxyuan_9.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 100,
								visible = true,
								id = "huotong",
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
				actor = __getnode__(_root, "baoyuan"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "baoyuan"),
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
			action = "fadeOut",
			actor = __getnode__(_root, "curtain"),
			args = function (_ctx)
				return {
					duration = 0.2
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "baoyuan"),
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
						duration = 0.3
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
							"eventstory_fightfor_03a_33"
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
						duration = 0.3
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
							"eventstory_fightfor_03a_34"
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
						duration = 0.3
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
							"eventstory_fightfor_03a_35"
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
						duration = 0.4
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
							"eventstory_fightfor_03a_36"
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
						freq = 2,
						strength = 1
					}
				end
			})
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
						duration = 0.4
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
							"eventstory_fightfor_03a_37"
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
						freq = 2,
						strength = 1
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
						duration = 0.6
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
							"eventstory_fightfor_03a_38"
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
				action = "brightnessTo",
				actor = __getnode__(_root, "baoyuan"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0.8
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
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
			action = "fadeOut",
			actor = __getnode__(_root, "baoyuan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "zhedang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
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
			actor = __getnode__(_root, "qiqing_si")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "qiqing_bei")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "qiqing_you")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "kxyuan"),
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
						brightness = 255,
						modelId = "Model_LEMHou",
						id = "zhanti",
						rotationX = 0,
						scale = 1.2,
						zorder = 150,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.24,
								y = -0.54
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "zhanti"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "zhanti"),
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
						"eventstory_fightfor_03a_39"
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
			actor = __getnode__(_root, "kxyuan"),
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
						"eventstory_fightfor_03a_40"
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
						"eventstory_fightfor_03a_41"
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
		sleep({
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
					duration = 0.6
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_1mowanag"),
			args = function (_ctx)
				return {
					time = 1
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_mowangdazhao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.5,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.39,
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_1mowanag")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_mowangdazhao")
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
						"eventstory_fightfor_03a_42"
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
			actor = __getnode__(_root, "kxyuan"),
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
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_hudun"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_dun"),
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
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_gedang")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_hudun")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_dun")
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_gedang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.4,
							y = 0.5
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_hudun"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_dun"),
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
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_gedang")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_hudun")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_dun")
			})
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_gedang"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.5,
							y = 0.3
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_gedang"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_hudun"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "yin_dun"),
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
					duration = 0.2
				}
			end
		}),
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_gedang")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_hudun")
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "yin_dun")
			})
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
						"eventstory_fightfor_03a_43"
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
						"eventstory_fightfor_03a_44"
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
			actor = __getnode__(_root, "kxyuan"),
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
						"eventstory_fightfor_03a_45"
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
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_2mowanag"),
			args = function (_ctx)
				return {
					time = 1
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_mowangdazhao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.4,
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
			actor = __getnode__(_root, "xiao_2mowanag")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_mowangdazhao")
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
						"eventstory_fightfor_03a_46"
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
						"eventstory_fightfor_03a_47"
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
						name = "FightFor_dialog_speak_name_1",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"kxyuan"
						},
						content = {
							"eventstory_fightfor_03a_48"
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
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.4,
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
				action = "fadeIn",
				actor = __getnode__(_root, "zhanti"),
				args = function (_ctx)
					return {
						duration = 0.8
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "zhanti"),
				args = function (_ctx)
					return {
						scale = 0.66,
						duration = 0.4
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "zhanti"),
				args = function (_ctx)
					return {
						duration = 0.4,
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
				action = "fadeOut",
				actor = __getnode__(_root, "zhanti"),
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
				action = "changeTexture",
				actor = __getnode__(_root, "SLMen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SLMen/SLMen_face_5.png",
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
							"eventstory_fightfor_03a_49"
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
			action = "stop",
			actor = __getnode__(_root, "yin_mowangliqi")
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
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0.6
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "xiao_3mowanag"),
			args = function (_ctx)
				return {
					time = 1
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_mowangdazhao"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.3,
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
			actor = __getnode__(_root, "xiao_3mowanag")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_mowangdazhao")
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "face_kongju"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "kxyuan/face_kxyuan_7.png",
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
							"eventstory_fightfor_03a_50"
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
			action = "moveTo",
			actor = __getnode__(_root, "kxyuan"),
			args = function (_ctx)
				return {
					duration = 0.5,
					position = {
						x = 0,
						y = -425,
						refpt = {
							x = -0.4,
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
		concurrent({
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "kxyuan"),
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
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.26,
								y = 0
							}
						}
					}
				end
			})
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
							x = 1.4,
							y = 0
						}
					}
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
							x = 0.16,
							y = 0
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
					zorder = 200
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
					image = "sfei/face_sfei_what_4.png",
					pathType = "STORY_FACE"
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
				action = "moveTo",
				actor = __getnode__(_root, "kxyuan"),
				args = function (_ctx)
					return {
						duration = 0.8,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = -0.4,
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
					duration = 1
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SLMen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SLMen/SLMen_face_5.png",
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
							"eventstory_fightfor_03a_51"
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
				actor = __getnode__(_root, "what_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_what_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
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
							"sfei"
						},
						content = {
							"eventstory_fightfor_03a_52"
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
						image = "sfei/face_sfei_6.png",
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
							"eventstory_fightfor_03a_53"
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
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SLMen"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.62,
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
						name = "FightFor_dialog_speak_name_2",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"SLMen"
						},
						content = {
							"eventstory_fightfor_03a_54"
						},
						durations = {
							0.03
						}
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
				action = "changeTexture",
				actor = __getnode__(_root, "sfei_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "sfei/face_sfei_4.png",
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
				action = "moveTo",
				actor = __getnode__(_root, "sfei"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -425,
							refpt = {
								x = 0.09,
								y = 0
							}
						}
					}
				end
			}),
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
						name = "FightFor_dialog_speak_name_4",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"sfei"
						},
						content = {
							"eventstory_fightfor_03a_55"
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
						"eventstory_fightfor_03a_56"
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
						"eventstory_fightfor_03a_57"
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
						"eventstory_fightfor_03a_58"
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
							"eventstory_fightfor_03a_59"
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
								x = 0.2,
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
				actor = __getnode__(_root, "yin_mowangyihuo"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
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
						name = "FightFor_dialog_speak_name_2",
						dialogImage = "animal_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						capInsets = "[550,128,2,1]",
						speakings = {
							"SLMen"
						},
						content = {
							"eventstory_fightfor_03a_60"
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
				actor = __getnode__(_root, "SLMen_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SLMen/SLMen_face_5.png",
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
							"eventstory_fightfor_03a_61"
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
			actor = __getnode__(_root, "SLMen"),
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
			action = "stop",
			actor = __getnode__(_root, "Mus_zhandou")
		})
	})
end

local function eventstory_fightfor_03a(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_fightfor_03a",
					scene = scene_eventstory_fightfor_03a
				}
			end
		})
	})
end

stories.eventstory_fightfor_03a = eventstory_fightfor_03a

return _M
