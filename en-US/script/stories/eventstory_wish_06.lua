local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_wish_06")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_wish_06 = {
	actions = {}
}
scenes.scene_eventstory_wish_06 = scene_eventstory_wish_06

function scene_eventstory_wish_06:stage(args)
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
						name = "bg_mengjing",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_silentnight_1.jpg",
						layoutMode = 1,
						zorder = 50,
						id = "bg_mengjing",
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
						name = "bg_shangquan",
						pathType = "SCENE",
						type = "Image",
						image = "anualshop_scene_main_christmas.jpg",
						layoutMode = 1,
						zorder = 45,
						id = "bg_shangquan",
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
				name = "zhuanchang",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "hm.png",
				layoutMode = 1,
				zorder = 10000,
				id = "zhuanchang",
				scale = 1,
				anchorPoint = {
					x = 1,
					y = 0.5
				},
				position = {
					refpt = {
						x = 1,
						y = 0.5
					}
				}
			},
			{
				id = "Mus_mengjingbenghuai",
				fileName = "Mus_Main_Scene_Destory",
				type = "Music"
			},
			{
				id = "Mus_pingan",
				fileName = "Mus_Story_SilentNight",
				type = "Music"
			},
			{
				id = "yin_ximadazhao",
				fileName = "Voice_XXFSi_28",
				type = "Sound"
			},
			{
				id = "yin_ximaai",
				fileName = "Voice_XXFSi_10",
				type = "Sound"
			},
			{
				id = "yin_aida",
				fileName = "Se_Story_Bodyfall",
				type = "Sound"
			},
			{
				id = "yin_ludaofuxingfen",
				fileName = "Se_Story_SilentNight_Happy",
				type = "Sound"
			},
			{
				id = "yin_ludaofulaolei",
				fileName = "Se_Story_SilentNight_Effete",
				type = "Sound"
			},
			{
				id = "yin_ludaofujingxia",
				fileName = "Se_Story_SilentNight_Shocked",
				type = "Sound"
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10,
				visible = false,
				id = "xiao_rumeng",
				scale = 0,
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
				visible = false,
				type = "VideoSprite",
				zorder = 99999,
				videoName = "story_baozha",
				id = "xiao_baozha",
				scale = 1.15,
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.4,
						y = 0.52
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_guangmang",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
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

function scene_eventstory_wish_06.actions.start_eventstory_wish_06(_root, args)
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
					duration = 0.2
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_mengjing"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_shangquan"),
			args = function (_ctx)
				return {
					duration = 0
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_SNGLSi_Elk2",
						scaleX = 0.5,
						id = "mengyan",
						rotationX = 0,
						zorder = 100000,
						scaleY = 1,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "monster",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/portraitpic_Monster_Normal.png",
								scaleX = 1.8,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "monster",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -80,
									y = 114.42
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "mengyan"),
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
						modelId = "Model_Story_SNGLSi_Elk2",
						scaleX = 0.5,
						id = "mengyan2",
						rotationX = 0,
						zorder = 100000,
						scaleY = 1,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "monster2",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/portraitpic_Monster_Normal.png",
								scaleX = 1.8,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "monster2",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -80,
									y = 114.42
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "mengyan2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "mengyan"),
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
			actor = __getnode__(_root, "Mus_mengjingbenghuai"),
			args = function (_ctx)
				return {
					isLoop = true
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
				action = "rock",
				actor = __getnode__(_root, "mengyan"),
				args = function (_ctx)
					return {
						freq = 4,
						strength = 1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_11",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mengyan"
						},
						content = {
							"eventstory_wish_06_1"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
			actor = __getnode__(_root, "mengyan"),
			args = function (_ctx)
				return {
					duration = 0.1
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_XXFSi",
						id = "xma",
						rotationX = 0,
						scale = 0.7,
						zorder = 100,
						position = {
							x = 0,
							y = -455,
							refpt = {
								x = -0.2,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "xma_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "xma/xma_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "xma_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -17,
									y = 1284
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xma"),
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
						modelId = "Model_SNGLSi_single",
						id = "bni",
						rotationX = 0,
						scale = 0.75,
						zorder = 150,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 1.2,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "bni_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/bni_face_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "bni_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 0,
									y = 898
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "bni"),
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
						modelId = "Model_SNGLSi_Rudolph",
						id = "ldfu",
						rotationX = 0,
						scale = 0.4,
						zorder = 200,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 1,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ldfu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/face_bni_rudolph_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1000,
								visible = true,
								id = "ldfu_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -84.7,
									y = 384.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						opacity = 0
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
				action = "fadeIn",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -455,
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
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.55,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0.4,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.75,
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
					name = "MyWish_dialog_speak_name_9",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xma"
					},
					content = {
						"eventstory_wish_06_2"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_wish_06_3"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_1",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"bni",
						"ldfu"
					},
					content = {
						"eventstory_wish_06_4"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_ludaofuxingfen"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						freq = 4,
						strength = 1
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "xma"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bni"),
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
					bgImage = "gallery_album_01.jpg",
					printAudioOff = true,
					bgShow = false,
					center = 1,
					content = {
						"eventstory_wish_06_5",
						"eventstory_wish_06_6",
						"eventstory_wish_06_7"
					},
					durations = {
						0.08,
						0.08,
						0.1
					},
					waitTimes = {
						1,
						1,
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
			action = "moveTo",
			actor = __getnode__(_root, "mengyan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
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
			actor = __getnode__(_root, "mengyan2"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
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
			actor = __getnode__(_root, "mengyan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "mengyan2"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_baozha"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "mengyan"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "mengyan"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "mengyan"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "mengyan2"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "mengyan2"),
				args = function (_ctx)
					return {
						freq = 3,
						strength = 1
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "mengyan2"),
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
					duration = 0.8
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "mengyan"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "mengyan2"),
				args = function (_ctx)
					return {
						duration = 0.15
					}
				end
			}),
			act({
				action = "stop",
				actor = __getnode__(_root, "xiao_baozha")
			}),
			act({
				action = "hide",
				actor = __getnode__(_root, "xiao_baozha")
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_11",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"mengyan"
						},
						content = {
							"eventstory_wish_06_9"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
					duration = 0.5
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "zhuanchang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "newsNode"),
			args = function (_ctx)
				return {
					city = "eventstory_wish_06_11_1",
					img = "bg_story_scene_1_4.jpg",
					time = "10:29",
					title = "eventstory_wish_06_11_2",
					content = {
						"eventstory_wish_06_10",
						"eventstory_wish_06_11"
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
			action = "hide",
			actor = __getnode__(_root, "newsNode")
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "zhuanchang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_shangquan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bg_mengjing"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bni"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -280,
						refpt = {
							x = 0.7,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xma"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -455,
						refpt = {
							x = 0.3,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = 180,
						refpt = {
							x = 0.9,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "bni_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "bni/face_bni_7.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xma_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xma/face_xma_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ldfu_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "bni/face_bni_rudolph_3.png",
					pathType = "STORY_FACE"
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
					duration = 0.5
				}
			end
		}),
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ldfu"),
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
					name = "MyWish_dialog_speak_name_1",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"bni",
						"ldfu"
					},
					content = {
						"eventstory_wish_06_12"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_9",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xma"
					},
					content = {
						"eventstory_wish_06_13"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_1",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"bni",
						"ldfu"
					},
					content = {
						"eventstory_wish_06_14"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ldfu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_rudolph_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xma_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xma/face_xma_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_9",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xma"
						},
						content = {
							"eventstory_wish_06_15"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ldfu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_rudolph_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_1",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"bni",
							"ldfu"
						},
						content = {
							"eventstory_wish_06_16"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ldfu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_rudolph_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_1",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"bni",
							"ldfu"
						},
						content = {
							"eventstory_wish_06_17"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xma_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xma/face_xma_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_9",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xma"
						},
						content = {
							"eventstory_wish_06_18"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_7.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ldfu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_rudolph_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_1",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"bni",
							"ldfu"
						},
						content = {
							"eventstory_wish_06_19"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "ldfu_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_rudolph_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "show",
				actor = __getnode__(_root, "dialogueChoose"),
				args = function (_ctx)
					return {
						content = {
							"eventstory_wish_06_20"
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "zhuanchang"),
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						brightness = 5,
						modelId = "Model_SNGLSi_Rudolph",
						id = "xiaolu",
						rotationX = 0,
						scale = 0.4,
						zorder = 10001,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 1.07,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xiaolu"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "xiaolu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "xma"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "bni"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xma"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -455,
						refpt = {
							x = 0.7,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "bni"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						x = 0,
						y = -280,
						refpt = {
							x = 0.3,
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
						modelId = "Model_SDTZi",
						id = "SDTZi",
						rotationX = 0,
						scale = 0.75,
						zorder = 100,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.43,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SDTZi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SDTZi/SDTZi_face_2.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "SDTZi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -112,
									y = 1026
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "SDTZi"),
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
				actor = __getnode__(_root, "SDTZi"),
				args = function (_ctx)
					return {
						opacity = 0
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
				action = "play",
				actor = __getnode__(_root, "Mus_pingan"),
				args = function (_ctx)
					return {
						isLoop = true
					}
				end
			}),
			act({
				action = "repeatUpDownStart",
				actor = __getnode__(_root, "xiaolu"),
				args = function (_ctx)
					return {
						height = 45,
						duration = 0.15
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xiaolu"),
				args = function (_ctx)
					return {
						duration = 2.4,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = -0.43,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "zhuanchang"),
				args = function (_ctx)
					return {
						duration = 2.4,
						position = {
							refpt = {
								x = -0.4,
								y = 0.5
							}
						}
					}
				end
			})
		}),
		sleep({
			args = function (_ctx)
				return {
					duration = 2.4
				}
			end
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "xiaolu"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "zhuanchang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SDTZi"),
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
					name = "MyWish_dialog_speak_name_7",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi"
					},
					content = {
						"eventstory_wish_06_21"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "bni_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "bni/face_bni_5.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "xma"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xma_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xma/face_xma_1.png",
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
			actor = __getnode__(_root, "SDTZi"),
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
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "bni"),
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
					name = "MyWish_dialog_speak_name_1",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"bni",
						"ldfu"
					},
					content = {
						"eventstory_wish_06_22"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		act({
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_wish_06_23",
						"eventstory_wish_06_24"
					},
					actionName = {
						"start_eventstory_wish_06_1a",
						"start_eventstory_wish_06_1b"
					}
				}
			end
		})
	})
end

function scene_eventstory_wish_06.actions.start_eventstory_wish_06_1a(_root, args)
	return sequential({
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_5.png",
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SDTZi"),
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
					name = "MyWish_dialog_speak_name_7",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi"
					},
					content = {
						"eventstory_wish_06_25"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_eventstory_wish_06_1end"
				}
			end
		})
	})
end

function scene_eventstory_wish_06.actions.start_eventstory_wish_06_1b(_root, args)
	return sequential({
		concurrent({
			act({
				action = "hide",
				actor = __getnode__(_root, "dialogue")
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_3.png",
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SDTZi"),
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
					name = "MyWish_dialog_speak_name_7",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi"
					},
					content = {
						"eventstory_wish_06_26"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_eventstory_wish_06_1end"
				}
			end
		})
	})
end

function scene_eventstory_wish_06.actions.start_eventstory_wish_06_1end(_root, args)
	return sequential({
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "SDTZi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "bni_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "bni/face_bni_4.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xma_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xma/face_xma_3.png",
					pathType = "STORY_FACE"
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
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SDTZi"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = -0.25,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_5.png",
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_1",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"bni",
						"ldfu"
					},
					content = {
						"eventstory_wish_06_27"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
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
				actor = __getnode__(_root, "SDTZi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SDTZi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.05,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -455,
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
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.6,
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
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xma_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xma/face_xma_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_7",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_wish_06_28"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_4.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xma_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xma/face_xma_6.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -455,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.9,
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
						name = "MyWish_dialog_speak_name_9",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xma"
						},
						content = {
							"eventstory_wish_06_29"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xma_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xma/face_xma_3.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_7",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_wish_06_30"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "SDTZi"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.43,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_7",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_wish_06_31"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_1.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_7",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_wish_06_32"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_7",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_wish_06_33"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -455,
							refpt = {
								x = 0.7,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.35,
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
						name = "MyWish_dialog_speak_name_7",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_wish_06_34"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
			actor = __getnode__(_root, "SDTZi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "bni_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "bni/face_bni_1.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "xma_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "xma/face_xma_4.png",
					pathType = "STORY_FACE"
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
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "xma"),
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
			sequential({
				act({
					action = "moveTo",
					actor = __getnode__(_root, "bni"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -280,
								refpt = {
									x = 0.35,
									y = 0.07
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "bni"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -280,
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
					actor = __getnode__(_root, "bni"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -280,
								refpt = {
									x = 0.35,
									y = 0.07
								}
							}
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "bni"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = -280,
								refpt = {
									x = 0.35,
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
						name = "MyWish_dialog_speak_name_1",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"bni",
							"ldfu"
						},
						content = {
							"eventstory_wish_06_35"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
					name = "MyWish_dialog_speak_name_9",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xma"
					},
					content = {
						"eventstory_wish_06_36"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
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
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_2.png",
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "SDTZi"),
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
					name = "MyWish_dialog_speak_name_7",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi"
					},
					content = {
						"eventstory_wish_06_37"
					},
					durations = {
						0.03
					},
					capInsets = {
						610,
						228,
						1,
						1
					}
				}
			end
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_2.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_7",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_wish_06_38"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
						}
					}
				end
			})
		}),
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_7",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"SDTZi"
						},
						content = {
							"eventstory_wish_06_39"
						},
						durations = {
							0.03
						},
						capInsets = {
							610,
							228,
							1,
							1
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
			actor = __getnode__(_root, "SDTZi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_pingan")
		})
	})
end

local function eventstory_wish_06(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_wish_06",
					scene = scene_eventstory_wish_06
				}
			end
		})
	})
end

stories.eventstory_wish_06 = eventstory_wish_06

return _M
