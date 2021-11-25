local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_wish_08")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_wish_08 = {
	actions = {}
}
scenes.scene_eventstory_wish_08 = scene_eventstory_wish_08

function scene_eventstory_wish_08:stage(args)
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
						name = "bg_shengdan",
						pathType = "SCENE",
						type = "Image",
						image = "scene_main_silentnight.jpg",
						layoutMode = 1,
						zorder = 85,
						id = "bg_shengdan",
						scale = 1.3,
						anchorPoint = {
							x = 0.5,
							y = 0
						},
						position = {
							refpt = {
								x = 0.5,
								y = 0
							}
						},
						children = {
							{
								layoutMode = 1,
								type = "MovieClip",
								zorder = 10,
								visible = true,
								id = "bgEx_shengdan",
								scale = 1,
								actionName = "bg_shengdanpinganyechangjing",
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
						name = "bg_fangjian",
						pathType = "SCENE",
						type = "Image",
						image = "scene_block_silentnight_2.jpg",
						layoutMode = 1,
						zorder = 100,
						id = "bg_fangjian",
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
						name = "cg_buou",
						pathType = "SCENE",
						type = "Image",
						image = "scene_cg_silentnight_1.jpg",
						layoutMode = 1,
						zorder = 195,
						id = "cg_buou",
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
						name = "cg_room",
						pathType = "SCENE",
						type = "Image",
						image = "scene_story_silentnight_1.jpg",
						layoutMode = 1,
						zorder = 180,
						id = "cg_room",
						scale = 0.5,
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
				zorder = 9999990,
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
				resType = 0,
				name = "shouchang",
				pathType = "STORY_ROOT",
				type = "Image",
				image = "story_eye_4.png",
				layoutMode = 1,
				zorder = 999999,
				id = "shouchang",
				scale = 20,
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
				id = "Mus_xinnian",
				fileName = "Mus_Story_Christmas",
				type = "Music"
			},
			{
				id = "Mus_pingan",
				fileName = "Mus_Story_SilentNight",
				type = "Music"
			},
			{
				id = "Mus_zhandou",
				fileName = "Mus_Battle_ChristmasNewYear",
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
				id = "yin_ninatongyi",
				fileName = "Voice_Story_CLMan_03",
				type = "Sound"
			},
			{
				id = "yin_zaluo",
				fileName = "Se_Story_Hit_Anna",
				type = "Sound"
			},
			{
				id = "yin_jianguang",
				fileName = "Se_Story_Impact_2",
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
				id = "yin_ninatao",
				fileName = "Se_Story_SilentNight_Running",
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
				zorder = 999,
				visible = false,
				id = "xiao_zatou",
				scale = 0.7,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.5,
						y = 0.7
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_guangmang1",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.6,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_guangmang2",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.55,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 9999,
				visible = false,
				id = "xiao_guangmang3",
				scale = 2.5,
				actionName = "lizi_bumengguanjizhitexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.65,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 10000,
				visible = false,
				id = "xiao_huiyi",
				scale = 0.85,
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
				type = "MovieClip",
				zorder = 100000000,
				visible = false,
				id = "xiao_jian1",
				scale = 1,
				actionName = "liqi_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.38,
						y = 0.6
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100,
				visible = false,
				id = "xiao_wanou1",
				scale = 0.9,
				actionName = "xunlu_tianjiangxunlu",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.3,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100000,
				visible = false,
				id = "xiao_wanou2",
				scale = 1.1,
				actionName = "xunlu_tianjiangxunlu",
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
				zorder = 100,
				visible = false,
				id = "xiao_wanou3",
				scale = 0.9,
				actionName = "xunlu_tianjiangxunlu",
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
				zorder = 12000000,
				visible = false,
				id = "xiao_jian2",
				scale = 1.5,
				actionName = "liqi_juqingtexiao",
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
				zorder = 100,
				visible = false,
				id = "xiao_xingguang1",
				scale = 0.4,
				actionName = "shiguang_juqingshiguang",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.65,
						y = 0.5
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100,
				visible = false,
				id = "xiao_xingguang2",
				scale = 0.35,
				actionName = "shiguang_juqingshiguang",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.25,
						y = 0.65
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100,
				visible = false,
				id = "xiao_xingguang3",
				scale = 0.35,
				actionName = "shiguang_juqingshiguang",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.75,
						y = 0.8
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100,
				visible = false,
				id = "xiao_xingguang4",
				scale = 0.1,
				actionName = "shiguang_juqingshiguang",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.75,
						y = 0.8
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100,
				visible = false,
				id = "xiao_xingguang5",
				scale = 0.1,
				actionName = "shiguang_juqingshiguang",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.75,
						y = 0.8
					}
				}
			},
			{
				layoutMode = 1,
				type = "MovieClip",
				zorder = 100,
				visible = false,
				id = "xiao_xingguang6",
				scale = 0.1,
				actionName = "shiguang_juqingshiguang",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.75,
						y = 0.8
					}
				}
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_wish_08.actions.start_eventstory_wish_08(_root, args)
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
			actor = __getnode__(_root, "bg_fangjian"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "Mus_xinnian"),
			args = function (_ctx)
				return {
					isLoop = true
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
			action = "show",
			actor = __getnode__(_root, "printerEffect"),
			args = function (_ctx)
				return {
					bgImage = "gallery_album_01.jpg",
					printAudioOff = true,
					bgShow = false,
					center = 1,
					content = {
						"eventstory_wish_08_1"
					},
					durations = {
						0.12
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
			action = "play",
			actor = __getnode__(_root, "xiao_huiyi"),
			args = function (_ctx)
				return {
					time = -1
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing6",
						id = "haizi1",
						rotationX = 0,
						scale = 0.75,
						zorder = 100,
						position = {
							x = 0,
							y = -210,
							refpt = {
								x = 0.25,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "haizi1"),
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
						zorder = 300,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.6,
								y = 0.5
							}
						},
						children = {
							{
								resType = 0,
								name = "ldfu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/face_bni_rudolph_4.png",
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
						zorder = 250,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.8,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "bni_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/bni_face_5.png",
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
			action = "fadeIn",
			actor = __getnode__(_root, "haizi1"),
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
						"eventstory_wish_08_7"
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
					name = "MyWish_dialog_speak_name_2",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"haizi1"
					},
					content = {
						"eventstory_wish_08_8"
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
					name = "MyWish_dialog_speak_name_2",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"haizi1"
					},
					content = {
						"eventstory_wish_08_9"
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
						image = "bni/face_bni_3.png",
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
							"eventstory_wish_08_10"
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
					name = "MyWish_dialog_speak_name_2",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"haizi1"
					},
					content = {
						"eventstory_wish_08_11"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		sequential({
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
				action = "moveTo",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						duration = 0.1,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.6,
								y = -0.1
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
						duration = 0.05,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.6,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "ldfu"),
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
						name = "MyWish_dialog_speak_name_1",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"bni",
							"ldfu"
						},
						content = {
							"eventstory_wish_08_12"
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
						image = "bni/face_bni_1.png",
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
							"eventstory_wish_08_13"
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
				action = "play",
				actor = __getnode__(_root, "yin_ludaofuxingfen"),
				args = function (_ctx)
					return {
						time = 1
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ldfu_face"),
				args = function (_ctx)
					return {
						visible = false
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						freq = 2,
						strength = 0.8
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						freq = 2,
						strength = 0.8
					}
				end
			}),
			act({
				action = "rock",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						freq = 2,
						strength = 0.8
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_guangmang1"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_guangmang2"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_guangmang3"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_2",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"haizi1"
						},
						content = {
							"eventstory_wish_08_14"
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
				action = "brightnessTo",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						brightness = 255,
						duration = 0.4
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						scale = 0.7,
						duration = 0.4
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
								x = 0.6,
								y = -0.15
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
		act({
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_ludaofuxingfen")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_guangmang1")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_guangmang2")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_guangmang3")
		}),
		act({
			action = "updateNode",
			actor = __getnode__(_root, "ldfu_face"),
			args = function (_ctx)
				return {
					visible = true
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					scale = 0.4,
					duration = 0
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
							x = 0.6,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "brightnessTo",
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					brightness = 0,
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
							"eventstory_wish_08_15"
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
					name = "MyWish_dialog_speak_name_2",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"haizi1"
					},
					content = {
						"eventstory_wish_08_16"
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
							"eventstory_wish_08_17"
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
			action = "rotataBy",
			actor = __getnode__(_root, "xiao_jian2"),
			args = function (_ctx)
				return {
					deltaAngleZ = 100,
					duration = 0
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "xiao_jian2"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 180
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
					duration = 0.8
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_JYing5",
						id = "haizi2",
						rotationX = 0,
						scale = 0.75,
						zorder = 100,
						position = {
							x = 0,
							y = -170,
							refpt = {
								x = 0.7,
								y = 0
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "haizi2"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "haizi2"),
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_3",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"haizi2"
					},
					content = {
						"eventstory_wish_08_18"
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
					name = "MyWish_dialog_speak_name_2",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"haizi1"
					},
					content = {
						"eventstory_wish_08_19"
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
			action = "fadeOut",
			actor = __getnode__(_root, "haizi2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "haizi1"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_huiyi")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_huiyi")
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_fangjian"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "bg_shengdan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "play",
			actor = __getnode__(_root, "bgEx_shengdan"),
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
		sequential({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_jianguang"),
				args = function (_ctx)
					return {
						time = 2
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_jian1"),
				args = function (_ctx)
					return {
						time = 1
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
				actor = __getnode__(_root, "xiao_jian2"),
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
					duration = 0.5
				}
			end
		}),
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_FTLEShi",
						id = "FTLEShi",
						rotationX = 0,
						scale = 0.6,
						zorder = 150,
						position = {
							x = 0,
							y = -280,
							refpt = {
								x = 0.3,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "FTLEShi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "FTLEShi/FTLEShi_face_3.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "FTLEShi_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -41.5,
									y = 1286.1
								}
							}
						}
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "FTLEShi"),
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
				actor = __getnode__(_root, "FTLEShi"),
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
						modelId = "Model_Story_CLMan",
						id = "CLMan",
						rotationX = 0,
						scale = 0.63,
						zorder = 250,
						position = {
							x = 0,
							y = -250,
							refpt = {
								x = 0.47,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "CLMan_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "CLMan/CLMan_face_4.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "CLMan_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 77.5,
									y = 1045.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "CLMan"),
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
						modelId = "Model_Story_ZTXChang",
						id = "ZTXChang",
						rotationX = 0,
						scale = 0.6,
						zorder = 200,
						position = {
							x = 0,
							y = -270,
							refpt = {
								x = 0.72,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ZTXChang_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ZTXChang/ZTXChang_face_1.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ZTXChang_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = -51.3,
									y = 977.5
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ZTXChang"),
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
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
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
			})
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "zhuanchang"),
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
			actor = __getnode__(_root, "xiao_jian2")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_jian1")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "yin_jianguang")
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_4",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_wish_08_20"
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
				actor = __getnode__(_root, "ZTXChang_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXChang/ZTXChang_face_9.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_5",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"eventstory_wish_08_21"
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_SNGLSi_Rudolph",
						id = "wanou",
						rotationX = 0,
						scale = 0.4,
						zorder = 100000,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.5,
								y = 0.72
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "wanou"),
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
						modelId = "Model_SDTZi",
						id = "SDTZi",
						rotationX = 0,
						scale = 0.75,
						zorder = 200,
						position = {
							x = 0,
							y = -330,
							refpt = {
								x = 0.13,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "SDTZi_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "SDTZi/SDTZi_face_1.png",
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
		concurrent({
			act({
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_FLBDSi",
						id = "ahui",
						rotationX = 0,
						scale = 0.75,
						zorder = 300,
						position = {
							x = 0,
							y = -300,
							refpt = {
								x = 0.76,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ahui_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "ahui/face_ahui_5.png",
								scaleX = 1,
								scaleY = 1,
								layoutMode = 1,
								zorder = 1100,
								visible = true,
								id = "ahui_face",
								anchorPoint = {
									x = 0.5,
									y = 0.5
								},
								position = {
									x = 49,
									y = 921
								}
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
		concurrent({
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan"),
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
		concurrent({
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ahui"),
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
					name = "MyWish_dialog_speak_name_6",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ahui"
					},
					content = {
						"eventstory_wish_08_22"
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
					name = "MyWish_dialog_speak_name_7",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"SDTZi"
					},
					content = {
						"eventstory_wish_08_23"
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
				actor = __getnode__(_root, "ahui"),
				args = function (_ctx)
					return {
						duration = 0
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
				action = "changeTexture",
				actor = __getnode__(_root, "ZTXChang_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXChang/ZTXChang_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "FTLEShi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "FTLEShi/FTLEShi_face_1.png",
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
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang"),
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
		sequential({
			sequential({
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "wanou"),
					args = function (_ctx)
						return {
							duration = 0
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "wanou"),
					args = function (_ctx)
						return {
							duration = 0.1,
							position = {
								x = 0,
								y = 180,
								refpt = {
									x = 0.5,
									y = 0.37
								}
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_zatou"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "changeTexture",
					actor = __getnode__(_root, "CLMan_face"),
					args = function (_ctx)
						return {
							resType = 0,
							image = "CLMan/CLMan_face_5.png",
							pathType = "STORY_FACE"
						}
					end
				}),
				concurrent({
					act({
						action = "moveTo",
						actor = __getnode__(_root, "wanou"),
						args = function (_ctx)
							return {
								duration = 0.4,
								position = {
									x = 0,
									y = 180,
									refpt = {
										x = 0.55,
										y = 0.47
									}
								}
							}
						end
					}),
					act({
						action = "scaleTo",
						actor = __getnode__(_root, "wanou"),
						args = function (_ctx)
							return {
								scale = 0.45,
								duration = 0.4
							}
						end
					}),
					act({
						action = "fadeOut",
						actor = __getnode__(_root, "wanou"),
						args = function (_ctx)
							return {
								duration = 0.8
							}
						end
					})
				})
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_08_24"
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
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_08_25"
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "orbitCamera",
				actor = __getnode__(_root, "bni"),
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
				actor = __getnode__(_root, "bni"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = -280,
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
				actor = __getnode__(_root, "ldfu"),
				args = function (_ctx)
					return {
						duration = 0,
						position = {
							x = 0,
							y = 180,
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
		concurrent({
			act({
				action = "play",
				actor = __getnode__(_root, "yin_ludaofujingxia"),
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
							"eventstory_wish_08_26"
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
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_7.png",
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
				action = "changeTexture",
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_7.png",
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
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi"),
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
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_08_27"
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
				actor = __getnode__(_root, "ZTXChang_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "ZTXChang/ZTXChang_face_5.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_5",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"ZTXChang"
						},
						content = {
							"eventstory_wish_08_28"
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
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi"),
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
			action = "moveTo",
			actor = __getnode__(_root, "bg_shengdan"),
			args = function (_ctx)
				return {
					duration = 1,
					position = {
						refpt = {
							x = 0.5,
							y = -0.1
						}
					}
				}
			end
		}),
		concurrent({
			act({
				action = "moveTo",
				actor = __getnode__(_root, "bg_shengdan"),
				args = function (_ctx)
					return {
						duration = 2,
						position = {
							refpt = {
								x = 0.5,
								y = -0.3
							}
						}
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_wanou1"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_wanou2"),
				args = function (_ctx)
					return {
						time = -1
					}
				end
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_wanou3"),
				args = function (_ctx)
					return {
						time = -1
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
			}),
			act({
				action = "play",
				actor = __getnode__(_root, "Mus_pingan"),
				args = function (_ctx)
					return {
						isLoop = true
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
			action = "moveTo",
			actor = __getnode__(_root, "bg_shengdan"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.5,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "bg_shengdan"),
			args = function (_ctx)
				return {
					scale = 1,
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "CLMan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "FTLEShi"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "ZTXChang"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "CLMan_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "CLMan/CLMan_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_2.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi/FTLEShi_face_13.png",
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_4",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"FTLEShi"
					},
					content = {
						"eventstory_wish_08_29"
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
					name = "MyWish_dialog_speak_name_8",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"CLMan"
					},
					content = {
						"eventstory_wish_08_30"
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
						"eventstory_wish_08_31"
					}
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_5",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"ZTXChang"
					},
					content = {
						"eventstory_wish_08_32"
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang"),
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
							"eventstory_wish_08_33"
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
			action = "changeTexture",
			actor = __getnode__(_root, "ZTXChang_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "ZTXChang/ZTXChang_face_12.png",
					pathType = "STORY_FACE"
				}
			end
		}),
		act({
			action = "changeTexture",
			actor = __getnode__(_root, "FTLEShi_face"),
			args = function (_ctx)
				return {
					resType = 0,
					image = "FTLEShi/FTLEShi_face_2.png",
					pathType = "STORY_FACE"
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0.2
					}
				end
			}),
			act({
				action = "fadeIn",
				actor = __getnode__(_root, "ZTXChang"),
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
				actor = __getnode__(_root, "CLMan_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "CLMan/CLMan_face_13.png",
						pathType = "STORY_FACE"
					}
				end
			}),
			act({
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_8",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"CLMan"
						},
						content = {
							"eventstory_wish_08_34"
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
				actor = __getnode__(_root, "CLMan"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "ZTXChang"),
				args = function (_ctx)
					return {
						duration = 0
					}
				end
			}),
			act({
				action = "fadeOut",
				actor = __getnode__(_root, "FTLEShi"),
				args = function (_ctx)
					return {
						duration = 0
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
				actor = __getnode__(_root, "bni"),
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
							"eventstory_wish_08_35"
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
				action = "changeTexture",
				actor = __getnode__(_root, "SDTZi_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "SDTZi/SDTZi_face_1.png",
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
						"eventstory_wish_08_36"
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
				action = "addPortrait",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						modelId = "Model_Story_SNGLSi_Elk2",
						id = "xiaolu2",
						rotationX = 0,
						scale = 0.3,
						zorder = 9000,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.75,
								y = 0.15
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xiaolu2"),
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
						id = "xiaolu3",
						rotationX = 0,
						scale = 0.3,
						zorder = 9000,
						position = {
							x = 0,
							y = 180,
							refpt = {
								x = 0.2,
								y = 0.2
							}
						}
					}
				end
			}),
			act({
				action = "updateNode",
				actor = __getnode__(_root, "xiaolu3"),
				args = function (_ctx)
					return {
						opacity = 0
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
		sleep({
			args = function (_ctx)
				return {
					duration = 0.3
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
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_wanou1")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_wanou2")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_wanou3")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_wanou1")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_wanou2")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "xiao_wanou3")
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
							"eventstory_wish_08_37"
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
		sequential({
			sequential({
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
					action = "play",
					actor = __getnode__(_root, "xiao_xingguang1"),
					args = function (_ctx)
						return {
							time = -1
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
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_xingguang2"),
					args = function (_ctx)
						return {
							time = -1
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "xiaolu2"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_xingguang3"),
					args = function (_ctx)
						return {
							time = -1
						}
					end
				}),
				act({
					action = "fadeIn",
					actor = __getnode__(_root, "xiaolu3"),
					args = function (_ctx)
						return {
							duration = 0.2
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_xingguang1"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								refpt = {
									x = 0.3,
									y = 0.7
								}
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_xingguang1"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_xingguang2"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								refpt = {
									x = 0.8,
									y = 0.5
								}
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_xingguang2"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "xiao_xingguang3"),
					args = function (_ctx)
						return {
							duration = 0,
							position = {
								refpt = {
									x = 0.1,
									y = 0.8
								}
							}
						}
					end
				}),
				act({
					action = "play",
					actor = __getnode__(_root, "xiao_xingguang3"),
					args = function (_ctx)
						return {
							time = 1
						}
					end
				})
			}),
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "bni_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "bni/face_bni_2.png",
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
							"eventstory_wish_08_38"
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
							"eventstory_wish_08_39"
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
			action = "fadeOut",
			actor = __getnode__(_root, "bni"),
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
			actor = __getnode__(_root, "xiaolu2"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeOut",
			actor = __getnode__(_root, "xiaolu3"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_xingguang1")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_xingguang2")
		}),
		act({
			action = "hide",
			actor = __getnode__(_root, "xiao_xingguang3")
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg_buou"),
			args = function (_ctx)
				return {
					duration = 0
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
			action = "fadeOut",
			actor = __getnode__(_root, "ldfu"),
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
					name = "MyWish_dialog_speak_name_1",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"eventstory_wish_08_62"
					},
					content = {
						"eventstory_wish_08_40"
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
				actor = __getnode__(_root, "zhuanchang"),
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
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_7",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_41"
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
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_42"
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
					name = "MyWish_dialog_speak_name_6",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_43"
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
					name = "MyWish_dialog_speak_name_6",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_44"
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
					name = "MyWish_dialog_speak_name_8",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_45"
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
					name = "MyWish_dialog_speak_name_5",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_46"
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
					name = "MyWish_dialog_speak_name_6",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_47"
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
						"eventstory_wish_08_48"
					}
				}
			end
		}),
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_4",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_49"
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
		act({
			action = "speak",
			actor = __getnode__(_root, "dialogue"),
			args = function (_ctx)
				return {
					name = "MyWish_dialog_speak_name_5",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_50"
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
			actor = __getnode__(_root, "cg_buou"),
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
					duration = 0,
					position = {
						x = 0,
						y = -330,
						refpt = {
							x = 0.87,
							y = 0
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
					deltaAngleZ = 0
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
								x = 0.2,
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
				action = "orbitCamera",
				actor = __getnode__(_root, "xma"),
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
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						opacity = 0
					}
				end
			})
		}),
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
			actor = __getnode__(_root, "SDTZi"),
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
						"eventstory_wish_08_51"
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
							"eventstory_wish_08_52"
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
						"eventstory_wish_08_53"
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
			action = "moveTo",
			actor = __getnode__(_root, "bni"),
			args = function (_ctx)
				return {
					duration = 0.2,
					position = {
						x = 0,
						y = -280,
						refpt = {
							x = 1,
							y = 0
						}
					}
				}
			end
		}),
		act({
			action = "orbitCamera",
			actor = __getnode__(_root, "bni"),
			args = function (_ctx)
				return {
					angleZ = 0,
					time = 0,
					deltaAngleZ = 0
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
							"eventstory_wish_08_54"
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
				actor = __getnode__(_root, "xma_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xma/face_xma_2.png",
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
							"eventstory_wish_08_55"
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
				actor = __getnode__(_root, "SDTZi"),
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
						duration = 0.1
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
								x = 0.8,
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
						name = "MyWish_dialog_speak_name_1",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"bni",
							"ldfu"
						},
						content = {
							"eventstory_wish_08_56"
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
							"eventstory_wish_08_57"
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
						image = "xma/face_xma_4.png",
						pathType = "STORY_FACE"
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
								x = 0.48,
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
						name = "MyWish_dialog_speak_name_1",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"bni",
							"ldfu"
						},
						content = {
							"eventstory_wish_08_58"
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
			action = "fadeOut",
			actor = __getnode__(_root, "bg_shengdan"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "cg_room"),
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
						"eventstory_wish_08_59",
						"eventstory_wish_08_60",
						"eventstory_wish_08_61"
					},
					durations = {
						0.08,
						0.08,
						0.08
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
					name = "MyWish_dialog_speak_name_10",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_63"
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
		sequential({
			concurrent({
				act({
					action = "scaleTo",
					actor = __getnode__(_root, "cg_room"),
					args = function (_ctx)
						return {
							scale = 1,
							duration = 1.2
						}
					end
				}),
				act({
					action = "moveTo",
					actor = __getnode__(_root, "cg_room"),
					args = function (_ctx)
						return {
							duration = 1.2,
							position = {
								refpt = {
									x = 0.3,
									y = 0.4
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
						name = "MyWish_dialog_speak_name_10",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"MyWish_dialog_speak_name_10"
						},
						content = {
							"eventstory_wish_08_64"
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
			action = "scaleTo",
			actor = __getnode__(_root, "xiao_xingguang1"),
			args = function (_ctx)
				return {
					scale = 0.1,
					duration = 0
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "xiao_xingguang2"),
			args = function (_ctx)
				return {
					scale = 0.1,
					duration = 0
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "xiao_xingguang3"),
			args = function (_ctx)
				return {
					scale = 0.1,
					duration = 0
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "xiao_xingguang4"),
			args = function (_ctx)
				return {
					scale = 0.1,
					duration = 0
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "xiao_xingguang5"),
			args = function (_ctx)
				return {
					scale = 0.1,
					duration = 0
				}
			end
		}),
		act({
			action = "scaleTo",
			actor = __getnode__(_root, "xiao_xingguang6"),
			args = function (_ctx)
				return {
					scale = 0.1,
					duration = 0
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_xingguang1"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.413,
							y = 0.887
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_xingguang2"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.413,
							y = 0.527
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_xingguang3"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.326,
							y = 0.607
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_xingguang4"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.326,
							y = 0.807
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_xingguang5"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.5,
							y = 0.607
						}
					}
				}
			end
		}),
		act({
			action = "moveTo",
			actor = __getnode__(_root, "xiao_xingguang6"),
			args = function (_ctx)
				return {
					duration = 0,
					position = {
						refpt = {
							x = 0.5,
							y = 0.807
						}
					}
				}
			end
		}),
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "shouchang"),
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
					name = "MyWish_dialog_speak_name_10",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"MyWish_dialog_speak_name_10"
					},
					content = {
						"eventstory_wish_08_65"
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
				action = "scaleTo",
				actor = __getnode__(_root, "shouchang"),
				args = function (_ctx)
					return {
						scale = 3.5,
						duration = 1.5
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "shouchang"),
				args = function (_ctx)
					return {
						duration = 1.5,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.413,
								y = 0.707
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
		sequential({
			act({
				action = "play",
				actor = __getnode__(_root, "xiao_xingguang1"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_xingguang4"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_xingguang6"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_xingguang5"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_xingguang3"),
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
				action = "play",
				actor = __getnode__(_root, "xiao_xingguang2"),
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
				action = "fadeIn",
				actor = __getnode__(_root, "curtain"),
				args = function (_ctx)
					return {
						duration = 1
					}
				end
			}),
			act({
				action = "scaleTo",
				actor = __getnode__(_root, "shouchang"),
				args = function (_ctx)
					return {
						scale = 0.5,
						duration = 1.6
					}
				end
			}),
			act({
				action = "moveTo",
				actor = __getnode__(_root, "shouchang"),
				args = function (_ctx)
					return {
						duration = 1.6,
						position = {
							x = 0,
							y = 0,
							refpt = {
								x = 0.43,
								y = 0.707
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
			action = "stop",
			actor = __getnode__(_root, "Mus_pingan")
		})
	})
end

local function eventstory_wish_08(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_wish_08",
					scene = scene_eventstory_wish_08
				}
			end
		})
	})
end

stories.eventstory_wish_08 = eventstory_wish_08

return _M
