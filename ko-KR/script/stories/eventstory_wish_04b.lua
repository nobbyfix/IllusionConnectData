local __story_sandbox__ = storysandbox
local scenes = __story_sandbox__.__scenes__
local stories = __story_sandbox__.__stories__
local setmetatable = _G.setmetatable

module("storysandbox.eventstory_wish_04b")
setmetatable(_M, {
	__index = __story_sandbox__
})

local scene_eventstory_wish_04b = {
	actions = {}
}
scenes.scene_eventstory_wish_04b = scene_eventstory_wish_04b

function scene_eventstory_wish_04b:stage(args)
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
						name = "cg_zhandou",
						pathType = "SCENE",
						type = "Image",
						image = "scene_cg_silentnight_2.jpg",
						layoutMode = 1,
						zorder = 58,
						id = "cg_zhandou",
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
				id = "Mus_meihao",
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
				type = "MovieClip",
				zorder = 1350,
				visible = false,
				id = "xiao_gedang",
				scale = 0.3,
				actionName = "beiji_juqingtexiao",
				anchorPoint = {
					x = 0.5,
					y = 0.5
				},
				position = {
					refpt = {
						x = 0.1,
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
			}
		},
		__actions__ = self.actions
	}
end

function scene_eventstory_wish_04b.actions.start_eventstory_wish_04b(_root, args)
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
			actor = __getnode__(_root, "bg_shangquan"),
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
			action = "play",
			actor = __getnode__(_root, "Mus_meihao"),
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
								x = 0.7,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "bni_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/face_bni_5.png",
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
								x = 0.85,
								y = 0
							}
						},
						children = {
							{
								resType = 0,
								name = "ldfu_face",
								pathType = "STORY_FACE",
								type = "Image",
								image = "bni/face_bni_rudolph_3.png",
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
						modelId = "Model_XXFSi",
						id = "xma",
						rotationX = 0,
						scale = 0.7,
						zorder = 100,
						position = {
							x = 0,
							y = -455,
							refpt = {
								x = 0.25,
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
			actor = __getnode__(_root, "cg_zhandou"),
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
				actor = __getnode__(_root, "cg_zhandou"),
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
				actor = __getnode__(_root, "cg_zhandou"),
				args = function (_ctx)
					return {
						duration = 0
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
						id = "mengyan",
						rotationX = 0,
						zorder = 100,
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
		act({
			action = "fadeIn",
			actor = __getnode__(_root, "mengyan"),
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
				action = "rockScreen",
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
							"MyWish_dialog_speak_name_10"
						},
						content = {
							"eventstory_wish_04_17"
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
			action = "fadeOut",
			actor = __getnode__(_root, "mengyan"),
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
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
				action = "speak",
				actor = __getnode__(_root, "dialogue"),
				args = function (_ctx)
					return {
						name = "MyWish_dialog_speak_name_12",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xma"
						},
						content = {
							"eventstory_wish_04_18"
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
			action = "show",
			actor = __getnode__(_root, "dialogueChoose"),
			args = function (_ctx)
				return {
					content = {
						"eventstory_wish_04_19",
						"eventstory_wish_04_20"
					},
					actionName = {
						"start_eventstory_wish_04_2a",
						"start_eventstory_wish_04_2b"
					}
				}
			end
		})
	})
end

function scene_eventstory_wish_04b.actions.start_eventstory_wish_04_2a(_root, args)
	return sequential({
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
							"eventstory_wish_04_21"
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
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_eventstory_wish_04_2end"
				}
			end
		})
	})
end

function scene_eventstory_wish_04b.actions.start_eventstory_wish_04_2b(_root, args)
	return sequential({
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
						freq = 3,
						strength = 1
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
							"eventstory_wish_04_22"
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
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_eventstory_wish_04_2end"
				}
			end
		})
	})
end

function scene_eventstory_wish_04b.actions.start_eventstory_wish_04_2end(_root, args)
	return sequential({
		concurrent({
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
						name = "MyWish_dialog_speak_name_12",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xma"
						},
						content = {
							"eventstory_wish_04_23"
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
					name = "MyWish_dialog_speak_name_12",
					dialogImage = "silentnight_img_jqd.png",
					location = "left",
					pathType = "STORY_ROOT",
					speakings = {
						"xma"
					},
					content = {
						"eventstory_wish_04_24"
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
						image = "bni/face_bni_2.png",
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
							"eventstory_wish_04_25"
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
						name = "MyWish_dialog_speak_name_12",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xma"
						},
						content = {
							"eventstory_wish_04_26"
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
				action = "moveTo",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -455,
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
						name = "MyWish_dialog_speak_name_12",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xma"
						},
						content = {
							"eventstory_wish_04_27"
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
							"eventstory_wish_04_28"
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
				action = "moveTo",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.2,
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
						name = "MyWish_dialog_speak_name_12",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xma"
						},
						content = {
							"eventstory_wish_04_29"
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
						name = "MyWish_dialog_speak_name_12",
						dialogImage = "silentnight_img_jqd.png",
						location = "left",
						pathType = "STORY_ROOT",
						speakings = {
							"xma"
						},
						content = {
							"eventstory_wish_04_30"
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
						"eventstory_wish_04_31"
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
						"eventstory_wish_04_32"
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
						"eventstory_wish_04_33",
						"eventstory_wish_04_34"
					},
					actionName = {
						"start_eventstory_wish_04_3a",
						"start_eventstory_wish_04_3b"
					}
				}
			end
		})
	})
end

function scene_eventstory_wish_04b.actions.start_eventstory_wish_04_3a(_root, args)
	return sequential({
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
							"eventstory_wish_04_35"
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
				actor = __getnode__(_root, "yin_ximaai"),
				args = function (_ctx)
					return {
						time = 1
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
							"eventstory_wish_04_36"
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
							"eventstory_wish_04_37"
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
						image = "xma/face_xma_1.png",
						pathType = "STORY_FACE"
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
							"eventstory_wish_04_38"
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
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_eventstory_wish_04_3end"
				}
			end
		})
	})
end

function scene_eventstory_wish_04b.actions.start_eventstory_wish_04_3b(_root, args)
	return sequential({
		concurrent({
			act({
				action = "changeTexture",
				actor = __getnode__(_root, "xma_face"),
				args = function (_ctx)
					return {
						resType = 0,
						image = "xma/face_xma_5.png",
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
							"eventstory_wish_04_39"
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
							"eventstory_wish_04_40"
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
							"eventstory_wish_04_41"
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
		enterSceneFollowAction({
			args = function (_ctx)
				return {
					name = "start_eventstory_wish_04_3end"
				}
			end
		})
	})
end

function scene_eventstory_wish_04b.actions.start_eventstory_wish_04_3end(_root, args)
	return sequential({
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
							"eventstory_wish_04_42"
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
							"eventstory_wish_04_43"
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
							"eventstory_wish_04_44"
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
							"eventstory_wish_04_45"
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
							"eventstory_wish_04_46"
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
							"eventstory_wish_04_47"
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
				action = "moveTo",
				actor = __getnode__(_root, "xma"),
				args = function (_ctx)
					return {
						duration = 0.2,
						position = {
							x = 0,
							y = -455,
							refpt = {
								x = 0.35,
								y = 0
							}
						}
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
							"eventstory_wish_04_48"
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
			action = "hide",
			actor = __getnode__(_root, "dialogue")
		}),
		act({
			action = "stop",
			actor = __getnode__(_root, "Mus_zhandou")
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
			actor = __getnode__(_root, "ldfu"),
			args = function (_ctx)
				return {
					duration = 0
				}
			end
		})
	})
end

local function eventstory_wish_04b(args)
	return sequential({
		enterScene({
			args = function (_ctx)
				return {
					action = "start_eventstory_wish_04b",
					scene = scene_eventstory_wish_04b
				}
			end
		})
	})
end

stories.eventstory_wish_04b = eventstory_wish_04b

return _M